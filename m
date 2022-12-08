Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F9646F55
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 13:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9CC10E469;
	Thu,  8 Dec 2022 12:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8A10E469
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 12:12:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B94622B05BCC;
 Thu,  8 Dec 2022 07:12:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 07:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670501535; x=1670508735; bh=LObGFes3Ps
 C1c06fe7UuvWKQtYq/k+HdnZLZPo9kY8o=; b=uJjG96+ko2ZE0swgXh5lszYa+C
 3lBnxkUapfyTSrkbwtgP6H58Mo6BpVvQzKGJssD/tAglU+OlQU28UfPsMKXjTzxO
 ZkScUzbGSa07Z/TNbKHC0+OtrLQK6bBr3NlVGOFJn/aq/KWr+BqRhTawd6jhqKxB
 DASyty6TzILd3jEFqMmSs+ubF3ahusndjgRYpfwdo7SkeqIt4Wh1c4D4xNExc86a
 MvN+p3oetblZOG80fdFcyRkoUC2Ge0t1kIy60jh9FLQ7B3Z5gvCuGkqHh64OKQ8Y
 fPTmzYCOsjnTeWE8JVBX4HU3cbisN/+iLitDivgBIV4DsCufi7UZtik+cx0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670501535; x=1670508735; bh=LObGFes3PsC1c06fe7UuvWKQtYq/
 k+HdnZLZPo9kY8o=; b=jOKB0EzPsfxYb8A//0/cM6hGvUT11Pmy/BB5PpQSrSha
 OUc9JaFgvF4uoijcyqExhhRXDDEzS4WwSwMQq+fTTzSHvnX4FCsYOnHTkxZTN1Dn
 npGcpUnaRNYcEEq1tUNrpDB4xbw1NNTOwlJuyLlQYlDzCneKn9s1LYzqiEAJQZhA
 sn8m4FtTSdFMn0J2eJS+0Naf+w9JYKCviYi3BrTa4ILmlAbBmdnSKSqs5SvQB3Pl
 5vy8+LaHf2eKTRrIb+ah6QYLVASgatuej8KmWmebhpkrfxGbbCQaG2RUDJmHWTWy
 fi/Vd47V2Wask16D2iM+DD1OykfSAZXz5CHNCOfhJQ==
X-ME-Sender: <xms:n9SRY4n2Nj2X4h7d4t2ai1AMDgPt_eDrr-Er0TFi0caScJNC_xDCew>
 <xme:n9SRY30qKM4P7hEeqmh5DXeVGqVHGtnoK3HojDWknv6aFQROpOkbyt8qR6uwvE-1F
 WGjssEhoo9ctQ5aBP8>
X-ME-Received: <xmr:n9SRY2q94mWAPVVHQsLTKx4saGzE1forDoUAwy8JFFDXhoIr6ryGvzCRpvKqndMM0k37DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevfeehfeekieffgeevleevtefgffefkedtfeeuhfettdegjeehgfegudff
 ffdunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n9SRY0lOU-ZeTwRdDoaXBTKpQTBBPLQLOJ15wXNHMS2Px4WbvVMI0w>
 <xmx:n9SRY22vXZ9ckGa2UeGxD4QDJQRFfhUCs77k8nmNDRRqjZoBsGCUow>
 <xmx:n9SRY7s74sXcfwQXm5NI4wX6JAdyDQy4jVm64r7CuOTlXhU4weHeuw>
 <xmx:n9SRY6JNQpvtmSk5egA5szrKluljofO--7IV4TXdB-BeiBhLuXO8vNNJHAY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 07:12:14 -0500 (EST)
Date: Thu, 8 Dec 2022 13:12:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 2/6] drm: use new debugfs device-centered functions on
 DRM core files
Message-ID: <20221208121213.yly52bcqhawbjil5@houat>
References: <20221207132325.140393-1-mcanal@igalia.com>
 <20221207132325.140393-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oeqdxey7zrnjctcz"
Content-Disposition: inline
In-Reply-To: <20221207132325.140393-3-mcanal@igalia.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oeqdxey7zrnjctcz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 10:23:21AM -0300, Ma=EDra Canal wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function in all DRM core files, centering the
> debugfs files management on the drm_device instead of drm_minor.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>

--oeqdxey7zrnjctcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY5HUnQAKCRDj7w1vZxhR
xSWaAQC48Qdot0J965ijrVZmLJ7zfzdJGdFJYpmjtN0Tk0Xt6gD/Q05JQ9vF5DPn
wPZcGUu9k52mt4bDsrAwR9Wrd5eAFAQ=
=Jiv0
-----END PGP SIGNATURE-----

--oeqdxey7zrnjctcz--
