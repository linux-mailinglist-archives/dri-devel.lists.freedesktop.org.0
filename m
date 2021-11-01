Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6C4412F5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 06:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752D089D4B;
	Mon,  1 Nov 2021 05:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35889D4B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 05:20:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 70CEB5C013F;
 Mon,  1 Nov 2021 01:20:30 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
 by compute3.internal (MEProxy); Mon, 01 Nov 2021 01:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noisetron.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=Cta8O/qKICChITcjz8wR0k2qYSPl
 nbplkKbySQf5i8c=; b=TSRKT0XJVzSLPorgQ3yTSykKfpSaB7mw7EEY1mz51K8L
 cvvy0CgIB7ioY9vVGiBFCGa8dkB7yOWU7eQqrfH/uxRjVg3JXEu8FPKPf2BBDDyS
 1tIwqLGmP6vqxkXrEPBh65MKnnV23/lyKmzA/mp0FdVmCBJK67ERsaCg5cjyJLHG
 A4171tD6BS9c3PRZ4ZxxEX2v8Gzj/cmNwgeVoEGHCL9kCuU5t9j4EG+8LTzW9019
 gu6gHpS9DGOm0ttd4l9JwIepOWTpIuQxYQzkiqhNv/e5Ip1/E9p6ZAaom9VJ6xWj
 +KlCfMZ/NjuiiCpWrEH2Y+pBBYS1NEzedhrSCnaLcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Cta8O/
 qKICChITcjz8wR0k2qYSPlnbplkKbySQf5i8c=; b=boMdXKbiakRGilOZx4s+tv
 dOywEZ5awHsuADJF9tG9LOx4JpLVZUWGJ3uL2Lb2j/Q/NUa6uqQ9dKyXmYK0jk6V
 kE+zOiNANMUeGca60hDwVcGFusehJXtr7JXhHdf28thkrtpjKy9GqyX13QMVQ52B
 XwXJ/qpffzMU7CGlb+79e++jJVcia0q+oumJWuuE7YNRuNeQ37CQvgubiCMjk/Wz
 LtngAiuDDDlAY5DFEsbq/PbI4d+HFKQG0upJu/agvpxNo2Z3DN6Knwv1S8+OzSGz
 fQG0VLJNLHAWlrsQG55voYfd4yB2xrQ70eEXomSqYbY9habEb9Dnm5pNuNfCwFCQ
 ==
X-ME-Sender: <xms:HXl_Ybm1aALqmqFdx3irmOETDix6aghI2YVi0pkMFi0G4jPBgdzf5g>
 <xme:HXl_Ye2xW1a7e5j8RhZ7MB-k5SzGIfawTePS4cXctpfEyHu3389qH5YIVE92HaQXf
 Lt9NYA5AUFMKTzi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehuddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdeuvghr
 thcuufgthhhivghtthgvtggrthhtvgdfuceosggvrhhtsehnohhishgvthhrohhnrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeefteffhedtueevjeelveffueeugffghfegieegkefh
 teeluefgudeljeefhfelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsvghrthesnhhoihhsvghtrhhonhdrtghomh
X-ME-Proxy: <xmx:Hnl_YRoIwqq5Jw4p0yHmq2zylQq52Wz0YYuQoYsaCaxXQVArA6juJw>
 <xmx:Hnl_YTk7wFAArLr80SevcfYdEDoGnOCx-PPze2Houb-wN6qm0waz0g>
 <xmx:Hnl_YZ0x3lk8gDO7qqc2srUFC-p-f7SgAtJIDLOuiQT5eNlAHMFymw>
 <xmx:Hnl_YSwqWsKv5T07SQzpBD-26CHhwK2z7AH5i8gMVfeSJ4p9IimPgw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F091B24A0077; Mon,  1 Nov 2021 01:20:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <a1140d60-77a0-4312-acae-9e9da2239b0d@www.fastmail.com>
In-Reply-To: <YXwUTPBPlgwj5NdA@donbot>
References: <e9e2bbf8-daa3-48f0-b875-f7487b64d57c@www.fastmail.com>
 <YXwUTPBPlgwj5NdA@donbot>
Date: Sun, 31 Oct 2021 22:20:09 -0700
From: "Bert Schiettecatte" <bert@noisetron.com>
To: "John Keeping" <john@metanate.com>, "Rob Herring" <robh@kernel.org>,
 "Tomeu Vizoso" <tomeu.vizoso@collabora.com>,
 "Steven Price" <steven.price@arm.com>,
 "Alyssa Rosenzweig" <alyssa.rosenzweig@collabora.com>
Subject: Re: dri/drm/kms question with regards to minor faults
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John 

> Coincidentally, I've been looking at Panfrost on RK3288 this week as
> well!  I'm testing it with a project that has been using the binary blob
> driver for several years and unfortunately Panfrost seems to use ~15%
> more CPU.
> Like you, I see a huge number of minor faults (~500/second compared with
> ~3/second on libmali).  It seems that Panfrost is mmap'ing and
> munmap'ing buffers on every frame which doesn't happen when the same
> application is using the binary driver.

Thanks for confirming you are seeing the same issue. 

> Panfrost experts, is there a missed opportunity for optimisation here?
> Or is there something applications should be doing differently to avoid
> repeatedly mapping & unmapping the same buffers?

Panfrost team - any update on this? 

Thanks
Bert
