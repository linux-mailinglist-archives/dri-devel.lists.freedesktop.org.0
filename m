Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395CCBA6267
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 20:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561E10E03F;
	Sat, 27 Sep 2025 18:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="fRwqZq3J";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kkcfw90Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Sat, 27 Sep 2025 18:16:08 UTC
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BBE10E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 18:16:08 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id E4EAC1D00075;
 Sat, 27 Sep 2025 14:09:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Sat, 27 Sep 2025 14:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1758996548; x=1759082948; bh=zVmWk//tS0
 x4EgJXBIHJsb8UJmMAL/AYdKjLj2iNX3Y=; b=fRwqZq3JMaJaKVGmbJpZpk2s4s
 rBQcnZxRPOUfzP7x3gZdq4DfjDCRXPY0qKv0EfbJmD/HkwfZc0FSNNlKpNqocgqp
 QRDTJ4Kx33lHJa9nSETWW7QcvQwbk+Ah4UdEp3yIOAOm382TlU/CKw3Pa6lWOTYZ
 SFRXuJBAsxBNdvY7t7cnEZAlPVN1AKHdwuyyhWNOqUdTQhLKrxJtbCHHwW5CsK/s
 YynsKmVELO94F8UeeGsdd33DicKVFAP8dN5Ca3YFRKZoR6MuC0Fe7lONWdeDo7X+
 JBvWoCeV31+BtxsvAwlpsQ0NqFD/3AUsjXpcsNTVmpuNASy84q/WZPbBVePw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1758996548; x=1759082948; bh=zVmWk//tS0x4EgJXBIHJsb8UJmMAL/AYdKj
 Lj2iNX3Y=; b=Kkcfw90ZtI7lzH8Vdsm0sKYNtDzG/0yvJ789mQW+H3CmspNSONV
 Kpspa7OY9GGZqDQxX7+XNNFCLECbQUkOiUQGRg7YF+1lcWITZyqToQiG2onpBzZu
 BiZqOeqqwwbYP993DFfR2pG0cb6hDIbFmH47mE6mgwGY+bs71p64Js+oyti1kSLX
 sSDJ0dV4ajfnjayyTwDvBgSQBa98ZQla8f/IrEHtn4sb7fv4pKzreDzDhpkVTI/f
 rhYLPT84LAAC8SkdjqDgQLpM9pzgFnCsrSJ+yCuR39yI9bkIWyE//+7YCS2APAPh
 eaaeRqGp+RvRYvXfnZn03/5axDTO9fMYpCA==
X-ME-Sender: <xms:QyjYaAlrfQXdagDoRqmbxAzmzqU4P3riJEV1RDmb7cpPZ3k94YD57A>
 <xme:QyjYaPsnv5_3qKUMLnl-JRnsFQrShKa8AczlTuJi5tEoTafMgZMmdu2jjIkrDQ-0n
 8I0dnwhqa6MfU8RJc8VPsFRIh_EiSeJ6RCQ1AHbGqil8IFy_Q>
X-ME-Received: <xmr:QyjYaL-Oi57zYKtC79Y8zD6laaT8hyFhNeeX0h671P8xW-tK4fp4v4kmIk5jjf4kcV3znh5Znvc3R_iPaburSjjvW42puvqMWv72Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejvdelfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
 uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeefveeiffegue
 ffieekjedvgeethfduvdejlefgveettdfggeeigeelfeduleejkeenucffohhmrghinhep
 sghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepvdeg
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrkhhushdrvghlfhhrihhngh
 esfigvsgdruggvpdhrtghpthhtohepmhgrkhgvvdegsehishgtrghsrdgrtgdrtghnpdhr
 tghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdho
 rhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhope
 hjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopehmphgvrhhtthhu
 nhgvnhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
 gthhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:QyjYaIwYcAUgWXxw0QXtK-RbYwg-6YGeZI9qxodf05YooZ3V_aCkEw>
 <xmx:QyjYaL8QYEbKm-RK3sagUTpjecWo8FvFKF3aFMF4y5YaHggo_VuUiQ>
 <xmx:QyjYaFIB4aoj4SDHvMT7ZKv9R0wF0Nljkih8Wjuq5CXYG5m7JtafxA>
 <xmx:QyjYaI_35Vpyyuvpkn_5YhpNS10loeNFQzZruQv_IlDIXfXPIx8DCA>
 <xmx:RCjYaOETspx8324KALNbKAAnzQjoEh_CudC3xH99yqPuXpOqP6WhSppe>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Sep 2025 14:09:07 -0400 (EDT)
Date: Sat, 27 Sep 2025 20:09:05 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: make24@iscas.ac.cn, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] drm/tegra: dc: fix reference leak in tegra_dc_couple()
Message-ID: <2025092700-timing-devourer-238c@gregkh>
References: <20250927094741.9257-1-make24@iscas.ac.cn>
 <f0b0a007-599b-428b-bea6-5eafc567d757@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0b0a007-599b-428b-bea6-5eafc567d757@web.de>
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

On Sat, Sep 27, 2025 at 02:43:17PM +0200, Markus Elfring wrote:
> > driver_find_device() calls get_device() to increment the reference
> > count once a matching device is found, but there is no put_device() to
> > balance the reference count. To avoid reference count leakage, add
> > put_device() to decrease the reference count.
> 
> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L1180


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
