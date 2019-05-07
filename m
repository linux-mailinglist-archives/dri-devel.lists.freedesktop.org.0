Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ABB16A68
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9232F6E825;
	Tue,  7 May 2019 18:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD96E825
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 18:40:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 934C32213F;
 Tue,  7 May 2019 14:34:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 07 May 2019 14:34:46 -0400
X-ME-Sender: <xms:xc_RXDcycLX_c3XAuRgNKtMwfsHGutce2QI1X3w4SF-OfNCghdwN5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguggjfhfuhffvkfgfffesghdtreertderjeenucfhrhhomhepffihlhgr
 nhcuuegrkhgvrhcuoeguhihlrghnsehpnhifsggrkhgvrhhsrdgtohhmqeenucffohhmrg
 hinhepfhhrvggvuggvshhkthhophdrohhrghdpghgvnhdrmhhknecukfhppedufeegrddu
 feegrddufeelrdekfeenucfrrghrrghmpehmrghilhhfrhhomhepugihlhgrnhesphhnfi
 gsrghkvghrshdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xc_RXEp9yNQTkBZRqjySpGxPTfb5Il634dN-n_PrMqsGQCeV5alMCQ>
 <xmx:xc_RXAFqvjaD3qv7NjoakdKzrLu-t3WQUM5dWR-_efJDDPTiswoPWA>
 <xmx:xc_RXN8nQ8zB77xwl2XPRo8Ik_mxIEWysBF5ucRewfHubDvdBk9dnQ>
 <xmx:xs_RXD-O9_5HaGQzSE5mnbqSeYjgdvj4ztXzxTsYPqncS7GKUQAzzg>
Received: from localhost (unknown [134.134.139.83])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52843103D0;
 Tue,  7 May 2019 14:34:45 -0400 (EDT)
MIME-Version: 1.0
In-Reply-To: <20190502180346.4769-4-john.stultz@linaro.org>
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <20190502180346.4769-4-john.stultz@linaro.org>
Subject: Re: [PATCH 3/3] mesa: android: freedreno: Fix build failure due to
 path change
From: Dylan Baker <dylan@pnwbakers.com>
To: John Stultz <john.stultz@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <155725408440.4885.13566386067662971275@anlee.localdomain>
User-Agent: alot/0.8
Date: Tue, 07 May 2019 11:34:44 -0700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pnwbakers.com; 
 h=content-type:mime-version:in-reply-to:references:subject:from
 :cc:to:message-id:date; s=fm1; bh=PmFzjzNIRVWRvwA+hL+9V922qGwiXL
 oYmjMuw0tb3fg=; b=0sjEovO+FrDBbDZF1u5PE290zXAa4awtG56sg5gtmPX2Fi
 oFuV3HoVnQAzJ+i+5nohRqAwgRKtGIzXLPulliGetajAg0fbs7+V+tC9g57iK5cE
 Ng5q3YBMlU97vc5P5eTZoxjBiF03XGsRViT87wg/6ae+pZ2jOb/0/ORRFVQKyFaI
 acB9oQaPLXlyonUp4K4pX9rsWuqPwQd3BPISdg9x+nF7bXaESbeCJvgWjP/loA/b
 ggHbokmxzAiKCMAH6Aq1zVVDQEQeCBRgLfQ2hm8O41Z4LuPyC3GbGnTdrpdVNKOo
 3+dvsJesdvVwhXjAjNdrh2nlU1aMXSDtS3rI+11Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PmFzjz
 NIRVWRvwA+hL+9V922qGwiXLoYmjMuw0tb3fg=; b=8L8Y52rBVySiR6OoePXJU5
 AxgGZAZ7cxu6eseZmAuuoEVQazBEbmp73qIdY5jgCVzgmJPV/VT1ESGc/z1IB7+N
 erjAH+ZPnx7TkQkETmvjlWAZI9D6kgpbgs+Yx7pFY+pc6JNvAEpSY2e0aHqATBGa
 7KJBEuDp3IyUE6wvaJR1YMDQ+6hI6C9t1qcViQOr9htFz8C7IKOv7c6QRNK5maPl
 mT4g449lhYfrO0fEgTZCJvK/xEp3lK7FqL2XVcOvyAYNEtcKASV9zC+34I23TbRn
 DXBB0D0y4Rr6rKrLUNoHcwXhRmavaZrMYIJDs0NKpUYQXYuWbpz+P/DPU3N9WYDw
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1925967179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1925967179==
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============7259929433519450431=="
Content-Disposition: inline

--===============7259929433519450431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,

This patch and the previous one landed with a fixes tag nominating them for=
 the
staging/19.0 branch, but they don't apply, and to get the to apply requires
pulling in several other android build system patches. If you'd like those =
in
the 19.0 stable branch can you put together an MR against the staging/19.0
branch, or if you don't care let me know so I can mark them as de-nominated?

Thanks,
Dylan

Quoting John Stultz (2019-05-02 11:03:46)
> The ir3_nir_trig.py file was moved in a previous commit,
> aa0fed10d3574 (freedreno: move ir3 to common location),
> so update the Android.gen.mk file to match.
>=20
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Alistair Strachan <astrachan@google.com>
> Cc: Greg Hartman <ghartman@google.com>
> Cc: Tapani P=C3=A4lli <tapani.palli@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  src/gallium/drivers/freedreno/Android.gen.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/src/gallium/drivers/freedreno/Android.gen.mk b/src/gallium/d=
rivers/freedreno/Android.gen.mk
> index 17b6fbe1b7e..d29ba159d5c 100644
> --- a/src/gallium/drivers/freedreno/Android.gen.mk
> +++ b/src/gallium/drivers/freedreno/Android.gen.mk
> @@ -25,7 +25,7 @@ LOCAL_MODULE_CLASS :=3D STATIC_LIBRARIES
>  endif
> =20
>  ir3_nir_trig_deps :=3D \
> -       $(LOCAL_PATH)/ir3/ir3_nir_trig.py \
> +       $(MESA_TOP)/src/freedreno/ir3/ir3_nir_trig.py \
>         $(MESA_TOP)/src/compiler/nir/nir_algebraic.py
> =20
>  intermediates :=3D $(call local-generated-sources-dir)
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============7259929433519450431==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRxxLdWILx1cItL2yVMlfqrPrBz7AUCXNHPxAAKCRBMlfqrPrBz
7JfkAP9DC7QmpFnoX8MNnl2LtbSskcoHBuSa42jucLdBlGZiywD8DwReEstcRxDT
NPR5kMbVEiLELjlXc8yUBUXPHTrzfQg=
=WQFD
-----END PGP SIGNATURE-----

--===============7259929433519450431==--

--===============1925967179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1925967179==--
