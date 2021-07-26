Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08943D55B1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0626E870;
	Mon, 26 Jul 2021 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D916E870
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:34:17 +0000 (UTC)
Date: Mon, 26 Jul 2021 08:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627288454;
 bh=yhbVoCAmox2vAgFyrpH3nKND6IGvOGE2Ka3jEaYL794=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kobmVOd31Q843C/LT0KgJqaYJ13sEvv840MJqZ0x0+fw29kyRhqwA3LCWJXHutV0b
 VG4Xw0uTzORlJp2r20s1vIEJQGZ9HD/V7VUXU7QB4VCOerSvrNgd+HN2KLeOKlf0vM
 aTvDhGh7al3NxHvOhZJIQGbAqe8O0lKus0Qzg8AcJBeO0oolOorPGKbxLsUQctwBvq
 mjf7frWDQOz0D0hNx0o7Eo9aNas8wjdDBcuNAwYlBxvFmNWMKZAPGB4HAVUM9y4Tze
 Rs5E+1fh/eCjFsfdDMf0A7nYXLR0s1ca9gs1URwaL6MbqYlCWBbMat10M4JdWB9pdE
 NJbPJ7vfjt9cw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_property
Message-ID: <QjQOQBq4Tf992ih6qPcE1Rw5VNKcjiPbctKkIBBbwFgudHtGSlI8-sNjPVLBUBfNIEbjlQFUa_oab6AGMPmyrQ656Hc2HOdBxLef7QCf5bw=@emersion.fr>
In-Reply-To: <YPgHeJ4gcKI1YaUa@phenom.ffwll.local>
References: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
 <YPgHeJ4gcKI1YaUa@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 21st, 2021 at 13:39, Daniel Vetter <daniel@ffwll.ch> wro=
te:

> I think it would be really good to link to
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#modeset-base-object=
-abstraction
>
> for all the property related ioctl. That entire class vs instance
> confusion is pretty common I think, which is why I even made a nice
> picture about it :-)

I cannot figure out how to link to that page after blindly trying a bunch o=
f
magical Sphinx invocations. I must say, links aren't RST's forte, inserting
them is as intuitive as mud.

Does anyone know how to do it?
