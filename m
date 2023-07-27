Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E5765B03
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2110E5D6;
	Thu, 27 Jul 2023 17:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F1E10E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:56:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B73183200906;
 Thu, 27 Jul 2023 13:56:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 27 Jul 2023 13:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1690480591; x=1690566991; bh=Ur
 BXswUYiomc5QqKdoVJzSXdQVUhDJYd7n0/JcrG08Q=; b=MqBtiHWDc72hL0VvGv
 JDSbfEWaRZ/8COwNo7q4XJncgQy/r14deh3tzvNt9YtVubOlSAocWLyCSU/g0TKt
 KIv730FJ96ZM43Y0sQFqccl2d1r/1UMro3eRu5wICf9Mb/GO+wsrjnnm8R+3AeC7
 /UYJ/EvhNc97XJ+RySgqLmla0SpkrAdBHgLpBtqRfGdcaXSXRF70ZXRSUC6Wzm0U
 6LruzS6qCTsNsQQixZWSiMLZS2L/sak98JcPK5I7TiSm2eFsCMy6t+e0/HSQrrLW
 fbH3cU9+BA6t2WbJ/KwVSdXI8XsWhjKCkLNNhnXpNBTAPU3dmkBJISe9Z7c22Gu+
 UdmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690480591; x=1690566991; bh=UrBXswUYiomc5
 QqKdoVJzSXdQVUhDJYd7n0/JcrG08Q=; b=vs2aXvOUzUg+qPZCIJjZqlRVFTaMu
 JeiUZ0q+CXmY0wvAkYvZrH49xQhMlxRZOkcobWB1sWvNAdLMnEM8wBYU8In5Etdh
 /Y9e2In70tLp8mncIkIRRilloWzfB9s1t7GkyvSj6av9fTxqMXMddKEkfkKfszia
 P1yJkrY1QsSOjljQef26NMYnFGBdn4ubhHdUpleZCs7kF++xLeHIrEnVBF+Bny9F
 MtEL1ekKMHcJ9qd+HYBFXTugChmtdYmKXRErCl4mVn1rVAknE9nS7ZL1eJYBzWQ4
 +Rw4IK/UHIOLVIaX9K0BEykTC48wJLrqnQOe4dsdF9dBmTLkWZzEOtl7g==
X-ME-Sender: <xms:z6_CZK9hOFBGoQXn-3IMa-jvUQttoaXax4QOwiylCUx_AluCwru7TA>
 <xme:z6_CZKvtDufy5jl-xSbIeN0e41fNDOeBxTta3msHTOoKUPUPbrV_xmMkixJWIu-xY
 pTRQsO5d-RoWWOzmRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeggdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:z6_CZAAs5yXnVs7ImF3Yh3uxzhYVMQePfX1jgzTXhbU9feB1pwFtmw>
 <xmx:z6_CZCco2akHn6rv0-KQpD7RAAormN_Ons0fF2RcErfyo_ly1sepwA>
 <xmx:z6_CZPPmwH1XSx3tAtUpoJ2rbvr8wB5oypPxp8h-RHfQ0zqS72ijrg>
 <xmx:z6_CZLCQzV1qWhu3bxmqYbSgyspoyiY5HHsh3X8NtWMstOOHv_pK9Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F2EA7B60089; Thu, 27 Jul 2023 13:56:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <c02a7694-00f1-48d2-9299-13c0a40dc0ae@app.fastmail.com>
In-Reply-To: <87v8e5tia8.fsf@minerva.mail-host-address-is-not-set>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
 <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
 <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
 <87v8e5tia8.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 27 Jul 2023 19:56:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 "Arthur Grillo" <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
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
Cc: tales.aparecida@gmail.com, Helge Deller <deller@gmx.de>,
 mairacanal@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023, at 18:45, Javier Martinez Canillas wrote:
> Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:
>> On 27/07/23 13:07, Javier Martinez Canillas wrote:
>>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>>> Changing the local config should not be required after fixing
>>>> the Kconfig files.
>>>>
>>> 
>>> CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
>>> does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
>>> but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.
>>> 
>>> Maybe we should include !UML in that condition to? Something like this:
>>> 
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 0d499669d653..734332f222ea 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
>>>  config DRM_FBDEV_EMULATION
>>>         bool "Enable legacy fbdev support for your modesetting driver"
>>>         depends on DRM
>>> -       select FRAMEBUFFER_CONSOLE if !EXPERT
>>> +       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)

Yes, that should work. Was the original bug report about UML then?

I'm not actually sure we need the select at all. When I tried
to narrow down how fbdev is used in the previous
thread, the answer was pretty much that it could be used
in any possible way, so there might be users that only want
the /dev/fb0 interface but not the console, or even just
the logo.

Another thing we could do here would be

config DRM_FBDEV_EMULATION
      select FRAMEBUFFER_CONSOLE if VT

which is simpler and probably just as good. Or if we decide that
DRM_FBDEV_EMULATION is in fact only useful for FRAMEBUFFER_CONSOLE
and add 'depends on VT' and removed the "if (...)"

>>> With that I'm able to run the DRM kunit tests wihtout the mentioned
>>> problem. But I'm not sure if that is the correct fix or not.
>>
>> It works here too, I just don't understand why this commit caused this
>> bug, as it did not touch this line.
>
> Yes, I also don't understand why the FB_CORE split made it more likely to
> happen since AFAICT the same problem could had happen with just CONFIG_FB.

c242f48433e79 ("drm: Make FB_CORE to be selected if DRM fbdev emulation
is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB' to
an effective 'select FB_CORE', so any config that previously had
DRM=y and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.

     Arnd
