Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474855BC441
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324E10E5B0;
	Mon, 19 Sep 2022 08:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A834A10E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:25:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DBD015C031E;
 Mon, 19 Sep 2022 04:25:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Sep 2022 04:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663575923; x=
 1663662323; bh=1VZDD1hptbM/uPXhe71uaw2rLOE+rqB+LqQ9BvgaNdc=; b=H
 95/2FAdzAx7yhJh1aSOpg72Tda7CBZQ9snwvbqfYGJXrCZy3dkQ/Ffh/yHUbObSH
 8tmiGdgIl37ZDaqx8iMD+BhizqgdrMX0DzZaDSqKqoC1n9T1Ua1uobkd9KRXY/Sh
 HTb47Mt3SAdfYkip4A95t2Lx52L1SllDpjs1cZuEXWt1jhDf8FpnA0QXTSv5ccOx
 bvmf04QjSGXaqB7GLAgENFOweI9lfz8j4GSQqw7kMppD5Z6LqvG6Jupkk5qwZJDu
 WY/Pl1ZwIqpuRLckzeK4uv1Ljpa0bEB14BJOZzdgBOv77aip4gM7GIcBRHPQd8p/
 Bu9a+5y7GM0J1fR+J9/oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663575923; x=
 1663662323; bh=1VZDD1hptbM/uPXhe71uaw2rLOE+rqB+LqQ9BvgaNdc=; b=q
 idDwg3tBIx7V5YRwUK9uzI/WDvLba75dU/ln7eAU88WXhYM4GyNe+Gm+Wt8xdcyv
 WlhKbTECkPp10oqLmRbHr3MtNVWiGvPl07uGFpaqBkmjflv8y39UT2qDh87Gmu8c
 UQmiBY4mOxLu7ADhKmlSWqB3dWD29H0uFMcs7VijLSYKdLavpvSI5qc4ruiE+3zq
 TvjVUZMRAzA4mKukSpzIxJGCCaWFFeOjnuTAvktIOzZ/+wm6eWfU0FWTHszqFNdW
 BQJwSx09O6CZC9SFbWl/WY6UPlxPbCGs/C3B9wQ3CmOWTQMkCwteR5c2kBIpQqXD
 A9iJhkLWvHl54QwXc/heQ==
X-ME-Sender: <xms:cycoY4PeQAJVlWZASmceLUd4aroS1db29jplT4FzlRdZ7abwn_0lNg>
 <xme:cycoY--LQkCNdtPdYv88FLZSuR2k4DXin9aoVYTdlcaYNeHmr7KAeKoVPbgZ0aOEP
 hJtg8qJ9jF-V-f2Kos>
X-ME-Received: <xmr:cycoY_Smwl9JaEf5YTtIQIGxad2URrU3il49KcyxcbqnbRTdzD7ENFAEtfep>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleelfeeileelteetfedvieekfeefffevhfdtvefgheevudevheejvddv
 ieeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cycoYwu6s22tDF2Yz54YMIiuwCJP_3r0DUaAUfDG0vIPc2zGmQit2g>
 <xmx:cycoYwfdE3eaHgNoxCTiVEPyJHJnk48OKNWDDz6pzlf66gSGrdcmCA>
 <xmx:cycoY00CZOHVSOkVQQTU3CVtfl6XzI7AYAYX3ZA5iDRWLRLEyIS5MA>
 <xmx:cycoYzsyS3YmG7F2bA4N8mog-eahvZ_x7rPJHth7-8i8xpUceCTszw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 04:25:22 -0400 (EDT)
Date: Mon, 19 Sep 2022 10:25:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v4 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Message-ID: <20220919082519.s5d7llmynot76xsx@houat>
References: <20220919071531.105124-1-jose.exposito89@gmail.com>
 <20220919071531.105124-4-jose.exposito89@gmail.com>
 <20220919073645.uf64enluhiwd2b2i@houat>
 <20220919081801.GA144802@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220919081801.GA144802@elementary>
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
Cc: tzimmermann@suse.de, magalilemes00@gmail.com, airlied@linux.ie,
 maira.canal@usp.br, dlatypov@google.com, javierm@redhat.com,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 davidgow@google.com, isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 10:18:01AM +0200, Jos=E9 Exp=F3sito wrote:
> Hi Maxime,
>=20
> Thanks for looking into the patches.
>=20
> On Mon, Sep 19, 2022 at 09:36:45AM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Sep 19, 2022 at 09:15:31AM +0200, Jos=E9 Exp=F3sito wrote:
> > > Extend the existing test cases to test the conversion from XRGB8888 to
> > > grayscale.
> > >=20
> > > Tested-by: Ma=EDra Canal <mairacanal@riseup.net>
> > > Reviewed-by: David Gow <davidgow@google.com>
> > > Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> > > ---
> > >  .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++=
++
> > >  1 file changed, 62 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers=
/gpu/drm/tests/drm_format_helper_test.c
> > > index 09d358b54da0..71722e828abe 100644
> > > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > @@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
> > >  	const u32 expected[TEST_BUF_SIZE];
> > >  };
> > > =20
> > > +struct convert_to_gray8_result {
> > > +	unsigned int dst_pitch;
> > > +	const u8 expected[TEST_BUF_SIZE];
> > > +};
> > > +
> > >
> > > [...]
> > >
> > >  static struct kunit_case drm_format_helper_test_cases[] =3D {
> > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_g=
en_params),
> > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_g=
en_params),
> > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888_test, convert_xrgb8=
888_gen_params),
> > >  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010_test, convert_=
xrgb8888_gen_params),
> > > +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8_test, convert_xrgb88=
88_gen_params),
> >=20
> > The trailing test feels redundant,
>=20
> Why do you feel like it is redundant? Under the hood, most conversion
> functions reuse the same code, but the *_line() function is unique and
> I think that it is worth testing it.

Sure, I wasn't commenting on the code itself, but the trailing "test" in
the test name: drm_test_fb_xrgb8888_to_gray8_test
                                             ^

Which is redundant since we already have "test" in the prefix.

Maxime
