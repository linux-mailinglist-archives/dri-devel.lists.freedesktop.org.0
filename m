Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C5211E25
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBA26E52D;
	Thu,  2 Jul 2020 08:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B696E52D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 08:22:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s10so27048360wrw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3t9GLwryJTaOdXMZTnjC4mjz71cq4jtvm6cibUFNxhQ=;
 b=L0zwwvq4BVdjvUIxi+uPw5MuIa6xxrKv8PXWwwOqBnqQQayVI8X4r7GkFILmCbJVyx
 mGgsy107fK8syh3GtAmoXiKVwyVnUX5lFUIp3s9ZYD4uD3Yx903cMfVj48UJTzTmUTqh
 vKf8CinW3GqwTCffXrOsQH08fw02qBc+ShhaX3aMyDutoBmCQelhqd/pK9U9prEpvsyD
 4mnkRzzurB/44dgQElYhlUjjV4Qh0YcqpRbdA2sxhXAlW2fR9j1XcDe9jT6ErKzD7sWH
 HBcord3lfJqekNCuTV0MWM8j/1Po4uHSF5gpOIrseByAyfBFfmb/R0id4E+U7V7joXar
 cH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3t9GLwryJTaOdXMZTnjC4mjz71cq4jtvm6cibUFNxhQ=;
 b=rp3RjNE6qI2BkzbLnJkGuyXCGyyjSM+92QQqcFFSAOlmNmVo1qkS0I+XVT4P2Djd1h
 LsSRvmOOz1dHMbjNhsafh7R3VptVHjDD6mjA3dO8RucOUTEA5ilvxv1lbH1TvnFpFJq8
 oIqMgWgBJVocape2IStOjwwM/jDKiAWVuka/R/fZXx0hmpYmAjRISgRQKCZ6TMC034yX
 ZB9am/SwCSzOBuReUL9kxcXahTL7RlOXSk2csggz6aoTG1RMER/zayi7srlbObU1ST+N
 oVkV3sYbfZ/bEasfMr0NzwOfQFouu27e5q6QQTZzgb9nh2Tj5mKpUVRyC85wzjpzDsj1
 ESRw==
X-Gm-Message-State: AOAM5302xeyYr2+AbKBNF/xQcT6J/gAkkCY0ybN1E8QvcrBc2+3CSbob
 j1mRrIfvhpf5BmDCROzzYJl2lXewNdOJaKSiG+KIpF9O6lU=
X-Google-Smtp-Source: ABdhPJyIghecqPkmAYT+NI4s3yizDvT3Zx51BClqfp89CAi6K5ZYAPyQ1gPIGKCHrwC6RltmFFPoxv5AIS11N9RWTM0=
X-Received: by 2002:a5d:6288:: with SMTP id k8mr29524832wru.373.1593678163746; 
 Thu, 02 Jul 2020 01:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
In-Reply-To: <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 2 Jul 2020 09:22:32 +0100
Message-ID: <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 1 Jul 2020 at 20:45, James Jones <jajones@nvidia.com> wrote:
> OK, I think I see what's going on.  In the Xorg modesetting driver, the
> logic is basically:
>
> if (gbm_has_modifiers && DRM_CAP_ADDFB2_MODIFIERS != 0) {
>    drmModeAddFB2WithModifiers(..., gbm_bo_get_modifier(bo->gbm));
> } else {
>    drmModeAddFB(...);
> }

I read this thread expecting to explain the correct behaviour we
implement in Weston and how modesetting needs to be fixed, but ...
that seems OK to me? As long as `gbm_has_modifiers` is a proxy for 'we
used gbm_(bo|surface)_create_with_modifiers to allocate the buffer'.

> There's no attempt to verify the DRM-KMS device supports the modifier,
> but then, why would there be?  GBM presumably chose a supported modifier
> at buffer creation time, and we don't know which plane the FB is going
> to be used with yet.  GBM doesn't actually ask the kernel which
> modifiers it supports here either though.

Right, it doesn't ask, because userspace tells it which modifiers to
use. The correct behaviour is to take the list from the KMS
`IN_FORMATS` property and then pass that to
`gbm_(bo|surface)_create_with_modifiers`; GBM must then select from
that list and only that list. If that call does not succeed and Xorg
falls back to `gbm_surface_create`, then it must not call
`gbm_bo_get_modifier` - so that would be a modesetting bug. If that
call does succeed and `gbm_bo_get_modifier` subsequently reports a
modifier which was not in the list, that's a Mesa driver bug.

> It just goes into Mesa via
> DRI and reports the modifier (unpatched) Mesa chose on its own.  Mesa
> just hard-codes the modifiers in its driver backends since its thinking
> in terms of a device's 3D engine, not display.  In theory, Mesa's DRI
> drivers could query KMS for supported modifiers if allocating from GBM
> using the non-modifiers path and the SCANOUT flag is set (perhaps some
> drivers do this or its equivalent?  Haven't checked.), but that seems
> pretty gnarly and doesn't fix the modifier-based GBM allocation path
> AFAIK.  Bit of a mess.

Two options for GBM users:
* call gbm_*_create_with_modifiers, it succeeds, call
gbm_bo_get_modifier, pass modifier into AddFB
* call gbm_*_create (without modifiers), it succeeds, do not call
gbm_bo_get_modifier, do not pass a modifier into AddFB

Anything else is a bug in the user. Note that falling back from 1 to 2
is fine: if `gbm_*_create_with_modifiers()` fails, you can fall back
to the non-modifier path, provided you don't later try to get a
modifier back out.

> For a quick userspace fix that could probably be pushed out everywhere
> (Only affects Xorg server 1.20+ AFAIK), just retrying
> drmModeAddFB2WithModifiers() without the DRM_MODE_FB_MODIFIERS flag on
> failure should be sufficient.

This would break other drivers.

> Still need to verify as I'm having
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

I do think that they should also be reported to userspace if they are
accepted. Other users can and do look at the modifier list to see if
the buffer is acceptable for a given plane, so the consistency is good
here. Of course, in Mesa you would want to prioritise the new
modifiers over the legacy ones, and not allocate or return the legacy
ones unless that was all you were asked for. This would involve
tracking the used modifier explicitly through Mesa, rather than
throwing it away at alloc time and then later divining it from the
tiling mode.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
