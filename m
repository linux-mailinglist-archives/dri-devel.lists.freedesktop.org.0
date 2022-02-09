Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B34B07D0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58EF10E750;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Wed, 09 Feb 2022 12:06:01 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327510E202
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:06:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B10325801E7;
 Wed,  9 Feb 2022 06:56:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 09 Feb 2022 06:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=sSoaJ00tNxOqOU
 g8CEfFUrCk7rxbGJHvq0gr3bBADKY=; b=TtUBXU1CqcfqNeznPZk2WxfjhYiTNs
 gMNqvDZWJN38DDEDERlnSUs9S18c55f6UIynjxuoVkEf8fH6Rg207EcxI6ty4SV3
 ACAuuaZtZpLm9qWU5/v25nIGfMzgzXesCi/TWxrKw+kC90hYIAqZPtC+erttQ4UJ
 lChn0v67/k+FInJz4kdPf2T/uNqP6xzYyYVaJJXgDYmdZGYrL02KBb6wHMLeCkLB
 qBa6wVNSHBiGEeebzOrEQhmrj7PhWCHPFBe+/o6/LFWH55pP7FJx424PRkVQ/6jQ
 B5dpgH3SoxQBoddzzBil3MkbTnFrNDZ5AGQP50LZtWwLZfYOsNNu2dPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=sSoaJ00tNxOqOUg8CEfFUrCk7rxbGJHvq0gr3bBAD
 KY=; b=V3ydhjnSDw12XaizGu576ElTKKtFuGCl5+Iq2cYUJ6YRk29dhASK4u8yG
 78xoxVtDAqKJYVODzEnhKgoeWxQCmip9KyO3g8M2aA6Sq66FRuc3KJifp752qQIF
 n3SJF4gytcrfLbMGtxSOJ7RSk0sKWNZ1sOkV/ImZ4Do5gYUEUllY9LVr3NTWkVm0
 XFCWnR/txmwFFL/NUKkT8eJ7Rr9ljf00cY5hquBz5PYOG04d52UuRyemp9q73vdL
 S3WK/P3+Q6JsfmUwR07/4CS36qlNPrCUj5BXVpM1ADsGvF/FyZizSnlvLiVOiQZD
 LxIROXLJXQ2/MGQq3uNhjhviTnq+g==
X-ME-Sender: <xms:A6wDYllVhj4Jcdf8XA97PwG2ut--DXQ_hlqlHlngkj8qtWCYMlBoDQ>
 <xme:A6wDYg1p4nMD4nUgg_zoRLWxqyazVMKZRjYEeTbn3Afoys7mcUYc5dYQE9minibj_
 K6C7N6UF_xlWWHh7UU>
X-ME-Received: <xmr:A6wDYrrAJNdU8a2J1EPQLJZgdkiR3s_EM8B-mAhcdr-6kLpqo0JsLIej7Ja9__o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfelieej
 geehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:A6wDYlmXKNw9LxuBm1uBQMJNqUZ5zxIU5aNIex0LI-Hd0h0y0_7-hA>
 <xmx:A6wDYj0rkiXLRM76CGJN3qEdLXnfX5bklk_oizUINjmMsTZ4jSPzUg>
 <xmx:A6wDYkvTN5Wa9-7U0i_KAl0-maH4ohQ-7diZYVTw4097_tWOUvrnxg>
 <xmx:BKwDYqvmkj0AfU5uCgbqM4dT0U2_7kqWqSFoMx81RDeCnbAHrJI7fg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 06:56:49 -0500 (EST)
Message-ID: <8e7f7946-b9e5-7c4d-f5c9-e091bf5f814b@flygoat.com>
Date: Wed, 9 Feb 2022 11:56:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Maxime Ripard <maxime@cerno.tech>, Sui Jingfeng <15330273260@189.cn>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
 <20220209085215.65qbdsgwtnvujdng@houat>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220209085215.65qbdsgwtnvujdng@houat>
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
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/2/9 8:52, Maxime Ripard 写道:
> On Thu, Feb 03, 2022 at 11:47:16PM +0800, Sui Jingfeng wrote:
[...]
> DT isn't really a solution either. Let's take the distribution
> perspective there. Suppose you're a Fedora or Debian developer, and want
> to make a single kernel image, and ship a DT to the user for their board
> without any modification. How is either the Kconfig solution or DT flags
> solution any good there? It doesn't help them at all.
We are working in another way. As we can tell model of the board by strings
passed from the firmware, we just built-in all poosible DTs into the kernel
and then tell which DT to load at boot time. So we can ensure users has
smmoth experience.

Thanks.
- Jiaxun

>
> Maxime

