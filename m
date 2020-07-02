Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E20211D1A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED7C6E51C;
	Thu,  2 Jul 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611846E51C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:36:41 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t198so10355389oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FsHECmH34HAntg3dstt1YGzFECGsABxoC49cUDBrcU=;
 b=TQ4ehxP7BJbr9mopAR414qKLO8bJUiKApfKdTjiZC2awjIaI7jXRoIPITXDaWmEydy
 TGO7gP3COW1H71+Mtlgu6Tc2McuggJhKjDw/jd5visI5bFNUT84AAbCznADj8qX+fQXx
 CVmOrm6nz4SlCrQIDr+eWsizmp7eBo9YRt90A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FsHECmH34HAntg3dstt1YGzFECGsABxoC49cUDBrcU=;
 b=IifKkMjAPMFQJbyaPfIGHaNMoSshfdM40Ds4TFoVPFzFT4az1uSbjMBRxgH9OT9grw
 Y3ugEdVv/Jt454Vs9X/4Hwu5X3G7FslzFlygC5TzpcvTfk/J6FN61pqJbjuzCY1wbQTO
 0ZAn+SO/sHmxmVE5+i93drxorB4NverlzDe6Ngk/DDZg0T7u5enx8rMVHWYRMPIEQ7to
 DR3KwhNotr1NuPb5uA9kebPJCaw5O5K/ONrzRpQopC3lDG5krcxRKRaA2HbVNbeKN14Q
 8o2hMGycfWWq11cWz2oiiX0ryCQgX/m3+Aq+macvO46CDA4x0sdhttf1kwFBgFkKvlYo
 S/Zg==
X-Gm-Message-State: AOAM532W50o6DO15I8c8U1TnfD4feEkv8U8Ag4FU3g8kq8AMazGb1Yv9
 MMUDMszSDVVO5Sw1zWCes6Zi9O8eadl2ZTfLY3hP/Q==
X-Google-Smtp-Source: ABdhPJwAujqbEPdBrqDKTWbkFKE6PCpXce8tnzumMJPKj2uYw2G9tUKVRgJEYqquq0aQcapNXIWcNA8YRwwT62yRVhs=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr6840160oic.101.1593675400631; 
 Thu, 02 Jul 2020 00:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
In-Reply-To: <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 2 Jul 2020 09:36:29 +0200
Message-ID: <CAKMK7uGJW7S6msS6MzxMAzNoUvfcZbajhc8rhD39d4TUk4Vx8w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
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
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 1, 2020 at 9:45 PM James Jones <jajones@nvidia.com> wrote:
>
> OK, I think I see what's going on.  In the Xorg modesetting driver, the
> logic is basically:
>
> if (gbm_has_modifiers && DRM_CAP_ADDFB2_MODIFIERS != 0) {
>    drmModeAddFB2WithModifiers(..., gbm_bo_get_modifier(bo->gbm));
> } else {
>    drmModeAddFB(...);
> }
>
> There's no attempt to verify the DRM-KMS device supports the modifier,
> but then, why would there be?  GBM presumably chose a supported modifier
> at buffer creation time, and we don't know which plane the FB is going
> to be used with yet.  GBM doesn't actually ask the kernel which
> modifiers it supports here either though.  It just goes into Mesa via
> DRI and reports the modifier (unpatched) Mesa chose on its own.  Mesa
> just hard-codes the modifiers in its driver backends since its thinking
> in terms of a device's 3D engine, not display.  In theory, Mesa's DRI
> drivers could query KMS for supported modifiers if allocating from GBM
> using the non-modifiers path and the SCANOUT flag is set (perhaps some
> drivers do this or its equivalent?  Haven't checked.), but that seems
> pretty gnarly and doesn't fix the modifier-based GBM allocation path
> AFAIK.  Bit of a mess.
>
> For a quick userspace fix that could probably be pushed out everywhere
> (Only affects Xorg server 1.20+ AFAIK), just retrying
> drmModeAddFB2WithModifiers() without the DRM_MODE_FB_MODIFIERS flag on
> failure should be sufficient.  Still need to verify as I'm having
> trouble wrangling my Xorg build at the moment and I'm pressed for time.
> A more complete fix would be quite involved, as modesetting isn't really
> properly plumbed to validate GBM's modifiers against KMS planes, and it
> doesn't seem like GBM/Mesa/DRI should be responsible for this as noted
> above given the general modifier workflow/design.
>
> Most importantly, options I've considered for fixing from the kernel side:
>
> -Accept "legacy" modifiers in nouveau in addition to the new modifiers,
> though avoid reporting them to userspace as supported to avoid further
> proliferation.  This is pretty straightforward.  I'll need to modify
> both the AddFB2 handler (nouveau_validate_decode_mod) and the mode set
> plane validation logic (nv50_plane_format_mod_supported), but it should
> end up just being a few lines of code.
>
> -Don't validate modifiers in AddFB.  This doesn't really gain anything
> because it just pushes the failure down to mode set time, so it's not
> that useful, so I don't plan on pursuing this.
>
> As noted, need to run just now, but I should have a kernel patch to test
> out either tonight or tomorrow.
>
> If anyone's curious, the reason my testing missed this was I did most of
> my verification of "old" code against the Xorg 1.19 build included with
> my distro.  I did hack up a Xorg 1.20-ish build to test as well that
> would have included this path, but I must not have properly configured
> it with GBM modifier support somehow.  I was pretty focused on just
> testing the forcibly-disabled atomic path in the modesetting driver in
> this build, so I didn't look too closely at things beyond that.

Yeah, so modifier support in -modesetting is totally broken. It should
be disabled by default because the stuff just doesn't really work.

If that doesn't help then I guess we need to do the same thing as what
we've done for atomic already in:

commit 26b1d3b527e7bf3e24b814d617866ac5199ce68d
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Sep 5 20:53:18 2019 +0200

    drm/atomic: Take the atomic toys away from X

For added insult for the atomic stuff: Xorg master branch is actually
fixed, but no one has done a release of that in over 2 years, so the
fixes never got anywhere. I have little hope the Xorg will get back
into shape, seems abandoned unfortunately.
-Daniel

>
> Thanks,
> -James
>
> On 7/1/20 12:59 AM, Kirill A. Shutemov wrote:
> > On Wed, Jul 01, 2020 at 10:57:19AM +0300, Kirill A. Shutemov wrote:
> >> On Tue, Jun 30, 2020 at 09:40:19PM -0700, James Jones wrote:
> >>> This implies something is trying to use one of the old
> >>> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> >>> first checking whether it is supported by the kernel.  I had tried to force
> >>> an Xorg+Mesa stack without my userspace patches to hit this error when
> >>> testing, but must have missed some permutation.  If the stalled Mesa patches
> >>> go in, this would stop happening of course, but those were held up for a
> >>> long time in review, and are now waiting on me to make some modifications.
> >>>
> >>> Are you using the modesetting driver in X? If so, with glamor I presume?
> >>
> >> Yes and yes. I attached Xorg.log.
> >
> > Attached now.
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
