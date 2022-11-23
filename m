Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E859635CD0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F03E10E2E0;
	Wed, 23 Nov 2022 12:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CCF10E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:28:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B660F2B06EDC;
 Wed, 23 Nov 2022 07:27:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Nov 2022 07:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669206479; x=1669213679; bh=hWxSuDzkXU
 94CSgCXRAInpkm/Y6uoZJPFOxa7mXYCLA=; b=YxjMG+Lk8R7fhJSUhiaa+uVEYF
 PZ6y66z1GmJXbelo6/aDKRoHlsg4mcb1zadMKQz/mPAmZHuETFPLtTrguoM+tFrL
 0JbRu5KHVrB4gUbvf2XlK/mPHQvKmjHYjUc4EG5DzZ90xrH/Aa3jmMeu+ZJCHs/R
 oi30RUezh7t+6IPPNQ7eHZa5tYspljdvWxVB7024I/5a3I5O/SJBW/viu2D5gruy
 PYzu+n6W7SWEnhd327CyuCt61kyfuRjAO1I5C3lPoDIUtfNSfwtVyOlFlbNrgg/4
 LC6DOQLGEzgKVPOgOpdQ3A7G0ETurNRobRv4FnI92WPBmvB8vcYk0LMmV9og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669206479; x=1669213679; bh=hWxSuDzkXU94CSgCXRAInpkm/Y6u
 oZJPFOxa7mXYCLA=; b=KZteqiB2a092niXyef3Ric2K+9aO8n+LDGIwXaQVRIdW
 gARKfCFfO3/LoTYEOmZyAhH0ybmO+2VHAwtmxlhJbJkfpHxsuZXtbg2jQyIEvyxq
 kVXrecw6qzXgj5Q36CRzCrtZ6yUIxaosm7YPOAyIsiMWZ538n17JV9wdipkITBip
 efyA5r0DWN5FIbM+kZtLX1mGE/sdg6oo9dCDIWRd3Q5j94QxYwGDejdcvhGWx+ni
 Wm12Ixj/4vLbDITbZYfxAE/RKK6AtKXBjgPsVSSeNesPOjmuLyT7Cy0ZvPtGwRgK
 HxncrWxNzda0u5FAHJLOXhj+1Ulf2G1+WyomKiBesQ==
X-ME-Sender: <xms:zhF-Y5JGbkdz6L-msj0OMNBFt43FP_9QHd1_ndEFMbyrmgdO96i2Bg>
 <xme:zhF-Y1JU6W-RJC6l0XpVpma4WicV6KGBBqLQd1px3Jx9vaA9uPUjcdEtqURT9cSP6
 T_0TsPBNkawTQ5iw9w>
X-ME-Received: <xmr:zhF-YxvrEhfIhEFlxws7_cC6hndYQNd1WToMQCPF_E4Xz12KmbT9JM0ElImDYn5DOil7OjPmkBgjn-mYbsFt-wFpKJBvQO5cxlg_1cNQZQ1WrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
 teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zhF-Y6bIDz4lxegyCNxrttRcdC6il_0_AfQSkGp_Pz-Y6hygAXgMFg>
 <xmx:zhF-YwZXScQs3lQppN5S6PqJsQD-tDQKrLK_79B-OtG3NncnFGPU5g>
 <xmx:zhF-Y-AN2GWUGPiwQnMZu0sX43lsiQOBBrRTt5MVPd8-JrjsMOVrYQ>
 <xmx:zxF-Yw0saa-ajt8PhpwUH5bIOMFT-PZB5cr6K7XJB6UTu-GFghWNF1ky-Js>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 07:27:57 -0500 (EST)
Date: Wed, 23 Nov 2022 13:27:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Message-ID: <20221123122755.5vngtza6rvkjkpoi@houat>
References: <20221119204435.97113-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qmepqrty2tbnehtf"
Content-Disposition: inline
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qmepqrty2tbnehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 19, 2022 at 10:44:31PM +0200, Oded Gabbay wrote:
> This is the fourth (and hopefully last) version of the patch-set to add t=
he
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
>=20
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
>=20
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=
=3Daccel_v4

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--qmepqrty2tbnehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY34RygAKCRDj7w1vZxhR
xT32AQCX8A7T5hn2/y1J6pSNNAl7PLmN9ffQOtgxNcox+FQ4RgEAuEilhHbdK3X1
doXHfzoxbP+t/U6mbPUDVNl0CjvnlAE=
=1YV8
-----END PGP SIGNATURE-----

--qmepqrty2tbnehtf--
