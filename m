Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0F4E3F42
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03B10E580;
	Tue, 22 Mar 2022 13:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Tue, 22 Mar 2022 13:15:53 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619C810E580
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:15:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 14C5B32013BE;
 Tue, 22 Mar 2022 09:08:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 22 Mar 2022 09:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=OMRHkwKrqTNPvZ
 BpmQ6WmDl0jpezKoqEw5HOCaOA9RA=; b=1idvj3QIH5becCDN3HXGsuHjLnIx+N
 Yp+XgaUvfFJQXqIqX97fxmFuVjg7L3ubqZTCwJAcKdO2sTKsNdiBQy8XDotZU6er
 p1pq8BwLR2qjv12m5dGlo67r0Ty8ybYgs9LmBprvS028NZ7UWTIIVbwIZ+sCsA9F
 thIPZgbwlidWszPPe4EvNfTtGowJyKiJhSfEydGOo7S/kbZQOWYwmkS3VTIQKRXe
 ImCBXLYFX+L5lv1m9YAocGtiz+KSf2/XjczfmKPiqSPwXODIZdB+TZrLVfr80yfG
 lLWH6cZzBewcji3LX02JNQiL/ImdUFJNv7vGEf25eQu8OeHCRrgnu/BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=OMRHkwKrqTNPvZBpmQ6WmDl0jpezKoqEw5HOCaOA9
 RA=; b=CdhKh+gH3iao6fjugrlhu46nlpKbPxrVe+7FTGVnBDNGMVqFsrZzDGebl
 ioYHjXX44CEAEC8xmbQyX6sb/7uWxwsOEtlv7a5BS4EGYvs7q4DdYng9oRst0C0n
 jQ7pKKJdSVfqQGjG2y80jT/wzEPaMmoVGo7G4hoMI3WCFcrD+iV4skS0dgU1sg8o
 oXuO+OBduByIrKXgFXaaFOg8yVGxumsST8FRHOaOm68P76ekE8jy4PTj6fUPLrRS
 ebu5jK3kGoRYLPYRAFQPWCGZpQX7/JNxGmNHdzp2rlS5W99IXGlThfgdKDXMTtzc
 VZSbBD4aeHCLw5P9taNda1IkOgO7Q==
X-ME-Sender: <xms:Sco5YiAhS-n9sjVu45L98Aqrg4UKe2ytx1UMVblIwS-lUccz0vSCnw>
 <xme:Sco5Ysj2NWbepEO_akFofkrUC2RManEz5zyUhlpXB-SLn-FYYyd21JXGYnj9rHCCa
 dp2F2ej_yZIQjsIko8>
X-ME-Received: <xmr:Sco5YlkbcujgErZLOU43fbSqV6WRBpsp_EoWsfmeke45cESbxCzcsGOpcNIXePk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Sco5YgwHFyaoWi1CZloJlE_TTBFuNSAjw6ZUpPbLeJntkOE7C1gvzw>
 <xmx:Sco5YnSMdgs9nMV2VyYdXHAHNxPaQh7r5djQRegOyLGfGAd0uxtcfw>
 <xmx:Sco5YrahgPdgJLyN3L05ZMsdW2mg_r2oeub8DiX9_5gFJUxsnkrb-g>
 <xmx:S8o5YmBLB-TAVq4lraZedTXhXPLWDNep5MnRXmghRbAPYvRJ_RZRwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 09:08:23 -0400 (EDT)
Message-ID: <66ae2436-aa86-f583-85b4-d652273188e9@flygoat.com>
Date: Tue, 22 Mar 2022 13:08:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Content-Language: en-GB
To: Sui Jingfeng <15330273260@189.cn>, Rob Herring <robh@kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
 <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/3/22 2:33, Sui Jingfeng 写道:
>
> On 2022/3/22 07:20, Rob Herring wrote:
>> On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>
>> Needs a commit message.
>>
>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> Same person? Don't need both emails.
>
> Yes,  suijingfeng@loongson.cn is my company's email. But it can not be 
> used to send patches to dri-devel,
>
> when send patches with this email, the patch will not be shown on 
> patch works.
>
> Emails  are either blocked or got  rejected  by loongson's mail 
> server.  It can only receive emails
>
> from you and other people, but not dri-devel. so have to use my 
> personal email(15330273260@189.cn) to send patches.
In this case you can just use your company's email to sign-off
code and sending with your personal email. It's common practice.

If you don't want to receiving kernel email in your company mailbox,
you can add a entry in .mailmap .

Thanks.
- Jiaxun
