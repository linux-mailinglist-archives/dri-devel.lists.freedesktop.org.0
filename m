Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F15B36B0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE2A10ECC6;
	Fri,  9 Sep 2022 11:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF62310ECC4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:50:18 +0000 (UTC)
Date: Fri, 09 Sep 2022 11:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1662724216; x=1662983416;
 bh=KPpsRZy91Gqwaiw4XQ3qxm0CiR0of3gIHsAxlof9gzU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=HmWYYhS/VQ5p65NTlb9Ro2WXOEoQuBo32vO2ji8PsHo3RDjEFraYcehZ4Udeu2q2o
 fLuzwrDwMODs2htTGxVn23a5eH1fGxMeA805bWdOhQoMFmLdXO3Z/pyHFvaItcuszK
 deVZRHPmht7QUX2GKfv0gfSKSrN09xqUBTbCSc6Y23caSFmgzK9hLsV5vS9XbGNabr
 4FKG51+7rEmD7x5VrOmuyV4il+d+h5BXBB0ZPju4qBtO06nAEMWTW1w5E1xuPaw5iG
 XrKiFQHquNV8tox/41v3IDJsxNwJxDhhIJzMhRm9Uvy5diZ4wTeOMmnca25h/wvBDw
 Y87W9I7ki7NiQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Meeting (BOF) at Plumbers Dublin to discuss backlight brightness
 as connector object property RFC?
Message-ID: <bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe1wMd_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=@emersion.fr>
In-Reply-To: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
References: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 9th, 2022 at 12:23, Hans de Goede <hdegoede@redhat.com=
> wrote:

> "people using
> non fully integrated desktop environments like e.g. sway often use custom
> scripts binded to hotkeys to get functionality like the brightness
> up/down keyboard hotkeys changing the brightness. This typically involves
> e.g. the xbacklight utility.
>=20
> Even if the xbacklight utility is ported to use kms with the new connecto=
r
> object brightness properties then this still will not work because
> changing the properties will require drm-master rights and e.g. sway will
> already hold those."

I don't think this is a good argument. Sway (which I'm a maintainer of)
can add a command to change the backlight, and then users can bind their
keybinding to that command. This is not very different from e.g. a
keybind to switch on/off a monitor.

We can also standardize a protocol to change the backlight across all
non-fully-integrated desktop environments (would be a simple addition
to output-power-management [1]), so that a single tool can work for
multiple compositors.

Simon

[1]: https://gitlab.freedesktop.org/wlroots/wlr-protocols/-/issues/114
