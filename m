Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D4687D73
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1710E4FD;
	Thu,  2 Feb 2023 12:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717E610E4FD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 12:39:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95DA458200E;
 Thu,  2 Feb 2023 07:39:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 02 Feb 2023 07:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675341556; x=
 1675348756; bh=66544bd5OlXqw/yfmhmprOXzWx+UMIFlGhBeotohUVs=; b=C
 foF4xKupoAX8Lakv+HZys1O0vgSz/EolME2suCvDqv4BsaOB41mP6bk7uaPj0cfn
 RmGZNDqqb+YH0PF21kGW9HGh51YuxxVnFldIDdiDtvn3mpdbY7h6KKfTn8UhajSZ
 G3C/hWjGlBRUyOfPBxAVMbSItrYatxHRvYlveotDTJ+lA0hZkRJGlXeY8mcwLU/D
 8oLMEUT4/OOPRlmAiD6JlDAKNtZm789OmSmLSGRJf1eOLOfc9zV8bsIx31b2BoVZ
 eg4FBXCL/eT4kamydiDEPpKHA7Z98Tp9zh07f7vT/E6QwnQVOgRrrPklP+SYE9Cb
 mDIgXsbiIOpKxcEjD/83Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675341556; x=
 1675348756; bh=66544bd5OlXqw/yfmhmprOXzWx+UMIFlGhBeotohUVs=; b=T
 r7cD7+QMOrRbxwe3iGQkD6Xb10rP1Y1CxO2iYGP0FdApirAYVCVXTvNWKZcP+zzN
 FEYqSLwR+rzDQavOcAU2mnkDmkySGXtWfhq25+XjK5wDhUnJSZ30TDmFEZDVKIJU
 YovYSTIAcSX+k4LMVutu/PTr/swMrXaiA33Q/7+orZ9u6CHEQDPxf6uDw5FYzgua
 mtzEbdlHGu3q6rB2tPllVgvBILj7s6ke1PEbZSae3Uv1yoNhy9uCLk5U1LGJH1jv
 5D8sdBV5bVsKJmKnRee2hqxZqr7jOixGnQtlffZomqSHbGooS+ft/gDeXkgORcWO
 Z/ZucQrlppwgmFXQsYPlw==
X-ME-Sender: <xms:867bY_E_9dg1ZxZQr76Tp1CZ9D_LtOr1ISnxj1vL48rBSp6QLqaG8A>
 <xme:867bY8XbAPBNcOAf6_iGvjrnIxUyhZ4fqtPz2LBHCJ5C6TmhcwTxwXcBh6Y0sKn8b
 0mh4iJbqIuCtYkYzMQ>
X-ME-Received: <xmr:867bYxLpzFyTF3_Fx9kwtf8bJVRmRobbCl82uKa0MbjdMGMvvnabb4ItQARMX49-9qvAHbuwi1vpLh7NGy0yNnUP2S2rm4EFDTP3h-RwI9nY8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9K7bY9HUIFoba9yXCteBqx2QW5sMDXuXCBM1wDCoUQ9zOlMxowqmrw>
 <xmx:9K7bY1UnHorjZpQcwuXnFZRPFOxx4kU5B3OHttMIBSIjKb-FUnK3bA>
 <xmx:9K7bY4O5b19owAdMhK8UIKvvb5tkClos8V8PlZ_QtOfiFxLuVrF4Mg>
 <xmx:9K7bY4rZZAGwj38poOvksw7HyqoLQz2MfIsGxratmFv5WRK3iarsoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 07:39:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230202102346.868771-1-arnd@kernel.org>
References: <20230202102346.868771-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/vc4: allow DRM_VC4_KUNIT_TEST to be a loadable module
Message-Id: <167534153408.825132.11115041356580033234.b4-ty@cerno.tech>
Date: Thu, 02 Feb 2023 13:38:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zheng Bin <zhengbin13@huawei.com>,
 Danilo Krummrich <dakr@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Feb 2023 11:23:32 +0100, Arnd Bergmann wrote:
> In configurations with CONFIG_KUNIT=m, builting the unit test
> into the kernel causes a link failure:
> 
> arm-linux-gnueabi-ld: drivers/gpu/drm/vc4/tests/vc4_mock.o: in function `__build_mock':
> vc4_mock.c:(.text+0x6e): undefined reference to `kunit_do_failed_assertion'
> arm-linux-gnueabi-ld: vc4_mock.c:(.text+0x9c): undefined reference to `kunit_do_failed_assertion'
> arm-linux-gnueabi-ld: vc4_mock.c:(.text+0x100): undefined reference to `kunit_ptr_not_err_assert_format'
> ...
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

