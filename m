Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8F79CB09
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1310710E3CD;
	Tue, 12 Sep 2023 09:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB210E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:05:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id EF997320092D;
 Tue, 12 Sep 2023 05:05:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 12 Sep 2023 05:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1694509517; x=1694595917; bh=TA8jtm4MgiuLceQSfCUtObGyhjBvJ9WYvez
 Lxw5lbaw=; b=ZqeqHrOIO5iNCsuQT6fSm2DTBJAwajk3dmAJFcIZwKOL8J38ekR
 g2vbDkuTkNHVYLB5vohqaLJVZ/e2eyE55CEWTsaqh8VvQrzVfVMuLgSSZ7m+iGJT
 X8N4VzmAR/qc5Ess1YNUM0TdWHKVhQ4FQBWTvCI2SnG9C4KB5zQzTNPErycPBQZE
 outhf0mrl/3qIi6G+wzsX42bmx1yh6FnLf+i1vzUnH9JfBevUkt0mD91ZYjGK94Y
 NY/otR/xqGTDx/o0FIG5aasP2ihHIDCARrM6r7IXNr1lmemp893dC4D4ksdivxgQ
 CaODyH9MrdsoRtGi2+hDAbCxLHLp23+7dEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1694509517; x=1694595917; bh=TA8jtm4MgiuLceQSfCUtObGyhjBvJ9WYvez
 Lxw5lbaw=; b=2ooWtfOO2MK8Jq4z7Lmp9UKffCU7Pj1TS+TnT/DsV4kh9M2VxOT
 rpJAnHBQu5STG1nvauq+g0LYRBuafcPKTRfZK7HtnyKV6pIQdUq7HsDfSfp6Y3Qm
 AcL5CfHzLOpuoB40BXYMyv9z9UqE8aBoJn0wMltNymFaXYxYXd2zcS0+I/YLrxIm
 kDCLutYXYjuRdJKHNrSDmeeYdru2qBrzdLbXbGnihbGnAYGpZbYmQxmDnTR6JipP
 wgYdeYqbouYCqBDnZq+04JOKHc8ddSN66YVO+LqAAg+ztYNkGvLcbUNKKnFFyp+u
 lCTy9/OLIk3i3O+oks1SwgGLj68ZJI/I6Tg==
X-ME-Sender: <xms:zCkAZdnhrTONwjZFVsCxi6-fCbtVbU12Yo_1New2z5PgPmvmyhQIeQ>
 <xme:zCkAZY079OMp_HeyLXL73cQjepCUfa9PU2f1BHZ13gppOFqvKm9djfS39y2Jwrn0A
 k04119iCA5UFXE6B5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeiiedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:zCkAZTph2p8yB6xZUTeKtSEoZcnITI9fAJC8CDmInTTZdxxLLgjTlQ>
 <xmx:zCkAZdntsHWR2udclgoU3EZ5bwdQrDjvZSv8-Ex8pLX1nEBMSz0Fkg>
 <xmx:zCkAZb3_VcDyA57qvBhBPc-ZTXfCZ_rEzAji1IcNGdi9S9OHGV3Ttw>
 <xmx:zSkAZS3HDXKsXxxvVNSm8kcduW84Nf0bRMdmlX3lwoHVK8ysNrXnZg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B86E4B6008D; Tue, 12 Sep 2023 05:05:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-745-g95dd7bea33-fm-20230905.001-g95dd7bea
Mime-Version: 1.0
Message-Id: <9a7c7cb2-fa9e-4bf9-891b-ccd754d1fc25@app.fastmail.com>
In-Reply-To: <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
 <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
Date: Tue, 12 Sep 2023 05:04:37 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023, at 04:18, Geert Uytterhoeven wrote:
> On Tue, Sep 12, 2023 at 10:11=E2=80=AFAM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
>> Am 12.09.23 um 09:14 schrieb Geert Uytterhoeven:
>> [...]
>> >> --- a/drivers/gpu/drm/Kconfig
>> >> +++ b/drivers/gpu/drm/Kconfig
>> >> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
>> >>          bool "Enable legacy fbdev support for your modesetting dr=
iver"
>> >>          depends on DRM
>> >>          select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_=
CONSOLE
>> >> -       default y
>> >> +       default FB
>> >
>> > While this is true for existing configs, it is no longer true in ge=
neral,
>> > as DRM_FBDEV_EMULATION is no longer related to FB.
>>
>> Would it make sense to make FRAMEBUFFER_CONSOLE an independent option
>> and have FBDEV_EMULATION depend on it? Something like this:
>>
>> FRAMEBUFFER_CONSOLE
>>         depends on DRM || FB
>>         select FB_CORE
>>
>> FBDEV_EMULATION
>>         depends on DRM
>>         depends on FRAMEBUFFER_CONSOLE
>>         default y
>
> Oops, now you can no longer have FBDEV_EMULATION without
> FRAMEBUFFER_CONSOLE, which is useful to be able to enable
> FB_DEVICE...
>
> And what's the point (if DRM is enabled) of having FB_CORE with
> FBDEV_EMULATION disabled?

I think we technically have the choice between selecting FB_CORE from
all the providers (FB and DRM_FBDEV_EMULATION) or from all the
consumers (FRAMEBUFFER_CONSOLE, FB_DEVICE and LOGO). We chose
to have it the former way at the moment, and I think what Thomas
suggests here is to change it to the latter.

The downside of the current approach is that you can have
pointless configuration with

CONFIG_FB=3Dy
CONFIG_DRM=3Dy
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_FRAMEBUFFER_CONSOLE=3Dn
CONFIG_FB_DEVICE=3Dn
CONFIG_LOGO=3Dn

where the fb_core module gets initialized but it is impossible
for anything to draw on it.

Another option we have would be to try to separate the Kconfig
options for DRM and FB a little further, in anticipation of
reducing the amount of shared code in the long run (a lot of
FB code is built but never used when enabling console on
DRM).

So adding a new

config DRM_CONSOLE
     bool "enable console on DRM devices"
     depends on DRM
     depends on VT_CONSOLE
     depends on !UML
     select FB_CORE
     select FRAMEBUFFER_CONSOLE_CORE # new helper sym
     select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
     default y

would give us a path to minimize the shared code
further, allowing the console code to be reused as
before, but without having to pull in the code that
is now only needed for FB_DEVICE. In this scenario,
we'd still have CONFIG_DRM_FBDEV_EMULATION like

config DRM_FBDEV_EMULATION
      bool "full emulation of fbdev layer for DRM"
      select FB_CORE
      select FB_DEVICE
      default FB # if enabled already, use it

but only use that if we actually want FB_DEVICE.

      Arnd
