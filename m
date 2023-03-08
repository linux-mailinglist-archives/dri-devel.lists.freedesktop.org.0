Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234B6B13F2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 22:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09510E71D;
	Wed,  8 Mar 2023 21:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FFE10E71D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 21:35:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id E12FF3200893;
 Wed,  8 Mar 2023 16:35:19 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 08 Mar 2023 16:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1678311319; x=1678397719; bh=3M
 jqPl34s3Z0DxZ95SEFHFqhYpQWxX80N5mapvV1olM=; b=D774f+OS+fX5cAxotv
 20JQC+4otb0th+n+4wcvY86S9jjTZNvssk8H7nRHmyjPe4Vjo0k3YaDiBMy+ENys
 YGGJ3tZjpUPLC7PUUffVBNxV6x6MAxzPKKHnTR5S2t5aqmF4sNV4tz6hp1zRT+Yh
 Q8it4dbcSs4+IlWVwQ9oGYRGAE97Sgfrf9z7PzbPUu9wy3PChkGK2jTsVBcxC7tk
 XL2BhUX64Gx4UKBPeo6/nbq11cQiAt038aJrc3RzbhXKh99kLsVyGOBlxx3IfKEl
 W+6QZ+6eIeZLMbbBPlqH0WbJ2DPsnLGmwdfkRZtF6l9dveKucmQaY1izxNhB2Ud6
 n6EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678311319; x=1678397719; bh=3MjqPl34s3Z0D
 xZ95SEFHFqhYpQWxX80N5mapvV1olM=; b=sU2i1B0PgZASHrK4oSqIjXMY3C6oJ
 juI6YpQbT1VDN7wtHTd2UeNclaos9/UVOJ+0BwrYgAd53flvOSkx2BxBGcvdTC3L
 c/oOK9/xCMowr2YbfJYsGiOX3G/6l8lSih09mIylvGaFNzQgXemVXDgPNrt2X1i5
 7atX89gN4zeQr4dAIecquhLSWcZvhNCd9dl/L3ZwP54STLon5z7EJ98fd45SKjJm
 BHNlvwY+c6LNw7eGA/p50N8j6WfI0Nf1eXM41Qd72dbnVywzFoCRUAZE/BUdHC8k
 uXgODE2UuNX0yHH01KRVIQCRi9d4uwI8sU6NPNwWfFuvY4YbtzXu9Q8xg==
X-ME-Sender: <xms:lv8IZA1tOXVUQtPtleY3hiQBxGCr9d_Rncr1hKFCXmzX9rkApbr5Gg>
 <xme:lv8IZLE4X5dazOcpmAEjnWQQ12zoXkvla3hMKkD5D9_Sb8lhGF-lWgr1YmHj2eXbu
 agfmBE7YlsKm_3VBXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddufedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lv8IZI6BBrkUHOLA1QEcbacVbVjAjvlIAsorK8j0FRdA247ZoPUOPQ>
 <xmx:lv8IZJ0p9ndc4Nnaz6oY5NyU1R6evB7bhMb6sGhV-ib_sNHTxPwzPQ>
 <xmx:lv8IZDGKMvxaB1nXpOGabWk-dlUyt4u00ekcK8gAZ23ub8bzyKq-rw>
 <xmx:l_8IZL8KhPzeLvgFCsinpmEYV8ANhzIXWP7nmGrmqfONml54WtP77w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4524AB60086; Wed,  8 Mar 2023 16:35:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <74915109-446a-4c1f-91bc-95dc6e3be200@app.fastmail.com>
In-Reply-To: <ZAjphWYHDoDw9sQS@bombadil.infradead.org>
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-2-bhe@redhat.com>
 <ZAjphWYHDoDw9sQS@bombadil.infradead.org>
Date: Wed, 08 Mar 2023 22:34:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Luis Chamberlain" <mcgrof@kernel.org>, "Baoquan He" <bhe@redhat.com>
Subject: Re: [PATCH v4 1/4] video: fbdev: atyfb: only use ioremap_uc() on i386
 and ia64
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
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0On Wed, Mar 8, 2023, at 21:01, Luis Chamberlain wrote:
> On Wed, Mar 08, 2023 at 09:07:07PM +0800, Baoquan He wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
>> extension, and on ia64 with its slightly unconventional ioremap()
>> behavior, everywhere else this is the same as ioremap() anyway.
>> 
>> Change the only driver that still references ioremap_uc() to only do so
>> on x86-32/ia64 in order to allow removing that interface at some
>> point in the future for the other architectures.
>> 
>> On some architectures, ioremap_uc() just returns NULL, changing
>> the driver to call ioremap() means that they now have a chance
>> of working correctly.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Baoquan He <bhe@redhat.com>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>
> Is anyone using this driver these days? How often do fbdev drivers get
> audited to see what can be nuked?

Geert already mentioned that this one is likely used on old
powermac systems. I think my arm boardfile removal orphaned
some other fbdev drivers though. I removed the ones that can
no longer be enabled, but think a bunch of other ones
are still selectable but have no platform_device definition
or DT support: FB_PXA168, FB_DA8XX, FB_MX3, and MMP_FB.

These four platforms are all still supported with DT, but
over time it gets less likely that anyone is still interested
in adding DT support to the fbdev drivers.

    Arnd
