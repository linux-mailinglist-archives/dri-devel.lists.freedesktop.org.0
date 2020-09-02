Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804425BDCB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF9C6E581;
	Thu,  3 Sep 2020 08:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BA66E03E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 19:04:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4E724FCA;
 Wed,  2 Sep 2020 15:04:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Sep 2020 15:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=UIxnX4c3cvkVCih8WXAhZh++fhZ
 H2lstxce/AgcyQoQ=; b=AJKZvdUd2hz7jzsHrNCLB8F9hPKLifeW8Ovg5/yFd2t
 XpN21E5ZqYufX6n8KZ0kv5KMMyz4hSmAGFtAglJUp7rK9mG18PAnhTpJniG9Q+w7
 yS+fMtG09pybMflubjIvk0ttfxOZ25TMtdhQGuD9NKA47eutv9AV/2d1F8VTTQer
 VFmjOF5OlugqlHyElkJrA4LYXZiEI10zQp0mh8HVPeQurKwv/avQaYCuC1ohMR3z
 9LE0+W3KJFALG3IcOPkJSyZR0vf9cx7nbipyIqyVGvvFssXsEguRlsDl7/1XN91H
 RN0P1wtMijIjMaDhPefcFUAEU1A0ikQlkbPFXmYqThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UIxnX4
 c3cvkVCih8WXAhZh++fhZH2lstxce/AgcyQoQ=; b=nYV+dqD/xqacR59c0aEIVX
 w21OygFMPvsHZ+wSSwyjfBirfUiycS2DkJ3spPXp5nYrtBXJqdPwiE7TEjHcCQil
 EbImxL8Zv4F5VsTRuzveasbzzp+AxTMeVyGTjb/d2waBjUJXvKXaSRoo2iI8YvG0
 sR+4cuAgLW8oJ96cd40QcDWPpF6M5iHKKheE0R9kjKJszZDkSeAK9hhlOsuV0sXw
 tLa3lHvY/sJzXYwXQhxRPgE+dxc2x65xMzkucVMhKC8TTw8HAugm06UIFxGrfu4s
 BfCSTVi5Ud96BxPKZdko4QS1gM5r80I3g/lQWmd0WOICHUMmOXf1HXNfijDdXxTQ
 ==
X-ME-Sender: <xms:0-xPX81_2pmSYCwjPMBPQbp6-bpPubcFntWpzHUK2Eu0vyb0HIVSdw>
 <xme:0-xPX3G0zK_pHMTCBs19YydbT96GjrjRkoW3bCtimhgfVLkBQsROJRAzqGaRB4f1Z
 O1K8OVA1d1Mmj6v3Io>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0-xPX06y0hG23LP7_LMq8pEjF4P4SARltqMy1mQ52XqicUfHZXK96A>
 <xmx:0-xPX11rsyv1zoMPKj5RWPjcA0KoCItSlmWAGmyF1FPUsHr2bap5CA>
 <xmx:0-xPX_EI2qk5p6WephGhjAyuB5gZF5IaTDhUKpP9Upks5H_HnqhuTw>
 <xmx:1exPX5EZ_sCdMNtmrFMDAa6dpLeRkCn7YBKIE3Xn5FYbHnue5VLc7POaFVA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 329EF328005E;
 Wed,  2 Sep 2020 15:04:51 -0400 (EDT)
Date: Wed, 2 Sep 2020 21:04:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: sboyd@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH v2 1/4] clk: bcm: rpi: Add register to control pixel bvb
 clk
Message-ID: <20200902190449.qoao72lc4hdgv6m2@gilmour.lan>
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p28f443c0e819bea756ebf9296491b32da@epcas1p2.samsung.com>
 <20200901040759.29992-2-hoegeun.kwon@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20200901040759.29992-2-hoegeun.kwon@samsung.com>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org,
 tim.gover@raspberrypi.com, dave.stevenson@raspberrypi.com,
 phil@raspberrypi.com, kdasu.kdev@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, nsaenzjulienne@suse.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2048499160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2048499160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r53kpuqz3egnnm7b"
Content-Disposition: inline


--r53kpuqz3egnnm7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Tue, Sep 01, 2020 at 01:07:56PM +0900, Hoegeun Kwon wrote:
> To use QHD or higher, we need to modify the pixel_bvb_clk value. So
> add register to control this clock.
>=20
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Can you merge this patch through the clk tree?

The rest will go through drm

Thanks!
Maxime

--r53kpuqz3egnnm7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0/s0QAKCRDj7w1vZxhR
xSj5AQCqraZ624rX3+422hwzvHAjXebcXXo/k5QtfouULAH9uAEA2hUPPx3QnSzt
d+sIaCmCMaBIBO9JCuo1qwf1JJ6mAQA=
=K0vZ
-----END PGP SIGNATURE-----

--r53kpuqz3egnnm7b--

--===============2048499160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2048499160==--
