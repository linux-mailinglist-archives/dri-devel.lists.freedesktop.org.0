Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE53462EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D43A6EA09;
	Tue, 23 Mar 2021 15:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3786EA0D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:32:13 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id w8so10247670pjf.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/Cz6+lI4apo80sn1DnT1qYl9f9fU+dp+JkTkb3512U=;
 b=vEWOnzcPAb3XUs9wWbP9lku+DAFgzlcDzRRhAoL9Hasc1Vf51F/7RUnk5o7GPtWmPe
 D6/pgD7ntmtrmUHaSjol8wz4b6Yyj/AW+md6HZW146wl5iLEaH01R0c6ld3FLPxV9i0N
 8/Q+slZm3CUwfTIL3rrzSOWBp0mbjTBBO7G5jjRBOxI98GyJgod6Ie+5YVfGk9qWWXIf
 eP56ZyyW3/Yfwe41p9aa9bOR0VzwKCn/2Jk9YV0i6LmNHXDpQwPj6XFRVxrjkj1Mra2h
 N/pamD57wqsIKMvWj/Y75snolN+PKxnmwk9tYlRPPzpLt/+Y7KMf+MaW/55MfAqaLCuY
 82eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/Cz6+lI4apo80sn1DnT1qYl9f9fU+dp+JkTkb3512U=;
 b=AGRnf9pRr3GbOB7HgSF5Sew5O3KlSGlwpC71/Y+oCBS7pofxkuNeKq3JxB60b65tpM
 pQmom/IKFg6XVlc5F+Uyrxrc6eW8PkdBmv4sdYy5FiJ1ZIIUWXpjTkcfkVmx91fUmayj
 TAFqlS5zN62phlUV2aLMek5X+SptN44/hmJbCG/YZf21pnZp6KuowtbyXqzVnF+L+ugq
 c3y75O0STvhDLVlLoAbE4FWjkJLwiTWF069XV5TrMu/LiX99VowrUKcxppXba2uo3pcT
 S56v1ox4ySscMXTpl/8IcUFZE0uHZjFLOOKh46dXsMo7VrsglzaiijQ3vyjzqMPmZmvK
 cOHw==
X-Gm-Message-State: AOAM531pMXwBNfZnhMXEuLnmozpPSVddlVVTusdl6jqza+VyF+wcGRh8
 dLOunrhPO4/er6MqrOdy/aPsR0kZD4snGb1mnd+ElA==
X-Google-Smtp-Source: ABdhPJzybHQSeUegRVEbcZgHuCKOtLDObMB/kMd16TadUSXkT8HdE3FF4Uh+STfdxV7alw6Di2Al9VuqakcsmQBSEVo=
X-Received: by 2002:a17:90a:4005:: with SMTP id u5mr5039685pjc.6.1616513532457; 
 Tue, 23 Mar 2021 08:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
In-Reply-To: <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Tue, 23 Mar 2021 11:32:01 -0400
Message-ID: <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 11:02 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 10, 2021 at 11:15 AM Mark Yacoub <markyacoub@chromium.org> wrote:
> >
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > On initializing the framebuffer, call drm_any_plane_has_format to do a
> > check if the modifier is supported. drm_any_plane_has_format calls
> > dm_plane_format_mod_supported which is extended to validate that the
> > modifier is on the list of the plane's supported modifiers.
> >
> > The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-modifier
> >
> > Tested on ChromeOS Zork by turning on the display, running an overlay
> > test, and running a YT video.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>
>
> I'm not an expert with modifiers yet.  Will this break chips which
> don't currently support modifiers?
No it shouldn't. When you don't support modifiers yet, your will
default to Linear Modifier (DRM_FORMAT_MOD_LINEAR),
which is later checked in amdgpu_dm.c::dm_plane_format_mod_supported()
    /*
    * We always have to allow this modifier, because core DRM still
    * checks LINEAR support if userspace does not provide modifiers.
    */
    if (modifier == DRM_FORMAT_MOD_LINEAR)
        return true;

>
> Alex
>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 13 +++++++++++++
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > index afa5f8ad0f563..a947b5aa420d2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
> >                                          &amdgpu_fb_funcs);
> >         if (ret)
> >                 goto err;
> > +       /* Verify that the modifier is supported. */
> > +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > +                                     mode_cmd->modifier[0])) {
> > +               struct drm_format_name_buf format_name;
> > +               drm_dbg_kms(dev,
> > +                           "unsupported pixel format %s / modifier 0x%llx\n",
> > +                           drm_get_format_name(mode_cmd->pixel_format,
> > +                                               &format_name),
> > +                           mode_cmd->modifier[0]);
> > +
> > +               ret = -EINVAL;
> > +               goto err;
> > +       }
> >
> >         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
> >         if (ret)
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 961abf1cf040c..21314024a83ce 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
> >  {
> >         struct amdgpu_device *adev = drm_to_adev(plane->dev);
> >         const struct drm_format_info *info = drm_format_info(format);
> > +       int i;
> >
> >         enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
> >
> > @@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
> >         if (modifier == DRM_FORMAT_MOD_LINEAR)
> >                 return true;
> >
> > +       /* Check that the modifier is on the list of the plane's supported modifiers. */
> > +       for (i = 0; i < plane->modifier_count; i++) {
> > +               if (modifier == plane->modifiers[i])
> > +                       break;
> > +       }
> > +       if (i == plane->modifier_count)
> > +               return false;
> > +
> >         /*
> >          * The arbitrary tiling support for multiplane formats has not been hooked
> >          * up.
> > --
> > 2.30.1.766.gb4fecdf3b7-goog
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
