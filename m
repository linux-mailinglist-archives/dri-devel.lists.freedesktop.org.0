Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15920C7A6C2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493FE10E88C;
	Fri, 21 Nov 2025 15:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="dtY7eTXm";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QUA0Fo5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6802810E88C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:10:22 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 7B06C7A013B;
 Fri, 21 Nov 2025 10:10:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Fri, 21 Nov 2025 10:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1763737821;
 x=1763824221; bh=DzcM0SEDw1Im8fyyYBvoRQL2qFmDyiUwqhJDAcQietI=; b=
 dtY7eTXm6z72fUOOO/qOQRCZCE7nLB5/COnsayJ2X3an2s6zR/DpxY7eInL21wlQ
 WIQopkjoX7PAbVqd3MT9lU3RtJ600pmCc5N1Dm1coHHww/H0laqmBQBlTVnZ3QXQ
 L4ESBSaG+iCHeJKZfvIhFj+AXJtwP2SYhBOaIuKJTzcFC5TOw4wWh15FKL7gocyJ
 Y6WH3Sv43ZoCTATa+bMHhkWHLvJxIeNA+QgEyv9Ruf/+sPqGJGs+I3Q/RZL/8UF7
 Zrx6C3Erl9ZKl95quATmJELhFxjo/nlckGUtbyfQHbF9awIjOxMxyt4qMVSp+9yt
 uFeKQR1s4lhzCtMxwTGR0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763737821; x=
 1763824221; bh=DzcM0SEDw1Im8fyyYBvoRQL2qFmDyiUwqhJDAcQietI=; b=Q
 UA0Fo5SvUkmXgGqQuJvjUSByoK42NUh42UjDqOaKiWgbS6MinxkT0sd272hB7W+D
 HvctXy7+yEhgAJ51/xXbP/xAE6qW5YvtfY59YHMu/ol287owpGlf3fMiYgOTAhyW
 jfgr7VTJf4K/GEf0acuiLyf/OCJS7wf69DtpG7zhHxO5/FuFETNEinUa3dQODHdL
 bhI7i0QGvSML5IlRuw+oEHe20JqklyfVVF67csPpgl27AxWTgmo4Ei9BmwmnVtpu
 oEZY1uUd1HRUEudf1xgj4V8nhLJkhDjDENxNkQ9AYvBlnY7msfO2AieYL6fNn/h1
 xvgSLLmJJxqt/eOuC19Gg==
X-ME-Sender: <xms:3IAgaYHUEGvo-ne5gkZhxxQ-MevE0ITlKZfF8bv2TXLk6DXyvgcZMg>
 <xme:3IAgacI0kVVgEWlixUuWUfiT6FuFhLx9CpWjrWM5eHx1ERCwPpjdKNtgYZhIja-5v
 kroOAJ2zKrzVh1F6q6_qLLg_H8k2HpnqsZ9Jsn5kdkdpsxS6h0dFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtvdekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekie
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdr
 fhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
 hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
 eplhhoohhnghgrrhgthheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehj
 rghvihgvrhhmsehrvgguhhgrthdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnh
 hnsehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqvghfihesvhhgvghrrdhkvghr
 nhgvlhdrohhrgh
X-ME-Proxy: <xmx:3IAgaQobINDk36AsLM6qAi37y35WNG8fcy-IPYwT81UtDOP69W5h3Q>
 <xmx:3IAgaXHy2EKi4JZDENLJjNgh2jqPvL0iGJdWo6ROzCZAfVBSSOEUpg>
 <xmx:3IAgaU8wQD8W2AA4zezbIVBARPkZc-2doMkJoyEm_GT9fAygZG2L4g>
 <xmx:3IAgaURbIfsqA_WQy6F7q2MeK8e-4Qti348yk5jtKvNDZdcs-FFwjw>
 <xmx:3YAgaeSI3c_MRk18gVsMtEXTcvu2Jwxiwr0-6n59AFRitQQGspBnOGUo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 8EB84700054; Fri, 21 Nov 2025 10:10:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5Y7Dcvi2yON
Date: Fri, 21 Nov 2025 16:09:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-Id: <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
In-Reply-To: <20251121135624.494768-1-tzimmermann@suse.de>
References: <20251121135624.494768-1-tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] arch,
 sysfb: Move screen and edid info into single place
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users.
>
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
>
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.

This all looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

It should also bring us one step closer to eventually
disconnecting the x86 boot ABI from the kernel-internal
sysfb_primary_display.

    Arnd
