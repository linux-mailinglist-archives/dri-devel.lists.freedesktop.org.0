Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05067E186
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357A810E438;
	Fri, 27 Jan 2023 10:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C76E10E438
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:23:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 072E05C012A;
 Fri, 27 Jan 2023 05:23:18 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 27 Jan 2023 05:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1674814998; x=1674901398; bh=ESYKgkcp1o
 AJy2GgJO4g+7f5T9dErjzdnGeeRmEuZUM=; b=mwpIAxCPl5jp4IDgAX1HMAQz7t
 P6ShCHDnrH1GflyH8Oiq97HR30qjYMurrKI5ZWK4WBfLqGl6GTVLQfo0zxMI/HXA
 WD7qE9YBYFRb2gZiUxprPPapNm150XlAfUtYl2KLUV1lXaJAzzaZloghCypTNaKk
 Cd5WtrSP1gAWBR4ZpBjWZ4k8DYAcQy0jAHoliigtYpgr68jhxMYShdMLDJLjLi+h
 djHzMh1DlaTWcDUDL3WHuO2yn/gyYVVvrTPYm3sFdYAdIxjRT0S9iNgytORZa+Ha
 2rxr0UelHsfRMOzX+9rkIjebvGrjxksDvXCh8tEt/o53tbTNtG9c7r6M0VPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674814998; x=1674901398; bh=ESYKgkcp1oAJy2GgJO4g+7f5T9dE
 rjzdnGeeRmEuZUM=; b=YN9ZL+JlxxeownlNFQTeDHYHhwd5UXjirRQtL+7B70V4
 +ROfEfH3ZiCrerrK87KwHP3AqEAlY5Ou+nRPUVtmLl6fm4D/dMw7balbW2yEOaTR
 SMR/SeA3S1C6L5ikV/vecKnI83KHatJIaJS03KSnymWDl0dJHVwdci0X9qCgYd0u
 AeNwU0fTCBK0pwYbEGbU6fvApuJbZO9xmXQbkPYcMtmyXw7FnrKrvzo+L5ZQSM7i
 3++v/NmvwtE9TWiYxD+ZYalGPg4lKQI99k1n+K5vYEnoLYfpZWNgRedvtchA90xY
 aM/8mytclhX5U3TFghO1jiqLRJdeWAavCJplDU7kPQ==
X-ME-Sender: <xms:FabTY4NPaP6S9U7Tw220ZiSKtKYuiBV8AbD3bcP4LzBqzXMwDNikKQ>
 <xme:FabTY--okzgeumhHDCA2FlpBr-w3aMCeQtpRw4YVDS-ioUZEr7_kpaNf1rGU8a8mE
 mpS0J8FqY5xN5wuNrE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FabTY_T_WbYWqxzhYGF9tPykug2LJLgvC3wRcd85FQ34OgCfi_1q7g>
 <xmx:FabTYwufGlIDPRdfYjyI8fAk1yI2t2LKwYWW52wRZRCnmTSFJicddw>
 <xmx:FabTYwdeoUSGLUoNSf4oX5mQ3xHJDuLwmSkEjJI3KhyjRSIoGqevLQ>
 <xmx:FqbTY3zNGLNsGCKO92JnQmCisItEc4nU1Tm44SlMaSNLYGxMuHQnIQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 88516B60086; Fri, 27 Jan 2023 05:23:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <4db4ab2d-968f-4403-b85e-1465b3c1017e@app.fastmail.com>
In-Reply-To: <20230127101701.GA1416485@linux.intel.com>
References: <20230127093631.2132187-1-arnd@kernel.org>
 <20230127101701.GA1416485@linux.intel.com>
Date: Fri, 27 Jan 2023 11:22:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stanislaw Gruszka" <stanislaw.gruszka@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] accel: work around DRM_ACCEL dependencies
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023, at 11:17, Stanislaw Gruszka wrote:
> On Fri, Jan 27, 2023 at 10:36:20AM +0100, Arnd Bergmann wrote:

>> I think it will be necessary to establish a link hierarchy between drm.ko
>> and drm_accel.ko to avoid circular dependencies like this, but until then
>> the only way that both can be used is to have both subsystems built into
>> the kernel. Enforce this using a Kconfig dependency.
>
> Hmm, it was discussed a bit before and conclusion was that accel will be
> compiled in drm.ko to avoid circular dependencies. There should be
> no drm_accel.ko module.

Ok, got it. This does not sounds like a great solution as it ties
the two modules closer together than most users want, but it should
work as long as we control the dependencies for the individual drivers.

>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index 834863902e16..dd18d3b2028c 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -8,7 +8,7 @@
>>  #
>>  menuconfig DRM_ACCEL
>>  	bool "Compute Acceleration Framework"
>> -	depends on DRM
>> +	depends on DRM=y
>
> Would making ivpu Kconfig:
>
> depends on DRM
> select DRM_ACCEL
>
> solve the problem and still allow to drm to be build as module ? 

Right, that should work, I'll send a v2 patch to add an "if DRM"
around the entire drivers/accel/Kconfig file, which should have the
effect.

     Arnd
