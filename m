Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7158420A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98A610E79C;
	Thu, 28 Jul 2022 14:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF28E10E79C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:44:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3ACC05C006D;
 Thu, 28 Jul 2022 10:44:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Jul 2022 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1659019461; x=1659105861; bh=Fje/wPKfeK
 kA3zBSKNSFSbZIQmOsCAPH58zdG4srTYc=; b=SvvxdDah5oDoydmCwKaabHpvww
 uLFfTX1SncpEKbnfhDAAB4sFtjzYJdgMFInB2B31VJp/+JtoS8L4HuhcnzWH+/QO
 LSuVzUGoFepbdmV7MXdPNerHwKDPyJ9Mz0PzCxqPgThSahSHp1ShgHGrirgZFxBE
 E2WeyXIWIO1BGwWjYuB2zWRcn5jB0Eq5Zh5eWygGXI85SfOBdp6DGpDNPSs3bcn3
 1CJ3CU/uU3ojxgkA5PTQ9OcBJMQFPPknKhaYUpVifb+lgLNAkS2AQXMfhSu6XYDz
 erzQLzSoGE1wGq1qKX2AdcV92D48hxurpRo72GWKAKmEN+GnOD65QshtqogQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659019461; x=1659105861; bh=Fje/wPKfeKkA3zBSKNSFSbZIQmOs
 CAPH58zdG4srTYc=; b=Fcr58LC4fnDMv9jXrbHWX0xj/45IzOXtOLwxUsl40C5/
 vxE4QtO3C5fokOgcUkrCKO7TmWWEOZ5M0FRBt02bDcnn/5YBykfZrtYRCYO+QK8k
 lba+HYY8mA9qxYwm2xQUjPlI6Fo4MMXs7LD8ZBQKzS/C7toQm3IUsfwpWibnylP0
 c/JkRUoDzr4b4naxj/hug+16G6gGzCbg6hRGk85w0ppuBznYZ61jo42YGgPJAB3I
 1AQ+IzVtZk0dHm2ZsuWOvsfuWtTMwXb8gBF5Horm8nApt7Uh2FppBK8EL/XYA5yA
 oh4KDFYyFLwedPxLHT0slQTz5ef38lmWFFGqIXmziw==
X-ME-Sender: <xms:xaDiYlXJ9v_EGuSYWn_sXW9JbhLPJlhNoKbnAitMgaYHTxkxz0CMbw>
 <xme:xaDiYlkzSE0D7ordSQJYA452n3Lv0RMIAM8JZTCuIppJriE38kTx4g-W7DTwWVtFr
 cCvVHnhixLqER72Zxk>
X-ME-Received: <xmr:xaDiYhYrTEEGMZ_hzoBP-3LG7k9GiPotk-V6IqYVRvag7n7UeSVIIBQPTyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegt
 vghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepteefffefgfektdefgfeludfgtd
 ejfeejvddttdekteeiffejvdfgheehfffhvedunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xaDiYoWIT037gzHTMlUY78lQdIQmAqWJrOt50ZdZ4oQ-2o87nj0G3g>
 <xmx:xaDiYvliZMzPd2-dvItolYw7Vhvs633dBuiijhIeU30i60dovplo6w>
 <xmx:xaDiYld2HOQCnGn0WTzvoYwrokRqjXItS-UwcWM4pcQ1fCA3XdFqLQ>
 <xmx:xaDiYqui1FnXdXBHOpJGwhbRALddYYZSUV-PgAxA5O9vWDdPKYq_lg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 10:44:18 -0400 (EDT)
Date: Thu, 28 Jul 2022 16:44:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net, daniel@ffwll.ch, dakr@redhat.com, airlied@linux.ie,
 christian.koenig@amd.com
Subject: Re: [PATCH 00/10] drm: use idr_init_base() over idr_init() if
 applicable
Message-ID: <20220728144413.nebc2js26vlwovr3@penduick>
References: <20220701185303.284082-1-dakr@redhat.com>
 <165901911294.5946.5075667196143577988.b4-ty@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r2toc7lzoajpzjnz"
Content-Disposition: inline
In-Reply-To: <165901911294.5946.5075667196143577988.b4-ty@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r2toc7lzoajpzjnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 04:41:41PM +0200, Maxime Ripard wrote:
> On Fri, 1 Jul 2022 20:52:53 +0200, dakr@redhat.com wrote:
> > From: Danilo Krummrich <dakr@redhat.com>
> >=20
> > This patch series initializes IDRs with idr_init_base(&idr, 1) rather t=
han
> > idr_init(&idr) in case for the particular IDR no IDs < 1 are ever reque=
sted -
> > this avoids unnecessary tree walks.
> >=20
> > Danilo Krummrich (10):
> >   drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
> >   drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
> >   drm: use idr_init_base() to initialize master->magic_map
> >   drm: use idr_init_base() to initialize master->lessee_idr
> >   drm: use idr_init_base() to initialize mode_config.object_idr
> >   drm: use idr_init_base() to initialize mode_config.tile_idr
> >   drm/sis: use idr_init_base() to initialize dev_priv->object_idr
> >   drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
> >   drm/via: use idr_init_base() to initialize dev_priv->object_idr
> >   drm/todo: remove task for idr_init_base()
> >=20
> > [...]
>=20
> Applied to drm/drm-misc (drm-misc-next).

The via driver had changed a bit and the patch 9 didn't apply at all.
I've moved the change to where it looked like it belonged, but you might
want to double check.

Maxime

--r2toc7lzoajpzjnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYuKgvQAKCRCIQ8rmN6G3
y57YAP4+m/e9OsvwjRt/iw8zIFBZKoLxAE0IPwnFlSHrNn2tUAD/WS/gzyTd6/LJ
oF1hmSuR64Ar+Q/JsOPP81uQ+9wHJ7g=
=UBYt
-----END PGP SIGNATURE-----

--r2toc7lzoajpzjnz--
