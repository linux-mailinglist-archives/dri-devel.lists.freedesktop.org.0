Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE583A93D9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694FC6E51A;
	Wed, 16 Jun 2021 07:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FE16E511;
 Wed, 16 Jun 2021 07:27:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 28EA35C00BA;
 Wed, 16 Jun 2021 03:27:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 16 Jun 2021 03:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=5
 wLoBtRcBTM6aP/nxio3/pcSv35PgR9WHUl2gY8mlis=; b=FkkagzGVWDwH/YuBJ
 VH6htg/W7wFGFVnY+IIb1yqN/t41tdHG8tcCBNQCWA58Eqj4EuaHkElFhbFCB4sj
 VV7c+ZTCGrr3DPzQeJuqm3H7JMh8LD+sYJHgR+xDHjdq/jjkxe4zkWEahfQu+uuM
 C36A9/xwLlMAfmkiS8oWhpaLWHBhnCO07te/FpEMyVALBDhWAHA60nfI0+Zdbhli
 u21DC1KVZeRzbzqb8ltvWkgU5/Eq8sNrCDhYCXzgbDDWQNSVfIvRGSyP1dkwRkaz
 uFjr5/XcIIHwjPJHcvbI/yow4mgZWAyyg18cIlde4cBCfpLf3RW5Gkyb6QEDeRP2
 cHgVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=5wLoBtRcBTM6aP/nxio3/pcSv35PgR9WHUl2gY8ml
 is=; b=e+XrDst9FtyyksuxwhPLDjfwoUd2eeyjoMUe+iwUbBNFhDlKwonw+np9H
 VKAHnEKLhiGHIIJ7sD/8xBx7sAXhxIJi+GZgWUbkDnQaQV04+r+qmZSJUuhoPz7+
 j4jidsXbTN2Rqy77z/c1RhKiBdN4Fv8rsodzDUo9vGd+81rQE2c7uP7STArA4Pfw
 tDmjSeGXnRQsxcWEpXPuxtWR8fRMedOvhXxFB2uyXW/1MbRHFPBjI6zw22JgHEFj
 S+/fa4FIZZP9PDtr1NPQeAJsZ94yM4ipMROhhCQcZyt8HV6gzJMn1i7GDqggTy/i
 uoDSiuO5y6oektcqiEJLS+bT/6y2g==
X-ME-Sender: <xms:66fJYJr7GyT6_GxEHDj0H_H-qvpAvbIaSCRMn-olLJPpX94MW76Zhg>
 <xme:66fJYLqY5Enf_YVtTuiC9BGpIZH1-VrvCtosiu-8vpbF-u1kPnLO7N6r23hQ-3rkp
 n6GcQZkmVQwKjwMh8w>
X-ME-Received: <xmr:66fJYGN7ZOaL0G6hm_ZxJtEwMazZKrj7MrNmsFMaKBQcruVNEEzLNfBxuB9d6tqnNVx2xZX_SD12ymVYMF5Jlx_aWtwkNPFs54J7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkeeludfhledtieegfeelveetveegueeghfeitedttddvjefhgfevgfdt
 leegheehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:66fJYE7nyj00WQDCWl2sqUBJb4HyUDejc5-j6zvvEbm4BdtaQSbhnw>
 <xmx:66fJYI5UYLecaWAM7sBkQ5841Cv28L0_UJr2wq7MExoyacyyBVJkNg>
 <xmx:66fJYMgwyjeqGCRCtHX5AEpwEiGlc3l8PzrCxiDzzHg7H50bGgDVEg>
 <xmx:7afJYD19Jjv4olRqDwxpIjXoqdXZPqorzw63KrTOsa0kGoA8VMZjpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 03:27:39 -0400 (EDT)
Date: Wed, 16 Jun 2021 09:27:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210616072736.7lc7kiahfz7o2kod@gilmour>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <20210607074805.bmonbg5nhr4etab2@gilmour>
 <20210607110632.6ec38e38@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210607110632.6ec38e38@eldfell>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Mon, Jun 07, 2021 at 11:06:32AM +0300, Pekka Paalanen wrote:
> On Mon, 7 Jun 2021 09:48:05 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > I've started to implement this for the raspberrypi some time ago.
> >=20
> > https://github.com/raspberrypi/linux/pull/4201
> >=20
> > It's basically two properties: a bitmask of the available output pixel
> > encoding to report both what the display and the controller supports,
> > and one to actually set what the userspace wants to get enforced (and
> > that would return the active one when read).
>=20
> Hi Maxime,
>=20
> I would like to point out that I think it is a bad design to create a
> read/write property that returns not what was written to it. It can
> cause headaches to userspace that wants to save and restore property
> values it does not understand. Userspace would want to do that to
> mitigate damage from switching to another KMS client and then back. The
> other KMS client could change properties the first KMS client does not
> understand, causing the first KMS client to show incorrectly after
> switching back.
>=20
> Please, consider whether this use-case will work before designing a
> property where read-back may not necessarily return the written value.

Thanks for bringing that up. I guess the work being done currently by
Werner and his active color format property addresses that concern :)

Maxime
