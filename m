Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46A361FAC2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F263810E4D8;
	Mon,  7 Nov 2022 17:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1F10E4D8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:04:33 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id q5so6149457ilt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvNR9QncnTRwk5plWxpGWu31yJoH55tttfWLUOkYATg=;
 b=H9Fhy5zD0j2KCdhx8xUTGHQaA14nVCpxxGKLiHrQLovbXxulae/U5cIWRYYev3yNK0
 bU6KXlWQqzHNZbrtsTfTlVLWb2M0GzGk0cagwI3uGDppHO1Q10nTlFAXs89Ci8Lmh4rw
 9SLAeeaw/XhmV3xpX2rhHrsGYmBemJrJtR0pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvNR9QncnTRwk5plWxpGWu31yJoH55tttfWLUOkYATg=;
 b=5OyBWz13B2FR9mxS/4W1dRaW1MUEu89htIT9cV+YFixHJ+lBHZ2rGa+kV6FJ3xUp2/
 xO50etJ3TPxUtmTY9AxqkPan2YgLrdMc0OIRnFENxl3uNV3z0BFtwwzhIsHE5D36ZUZu
 T684bb1w1gnz0qixvofMC+Bz6rscHNq4Id8eR8y40XwBJTsnxWvqW1EWdCM3sWuMljPl
 /H2/SvH7ByNFV4UyQGpLZs8jI7gOIb/Uyn+8PJQsAXv7omUbDrU3J78tjv/jgLnrV3Km
 96yBWLQAGYfB/znBUJgyEYrO9cfgKFsy75jOhDZxDTo5IMnmoAzrA7YerX9b6xVhKVY8
 vlUQ==
X-Gm-Message-State: ACrzQf22t3OYlbwJFS2F50gvYuVOMF5A1lV9HmPku7a7OBqJqtdp/jiB
 TKae9rxUUz4ZT5quF+VlvAXlENMP3ebNeK7BMvOAsA==
X-Google-Smtp-Source: AMsMyM5r2vRVENhxfInln9BvtxDfrbnr8vmI/k0kBPnXYCO+Q5gEl23Jq8yruwu2chMgk5b/s2JDJqpTYugw6bU6nd4=
X-Received: by 2002:a92:d681:0:b0:2ff:573c:8d44 with SMTP id
 p1-20020a92d681000000b002ff573c8d44mr29882588iln.203.1667840672574; Mon, 07
 Nov 2022 09:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
 <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
 <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
In-Reply-To: <a51ae3be-bcb2-9ae9-f7a7-31270d3b8979@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 7 Nov 2022 18:04:21 +0100
Message-ID: <CAKMK7uH3Xft8fEBCaeG3dvWXHb+xO1C45mPEKW+pasmjdPiU+g@mail.gmail.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 11:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.11.22 um 11:26 schrieb Daniel Vetter:
> > On Mon, 7 Nov 2022 at 10:43, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
> >>
> >> Hi
> >>
> >> Am 07.11.22 um 10:30 schrieb Maxime Ripard:
> >>> Hi Thomas,
> >>>
> >>> On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> >>>> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> >>>>> I've discussing the idea for the past year to add an IGT test suite=
 that
> >>>>> all well-behaved KMS drivers must pass.
> >>>>>
> >>>>> The main idea behind it comes from v4l2-compliance and cec-complian=
ce,
> >>>>> that are being used to validate that the drivers are sane.
> >>>>>
> >>>>> We should probably start building up the test list, and eventually
> >>>>> mandate that all tests pass for all the new KMS drivers we would me=
rge
> >>>>> in the kernel, and be run by KCi or similar.
> >>>>>
> >>>>> I did a first pass to create a draft of such a test-suite, which wo=
uld
> >>>>> contain:
> >>>>>
> >>>>> igt@core_auth@basic-auth
> >>>>> igt@core_auth@getclient-master-drop
> >>>>> igt@core_auth@getclient-simple
> >>>>> igt@core_auth@many-magics
> >>>>> igt@core_getclient
> >>>>> igt@core_getstats
> >>>>> igt@core_getversion
> >>>>> igt@core_hotunplug@hotrebind-lateclose
> >>>>> igt@core_hotunplug@hotunbind-rebind
> >>>>> igt@core_hotunplug@unbind-rebind
> >>>>> igt@core_setmaster
> >>>>> igt@core_setmaster_vs_auth
> >>>>> igt@device_reset@unbind-reset-rebind
> >>>>> igt@drm_read
> >>>>> igt@dumb_buffer
> >>>>> igt@fbdev
> >>>>
> >>>> Maybe we make this test optional? At least sprd decided to not suppo=
rt fbdev
> >>>> at all.
> >>>
> >>> I'm not sure we need to make that test optional, or at least, we shou=
ld
> >>> run it all the time, but skip it if there's no fbdev emulation, and n=
ot
> >>> report it as a failure?
> >>
> >> Sure. I just meant that fbdev support shouldn't be a blocker. If there=
,
> >> it should work of course.
> >
> > Not supporting fbdev looks more like an accident than intention here,
> > and maybe a good reason to have these kind of must-past lists.
>
> No. Back then, I specifically asked the developer, Kevin Tang IIRC,
> about fbdev/console support and he replied that he has no intention of
> adding it.
>
> It's the only driver without fbdev, but as we don't have such a
> requirements AFAIK, I left it at that.

It does hurt a bit the sales pitch that a drm-kms driver is the
one-stop-shop for display driver needs, and so I'd only do this if
there's some technical reasons why fbdev just wont work (like no hw
support for formats fbdev supports or something), and not just because
the vendor has no need for this right now. Otoh it's generally just
one line to add if the driver works correctly, so ...

*shrug*

Cheers, Daniel

>
> Best regards
> Thomas
>
> > Eventually, once the i915-ism is worked out of igt well enough for a
> > set of tests at least. The drm/ci effort should help in building up
> > that list (by essentially extracting the common set of tests that
> > everyone passes and graduating that to the must-pass list for kms
> > conformance or whatever we'll call it).
> > -Daniel
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Maxime
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
