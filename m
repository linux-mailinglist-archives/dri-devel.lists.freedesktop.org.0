Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5956997C2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5865010EDB4;
	Thu, 16 Feb 2023 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3B910EDB4;
 Thu, 16 Feb 2023 14:45:18 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-16e809949eeso1221186fac.9; 
 Thu, 16 Feb 2023 06:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wBZU3P9ruQsj2+OdwnCvVGlKbEIZH0HtDGcGjTkhH8Y=;
 b=F8cYNlZPkChw4tZJfkaGRquSwV90B7ozet5FN+6AF50zqV/sUmduCOKvebPUi74kBe
 Q9kN0cvIgtfkQPkejiQmWisdrQwq3ceypVcrnvkwa1YlAVNYSxkoLq69Cq4c8mG47wds
 ++Mk1wq8LoVLDZN4ei7J5NVSXyaixmjIDbn3WNA2IbeIPAWIBv/akefvf3cuB8fXqARS
 0WqNQxJOqvgikpoOosSCRfeMciXZrXf+Mhg4+bLbE9A6e0ks0M22S1DJMvm55XfZHvpT
 UGP6KFYyUD2EX1DhBaPfyLiJMchebFWw9kVXQZrasbhwHv0Ar04NqVg9DEPj+qR5V/eh
 imEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBZU3P9ruQsj2+OdwnCvVGlKbEIZH0HtDGcGjTkhH8Y=;
 b=AurZyeN1ZPMu+FFlf90ElFJxs/GdMsxuaX9S59CdJfGAAJzcQfH+YIBzDiuylHVfg1
 xu4SlANai91P23QZXqFPZ30ih0Lq9nm6uIDjBJuSkFK1NqIM+BKp42VSGs2vf4bRvb0N
 sL5UMLon8EbYZQRm/fGjz/b9dguNU+PPiV4n08nJMync/3pjkPwnEIYyzFS+AXyKoatH
 nCjY/fOIKYx5QusMLes2GcQRCG+4Hrjo5CraKtm1g7Z//XNABFeY4s0dSSLDTQ30un7A
 DUm0QkTxL3JXpYh6Yd60RH8ltKZPRis3KEr5CLuBjU9UpEeaswwMQxnn4MCmUjNKJFXZ
 wYwg==
X-Gm-Message-State: AO0yUKV4FtIqWYqtDwJlXVNr313Z2xUKrIL/MLoI8ZGPwRLli2i73s51
 68vgjQGcjIjPb+wS8pGye89rYQa5mcDiTbrxqPGVAnBO
X-Google-Smtp-Source: AK7set8D9+do8yJ04du5Y4mH6xASNrvw0cTfP6QWKik7jHkXukHVBBQ+kK9D/i3wcNdYjOA+fUkZgeA4Mr5x8tIE3so=
X-Received: by 2002:a05:6870:1707:b0:16e:5bc4:ef0d with SMTP id
 h7-20020a056870170700b0016e5bc4ef0dmr228140oae.96.1676558715859; Thu, 16 Feb
 2023 06:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20230215113833.477999-1-hdegoede@redhat.com>
In-Reply-To: <20230215113833.477999-1-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Feb 2023 09:45:04 -0500
Message-ID: <CADnq5_PyaKzz4_4rX-HekN8HgcdQb9bo8Ut_7a3uV58XZV8j9Q@mail.gmail.com>
Subject: Re: [RFC] drm/amd/display: Pass proper parent for DM backlight device
 registration
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 6:38 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The parent for the backlight device should be the drm-connector object,
> not the PCI device.
>
> Userspace relies on this to be able to detect which backlight class device
> to use on hybrid gfx devices where there may be multiple native (raw)
> backlight devices registered.
>
> Specifically gnome-settings-daemon expects the parent device to have
> an "enabled" sysfs attribute (as drm_connector devices do) and tests
> that this returns "enabled" when read.
>
> This aligns the parent of the backlight device with i915, nouveau, radeon.
> Note that drivers/gpu/drm/amd/amdgpu/atombios_encoders.c also already
> uses the drm_connector as parent, only amdgpu_dm.c used the PCI device
> as parent before this change.
>
> Note this is marked as a RFC because I don't have hw to test, so this
> has only been compile tested! If someone can test this on actual
> hw which hits the changed code path that would be great.
>
> Link: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch looks fine to me.  I'll apply it and we can run it through our CI system.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 31bce529f685..33b0e1de2770 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4065,7 +4065,8 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
>  };
>
>  static void
> -amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
> +amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm,
> +                                   struct amdgpu_dm_connector *aconnector)
>  {
>         char bl_name[16];
>         struct backlight_properties props = { 0 };
> @@ -4088,7 +4089,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
>                  adev_to_drm(dm->adev)->primary->index + dm->num_of_edps);
>
>         dm->backlight_dev[dm->num_of_edps] = backlight_device_register(bl_name,
> -                                                                      adev_to_drm(dm->adev)->dev,
> +                                                                      aconnector->base.kdev,
>                                                                        dm,
>                                                                        &amdgpu_dm_backlight_ops,
>                                                                        &props);
> @@ -4141,6 +4142,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
>
>
>  static void register_backlight_device(struct amdgpu_display_manager *dm,
> +                                     struct amdgpu_dm_connector *aconnector,
>                                       struct dc_link *link)
>  {
>         if ((link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) &&
> @@ -4151,7 +4153,7 @@ static void register_backlight_device(struct amdgpu_display_manager *dm,
>                  * is better then a black screen.
>                  */
>                 if (!dm->backlight_dev[dm->num_of_edps])
> -                       amdgpu_dm_register_backlight_device(dm);
> +                       amdgpu_dm_register_backlight_device(dm, aconnector);
>
>                 if (dm->backlight_dev[dm->num_of_edps]) {
>                         dm->backlight_link[dm->num_of_edps] = link;
> @@ -4337,7 +4339,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>
>                         if (ret) {
>                                 amdgpu_dm_update_connector_after_detect(aconnector);
> -                               register_backlight_device(dm, link);
> +                               register_backlight_device(dm, aconnector, link);
>
>                                 if (dm->num_of_edps)
>                                         update_connector_ext_caps(aconnector);
> --
> 2.39.1
>
