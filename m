Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B419E505
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6306E20B;
	Sat,  4 Apr 2020 12:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579F86E05C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 09:07:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A7715801C5;
 Sat,  4 Apr 2020 05:07:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 04 Apr 2020 05:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eQq0njFbYwMv5Jhvyae+LJ5fwJ0
 0QGHuIOKnUaoOMjM=; b=ArwEOVeGwzwVfY6w8AacFBCMIyoGS9mRLBW+LyYFoEA
 YL0xq8+6PuM/PpApOs1+ziOHlqu4huHO8NUEGAxZ4+3JDX4SuPKzNO743fY8tCYd
 kRxX9OIQQ15X0s7OFbTi7F6KUu5P5Tu5lcv4eQcwa5nYwaulZngzVr8W2UkN60nE
 LtUjPD5gVpZiNdSpId6ErN+oVhlateHjgik0lqKw+QTlpEp5sA274ukln5TzDViT
 NiK8P0hROQCMKKkUWu5kSKFL4w8oR97kvaZwotAm0p5pCsWpd7uMxgCidR+ovVHd
 lAmtG2e77gr+yk84sY+RyPMAQ1oa2CXH6ypavnqyPOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eQq0nj
 FbYwMv5Jhvyae+LJ5fwJ00QGHuIOKnUaoOMjM=; b=amIjsUfAudM8YCZgk4rW2O
 0PEAXovikPYdLqV/UtsmiF/oHEYKa12KW6Dy22oijiadSxIX5TfGXF/1fH9NBXPy
 IEgKIOSUjy9HWT7Jn54BBo2v7yNh4jp1151cktfUwpuJrClHsXum6nmTbEk6wpPa
 4/C1WcRRJ27BMsdnvxtRvy7ib1HEf2P7PdlRDTpr1PLHWEH9JGClc29qCaHKvEvO
 wCo5SR8n64SyxASOHVF5TBdpq3tIHc3SegqJfUGSQhRIHQRHwL4tZC6Y5LZuZHtO
 d0rPd/360cKTJhJXDYzPn6fLANudeBPaQdybTaJJr7GX8aFaR0r8bYUX+cQ2LLrQ
 ==
X-ME-Sender: <xms:M06IXqeXOZoEn1TfJ2jGsQJixiucrGic9y4gmVfol5pd4qeTAjfsfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdekgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epkhgvrhhnvghltghirdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeel
 tddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M06IXurq-TsH3xx-d1CnhXqoJFGkdeK6n8kUrd1EOnXVdOYYwBT_sg>
 <xmx:M06IXr9vWK-9wp8VlrtShiv8E-hk1xTlXe6LvsBGiLogkhaKFsYKWQ>
 <xmx:M06IXqLoafdcZHxzJUtnRjHQD532WTOE1o9b0nyUls6_-OveNoNFwQ>
 <xmx:NU6IXvgigPPgNeussOEivjoNawz8vTfi-HT2iTUs2xcmRtSVjC8dEw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94C2B3280059;
 Sat,  4 Apr 2020 05:06:59 -0400 (EDT)
Date: Sat, 4 Apr 2020 11:06:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: mainline/master bisection: baseline.login on peach-pi
Message-ID: <20200404090658.nxfvi5zg2rgag2qo@gilmour.lan>
References: <5e863110.1c69fb81.17969.099e@mx.google.com>
 <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
 <MN2PR12MB4488D9D3984D03030D3BACC3F7C70@MN2PR12MB4488.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB4488D9D3984D03030D3BACC3F7C70@MN2PR12MB4488.namprd12.prod.outlook.com>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:44 +0000
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
Cc: Shane Francis <bigbeeshane@gmail.com>, David Airlie <airlied@linux.ie>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernelci@groups.io" <kernelci@groups.io>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Joerg Roedel <jroedel@suse.de>,
 Tom Murphy <murphyt7@tcd.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: multipart/mixed; boundary="===============0390029823=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0390029823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mzixxo5gkplcdwbu"
Content-Disposition: inline


--mzixxo5gkplcdwbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Apr 03, 2020 at 03:47:46PM +0000, Deucher, Alexander wrote:
> [AMD Official Use Only - Internal Distribution Only]
>
> > -----Original Message-----
> > From: Guillaume Tucker <guillaume.tucker@collabora.com>
> > Sent: Friday, April 3, 2020 10:14 AM
> > To: Michael J. Ruhl <michael.j.ruhl@intel.com>; Shane Francis
> > <bigbeeshane@gmail.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>
> > Cc: kernelci@groups.io; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; Tom Murphy <murphyt7@tcd.ie>; Joerg Roedel
> > <jroedel@suse.de>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>;
> > Maxime Ripard <mripard@kernel.org>; Enric Balletbo i Serra
> > <enric.balletbo@collabora.com>
> > Subject: Re: mainline/master bisection: baseline.login on peach-pi
> >
> > Please see the bisection report below about a boot failure.
> >
> > Reports aren't automatically sent to the public while we're trialing new
> > bisection features on kernelci.org but this one looks valid.
> >
> > This bisection was run with exynos_defconfig but the issue can also be
> > reproduced with multi_v7_defconfig.  It doesn't appear to be affecting any
> > other platforms on kernelci.org.  This looks like a DRM driver problem, the
> > kernel image boots fine without the modules installed.  It actually started
> > failing on Tuesday in mainline.
>
> Fixed with this patch:
> https://patchwork.freedesktop.org/patch/359081/
>
> Just trying to get this into 5.7 and stable.  I was waiting for a
> 5.6 back merge to drm-misc-next-fixes, but I could send it as a
> separate PR if Dave or Daniel prefer.

You should ask us next time, we're not doing them unless asked :)

I've done it, it's compiling at the moment, it should be pushed in the
next 10 minutes or so.

Maxime

--mzixxo5gkplcdwbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXohOMgAKCRDj7w1vZxhR
xZs/AQClCccmpU4+LG7nXB1gv0X+ax1FVxY/Q9I42krsqKVBYgEA/2490Jp1MW8+
3WWdMsuAh6nMZl0kLN4/FVae8Wa03Qg=
=hqzo
-----END PGP SIGNATURE-----

--mzixxo5gkplcdwbu--

--===============0390029823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0390029823==--
