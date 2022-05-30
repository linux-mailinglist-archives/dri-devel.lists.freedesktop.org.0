Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62D537B1C
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848D810E273;
	Mon, 30 May 2022 13:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E05710E273
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:12:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D21E25C0053;
 Mon, 30 May 2022 09:12:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 30 May 2022 09:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1653916321; x=
 1654002721; bh=HUT5YSA0RJcKsWMT2WGJiiWtnO6QuCOi5gIB32Sx+LE=; b=W
 srzmFFC2nG2ACXrgigNjV+Vff6y5F3Uvpe5W7XXGJaRusOfKDo/o2qVVdfvdKrF2
 eG/qBJ2jk1e+/ISErAQ1nCffWdUiTqDb3Lq+ovt4OZIv3LXEeOiVEEqEkJoyGqrU
 72oTRjOy06P2szX5xn8Y00WG+NHDJKVbE9SnDphO8KjN4kdCiKrmwHLvReAg6x4C
 1lvgQtTIkk0EiuvsEssfcZ5vsBRiPni8r5y5E5THPbv3hoNM5+0BqrsNviCULJV8
 j79EdvYbpm67GV+0AO5vOeEwG+B7Gp8hyjLmcfBPNk/1tBGZqtJA3HqSVZYb1p/P
 uTcofsaXtX3JeN3LtBMAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653916321; x=
 1654002721; bh=HUT5YSA0RJcKsWMT2WGJiiWtnO6QuCOi5gIB32Sx+LE=; b=Y
 wmGfhxw4tXrnr6zanebuNDFDcbJSXQvIfBX/I2lNgNFuawqz9WkOn+fM6ljWxjbP
 Kt2jIrdHL7a/Ivdxy8dup+noB42RvWQ2/mQQql4ToBeeoucI9kxBCib1ydeIha8F
 cI2mvQT7n5rrKU2bittNd1GuaQIVl9riv5cVoeHwKHz3k3BTR4FYLn6bU3d4VQWZ
 5dyCEtEwCINFiFyhEnMylO9Wuf/+iSA9moKY6QxlQl9n9ltyksrvRfKs6/hG1RNK
 0iZ/rIFKxuOdN8cU/FHi9+9o6USC6Xm2v47jvWVI1age6cR+rWRZUBXpfk3WfBB4
 f2hvZ9hEjtU/Ik/hFXz0A==
X-ME-Sender: <xms:ocKUYq7Pu_P-hqQQKRi1qnkpCH9HVO6daeqR4dQ8TmAYwnWCZPgMdA>
 <xme:ocKUYj7d6yOWlcK45F5z1Y9DRLu4V3epgsYV2GPdXlxiwSpnk6hfe-LwrZuCWgXkc
 tquqX-gejoySAJfGjg>
X-ME-Received: <xmr:ocKUYpc_u-Trp4fF2wD3AYkWb5bUTmWJX0VwnRtauukm8vUYRtFlDE2IVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelteehtefgffehteduhfeiuddtffeivdegffejteffteffvdekiedvheel
 jeettdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ocKUYnIp83RyDI9wUHn89taCd3dXrHKSObLEg76kIC11AnG1JVHerw>
 <xmx:ocKUYuLVIJAHRozl7Hu7hb-NMrx2VJzEbvK0LK5h9hQZWmtTj7K8ww>
 <xmx:ocKUYoy5YodBwKrmJRQjdDLic6tY_FRKzrV40wbTvN_kK0AXI3WQDA>
 <xmx:ocKUYm98lGA1yaarZeFtCE92Pf_8PWoxDnlomMAJjLAX4hG8Hh_QbQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 May 2022 09:12:00 -0400 (EDT)
Date: Mon, 30 May 2022 15:11:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <20220530131158.kqq2mohxoh52xpeg@penduick>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530102017.471865-2-jose.exposito89@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On Mon, May 30, 2022 at 12:20:17PM +0200, José Expósito wrote:
> Test the conversion from XRGB8888 to RGB332.
> 
> What is tested?
> 
>  - Different values for the X in XRGB8888 to make sure it is ignored
>  - Different clip values: Single pixel and full and partial buffer
>  - Well know colors: White, black, red, green, blue, magenta, yellow
>    and cyan
>  - Other colors: Randomly picked
>  - Destination pitch
> 
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

It looks mostly good to me, but I think we should Cc
kunit-dev@googlegroups.com to have their feedback.

> ---
>  drivers/gpu/drm/Kconfig                  |  12 ++
>  drivers/gpu/drm/Makefile                 |   3 +
>  drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
>  3 files changed, 181 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_format_helper_test.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e88c497fa010..d92be6faef15 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -76,6 +76,18 @@ config DRM_KMS_HELPER
>  	help
>  	  CRTC helpers for KMS drivers. 
>  
> +config DRM_FORMAR_HELPER_TEST
> +	bool "drm_format_helper tests" if !KUNIT_ALL_TESTS
> +	depends on DRM && KUNIT=y
> +	select DRM_KMS_HELPER
> +	default KUNIT_ALL_TESTS
> +	help
> +	  KUnit tests for the drm_format_helper APIs. This option is not
> +	  useful for distributions or general kernels, but only for kernel
> +	  developers working on DRM and associated drivers.
> +
> +	  If in doubt, say "N".
> +

AFAIK, kunit test cases are supposed to have a .kunitconfig too to
enable the kunit tests easily.

Maxime
