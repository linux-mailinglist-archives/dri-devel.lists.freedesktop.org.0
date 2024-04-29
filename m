Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5658B5FEA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883810F759;
	Mon, 29 Apr 2024 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="kP4I71W4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="foUbY+h1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DED10F759
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 17:17:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id 1F6DB18000AC;
 Mon, 29 Apr 2024 13:17:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 29 Apr 2024 13:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1714411063; x=1714497463; bh=xekhz3+nyZ
 m8Ea8jq2BOw2Y9kIUDt9YpLlTFfRvHFOE=; b=kP4I71W4xDoQDx+BkSQ7yea4f4
 hfvD72bRwVQrY3vX0+/EyVSSPv3PEXNxCceFghMU9Z0jQ87MY04AqgO9emTp6wpD
 rgHB1lAVNNquGzL+j1n+BaEmoJuVdojvyX088SAGGkOIEvfk65WWwXIRcPcC9tS+
 hCepCeNjgvePBEhhNeih/bPG1mmtLjpqvHGRFFgqX1oPiZ3FihR/TXT2n/MSxodU
 rFxYXtvu6VKyORHUd62WDMM2uE8yHNlJBkJYSrvWRg/FMBTx1LONi3/FanWJx7G4
 nsX0A516+1NExfE3suXN6YN2bamHkng3cZ4FNTot1gFsOt24KvaQTVOgoIyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1714411063; x=1714497463; bh=xekhz3+nyZm8Ea8jq2BOw2Y9kIUD
 t9YpLlTFfRvHFOE=; b=foUbY+h1Kw+2NJhyj+bbbpjLzOVliM2psSbkGJSnPVxZ
 eDVqOM8bvNui2udA8VZYNCEUhTLX7Ag96mwjAgzc1MkLxsb76D7d31SgR7+FWpeB
 blC1oHfCwH/xDvszqvU6saKH0dn22GcE/utLcbbr1OpSOyVJYDfmP1hsNvVL4WTi
 9yTabR3cc7NNezoflDqOta5ncWNSaMRb+Z1xGjKeNxdtb8Aerk9q59if7Yp//AIP
 2jU/Uiby0dRxSJp4WP9HvdKcLtMYSJYwzLoAGKva0zV5Bv63dwdT62ffb9VHEORp
 KhAKJwPIuHg+wEXCYppQAww9PXUxl4TRwRik8M/12g==
X-ME-Sender: <xms:N9YvZuQujlCHRkVFDk_Ko3pQg-gFWocstXL4Q4E_pdmKWyJacD3ThA>
 <xme:N9YvZjzr0ESm8KCFwN9Ng9l0D7QeErVoqBRUBzVL5U-aEShP6hfodq4XVbNcuprMK
 IRo9-lMcDiyHEDDLEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduuddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
 feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:N9YvZr1o_NrUNjHjlr3JIGPMz4BQRgqQ_ztoQg_WsF7foMfIuyyUGQ>
 <xmx:N9YvZqDSsbw-4gVUu7s70n6jXlXtCoQrtewarN4HQ0exaM6DD3c0uQ>
 <xmx:N9YvZngytkJyRGexyKWzG_aXcHP8FB3RCcJTZrpZOpEY9CYiNrrbxA>
 <xmx:N9YvZmrpcTBv2hLIRMe07DA8k1rBtMoyBoGWzT1KPz42DRZ4FjiXLw>
 <xmx:N9YvZsZSbss71b3R2D7NJiqPPmnCX5Q1ubWXFQwkNgSJ_9wXXEEbNdqn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 68916B600A0; Mon, 29 Apr 2024 13:17:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <91dacd68-fdbe-4cb4-92c0-e5d6bc777658@app.fastmail.com>
In-Reply-To: <8de32257786d3f062c479a8b10dcf17b775d563b.camel@nvidia.com>
References: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
 <c819df1c-4215-41bb-b24b-563a912d160f@leemhuis.info>
 <8de32257786d3f062c479a8b10dcf17b775d563b.camel@nvidia.com>
Date: Mon, 29 Apr 2024 19:17:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Timur Tabi" <ttabi@nvidia.com>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Anders Roxell" <anders.roxell@linaro.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Danilo Krummrich" <dakr@redhat.com>
Subject: Re: nouveau: r535.c:1266:3: error: label at end of compound statement
 default: with gcc-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 29, 2024, at 19:08, Timur Tabi wrote:
> On Mon, 2024-04-29 at 17:30 +0200, Linux regression tracking (Thorsten
> Leemhuis) wrote:
>> TWIMC, there is another report about this in this thread (sadly some of
>> its post did not make it to lore):
>> 
>> https://lore.kernel.org/all/162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com/
>> 
>> Ciao, Thorsten
>
> This doesn't fail on x86-64 when I build it.  I also did a cross-compile to
> arm64 with the arm64 defconfig, and it doesn't fail there either.
>
> I'm guessing this is a compiler version thing.  I'm using gcc 11.4.  Is that
> just too old?

It's too new: this is valid syntax in c23 and accepted by newer compilers
as an extension to gnu11, but older versions don't like it.

gcc-11 and clang-16 are fine, while gcc-10 and clang-15 as well as
earlier versions produce this warning.

      Arnd
