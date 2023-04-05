Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869116D7B81
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E2310E8F1;
	Wed,  5 Apr 2023 11:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532310E8F2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:38:33 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e9so21695338ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680694711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=378I/gGZlt8XUX5v0VEtIxxbJng/T1aUDlAEzlMMcMo=;
 b=K+TH1p9OQZgmI9dQubTs+egT3pRWY+Lpl3EeU1AX7BLJkeIuKwuvuMT2EgjyLdn46r
 MTssKlRaFBhVvVhW830j/MP4QWs6SiY3mSu+FXq+KA2OXXTdmCE6cIeoFAHmqqgYHOVq
 Kh+dVIMN2QEmtWiZtqRe17Qr1sjWCyUCsK8n7PusEQ5iBOo35a9SSA76SXWsz9lgopJg
 M0J6UrwhPs0bm+hMRezXpugxb4c0IcaODV49ZUde3/Ay11jybapgYXfIJo1ceLLLyN5m
 XbIYWIMhFOKkUroEcaSMRAj+rxcBwPnypjslHTR/V6x9nA0E//q00u+FAemPppbXDzLb
 rC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=378I/gGZlt8XUX5v0VEtIxxbJng/T1aUDlAEzlMMcMo=;
 b=JAUQsF2r2Q29OI4SzyJTzrj2xubWKSuQv8vPmOvxorXjVY/6l+aDlW4EK8OBEnF9v+
 NI7ou61mBLoCsGzcx4KGbCalvdxdNlXWtZc76iUpK8FRUQ1+eTy3k+9BxAl2zs0Dhvvh
 ryIhsqWh3dIx/dsbbjNGeO5nxR5knaF36rvi9sRoxi0PoXhnfvUFw+Q+3SKSTFMBseQl
 385oOFnOt2eulUXGbdHMli+gAorz3WXFpSl5EANoP3gypQQHsjU4sYwcl1Urze5iGWLD
 g7h9x9kFOGO6QJDIP7bF8uPf36k7x5xswVoJKJt78iaF8PZImKCVAGwyJ9h1izt7mJwY
 gexA==
X-Gm-Message-State: AAQBX9fFyxTAWRLMKCOOEq/kCTg0xI61HXOL/+2Zy0AVCwz+OmtQGMh5
 zNTHPJfdtxlsOXbOX+XcRXtbK0DDaV/s3ozk5tjE9g==
X-Google-Smtp-Source: AKy350aShuFWZOnsO9uiMPtmd4KhuD0q/HPao2SXlOdTQ2JBpssmhXtALI05z1DLB358PL1P//dxeg==
X-Received: by 2002:a2e:3812:0:b0:29c:d6f6:8c4 with SMTP id
 f18-20020a2e3812000000b0029cd6f608c4mr1680050lja.16.1680694710858; 
 Wed, 05 Apr 2023 04:38:30 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 l15-20020a2e700f000000b002a2d7a460f2sm2806492ljc.116.2023.04.05.04.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:38:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: [PATCH v1 0/3] Fixes for PSR
Date: Wed,  5 Apr 2023 14:38:29 +0300
Message-Id: <168069464072.1851814.16480389656681286482.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
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


On Fri, 31 Mar 2023 19:28:31 +0530, Vinod Polimera wrote:
> while in virtual terminal with PSR enabled, there will be
> no atomic commits triggered resulting in no screen update.
> Update the dirtyfb flag into plane state during atomic check
> to flush the pixel data explicitly.
> 
> Avoid scheduling PSR commits from different work queues while
> running in PSR mode already.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: set dirty_fb flag while in self refresh mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ddf5387d1fb7
[2/3] msm/disp/dpu: allow atomic_check in PSR usecase
      https://gitlab.freedesktop.org/lumag/msm/-/commit/86c56ba51aec

Note, patch 3, which solves a different issue (and which requires additional changes) was not applied.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
