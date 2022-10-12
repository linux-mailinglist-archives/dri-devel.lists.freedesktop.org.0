Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB135FC61B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45E410E4FF;
	Wed, 12 Oct 2022 13:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6264910E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 13:12:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C0B415C008B;
 Wed, 12 Oct 2022 09:12:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Wed, 12 Oct 2022 09:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1665580376; x=1665666776; bh=Ct4fEaGcnx
 W60ym69bXCH9mc9qXYaXsYB/Q4TrRfNec=; b=gDDtqy2G6/6ho8fsUc2YXwQBNy
 qDV9YtM36YfT/3GCfD5l/gpVQMsIkKRm1+8hVv7KWOBvguYwxYgrdc82rQYoR6j+
 Sprdv8wKqTKDxZ+5QCgLDsAm3SgRkU/g3bDfxfFgplzoGKQtPj4Nwz50AGvbxeOO
 hxrCnwMfk6eKrCenRifiNywRyiz1LYLBSA2OdFNbXS0BVSuoWBpaTfzyptQKHxLI
 urHMKY0Rq9CZlOESkHl6iI6Cx3w6SbXp14Ht89wEoj4JUWycoyHXwglQdvOx+0qc
 puBAbrYvDqm8+Xr4AWmLbdyfG5YIQDDCQIx/vzbWQy3f/LXNDnG1RSIFdh+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665580376; x=1665666776; bh=Ct4fEaGcnxW60ym69bXCH9mc9qXY
 aXsYB/Q4TrRfNec=; b=OWCSrc95pvOMPngNghm6dRIUz7Fu8nhJoQ+BtGUnfmsK
 qLWORC8NXA5dMYP+euL376k3W2dX+gaOgp3NyJQN82POobBdn/jzpj+tpFMYSrS6
 cJcdRr3ERrJ06jXmLznEb0wiSXRvRdAOZ6mEEupKYqQCnTt+tLU5fqEfqdZGmGVV
 Z1o9Yqa7IJFDDLUXSvXpCIUbmCxrXugJS3K47ayuFjOk+7ev1TdQ3YYZHpWIUJuH
 vzb33UGIMNSSaYckRf426yL3PsCItJRTOSYszLwLwZK8hZ4BE4z0bRgejy3pf36d
 TAdEB9+WhwNOGRa9JZg6AxRLFRPjms5J1n+ZaXKPMQ==
X-ME-Sender: <xms:V71GY1tLyb_WNCtKs15Ax3e6mdFrSXDacvy9pZhhUKgWJjcObi0EpA>
 <xme:V71GY-fzQizqk0DYmFiix058HHWHSTXbbXoUDTHkcFX8kp2j9b3aqrgFkZnWMdttV
 GKOFQmSjxwWB7iaI6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:V71GY4y79yGSFADeJ9PKUx1GR9V7C-EhPqoHbNIB1yDBRljZ7diIxQ>
 <xmx:V71GY8MO7pr2wyWx3LQzjlnX1JDgzuQToLBlopABlU2rToG9UUJk0A>
 <xmx:V71GY18_p8p8ZKnhcSRjjtOXljK9OTHNgijLkAvXN-L-2sVMFDeP3w>
 <xmx:WL1GYzd62EJ-m16rv6rM-Nyi139F_5k6EdB13ttyD2lZD0pLxUQP_A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9653DB60086; Wed, 12 Oct 2022 09:12:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
In-Reply-To: <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
Date: Wed, 12 Oct 2022 15:12:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, "Maxime Ripard" <maxime@cerno.tech>,
 sam@ravnborg.org, "Michal Suchanek" <msuchanek@suse.de>,
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

On Wed, Oct 12, 2022, at 2:00 PM, Thomas Zimmermann wrote:
>
> Could well be. But ofdrm intents to replace offb and this test has 
> worked well in offb for almost 15 yrs. If there are bug reports, I'm 
> happy to take patches, but until then I see no reason to change it.

I wouldn't change the code in offb unless a user reports a bug,
but I don't see a point in adding the same mistake to ofdrm if we
know it can't work on real hardware.

I tried to find out where this is configured in qemu, but it seems
to depend on the framebuffer backend there: most are always little-endian,
ati/bochs/vga-pci/virtio-vga are configurable from the guest through
some register setting, but vga.c picks a default from the
'TARGET_WORDS_BIGENDIAN' macro, which I think is set differently
between qemu-system-ppc64le and qemu-system-ppc64.

If you are using the framebuffer code from vga.c, I would guess that
that you can run a big-endian kernel with qemu-system-ppc64,
or a little-endian kernel with qemu-system-ppc64le and get the
correct colors, while running a little-endian kernel with
qemu-system-ppc64 and vga.c, or using a different framebuffer
emulation on a big-endian kernel would give you the wrong colors.

Which combinations did you actually test?

     Arnd
