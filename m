Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14093AD33AF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EAA10E4EB;
	Tue, 10 Jun 2025 10:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Dhg/CsQ3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NBonXYMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20C010E4DF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 10:35:37 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C51A925400E7;
 Tue, 10 Jun 2025 06:35:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Tue, 10 Jun 2025 06:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1749551736;
 x=1749638136; bh=wJ6K1Bg2EKOzCl4JP7wnZYiAEnsPSxJW7yzlyL9SDrY=; b=
 Dhg/CsQ3lwukqyGwumJyoh8RAFfoAk74WSQ0txZSQsI4k4EkwceQnuR1O63lCr6B
 YbZQx8FpKQPneYLaBDLrq09snuKmE36a+/puRsIVucSFD9tTnxS2TzBITsiUXKmh
 UP7PoDqXdLv/SB2e0A+nDbxJOfJ9DO/MEvsxtRMofu4gtqGvvy/HGLuobSe8KBf1
 nbpqPiw0K08htNZqXhdL+8TbFDeWyedMnWnLutGtiqqzVv/w+fYVxPNF422UYdy2
 xUM0umTq4TAzrh3UnW0pGckyYqKfLgZZDCSj5ege/mF19Pgoyv4iBLDbIIMGdjPx
 ZvnZ+VksqzRJepU9jQlXVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749551736; x=
 1749638136; bh=wJ6K1Bg2EKOzCl4JP7wnZYiAEnsPSxJW7yzlyL9SDrY=; b=N
 BonXYMvvEst6qDS4cbOonC6/2Wl30tJbHNRUj6h9MDvKE/x7rgJ0cH2SUvHUgGlY
 xHKaour2RolblsDPAH4MhsVnvZ+NRuk7Nb/GQJd9V3oZrKLVccwWslKS9oNkLgVr
 ArcrDoSOeVf+bOQBvPrYt4zoIJXG9cO3Uagl4ZiKPJzbu1VCXijX3SLbuF7HNXgI
 fqQG7jvc/DM1zFBrnWXwfDZrmbmPhQkb4z0Vtw/YkBzhNejKHv2gq0qx04zhv0hA
 89p6xso/1PVh2/RxzUe5a8zPvl28IXsYh+8sEvQQcCtGLQvD+UXI5EYQjV6ZlH48
 emfpKMLfMKt86cLN+50wA==
X-ME-Sender: <xms:dwpIaBC5s0BdUMi9rIszRUs_uxU5IaVtsiYzeMsN0UTl9PrLE8fJkQ>
 <xme:dwpIaPhHgMcMhnfxavaaUPPI9qNXF24yudbt0Xub1myL25S8GcRnReUvDIDZ2rTCR
 qSbknmRYQxfDGAvTM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeivdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
 fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhihigrnhguhhhimhgrnhduge
 esghhmrghilhdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdho
 rhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnh
 gurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghp
 thhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpth
 htohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdp
 rhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvg
 hvpdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhm
 pdhrtghpthhtohepjhgvfhhfrdhjohhhnhhsohhnsehoshhsrdhquhgrlhgtohhmmhdrtg
 homh
X-ME-Proxy: <xmx:dwpIaMnMR5IEeoAfV7RdRsbM__rzDqhhPYk6CToFFEJAkb4IFYsTTw>
 <xmx:dwpIaLwzviYxwPrNq2HPvQOCyhWI5vfYvN0QT43CZSeNvcZcaXcsJg>
 <xmx:dwpIaGSzClcDHloai92YpmPG90Iwig9HauMVZdWpwyQ22tZFT4_x7Q>
 <xmx:dwpIaObV0EV9TpgQ6ZwKz87VncvtDCPgnSZVjDT6mKV3LVU8fbnaNQ>
 <xmx:eApIaD1ewy-S6aw_2-p9Tr4q9kMUoeXujPaEiz3NhmiOsEgC11XQs8Ca>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 92CDE700061; Tue, 10 Jun 2025 06:35:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T57998a13661304d4
Date: Tue, 10 Jun 2025 12:35:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Riyan Dhiman" <riyandhiman14@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Paolo Perego" <pperego@suse.de>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <088dc0a1-fc54-478c-b253-4ed5dd6d6bae@app.fastmail.com>
In-Reply-To: <aEgIX221QIt5k0zY@smile.fi.intel.com>
References: <20250610092445.2640575-1-arnd@kernel.org>
 <aEgIX221QIt5k0zY@smile.fi.intel.com>
Subject: Re: [PATCH] fbtft: reduce stack usage
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

On Tue, Jun 10, 2025, at 12:26, Andy Shevchenko wrote:
> On Tue, Jun 10, 2025 at 11:24:38AM +0200, Arnd Bergmann wrote:
>> Move the varargs handling into a separate noinline function so each
>> individual function stays below the limit. A better approach might be to
>> replace the varargs function with one that takes an array of arguments,
>> but that would be a much larger rework of the other callers.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...

Thanks

>> +static noinline_for_stack void fbtft_write_register_64(struct fbtft_par *par,
>> +							int i, int buf[64])
>
> Perhaps int i, int buf[64] should be u32?

Right, I can send an updated patch, or this could be fixed up when applying
the patch

>> +{
>> +	par->fbtftops.write_register(par, i,
>> +		buf[0], buf[1], buf[2], buf[3],
>> +		buf[4], buf[5], buf[6], buf[7],
>> +		buf[8], buf[9], buf[10], buf[11],
>> +		buf[12], buf[13], buf[14], buf[15],
>> +		buf[16], buf[17], buf[18], buf[19],
>> +		buf[20], buf[21], buf[22], buf[23],
>> +		buf[24], buf[25], buf[26], buf[27],
>> +		buf[28], buf[29], buf[30], buf[31],
>> +		buf[32], buf[33], buf[34], buf[35],
>> +		buf[36], buf[37], buf[38], buf[39],
>> +		buf[40], buf[41], buf[42], buf[43],
>> +		buf[44], buf[45], buf[46], buf[47],
>> +		buf[48], buf[49], buf[50], buf[51],
>> +		buf[52], buf[53], buf[54], buf[55],
>> +		buf[56], buf[57], buf[58], buf[59],
>> +		buf[60], buf[61], buf[62], buf[63]);
>> +}
>
> Wondering if we may reuse this in other cases (by providing the additional
> length parameter). But it may be done later on.

I tried this and that quickly became a mess. It is probably a good
idea to rework the code to completely avoid the varargs function
pointer and instead take an array here, but this is not something
I could easily do myself as that takes more time and needs better
testing.

       Arnd
