Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C9319B33
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2A6E532;
	Fri, 12 Feb 2021 08:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D168B6E532
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:27:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v1so3324434wrd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nkQB7fQz1SUeSfVdwOpJWrzPaD7OcGNtSfRRSX6AyDE=;
 b=lh71PKNULKyfbZwBerIDfxo+WIp5WMl1b6V2nySVckFa5G6q+yNQdP8yl43kvmm6h4
 NXWI7W+UFctBqe77+lXxq40o7xQcTt7ekxodrwa3f3VH42my9KoIV3wuh46OwDizPWB1
 Tco2JXLsMaaxtTMz9pJEWr7ITaPjylK1Q5eo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nkQB7fQz1SUeSfVdwOpJWrzPaD7OcGNtSfRRSX6AyDE=;
 b=ROIKDJc2dX1CWSvuCC7AXh9CZl8LpPNfuV9klsNxmH3nAPCa53fxUSYgTu0N+jXlZQ
 ubDxlofZWTrjSFBYxfe72cn/RJvBtqsJRcbuSFHIIHcTZUkbmLQaoL3gjtJ62sPFqETp
 QvY4vLa80Z5Htxd6f/0vwfgVypmchaVPPoJuPW7KYuwOrj+OOhyJv560/gjJ6GUcv7/r
 WZnO2zjW/Mf01lZwSXrSwIpi4FhMIm/Jnylm8hQobXsKeLTU4+uUw7ZuB9+5AmDOq0Vy
 7A0Y3Lw4ZFwqGt5DvZh8J2C/+4kadqrlewZNcmZXjFg2uMSOtwbgf7VBIVgGl9J0dwMz
 NlAA==
X-Gm-Message-State: AOAM531VefdpRjhtog9VWS0Jc2W9e+m1OZwIMMUNVzSpxqFq7+m8czG3
 iFaFxKicf3qQUkBGxwDoZS4aow==
X-Google-Smtp-Source: ABdhPJxtLzLzwmsnIEoeacUxyWsGZkwB/W6pBDAKk6zgenFqNUANNeB4QheLVkgdiGXPFAh7wUTOqA==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr2106647wru.111.1613118451417; 
 Fri, 12 Feb 2021 00:27:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v204sm13855104wmg.38.2021.02.12.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 00:27:30 -0800 (PST)
Date: Fri, 12 Feb 2021 09:27:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Not 100% sure if I correctly fixed drm-tip
Message-ID: <YCY78eKShg4/gfFx@phenom.ffwll.local>
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
 <87o8gqd4vw.fsf@intel.com>
 <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
 <CAKMK7uEAMST0dOzFDuRYoDh=QgGDQm-7qepfaF+wAnJwbSTGzw@mail.gmail.com>
 <64da0f52-e2e9-b7cb-d104-52079896041a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64da0f52-e2e9-b7cb-d104-52079896041a@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 12, 2021 at 08:51:19AM +0100, Christian K=F6nig wrote:
> =

> =

> Am 11.02.21 um 18:22 schrieb Daniel Vetter:
> > On Thu, Feb 11, 2021 at 4:27 PM Christian K=F6nig
> > <christian.koenig@amd.com> wrote:
> > > =

> > > =

> > > Am 11.02.21 um 16:02 schrieb Jani Nikula:
> > > > On Thu, 11 Feb 2021, Christian K=F6nig <christian.koenig@amd.com> w=
rote:
> > > > > Hi guys,
> > > > > =

> > > > > I had a conflict this morning in the ttm pool while pushing an im=
portant
> > > > > fix to drm-misc-fixes.
> > > > > =

> > > > > I'm not 100% sure if I correctly fixed up drm-tip. How can this be
> > > > > double checked? And how can it be fixed if the merge has gone bad?
> > > > I'm afraid there's a problem; bb52cb0dec8d ("drm/ttm: make the pool
> > > > shrinker lock a mutex") in upstream and drm-misc-fixes creates a si=
lent
> > > > conflict with ba051901d10f ("drm/ttm: add a debugfs file for the gl=
obal
> > > > page pools") in drm-misc-next, causing the latter to use
> > > > spin_lock/unlock on a mutex.
> > > > =

> > > > But while you hit a conflict, it does look like the conflict breaki=
ng
> > > > the build is silent, AFAICT the spinlock part does not conflict. So=
 a
> > > > fixup patch in drm-rerere is probably needed until there are some
> > > > backmerges.
> > > Well exactly that's the issue. I've already had a fixup in drm-rerere
> > > for this.
> > > =

> > > But today I've pushed another fix to drm-misc-fixes which also confli=
cts
> > > with ba051901d10f ("drm/ttm: add a debugfs file for the global page p=
ools").
> > > =

> > > I've fixed this up as well and committed the solution. But dim then
> > > complained that the original fixup is now not applicable any more (wh=
ich
> > > is true as far as I know).
> > > =

> > > This somehow went away when I said that dim should assume patch
> > > reversal, but I'm not sure if that's the right thing to do.
> > Nothing, it's all still broken. You need to delete the now unecessary
> > fixup. As a rule, when rebuilding drm-tip failed always try again to
> > confirm that what you've done actually fixed things (since sometimes
> > git can also not remember where to apply the resolution for some odd
> > reasons).
> =

> My question is how to I remove the fixup now?
> =

> E.g. where can I find it?

In the rerere branch under the fixup/ directory. That's also the place
where rerere solutions are carried around. I guess docs don't explain this
well how drm-tip is rebuilt :-/
-Daniel
> =

> Thanks,
> Christian.
> =

> > =

> > I'm fixing this now.
> > -Daniel
> > =

> > > Thanks,
> > > Christian.
> > > =

> > > > =

> > > > BR,
> > > > Jani.
> > > > =

> > > > =

> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
