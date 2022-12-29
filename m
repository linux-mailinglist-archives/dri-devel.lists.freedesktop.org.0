Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E6658B0C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 10:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7C410E252;
	Thu, 29 Dec 2022 09:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8C310E252;
 Thu, 29 Dec 2022 09:32:41 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A20595C022E;
 Thu, 29 Dec 2022 04:32:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 29 Dec 2022 04:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1672306360; x=1672392760; bh=dQitIKz9Zv
 Mk4oytHD9JLdnkBzb2SNyrpGTj/IDH57g=; b=V/5Cv1VhfpH5iTFAIPNbee37+7
 fGRfQGhS2cfvaoU5prjYmzEkJOixzWrHBayYA/LAbI8aGtT5NUL+owTmoaFj3n3B
 LJoHwRocbJtfuMEyHSx/wyanvvQ13DDzevGclpYyw7qeYNEVViTXINcAj0D9vgsh
 7pfvXG5yZXolmbAG1xnYy8Ot//4tvH7LNGG1PIQsV13T27gAt8TnwFw1loQa0vbD
 oPcv9yAU1hrNnDzJ4hHBOxfksO9Tu+rLYKEWw8IH2L2YS5xRATHewhb6Zy3ABb5W
 Th9HksHzXkv0qeIqDaZbZW8EtN2KMBSeSVjD4popm9MiVXhAr8il3YStrrLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672306360; x=1672392760; bh=dQitIKz9ZvMk4oytHD9JLdnkBzb2
 SNyrpGTj/IDH57g=; b=iDQJHK36vHwWh1wRKl4E4QER7+DQKeClUsyglmglgxkg
 EljL62jR2iZg18aei0CuCeH832VH529cwGFTM79QLvISe5DOGQCCaE9a5nVoNcdT
 vRyncomABgBeJ3SsaAqCusYLubSRqSwkWTAzvRqkgUp7P/uDuSrSC8oJAPjjHwnG
 Zd0Dd9LmkVGzRX1+/eSzkb96N8eNNz/u/R6Fm30nUUZjYR3EyVzLMio8jHJyXxIj
 iQzshYRj6uSLjiurv3YD4ZUHN8c2WtRhXRw4+fHy6C13RBukmzzaZvqF15WJiEkO
 SQyTebTGPXArLBywDKO2H+WZBi9s4A/HPkn50Hzk8Q==
X-ME-Sender: <xms:t16tY_xTXyOBxZzRlwIxGAjI2ettOKadK7A9iMGmJP2qRljOTcBayg>
 <xme:t16tY3RGUfHsWbJR8Ja2QCw0SFyKp0uowcI1CysTjogMdtCluR5C8uHqieGWGVAVH
 SG9ndtEeyJsrl3xTZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:t16tY5WPN0eRhQuqkXR1eQBdMOuAo-5nAJJ36hmRXP0lPVn6iv5ojg>
 <xmx:t16tY5hs5xXyUOxLtmXCD1t9iRdCyPGN1E3t5Pc7uUgssA87nClWZw>
 <xmx:t16tYxCRfWeK3MQh1NvH9n9BHNHyKE86lXXcTf6N2kZ0kJveeEq2-A>
 <xmx:uF6tY2yAnrmYZFHKR9Art5c4-CoKhKbO440aSm6r1v3bh4Mq4Q8mmQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AA077B60086; Thu, 29 Dec 2022 04:32:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com>
In-Reply-To: <20221222114635.1251934-3-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222114635.1251934-3-andrzej.hajda@intel.com>
Date: Thu, 29 Dec 2022 10:32:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/19] arch/arc: rename internal name __xchg to __arch_xchg
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 22, 2022, at 12:46, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  arch/arc/include/asm/cmpxchg.h | 4 ++--

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

for all the arch/*/include/asm/cmpxchg.h changes.

Since these patches are all the same, and they have identical
subject and description texts, I would suggest combining them
into a single patch to keep the series more compact.

Having them separate would allow merging the patches through
the individual architecture maintainer trees, but that in turn
would mean waiting longer to get it all merged, but in this
case it seems way easier to go through the asm-generic
tree.

     Arnd
