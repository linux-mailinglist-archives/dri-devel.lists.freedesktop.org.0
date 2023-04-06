Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6A6D9B28
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7147910EC0E;
	Thu,  6 Apr 2023 14:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37CD10EC1D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:51:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id C99D82B06973;
 Thu,  6 Apr 2023 10:51:35 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 06 Apr 2023 10:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1680792695; x=1680799895; bh=Pv
 VeZJF1LUSrqLOZVN7G2amPFlD1uKLgk4hVw/5gFkk=; b=SAvTW0KPiUiO6nJkgF
 hXZ6OppFeDIVldU5nH5Nk87ZkoYm0QSz5etEIyB9L3eiPRe38qOn7Yay2vgGarg1
 5sJwAO+fTphyJMnizGXGMZA7MS5VH44wwWkJ1MrHruWcMBzAdQsbwr/HG8Ar2/6h
 ssfgDaEh1nygQh/jhR37h09WkE3hI3ETItSeiXNozl3KXDBURktHhmDVxZ7Wdzy/
 n7mzlrgcvLLYYl4GB0Jixsnnu33HHsW0S8bOvegaRFpXUzyUpg1Wrf+HHQe3JHm6
 yvJTSISUw4ZJyAl6RHWKH0+KTevm+bV6eZ5nm+FcceTSwKUlPuUP8ZQUE6Rf/952
 Fm7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680792695; x=1680799895; bh=PvVeZJF1LUSrq
 LOZVN7G2amPFlD1uKLgk4hVw/5gFkk=; b=JPS0WnF6RsH6+Xmuz649TIwf6ULqn
 iR7dqMhGcWUzrcWDkP1wJOBg+pHwmqt0HjkWV3uYIx/iYEHGdo34iUw0sMt7lXAF
 TCiFGvS91OUTZmU8mGXL1ZAIYc+2wcAVLuiGns+9hZ9Q3u+wIDdzJwLYP/GBb0jY
 PipBM8nu/zuG+9luvqZ8Jihpwj/glGEHTGAsmTUO/OhJ+2KiMp2ZX3fbsikDkl9X
 CYmcVn5Qz5pgqlithu+GeIWG615/DhpktzMk+iHq+vbMD1i48CEcdpePaPEsYSg+
 /NqG6gY4RjzahVDTu3l6p6nPXr1gPCO41q3EMcyeoONEMlvZajqF4chSg==
X-ME-Sender: <xms:dtwuZISp_urJ8m5y_mrgBVrKzfVtV7jyqafaPhhnLlaMLrxVu-zOdQ>
 <xme:dtwuZFzhYOAHcjhP_UJhiFjuMOrAhWGolGLd007OLGuh7HLcDq44kr2pBY-nRsouX
 s_u4XRoQiKraC7XyvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dtwuZF306BOOE6te4r8pL4BLeM6iLePYsvNvQT3RmqPvhsiPWIJBkw>
 <xmx:dtwuZMAFW_bz-t7uH1fIUNzgL7C4poUL5vgpabFNXqjqsotT3NYUJg>
 <xmx:dtwuZBi3L7XVmnFUihWDoER0dw0JdG93uknsbqbi8fYB_9UR12Cn-w>
 <xmx:d9wuZKZ3_VssJzan2b5oOIi7ZSLdwGBHtiVEVQK6f1B3PNR-RJRUt7wGRy0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D73D5B6009B; Thu,  6 Apr 2023 10:51:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <cfa36e9a-7e19-4c43-b9b4-1ae4f9ef51c3@app.fastmail.com>
In-Reply-To: <20230406143019.6709-10-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-10-tzimmermann@suse.de>
Date: Thu, 06 Apr 2023 16:51:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 09/19] arch/mips: Implement <asm/fb.h> with generic
 helpers
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023, at 16:30, Thomas Zimmermann wrote:
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

I think you should at least mention that the existing
fb_pgprotect() function is probably incorrect and should
be replaced with the generic version.

For reference, the fb_pgprotect function using pgprot_uncached()
was introduced in 2.6.22 along with all the other ones, but
the pgprot_writecombine function was only added in commit
4b050ba7a66c ("MIPS: pgtable.h: Implement the pgprot_writecombine
function for MIPS") for 3.18.

     Arnd
