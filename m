Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CEE5AFF04
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449D10E438;
	Wed,  7 Sep 2022 08:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 513 seconds by postgrey-1.36 at gabe;
 Wed, 07 Sep 2022 08:31:03 UTC
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1531610E437
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 08:31:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BE3772B058E5;
 Wed,  7 Sep 2022 04:22:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1662538946; x=1662542546; bh=X79Bowixk2
 UfvY4aNNNBf2XN1vgN+OVQkvEi3n41B/0=; b=FHq3eWsWbj7AeTTcT3sCiG2Gid
 zoMcoGnX87QaDKCL9Klc4femUTSwemZiQ3qSZVwFlxvWnOSM7bX1ZQzTRZr/ntO/
 rUHgfMfaMnw/547ubHfdDxNcdibTQ2teOF/7DV2qlAmttNSlW7d5iyhtiWg/uUDJ
 lO5qL1F586qegEJupGnmnHsI1IuCp/ImB2pbQwWZ70GdaaWn+oyXtexephhYdXmV
 SQislyNm+YIIa72TtD5MTVU7il9ysVv6MvEvZIg7XCSWABdf8+1sk/oBKSO3pfZ1
 uvi6NqIm6jxqcFGbLN03EAn7fM7h4L7Oi/Ji5N0dSTsTCHL9kkQrct9oFswQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662538946; x=1662542546; bh=X79Bowixk2UfvY4aNNNBf2XN1vgN
 +OVQkvEi3n41B/0=; b=i2fgw7Lm2RcMVoE6K+rIusyvnZ4lyDN5dx8+fgyWxbIF
 +AqTwmsIDN0yb6WUldLlrs74GDun+0ghaNFmnjAZTG/kG/DTX2Ue6Jo6AoIEGfnp
 m23C0krGK+yRAnjvF9vuguVXjMShUCvrdItalepOHerr8sWvWVCUH+p2pz2BA84o
 9CL/mCBfzT64N5Sg+EM/Sn8zu3t4Mmkl8ZGk/QCKdH6GT+U+UaWKS/+FhXt/OrSz
 UJnDAu8M6YDAc3UEYGHiyeS8WJGorrnO8HOYrXp9DGJehh1+4dezsYWVDALjUEnt
 h56fIcvzomWG4T8yO1l/aiAYb7MXV5HfHSWhSnNe0w==
X-ME-Sender: <xms:wFQYY3OkJ587gJqTFniHmGsoib1jkjdGST-qEVi3IKekB1A8gjk2Ww>
 <xme:wFQYYx9zmv0pewFSnpE2qd-qg4VthrNbv2mqpQ6fzyLh1lG1ncg64YLF8XhxEzdRd
 HxfOqHKeDJhq7DxaTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:wFQYY2Q2JbiXtN04GC_Hse6TtfQrs-R6JzVpCd0xqk1-TcpRmNZX_A>
 <xmx:wFQYY7tsyffEhqi73XQbt5gJ44AMPaQ4LgT-tZrwxuBOXwBcKVpCPw>
 <xmx:wFQYY_cRGxurafke8L8pYB345DBK3SybXlKUd3IJpkYtG6W6mxVuLQ>
 <xmx:wlQYYynsfP7agf-9b5bKj6YVeu5IB60g4wd5G4IyoTohz3aQSZ3gRnFKefaSHW1i>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 32FE6B60083; Wed,  7 Sep 2022 04:22:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <e2e2a0c7-d859-4255-94b6-b030aa9dc277@www.fastmail.com>
In-Reply-To: <YxfBGDg6YkIQ6Wzq@phenom.ffwll.local>
References: <20220806163255.10404-1-markuss.broks@gmail.com>
 <20220806163255.10404-4-markuss.broks@gmail.com>
 <YxfBGDg6YkIQ6Wzq@phenom.ffwll.local>
Date: Wed, 07 Sep 2022 10:22:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Vetter" <daniel@ffwll.ch>,
 "Markuss Broks" <markuss.broks@gmail.com>
Subject: Re: [PATCH v2 3/3] efi: earlycon: Add support for generic
 framebuffers and move to console subsystem
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Wei Ming Chen <jj251510319013@gmail.com>,
 phone-devel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022, at 11:52 PM, Daniel Vetter wrote:
> On Sat, Aug 06, 2022 at 07:32:24PM +0300, Markuss Broks wrote:
>
> Ok I have a more fundamental issue with this than the lack of proper patch
> splitting I mentioned in the other thread.
>
> This is the wrong place.
>
> drivers/video/console is about the various vt console implementations,
> which supply a struct consw to con_register_driver.

You are right, that was my mistake. The original patch was for
drivers/video/fbdev/, and I suggested moving it out of there because
it does not depend on the fbdev subsystem, but clearly my suggestions
of drivers/video/console was equally wrong.

> This otoh is an (early) kernel/printk console implemented using struct
> console. Totally different thing, and really shouldn't end up in
> drivers/video/console imo. Somewhere in drivers/firmware might still be
> the best place, the sysfb stuff is also there. Maybe
> drivers/firmware/sysfb_earlycon.c?

drivers/firmware/ is better but doesn't sound great to me either,
since one important thing the patch does is to not make it depend
on EFI firmware or BIOS style screen_info any more. 

Maybe drivers/tty/earlycon_simplefb.c would work better, keeping
it close to the earlycon base support in drivers/tty/serial/,
the vt console and the old simplefb driver/, without tying to too
closely to fbdev of UEFI.

     Arnd
