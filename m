Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654379C85C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B2C10E39C;
	Tue, 12 Sep 2023 07:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100A10E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:40:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 81ED7320025E;
 Tue, 12 Sep 2023 03:40:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 12 Sep 2023 03:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1694504452; x=1694590852; bh=gu4KD8m5ag8/RCIOGmGpJutCwSn5BzTEfiE
 SziH75LY=; b=kpYKvB1xx9wnF8RGHpXtbizWcj1EnE5ANoWRr/mZ6fssEHR4pYG
 AQA38NV7lTMlHM4701jxiBPr9dIhPtjIYEyvvYcK+6IX7wzWf1c6FlxBlfk5vCqj
 375Lr2NJiJjZCnKlPUMXQ5nzVLez5KmrYPyVdAha3A8PRtAm3xB8hSrl5/9X9Xvc
 ZPeUhO0IT4y+RhJq5id6TmIRY3tiAmNX5+obdeED7H5eg6v/r9fu/YPrvIDWdEXT
 XMpFVx/JBVai/CvjUPGbSHo+h/RIzdsmCxcT0MdxRvpe9ydKszYIAJwcIquixDgA
 RmyiyjSVaaSdHND7tghK7TMifFONIKWLHDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1694504452; x=1694590852; bh=gu4KD8m5ag8/RCIOGmGpJutCwSn5BzTEfiE
 SziH75LY=; b=1GMMROCZOGebXmmwZE3hvLCfOPtQKelh7C5eDmc++WTnzsHQeET
 gDIg44v7H3O2rsrJJaseIrbvnlPUIBHgQ6qbPH0lQuDaABt/JmgpSZT5TQkC5nRe
 dmTV+OAQhlHNy2z6zPPd3Y0QtiEQrltLKgnf9Ux2LUHm4YGF3Bria2QpLX//grvJ
 PklLxeAplTFKTycv4P5y7PTv6AtpXJM/v7aqcrPMRopKwrwYr7TzC9JsFuDjhkK3
 ri0I7yP5APUAdxv5s5Q17EWiBra3XF7SlUaXp1M6UNXp/J9PADBaiUnLx3aDEeiq
 7WHL5J7e2xn/Jqa3tbuVksL8qJAdrXu0cPg==
X-ME-Sender: <xms:AxYAZX8lw-EPZzR_s0-gxctsuCJ9K1ljQOY4BYnDdCUNTXsUqhurvA>
 <xme:AxYAZTst0W6PkSUeUuSADygtQQ1vlozgqAu3PV4zyke9Nc-bmzyNmzewIVCWg5wR8
 lii6wiEQfdKY2Gtq5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeihedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
 grthhtvghrnhepudefffehudefvefhjeduvedtkeeujeffudevkeejiedtkedtheeiuedt
 vdekuddunecuffhomhgrihhnpehushgvrhhsphgrtggvrdhhohifnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdgu
 vg
X-ME-Proxy: <xmx:AxYAZVCcd_FJuFHxjCjPo2pdcDsEj8GcMzAU8kQ3qLHSFQbpnB9lKg>
 <xmx:AxYAZTfaAAXZlbx6_jX1AuRiov2m-jFSPrDE6a_wKoAzrTOK65s-Tg>
 <xmx:AxYAZcMXYv6BcbZ9d2kZszB6mQU31ZXmWeDMovEU_iG_pGoBlhYRxw>
 <xmx:BBYAZRs4I4BjxLQ4oHEvQXTNLAdO2hiy_fs0e6TV3FW3r8xBoVl90g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 759E7B60089; Tue, 12 Sep 2023 03:40:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-745-g95dd7bea33-fm-20230905.001-g95dd7bea
Mime-Version: 1.0
Message-Id: <aa935abe-2ccf-4889-a717-4efecc13d48b@app.fastmail.com>
In-Reply-To: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
Date: Tue, 12 Sep 2023 09:39:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023, at 09:14, Geert Uytterhoeven wrote:
> On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>>         depends on DRM
>>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONS=
OLE
>> -       default y
>> +       default FB
>
> While this is true for existing configs, it is no longer true in gener=
al,
> as DRM_FBDEV_EMULATION is no longer related to FB.

I think it still makes some sense though, as configs that have
both DRM and FB enabled almost certainly want this enabled.

>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kc=
onfig
>> index b575cf54174af..83c2d7329ca58 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
>>  config FRAMEBUFFER_CONSOLE
>>         bool "Framebuffer Console support"
>>         depends on FB_CORE && !UML
>> +       default DRM_FBDEV_EMULATION
>
> Sounds good to me, although it looks a bit strange at first sight
> (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
> y on emulated fbdev?).
> So this is the fix for commit a5ae331edb02b ("drm: Drop select
> FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").

Correct, this should restore the console on configs that
accidentally lost it. The real problem here is much older,
the assymetry between framebuffer-only configs (with console
default off) and DRM configs (with console selected
unconditionally) started back in 2009 with commit 6fcefd56f5060
("drm/kms: fix kms helper license + Kconfig").

I think that was a mistake, but there is little we can do
to fix that now without breaking users.

The only alternative I can think of would be to default-enable
or force-enable FRAMEBUFFER_CONSOLE for any config that includes
both VT_CONSOLE and FB_CORE. This would increase defconfig
builds for systems that currently only want CONFIG_FB for
either FB_DEVICE or LOGO but don't care about
FRAMEBUFFER_CONSOLE. I have no idea who uses such a config,
but I think Javier previously said this was an important
use case.

>> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/c=
ore/Kconfig
>> index 114cb8aa6c8fd..804c2bec9b43c 100644
>> --- a/drivers/video/fbdev/core/Kconfig
>> +++ b/drivers/video/fbdev/core/Kconfig
>> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
>>  config FB_DEVICE
>>         bool "Provide legacy /dev/fb* device"
>>         depends on FB_CORE
>> -       default y
>> +       default FB
>
> Changing this means possibly causing regressions on systems running
> an fbdev userspace.

How? FB_DEVICE is a new config that was just split out from
CONFIG_FB in 6.6-rc1, so nobody should have any defconfig
that disables CONFIG_FB but relies on the FB_DEVICE default yet.

    Arnd
