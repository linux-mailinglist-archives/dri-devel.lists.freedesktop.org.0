Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B0A4E157
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247F10E5FF;
	Tue,  4 Mar 2025 14:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=arndb.de header.i=@arndb.de header.b="URTs/h7N";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c/dQdYU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170EB10E5FF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:42:07 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 8AE3240D0C54
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:42:05 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
 dkim=permerror header.d=arndb.de header.i=@arndb.de header.a=rsa-sha1
 header.s=fm3 header.b=URTs/h7N; 
 dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha1 header.s=fm1 header.b=c/dQdYU+
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6ddT36W2zFwwr
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:40:29 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 5E38742728; Tue,  4 Mar 2025 17:40:28 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=permerror (0-bit key) header.d=arndb.de header.i=@arndb.de
 header.b=URTs/h7N; 
 dkim=permerror (0-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b=c/dQdYU+
X-Envelope-From: <linux-kernel+bounces-541161-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de
 header.b=URTs/h7N; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b=c/dQdYU+
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 286F941BC9
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:32:15 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw1.itu.edu.tr (Postfix) with SMTP id F14B33064C16
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:32:14 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id BCCD0188915F
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCD31EDA09;
 Mon,  3 Mar 2025 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de
 header.b="URTs/h7N"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="c/dQdYU+"
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAE1DFE1
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=202.12.124.155
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740990718; cv=none;
 b=tXGkSRwNDxCKHUjseQmZdTBr+YAI79AdBKrTLTVfN5w4buADhIlCWkVN8HHkZqGP8KQWTGog9OLATzo3ptBirPeSsTII89dPM3VdTkA8CV30wwNhe96GZlsVR2/WpMkC5DY5dEI3aId8rxziYXz8dd+l7glcqt3p+2iqHqAXQPU=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740990718; c=relaxed/simple;
 bh=agnRvcLuOv+42lmgdsYIEJwJMW09zxWsAsSCJzsS5mY=;
 h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
 Subject:Content-Type;
 b=L3gkbN8oJ9dZsOjAo/tgwfV3APnkat6fuzcI8g8Z4jM2WcBpxlOm+faHUQn4/rzNeGAo8As+2XewOj5AzNXkR3ArZPegEoJMOiAVlZ87aNtpLeGWjh0jMBfKqFd0Xvrl4LxuBM0NPJi6BQs+lbQGtyrdMos0mtrv2mSEJy98MEI=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=arndb.de;
 spf=pass smtp.mailfrom=arndb.de;
 dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de
 header.b=URTs/h7N;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b=c/dQdYU+;
 arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=arndb.de
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
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
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6ddT36W2zFwwr
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704030.0122@WE/4UuTihO0NG5ORDZj2Jw
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

