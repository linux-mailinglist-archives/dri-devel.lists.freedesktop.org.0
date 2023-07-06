Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB9749AD1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 13:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ED910E4ED;
	Thu,  6 Jul 2023 11:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5AC10E4ED
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 11:36:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C5ACE5C01D8;
 Thu,  6 Jul 2023 07:36:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 06 Jul 2023 07:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1688643418; x=1688729818; bh=V2
 GVyzbuGpx5LAGEmGZIO9Q4opt3w5S6CEtcWsvxNJ8=; b=UVGjMsbpbXIM4jxAOa
 9J0qoC6OWsSZc/7xG8sZn/3AEdYs9CsuTZd8l/RylcYJLubrwkBhMTd1sY8KDpM0
 uLtrS+0nPFhBMs7ewCBOT8SlEcW/HsJL2RnAYFS8pdWKUz0X+O0tfW4JnbMVkoJ4
 yNZTJdckpN5aRUW6N0NiMQ0WRx1DV1DqAHYBv4FAuPX0VA9EsGm9tMOC9aa+yxwL
 Im2rAELGOrfA4B+WtxdMDjfKpB/PZGHskUkPzojz1OWioMNkFvuAx2MACzzyU4bN
 DoNtOqBeC55ZpxK/Thn8ZdDQKWfEHFk0K45xAVzqA9ibO0ZGogYZnRiethOHSYMl
 7whQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688643418; x=1688729818; bh=V2GVyzbuGpx5L
 AGEmGZIO9Q4opt3w5S6CEtcWsvxNJ8=; b=K+m5dJkfPCgmSVH/dLFHsclbzbZDE
 HKsqibR7Z/QbmKSNVcErjnfS9ZuBWCtvtBUM+gvnETdaoYQHOTgFW6MiwHtDAO15
 y9CLgMNNZieuWtUpY+ZBslqW9NVWXOnCeQBNfot/M2sKm5qdeMlu+0EkpZHxJ2sQ
 D/nTunzsl8ihdpoXvHWNhGavfhfTKotFMpSrh9yZHTAUGLpkCd3Dklcq0U6MhE8v
 MWxKWqZoxvD3ppmictSvgrhIZ2mo7+hBnBCMM5B1r7Qnnslk+7jJuZ4juZgM4+9p
 /PJR9o3cPZ56qkJv9qYcmkatYy7R9ElS0hRtBVyjYIX8j4IxtIrSTBLSw==
X-ME-Sender: <xms:WqemZAgJIsuxHl6JPpfh8YZDOiChJjyLoxYTPeHQXOFpE5HdQVcWUA>
 <xme:WqemZJAk8ZymVcDWm609dMdD4-2iZtbDzRlHXl2zqmuUWYJsHm9pUu-vFl6GL7QCN
 2kEm-G2ttKimDLdhlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:WqemZIFJpgV2scPlMi8jZ62mLVjDo1OCnVy5cRCEpCI17zrhvt1JFQ>
 <xmx:WqemZBSeprPRYFZ1UUntrHk_iYc85YHY8lEjSzwwPR2XopotCQgxvA>
 <xmx:WqemZNwKq37yARTYZDibTDNdB85ZyRoXRsvdKrsPQlXSqAB7uxGnIQ>
 <xmx:WqemZD7yut4yLI-pLENuYGTzgfDzZXrdUiZDV6zxI-YP2ZSWF_j7yA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76279B60086; Thu,  6 Jul 2023 07:36:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <e15b9886-64af-481f-8c60-5e7a772af4ec@app.fastmail.com>
In-Reply-To: <20230706104852.27451-2-tzimmermann@suse.de>
References: <20230706104852.27451-1-tzimmermann@suse.de>
 <20230706104852.27451-2-tzimmermann@suse.de>
Date: Thu, 06 Jul 2023 13:36:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sui Jingfeng" <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2 1/4] efi: Do not include <linux/screen_info.h> from EFI
 header
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, loongarch@lists.linux.dev,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023, at 12:42, Thomas Zimmermann wrote:
> The header file <linux/efi.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements. Update a number of source files that
> require struct screen_info's definition.
>
> v2:
> 	* update loongarch (Jingfeng)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
