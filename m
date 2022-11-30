Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB163CF7A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 08:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE310E415;
	Wed, 30 Nov 2022 07:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AEB10E411;
 Wed, 30 Nov 2022 07:02:08 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id e18so10006151qvs.1;
 Tue, 29 Nov 2022 23:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MX8+ScqgMkNWVVKFC1541ti9ztTE5Za3sJFUouR4qhY=;
 b=GPb7sIK3zjeOjR3Rf2GsiQsE/ZQMZWlzSOh5AHm2ncvQ3K+L3L92jcR4MvedIVNrIE
 lKNaF3GRiJtZGILICEG+4ZxoRRNGgaPfuFxMgiZENRu6zUn0HA4E5vs5+uxxM2qD4D//
 azPFlmk5hhWxXTXdH5dh0naxwlEnW5kUH88p4u89LtFbRset/bhOg3Q4/yblTdogl1nz
 lZWfY+l0L1XAyx7YH2d/2YWXzXqJD5fpdgYsGlu8UafoS62RVHcahfPMGV9Y2cKYfPLm
 p4cuy1Lt49joKIHP0r6eKluyxvW3Fk1PjiSMZw+ds3DtT/H0005jo4/Shea/32OaAqXc
 bZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MX8+ScqgMkNWVVKFC1541ti9ztTE5Za3sJFUouR4qhY=;
 b=8Ak5PIkcgIALflCANnEUB5ehX+lLpJ0kr54vB80ccUgZ6XhclhLOBzSlTA0CvjvlpW
 Kgd3UwzxrAtiUpqX325qFWxp5znw8rRI8OPYjsPRW0PtvpcXlD5iTeyL+qKmgu95BkOl
 IZWb8uXbcN7FKUtFH2cqaS1Bec9l5v6DYUrHft+dBi4tTHRihut7HKaGTh5Jn0ntSQ2N
 nKutb8r0eJkPyELhjEUOZbFxlebty63jfKVsR8N98ffGqdW10M1gyKLXy+GCPgmDf4tI
 UBXVFPATNSpG+vDoBKZimQE16ynfu6VqcuhTMEqFmTZbUdcaa2bDUqOnmofnte98oESf
 TeKQ==
X-Gm-Message-State: ANoB5pnWRoKkrfsi8U0MWDohB5vjRfwONO1E3HpC8xfAKjJoGLbMRBTE
 s019iWOVvvknG3tU0cIXdCLhlE096w1Y0Cu4ZkE=
X-Google-Smtp-Source: AA0mqf687Y7b39WvvKHXpsOxzFT/gd8jGoPGBJwgVqWIe7XdK0x0dkkSbIBzQwKC9SDUl6CKWQ9HtgR1llNM1r4VeJ4=
X-Received: by 2002:a05:6214:3712:b0:4bb:9358:2a1e with SMTP id
 np18-20020a056214371200b004bb93582a1emr24147726qvb.97.1669791727574; Tue, 29
 Nov 2022 23:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20221126102141.721353-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221126102141.721353-1-dmitry.baryshkov@linaro.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Nov 2022 17:01:56 +1000
Message-ID: <CAPM=9tyjMCOY3-tJASxNg6dFizfaivqfSrhSG1otFTvfuSg=dQ@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-display-for-6.2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Nov 2022 at 20:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi Dave,
>
> As agreed with Rob Clark, a pull request for the non-GPU part of the drm/msm driver. Summary below.
>
> The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:
>
>   Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media into drm-next (2022-10-27 14:44:15 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/lumag/msm.git tags/drm-msm-display-for-6.2
>
> for you to fetch changes up to 8d1d17d47eaebe4466459846d07e4ba8953fa585:
>
>   Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag (2022-11-26 12:06:29 +0200)
>
> ----------------------------------------------------------------
> drm/msm updates for 6.2
>
> Core:
> - MSM_INFO_GET_FLAGS support
> - Cleaned up MSM IOMMU wrapper code
>
> DPU:
> - Added support for XR30 and P010 image formats
> - Reworked MDSS/DPU schema, added SM8250 MDSS bindings
> - Added Qualcomm SM6115 support
>
> DP:
> - Dropped unsane sanity checks
>
> DSI:
> - Fix calculation of DSC pps payload
>
> DSI PHY:
> - DSI PHY support for QCM2290
>
> HDMI:
> - Reworked dev init path
>
> ----------------------------------------------------------------
> Adam Skladowski (2):
>       dt-bindings: display/msm: add support for SM6115
>       drm/msm/disp/dpu1: add support for display on SM6115
>
> Bryan O'Donoghue (1):
>       dt-bindings: msm: dsi-controller-main: Drop redundant phy-names
>
> Dan Carpenter (1):
>       drm/msm/hdmi: remove unnecessary NULL check
>
> Dmitry Baryshkov (25):
>       Merge remote-tracking branch 'msm/msm-fixes' into HEAD

This commit has no justification or signed off by line, I'll let it
slide this once, but no backmerges without justification and please
sign off merges.

Dave.
