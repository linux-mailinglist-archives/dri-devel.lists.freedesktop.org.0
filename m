Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE69F57E7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68410E7F2;
	Tue, 17 Dec 2024 20:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="PG/yu+KT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="3S/Q4XAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777B10E7F2;
 Tue, 17 Dec 2024 20:39:36 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id A19D21140119;
 Tue, 17 Dec 2024 15:39:35 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Tue, 17 Dec 2024 15:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734467975;
 x=1734554375; bh=aNNu1aV97H2ywQy9HYkfKUll79gVGt2TM223JqGvvs0=; b=
 PG/yu+KTPMi3QOwd5YeCYAtnAO6GxkyhDpWZ2jHJ9e01an0XFJbkp6HpHakcJYwH
 tRvpllFJCZJEtzW+eDTT4tuEmQZhrLjq/qux+HIuPGTVUwWQBXbSxA6iBLTO7Hkf
 MpLc7cqCb7wx5yNEc4nw7drIyKRc/cgwY79sWTGjR1Xxs858JDD15mRe5sSccrrX
 EMbyRqQ7sef7mhuGx0x0M2zvTrmM8TEgeHpHLXv3Ewy3AR5AWkpjiRdpITbAgUOO
 q/fsqvtmv+oVx6r1QotMq+8TFGjNjmpm4qI2TORKNxt7h6xbuNNnfLoHSdcav+qt
 dmVfNU8x3ojd3tvGHdeieA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734467975; x=
 1734554375; bh=aNNu1aV97H2ywQy9HYkfKUll79gVGt2TM223JqGvvs0=; b=3
 S/Q4XANwWKlgrl/i7TYzGY72PYpt+m85aWZjas1aIUZApsDV7Ny1s9IqKQrf/i+k
 hS8by/eS8C15wL6wU4envoksEiT7CtDWeSQfSZr6p9BP96ZP1m8JIwyqBP9nwwm5
 kjAZnbVGhXnHc1Ew4wEoZ94uiZlLga0PIOYPnViDQU/6RdnD9He2ZFwU2hiPblzG
 DZ+BMPtSxQC4h5jhaokMx6YeGI9fmZYbe/tbofqeMdvqr107T3Da4JZmTaYywoRw
 I50EJeO6H2gDnvsspkEY7IkgOZm5jWxbRzYWOl8jNocebskev8K9PDCoaKEqoztX
 8Jn04avWDmRKyM47ktPkQ==
X-ME-Sender: <xms:huFhZ8nWOvZQNR5YlOk6sqCGUb3c9SzKtqUS_QjIHE02A0aYRy8VNA>
 <xme:huFhZ70lSEuLQlyy9Fyi9y0Ps7EbgMQXXcPKM5aQnwxD5DACV3x7GaFh9MXGChrxn
 Sdbs6MqGwJtbVEL0Lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleehgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddt
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
 hhpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgt
 phhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrnhhird
 hnihhkuhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghr
 tghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehmihgthhgrvghlrdhjrdhruhhhlh
 esihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgv
 lhdrtghomhdprhgtphhtthhopehtvghjrghsrdhuphgrughhhigrhiesihhnthgvlhdrtg
 homhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:huFhZ6o3PIeEpGurKiZPOHW9JFqxqE_8LZVNdJFg49vroloUkSsc-w>
 <xmx:huFhZ4nbQbB4TglMJFBGU3_7GtoavkYQXDV_gyg9BA0FrC_VG8xqOA>
 <xmx:huFhZ61T16NpWd6YgawPOxTa4xrYnj_oTK6kcwFZ2ZUFqOAJtEhLOA>
 <xmx:huFhZ_uqPuI3czVIk9bfMBNBoonyUDRaFxnKODpiVrt9Uq2WqGv-7A>
 <xmx:h-FhZz74-Q_kyHp3KUj066zcjlIn67let4IegfEblM4E4ih3i-teIKBy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 88DA52220072; Tue, 17 Dec 2024 15:39:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 21:39:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>, michael.j.ruhl@intel.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>,
 "David E. Box" <david.e.box@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Tejas Upadhyay" <tejas.upadhyay@intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <640211a8-9516-4574-99a6-e61354d613ff@app.fastmail.com>
In-Reply-To: <fjforguil5lcij77tgmjk5sw5bzuwg7m34nsdmrzbinnmt2xte@moz3kbsg6tgi>
References: <20241217071852.2261858-1-arnd@kernel.org>
 <Z2HIW4c-S_IA9bWb@intel.com>
 <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
 <fjforguil5lcij77tgmjk5sw5bzuwg7m34nsdmrzbinnmt2xte@moz3kbsg6tgi>
Subject: Re: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
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

On Tue, Dec 17, 2024, at 21:14, Lucas De Marchi wrote:
> On Tue, Dec 17, 2024 at 08:28:59PM +0100, Arnd Bergmann wrote:
>>On Tue, Dec 17, 2024, at 19:52, Rodrigo Vivi wrote:
>>> On Tue, Dec 17, 2024 at 08:18:44AM +0100, Arnd Bergmann wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:
>>>>
>>>> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
>>>> (.text+0x19861bf): undefined reference to `intel_vsec_register'
>>>>
>>>> This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
>>>> style dependency to allow building with VSEC completely disabled.
>>>> My impression here is that this was not actually intended, and that
>>>> continuing to support that combination would lead to more build bugs.
>
> why? if xe is built-in, vsec needs to be built-in as well. If xe is a
> module, vsec can be either built-in or a module.

"depends on INTEL_VSEC" enforces that hard dependency. The difference
with "depends on INTEL_VSEC || !INTEL_VSEC" is that it also allows
XE to be either built-in or a module if INTEL_VSEC is turned off,
as it would be the case on non-x86.

       Arnd
