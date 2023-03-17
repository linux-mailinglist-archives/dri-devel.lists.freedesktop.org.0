Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE116BEC91
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9F410E3B8;
	Fri, 17 Mar 2023 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C24010E3B8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:11:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5648F3200938;
 Fri, 17 Mar 2023 11:11:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 17 Mar 2023 11:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1679065890; x=1679152290; bh=6oVbryxrty0phwn/OkVDJQ+SQebgH8nBJBf
 NmmEXtW4=; b=Oa57n4hRbgOKVC8Hfeaop+8jmZ/cVuqROSD4HkuPMK7g7pQEIFZ
 MYmd/+roBW1ZkA8tOxoy1yJAPhX8esZibWCojVxZLVfCgU70CbFRrcrLVH9glN9X
 tDtxSuLgqGnSb0GRfFBp0CABjNcn+1XKZwtZb5MEijBT4kmpL4jF+G/y39jjwn3+
 nY7FEyfsHChwj0/0IOSN42XktOGI3ivrGdbeFIQqCdEBqCtlWp2eB5NwV/1R6J8I
 u1ZVeOPmcM2BMiumKW/5AuGbwc/imonZdDpn/WhyiGwa3MCFGulaT3kDWPoqDR5B
 gZ+IXj7yMVuup/ihcOm2O6luVypSLjlGddA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679065890; x=1679152290; bh=6oVbryxrty0phwn/OkVDJQ+SQebgH8nBJBf
 NmmEXtW4=; b=MERT627nhd+buEI1Z0aF8iR64rVZBD62BHg25n37MWdc4B4HQp8
 mL62ztsxTSqlIke96ElDlsfWOQd04/hP++TF8ORraZVfL3uZvs5NVOlDMTSqgYtc
 bzWR4wYJ0Zn02T+n/eo1mcL/fC0nSUE6sOSlMYf0mUX/gdKoK/Nta/0pI6Hfhcdz
 LFRzJU3bazhO5Im0FHivEC4fbMiC6QRfdIfYNc7HwU6ZOyqD67PPPy2AmQFYGhT1
 X172Qf/+BDEphCYv/nyhaA9+Aa6m8VW2ZHA8ZqeLjTLkPRaw5RQk+j0kvq2JKwvT
 cwPxy5pSQWsIhs2RYTI96s1wSqp7MEypWig==
X-ME-Sender: <xms:IoMUZJDJMAnrz48Xn3BUNzqixURt0jAPRjGJKFFYxgglpauuH7TW9Q>
 <xme:IoMUZHhOk7cdol029GUjvNzmVkwhWwKs5jGOkyiaiceDUyCxj0BhwQ2sXN5XwgXhb
 j6zKCw4riVuo8xmhIE>
X-ME-Received: <xmr:IoMUZEmROODHnZRSoghY_0wv9tVog9IJJ71kOT7WQatvyzRJTN3xc62m3MBpQqiTFz0kFqprheTjkzlvycKD5JK3lkYvJEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IoMUZDzezMxzBt0h6lPekjXoh90_dz-uKI-oSpc4CzStvRs9uoex8A>
 <xmx:IoMUZORLeGYeXWhqRfVtFFVYXa-GBGgFFqrVEQF7kVn0zvjINTvP3Q>
 <xmx:IoMUZGbEfeQbmlup5hSdi1DnN-QzmO-CbIQDOzHV7W7FL2y0k50fKg>
 <xmx:IoMUZPKE7B7tTmar-MIbOg29gP925MM1dPYg-naq2UR89qm-MHcGrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 11:11:29 -0400 (EDT)
Date: Fri, 17 Mar 2023 16:11:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Message-ID: <20230317151128.hwaaq4na7d7mifaw@houat>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
 <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 01:51:42PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.03.23 um 13:39 schrieb Javier Martinez Canillas:
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> >=20
> > > Consolidate all handling of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM by
> > > making the module parameter optional in drm_fb_helper.c.
> > >=20
> > > Without the config option, modules can set smem_start in struct
> > > fb_info for internal usage, but not export if to userspace. The
> > > address can only be exported by enabling the option and setting
> > > the module parameter. Also update the comment.
> > >=20
> >=20
> > I was going to ask at what point we could just get rid of this Kconfig
> > symbol since it already depends on EXPERT anyways so most distros will
> > not enable it.
> >=20
> > But I looked then and noticed that it was added just a few years ago in
> > commit 4be9bd10e22d "(drm/fb_helper: Allow leaking fbdev smem_start"),
> > so it seems that people still need that :(
>=20
> I don't even know which userspace drivers need this symbol. Probably
> something on Android.

At least the Mali (utgard) user-space stack uses it, including on
"regular" distributions.

I don't know about newest Mali generations.

Maxime
