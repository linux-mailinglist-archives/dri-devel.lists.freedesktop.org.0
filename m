Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F44E9236
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 12:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4910EAF3;
	Mon, 28 Mar 2022 10:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EA510EAF3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 10:01:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B52E25805CA;
 Mon, 28 Mar 2022 06:01:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Mar 2022 06:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=nZAXAsNq5mkXS/
 Tat8STmC+wZsmvosjFIg/ceUBcJqc=; b=WYHjRNRomMF4TRAvFWRRVqXrs5m6Is
 mzslJIjAuA8z2BTRksJvkmhag7H7RJpQdCLslYRoLuQ3maMsoSSJrV2HLSBIlCAW
 jshD03+X0ACSPvpUtojcAj+8b3rToajbLbVfKU9Dd0jZKaM1zqEw+HywJguNbVzq
 Fd1rpTL4fUSAKVInVU5CX3BaXdoDubbb3sGXJormk7AtGiLaHFWnmyFpja0fnas1
 pk3LoeelFvtqP92oi0kdsk0/5JmdFYf5Jv7YVuzvQk3HQRPS7LVVKty8P//84eED
 3tatol9M0OKwS05BZvzRz4hI6RXNFxjyKQ7sGiss/T1eTPTURUr+WlpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=nZAXAsNq5mkXS/Tat8STmC+wZsmvosjFIg/ceUBcJ
 qc=; b=UjhMydFA6oMwcIZFOQPzjVulFHkMOgEUJaeP+wz0Pq6+oeglmuim0P+Tt
 XkPazk54RreexS1kx0IHlc6rmIUK0xX3TLG7wjOvI5doTbsYFsVK6UhP6rnCNOiF
 UCTf/j8HjfInkN6IN92M/bAP0y9TIzEJQZ22YSc/+MhKY+k+oQznGuD2iqxfaDmP
 mHGoX6xXUsCUGyXAP7iG+K32zaRqI5mXWEPwqizSPo8QWwHTMiOyT37hr1bNW01Y
 53EjPglKHD6bwxBZRRGVGZySpBs56L98VdLsQnNr7d+2GKvTpkHvlESz1DazPEQb
 dfrh+M1jUlRq4+hVY/PIn2yfGpCyA==
X-ME-Sender: <xms:g4dBYi9Q3MODDCCyQzWXzfi5RDhva3kCO9wgx5w6sBqLC-27pn7aUA>
 <xme:g4dBYit6Ikr7mGLDM7SlMgFnz6T49JZJ5-1XkNM5QfJsTEWFiTzexk0zA-yO9ed51
 td0m82As79rOYAwjoc>
X-ME-Received: <xmr:g4dBYoD-dGvs6WDAN7tv3Gu0iGwbY7LIECBcYhKx7SNrg7E7gXtQfPsw0Tvf9to>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:g4dBYqfIWsD5D2Wh72VfeXSqKe2lVb3uOsF44hao6cTNLKd4qBqzqw>
 <xmx:g4dBYnM9JX_O0Pa032o-K-2QiSk_qLC_7bxPyyd8FugMf0lCbIOq6w>
 <xmx:g4dBYkkY-3gsXftuPzFj8rsOr6spkXkvXCfCjpY-1XkPFkeJ_A31Uw>
 <xmx:hYdBYqcgPS7UFBK5xT6JyQAN_RZh0tyqlwjglG3RuTKYVSKNgR-nMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 06:01:36 -0400 (EDT)
Message-ID: <44408f8f-20ac-a558-ece9-d14c7b99ca50@flygoat.com>
Date: Mon, 28 Mar 2022 11:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v13 5/6] drm/loongson: add drm driver for loongson display
 controller
Content-Language: en-GB
To: Sui Jingfeng <15330273260@189.cn>, kernel test robot <lkp@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <error27@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220328022835.2508587-5-15330273260@189.cn>
 <202203281653.wiRaycuD-lkp@intel.com>
 <efc756c5-9ea3-66df-4885-82f57ff31b1f@189.cn>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <efc756c5-9ea3-66df-4885-82f57ff31b1f@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/3/28 10:01, Sui Jingfeng 写道:
>
> On 2022/3/28 16:51, kernel test robot wrote:
>> Hi Sui,
[...]
>>
>
> Hi,  my driver will not used on microblaze arch,
>
> what does this warnings means, do i need to fix this?

Hi Jingfeng,

The problem it discovered is general for all archs.

Type of reg_base (MMIO pointer) should be "void __iomem *" instead of 
"void *"
everywhere, including parameter list.

__iomem is the attribute for MMIO.

Thanks.
- Jiaxun

