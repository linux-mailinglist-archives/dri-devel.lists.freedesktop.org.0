Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF8821ABF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 12:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670C210E090;
	Tue,  2 Jan 2024 11:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E04210E090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 11:16:43 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dbd990ad852so5642987276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jan 2024 03:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1704194202; x=1704799002;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wWti/H/o88GOpOazojFcH/GT+lAhOph70LWhh6aveHs=;
 b=CIfjEFj+a5zIcvtQ3KEPzGlSvNzBjGZ2PBD3+/uovaEBO9eBXr70Igs387cX14azkt
 +4NKcP0orDFjagu5ygSsoAsB3pNluHdEhxmYd8S/gdKxCcRwrPoVxJWke96nlT0CLonC
 V44T2/82GCaPsEemCycHenQwqZIVwnD2uOmhjR0nRXTKkbEiSeWcFGdxs5jJX5u1H56O
 pLypA7b75jEbSOYZd2On8/3FFHdorbhScIpD7OFSUR146+e/g1Ro3G1EQ4bUz2Erk4yS
 8h0HUTeRZVRmroz8pFQ5nAwDBMOeqh18DfqN82TCLIjm7X/iJAqvTiHQF4vJ8tTcz9oX
 u7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704194202; x=1704799002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wWti/H/o88GOpOazojFcH/GT+lAhOph70LWhh6aveHs=;
 b=nJOA3xkHQDFU7UPd2PsXxN5PHTrJXzmGbvYWKzcAtXZChBxGD170eHA7dgMv/t4+1Y
 wtgmvhrEd7ob3SdCkuQvrAevAK7Bgp2v9NETQZSmNhnUXX0sM07UIhfnpfTmO3cjQwW8
 Ga7Mx5vcgNB+P0Y6L5HHSKlJkLf/jabgkpqQoPkr+U9d2o7AbleA2rClc0xu78/IROQF
 UMPnwED5WH9c/qybJUqOIiwJfpg3bSgheLI8niPjitc/etqhMLDTFrzmeLYzcM+te9gZ
 542ZOpChtYwQ+8IDJfjeaWPAZqEfIBbftnswyUk1UM3odbmIA+uVCD3DYLtc81tzW5iu
 g/hg==
X-Gm-Message-State: AOJu0Yx+oqDR9yrqFL5GKM3RRQIVqvZD0r+3k/j7u/LSE4wMbjx4pYP6
 b8FpEiIh+zWxZCbTmgdtZGF9DN8Z02hLL1/e1ZMERAvDHl8raw==
X-Google-Smtp-Source: AGHT+IGgkTPJAWTVftZ8khgvEfBZO0u9BYhGs22AzvYrRBSBuBSGGdCHr2e2fwRmgtm7HPgahvgRKmHKyC6QlEnZRRg=
X-Received: by 2002:a25:d884:0:b0:dbd:a328:1c2f with SMTP id
 p126-20020a25d884000000b00dbda3281c2fmr8762714ybg.41.1704194202200; Tue, 02
 Jan 2024 03:16:42 -0800 (PST)
MIME-Version: 1.0
References: <7dc14b52e065177eee044348599b8b33@rmail.be>
 <pvdyykhzadinp67zppew25zekdy3pinvhton3okdex3gsvq7ex@lp7uz7dxd3rc>
In-Reply-To: <pvdyykhzadinp67zppew25zekdy3pinvhton3okdex3gsvq7ex@lp7uz7dxd3rc>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Jan 2024 11:16:28 +0000
Message-ID: <CAPY8ntA4dO_8ZypSMy3sGm9DHjugsG0fzu2z51sc7tEmAgVGBQ@mail.gmail.com>
Subject: Re: RPI4B: what is needed for /dev/video10 to work ( v4l_m2m )
To: Maxime Ripard <mripard@kernel.org>
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
Cc: AL13N <alien@rmail.be>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jan 2024 at 10:03, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Wed, Dec 27, 2023 at 04:19:19PM +0100, AL13N wrote:
> > I have a RPI4B with upstream kernel 6.1 64bit and there is no /dev/video10
> > present. I thought if I waited a bit more, it would appear in the kernel,
> > but that was folly on my part.
> >
> > Currently, watching a movie is painful since the software decoding is way
> > too slow and it has very low fps on 1080p (or even 720p or even 480p)
> >
> > IIRC, someone told me something else has to be fixed before the codecs can
> > be done, but I don't remember what it was, or i didn't find it in my
> > email/the archives.
> >
> > Can someone tell me what exactly needs to be done (in kernel) so that I can
> > take a crack at it, (hopefully with some help)?
> >
> > I don't remember if this was relevant, but there was some talk of needing to
> > use opengl output with a specific texture format for it to work? or is that
> > seperate?
>
> That's something for linux-media. The hardware codec isn't part of vc4
> or v3d, it's a separate controller that requires a separate driver (in
> v4l2).
>
> That driver isn't upstream, and that would need the first thing to
> tackle.

IdeasOnBoard are working on our behalf to clean up the VCHIQ driver in
staging (hopefully unstaging it), and adding the mmal-vchiq, vcsm, and
ISP drivers. https://patchwork.linuxtv.org/project/linux-media/list/?series=11633
is probably the latest revision of the series, but there are a number
of supporting series around too.

The codec driver relies on the same mmal-vchiq and vcsm drivers as the
ISP, so adding that afterwards should be relatively simple.

Even though he's stepped back from being a maintainer, Stefan Wahren
is still keeping track of a number of the upstreaming tasks for the Pi
platform - see https://github.com/lategoodbye/rpi-zero/issues/43

  Dave
