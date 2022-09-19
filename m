Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8595BC38D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1884710E422;
	Mon, 19 Sep 2022 07:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49AC10E422
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 07:36:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 283A25C027B;
 Mon, 19 Sep 2022 03:36:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Sep 2022 03:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663573009; x=
 1663659409; bh=ivBFTb4mJwy/p2/PscYsL8xWxc9ankAdkoVS7A7AZgY=; b=o
 1v8uTT0BWdWJxC8KNrRmrVTHnlI4MCsc7HsvF03en7CLSGRlVUPhI8aml1gZ2lie
 v8bhDBxBIdCFVHXbGaugmC4KQz4tD9PJNarMO8iuqX2VYqd/Q/jMHTBYIwrocYD5
 0bNeyn/28mrMwQYXKiohxRuEitT6iZVoH4NKEw+e8LVNfIUGe9lH7KIBy6fb4UGu
 AFBgPiNmRpss1bJgPUENoSy/z/chM+G8LQ3vA6EiK3KTCNF6X3+w5VA7Xz57KLqH
 VTePxMFKVwjjUDK1JNdr0UVvRRLYhmyJNCV4XyrQFpQQXDbIWdiHg54Rw14HpcKm
 6IPy3DEy4aEdCThcojefQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663573009; x=
 1663659409; bh=ivBFTb4mJwy/p2/PscYsL8xWxc9ankAdkoVS7A7AZgY=; b=V
 qgOQDNLyx6G+k4jCMjLG+kkzWbPc8hKREJi8VuQLvNG0HuqWGCgV89Vi2QG+f23x
 RGAxowstSWCvsMZBJjbci39Vb8CLfXygESig1chzMLJDpTXOXFzkJ+Ech+73tAJa
 ZQgyOUMrTKjd2Lhx3puIeDU7odrms/cSwJNx6sYppttBWt4jgVO1lTk7NTkPeas8
 nfeRrit8GMvlNN1xs9gltal33m6vVprXF/WY9Ecp2uEj8bXvLyQ2MbkGMCB5nsXx
 NC0JF2h/UYz37/zTrpeMI5qEmV8XJr8TsemtCtlInXI6N8mU5owsAPf1iPPAaDwr
 c4yjvzamHIUUrtHJwCSdg==
X-ME-Sender: <xms:EBwoYwsuRJHt5Kfoa26PsBRp6aAk04NDWMad1OwACrzGSwBkc4COSA>
 <xme:EBwoY9eYf19JNMb4cGduDJO9DH2m9ai5tba9Bu7xZF9-svhtHWwXEfmptPHmK3lW6
 AViX3DSQY8qksHt12c>
X-ME-Received: <xmr:EBwoY7yVOZzc3x4rZ4e1tFHLkoLWXTtwmAdBSVZ7zq101BAkOlcfzeHVfGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedviedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
 vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EBwoYzMVP5cYKyJM6TAit-lQWUZE_wCn_mehkSynFERVF42e45KLDw>
 <xmx:EBwoYw-dLxRoMMxHVApzh45TE-I0P5W4hGTB-Z3_01pIG0i9e86M8A>
 <xmx:EBwoY7X1G6xqOBE4JEL45ttgaG5_noh0jyIul7qRdskz71gJhbsnuA>
 <xmx:ERwoYwO0NfoxI5xJYVoKh3ZdC1VydW_KsB_4CGZ_nVrc_o9qJeRPtw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 03:36:47 -0400 (EDT)
Date: Mon, 19 Sep 2022 09:36:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v4 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Message-ID: <20220919073645.uf64enluhiwd2b2i@houat>
References: <20220919071531.105124-1-jose.exposito89@gmail.com>
 <20220919071531.105124-4-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220919071531.105124-4-jose.exposito89@gmail.com>
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

Hi,

On Mon, Sep 19, 2022 at 09:15:31AM +0200, Jos=E9 Exp=F3sito wrote:
> Extend the existing test cases to test the conversion from XRGB8888 to
> grayscale.
>=20
> Tested-by: Ma=EDra Canal <mairacanal@riseup.net>
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 09d358b54da0..71722e828abe 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
>  	const u32 expected[TEST_BUF_SIZE];
>  };
> =20
> +struct convert_to_gray8_result {
> +	unsigned int dst_pitch;
> +	const u8 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>  	const char *name;
>  	unsigned int pitch;
> @@ -46,6 +51,7 @@ struct convert_xrgb8888_case {
>  	struct convert_to_rgb565_result rgb565_result;
>  	struct convert_to_rgb888_result rgb888_result;
>  	struct convert_to_xrgb2101010_result xrgb2101010_result;
> +	struct convert_to_gray8_result gray8_result;
>  };
> =20
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] =3D {
> @@ -71,6 +77,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
>  			.dst_pitch =3D 0,
>  			.expected =3D { 0x3FF00000 },
>  		},
> +		.gray8_result =3D {
> +			.dst_pitch =3D 0,
> +			.expected =3D { 0x4C },
> +		},
>  	},
>  	{
>  		.name =3D "single_pixel_clip_rectangle",
> @@ -97,6 +107,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_=
cases[] =3D {
>  			.dst_pitch =3D 0,
>  			.expected =3D { 0x3FF00000 },
>  		},
> +		.gray8_result =3D {
> +			.dst_pitch =3D 0,
> +			.expected =3D { 0x4C },
> +		},
>  	},
>  	{
>  		/* Well known colors: White, black, red, green, blue, magenta,
> @@ -155,6 +169,15 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>  				0x3FFFFC00, 0x000FFFFF,
>  			},
>  		},
> +		.gray8_result =3D {
> +			.dst_pitch =3D 0,
> +			.expected =3D {
> +				0xFF, 0x00,
> +				0x4C, 0x99,
> +				0x19, 0x66,
> +				0xE5, 0xB2,
> +			},
> +		},
>  	},
>  	{
>  		/* Randomly picked colors. Full buffer within the clip area. */
> @@ -206,6 +229,14 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>  				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
>  			},
>  		},
> +		.gray8_result =3D {
> +			.dst_pitch =3D 5,
> +			.expected =3D {
> +				0x3C, 0x33, 0x34, 0x00, 0x00,
> +				0x6F, 0x3C, 0x33, 0x00, 0x00,
> +				0x34, 0x6F, 0x3C, 0x00, 0x00,
> +			},
> +		},
>  	},
>  };
> =20
> @@ -381,11 +412,42 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010_tes=
t(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
> =20
> +static void drm_test_fb_xrgb8888_to_gray8_test(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params =3D test->param_value;
> +	const struct convert_to_gray8_result *result =3D &params->gray8_result;
> +	size_t dst_size;
> +	__u8 *buf =3D NULL;
> +	__u32 *xrgb8888 =3D NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb =3D {
> +		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches =3D { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size =3D conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch,
> +				       &params->clip);
> +	KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +	iosys_map_set_vaddr(&dst, buf);
> +
> +	xrgb8888 =3D le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->=
clip);
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] =3D {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_p=
arams),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_p=
arams),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888_test, convert_xrgb8888_=
gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010_test, convert_xrgb=
8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8_test, convert_xrgb8888_g=
en_params),

The trailing test feels redundant, and we should order them
alphabetically to avoid conflicts as much as possible.

Feel free to add my
Acked-by: Maxime Ripard <maxime@cerno.tech>

And fix this while applying

Maxime
