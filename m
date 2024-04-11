Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7328A0A8B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C710EF36;
	Thu, 11 Apr 2024 07:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="AF3ArE2p";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rw1Y+yKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Thu, 11 Apr 2024 07:51:16 UTC
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3D910EF36
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:51:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 3620318000A7;
 Thu, 11 Apr 2024 03:42:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 11 Apr 2024 03:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1712821352;
 x=1712907752; bh=L1aRStXBed7JkQOFONFj/EZa6Keynn96VjRq49KnU/o=; b=
 AF3ArE2phApSlW6eTlQ8vvvRyINs61aUzQziPBl6P8pUiI3NYuVxN4hRvYuZmYQ+
 WDSp38PZVO3jZT9pYmP6GxcxEu/NzHyNvv/TevWEFDTmhkU+GPF37+HQFRjTrQ7x
 IhyvVbvsGEzfFD7ZdWRjVMnGU27Qkuzy56RdbirEscZdPhyJZihYvDITCJmUzjyO
 ZjAcIsuc39hndYICNlWBu3xFKwSifPtFEjn9y6xWYggNlCfNGWjSbLX49I0VK23M
 /LfpNfQQ6COh6E+u08F3sAPynAAzQGzhvLQ5Nb+sg5iBVqfdnHjbGU34axDr8ffL
 OtrF5M9vBYGcBPoDJuVxjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712821352; x=
 1712907752; bh=L1aRStXBed7JkQOFONFj/EZa6Keynn96VjRq49KnU/o=; b=R
 w1Y+yKZLYHu1ZdMCvgxRnpmM/SJ9L9ZDHyZBWBEmQgmWgoAXoznRLg2ADwvzjCxe
 l85Flrqles1EZcxKVxqqTwdRpYVma0bTyHVO5ITwhrgJYKDYYeQ7C7RKuiWIKKFr
 oVkpaho5cJCnwQ9r/Kp2v9xZW9F1pJMLWEiR55wPRnSN1Y2h3GCJqk4rxss6GCg2
 5t9B81rXaG1cMzDysd0NEOvs8reblNE5Te67xhqaDuaOlv8UVT6RaZiXq2hiq+up
 ByKMewtsSJLyEYHIV3ISiRmlDSTlw0XuZBLyhGWHsblUzgn8N+nAqjMk4sNhKA5a
 qvG77YMPGvuXq8NX9xAkw==
X-ME-Sender: <xms:Z5QXZuJQw7JwfIL7polfrqHh8PdCaeHN01l12zhk8s4lq9Go8mC3AA>
 <xme:Z5QXZmKYImzvFPiQVz1CGLNQ62h0XpQSTh9594YXO1QZ5-t2MtQZ3f9LT8yemfuWe
 TuLTFMtgBoSug>
X-ME-Received: <xmr:Z5QXZutFW423wIuYhoIlRh6xoQz5u9E9y-hbC_KwptVeDdpGaQy-FIRrbNwOzJxsfmsPSAa3dhbNjNmoaB9CnP2LhqSbMY-34Ixs5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhr
 vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepfe
 ettefhtdehffdtffffjeegtdegvdekgeeuvddvteekgffhlefhteegveeuffejnecuffho
 mhgrihhnpehqvghmuhdrohhrghdpuddtqdhrtgdurdhsohdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghg
 sehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Z5QXZjZTNbR3UXVxCRAXHAJwCAurWnVcgK5EhTnR3Nd-WpbTNV2JZQ>
 <xmx:Z5QXZla2gml54AQ430VoyhtpLxhuaJieFyQmJYQz8m4ZAdJt3odpdw>
 <xmx:Z5QXZvCCp4jssUxTZPZbrsM2iYWoJ7pqnTqBHEr0cdqCZ3WkwYs0_g>
 <xmx:Z5QXZrbx0_axCbsc8mZ-U0QFEuUgtCqhgkyvwrIUyghMmMsCSBfqLg>
 <xmx:aJQXZpTL18BqCRoX4naEgc7e4aeDeCVVXQ8zFERm4LqQqrmA3GxxtGJ4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 03:42:31 -0400 (EDT)
Date: Thu, 11 Apr 2024 09:42:28 +0200
From: Greg KH <greg@kroah.com>
To: "guomengqi (A)" <guomengqi3@huawei.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, xuqiang36@huawei.com, zhangchangzhong@huawei.com
Subject: Re: [PATCH 4.19.y] drm/vkms: call drm_atomic_helper_shutdown before
 drm_dev_put()
Message-ID: <2024041121-tuition-undermine-26b6@gregkh>
References: <20240403094716.80313-1-guomengqi3@huawei.com>
 <2024040549-pushover-applied-4948@gregkh>
 <a29f435b-424e-4f9f-36cb-3faf22c4b0b3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a29f435b-424e-4f9f-36cb-3faf22c4b0b3@huawei.com>
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

On Tue, Apr 09, 2024 at 10:38:34AM +0800, guomengqi (A) wrote:
> 
> 在 2024/4/5 17:30, Greg KH 写道:
> > On Wed, Apr 03, 2024 at 05:47:16PM +0800, Guo Mengqi wrote:
> > > commit 73a82b22963d ("drm/atomic: Fix potential use-after-free
> > > in nonblocking commits") introduced drm_dev_get/put() to
> > > drm_atomic_helper_shutdown(). And this cause problem in vkms driver exit
> > > process.
> > > 
> > > vkms_exit()
> > >    drm_dev_put()
> > >      vkms_release()
> > >        drm_atomic_helper_shutdown()
> > >          drm_dev_get()
> > >          drm_dev_put()
> > >            vkms_release()    ------ null pointer access
> > > 
> > > Using 4.19 stable x86 image on qemu, below stacktrace can be triggered by
> > > load and unload vkms.ko.
> > > 
> > > root:~ # insmod vkms.ko
> > > [  142.135449] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > > [  142.138713] [drm] Driver supports precise vblank timestamp query.
> > > [  142.142390] [drm] Initialized vkms 1.0.0 20180514 for virtual device on minor 0
> > > root:~ # rmmod vkms.ko
> > > [  144.093710] BUG: unable to handle kernel NULL pointer dereference at 00000000000000a0
> > > [  144.097491] PGD 800000023624e067 P4D 800000023624e067 PUD 22ab59067 PMD 0
> > > [  144.100802] Oops: 0000 [#1] SMP PTI
> > > [  144.102502] CPU: 0 PID: 3615 Comm: rmmod Not tainted 4.19.310 #1
> > > [  144.104452] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> > > [  144.107238] RIP: 0010:device_del+0x34/0x3a0
> > > ...
> > > [  144.131323] Call Trace:
> > > [  144.131962]  ? __die+0x7d/0xc0
> > > [  144.132711]  ? no_context+0x152/0x3b0
> > > [  144.133605]  ? wake_up_q+0x70/0x70
> > > [  144.134436]  ? __do_page_fault+0x342/0x4b0
> > > [  144.135445]  ? __switch_to_asm+0x41/0x70
> > > [  144.136416]  ? __switch_to_asm+0x35/0x70
> > > [  144.137366]  ? page_fault+0x1e/0x30
> > > [  144.138214]  ? __drm_atomic_state_free+0x51/0x60
> > > [  144.139331]  ? device_del+0x34/0x3a0
> > > [  144.140197]  platform_device_del.part.14+0x19/0x70
> > > [  144.141348]  platform_device_unregister+0xe/0x20
> > > [  144.142458]  vkms_release+0x10/0x30 [vkms]
> > > [  144.143449]  __drm_atomic_helper_disable_all.constprop.31+0x13b/0x150
> > > [  144.144980]  drm_atomic_helper_shutdown+0x4b/0x90
> > > [  144.146102]  vkms_release+0x18/0x30 [vkms]
> > > [  144.147107]  vkms_exit+0x29/0x8ec [vkms]
> > > [  144.148053]  __x64_sys_delete_module+0x155/0x220
> > > [  144.149168]  do_syscall_64+0x43/0x100
> > > [  144.150056]  entry_SYSCALL_64_after_hwframe+0x5c/0xc1
> > > 
> > > It seems that the proper unload sequence is:
> > > 	drm_atomic_helper_shutdown();
> > > 	drm_dev_put();
> > > 
> > > Just put drm_atomic_helper_shutdown() before drm_dev_put()
> > > should solve the problem.
> > > 
> > > Note that vkms exit code is refactored by 53d77aaa3f76 ("drm/vkms: Use
> > > devm_drm_dev_alloc") in tags/v5.10-rc1.
> > > 
> > > So this bug only exists on 4.19 and 5.4.
> > Do we also need this for 5.4?  If so, can you send a version for that
> > tree with the correct Fixes: information, and I will be glad to queue
> > both of these up.
> 
> I sent a patch to 5.4.y too. Please check it at
> https://lore.kernel.org/all/20240409022647.1821-1-guomengqi3@huawei.com/T/#u

Both now queued up, thanks.

greg k-h
