Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB834490D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761536E4D2;
	Mon, 22 Mar 2021 15:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AE06E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:17:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z25so21520048lja.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rYAcKx72DB4u4HHTvyKRT13cKBhJi7wvnu+SHIdYIM=;
 b=XN9JxCsWKzEuPNiX3mIeRQeWwmfS4G8rYKs2Tmkvx8S5ZtjGzgzLMwhiE+qFJ7HTMo
 0g4ODvjmrbfCufDTgkjd7BCl8PTDIjEJQ/gkoS1DnWjX5R7Pe8hhdIqatob6WYVpFrL4
 deVvmUWvaPcLTeeMoMemBhD28rNNCBtzaauck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rYAcKx72DB4u4HHTvyKRT13cKBhJi7wvnu+SHIdYIM=;
 b=SXYeYcRrB8LBqJL28uUxuydZEtr4eXvlSa2efDo72xIY1FG0gYH7Pf3DuUvL9wF/XG
 /2KztLoG/9PiGBwO1+4RcIERlIIjEl3LGpL4GzLkbmWu5OwY+Gc6hzRfI4jya0xyfSVQ
 GyLmLsoqS2cqtb3SirRhaKUZ7DiF5ujF1hcCfUmIYXQnO47n7K9PpuByUHrfh7rMdQlI
 /XgV+BHt1sRkf4U8nOWXyiMGpwMDsEpbNacP9qTRr/Rne5TzbwnnGfr6sCqoDli+yN/M
 zGhsgX7b1xI2Sa0+SVx9lTt3HS1nHt5F04wuPRqk6z0Frfu9er/vfZ1QAf+l9wWH9H7M
 ifvg==
X-Gm-Message-State: AOAM530bkG0/zAu9VVO+/4/bOIwdbkGCjaj25v4OeZ2dFKKZYpKIZNVR
 Ks8oOuKVr+7E67/35brj/KBgeE2Ao9iGmR0Xx/Cj1g==
X-Google-Smtp-Source: ABdhPJxgamQxsWB+aWumLPBy6L5oJgS7paw9ltPkoLkJu/AhFAE1HRFbLQbqX3Zp85Dq70WwAVIMZr9AK36ZCV1vdd0=
X-Received: by 2002:a2e:8709:: with SMTP id m9mr50224lji.483.1616426277777;
 Mon, 22 Mar 2021 08:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
In-Reply-To: <20210310161444.1015500-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 22 Mar 2021 11:17:46 -0400
Message-ID: <CAJUqKUqGB4pO=NvJip03_xTKe9XcXHOcf8eYpYgngHpsUgxKHA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Cc: alexander.deucher@amd.com, Mark Yacoub <markyacoub@google.com>
Content-Type: multipart/mixed; boundary="===============2129996392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2129996392==
Content-Type: multipart/alternative; boundary="00000000000017c27105be2192bb"

--00000000000017c27105be2192bb
Content-Type: text/plain; charset="UTF-8"

"friendly ping"

On Wed, Mar 10, 2021 at 11:14 AM Mark Yacoub <markyacoub@chromium.org>
wrote:

> From: Mark Yacoub <markyacoub@google.com>
>
> On initializing the framebuffer, call drm_any_plane_has_format to do a
> check if the modifier is supported. drm_any_plane_has_format calls
> dm_plane_format_mod_supported which is extended to validate that the
> modifier is on the list of the plane's supported modifiers.
>
> The bug was caught using igt-gpu-tools test:
> kms_addfb_basic.addfb25-bad-modifier
>
> Tested on ChromeOS Zork by turning on the display, running an overlay
> test, and running a YT video.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 13 +++++++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index afa5f8ad0f563..a947b5aa420d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
>                                          &amdgpu_fb_funcs);
>         if (ret)
>                 goto err;
> +       /* Verify that the modifier is supported. */
> +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +                                     mode_cmd->modifier[0])) {
> +               struct drm_format_name_buf format_name;
> +               drm_dbg_kms(dev,
> +                           "unsupported pixel format %s / modifier
> 0x%llx\n",
> +                           drm_get_format_name(mode_cmd->pixel_format,
> +                                               &format_name),
> +                           mode_cmd->modifier[0]);
> +
> +               ret = -EINVAL;
> +               goto err;
> +       }
>
>         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
>         if (ret)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1cf040c..21314024a83ce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct
> drm_plane *plane,
>  {
>         struct amdgpu_device *adev = drm_to_adev(plane->dev);
>         const struct drm_format_info *info = drm_format_info(format);
> +       int i;
>
>         enum dm_micro_swizzle microtile =
> modifier_gfx9_swizzle_mode(modifier) & 3;
>
> @@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct
> drm_plane *plane,
>         if (modifier == DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> +       /* Check that the modifier is on the list of the plane's supported
> modifiers. */
> +       for (i = 0; i < plane->modifier_count; i++) {
> +               if (modifier == plane->modifiers[i])
> +                       break;
> +       }
> +       if (i == plane->modifier_count)
> +               return false;
> +
>         /*
>          * The arbitrary tiling support for multiplane formats has not
> been hooked
>          * up.
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
>

--00000000000017c27105be2192bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;friendly ping&quot;</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 10, 2021 at 11:14 AM =
Mark Yacoub &lt;<a href=3D"mailto:markyacoub@chromium.org">markyacoub@chrom=
ium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com" targe=
t=3D"_blank">markyacoub@google.com</a>&gt;<br>
<br>
On initializing the framebuffer, call drm_any_plane_has_format to do a<br>
check if the modifier is supported. drm_any_plane_has_format calls<br>
dm_plane_format_mod_supported which is extended to validate that the<br>
modifier is on the list of the plane&#39;s supported modifiers.<br>
<br>
The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-mo=
difier<br>
<br>
Tested on ChromeOS Zork by turning on the display, running an overlay<br>
test, and running a YT video.<br>
<br>
Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" target=3D=
"_blank">alexander.deucher@amd.com</a>&gt;<br>
Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=
=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
Signed-off-by: default avatarMark Yacoub &lt;<a href=3D"mailto:markyacoub@c=
hromium.org" target=3D"_blank">markyacoub@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_display.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 13 +++++++++++++<br>
=C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |=C2=A0 9 +++++++++=
<br>
=C2=A02 files changed, 22 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_display.c<br>
index afa5f8ad0f563..a947b5aa420d2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c<br>
@@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;amdgpu_fb_funcs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Verify that the modifier is supported. */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_any_plane_has_format(dev, mode_cmd-&gt=
;pixel_format,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode_cmd-&gt;mod=
ifier[0])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_format_n=
ame_buf format_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(dev,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;unsupported pixel format %s / modifier 0x%llx=
\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0drm_get_format_name(mode_cmd-&gt;pixel_format,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;format_name),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mode_cmd-&gt;modifier[0]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D amdgpu_display_framebuffer_init(dev, rf=
b, mode_cmd, obj);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 961abf1cf040c..21314024a83ce 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_=
plane *plane,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_device *adev =3D drm_to_adev(plan=
e-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_format_info *info =3D drm_form=
at_info(format);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum dm_micro_swizzle microtile =3D modifier_gf=
x9_swizzle_mode(modifier) &amp; 3;<br>
<br>
@@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct drm=
_plane *plane,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the modifier is on the list of th=
e plane&#39;s supported modifiers. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; plane-&gt;modifier_count; =
i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (modifier =3D=3D=
 plane-&gt;modifiers[i])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D plane-&gt;modifier_count)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The arbitrary tiling support for multip=
lane formats has not been hooked<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* up.<br>
-- <br>
2.30.1.766.gb4fecdf3b7-goog<br>
<br>
</blockquote></div>

--00000000000017c27105be2192bb--

--===============2129996392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2129996392==--
