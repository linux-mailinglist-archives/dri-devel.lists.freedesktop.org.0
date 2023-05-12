Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBC700507
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475110E666;
	Fri, 12 May 2023 10:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Fri, 12 May 2023 10:14:51 UTC
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBE10E666
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:14:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 35DA05803BB;
 Fri, 12 May 2023 06:04:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 12 May 2023 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1683885897; x=1683893097; bh=Sy9HnHCUR0wgx
 XvXSub8VPhHbi3glugACk+bWVmVgIc=; b=WhVQmtMRWmrKfxLLyfJfFe1tMkKp7
 g6eq0i3azbYbNCGWf+UMTGhcfp6yhbpptBIs4OqEAtA4vGLMFHBgeMZ94UwEy1/Q
 frKlmEBriuLTrWnQ2Zy4Tp/dXSYwpun1+4Yl9lHF77De6XwTJqxU0pcwSSrriFEw
 yGSrY7ACNFxiIciWY0lnexIltUq/sgF2oTYXOhWeqBkSnJZlOy0hvX+5SdfF5iP4
 lLpBuBDXP58/5HFV2w9nifKxszItYlsFk7aULlJfIJCUzOBdSps4bdVQDparXGg8
 HQRYSsVcF/3WNSaPigWgAJKd+HcUzPk3A8wtldh0Zv9fOY2cXUATQBdzw==
X-ME-Sender: <xms:Rw9eZN4u3iw-extBaYZWahWQIPn2TyHW_-Tr2mANrdjf7MvkMDA4Zw>
 <xme:Rw9eZK6EU7nC4b3LD3PHu-kTmrubf5DuKNExHZZD1mncoiuA0TMips9BZxL_yVjTb
 v4xRqLxBxsAJa__lQ4>
X-ME-Received: <xmr:Rw9eZEcqjB2aT9_uW8KK8InceO94NMww_1B_vB-QKARGge1inQuJyxOwqOjxo5WEY23XzEeXPb5je35qF9lx2nuV_yKH05nwAg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehtddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
 heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Rw9eZGI2AVN261Gh5tsyKTOl-BDY9RqG_dZkG6P7jvBKjRMncxs_eQ>
 <xmx:Rw9eZBL4-8ibaIgszFf3DoCpMiQxiYir7_v9MLCz_ETSUaNtIWk4QQ>
 <xmx:Rw9eZPxnp8EZedlf1COCSe4CgtYjyh2lxNRLIn1Hgaj6Fm0hhsA8gw>
 <xmx:SQ9eZJLRHRSCwZK28BFKNsWtPD-yftzvlsnR-XMW0AqnAUxKarRGRA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 06:04:54 -0400 (EDT)
Date: Fri, 12 May 2023 20:04:48 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
In-Reply-To: <e7bd021c-1a6b-6e47-143a-36ae2fd2fe6b@suse.de>
Message-ID: <7c2a6687-9c4e-efed-5e25-774b582e9a27@linux-m68k.org>
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn>
 <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
 <e7bd021c-1a6b-6e47-143a-36ae2fd2fe6b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org, kernel@xen0n.name,
 sam@ravnborg.org, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>,
 chenhuacai@kernel.org, javierm@redhat.com, Sui Jingfeng <15330273260@189.cn>,
 geert@linux-m68k.org, vgupta@kernel.org, linux-snps-arc@lists.infradead.org,
 arnd@arndb.de, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 May 2023, Thomas Zimmermann wrote:

> But I'd really like to see most of these drivers being moved into 
> staging and deleted soon afterwards. Users will complain about those 
> drivers that are really still required. Those might be worth to spend 
> effort on.
> 

That strategy is not going to find out what functionality is required. 
Instead it will find out which beneficiaries are capable of overcoming all 
of the hurdles to reverting deletion:

 - Find out how to report a regression correctly.
 - Gather all the necessary information.
 - Obtain buy-in from a sympathetic developer.
 - Build a patched kernel, test it and provide the results. (And possibly 
   repeat the same until neglected code becomes accepted.)
 - Wait for the relevant distro to release the relevant kernel update. 

Developers tend to overlook the burden of process because it's ostensibly 
done to raise code quality. But it seems to me that affected users are 
more likely to seek a workaround than undertake the process.

So deletion doesn't discover end-user requirements. What it does is 
advertise a vacancy for an unpaid adoptive maintainer, somehow presumed to 
be found amongst a very well remunerated and very small pool of talent.

The way I look at it, the maintainence of old code is the price of a 
so-called "right to repair". But there ain't no free lunch and if we want 
that right we should seek ways to reduce that price. For example, by 
making a larger talent pool more effective, by re-using more code and by 
improving the tooling and automation.

The code I'd delete first wouldn't be a small amount of old code in need 
of sponsorship. Or even the most buggy code. The first to go would be that 
code which will never find an actual end user because some portion of the 
code required to actually use certain platforms was never mainlined by the 
vendor -- and never will be without some push-back.
