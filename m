Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBB5FC12A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 09:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53710E318;
	Wed, 12 Oct 2022 07:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F41010E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 07:18:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4095832008FC;
 Wed, 12 Oct 2022 03:18:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Wed, 12 Oct 2022 03:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1665559094; x=1665645494; bh=JItWz9DrYA
 uiczRyP8yDVXb746zvvYp7Nb4ABtN3J2c=; b=jlBTcz4J2RLv99qkh3j9NNPzxp
 +N+QdKAZ+JTmFIRdBHF/C399ibtHtAYQUsYXCvyM/VQEme+NNi6UBKhjiyo9aHL3
 at7ElBAyTOQSKeBmLqTevm4QyoBY+SnfWaoAgG21GI/6i/5Sjl7FbvWL1rIFhJ4g
 rKY3b5C7Y5+1ibZLYKK2D3G0Hnu5UbMQDMCvBkqv5KVHMyN+rs9HMNhAVIjX15k1
 vSbevjIbc71wRwtZc53CrfF0SDrevRYnGc0TzziY49RNNFPwwwssn1x9pAbFnQiG
 o6r3r2HdJCgMk+G2Tki0vfiNfeFQRT6OBVKwAnWeeofxJwyaIfoxqEjQbCXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665559094; x=1665645494; bh=JItWz9DrYAuiczRyP8yDVXb746zv
 vYp7Nb4ABtN3J2c=; b=CJoPeTu6/CVNIEdQsLHMIfkL5U4P0qzBU62rFqdYJ6iM
 n+VvFSKwBtSFfgiM2ZEgZ83HOdb7e4cEMGo+jpGP3g98mq6TtjyfaLroH+alC+3s
 04oEJyuHkwTg9i8faKqy9zzH37NyKGqaEzEIM4nkGwQi7qG3G/yFZGWO4vh7Z2Js
 cuHp72QG38xHAMVNKAe5e0QUgUruztEi93K6fiw6P3czQOMjyz9UY+Djad4Z9bIf
 Us4wUXgSeznfEQNOn9zdRI310Z4Ubb9PeWJuIaw7/Xa5pO113nsls2x7AkuKqZkM
 fO5LDn5VVVdBNlXL4vbwZy7fsZqQHHDi94Y/HcXDLA==
X-ME-Sender: <xms:NWpGYxkkI__pVCBNybvpTvxedkkEs5h2B1qIX_ooUM6IdHBo68N3xw>
 <xme:NWpGY83wZnGLBZMBgXkCm6BV_ReIKQE4I9plG1hAyNkZUJnhVKVszR7C6YOPx02J9
 FrWUvLGV2cXRfWX6Xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:NWpGY3oNiX-nEIwI5ycYn2-SCFaLFxI0l2H8GtDIts8ed25k2MHGSA>
 <xmx:NWpGYxnF0eyXIlQnrvV1eZORY1FUuhGy_-eDdTKrkyBeXELV1qYZSA>
 <xmx:NWpGY_0lteklZwUItfqIn4MeKQp_SrIYeEKRY_7DI22rO62l-vAOPA>
 <xmx:NmpGY21ZLuHxpf5UdvxFuDXx6E2nPs8B9M4LqNxyO-xAKnLIOUcdJw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B05F0B60089; Wed, 12 Oct 2022 03:18:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
In-Reply-To: <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
Date: Wed, 12 Oct 2022 09:17:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 "Michal Suchanek" <msuchanek@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 "Paul Mackerras" <paulus@samba.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
> Am 11.10.22 um 22:06 schrieb Arnd Bergmann:
>> On Tue, Oct 11, 2022, at 1:30 PM, Thomas Zimmermann wrote:
>>> Am 11.10.22 um 09:46 schrieb Javier Martinez Canillas:
>>>>> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
>>>>> +{
>>>>> +	bool big_endian;
>>>>> +
>>>>> +#ifdef __BIG_ENDIAN
>>>>> +	big_endian = true;
>>>>> +	if (of_get_property(of_node, "little-endian", NULL))
>>>>> +		big_endian = false;
>>>>> +#else
>>>>> +	big_endian = false;
>>>>> +	if (of_get_property(of_node, "big-endian", NULL))
>>>>> +		big_endian = true;
>>>>> +#endif
>>>>> +
>>>>> +	return big_endian;
>>>>> +}
>>>>> +
>>>>
>>>> Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
>>>> Tree has an explicit node defining the endianess. The patch looks good to me:
>>>
>>> Yes. I took this test from offb.
>> 
>> Has the driver been tested with little-endian kernels though? While
>> ppc32 kernels are always BE, you can build kernels as either big-endian
>> or little-endian for most (modern) powerpc64 and arm/arm64 hardware,
>> and I don't see why that should change the defaults of the driver
>> when describing the same framebuffer hardware.
>
> Yes, I tested this on qemu's ppc64le and ppc64.

Does qemu mark the device has having a particular endianess then, or
does it switch the layout of the framebuffer to match what the CPU
does?

I've seen other cases where devices in qemu were defined using an
arbitrary definition of "cpu-endian", which is generally not how
real hardware works.

    Arnd
