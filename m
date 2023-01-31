Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4D6824D9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 07:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F0D10E089;
	Tue, 31 Jan 2023 06:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Tue, 31 Jan 2023 06:50:53 UTC
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD510E089;
 Tue, 31 Jan 2023 06:50:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 0BA642B06E73;
 Tue, 31 Jan 2023 01:41:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 31 Jan 2023 01:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1675147281; x=1675154481; bh=E2p6V4zwNY
 VUZOciwM5akvaSzGFZounIOOlrcnF3u0Q=; b=QHe7btkFnAqF1vdLr2jl/yePBk
 BE/quHdWIzAM1xZZmWybN9UxhKl2/CE2DCzQpZWP4gX0I1Ojp5S2U/WBdQl57tBU
 YZlH2gvyTk6fhHe1hQA3xeuo8WwPE7o1YPylz1MJs1RH4RIv7zRu1RWbsnz9cXez
 KdWcm6MS4CPXtGAHacIATT7t+gTfFPaTrUa6QshTl/6//Qp2ICup4Vdi4vUYFW9F
 tsx/LQ57CQCmNpC5KRKmLdgheukqtR/b8aPp98DBhqlX8ekYi1qxFNT+XOg7zF4b
 0YeFPs7BYQiw119xSNZckZpaGmAoykQj2HechPuuPsj7ODlsCF44cpdxdFmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675147281; x=1675154481; bh=E2p6V4zwNYVUZOciwM5akvaSzGFZ
 ounIOOlrcnF3u0Q=; b=pEuJZTZhlBr361KK4tZ0Ya5gjnPy1pRYM2WlX/SlzDCJ
 mnr6Hx4u27i6sZL/+p7AoYl33eiouSyUlbmqY2s8pIlA0NaszWmws0vLVxGIawIW
 D9Eq5kacPDBf0QVz89TuJ+RNaVHvsAuqtXvjVs423Ys9eY7xo2thryKhTEwiRxO6
 O9+3yhNN846ZZHx90dstOuBiVq2viG1ecsHstWvOgPTSFc8cNRZzeH0SV16PSNXs
 OsuEabPQ4CMHg405gKE52cOBuSKjeQyAOOgpD0XQKb18vUhtFsuII94n8X5d8EjW
 NhpcHM6kx7bB1Mc2T3qyvi0l87LD5cmTLWzy5lv2iA==
X-ME-Sender: <xms:ELjYY5Ijs9u7o3_9vYZCcLlISiw2kZOGsZDUM2AGbGjAYKDKYlVN-Q>
 <xme:ELjYY1JtySviRcmaj1wbcc5PKdrrfXOY1QQkJnq5NVT9SJgKHM1vzyJLLlNHC55Bl
 SVonQwcnN4ULg>
X-ME-Received: <xmr:ELjYYxuQ83d4Cz1fCMEuIB85tz0KPOX0gXjKk2O0BRTL2f7ZQQpweTagmZjsgUrf7VKtvbXgoeXcdp3lt8iytDFhTTPlMPowQ3rTjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeffedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:ELjYY6YJ9G30PqObYIjkcCW6Qo-llOPF_QOYcMebmCzMmD_fu9V38w>
 <xmx:ELjYYwYE3yY2aHrw6gkFkuiDkzw3pogU7x7WWGCb0Wb6zQ3qUfVSiw>
 <xmx:ELjYY-C2AFX3xXmsmD5R6uH6hNgxAyv19GUl0Dg_cNq_zw9WYEAesw>
 <xmx:EbjYYyYcP_nJ31akDANKagefjYrG-7IrHOaBb5N4POUM4D_JRU26xxlSuKE>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 01:41:20 -0500 (EST)
Date: Tue, 31 Jan 2023 07:41:17 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the
 drm-intel-fixes tree
Message-ID: <Y9i4Ddcz7PsAu8zZ@kroah.com>
References: <20230131130305.019029ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131130305.019029ff@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c
> 
> between commit:
> 
>   5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
> 
> from the drm-intel-fixes tree and commit:
> 
>   4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
> 
> from the usb tree.
> 
> I fixed it up (the former removed the code changed by the latter) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks for the merge resolution.

greg k-h
