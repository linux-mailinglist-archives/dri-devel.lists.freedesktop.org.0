Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E136A58F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E489210E186;
	Tue, 28 Feb 2023 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B1410E186
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:21:37 +0000 (UTC)
Date: Tue, 28 Feb 2023 12:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677586895; x=1677846095;
 bh=x8O/VQy0c5ETFA/kPJk19yJKWyngD0+xwD0oACxNkns=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WRoYR7GE5VU/G2Evat37F4sBAEiFJ63I8ga+ifl9+STL68PaMfpBb+FxRGQSs5RTy
 LqR2IJ73aP0NWw5OXQiAMV3B3jJbIg0S+/Vk+WwjUELAgcfjMnry5O7qE0J3xzWpKM
 ubvOYhLD9oZNiA7EfNu0t+Ks24BDSIoo0wQWK9LwYZrRHLSAhJr3it3mSXB5FxYPWB
 ennOqTMw+r2EZL7bjhEYVJoR1uM58cRt0b35VPleRWeR5Er02RjDha7oxNR5FzJIZv
 AK1IsS0mDzCyGLcFIwpMKuRQsO5z+2jUCO38FUzXFlVzOPVGQuUATRVqfTRftH+Kth
 br+PVyba7XAlQ==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <31r-KgkSYJY15C-LmpPJLpt2Er_Mr3MDqyaXj9Koj2jH-3qfx7aRqsIgCzQl8yBXHM_9L1UKMQ07UHYplmoV-3tbqDuFTVQkVQ-WXUME21Y=@emersion.fr>
In-Reply-To: <Y/3lcEq5y2SrUYyA@intel.com>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell> <Y/3lcEq5y2SrUYyA@intel.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 28th, 2023 at 12:28, Ville Syrj=C3=A4l=C3=A4 <ville.sy=
rjala@linux.intel.com> wrote:

> > > > Is this instead not scaling anything but simply sending metadata
> > > > through the connector?
> > >=20
> > > No metadata is sent. This is purely equivalent to setting up CRTC_*
> > > properties to scale the planes.
>=20
> My wip HDMI/DP patches do set the AVI inforame "bars" based on
> this. I think vc4 is already doing that as well.

Eh. Indeed it does, via drm_hdmi_avi_infoframe_bars().
