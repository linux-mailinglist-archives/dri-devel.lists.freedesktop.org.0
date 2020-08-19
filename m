Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2A24A03D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 15:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96E6E3A2;
	Wed, 19 Aug 2020 13:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D2A6E2CC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:41:21 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d2so12090058lfj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3uRot0J1Di9E+0e7vb+dEOT/StlUzO3fYMSg8aMNhC8=;
 b=cyXkGltYkaC0McaUgHwD/5OoYZHYrz1MPdgnHwimVl0oxwnZEOo3utozL+huPGOMnK
 fJlPFllGiLVBlhgztZ0pLPpqCK/EfPGn3tk9YTs7zoTwdUzDgGx8ia2bxbxU9c5el5Hg
 OuzIPd5cymAEH4QTUDRThsbB/qYzXRuptB2DXU1jA4UbP8aCfUH5CcYOC8+FzOlfAdtE
 Pr3N3yqcFoc23rjyPWsUncxefwaccKDSZ/GYgy+G5zTwoOerpp7bIX7B89EhCUtwYwSd
 Fho4czVHifLsI7yjvGbE0t/5hWexJp3XAUsa0vPi9+403ADvKUmAnAWzIVvrjRcJCU6x
 F40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uRot0J1Di9E+0e7vb+dEOT/StlUzO3fYMSg8aMNhC8=;
 b=Jr5uX3w13BeFGysupruwHdO3eSzjHIHy+fKGMRW8taVM8e20sCcpVPV1HGdoX2nutJ
 h0UxvRaImCDiu/ROEnoTgYTr+hMhcUxZSANgz47lhaGlPYbk0roHl3k8o5OaMiDIHCAf
 KMDcuCeJ5on2o+YyoklpGphSNbdq0EaDjiAVNVI2FpQSn1VKCPqfbWgw4fJ3NUKBtgkQ
 syb0H47E+2frSO+iPiggMFX0J2orw+eNu5F1LoG75dlP1HkAgn6wEq04CAWsY5otNBRD
 hoX3goVNV1+pZ5pj3WK+a4jQ73FVxEjeZKXaVxqmdAp53rAGh6sk1tOtJ0S8+UutJLwa
 tplA==
X-Gm-Message-State: AOAM530VuPgGW0l64FPRaQR4LyCS9SDKtWDjUnOj1FxKBhQWF/4uVkN7
 2GMcgn1FDJnZJRgWPX+undGl6Vxy/q4naeDW37Q=
X-Google-Smtp-Source: ABdhPJzVwh/eBPB/toCwEXC1n2x1b6nK7nRhjxc6nhA1rUb5IApOF8C7HR2OqQXVcWiQDBmwt/Wd3ey06LZXHWJ+En0=
X-Received: by 2002:a19:ae06:: with SMTP id f6mr12088967lfc.42.1597844479512; 
 Wed, 19 Aug 2020 06:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200805205911.20927-1-trix@redhat.com>
In-Reply-To: <20200805205911.20927-1-trix@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 19 Aug 2020 15:41:08 +0200
Message-ID: <CAMeQTsbQP+hsVtPRJdehwS3yULP0Mif1T8e9G18mJp7dpH77Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: fix error check
To: trix@redhat.com
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, yakui.zhao@intel.com,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 10:59 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Reviewing this block of code in cdv_intel_dp_init()
>
> ret = cdv_intel_dp_aux_native_read(gma_encoder, DP_DPCD_REV, ...
>
> cdv_intel_edp_panel_vdd_off(gma_encoder);
> if (ret == 0) {
>         /* if this fails, presume the device is a ghost */
>         DRM_INFO("failed to retrieve link info, disabling eDP\n");
>         drm_encoder_cleanup(encoder);
>         cdv_intel_dp_destroy(connector);
>         goto err_priv;
> } else {
>
> The (ret == 0) is not strict enough.
> cdv_intel_dp_aux_native_read() returns > 0 on success
> otherwise it is failure.
>
> So change to <=

Thanks for the patch. Looks correct.

Will apply to drm-misc-next

-Patrik

>
> Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index f41cbb753bb4..720a767118c9 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -2078,7 +2078,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
>                                                intel_dp->dpcd,
>                                                sizeof(intel_dp->dpcd));
>                 cdv_intel_edp_panel_vdd_off(gma_encoder);
> -               if (ret == 0) {
> +               if (ret <= 0) {
>                         /* if this fails, presume the device is a ghost */
>                         DRM_INFO("failed to retrieve link info, disabling eDP\n");
>                         drm_encoder_cleanup(encoder);
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
