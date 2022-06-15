Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A5B54C38E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 10:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926D510EAA2;
	Wed, 15 Jun 2022 08:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0910EDCC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 08:33:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 060C8320092F;
 Wed, 15 Jun 2022 04:33:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Jun 2022 04:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655281982; x=
 1655368382; bh=0gy8aZM/I9isBleZ7hdd5CDRJFuUasnafd79eIVeaOc=; b=p
 R5xE6JCABKTjjPidp0ZzVdHOBfr3ALAy5JF5VR96wIlAgoTS2eYylGDBwZb9D6ds
 Dr80KuXFaz5h492gMQp9Ox3XOv7srv5Gv3M8relMdwpCIfLfjEjy3WaXGL+wsITg
 V5/gBq2Haf8LzrgtuETdTEJr2PDbYQdtMdzYT1sEXdQwKmTehPrH1UiU/TBA3CIO
 rN7YpwZJt8GstIqG6/AedqCEsv5RWoVg+u1i5NOr+4pbyA1Ro86UWz+7/J9fDWFJ
 Eu4sx7S1y+/6F4xyMp58UOw5i7uYZx3TWSKsnGEdWSWsOYErVE7mVwHOWFtb+h7I
 VT3OyDyLxKrzg4mISg0Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655281982; x=
 1655368382; bh=0gy8aZM/I9isBleZ7hdd5CDRJFuUasnafd79eIVeaOc=; b=Q
 5Q68Kgyyt7kTW5jFXeqllV5NOdBTrt/OC5K+0rAob7d8nV0TQLoYFT1oMNWp/7D1
 VbrholpmJwpW+Pl1LmT68ByH3z7BPESmtOwzGj7coF+jas/xqL5xeR7/q4KKZvz4
 r4s7T94Mq2QZfJrGX5RjzYSCLKMQZMWhQIDaH/vZGzM3xGgAlgqXLQK+ki/+7MoE
 pRTYk3vyAAnLr7ILVKJPKSUvLXJYjA/fb7t7oOUfDLiNXSXkKgGlXHEXY/Y3ge1h
 4oDxlFuhCd2wivgn0CnzkCy3JOFG8jiDM3xJFD6KEqce5Jkam01ScOXSqJOMHtRp
 j1oMJIRZIBWAcIuUyuweA==
X-ME-Sender: <xms:PpmpYhO9Ic8WVi7HznlMC5tUKZESFfm3Ydm11B4XSRwRo2irFXeKiw>
 <xme:PpmpYj-vtpCmXWSyDpjPEWPi5DDrFZmRH4jW4m_sf0rdxPeM8nrUNkCK6t-oJoqYq
 5t0-h54495Bmrom5NA>
X-ME-Received: <xmr:PpmpYgSQr-bRkxrHzvF10pY8CWDUgauaMkVG5Ro98yAWnLYGao-8IiHuy9QsLCK-Xe_0C0Tqjapcx5m14D8kLdIZsG-xiAT5e_DOclE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkeehvdduieffjedtgfdvtdeuleejhfffkedtheejffehueeigeelgeef
 teejteffnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlih
 hnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PpmpYttVt3S7x4-lA0qgQlmmSZcCGivvH-XrV2jNzgEA7LU2BPndvA>
 <xmx:PpmpYpcUWrXokN6xQZimLXLlik9nysUhtTSTIQGlWlQ6AqegzjnJdA>
 <xmx:PpmpYp0K9ZOLRr4BWa9lfBXNpvvYxO76vqXt8Vaek0wcyqwLSGKjHA>
 <xmx:PpmpYqp9BNNh4Lhp742YfxrPNKzZSmXhL4CSWvE9LHhae34CG1Pv3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 04:33:01 -0400 (EDT)
Date: Wed, 15 Jun 2022 10:32:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <20220615083259.nvf46giedkmr5buj@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
 <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
 <20220614120952.b32i46qfz476mspq@houat>
 <4ae26a1a-9f53-8db6-634b-c5405971e1b1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4ae26a1a-9f53-8db6-634b-c5405971e1b1@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 09:22:55AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 14.06.22 um 14:09 schrieb Maxime Ripard:
> > On Tue, Jun 14, 2022 at 01:47:28PM +0200, Thomas Zimmermann wrote:
> > > Am 14.06.22 um 11:04 schrieb Maxime Ripard:
> > > > On Tue, Jun 14, 2022 at 10:29:20AM +0200, Thomas Zimmermann wrote:
> > > > > Am 14.06.22 um 09:37 schrieb Maxime Ripard:
> > > > > > Hi Thomas,
> > > > > >=20
> > > > > > On Mon, Jun 13, 2022 at 01:23:54PM +0200, Thomas Zimmermann wro=
te:
> > > > > > > Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > > > > > > > The DRM-managed function to register a CRTC is
> > > > > > > > drmm_crtc_alloc_with_planes(), which will allocate the unde=
rlying
> > > > > > > > structure and initialisation the CRTC.
> > > > > > > >=20
> > > > > > > > However, we might want to separate the structure creation a=
nd the CRTC
> > > > > > > > initialisation, for example if the structure is shared acro=
ss multiple
> > > > > > > > DRM entities, for example an encoder and a connector.
> > > > > > > >=20
> > > > > > > > Let's create an helper to only initialise a CRTC that would=
 be passed as
> > > > > > > > an argument.
> > > > > > >=20
> > > > > > > Before I review all of thes patches, one question. it's yet n=
ot clear to me
> > > > > > > why drm_crtc_init_with_planes() wouldn't work. (I know we dis=
cussed this on
> > > > > > > IRC.)
> > > > > > >=20
> > > > > > > If you're calling drmm_mode_config_init(), it will clean up a=
ll the CRTC,
> > > > > > > encoder connector, etc. data structures for you. For CRTC ins=
tances in
> > > > > > > kmalloced memory, wouldn't it be simpler to put the correspon=
ding kfree into
> > > > > > > vc4_crtc_destroy()?
> > > > > >=20
> > > > > > My intent was to remove as much of the lifetime handling and
> > > > > > memory-management from drivers as possible.
> > > > > >=20
> > > > > > My feeling is that while the solution you suggest would definit=
ely work,
> > > > > > it relies on drivers authors to know about this, and make the e=
ffort to
> > > > > > convert the drivers themselves. And then we would have to revie=
w that,
> > > > > > which we will probably miss (collectively), because it's a bit =
obscure.
> > > > > >=20
> > > > > > While with either the drmm_alloc_* functions, or the new functi=
ons I
> > > > > > introduce there, we can just deprecate the old ones, create a T=
ODO entry
> > > > > > and a coccinelle script and trust that it works properly.
> > > > >=20
> > > > > Thanks for explaining the motivation.
> > > > >=20
> > > > > I would not want to deprecate any of the existing functions, as t=
hey work
> > > > > for many drivers. The drmm_ functions add additional overhead tha=
t not
> > > > > everyone is willing to pay.
> > > >=20
> > > > I'm a bit confused. drm_crtc_init_with_planes() at the moment has:
> > > >=20
> > > > * Note: consider using drmm_crtc_alloc_with_planes() instead of
> > > > * drm_crtc_init_with_planes() to let the DRM managed resource infra=
structure
> > > > * take care of cleanup and deallocation.
> > > >=20
> > > > Just like drm_encoder_init(), drm_simple_encoder_init() and
> > > > drm_universal_plane_init(), so all the functions we have a drmm_* h=
elper
> > > > for.
> > > >=20
> > > > And we have a TODO-list item that heavily hints at using them:
> > > > https://dri.freedesktop.org/docs/drm/gpu/todo.html#object-lifetime-=
fixes
> > > >=20
> > > > So it looks like we're already well on the deprecation path?
> > >=20
> > > AFAIU that TODO item is about replacing devm_kzalloc() with drmm_kzal=
loc().
> > > It's not about the plain init functions, such as drm_crtc_init_with_p=
lanes()
> > > or drm_universal_plane_init(). Many simple drivers allocate their
> > > modesetting pipeline's components first and then build the pipeline w=
ith the
> > > drm_ functions. I don't think we can take that away from them.
> >=20
> > Sure, that's exactly what those first patches are about? It allows to
> > use a DRM managed initialization without disrupting the drivers
> > structure too much?
> >=20
> > > The concern I have is that we're adding lots of helpers for all kind =
of
> > > scenarios and end up with a lot of duplication (and fragmentation amo=
ng
> > > drivers).
> >=20
> > I can see two: whether you want to allocate / init, or just init?
> > We're not going to have more than that.
> >=20
> > > For example, drmm_crtc_alloc_with_planes() really isn't much used
> > > by anything. [1]
> >=20
> > Not that I disagree here, but it might be that it isn't the most helpful
> > helper?
> >=20
> > In vc4 case, we just can't use it easily.
> >=20
> > Our CRTC driver is shared between the "regular" CRTCs in the display
> > path, and another instance dedicated to the writeback connector.
> >=20
> > The shared stuff is initialized through vc4_crtc_init():
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_=
crtc.c#L1120
> >=20
> > It initializes the structure, set up the planes, etc. Basically
> > everything that our CRTC controller will be doing, and would be shared
> > by both cases.
> >=20
> > However, since the writeback and regular CRTC structures are different,
> > we can't really make that function allocate the backing structure
> > either.
>=20
> It appears to me that it's a problem with how vc4 organizes its pipeline.
> That's why I suggested to move some of vc4's init code around to make such
> allocations more flexible.

I mean, it's only a problem because the helpers aren't flexible enough.
Reworking the code to allocate the CRTC in vc4_crtc_init() would create
much more churn in the TXP driver. So sure, the core would be nice and
tidy, but aren't helpers supposed to simplify drivers?

> > We could do some compiler magic to pass the total size and the offset to
> > that function, just like what drmm_crtc_alloc_with_planes is doing, but
> > then we would have the same issue with the writeback stuff that needs to
> > initialize the encoder and connector.
>=20
> In vc4_crtc.c it should be possible to use drmm_crtc_alloc_with_planes().=
 In
> vc4_txp.c, the code apparently initializes struct vc4_txp, so it would be
> better to use a managed cleanup of struct vc4_txp.

This only pushes the problem later on. We fixed the CRTC issue, but we
have now the exact same situation with the encoder and connector.

> See, helpers should be useful to many drivers. If we add them, we also ad=
d a
> resources and maintenance overhead to our libraries. And right now, these
> new functions appear to work around the design of the vc4 driver's data
> structures.  If you want to keep them, maybe let's first merge them into =
vc4
> (something like vc4_crtc_init_with_planes(), etc). If another driver with=
 a
> use case comes along, we can still move them out easily.

Not that I disagree, but there's also the fact that people will start
using helpers because they are available.

You mentioned drmm_crtc_alloc_with_planes(). It was introduced in 5.12
with a single user (ipuv3-crtc.c). And then, because it was available,
in 5.17 was merged the Unisoc driver that was the second user of that
function.

drmm_simple_encoder_alloc() and drmm_universal_plane_alloc() are in the
same situation and we wouldn't have had that discussion if it was kept
in the imx driver.

The helper being there allows driver authors to discover them easily,
pointing out an issue that possibly wasn't obvious to the author, and we
can also point during review that the helpers are there to be used.

None of that would be possible if we were to keep them in a driver,
because no one but the author would know about it.

My feeling is that the rule you mention works great when you know that
some deviation is going to happen. But we're replacing an init function
that has been proved good enough here, so it's not rocket science
really.

drmm_mutex_init() is a great example of that actually. You merged it
recently with two users. We could have used the exact same argument that
it belonged in those drivers because it wasn't generic enough or
something. But it's trivial, so it was a good decision to merge it as a
helper. And because you did so, I later found out that mutex_destroy()
was supposed to be called in the first place, I converted vc4 to
drmm_mutex_init(), and now that bug is fixed.

It wouldn't have been the case if you kept it inside the drivers.

Maxime
