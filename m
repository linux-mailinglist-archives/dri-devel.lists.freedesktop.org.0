Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B1551AAF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 15:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CA810E351;
	Mon, 20 Jun 2022 13:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751AD10E351
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:23:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4AAF532005CA;
 Mon, 20 Jun 2022 09:23:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Jun 2022 09:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655731429; x=1655817829; bh=T/uvpCEZCV
 MVZUSYXPW/Pq9C1Cr+Jsj2HzVddaprYoA=; b=bsVsAMMn+i7IC5agMy5Jrbs6Fl
 PhOe97biI+tJb6f/3CTeKCYjlLZoNUQGswdCw+PFFKxADyjHhWg4yahm56JZw4Z+
 yo8ObJYgZLXb8HeAhjA4ViR8yb1mKAjccQ4okUVZsiUfLec+BQvFflOBjCgFK4bl
 f6kFjfznDqMAoJOmoDToXR25JgueNZDi91vLxiWqLw4fNZsm643PZb22p+W71bf4
 AB0ci6TMmL0bhKO+/biPxsvkk142Tj7o/TS+mles21BweirmSGl151KbrNuHLKbt
 Cas9oNwSg2N6/t/ma4a4Ni0AMzK8s1qR5DkP3YZ9mFKcC3NHDRrNww213jTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655731429; x=1655817829; bh=T/uvpCEZCVMVZUSYXPW/Pq9C1Cr+
 Jsj2HzVddaprYoA=; b=M6Yx2gG/CVxI8ZhO5jjCfpGSJi8vJD9MNVuV+OhX4Y2+
 Jtn7WkJgwyuDmikPYDBA99SuUq5tpny6Ush4UJYo0ds0oMPIQduje5tV16EKNxMT
 ZFxzXbHSAwGa4bQcYJ6X/mq00xk9X3cjfLIkY0PHXRmvvsQxo9UxoFqOFCCyGc3O
 6up8MVMl2/mMtQlursvoFtdYMRGkRZXdIECfyiP8IMhC2udZXJ4kF1K8FYmzDicd
 1IGqEoEJ7Lew3Ggw5+LcNierMqPd3ENCa9Hm+zetaNr9HAwz4j/Als+ckSEXuLUY
 5/t1mMXo8za6uVeiOd9dFovpeWEAO9unNdszrRJ8HA==
X-ME-Sender: <xms:5HSwYsr4RTF-QaCCYHya6rNO3YuR3sUmz6WK6GjzqqE-2KLmIcCBHQ>
 <xme:5HSwYiqGfqbx19JdWeQsZSOGbfr6FnvsDtTqSwA8rF0ng0fTx85rJE22haAzMDvLN
 VvXnykrmZeNn6qboFk>
X-ME-Received: <xmr:5HSwYhM0gaIggydS67Vx5cKUA-0M1Q7bhVpu-M0mH3l--8oWcU-8jCVf_Ybx5Z-PplhglF2kgSGj7ifBQeJvJ-Eexo1NuV17IbQQG_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5HSwYj6qMwZt9PIe0tauuVWUGT2uinOlrTFAnzE22e_-LdophwNqrA>
 <xmx:5HSwYr70XgCd4WCKJMbzZY1tBfxhtcVN73OsshD2vKWPYs0tM8f8-w>
 <xmx:5HSwYjiFX1w0_xIj7iGsmBrwOarNuWKXdVgAbNtaRjjcHCIRDQj16Q>
 <xmx:5XSwYu3WNHnvg1ujqsazpqZA7tGf0O3ZE2AjUgUJuYdxQ9FZGHSoFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 09:23:48 -0400 (EDT)
Date: Mon, 20 Jun 2022 15:23:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 13/64] drm/vc4: hvs: Protect device resources after removal
Message-ID: <20220620132347.bxci6quoayt2giws@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-14-maxime@cerno.tech>
 <CAPY8ntDY3pCbc=zrC7Nx6fVv5CFmxXKPHdSNWGYNJo2dn32XUA@mail.gmail.com>
 <CAPY8ntCLLSr5SHxwzcsQ=sN2KNE-=nqX7jBFZAR87eextDaXNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ewumxfi5og34krxy"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLLSr5SHxwzcsQ=sN2KNE-=nqX7jBFZAR87eextDaXNg@mail.gmail.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ewumxfi5og34krxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2022 at 05:59:15PM +0100, Dave Stevenson wrote:
> > > @@ -132,14 +139,18 @@ static int vc4_hvs_upload_linear_kernel(struct =
vc4_hvs *hvs,
> > >                                         struct drm_mm_node *space,
> > >                                         const u32 *kernel)
> > >  {
> > > -       int ret, i;
> > > +       struct drm_device *drm =3D hvs->dev;
> > > +       int idx, ret, i;
> > >         u32 __iomem *dst_kernel;
> > >
> > > +       if (!drm_dev_enter(drm, &idx))
> > > +               return -ENODEV;
> > > +
>=20
> vc4_hvs_upload_linear_kernel is only called from vc4_hvs_bind, so
> unless bind and unbind calls can be concurrent, then there's no need
> for protection here.

Indeed. I've removed those changes and added a comment

Thanks!
Maxime

--ewumxfi5og34krxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrB04wAKCRDj7w1vZxhR
xVMKAP0ffGd/+YIUiPwXC+qCR/H9HFujPCgLySQB/cU+KpTgYwEAlf0JdkLjvpGj
ArD/SkJ9qjFIiQR677FxDfmQhFQ3zA8=
=iL37
-----END PGP SIGNATURE-----

--ewumxfi5og34krxy--
