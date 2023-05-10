Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C66FDFC5
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8F10E4A8;
	Wed, 10 May 2023 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3DB10E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:16:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5CFC4580437;
 Wed, 10 May 2023 10:16:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 10 May 2023 10:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1683728171; x=1683735371; bh=V2
 31ipRgvlb0JsA/vw7lkaJwJ/EU1whQFMWkiWFARX4=; b=QDwDJwdPNOvmhCdCh1
 X1AzrK6ph+oBrK0NV15G0CQ8a9EDXGHxarQ3pDgVXF+shwORiOHLGunzBgsDgzsu
 3Jk7Q6CBdAdljBawM7jn7aRJKvOJJNChqOIJnvjDb1LbTSD3CH6/2QlhdGYgNfl2
 KWG51s9KkKlvip8YE8wc3Quv5zW5dDk4YJO64662MGeubJQjnW5D32UmiJgetsNX
 dyn7OqjxwCqpNLnU2jDpnlW9P3voCJQ1fKWAlav6KrP4TEUwdjKp5o3Eva+Ijevj
 NPQceRpOvnU+fYqKcug9ffwTp5pTpOjAm3p426I5mfBr77W7I2RNO2FW7dEKduwK
 zgRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683728171; x=1683735371; bh=V231ipRgvlb0J
 sA/vw7lkaJwJ/EU1whQFMWkiWFARX4=; b=B5hQd3yatPe3qSoPzFvzPZJAmfD0K
 dxk5GGZvu2u4FdCE4FJoefX8jsJZJD35cLnXZ2y5Cu6AxTtjYpw2UKLTE1xfnGnO
 1s5E87JphmtKXAutHOshfD4lN4UfDh9LmoUP7KN8YRGE/at8TtsJHl9liZsqLodQ
 912B+XAj1UxofPVezlCMErSfoYkdf/ARyg2yjcpYZs3SFx1pOAtM+E/yKdUnak0T
 yF54H/cWDqVRszmOqNnYzTeuGdUmcmYH0gP9jBBcbVPy7V2e/XoF3RdirCLxC+Jz
 jjH2KGbh58BDdgHKhWK08bfQc7iMT6LBy6YiFvlui8XyiAxtzcHwpwDnA==
X-ME-Sender: <xms:KKdbZPWWyAbxIJr9yq7gAvPfcyHNKlbGruUy2p_rYKQB2CjcucJMHw>
 <xme:KKdbZHmA2gI4C84zAmw1RBGc_9stP0sDzYCTVKzXgiyLz_shij5DahgL70OcWoa5R
 LUrkzcCHQ_q11h8XLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:KKdbZLbBYdtcvHvgeoBb_WM2dfH1Kxrj1-tEPwl_7I61ehCH0wdMxg>
 <xmx:KKdbZKVqVOn-9ph_fmLkrDW81AOHaxQMHIsUCLmdBfoM2j2A0Bm7-A>
 <xmx:KKdbZJlqIdOOjUvzb00Yyxi6XvFRuZECGtoLKONQ5G6hG083DJ0rGA>
 <xmx:K6dbZLVPpbWVfjK3RMLY0JT5mhgDGnkq-fxyLxVnEi84wVrL9oSx9g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DD83BB6008D; Wed, 10 May 2023 10:16:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
In-Reply-To: <202305102136.eMjTSPwH-lkp@intel.com>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
Date: Wed, 10 May 2023 16:15:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Vineet Gupta" <vgupta@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, suijingfeng@loongson.cn
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023, at 16:03, kernel test robot wrote:

>
>    cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory 
> [-Wmissing-include-dirs]
>    cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory 
> [-Wmissing-include-dirs]
>    In file included from drivers/video/fbdev/hitfb.c:27:
>    drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
>       18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~
>          |                                 |
>          |                                 unsigned int
>    arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 
> 'HD64461_IO_OFFSET'
>       93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)    
>    /* Accelerator Configuration Register */
>          |                                 ^~~~~~~~~~~~~~~~~
>    drivers/video/fbdev/hitfb.c:47:25: note: in expansion of macro 
> 'HD64461_GRCFGR'
>       47 |         while (fb_readw(HD64461_GRCFGR) & 
> HD64461_GRCFGR_ACCSTATUS) ;

I think that's a preexisting bug and I have no idea what the
correct solution is. Looking for HD64461 shows it being used
both with inw/outw and readw/writew, so there is no way to have
the correct type. The sh __raw_readw() definition hides this bug,
but that is a problem with arch/sh and it probably hides others
as well.

       Arnd
