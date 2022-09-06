Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A285AEE79
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF13C10E6C7;
	Tue,  6 Sep 2022 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44AD10E6D2;
 Tue,  6 Sep 2022 15:17:32 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11e9a7135easo28942049fac.6; 
 Tue, 06 Sep 2022 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=elNxuUX6lGeeEhgvNfq4ozFit+ITf2yHnwbewtLwpz4=;
 b=NmH2CksanrE8Jg5SuuE0bgmFiHP6nQwdoGRvft2TPyWAdlUNzdJymK9JA5iQRuAuG3
 eaqK6vAK4Wgtj2BVu0d2608vZbXbhBVDGnpznuvTj/S9K4n9XByQuZACAVpgjLOAVu8G
 LQ6yevrMZ2DF4TUSj6m2+BKitfq8vicZJWXi4HhKgaOv2iw2mo/y5LIm65ABdPM+pnA9
 JaX35Vi/bH4JGrtG622F6l731Ycepgh4UMyVH8O+vkJB68ZbGMeFzW2/8WMC4+JWpxw9
 +TwcDiJvCgvbS0H2hOgzZ5BC+VFfRKokboX44FHTbPm6sjcnQGm7HoZ9rpXKcvo/FXvA
 tGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=elNxuUX6lGeeEhgvNfq4ozFit+ITf2yHnwbewtLwpz4=;
 b=DyuZ3OjifjuCPtbOYi7zUWJ6i0FGF4a/UgRLPsYn4T8InyKdD/I2PnziwoBp+01IHv
 abz6vUDfqMSvhhHEX7D0OBtQI1jJbIESySZiXorU2WyLndUdtZ0zaQhdebXZxnI2/vXt
 3pCjWrYITv0J8yq1m70XtlGiArz4gPSGzru2CHz/rRvazSWHpa9zmHhtu53AnS2To+CP
 HFZx9gPI+HfTpVgMTp6l8n8m3cpSiTMuf5FKmmkuJP2OBiUOL34LWkpRTlNq13qYItXV
 Q+BxW0TS4PKk12JZZZ9brOgueNMaH932G5lTw0xYQ6CI7zLktrx2eegRw173iSvJGOTl
 eG9Q==
X-Gm-Message-State: ACgBeo243CMego3/TpkQr5JxnzPXfnthjhpipLCZ2rwMOqArbJbRKwaa
 yrkdQ8RCGvbsOx6sAz6q15/IAg7huJVRVyJhBfc=
X-Google-Smtp-Source: AA6agR7EE3xwmNOpnaKh+tokhUCsSnbEdbIMeQTOdDjOcE1dmBGUpeWwdoyF2QflF5b+E/DFc4ei+KMtcY76k/kD2rQ=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr11244760oam.96.1662477451902; Tue, 06
 Sep 2022 08:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220905005329.19501-1-jingyuwang_vip@163.com>
In-Reply-To: <20220905005329.19501-1-jingyuwang_vip@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Sep 2022 11:17:20 -0400
Message-ID: <CADnq5_NJp0GMSbwv4rYU=KYLxfY0EsKD10MdZ0k+YV3sGXabng@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_atpx_handler.c
To: Jingyu Wang <jingyuwang_vip@163.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, isabbasso@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 2:29 AM Jingyu Wang <jingyuwang_vip@163.com> wrote:
>
> Fix everything checkpatch.pl complained about in amdgpu_atpx_handler.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c  | 27 +++++++++++--------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> index d6d986be906a..911d6a130ec5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
> @@ -74,24 +74,29 @@ struct atpx_mux {
>         u16 mux;
>  } __packed;
>
> -bool amdgpu_has_atpx(void) {
> +bool amdgpu_has_atpx(void)
> +{
>         return amdgpu_atpx_priv.atpx_detected;
>  }
>
> -bool amdgpu_has_atpx_dgpu_power_cntl(void) {
> +bool amdgpu_has_atpx_dgpu_power_cntl(void)
> +{
>         return amdgpu_atpx_priv.atpx.functions.power_cntl;
>  }
>
> -bool amdgpu_is_atpx_hybrid(void) {
> +bool amdgpu_is_atpx_hybrid(void)
> +{
>         return amdgpu_atpx_priv.atpx.is_hybrid;
>  }
>
> -bool amdgpu_atpx_dgpu_req_power_for_displays(void) {
> +bool amdgpu_atpx_dgpu_req_power_for_displays(void)
> +{
>         return amdgpu_atpx_priv.atpx.dgpu_req_power_for_displays;
>  }
>
>  #if defined(CONFIG_ACPI)
> -void *amdgpu_atpx_get_dhandle(void) {
> +void *amdgpu_atpx_get_dhandle(void)
> +{
>         return amdgpu_atpx_priv.dhandle;
>  }
>  #endif
> @@ -134,7 +139,7 @@ static union acpi_object *amdgpu_atpx_call(acpi_handle handle, int function,
>
>         /* Fail only if calling the method fails and ATPX is supported */
>         if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
> -               printk("failed to evaluate ATPX got %s\n",
> +               DRM_WARN("failed to evaluate ATPX got %s\n",

I'm not sure these need to be warnings.  Also, please use the
dev_info() functions instead so we can tell which device on the system
is reporting the issue.

>                        acpi_format_exception(status));
>                 kfree(buffer.pointer);
>                 return NULL;
> @@ -190,7 +195,7 @@ static int amdgpu_atpx_validate(struct amdgpu_atpx *atpx)
>
>                 size = *(u16 *) info->buffer.pointer;
>                 if (size < 10) {
> -                       printk("ATPX buffer is too small: %zu\n", size);
> +                       DRM_WARN("ATPX buffer is too small: %zu\n", size);
>                         kfree(info);
>                         return -EINVAL;
>                 }
> @@ -223,11 +228,11 @@ static int amdgpu_atpx_validate(struct amdgpu_atpx *atpx)
>         atpx->is_hybrid = false;
>         if (valid_bits & ATPX_MS_HYBRID_GFX_SUPPORTED) {
>                 if (amdgpu_atpx_priv.quirks & AMDGPU_PX_QUIRK_FORCE_ATPX) {
> -                       printk("ATPX Hybrid Graphics, forcing to ATPX\n");
> +                       DRM_WARN("ATPX Hybrid Graphics, forcing to ATPX\n");
>                         atpx->functions.power_cntl = true;
>                         atpx->is_hybrid = false;
>                 } else {
> -                       printk("ATPX Hybrid Graphics\n");
> +                       DRM_WARN("ATPX Hybrid Graphics\n");

These are definitely not warnings.  Please use dev_info() here.

>                         /*
>                          * Disable legacy PM methods only when pcie port PM is usable,
>                          * otherwise the device might fail to power off or power on.
> @@ -269,7 +274,7 @@ static int amdgpu_atpx_verify_interface(struct amdgpu_atpx *atpx)
>
>         size = *(u16 *) info->buffer.pointer;
>         if (size < 8) {
> -               printk("ATPX buffer is too small: %zu\n", size);
> +               DRM_WARN("ATPX buffer is too small: %zu\n", size);
>                 err = -EINVAL;
>                 goto out;
>         }
> @@ -278,7 +283,7 @@ static int amdgpu_atpx_verify_interface(struct amdgpu_atpx *atpx)
>         memcpy(&output, info->buffer.pointer, size);
>
>         /* TODO: check version? */
> -       printk("ATPX version %u, functions 0x%08x\n",
> +       DRM_WARN("ATPX version %u, functions 0x%08x\n",

Same here.

>                output.version, output.function_bits);
>
>         amdgpu_atpx_parse_functions(&atpx->functions, output.function_bits);
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> --
> 2.34.1
>
