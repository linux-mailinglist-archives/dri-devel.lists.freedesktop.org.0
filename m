Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3846BC2F1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 01:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E5410EA45;
	Thu, 16 Mar 2023 00:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801410EA45
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 00:44:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x17so313508lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 17:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678927476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdHTO7r/qWwc37NG0KfD//nV1f0Fmimh5IOse5pWXK4=;
 b=anqrjvcHRO2REMCEyQGrabPAJZqSVGYWfgKG1db9qduO6iQ7lLe/059twBJhcgOZZS
 3UZIbz5/EQDTu43xcmjd16na1X3x2YC5rcTK3vsPlLzn08yLGf2/wfFpcmS9XnCVBrIu
 WmWVblowCFMCx1lH943DX/6qJilgY0yhqMYLkK++Fb1b7oYIRBFE7+EAXLAini9MdkSE
 PCnIJ7Ruh3eNy1lDQnZfo9RH7+AmqVEfQQ6qcuV81uD6ONFd90uFD650t+jPEN8l59gk
 fH8v/W9gkxPTzhwRaZknBKuytJB4G4UtDom2E7hSgF8QIwc3XRTE3Zu4HMnrh1ujlHfQ
 ZnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678927476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdHTO7r/qWwc37NG0KfD//nV1f0Fmimh5IOse5pWXK4=;
 b=yoO/9X+dj8cjokVTTTMe1Qfx6nKd7XAym1e30MWSKyOHcOxNs/dQv9AeWd9wQlVoWm
 qL9R0rTi+VwLg1lrWMWoHbWKz7rftgKsfL7V2KwyKFRD8oWrZ8wcDneWxhTnfx0H0c1p
 2ePrawBCF4EQ7IVwlBeQChoi5BrtXxzNdnB0BzJ6A8OfFE7AqFplv0AtuL55iPh7HDpo
 WCJmvvr3hzACD54QzKQTVIV91xP7gkArhI8t4QVoUpTIcytKk/AxG26ptso7bCzqG9IA
 AwVDYruXvvQ+1da++F/AwiowoIgmvhT+9AZ2fIaPs9MEoGAu3JI4LXfdkIHy99iwlWq/
 W5ZA==
X-Gm-Message-State: AO0yUKUC9Xl5jKqKdWoM9672dnAhmYM8ezkKgYKCTK9btaxAAX7r0dB3
 XAUi5ycSMp+4TZhqTF/lk8fyAcPGPFl7jtw69cc=
X-Google-Smtp-Source: AK7set+zuznVSzozkhNOwTFpILN2nC7k2EOJ81hKG8EJr1QUVhV300YfCExMPAk3hSCFdXwgZtcG0g==
X-Received: by 2002:ac2:597c:0:b0:4a4:68b9:19da with SMTP id
 h28-20020ac2597c000000b004a468b919damr2488893lfp.2.1678927475910; 
 Wed, 15 Mar 2023 17:44:35 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q19-20020ac25293000000b004dc4b00a1f3sm1001254lfm.253.2023.03.15.17.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 17:44:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: [PATCH v14 00/14] Add PSR support for eDP
Date: Thu, 16 Mar 2023 02:44:34 +0200
Message-Id: <167892745598.2525998.13449367044508002295.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 02 Mar 2023 22:03:03 +0530, Vinod Polimera wrote:
> Changes in v2:
>   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
>   - Don't modify whitespaces.
>   - Set self refresh aware from atomic_check.
>   - Set self refresh aware only if psr is supported.
>   - Provide a stub for msm_dp_display_set_psr.
>   - Move dp functions to bridge code.
> 
> [...]

Applied, thanks!

[01/14] drm: add helper functions to retrieve old and new crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ef708af6054c
[02/14] drm/bridge: use atomic enable/disable callbacks for panel bridge
        https://gitlab.freedesktop.org/lumag/msm/-/commit/49291dbf1cd8
[03/14] drm/bridge: add psr support for panel bridge callbacks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/26966d5bc7dd
[04/14] drm/msm/disp/dpu: check for crtc enable rather than crtc active to release shared resources
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c235a0d4a185
[05/14] drm/msm/disp/dpu: get timing engine status from intf status register
        https://gitlab.freedesktop.org/lumag/msm/-/commit/15b04e280119
[06/14] drm/msm/disp/dpu: wait for extra vsync till timing engine status is disabled
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b2afc29853c3
[07/14] drm/msm/disp/dpu: reset the datapath after timing engine disable
        https://gitlab.freedesktop.org/lumag/msm/-/commit/392a21678a7f
[08/14] drm/msm/dp: use atomic callbacks for DP bridge ops
        https://gitlab.freedesktop.org/lumag/msm/-/commit/20536d1c512b
[09/14] drm/msm/dp: Add basic PSR support for eDP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0b993bbfe9e
[10/14] drm/msm/dp: use the eDP bridge ops to validate eDP modes
        https://gitlab.freedesktop.org/lumag/msm/-/commit/de9512e23adc
[11/14] drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f62087459d8a
[12/14] drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1bd583580cba
[13/14] drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable during self refresh
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0f2a8f000c21
[14/14] drm/msm/dp: set self refresh aware based on PSR support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0c3f3cfd8ef2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
