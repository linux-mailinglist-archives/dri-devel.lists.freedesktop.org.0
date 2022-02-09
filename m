Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E34B07CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6DD10E73C;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEE98932A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:14:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3FFF758016B;
 Wed,  9 Feb 2022 09:14:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 09 Feb 2022 09:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=TmJou/XbDJVWvQ
 v3YSL4bJUa/8221zv0DCH0YWYGppc=; b=m39aEsSTG/1rlyyX/TTWu51ZBaV5Ck
 iH8lf2grpzH46I2MRjyxDK6ggRR3JX3U/KYcHlXHddLSbDiLMtJ+gJtzCTZ/tmtx
 16SoijoR4OZY7tGgWIj2D4bL31Gw6fjb8uYIZjm5QY+eJCFz3jnjb7Br1nJwbvEs
 xreO2Onm+kwRHdnOMpJvAznTpJvv6zdIv7fXyGoNAIBXd+sErrp8xS1lVW3eu7NY
 yl/zQbU4iAsRr7uYGxQjNkl9f6X2y7e3eoZLrTbhFdy+aY6zZJEC9zogc/cBHnAO
 yFiR8N3feNYgCFvPe985vxVJLfH0+9S8VMyAJzSss0yxR2ayissJt9sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TmJou/XbDJVWvQv3YSL4bJUa/8221zv0DCH0YWYGp
 pc=; b=D24s8NWFBRzM/pqaYTJ5dgrv5WmZp8+CL5gUVnY5vemFm6blxtabCM2z5
 1xHR60MUWH3LZUU63D2HCpc9xKVDl9ZwEhXs+X38cL1raKxJsPecnlJxLJ53HoJG
 cJVUEcIkYlohx5oWqPiJZtAJopC2t4hFGXjb3Io0g1NWRojt+x0Kx/uZllNP+UnF
 IWt2k7vx9sI8TBOEWvYZr8VTE43eRLv+1ArqAQJIminD3LV7T7ZJZoEu/n85zwGM
 M5rI64c0z6uIvGEx6Dvt2m1aiv0lN93LhOpd4XKtcRqY/ILe97xK1CUJVbqrtXCT
 iByuGQ5O79sKzOkhYkWxqtwyT49OQ==
X-ME-Sender: <xms:PcwDYiK6kPG53do9P_Gn6W23_zqbHMhJSeUPX3wh8Fq9Px1FW6hh3A>
 <xme:PcwDYqLoJz0bqEHGTll7Auwj9Qa_L-XnjNNi4yu8YO6Za7vYS0b-wzCn6IiyVBySD
 gMwc4YUA3cHclhX96s>
X-ME-Received: <xmr:PcwDYivxt82yjsVv18xnviNK9JIcqKQdFoYLiYus3KiebZ_PziM2ly3Y-g9S2pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfelieej
 geehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:PcwDYna9hbyhGdns6SPNJMM9H-bTDsrIv5AZq6a8-5xBw4-1S3_D1g>
 <xmx:PcwDYpZzNaa2Mo9hCvqBa-kS1ltnGYjDc9dEfMucsOoealvXpBNG8w>
 <xmx:PcwDYjCXye1iP4QturoMSL2SpUWrkHxMnxTyvUzhodsIlJaJg2bBZQ>
 <xmx:PswDYmQRm74ad1tLNDH7JH_IveGrad8mtvtVvmyOKS-pmOjtumVkwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 09:14:19 -0500 (EST)
Message-ID: <3133a629-eebf-928e-d6b0-72867d96d2b5@flygoat.com>
Date: Wed, 9 Feb 2022 14:14:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
 <20220209085215.65qbdsgwtnvujdng@houat>
 <8e7f7946-b9e5-7c4d-f5c9-e091bf5f814b@flygoat.com>
 <20220209140432.ekqszxbtitmacpk5@houat>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220209140432.ekqszxbtitmacpk5@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Sui Jingfeng <15330273260@189.cn>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/2/9 14:04, Maxime Ripard 写道:
> On Wed, Feb 09, 2022 at 11:56:48AM +0000, Jiaxun Yang wrote:
>>
>> 在 2022/2/9 8:52, Maxime Ripard 写道:
>>> On Thu, Feb 03, 2022 at 11:47:16PM +0800, Sui Jingfeng wrote:
>> [...]
>>> DT isn't really a solution either. Let's take the distribution
>>> perspective there. Suppose you're a Fedora or Debian developer, and want
>>> to make a single kernel image, and ship a DT to the user for their board
>>> without any modification. How is either the Kconfig solution or DT flags
>>> solution any good there? It doesn't help them at all.
>> We are working in another way. As we can tell model of the board by strings
>> passed from the firmware, we just built-in all poosible DTs into the kernel
>> and then tell which DT to load at boot time. So we can ensure users has
>> smmoth experience.
> It's not really for you to say though. Once your driver is in a release,
> distros are going to use it. That's the whole point of you asking us to
> merge it.

Ah I was meant to say we can determine which type of memory is best for a
type of board and then hardcode it into ST accroading to the model.

Though personally I want a knob in cmdline to override it at runtime.

Thanks.
- Jiaxun

>
> Maxime

