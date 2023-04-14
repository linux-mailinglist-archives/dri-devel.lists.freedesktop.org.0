Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669996E1BCE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 07:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413310E153;
	Fri, 14 Apr 2023 05:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD9F10E153
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 05:36:48 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1842cddca49so20962958fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 22:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681450606; x=1684042606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o53Ppz6NZcU37xVTZUVRtByt/0ke8sUTMMek2QrzwKE=;
 b=FSjVM05I0ApxhJqbteEjBl2Bp36eX21Cb4WifR2YmXPCSuquAnHovbEB9VtcBvpdZF
 GkOVyBWgZpDR1WxBTe5/2S0JLT5Ig5gu29qy/MmYWU3PI29CA77L7t5hLx86fmWg1SoX
 vIMBveRKf+8nryi23v82xdsIHTW8bF1XYZwpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681450606; x=1684042606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o53Ppz6NZcU37xVTZUVRtByt/0ke8sUTMMek2QrzwKE=;
 b=QdRQU5KDKf2WaYN70UkGYrcskw0UcdSeRHAStxpqMEIKua9JqEXN2wdlRojyOKmWnH
 /yN0M3llpw3gdKVJsuz19KC0ULg3Ep3umdBkvNKQoCFjaqb4uAev2l6zH9/HGz8hi61m
 WejovG5K93lw0wHtd5kF3qRSGqXEGfxbwlJI1hBvJ8g91PlwD0dWq4d3DiJTNBZQ9siX
 EJJYt6odQx4tGC6IBQNDOR7Ogp/n4p0403AEV30X0eOdxyZ3dXclirDu0tOiBfOa+gNW
 jB0vjtkemhg+07sJUjGzPDfHiUJKkLD6Fxe91wO3DCHf0AU38x7/5I0feZclZo9XiE8X
 g+zQ==
X-Gm-Message-State: AAQBX9eUfZQfo5LGxLedXCIf/k1MrgonU4SJn1yP4ab8S7DVzfrYgEFy
 Nm6dDO6+rtLNviEI22/8yZ+eErncir5VpNxaNgLMFw==
X-Google-Smtp-Source: AKy350ZZ15f1qHCswOjx4ytld5O7vtI4SR8Rr/cCYug8550zr1o0RVzjbIhhBzFSX89ILgqQ9x1jWYgASjXEfpgGVlo=
X-Received: by 2002:a05:6870:40c1:b0:184:7e3c:e33e with SMTP id
 l1-20020a05687040c100b001847e3ce33emr2078381oal.8.1681450606092; Thu, 13 Apr
 2023 22:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
In-Reply-To: <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Apr 2023 07:36:34 +0200
Message-ID: <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
To: Sui Jingfeng <15330273260@189.cn>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023 at 06:24, Sui Jingfeng <15330273260@189.cn> wrote:
>
> Hi,
>
> On 2023/4/14 04:01, Daniel Vetter wrote:
> > On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 13.04.23 um 20:56 schrieb Daniel Vetter:
> >> [...]
> >>> This should switch the existing code over to using drm_framebuffer instead
> >>> of fbdev:
> >>>
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >>> index ef4eb8b12766..99ca69dd432f 100644
> >>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>> @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> >>>    static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
> >>>                                            struct drm_rect *clip)
> >>>    {
> >>> +   struct drm_fb_helper *helper = info->par;
> >>> +
> >>>     off_t end = off + len;
> >>>     u32 x1 = 0;
> >>>     u32 y1 = off / info->fix.line_length;
> >>> -   u32 x2 = info->var.xres;
> >>> -   u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> >>> +   u32 x2 = helper->fb->height;
> >>> +   unsigned stride = helper->fb->pitches[0];
> >>> +   u32 y2 = DIV_ROUND_UP(end, stride);
> >>> +   int bpp = drm_format_info_bpp(helper->fb->format, 0);
> >> Please DONT do that. The code here is fbdev code and shouldn't bother about
> >> DRM data structures. Actually, it shouldn't be here: a number of fbdev
> >> drivers with deferred I/O contain similar code and the fbdev module should
> >> provide us with a helper. (I think I even had some patches somewhere.)
> > Well my thinking is that it's a drm driver,
>
> Yes, I actually agree with this, and the code looks quite good. And I
> really want to adopt it.
>
> Because here is DRM, we should emulate the fbdev in the DRM's way.
>
> The DRM is really the big brother on the behind of emulated fbdev,
>
> who provide the real displayable backing memory and scant out engine to
> display such a buffer.
>
>
> But currently, the fact is,  drm_fb_helper.c still initializes lots of
> data structure come from fbdev world.
>
> For example, the drm_fb_helper_fill_fix() and drm_fb_helper_fill_var()
> in drm_fb_helper_fill_info() function.
>
> This saying implicitly that the fbdev-generic is a glue layer which copy
> damage frame buffer data
>
> from the front end(fbdev layer) to its drm backend.  It's not a 100%
> replacement its fbdev front end,
>
> rather, it relay on it.
>
>
> > so if we have issue with limit
> > checks blowing up it makes more sense to check them against drm limits.
> > Plus a lot more people understand those than fbdev. They should all match
> > anyway, or if they dont, we have a bug.
>
> Yes, this is really what I'm worry about.
>
> I see that  members of struct fb_var_screeninfo can be changed by
> user-space. For example, xoffset and yoffset.
>
> There is no change about 'info->var.xres' and 'info->var.yres' from the
> userspace,
>
> therefore, they should all match in practice.
>
>
> User-space can choose a use a smaller dispaly area than 'var.xres x
> var.yres',
>
> but that is implemented with 'var.xoffset' and 'var.xoffset'.
>
> But consider that the name 'var', which may stand for 'variation' or
> 'vary'. This is terrifying.
>
> I imagine, with a shadow buffer, the front end can do any modeset on the
> runtime freely,
>
> including change the format of frame buffer on the runtime.  Just do not
> out-of-bound.
>
> The middle do the conversion on the fly.
>
>
> We might also create double shadow buffer size to allow the front end to
> pan?

Yeah so the front should be able to pan. And the front-end can
actually make xres/yres smalle than drm_fb->height/width, so we _have_
to use the fb side of things. Otherwise it's a bug I just realized.

The xres_virtual/yres_virtual should always match drm_fb sizes (but
we've had bugs in the past for that, only recently fixed all in
linux-next), because that's supposed to be the max size. And since we
never reallocate the fbdev emulation fb (at least with the current
code) this should never change.

But fundamentally you're bringing up a very good point, we've had
piles of bugs in the past with not properly validating the fbdev side
information in info->var, and a bunch of resulting bugs. So validating
against the drm side of things should be a bit more robust.

It's kinda the same we do for legacy kms ioctls: We translate that to
atomic kms as fast as possible, and then do the entire subsequent
validation with atomic kms data structures.
-Daniel

> > The thing is, if you change this
> > further to just pass the drm_framebuffer, then this 100% becomes a drm
> > function, which could be used by anything in drm really.
>
> I agree with you.
>
> If I use fb_width/fb_height directly and bypassing 'info->var.xres" and
> "info->var.yres",
>
> the code style diverged then. As far as I am understanding,  the clip
> happen on the front end,
>
> the actual damage update happen at back end.
>
> Using the data structure come with the front end is more reasonable for
> current implement.
>
> > But also *shrug*.
>
> I can convert this single function to 100% drm with another patch.
>
> But, maybe there also have other functions are not 100% drm
>
> I would like do something to help achieve this in the future,
>
> let me help to fix this bug first?
>
> > -Daniel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
