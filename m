Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53879C8E5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908E10E3A9;
	Tue, 12 Sep 2023 07:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703810E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:59:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D100332008C0;
 Tue, 12 Sep 2023 03:59:02 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 12 Sep 2023 03:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1694505542; x=1694591942; bh=qPHeyFedUwjFkIx8oudsmrh0QO5gAytcUsb
 D3UuDNAk=; b=O5E3jEJ95BxAVgDYksiezRxNdQlu+sbdPJNS5iYygkXpB0Vpf7o
 cPj8ILqNM0gwEnHUg6003hlfrW090XMDq1+wHvlSaPLOnORwY+hB81N2gnWQBO9C
 d/WTQlSWY1muyh2uDL2b4Kgk+gMglLMyVu/BGpHUA/Bu6TNfR1xxOWpy6SBwYrAg
 yZVScICNmyZycv2mgtafjAcfiONf0cuO7XIgWyn4t2zlfY6kMYGzIQPVvSy1nzEn
 voNZS1lxeptfdEjtQqq67jsYWYqbDnoj0z1z2ylA0QQQf575dcV1sjRCXThJ4tg5
 3rZLIYn5KWnQXDKjFKInUiF8lEec7zctxnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1694505542; x=1694591942; bh=qPHeyFedUwjFkIx8oudsmrh0QO5gAytcUsb
 D3UuDNAk=; b=lVIgwVxCdObYdxA4mI+pGHlj1jhMzOUN3PCEosrGW/9UuI5klzi
 BVXDO8MY40VksaytO0gIQ1Qxzh7X+eTYgSgDHAOB+BB4qwC9RCqtzHNfx6vZCE9O
 vbWdJA0QQ1MJYEldYK7vamxcYe6DonDy9ZRcy3+YT3/W+94zIG8ccVaQ95cQnoy9
 aOGFFkjiQgYexXnIWQrc6wvLvBZ5vS943tzp/H8NAXyRbJjJvI8UW3JVD4GlQAWL
 rpDWMmRV0P4KdKG++XNvYYCpk1fX0regMUH8oV4PsBRqOJ3nQFp2eCM+skcz7lXP
 4s64rVbqaslUu2EjQJSIM/8BGqnk4Xesf/A==
X-ME-Sender: <xms:RRoAZRQV9kKZ6fip7TIuLbUxtHtTw3YvuZqnr1_V63VCNLY3FXNVKg>
 <xme:RRoAZawNHaiDaVHMoWR2sg8V-y3zzEF2UJVblqnoUCL-BoZsJa3cVJDU2Gbx8gQey
 9r4VTGA5ZQStspv_Xk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeihedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
 grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
 tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RRoAZW2yl2iwwalZEORLkowNMsqb84zZxrn4CZ_AiP93Z-84vUvw5Q>
 <xmx:RRoAZZBSRBpEI4F4QXNaF3tDH18BGrM-hGc2BCmk7_2yJMTcH3Bqaw>
 <xmx:RRoAZahLSMqk7dctZafY2jhmSmf5_6mG-gpLrhds92VQAH7jtm-p-g>
 <xmx:RhoAZezbXA_pzfgeJujOGNBMwrWxhG8CgT3HXSGXRFTLeqEtHGftfQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9AB1DB60089; Tue, 12 Sep 2023 03:59:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-745-g95dd7bea33-fm-20230905.001-g95dd7bea
Mime-Version: 1.0
Message-Id: <f4d77a67-3069-4e25-9b41-8bb06f6d51f9@app.fastmail.com>
In-Reply-To: <87a5tr3k92.fsf@minerva.mail-host-address-is-not-set>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <87a5tr3k92.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 12 Sep 2023 09:58:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023, at 09:48, Javier Martinez Canillas wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.o=
rg> wrote:
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
>>>         bool "Enable legacy fbdev support for your modesetting drive=
r"
>>>         depends on DRM
>>>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CON=
SOLE
>>> -       default y
>>> +       default FB
>>
>> While this is true for existing configs, it is no longer true in gene=
ral,
>> as DRM_FBDEV_EMULATION is no longer related to FB.
>>
>
> Maybe default y if (FB_DEVICE || FRAMEBUFFER_CONSOLE) ?

That wouldn't work unless we swap around the 'select DRM_CORE',
which currently gets selected when DRM_FBDEV_EMULATION is
turned on.

>>>         help
>>>           Choose this option if you have a need for the legacy fbdev
>>>           support. Note that this support also provides the linux co=
nsole
>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/K=
config
>>> index b575cf54174af..83c2d7329ca58 100644
>>> --- a/drivers/video/console/Kconfig
>>> +++ b/drivers/video/console/Kconfig
>>> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
>>>  config FRAMEBUFFER_CONSOLE
>>>         bool "Framebuffer Console support"
>>>         depends on FB_CORE && !UML
>>> +       default DRM_FBDEV_EMULATION
>>
>> Sounds good to me, although it looks a bit strange at first sight
>> (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
>> y on emulated fbdev?).
>
> And there Maybe default y if (FB || DRM_FBDEV_EMULATION) ?

That would be the same as a plain 'default y' based on the
dependencies. We can definitely do that, but it does change
the behavior for FB-only users.

At the moment, we have 21 defconfig files in the kernel
that enable CONFIG_FB but not CONFIG_FRAMEBUFFER_CONSOLE:

$ git grep -l CONFIG_FB=3Dy  arch/*configs/ | xargs grep -L "FRAMEBUFFER=
_CONSOLE=3D\|DRM=3D"
arch/arm/configs/am200epdkit_defconfig
arch/arm/configs/assabet_defconfig
arch/arm/configs/clps711x_defconfig
arch/arm/configs/ep93xx_defconfig
arch/arm/configs/footbridge_defconfig
arch/arm/configs/h3600_defconfig
arch/arm/configs/multi_v4t_defconfig
arch/arm/configs/mvebu_v5_defconfig
arch/arm/configs/pxa910_defconfig
arch/arm/configs/s3c6400_defconfig
arch/arm/configs/wpcm450_defconfig
arch/microblaze/configs/mmu_defconfig
arch/mips/configs/cobalt_defconfig
arch/mips/configs/generic/board-ranchu.config
arch/mips/configs/malta_qemu_32r6_defconfig
arch/mips/configs/maltaaprp_defconfig
arch/mips/configs/maltasmvp_defconfig
arch/mips/configs/maltasmvp_eva_defconfig
arch/mips/configs/maltaup_defconfig
arch/sh/configs/r7785rp_defconfig
arch/sh/configs/se7343_defconfig

>> So this is the fix for commit a5ae331edb02b ("drm: Drop select
>> FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").
>>
>>>         select VT_HW_CONSOLE_BINDING
>>>         select CRC32
>>>         select FONT_SUPPORT
>>> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/=
core/Kconfig
>>> index 114cb8aa6c8fd..804c2bec9b43c 100644
>>> --- a/drivers/video/fbdev/core/Kconfig
>>> +++ b/drivers/video/fbdev/core/Kconfig
>>> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
>>>  config FB_DEVICE
>>>         bool "Provide legacy /dev/fb* device"
>>>         depends on FB_CORE
>>> -       default y
>>> +       default FB
>>
>> Changing this means possibly causing regressions on systems running
>> an fbdev userspace.
>>
>
> Right, specially if using DRM fbdev emulation since then the default w=
ill
> be different between v6.5 and v6.6 (that's what this patch tries to av=
oid).
>
> So probably we could keept that default as 'y'.

I really don't want to start enabling this for configs that
didn't have it in the past.

    Arnd
