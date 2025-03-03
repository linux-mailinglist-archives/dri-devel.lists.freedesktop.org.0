Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71DA4B95E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281A910E36F;
	Mon,  3 Mar 2025 08:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="URTs/h7N";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="c/dQdYU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D757B10E36F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:31:55 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1B733254012B;
 Mon,  3 Mar 2025 03:31:55 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-09.internal (MEProxy); Mon, 03 Mar 2025 03:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1740990714;
 x=1741077114; bh=VDBDcAjc8C1hCmrc3ZAbJzRn82LoqB/QHim1ljqqCMI=; b=
 URTs/h7NehXAEG7+UnxWIBsO+nYRMPnUXDiiSScDKP+5qfbKL3qCgipdiNwtDeGN
 nc/ESKtZEzYXy0HfXJq/fuJNJhDjGXpaiX2EG71JxCyzT8cDUlAxurBbHIcs7Rck
 hC0oXrhpoaso45FQrxSBXtsxPedYK57pUsDN+q1Yijz0l2N3O/ToijcUwkXHxU+U
 LKYcDp6q4VRsEhVQXalkF2g5OiNVDrgams2ga880BMD7X+riERBfE2ghVVEB02xC
 u4VfLgQpLmQ6xrveBS75pKgc+ZGiZQ6Fbptm5UCcKzkUxU2Fs/Xs0zVDeb6QmOlP
 5yaZIKaOIuypCG/ZGSktUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740990714; x=
 1741077114; bh=VDBDcAjc8C1hCmrc3ZAbJzRn82LoqB/QHim1ljqqCMI=; b=c
 /dQdYU+/yS8kMIL97aRpHMt8WvncXzQ02tcdgC3CQ4lUDn8OfCO6utbVp1cX8/Qy
 cBj6BJIYmMVL/AVZigGjVs5FCMa2zDYwgZ4BQOf6yMXxTdtnADCWGAqyK0uosGif
 WpC0ZfosKxIt0FbzpJP2E/WtxKpx4bY8nP9wc1ipGrsfmy1d6S036/+nqgtkZNpz
 a8FwlxOTXKX5NREhHad/l4NavjsRsS5ISmwsDpWCHHn6POAAQP9Bmw3VtYgUsVEp
 jhEhtsVUmhCFx8NSNDrQzZjcdP7pV0V35LcoWbGw5PlkSMdjlzqmx5DuGnPf8UfW
 f7KQEHRQ8TbDTjyug10Qg==
X-ME-Sender: <xms:-mjFZwkuqI_OtoPFVgKzXk0FeqtKjXjNuS7FvOwmfw-mACMoWPSCUg>
 <xme:-mjFZ_3LOcrWFvJPVSWx4mF9vNPfhLLa5fUI9nEH8JduDojYv89Jk3basUgG9IJoQ
 lpNKQUqu-auon4-yt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeihecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehr
 rggrghdrjhgruggrvhesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhhihidrsh
 hhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhr
 vghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughrih
 dquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthho
 pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-mjFZ-qAfXIGvipkh1EZlvzG-KlFCAuruzkX4ckkmCHm-qyZsrp7hQ>
 <xmx:-mjFZ8mL3YnVTtqjsyAf3QQegVJ1nLJWpwsHdIo8ofbxGYFkl3M_Yg>
 <xmx:-mjFZ-3eeia8QIaNH8GHXBE6n_Ih3kiTcELMTXncNZuk37drCADKcg>
 <xmx:-mjFZzt1_E_qeOr8Cs4vMLAn4Mk5653yMscvaOR1ZIevzyJKbPjLPQ>
 <xmx:-mjFZ4onkbGsQJgIt1rJYq4T1WCcVDccjX0NTr6z_xSDD3W2T0fXDGnQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A2E482220072; Mon,  3 Mar 2025 03:31:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 03 Mar 2025 09:31:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Raag Jadav" <raag.jadav@intel.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <fa3b2ef5-e2f8-473f-9e9c-c855d70230cf@app.fastmail.com>
In-Reply-To: <Z8Ve1CQQQAz2le0a@smile.fi.intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
 <Z8CD33_OWK2LB6IZ@smile.fi.intel.com>
 <0011035a-5816-48c4-9fe4-c0b9db3c8e72@app.fastmail.com>
 <Z8H1Y2_RlFnXeNEa@black.fi.intel.com> <Z8IDXD2bkO1t71yB@smile.fi.intel.com>
 <Z8IDgmrLx5DQADxJ@smile.fi.intel.com> <Z8IERmwHXUuJoD4S@black.fi.intel.com>
 <Z8IGA821OAgYN-K1@smile.fi.intel.com> <Z8IJn7dp4gypnoyz@black.fi.intel.com>
 <Z8Ve1CQQQAz2le0a@smile.fi.intel.com>
Subject: Re: [PATCH v3 0/2] Cleanup io.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Mon, Mar 3, 2025, at 08:48, Andy Shevchenko wrote:
> On Fri, Feb 28, 2025 at 09:08:15PM +0200, Raag Jadav wrote:
>> > > > Ah, you mean devres related?
>> > > 
>> > > Yeah, couldn't find it on Arnd's tree and I'm not sure if this series
>> > > works without it.
>> > 
>> > But err.h is included in the io.h, no? Or did I misunderstand the point?
>> 
>> First patch on the immutable tag moves IOMEM_ERR_PTR() to err.h and here
>> we're dropping err.h from io.h. So without the tag this series will probably
>> break IOMEM_ERR_PTR().
>
> I see, I think it might be due to some other includes that make this happen.
> Whatever, I assume that Arnd heavily tested this anyway, so it's good to go
> independently on the immutable tag..

I see that err.h gets included through at least linux/string.h,
linux/logic_pio.h and (depending on the architecture architectures)
asm/page.h, so there is no huge risk of something breaking here ;-)

Ideally all of the above should be removed here, but to do
it right, the linux/pgtable.h dependency needs to also be replaced
with a smaller pgprot_t specific one, which takes a bit of
cross-platform work as the definition is not in a consistent
place at the moment.

The change below still builds fine, and that likely indicates
that the same headers are still included from either asm/io.h
or asm/pgtable.h on the architectures I'm testing.

    Arnd

----
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 402020b23423..60a162591072 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -7,16 +7,16 @@
 #ifndef __ASM_GENERIC_IO_H
 #define __ASM_GENERIC_IO_H
 
-#include <asm/page.h> /* I/O is all done through memory accesses */
-#include <linux/string.h> /* for memset() and memcpy() */
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/instruction_pointer.h>
+#include <linux/compiler.h>
 
 #ifdef CONFIG_GENERIC_IOMAP
 #include <asm-generic/iomap.h>
 #endif
 
+#include <asm/byteorder.h>
 #include <asm/mmiowb.h>
 #include <asm-generic/pci_iomap.h>
 
diff --git a/include/linux/logic_pio.h b/include/linux/logic_pio.h
index 8f1a9408302f..a83286bf13ab 100644
--- a/include/linux/logic_pio.h
+++ b/include/linux/logic_pio.h
@@ -8,7 +8,9 @@
 #ifndef __LINUX_LOGIC_PIO_H
 #define __LINUX_LOGIC_PIO_H
 
-#include <linux/fwnode.h>
+#include <linux/types.h>
+
+struct fwnode_handle;
 
 enum {
        LOGIC_PIO_INDIRECT,             /* Indirect IO flag */
