Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F897663B04
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4D010E55B;
	Tue, 10 Jan 2023 08:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E022A10E0CF;
 Mon,  9 Jan 2023 23:16:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu8so15526854lfb.4;
 Mon, 09 Jan 2023 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=pZNIgPrqwP6vOIoXVyulw/nqaeul0R0XTQB95YxSJ9Stjz/bLmk6jl30L3/bWIsL+L
 IA5SImpUOSxXSedgDlgjGsMtJVNAXVDl+SnyE33YWKe9in55w7A6NojBMlhlswnYxM1c
 3z7N71B4UTcrbgInI1hfDz4IXxiJa+1NJxf+buyjVGqwSI4hnUkDNF9LMRakUrXgg9zF
 F01H0sFlD5gT5lNRe4SFDJCAHOL7E15t1NkVy8uSUmE2cLkTiWVsLcUInypZQsGENu/y
 PmZ5cyxKAnkZlJdS07DkNjP9akjznesMKbcHqtGVo2I35lu/C1cVaqh8RsO9SY/RMEO0
 iBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=CpKoPEAfhpqZYd5rXlaes9Y5dXeMJpN6D+gLwXWDWOgrOzpzrgkeFWlyWaycGrF1wN
 WRF9jKIAsgAIuLR+cIq+cPyqQ/rN1Jw/R86gJqSNhxb5vhE+lcgTKox6gxhoJYm6RADr
 NOlVMaFUWHC1cp4zrEWmsNUpmE453mC1Ow7gH2LhKrSECHHWl+LL8zV3OzvnZRHwdsTV
 CtQBn4QzH9ZWaLzcLBOqUdPRCPFGXT6EkeGsXiFgdhGHWFLztBEI56q97BRNWD4me4ks
 rT6tMTawoG4BTNQO+IJ48NYMesQ4xB6ijqDqXTvCgSxCuUChMgFfWoNiYLZd0w3CDz/W
 cYOw==
X-Gm-Message-State: AFqh2kpLge6o9eUr6pAjWGkuj+qyEv+aCpymklnt6vFyta8REyXNAPWh
 N8GnFovwUoY81WAnUn0j1kdPf18XFBDK6g==
X-Google-Smtp-Source: AMrXdXvcdxwsx1YSr7JXrjTTbxqbhA3fSc4tWI1dtLQpJSnCoN2laPR0M5rTWz3oTsB51H66XEQK6g==
X-Received: by 2002:a05:6512:c1c:b0:4c3:3a78:eab6 with SMTP id
 z28-20020a0565120c1c00b004c33a78eab6mr23365024lfu.65.1673306172157; 
 Mon, 09 Jan 2023 15:16:12 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a27-20020a056512201b00b004b373f61a60sm1829571lfb.96.2023.01.09.15.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:11 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 0/4] drm/msm: convet to drm_crtc_handle_vblank()
Message-Id: <167330408779.609993.9427004517463466813.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 18 Jun 2022 02:33:24 +0300, Dmitry Baryshkov wrote:
> This patchseries replaces drm_handle_vblank() with
> drm_crtc_handle_vblank(). As a bonus result of this conversion it is
> possible to drop the stored array of allocated CRTCs and use the core
> CRTC iterators.
> 
> Changes since v5:
>  - Clean up the event_thread->worker in case of an error to fix possible
>    oops in msm_drm_uninit().
> 
> [...]

Applied, thanks!

[1/4] drm/msm: clean event_thread->worker in case of an error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c79bb6b92def
[2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6606a96ab1ce
[3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e96c08e91726

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
