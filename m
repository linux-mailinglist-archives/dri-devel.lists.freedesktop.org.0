Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A82F7724
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 12:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC9A89B57;
	Fri, 15 Jan 2021 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353889B57
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 11:06:01 +0000 (UTC)
Date: Fri, 15 Jan 2021 11:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1610708758;
 bh=N/sH6rig+uVVViywcq0nAaYzVcO9pb5G6PCzlBRo7A4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SCe+LDPsOnogLZh4QV2R0bzyEYlTnrwVSnWOsD6FwL3sYwc//DI72V74enmc0lAar
 UVLaW3/FZtpoPunGhHSWG1D+UhFoQRl1XDi9US84s0xxc6G1nPA14rx+X9SMofOx/E
 7PH5T0qzg/th9OK+HkGOmlajLxwdbDzBzIe4xazS/7Lw4B3N1cIMi5xMCMvTHd76HY
 FTMdfaS8LKvfsVcNHByjg3fb0ldua+qLqxELzg2/mVTKMTHrYgJlCZO0WC9cn3PnV5
 +Jn8ryOS+UqZz95pu/e5LOBsd01bcHvLn0pkIDNcIDDguHZs8s5+fujB26mdXb3LN1
 +DVelYE3cCwVA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 2/5] drm/doc: document the type plane property
Message-ID: <P9LiAZrbvSONX_tx4jjrn8n_00rDsAQlbxgWNrK1cO9L9BEKYM1y_4qH8Zo3_Oihtj88PVxxS1a38-3AgeHFvD5iJlDuCnVo2ZK6_nPaMs4=@emersion.fr>
In-Reply-To: <X+H7qJI6gqPa57tL@phenom.ffwll.local>
References: <20201222133524.160842-1-contact@emersion.fr>
 <20201222133524.160842-3-contact@emersion.fr>
 <X+H7qJI6gqPa57tL@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, December 22nd, 2020 at 2:59 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > + * type:
> > + *     Immutable property describing the type of the plane.
> > + *
> > + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
>
> s/UNIVERSAL_PLANES/ATOMIC/ here?
>
> With just universal planes you don't have atomic test-only. But I guess it
> also works as-is, I'm just not entirely clear what you want to state here.

Right. This paragraph was written when I wasn't aware about ATOMIC implicitly
enabling UNIVERSAL_PLANES. Fixed in v5.

> > + *     capability, the plane type is just a hint and is mostly superseded by
> > + *     atomic test-only commits. The type hint can still be used to come up
> > + *     more easily with a plane configuration accepted by the driver. Note that
> > + *     &DRM_CLIENT_CAP_UNIVERSAL_PLANES is implicitly enabled by
> > + *     &DRM_CLIENT_CAP_ATOMIC.
> > + *
> > + *     The value of this property can be one of the following:
> > + *
> > + *     "Primary":
> > + *         To light up a CRTC, attaching a primary plane is the most likely to
> > + *         work if it covers the whole CRTC and doesn't have scaling or
> > + *         cropping set up.
> > + *
> > + *         Drivers may support more features for the primary plane, user-space
> > + *         can find out with test-only atomic commits.
> > + *
> > + *         Primary planes are implicitly used by the kernel in the legacy
> > + *         IOCTLs &DRM_IOCTL_MODE_SETCRTC and &DRM_IOCTL_MODE_PAGE_FLIP.
> > + *         Therefore user-space must not mix explicit usage of any primary
> > + *         plane (e.g. through an atomic commit) with these legacy IOCTLs.
>
> Empty line here for reading comfort in plain text? Same below.
>
> Since you mention formats below, I also wonder whether we should state
> here that xrgb8888 is generally supported, worst case through software
> emulation. That's defacto the uapi we have to adhere to.

I wonder. If a new driver decides not to support XRGB8888, that wouldn't be a
kernel regression because it's about new hardware. Do we want to formally lock
future drivers into XRGB8888 support? Or do we want to open the door for a
driver to break this assumption, even if most user-space won't work on the new
hardware?

I guess all of this is mostly theoretical at this point.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
