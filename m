Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC8CECA45
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 23:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1581210E9D9;
	Wed, 31 Dec 2025 22:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pobox.com header.i=@pobox.com header.b="KDP2a5qk";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hhUL1GXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Wed, 31 Dec 2025 22:46:11 UTC
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A210E9D9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 22:46:11 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 28130EC02B7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 17:41:01 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-01.internal (MEProxy); Wed, 31 Dec 2025 17:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1767220861; x=1767307261; bh=g1HQDG+004QOw7HhQtTVQWsurdOCDP8o
 Mv8UNRaX8nI=; b=KDP2a5qkY7iDDtjh5Th8FujprueghRAKXhlsvr2rSjU5K22I
 1PjtzxSEwFlcvyRU5vM2pQoFBBrlgKPW//c/t8kYqT1ftCF+LZQlgD0BdlU7RnRf
 2Z9k3Pv4zSdQR2wSpgpPLozoveIkoXGzxR1D4v/baNKTgx5M9DYngx/on5zsPgnA
 VhcHABCoti1q/imkPLcIw23w2n1ewQcpfgOEk1ZhKu1SNGtkY+I5BEsMNPeoBEQP
 gYYUau/cggZlHHtllH3lwRnqcxq34qXylzGtMRBpTyHLh/v4h/EgvHEHd7gjbpX+
 WCpvcZ73pDv4Wt5kPzxZLjmqfrY4uRj6R55iTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767220861; x=
 1767307261; bh=g1HQDG+004QOw7HhQtTVQWsurdOCDP8oMv8UNRaX8nI=; b=h
 hUL1GXm0Mvlw5TVPq7IlUIfqiXye42Es7JrMtwfSI8qKzyM1NTPDsVzVed1b74rH
 Htq3AZ/nWB1fHx6C1D7DrgCrk7m+3KJZ+HEO1lZ1avRmc0z4+TFDjVVlAXR1aW6E
 aDkfGJOxN888GApoiKJNSjJYWv8Bn/VTWzRjQdc7ZQZ3qMXvYC5m195ZK/HdYL3C
 N2RvWTh4idwz/A8frPp70mgZYfWqLng9Rw3yApUuMYMGxnIU7q9BnsZCS89rhMl9
 ixsycupAFfnWKdj5pbzMmAYxzBPNNqcKC5/IdC6zdMNfcVqU0eGeprHcq6ooG7y4
 4sVojM0sZhN85PPwFUPWQ==
X-ME-Sender: <xms:faZVaUeHbgF97sdRBM19WOl6cf5FcjVMF_abSyCIQNdBbv5rxlDzMA>
 <xme:faZVadJ3rddgjvkmfDpSDXJNYPD2uWgS8swf14MRA4l5euc7qay3U5x1MNPn6Oc5_
 K3B4c9uCkHeXI9BuLRNXkgLtlPAS2xgdgVA2r6ac-6BHcbT2R1big8>
X-ME-Received: <xmr:faZVabIbPbwwExF27hmzHmXdQwJ58_PhkG0eui6FayOhjhG1ZQXVeZXzrgiw7Nk460dfexJXd6vyf4IMtzg4_MKH-T0BgDwpVVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekgedufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepggfhfffkuffvtgesrgdtreertddtjeenuc
 fhrhhomhepqfhlihhvihgvrhcuifgrlhhisggvrhhtuceoghgrlhhisggvrhhtsehpohgs
 ohigrdgtohhmqeenucggtffrrghtthgvrhhnpefgueekgfetffehfefhveeuvdeihfetgf
 elheejffekteegvdejfffggeekleefveenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehgrghlihgsvghrthesphhosghogidrtghomhdpnhgspg
 hrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughrihdquggv
 vhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-ME-Proxy: <xmx:faZVafE3dFkqNfF1F2Gl1xaLTxkqIWf41m_Z5ANwEkh4L_nWqO5VsA>
 <xmx:faZVaQlND7IBq7TEPyRC6M0rBW-ovizFABlPB6-PzlSHWgYlnmmmqQ>
 <xmx:faZVacLPsCMIuED2fFfKKRIz6acujR9AE2fXaYhBuik3LzDYdCkQZg>
 <xmx:faZVaRbLx95BHIcJ_dkAxXnTBnaq0NGJVH5X1vEFiao9JZbD72AsOA>
 <xmx:faZVaeW5CyBie0Uk-lAG3lDHFxjoawXIAxdzxMdb97Xr1iRNEZVzlIue>
Feedback-ID: i28e94971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <dri-devel@lists.freedesktop.org>; Wed,
 31 Dec 2025 17:41:00 -0500 (EST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64e48264e56so5997581a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 14:41:00 -0800 (PST)
X-Gm-Message-State: AOJu0Yy8TCJ7g8QzTiB7XdDxck9VXfrtzAFepfjUophYg2qnVLilnBl1
 /y7vWf1i7Ubc5ohrYYsRuguF9H8b6QzCZnQeFfSat0VCXJZOh9z1t5I9VhQ8O+p0g/K+6ogGMr4
 BII2v8jDzsh3qAHOD9J3u0xJ5BS3R6O0=
X-Google-Smtp-Source: AGHT+IEYxD0tdaRjURqKK3vJm8pzIwRp47hf1P8DFJdW68WkKNmhaKXyKExHh3YXQq9muSjvxpO9aVNdNa4sQNBzoNw=
X-Received: by 2002:a17:907:72c2:b0:b83:246c:94a8 with SMTP id
 a640c23a62f3a-b83246cc9ecmr1807781966b.23.1767220859981; Wed, 31 Dec 2025
 14:40:59 -0800 (PST)
MIME-Version: 1.0
From: Olivier Galibert <galibert@pobox.com>
Date: Wed, 31 Dec 2025 23:40:48 +0100
X-Gmail-Original-Message-ID: <CAMFK0gsScPgpTRPL7_vjG825OPkA6ZqKnyRMXwYEWG-XV0-7KQ@mail.gmail.com>
X-Gm-Features: AQt7F2ohWYRz1RKn2tlG8Aqq93BPWYGM79vIGjK30aP5yeUzOy8mSs0YUXyLggc
Message-ID: <CAMFK0gsScPgpTRPL7_vjG825OPkA6ZqKnyRMXwYEWG-XV0-7KQ@mail.gmail.com>
Subject: How much hotplugging is actually possible in drm?
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000009956c10647472bfb"
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

--0000000000009956c10647472bfb
Content-Type: text/plain; charset="UTF-8"

  Hi,

I'm looking at drm usage, and in particular DRM_IOCTL_MODE_GETRESOURCES.
The example of use indicates that the count of crtcs, connectors or
encoders may change at any time through hotplug events.  Is it true?  I
mean, having cards come and go makes perfect sense (e.g. displaylink usb),
but internal resources of the gpu?  Do we have drivers for current hardware
that do that?  And if yes, what would the hotplug netlink event look like?

Best regards,

  OG.

--0000000000009956c10647472bfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0 Hi,</div><div><br></div><div>I&#39;m looking a=
t drm usage, and in particular=C2=A0DRM_IOCTL_MODE_GETRESOURCES.=C2=A0 The =
example of use indicates that the count of crtcs, connectors or encoders ma=
y change at any time through hotplug events.=C2=A0 Is it true?=C2=A0 I mean=
, having cards come and go makes perfect sense (e.g. displaylink usb), but =
internal resources of the gpu?=C2=A0 Do we have drivers for current hardwar=
e that do that?=C2=A0 And if yes, what would the hotplug netlink event look=
 like?</div><div><br></div><div>Best regards,</div><div><br></div><div>=C2=
=A0 OG.</div><div><br></div></div>

--0000000000009956c10647472bfb--
