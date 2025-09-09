Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57BB50486
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31E10E32D;
	Tue,  9 Sep 2025 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="KYtdcP8Z";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="eCKr5yLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Tue, 09 Sep 2025 17:36:13 UTC
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883D710E32D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 17:36:13 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5541014000E3;
 Tue,  9 Sep 2025 13:30:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Tue, 09 Sep 2025 13:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1757439035;
 x=1757525435; bh=Ih3qOkfgfBQhRkZuY/TLEyz1Nw1R8Jc9+IaEIIeK0As=; b=
 KYtdcP8ZqCMEwS5bmaKNPZDVXoUhRZgDbmiosvMwQ5syChRv9b8ur28Qdye293IJ
 1ltpmB42pRgCxLU0JqAMNyXJfD70J2ijiT3hEF7t7/ScI6imSGFGxLgEBbl2DYPr
 8g9gVfcxS+SRg5MbiTdUhxRDqUTAbBOdDGqX1A4tjxfPJ52fwqrjyXro4xXeydYP
 BStSzfok27hyTYbZwgnAJX73EPZHEJtXxltfwvmIUI9aeHs3lpfa9rmyEHT0qpQj
 98DSEKDmXuOEGBldcuM+CIUMIUYN4/KijmEcJz2Y1/brCf550amyq0+nGbHcfCAd
 ALGCatwx7tUkH2CcdTgdQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757439035; x=
 1757525435; bh=Ih3qOkfgfBQhRkZuY/TLEyz1Nw1R8Jc9+IaEIIeK0As=; b=e
 CKr5yLm81Ko4Zc7JRmNU0AeFU5OmkrMreHyjPCbBHaazN9xlYp2V8E3J/8IqnRfV
 hFbxwud4ocm+NPb1p4CQX1i12xaor3O6r2YT/pOsbyt3bxgEII8fLVWnjpZI6DaH
 GWg+rDVg1gtrbR6UINXjKyiYCPrxs9L//H4SDU3zPQnZd0s/UXKvkanJfkS+btL9
 P3wZ+/jBvOxPkNSWBTKEQ0ctj3UTCQhLlY+wfmt4blbJALooUQYDsRV9YCnRmKUs
 o5Bjjm9ActkMaaOs5N2H0ntIa4TNXW1gnk55a/F5pDyE6T0a1HD7AuASovlidskY
 uPqTtSufIvMRs8a41f9pQ==
X-ME-Sender: <xms:OWTAaIqDvLHagsSzyc1Cuvt1Zh3DTa7U9LGsFP-PWQixuWpbzsr5iQ>
 <xme:OWTAaOoZoEK0oM5NVaUG41eM3hEnIAMHs7VLP5dsom0PWpyru-UtX8Y-aEcJi-a8_
 iXwKBQ27JUcOLgMdDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhueevudegudfgieffvddttedtieefveffgffhfeevhfdvheelhfehheejvdffgfen
 ucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
 phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtihestgeige
 drrhhulhgviidrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhr
 tghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopegurhhiqdguvghvvg
 hlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepuggrnhhi
 vghlrdhprghlmhgvrhesshhonhihrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrg
 hnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:OWTAaBSL4u1FOqaOb2nqoWfcJo7QXSrhV2pr6al99wC3vUDC5XR-gQ>
 <xmx:OWTAaCKm4W7FM-xRk7MTAz7IfevUUjqkC2iNw88xMY-XmDbwiLOEhQ>
 <xmx:OWTAaMZMfJO5l-LHRtHbVdzgn9SnHnfLskZLGZGj3XSuTltU9-Xf1g>
 <xmx:OWTAaE9wst4-dhsOis6aDJHvwOKSv-pf5mYmvUJBLIOURPFdkxOW1A>
 <xmx:O2TAaOCfInXzGuYyXNnWF27SNiZnaskTmET0XARpIm0zm2nTs6BamPFp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5ED2C700065; Tue,  9 Sep 2025 13:30:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2uCCbRi8x6B
Date: Tue, 09 Sep 2025 19:29:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>, 
 "Simona Vetter" <simona@ffwll.ch>, soci@c64.rulez.org
Cc: daniel.palmer@sony.com, dri-devel@lists.freedesktop.org
Message-Id: <fef5d665-e7c4-4801-93ee-176be10b1000@app.fastmail.com>
In-Reply-To: <20250909132047.152612-2-tzimmermann@suse.de>
References: <20250909132047.152612-1-tzimmermann@suse.de>
 <20250909132047.152612-2-tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] fbdev: Make drivers depend on FB_TILEBLITTING
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

On Tue, Sep 9, 2025, at 15:19, Thomas Zimmermann wrote:
> The option CONFIG_FB_TILEBLITTING is controlled by the user. Selecting
> it from drivers can lead to cyclic dependencies within the config. In
> fbcon, there's special handling for tile blitting, which currently
> cannot be disabled without first disabling the relevant fbdev drivers.
> Fix the Kconfig dependency to make it work.
>
> Some guidelines for using select can be found in the kernel docs at [1].
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: 
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/kbuild/kconfig-language.rst#L147 

I did the opposite patch to hide FB_TILEBLITTING from the user
a while ago but never sent that.  I still think that is the
better approach, matching what you did with FB_MODE_HELPERS in
patch 2.

Is there any reason I missed why enabling FB_TILEBLITTING is
useful if you don't use one of the four drivers that require it?

      Arnd
