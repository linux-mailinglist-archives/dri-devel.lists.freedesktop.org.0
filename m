Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2FBAF2DF
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A794C10E196;
	Wed,  1 Oct 2025 06:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="IPOMf5e8";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="mXV3GfR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B58210E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:11:06 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 5F9461D0018C;
 Wed,  1 Oct 2025 02:11:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 01 Oct 2025 02:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1759299065; x=1759385465; bh=ghh3rJgsy3
 eLVghpQoeYS7lZedkPcw+Y6gzEIEfg8FQ=; b=IPOMf5e8EF+IWvHwqT2h3T/q4e
 4CZIqpeLFz4XyY8vk0srZP73YhdA2S8OzSpZP1CfPWusNd9NM858En5blBQ2FRsg
 Ch17o+09EGNonlNn5Jx9gvR9QB9DTu/f1DflI2qKGOUIaqYGVBbRu9oyjhTcJtVV
 v1WkqA4VsIfGUHe52Kxc2mJcQ8moyBzL2eCQ+yuWkkHO4d/nUXO5P+5Gp5CQIoka
 HCanoVFP9GtExB89JtWQXdZnUZVUSyhmzXbBMV8Jwo2tFTalsbcQL/Ecc5JwaSlF
 znFwhIsMk8nBtiqbr1bim9cfFD0cs8TAtdzb4veF2EHNn1LzcTWL+hfjQ1rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1759299065; x=1759385465; bh=ghh3rJgsy3eLVghpQoeYS7lZedkPcw+Y6gz
 EIEfg8FQ=; b=mXV3GfR8Ic2bkAfUMxrKm/bFQIHRvBSoXz2kIrrr2vZLGdX0zXL
 b+r6CR8F1lJ5rsV1BDc+CVVE1P6FgWSDw9pAngknTtsjddDKmavTTlCP+lmwAAbc
 aX7D7e2YABhNikQATX18cOiSy2jiSMS6pX4rpbI2AvF7Ol4mkp8N4uohFACeE7Ia
 pnlhYMXxivBkJvN6K9pFCUK2HBA1544HDERQwRnQoT6Z9JapiV45xlKeiwtMm4mb
 JyoPjeAQVkssNxE7/Hg/Y7kuGL8nH2FpoQ4ivuqxdPnKzcBJ2lJ6Ph/i5u+wW1CD
 AH+graXJjXbBZp52FUK7kbo0EKfa1/G01NQ==
X-ME-Sender: <xms:-MXcaGTQx6pK2uPbTLIfyGUbGhQqzklMLV8IN55UL95tH6RS6zIJEA>
 <xme:-MXcaIpnm5f1cDXPXK5M4NE5vVW8_EvMghZBsB5-PULZ7bJ00Xx6lirPLP9ecmaE4
 dgv_-Omr-3ViVjUrG34lrDCBwQTKEOz0Cq92rVufNtytNYuCi3QeR8>
X-ME-Received: <xmr:-MXcaDnH9VhjFpvyfXtz2ZABrIZcYnVQFGe1503BpcbAqoKYzXL9nlZU_P-7-Zruxj4ycQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekvdefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfduue
 ffleefkeegueektdehkeejtedtffdtudejhfdvheetgfeigfeltdeufeejnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepkedp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprh
 gtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrhgvughi
 nhhgsehnvhhiughirgdrtghomhdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvgh
 gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishht
 shdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
 gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvggthhesthhoohht
 rghirdhnvghtpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorh
 hg
X-ME-Proxy: <xmx:-MXcaBc5r0l8khNsrkaLM2pKuUVstZD-wYHnYcQjOnUmgowaiVdCWg>
 <xmx:-MXcaPquu3FSKe6rZcjQNbO6fQMAn9S2f57wnli0N5pVQBidmdA0PQ>
 <xmx:-MXcaLMYne9vSuksQUhJRmsun7AKH7g6IRkhbidnoTBrINk9UWRU9w>
 <xmx:-MXcaCg95KAFIGM_XqyGl5ZETS8x-rrSZtrS-n-sv_9LR7X_UMhfqQ>
 <xmx:-cXcaAJJ_V9OYpOIsTmdRWNrSb0Mi1wd32xTP50KG5lGcn6_weidn7k2>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Oct 2025 02:11:04 -0400 (EDT)
Date: Wed, 1 Oct 2025 08:11:02 +0200
From: Janne Grunau <j@jannau.net>
To: Helge Deller <deller@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, Thierry Reding <treding@nvidia.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Huhardeaux <tech@tootai.net>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] fbdev/simplefb: Fix use after free in
 simplefb_detach_genpds()
Message-ID: <20251001061102.GA1519657@robin.jannau.net>
References: <20250915-simplefb-genpd-uaf-v3-1-5bb51506a5b9@jannau.net>
 <e0b113e6-8b3d-4d2d-b1b8-cd6609b8bca7@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0b113e6-8b3d-4d2d-b1b8-cd6609b8bca7@gmx.de>
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

On Tue, Sep 30, 2025 at 09:12:21PM +0200, Helge Deller wrote:
> On 9/15/25 08:36, Janne Grunau wrote:
> > The pm_domain cleanup can not be devres managed as it uses struct
> > simplefb_par which is allocated within struct fb_info by
> > framebuffer_alloc(). This allocation is explicitly freed by
> > unregister_framebuffer() in simplefb_remove().
> > Devres managed cleanup runs after the device remove call and thus can no
> > longer access struct simplefb_par.
> > Call simplefb_detach_genpds() explicitly from simplefb_destroy() like
> > the cleanup functions for clocks and regulators.
> > 
> > Fixes an use after free on M2 Mac mini during
> > aperture_remove_conflicting_devices() using the downstream asahi kernel
> > with Debian's kernel config. For unknown reasons this started to
> > consistently dereference an invalid pointer in v6.16.3 based kernels.
> > 
> > [    6.736134] BUG: KASAN: slab-use-after-free in simplefb_detach_genpds+0x58/0x220
> > [    6.743545] Read of size 4 at addr ffff8000304743f0 by task (udev-worker)/227
> > [    6.750697]
> > [    6.752182] CPU: 6 UID: 0 PID: 227 Comm: (udev-worker) Tainted: G S                  6.16.3-asahi+ #16 PREEMPTLAZY
> > [    6.752186] Tainted: [S]=CPU_OUT_OF_SPEC
> > [    6.752187] Hardware name: Apple Mac mini (M2, 2023) (DT)
> > [    6.752189] Call trace:
> > [    6.752190]  show_stack+0x34/0x98 (C)
> > [    6.752194]  dump_stack_lvl+0x60/0x80
> > [    6.752197]  print_report+0x17c/0x4d8
> > [    6.752201]  kasan_report+0xb4/0x100
> > [    6.752206]  __asan_report_load4_noabort+0x20/0x30
> > [    6.752209]  simplefb_detach_genpds+0x58/0x220
> > [    6.752213]  devm_action_release+0x50/0x98
> > [    6.752216]  release_nodes+0xd0/0x2c8
> > [    6.752219]  devres_release_all+0xfc/0x178
> > [    6.752221]  device_unbind_cleanup+0x28/0x168
> > [    6.752224]  device_release_driver_internal+0x34c/0x470
> > [    6.752228]  device_release_driver+0x20/0x38
> > [    6.752231]  bus_remove_device+0x1b0/0x380
> > [    6.752234]  device_del+0x314/0x820
> > [    6.752238]  platform_device_del+0x3c/0x1e8
> > [    6.752242]  platform_device_unregister+0x20/0x50
> > [    6.752246]  aperture_detach_platform_device+0x1c/0x30
> > [    6.752250]  aperture_detach_devices+0x16c/0x290
> > [    6.752253]  aperture_remove_conflicting_devices+0x34/0x50
> > ...
> > [    6.752343]
> > [    6.967409] Allocated by task 62:
> > [    6.970724]  kasan_save_stack+0x3c/0x70
> > [    6.974560]  kasan_save_track+0x20/0x40
> > [    6.978397]  kasan_save_alloc_info+0x40/0x58
> > [    6.982670]  __kasan_kmalloc+0xd4/0xd8
> > [    6.986420]  __kmalloc_noprof+0x194/0x540
> > [    6.990432]  framebuffer_alloc+0xc8/0x130
> > [    6.994444]  simplefb_probe+0x258/0x2378
> > ...
> > [    7.054356]
> > [    7.055838] Freed by task 227:
> > [    7.058891]  kasan_save_stack+0x3c/0x70
> > [    7.062727]  kasan_save_track+0x20/0x40
> > [    7.066565]  kasan_save_free_info+0x4c/0x80
> > [    7.070751]  __kasan_slab_free+0x6c/0xa0
> > [    7.074675]  kfree+0x10c/0x380
> > [    7.077727]  framebuffer_release+0x5c/0x90
> > [    7.081826]  simplefb_destroy+0x1b4/0x2c0
> > [    7.085837]  put_fb_info+0x98/0x100
> > [    7.089326]  unregister_framebuffer+0x178/0x320
> > [    7.093861]  simplefb_remove+0x3c/0x60
> > [    7.097611]  platform_remove+0x60/0x98
> > [    7.101361]  device_remove+0xb8/0x160
> > [    7.105024]  device_release_driver_internal+0x2fc/0x470
> > [    7.110256]  device_release_driver+0x20/0x38
> > [    7.114529]  bus_remove_device+0x1b0/0x380
> > [    7.118628]  device_del+0x314/0x820
> > [    7.122116]  platform_device_del+0x3c/0x1e8
> > [    7.126302]  platform_device_unregister+0x20/0x50
> > [    7.131012]  aperture_detach_platform_device+0x1c/0x30
> > [    7.136157]  aperture_detach_devices+0x16c/0x290
> > [    7.140779]  aperture_remove_conflicting_devices+0x34/0x50
> > ...
> > 
> > Reported-by: Daniel Huhardeaux <tech@tootai.net>
> > Cc: stable@vger.kernel.org
> > Fixes: 92a511a568e44 ("fbdev/simplefb: Add support for generic power-domains")
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > Changes in v3:
> > - release power-domains on probe errors
> > - set par->num_genpds when it's <= 1
> > - set par->num_genpds to 0 after detaching
> > - Link to v2: https://lore.kernel.org/r/20250908-simplefb-genpd-uaf-v2-1-f88a0d9d880f@jannau.net
> > 
> > Changes in v2:
> > - reworked change due to missed use of `par->num_genpds` before setting
> >    it. Missed in testing due to mixing up FB_SIMPLE and SYSFB_SIMPLEFB.
> > - Link to v1: https://lore.kernel.org/r/20250901-simplefb-genpd-uaf-v1-1-0d9f3a34c4dc@jannau.net
> > ---
> >   drivers/video/fbdev/simplefb.c | 31 +++++++++++++++++++++++--------
> >   1 file changed, 23 insertions(+), 8 deletions(-)
> 
> applied to fbdev git tree.

Thanks.
> 
> PS: Janne, if you want to push yourself via drm-misc, just let me know and I drop it...

I won't. My request for commit access is still pending. I should fine
someone at xdc to ask about that.

Janne
