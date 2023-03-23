Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1D6C638C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1729D10E342;
	Thu, 23 Mar 2023 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E20C10E342
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 09:28:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 85BD22B0681D;
 Thu, 23 Mar 2023 05:28:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Mar 2023 05:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1679563702; x=1679570902; bh=D+
 6uZuc9G8Cokr6D/ZuPojKuYrWzIuh3IXwIRgnmVHA=; b=Grd14zRIvsJco7ab2/
 EJppZ6ZNhgtslECuLaA5r9XEO8okGkzdmEuF1h4mkA7fvqNHyJbX1PMqYWo8Rtwx
 X5ataRWTesx2mnefGO8VnZhl34tj9QLV6h4HBnhuC7VGeianQ5Vf6j8MpK0asBmu
 LBg5t3uuwyzq/WkBCDRNIn77XW7mqFoZAe2rFL30HoSMFEUX/QNw6eCicRx+HMT2
 4526yveHRgi1cryfZVVNV+L6gAwXfBpDWUdeGI9HtJYwc/BOkOKnFllfopMKKha9
 XhcbeV+GTxShxnK9HxfMXvp0pejBmIcuSwUJjve96I2Nvsq0DlggDwPFwzJ3vuST
 ku8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679563702; x=1679570902; bh=D+6uZuc9G8Cok
 r6D/ZuPojKuYrWzIuh3IXwIRgnmVHA=; b=Ai0ccEckw5DnS+8GQfsYqpXuWpFGB
 ttQLPWjSKlnP2tyns81XXlCFD0Q3xCeGff5rzdlC/6fX8JQ+4kiJDnn1U75c53bw
 3N6GGfyyybi+Oc1hH+quCZw/v4mKnLiAwdLBGbsgKsp24nDseAFy6LSW9eugCmVb
 +KWHJcUBGeH/Xl9DeNU/1942HFw577G7yPJsIuuQ1YmES20O/zI4WxZkMh2fgyvE
 a++ZfjFMGS7aM9uIVZ7hwQRJ5mpW9rkPe/CqQE4TXKbCH/6yyeyeHBBofsebtprR
 HWH8eNTjFX/5jiVQ+ZZg+2Wzp8v4NHUZ9+PfVsCpbk2QaiHtJw9Vu6qrg==
X-ME-Sender: <xms:tBscZNYU0sYr-0l50Yk4duLxqaae1ei9hUNtbliJx9BdbCtXahbacg>
 <xme:tBscZEY_aXclh9vdqLqnl4wru2s6kxPDvdXjMxVMjjpPUds2kh_VV4YfON44u9ijp
 eN3I--qqDpHqT8kqb8>
X-ME-Received: <xmr:tBscZP8skWawj0kRdUZp0NZnNW7iLg1bpc9apnCh3xEamIO3DRctlsv_Do8_iUT-3gjsZHLbhGlaCwh_7I23TS4fALDfcrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tBscZLquNPybogS3zNBGkVjdxMrFA_wmROPfMRKE76tl3-jPfie6VA>
 <xmx:tBscZIpFJVMEV1zDSpLQ5e2Og2-mS-3BlS-BryqQYSpE93anFPLqpA>
 <xmx:tBscZBQ0dyta-7zR6gLyviIlJ54-XWhFYU9iBu9fMXL9ozk-HdFNNg>
 <xmx:thscZEeaobicffGMWazNsg-Qr4l9xbsovbY_2Ck1BEPfHDBnfTOBrqEaAAY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 05:28:19 -0400 (EDT)
Date: Thu, 23 Mar 2023 10:28:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 0/8] Support ROHM BU27034 ALS sensor
Message-ID: <20230323092816.eemjbfez6wxbumx7@houat>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
 <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
 <87edphnkg1.fsf@minerva.mail-host-address-is-not-set>
 <8fe9fea1-b7b8-ee46-9534-de7e2b1726f9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ihwqacloxsmu5zbe"
Content-Disposition: inline
In-Reply-To: <8fe9fea1-b7b8-ee46-9534-de7e2b1726f9@gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, David Gow <davidgow@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kunit-dev@googlegroups.com, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ihwqacloxsmu5zbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:59:33PM +0200, Matti Vaittinen wrote:
> > I agree with Maxime that a little bit of duplication (that can be clean=
ed
> > up by each subsystem at their own pace) is the path of least resistance.
>=20
> I'd say this depends. It probably is the path of least resistance for peo=
ple
> maintaining the trees. It can also be the path of least resistance in
> general - but it depends on if there will be no new users for those DRM
> helpers while waiting the new APIs being merged in DRM tree. More users we
> see in DRM, more effort the clean-up requires.

So far there's one user in DRM, and I'm not aware of any current work
using it at the moment. Even if some show up in the short-term future,
it's not going to be overwhelming.

Maxime

--ihwqacloxsmu5zbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZBwbsAAKCRDj7w1vZxhR
xaHTAP0eX38oKDx4w+f18p920Z65wm1LMJZUsTQTKppqDXkAgAEA+oBatGCMd3iz
2GkL2vZla5OIIAXWxReh2dxN+LliWA0=
=5iWi
-----END PGP SIGNATURE-----

--ihwqacloxsmu5zbe--
