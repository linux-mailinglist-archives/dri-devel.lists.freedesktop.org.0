Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0D1D0C17
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750A66E9E8;
	Wed, 13 May 2020 09:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E34B6E9E3;
 Wed, 13 May 2020 09:30:12 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id m24so9653853vsq.10;
 Wed, 13 May 2020 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t82H3vUX2i25ggjX822a43crgImwK1dH+c2aT6mGAQU=;
 b=DDgow+wDcF5/Vs69XvBRmYFEvCjRGVPKOaN6U1Rck/NKDT1KFPHuhZnspxE6NFQTRX
 6j1hO9xJEoXpkCZebREO/eibHVmmHjyKFjaK4YStCCDK1zNM7Bea4RWRARXX9cvp3XYN
 gsQjfLiyCs9RvaKmyeYQET7ZU2dQaXwWrlbbQDZ0HlgH1ZDJ1ySy9f1Pol4P6kxJGWsC
 6T5mvjSin9YfUJ431k2MyNkRUCGszwvkswEu9d+y1ixcKR2TpZjJV9GBWyr8elwEvXFa
 3dHFyGgCv5zZMD9QPolFw0G4qSvPBr5OkOs74jwd4XulbfZbLyAJrVNky5rIXUBi8/gu
 psBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t82H3vUX2i25ggjX822a43crgImwK1dH+c2aT6mGAQU=;
 b=DAJvxHSjgVo8IASAYYQT25L5xHRpxtEPiQb9cPniGJnrS0TCZWRYH6d5oG1vLmL/9D
 G3W3GnFuw9EnBA1Odw7sHK96QvRnTtORCVT5t7rdj8+MBU7J6349FWtw9YL7auYKr1Ns
 89cp9jRV6q87cCwA+vr7/hg4qNk0t8cOGwg7sOJaOPfk9AIJcAe3A4WctkEFHjZckhya
 BNWSuOUZGPkB2B2Q03WLpgTdhncTDM+iuV7q3OBBgA7FX5aA/YEgV9F0KJFKwfJBQvUW
 xXiJwIGmsi/AnBIR3JhNNm+lTu21CAGKGh94jryup5GtEjM3d+VRHDcahJ2OdQeHkzTQ
 tEsw==
X-Gm-Message-State: AGi0PuYxeI+OVQlY3GWnfTqinxrm8lL8knR58cnL2HR+nETP1HBlzDCa
 R4uLXPmGyFtw+SUl4Ojg9wRwjK/nzHHq++PxB1E=
X-Google-Smtp-Source: APiQypLq1oPGeFS3SoPpx5G/tGkP4WkRRjoA5eqEv+1Rsg9VY+t1D0jzvWiLhFC86s5lSjNdUtfzOSc3UDCw8VDG9i0=
X-Received: by 2002:a67:c482:: with SMTP id d2mr20163077vsk.37.1589362211167; 
 Wed, 13 May 2020 02:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
 <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
 <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
In-Reply-To: <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 10:27:30 +0100
Message-ID: <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 May 2020 at 20:48, Alex Deucher <alexdeucher@gmail.com> wrote:

> > >>
> > >> There's some AGP support code in the DRM core. Can some of that declared
> > >> as legacy?
> > >>
> > >> Specifically, what about these AGP-related ioctl calls? Can they be
> > >> declared as legacy? It would appear to me that KMS-based drivers don't
> > >> have to manage AGP by themselves. (?)
> > >
> > > The old drm core AGP code is mainly (only?) for the non-KMS drivers.
> > > E.g., mach64, r128, sis, savage, etc.
> >
> > Exactly my point. There's one drm_agp_init() call left in radeon. The
> > rest of the AGP code is apparently for legacy non-KMS drivers. Should
> > the related ioctl calls be declared as legacy (i.e., listed with
> > DRM_LEGACY_IOCTL_DEF instead of DRM_IOCTL_DEF)? If so, much of the AGP
> > core code could probably be moved behind CONFIG_DRM_LEGACY as well.
>
> Ah, I forgot about drm_agp_init().  I was just thinking the other AGP
> stuff.  Yeah, I think we could make it legacy.
>
Fwiw I've got local patches a) removing drm_agp_init() from radeon and
b) making the core drm code legacy only.
Will try to finish them over the weekend and send out.

Even if AGP GART gets dropped the b) patches will be good ;-)

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
