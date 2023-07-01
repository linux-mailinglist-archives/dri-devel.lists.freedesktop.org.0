Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F039744B92
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 00:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0537110E117;
	Sat,  1 Jul 2023 22:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416A110E117
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 22:07:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 689A53200AAA;
 Sat,  1 Jul 2023 18:07:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Sat, 01 Jul 2023 18:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688249229; x=1688335629; bh=kV
 GVKnBuIHX1l6ALTLY/SHtLDLdOEUzzM5SZf1Sp8Xo=; b=CHpIIZ2i4wn4xbUn9m
 9zZbqmCR28xZWOFi6mVjHvWitYI7ASw2jR0Mw40cYfATMDL4/0tOjKsjvSsYKODm
 JW0ugQCF6Jtfe+CXssc5UXmySpMpO5dabuNjCVqsMhWrn85gyQ3WXAr1DrV3uAgG
 tazH8jJ6IQIzZwZC9C6jZMLsMo1At5gkkJWe564pdKze/jeC1l0P+80J33nbr0m6
 YTZR+10N3rCdURAo0tfyGkGMOPplLzIA81dO2IvVFiuM3r6nRb+x+LJT98pPLcXq
 WbNEfeVMtHiS0zKhcRr+gb+YauTWYkVTa/lyB2VCBqgiHitOeN6muHe2Ggl/x8EC
 MyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688249229; x=1688335629; bh=kVGVKnBuIHX1l
 6ALTLY/SHtLDLdOEUzzM5SZf1Sp8Xo=; b=K2azXMowjA85OuykdPZphJ1HUWkYg
 NoURe5epWQCQd55n9jx39YOFXEUlt+eK9HR6rJUb+ZzhCCDFfXry62A3vRf+BZJZ
 lJTJXMUpkt2scV8I8QApEW0BqJZsIBfkjogFf+5Sq1CmHZuz4ZpF4h1VOJl+e8xJ
 PE/ew5GiULriP0Bfj+nfYZ6NjLEDXrlWYK0vADkglkxcnRguheSDDLSSfu3GnYse
 SaJj1yuTOq1CsppS1GP2XNYp1EeX5Ts+QS1bsYQ/3sP8QqGQ3SxBmr9zEyFm9ojh
 /Mxun0q2Zg1jCqCAEIReFf6CygERI2ISx06S6VPBF7UpMu9p9XepRyIdA==
X-ME-Sender: <xms:jaOgZGWXBtzsHMZKfqVhqxnmwe0FzRQVGKTrDwrIdlA3XPXS8jwDYA>
 <xme:jaOgZClQ5Qk8aUFevpvqL6BR0L0txvhI2H1sr2fVmEtqS4rq3A91wIMXH0qyPV42S
 DAcK2MfmIlrM3p3L8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdelgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:jaOgZKZP1Kd_EAaYCyTnulg3-zXoCXkiTcUEa4SM2K3ombr9GMmw2w>
 <xmx:jaOgZNV54NqnZniCWUSR3IhI5COBUO_QHnY5kMnhX1Zldbz_GecmYw>
 <xmx:jaOgZAkCqSFe2gBfjn7NtFlqs-L1kBx9HaOCyIWgKX-D1H4QC4zjtA>
 <xmx:jaOgZOafDBBiS__PtiplermowfLodLUywd9vo1m7t_xAyiUIsO6yrg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 10A3BB60086; Sat,  1 Jul 2023 18:07:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <2e1af219-a31c-4284-b50a-662f65c8a736@app.fastmail.com>
In-Reply-To: <20230701214503.550549-3-javierm@redhat.com>
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-3-javierm@redhat.com>
Date: Sun, 02 Jul 2023 00:06:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: Make fbdev emulation select FB_CORE instead
 of depends on FB
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 1, 2023, at 23:44, Javier Martinez Canillas wrote:
> Now that the fbdev core has been split in FB_CORE and FB, make DRM fbdev
> emulation layer to just select the former.
>
> This allows to disable the CONFIG_FB option if is not needed, which will
> avoid the need to explicitly disable each of the legacy fbdev drivers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> Changes in v2:
> - Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).
>
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index afb3b2f5f425..d9b1710e3ad0 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -132,7 +132,7 @@ config DRM_DEBUG_MODESET_LOCK
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM_KMS_HELPER
> -	depends on FB=y || FB=DRM_KMS_HELPER
> +	select FB_CORE

This will unfortunately force FB_CORE=y even with DRM=m, it would be nice
to allow both to be loadable modules. Any of these should work:

a) Add another hidden symbol like

config DRM_FB_CORE
      def_tristate DRM && DRM_FBDEV_EMULATION
      select FB_CORE

b) move the 'select' to DRM

config DRM
      tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
      select FB_CORE if DRM_FBDEV_EMULATION

c) Remove the 'select' and instead use the default 

config FB_CORE
     def_tristate FB || (DRM && DRM_FBDEV_EMULATION)

       Arnd
