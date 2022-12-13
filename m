Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153BC64B275
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 10:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67510E2EE;
	Tue, 13 Dec 2022 09:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CE610E2EE;
 Tue, 13 Dec 2022 09:36:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B6075C013E;
 Tue, 13 Dec 2022 04:36:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 13 Dec 2022 04:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1670924167; x=1671010567; bh=nIy95hA8Yl
 lVcU8qH+Ydxae5DxdLCTX5dvbD9BTDWpY=; b=o4vb5C4Xuoaf4mN0JefFqWxTb9
 9tIVmtTYrP483PjL6tIYNlRlRcNFIA9TNB7kYFRinVQdDl6ja2n0TvJvYssBNEkx
 VwjArABHZAghHLmvgb7myqV5DuymEOJOQig6zcRBGRLa7TZKFdUr4qWk8TjIhf+/
 LphsrQ7sMw7jVjiClxxekqN4AIOMdg8v4YLD3p+QrV3OcfRy6PB8iQnbU8LIk8DE
 UBM7xxkyz3lQw06rJbY/eaKcvWqcBqKOoq7W1JD8nCPUTPRQHAJ2tylE2zjTHmSR
 do3a3hVJ6+yY4Wnb/m/1jA9vuk0MyeLyaoQQ17tZCIFQXN6Rn1hBWhExh4KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670924167; x=1671010567; bh=nIy95hA8YllVcU8qH+Ydxae5DxdL
 CTX5dvbD9BTDWpY=; b=azAeUOf2mC8LpF4rFESeoN3OUCfRsLdBJB5mdjQZMXGy
 3C4dsAkCFyQvXyYSIan2mJMcU8tZgwX5+Zepu9K4Ng4uNoSWLaVpHz5eT1LEOdpj
 cZp0q2f2ofrzI0PAWOC0dpL+f4exQGy0md2HexdNqC3fp3RhdEcF9A0sJmrgVH8T
 e/4TFpvh9PlfcH8w1o9Xl9X54R4JQ3JNwfsbRT94bdNVNRneFELeoWnC5gQdfJmr
 zC2f/WCPOBssc3/dD8KmzvNPEF4Eub0WM6HUYuXxCf7h5qhtScxwGfTrjc2bdfIS
 jV+D7blz8zmy9CI2Uhl9rOh0/2UB0lXPl8vICcPQaQ==
X-ME-Sender: <xms:hkeYYzoJcPphl9VLQ6aoWKUiuDgI6668GVguiJV3-WtOi1OO8HFv4g>
 <xme:hkeYY9olbF8QbERsX08Wt6grNa0OKwy96rSVjZvf5vBeq6xHwEQxGJxwnDE7M2UW1
 2Htu-0Xh1WyKcJsFj8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:hkeYYwNSZrPeLNTrYpmt70ElaYV1fJS9zvBl9Po-npzVSmb-Dvy42Q>
 <xmx:hkeYY24J58kDhf5oFgSqRdIVjP_hTnBjb4OA8P28ucQOvKDo9F4pUg>
 <xmx:hkeYYy6cg9srb2gekdwXd39Th3lH1U0helvU5VSomPNJoL5qIG9sOA>
 <xmx:h0eYY92R4ul0WNN-SIBPZPkblCDscrN9RLjHx-f5YPFL80s5xcv_5g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 528C9B60086; Tue, 13 Dec 2022 04:36:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <4610dfc8-33ed-4811-95dd-b13ec94adb46@app.fastmail.com>
In-Reply-To: <53e7e660-9ee0-1177-b34a-365c1397ec3b@intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <b0c38501-440f-42a3-ae0f-dd95527b0e56@app.fastmail.com>
 <53e7e660-9ee0-1177-b34a-365c1397ec3b@intel.com>
Date: Tue, 13 Dec 2022 10:35:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version of
 xchg
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022, at 10:28, Andrzej Hajda wrote:
> On 09.12.2022 18:16, Arnd Bergmann wrote:
>> name for the backing of arch_xchg() or arch_xchg_relaxed(),
>> maybe we can instead rename those to __arch_xchg() and use the
>> __xchg() name for the new non-atomic version?
>
> I will try, but even compile test will be some challenge, need to find 
> cross-compilers for these archs.

I maintain this set of cross compilers, let me know if you
have problems running them:

https://mirrors.edge.kernel.org/pub/tools/crosstool/

    Arnd
