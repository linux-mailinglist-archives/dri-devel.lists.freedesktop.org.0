Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00886B4AE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3180C10E820;
	Wed, 28 Feb 2024 16:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="BUXHcGfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9BD10EA14
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1709137386; x=1709396586;
 bh=sDA3E/nyjWG2GZo3oYjGL1EpQbnwDze4vBdSxGgTTCc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BUXHcGfKzuB2zB8JGt+xoOKZnOInLPu9zHV3pvj/2n9XEz0xt6c8NhQqU7eJX0Oce
 d7e8c5IOYOduoNKj7PGgFWDWlhuRgc8EcakQZAasDnUE2BdjLXeC3tMo5T+sZOIzbl
 aDGyWx0jHMPPhPESh7/TBN60FmlcdVmBAInzVCJ6LwkVUCWL4+tawBC0OWE0GopBB/
 c3HLidwR9oKHX0FLwcvayIzv27feZz1K2l7TOejUIrHb2Gr4k7u2zFF1mC7L7LdWJ9
 N0v2fGoAmakyD/IhEhh/iqvtEmrzlNDmkSXo4eukWdERqqhSoPh7zRsPJR4M7Ia8av
 dWQ3JY0zr7UPQ==
Date: Wed, 28 Feb 2024 16:22:56 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
In-Reply-To: <20240228-nice-flat-cormorant-badff7@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 28th, 2024 at 17:14, Maxime Ripard <mripard@kernel.o=
rg> wrote:

> > I don't know what the rules were 8 years ago, but the current uAPI rule=
s
> > are what they are, and a new enum entry is new uAPI.
>=20
> TBF, and even if the wayland compositors support is missing, this
> property is perfectly usable as it is with upstream, open-source code,
> through either the command-line or X.org, and it's documented.
>=20
> So it's fine by me from a UAPI requirement side.

That is not a valid way to pass the uAPI requirements IMHO. Yes, one
can program any KMS property via modetest or xrandr. Does that mean that
none of the new uAPI need a "real" implementation anymore? Does that mean
that the massive patch adding a color pipeline uAPI doesn't need
user-space anymore?

The only thing I'm saying is that this breaks the usual DRM requirements.
If, as a maintainer, you're fine with breaking the rules and have a good
motivation to do so, that's fine by me. Rules are meant to be broken from
time to time depending on the situation. But please don't pretend that
modetest/xrandr is valid user-space to pass the rules.
