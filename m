Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529CB2990FA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 16:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEBE6EA15;
	Mon, 26 Oct 2020 15:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92BC6E95B;
 Mon, 26 Oct 2020 15:28:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v5so12081584wmh.1;
 Mon, 26 Oct 2020 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5fixE0Fzxa17/LaNC7f09xiejxOpGyiNSz6J/RfP0Nk=;
 b=iKJOj/M7ENfJnhaI82M3THtzki19jT4wz4VC4GxWYY8cSgG55UbYRaKsGrCrom7MLA
 1aVzJp/N7HJpj2SnQDBTD5gt+4q2p6apsgwoyZbxsIVoutUycFaLtVQ5LHJ5iiTf+EV1
 Kv/QvP+rsxcJpGNfjWrimeSCunnV2uOEDWvqZ+7ZcLH3UFGQvxETzFXYI1GfwtfSYUrF
 9tsGt9Y0HwvkUpDoWFHgL3acDOJNMPu4ieFQsBuyIhutiQAYO1wgNqkP4c4Xf+LHbszK
 5OHrVIiEQhcZ25Tw1Mus2JD/nnL81RUJEOxCRZEQ2aBfREFToc/8cNpa3BnVtKdI3xi6
 l1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fixE0Fzxa17/LaNC7f09xiejxOpGyiNSz6J/RfP0Nk=;
 b=RKVr6ImDi8Y6MbiZl3Ak0eo5pA0G58AF4ux0jMhdCsotCpMoextreKqe9IcOJIrrOS
 KJ/baib+SxCB7tWvTMlWTYF/3N6UzIcy/R798fRLLROo6WoiaHfqyRZ7PycglayfeF/W
 827O2Z/I/2UEFWMTy7stEEaEGQTDrRXucvIKOpfYz0hCR5Nv4Av5GRQSDkem1hApFcJ1
 wlJLclrdXWiVldJ6A+ag14n+PvsFubCFTBP86qIomBHsx+wM/rs+B7vo6y9qz9KkwdG2
 8WyjnayDFefTgnxLtolBlAwAVRM3aqJyiL7NG2cAtc2yRRMQn8PeyQjfvSrYyoD+8Urg
 UM9Q==
X-Gm-Message-State: AOAM531VtTEpem5CQg7QE49g9MF+mMRc/sXgZZJpMajWnhkgQ4iNCozR
 lsapHdcQAr1k7EgVBbaLgHWQpEJjbrPIv/ATYldMlRxPEa73Vg==
X-Google-Smtp-Source: ABdhPJwgQp8TU+rXlS1EmwKGUKBfI0Hn6qEhlIl0U9B6UJQqUib0WcAJ72ToKsIb5ibIajGh4NjUL1IXIZYlQxaJpik=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr17556594wmm.49.1603726109285; 
 Mon, 26 Oct 2020 08:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
In-Reply-To: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 Oct 2020 08:28:17 -0700
Message-ID: <CAF6AEGvavr6aGkkK6uhcY8nEYbZ82AiAs4uYwRSkuHfQ5p==Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add missing stub definition
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 5:48 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> DRM_MSM fails to build with DRM_MSM_DP=n; add the missing stub.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks..

Reviewed-by: Rob Clark <robdclark@gmail.com>

and looks like,

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
Snapdragon Chipsets")

> ---
>  drivers/gpu/drm/msm/msm_drv.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b9dd8f8f4887..0b2686b060c7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -423,6 +423,11 @@ static inline int msm_dp_display_disable(struct msm_dp *dp,
>  {
>         return -EINVAL;
>  }
> +static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
> +                                       struct drm_encoder *encoder)
> +{
> +       return -EINVAL;
> +}
>  static inline void msm_dp_display_mode_set(struct msm_dp *dp,
>                                 struct drm_encoder *encoder,
>                                 struct drm_display_mode *mode,
> --
> 2.28.0.dirty
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
