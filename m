Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC0462F1F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC5C6E3E3;
	Tue, 30 Nov 2021 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7656E3E3;
 Tue, 30 Nov 2021 08:58:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 874135C016C;
 Tue, 30 Nov 2021 03:58:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 Nov 2021 03:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=iAST7h0cs3FmiYaQxyPYfu1DGic
 7ID1h1xCPFc73iUM=; b=H2bOb8qPBvxRRIKAJvC7RvpXy8hhKaAw1upvu7VbNGr
 Dp+tAf522cHOqU3kfbUNrQhLzYkjhYoxJMP4/OygXpLlnggl7pk2k5yZ+56MWFAP
 kN6DfwQcmYr23dwZU6l/5NF/oy8tS4OJvOaV4+CCA2TdFLI8MWuZng1gTCYx2Vl1
 PCGT4sfypXGGgPqimtTGkbHHqfDMPXKfIxS2pT1NakUJs7OioT/wHkDnJ0sI17iW
 5T1YzXNl+AujZZDrUzvoUmxKKJxDGSNEei2ZHjemab1BlUjJVpuMjpw7X1Zw/qkK
 fyo31P9CbPVW8GdAFO1wI/OIh0oEH86ZPE/eeS5opeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iAST7h
 0cs3FmiYaQxyPYfu1DGic7ID1h1xCPFc73iUM=; b=LwFX4TRTZY6St5YOF7LaDz
 N8vQaq0zqZUKYE3ZazYffMb6l+BCu+pi81mxQkHKxeJBSvnTUnXubayKbvUairyN
 piknzrLQ4Jy/QMueMyl070L+uWjuxJGQ8DXRobCzaXeZfwuo3Xh+LZHhrjJ5fltz
 MhaXtCQ5PjKPvo0nXqMxiKzDZ893hCdy9duGsNfeF5euviy6b+CYo05Hwnpayj9h
 cJqOy18KCnXvbFQ6JA6ZWWyz8qbzouN390cUlY7SYK8WJH9f3OvSYD08MYtMwQfP
 IMfMLMpJnw4Msvac2x+QTGxJwXUe1TUZ5phAl7JkT0rrT70dCb/vtRW+2Ob0rZ7Q
 ==
X-ME-Sender: <xms:uOelYW0fmTyr-7XEJLSDE6ACna-_xI-0EdQIJXQ281tuXtM7lNK_hQ>
 <xme:uOelYZFr4CVNqq73EjDAyvi_k5lBJt1AizLsWWKLMXjTl9jBD6vGg3XZHRBSNdlqO
 urzg2MBopPG8DSPp6I>
X-ME-Received: <xmr:uOelYe5qPqDxrTgjB-FE7hQMm7xeFT9Pl77iIsCZw-mGRgLHj8F1JMBvLfdjD9mKhXoEjwPoUbKYpXi8frvPmoPDdfs82XpO8MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddriedtgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uOelYX3H8IoHGDknnDaTU-RlHqw6snwtx3tNrfADxLkW16-HDIrQEg>
 <xmx:uOelYZECPwX39TyzGIqxIrA5SO9XupDHjQItcig-ONDzrwYXxhhsTw>
 <xmx:uOelYQ_6tHTcp7VszQ9gChDIumxY6GFiHoOu4djiTkxRwDGgz5KpnQ>
 <xmx:ueelYSMwGy-c3C-kl3V0jDUQUAgB7u9lBPCCkIFqQgxRKy2dZIle-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 03:58:32 -0500 (EST)
Date: Tue, 30 Nov 2021 09:58:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20211130085831.wghfw7l4qksg2dbm@houat>
References: <20211130103353.0ab1a44f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lecmpukyxl4tz6dv"
Content-Disposition: inline
In-Reply-To: <20211130103353.0ab1a44f@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lecmpukyxl4tz6dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Nov 30, 2021 at 10:33:53AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/vc4/vc4_kms.c
>=20
> between commits:
>=20
>   f927767978d2 ("drm/vc4: kms: Fix return code check")
>   d354699e2292 ("drm/vc4: kms: Don't duplicate pending commit")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Unfortunately the merge resolution isn't entirely correct :/

There's multiple conflicts between those two branches on that file, but
things went wrong between 16e101051f32 and 0c980a006d3f

The first one changes the logic a bit for the clk_set_min_rate argument,
and the second moves the clk_set_min_rate around.

However, the merge resolution reintroduced the initial clk_set_min_rate
call line (line 373), without changing the logic of the proper call site
(line 396).

This is the patch to fix the resolution:

-- >8 --
--- a/drivers/gpu/drm/vc4/vc4_kms.c	2021-11-30 08:56:28.748524275 +0100
+++ b/drivers/gpu/drm/vc4/vc4_kms.c	2021-11-29 15:46:11.692151678 +0100
@@ -365,14 +365,6 @@
 		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
 	}

-	if (vc4->hvs->hvs5) {
-		unsigned long core_rate =3D max_t(unsigned long,
-						500000000,
-						new_hvs_state->core_clock_rate);
-
-		clk_set_min_rate(hvs->core_clk, core_rate);
-	}
-
 	for (channel =3D 0; channel < HVS_NUM_CHANNELS; channel++) {
 		struct drm_crtc_commit *commit;
 		int ret;
@@ -392,8 +384,13 @@
 		old_hvs_state->fifo_state[channel].pending_commit =3D NULL;
 	}

-	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 500000000);
+	if (vc4->hvs->hvs5) {
+		unsigned long core_rate =3D max_t(unsigned long,
+						500000000,
+						new_hvs_state->core_clock_rate);
+
+		clk_set_min_rate(hvs->core_clk, core_rate);
+	}

 	drm_atomic_helper_commit_modeset_disables(dev, state);
-- >8 --

I'm wondering though, do you have access to the drm-rerere tree? I've
fixed up the merge yesterday to deal with this conflict and the conflict
resolution should be stored there already.

Maxime

--lecmpukyxl4tz6dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaXntwAKCRDj7w1vZxhR
xXWnAQCWo7WQ12iqPQQIdseeco061y9zXo6Kig1tPb6yJW30XAD+LQEOgPjIdOe1
HsHrHdec0SuLbWh5x2laV4o8spBzaQE=
=aLcJ
-----END PGP SIGNATURE-----

--lecmpukyxl4tz6dv--
