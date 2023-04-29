Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B66F2503
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 16:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A8710E163;
	Sat, 29 Apr 2023 14:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A139210E1A5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 14:11:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DD955C00FB;
 Sat, 29 Apr 2023 10:11:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Sat, 29 Apr 2023 10:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682777496; x=1682863896; bh=8d
 kHZ7/OLsjO2XUx8f1h6VDCdqS9HsgrgUgQPoekbMU=; b=Tt4hmIAKM+NNZGRbGy
 USiFmRb7ZQ7VESvUpDkvDC9rS9I/kjpxYoq4IidwwhIKTPcYD5vR6RqvLLGr+CaD
 1I9aUqlKLEp8YNzWVAXHUtUi2kVpAha/zdduG5raE+Wi0wvbUISzk2AadoiGxkiZ
 fZrZqC1pSn3Zxe1+KbPC8fVvKo3sFwMmI+khbEppmvaKW9CmFCgdX2QktEKQKG96
 0SC2oHRE3uFMLM/L3dVGCHbScyE7YVtM0HH4gQT9Mh2zq/OoF5XuXAM6yoLd/EIj
 ZLMzsUC3vaXLLJ6GGE7oLNpIHGXhuLTVOB66jjYD1eINb3WthQd7wDNhLD/+UKGq
 YWnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682777496; x=1682863896; bh=8dkHZ7/OLsjO2
 XUx8f1h6VDCdqS9HsgrgUgQPoekbMU=; b=L+nvmAfj8gymGhB5xVReToYxjM6wj
 v8YL/JxVhiXT6yjB2/Yx5h/SGJAuFpH+LYE4mRnIgEwvZrwch6NpT/gSOm3PSm30
 bwzptyafMGf1520s8iYPvchCZ9FvC7zQx/AofzoW8CnPAm9cpnsX+tvIm8l6CBkt
 l6Yt2qTVsuFf+UtcSo0isg2MhJafTaqRhqjDh5e0bCdNSt6QOAH4NkSPUTzq6lqg
 IaNqSJFzzHT4wF8tk6iLVEl76ZIcQvAzUYcqtzZGN7wjqt4YIm/cBFu+jOkocHJJ
 6aUIjnMFtOd00CnQB01bWd1lVpHN1OGQkflEeBtWUxIcBUtPa00kswySw==
X-ME-Sender: <xms:lyVNZPz3z-p16274zMKpAKi5nlxUSJ7lk28d3S-Ob8c6-Zv8Bdk-Gw>
 <xme:lyVNZHQanz9SNk_GaqKBAu-Y-aPLh9z5YLE6AO4jRKX5HaqlB0s8ya2eyd2wC7WEQ
 j71iw5FIizBJSeFfXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvtddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lyVNZJXT0voWt151wzrxLt_t0PVcRbC_n0gzPllt-KSJgQjWEnhfPQ>
 <xmx:lyVNZJhgG76zOedSkzOp0As8nsjokHBAqvY3P4YbxzGMIvgrdkwY3A>
 <xmx:lyVNZBB11KK0qljfYMVgugmi1r0rm1svPDZhbgiqX_QChEeIGgbRGg>
 <xmx:mCVNZABxHV6GlowlDf3Y7NrFIlL86oq1NhGnPXRrsYfMgDf0xjmKGw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 00DD4B60086; Sat, 29 Apr 2023 10:11:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <260ee591-a71b-4c83-a775-5591d4222cec@app.fastmail.com>
In-Reply-To: <df6fa134-3a62-0872-e008-393e4a29a5ab@suse.de>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
 <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
 <f612c682-5767-4a58-82f6-f4a4d1b592a1@app.fastmail.com>
 <df6fa134-3a62-0872-e008-393e4a29a5ab@suse.de>
Date: Sat, 29 Apr 2023 16:11:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Robin Murphy" <robin.murphy@arm.com>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
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
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-m68k@lists.linux-m68k.org, Vineet Gupta <vgupta@kernel.org>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 linux-snps-arc@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 29, 2023, at 14:26, Thomas Zimmermann wrote:
> Am 28.04.23 um 15:17 schrieb Arnd Bergmann:
>> The only implementations in fbdev are
>> 
>>   1) sparc sbus
>>   2) __raw_writel
>>   3) direct pointer dereference
>> 
>> But none use the byte-swapping writel() implementations, and
>> the only ones that use the direct pointer dereference or sbus
>> are the ones on which these are defined the same as __raw_writel
>
> After thinking a bit more about the requirements, I'd like to got back 
> to v1, but with a different spin. We want to avoid ordering guarantees, 
> so I looked at the _relaxed() helpers, but they seem to swap bytes to 
> little endian.

Right, the _relaxed() oens are clearly wrong, aside from
the byteswap they also include barriers on some architectures
where the __raw_* version is more relaxed than the required
semantics for relaxed.

> I guess we can remove the fb_mem*() functions entirely. They are the 
> same as the non-fb_ counterparts.

These might actually be different in some cases, or sub-optimal
at the moment. memcpy()/memset() don't take __iomem pointers, so they
cause sparse warnings, while the memset_io()/memcpy_fromio()/
memcpy_toio() sometimes fall back to bytewise access that is slower
than word-sized copy. I only looked at the readl/writel style 
functions earlier, no idea what we want here.

> For the fb read/write helpers, I'd 
> like to add them to <asm-generic/fb.h> in a platform-neutral way. They'd 
> be wrappers around __raw_(), as I wouldn't want invocations of  __raw_() 
> functions in the fbdev drivers.

That sounds good to me.

     Arnd
