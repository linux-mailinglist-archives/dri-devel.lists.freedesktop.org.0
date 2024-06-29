Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51B91CEF1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 22:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6410E0B8;
	Sat, 29 Jun 2024 20:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="NSKX47Ok";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="RHUZ2AJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 482 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jun 2024 20:06:08 UTC
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9310E0B8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 20:06:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id BEBBC1380116;
 Sat, 29 Jun 2024 15:58:05 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute3.internal (MEProxy); Sat, 29 Jun 2024 15:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1719691085;
 x=1719777485; bh=ZUinz3c0EPh2xbp1fKbAMnO7vrSQRwIYAuPjr4UIcGs=; b=
 NSKX47OkG5ZWRA3a/+WHuqwhyzX0HFkG5UVC8NwwVElKeFqt1aYE1uvKolR3+Awv
 vRwAMsHKOUduqAVdOtsd14xY+9abSdL0VCiVJft9q2TeUGETwZ+UJC3T7DwyWLyp
 pUiKwc8pUksWPaz9VO4n4Mumv8cvoRM44NEc0vHMPmhOlpJsnOuORUopXJqhzeFR
 fNksosZZKIkNdxfoMP+ORAUtGdX2CdhtH1ZHm6G6A41TmpFxTBprc6c5ISmdghAX
 3jEX0JZE2SifF29fHolOo0ipdMyp1k3w/YW0wsVOIAj5q09DPkx8iRDvxMJmrtyc
 Z2NrSXHKqWNTOpFYE67viQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719691085; x=
 1719777485; bh=ZUinz3c0EPh2xbp1fKbAMnO7vrSQRwIYAuPjr4UIcGs=; b=R
 HUZ2AJhUmyJq9cu5nmZxcIwIgCof5SDgJndvVTLf2FTSjbB+YuVzu5KygM7tKy9x
 OuCOz3k5c9kjFW4BqIHxsNgVukYDGpX+n84F6YvPcgu4m92UT4qPKurPASs0KsvA
 Ujrsi2MI9bNJqUhrin5BWgA3NCXMygkjMwfSKhe7+0+luZIceaos4IejeRAepsIN
 fJlJzDI+Bmx1goGkUvZwsTovUb6zud2hYLKHr4i3ZFF0j2r98kjnULXu+Fbnqs+z
 KoMIf+Ve7EunODw3zWJF7lTuErUf+K9uf7vbV1IhxcuYHdh0SrrO7uLKP3WAVHQj
 egolU7fv/mT0lT2Dluo4w==
X-ME-Sender: <xms:TWeAZm4nbSyKOZXsxeRlqMamDx5Wn5Q1ICZkBIUrFvEKBlI_RVhm9Q>
 <xme:TWeAZv65RAHO0tN4ZJz9IP2lqNyUmcQHq6ZRyEyW7oRROmA3q-Lju6MSoDrZDMX3X
 KOKLEC1BczVJbw7EtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdelgddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
 ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
 ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TWeAZle95fp4Uf0U1f-nqQHT64Ww2D0MIC55MXxWZBHWxroSwRfrNg>
 <xmx:TWeAZjI0BX9iwKo9vko5JH-fJrSc6W3Jg-Lly8Kbi_xqzDokEXHfxw>
 <xmx:TWeAZqLpd3jZHjP7lNblDdAoDm2fMAgTZekQD5YDOUKd1_-Cq20RuA>
 <xmx:TWeAZkyiNGVe8w_NTGRZoJCNTDoc4BNjUCriQ-yvy79p7DWgTZpsOQ>
 <xmx:TWeAZnXFd86pRMIJwCCa-BW0KPCFCIxKvizpVzSuZyO_T3711BxjkggS>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EF19836A0074; Sat, 29 Jun 2024 15:58:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
In-Reply-To: <20240629052247.2653363-3-uwu@icenowy.me>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
Date: Sat, 29 Jun 2024 20:57:47 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <uwu@icenowy.me>,
 "Christian Koenig" <christian.koenig@amd.com>,
 "Huang Rui" <ray.huang@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



=E5=9C=A82024=E5=B9=B46=E6=9C=8829=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=886:22=EF=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
[...]
> @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo=
,=20
> struct ttm_resource *res,
>  		caching =3D res->bus.caching;
>  	}
>=20
> +	/* Downgrade cached mapping for non-snooping devices */
> +	if (!bo->bdev->dma_coherent && caching =3D=3D ttm_cached)
> +		caching =3D ttm_write_combined;
Hi Icenowy,

Thanks for your patch! You saved many non-coh PCIe host implementations =
a day!.

Unfortunately I don't think we can safely ttm_cached to ttm_write_comnin=
ed, we've
had enough drama with write combine behaviour on all different platforms.

See drm_arch_can_wc_memory in drm_cache.h.

Thanks=20

> +
>  	return ttm_prot_from_caching(caching, tmp);
>  }
>  EXPORT_SYMBOL(ttm_io_prot);
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt=
.c
> index 7b00ddf0ce49f..3335df45fba5e 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  			       enum ttm_caching caching,
>  			       unsigned long extra_pages)
>  {
> +	/* Downgrade cached mapping for non-snooping devices */
> +	if (!bo->bdev->dma_coherent && caching =3D=3D ttm_cached)
> +		caching =3D ttm_write_combined;
> +
>  	ttm->num_pages =3D (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra=
_pages;
>  	ttm->page_flags =3D page_flags;
>  	ttm->dma_address =3D NULL;
> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_cachi=
ng.h
> index a18f43e93abab..f92d7911f50e4 100644
> --- a/include/drm/ttm/ttm_caching.h
> +++ b/include/drm/ttm/ttm_caching.h
> @@ -47,7 +47,8 @@ enum ttm_caching {
>=20
>  	/**
>  	 * @ttm_cached: Fully cached like normal system memory, requires that
> -	 * devices snoop the CPU cache on accesses.
> +	 * devices snoop the CPU cache on accesses. Downgraded to
> +	 * ttm_write_combined when the snooping capaiblity is missing.
>  	 */
>  	ttm_cached
>  };
> --=20
> 2.45.2

--=20
- Jiaxun
