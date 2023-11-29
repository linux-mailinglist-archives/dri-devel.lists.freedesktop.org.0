Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA797FD644
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E210E53B;
	Wed, 29 Nov 2023 12:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EFC10E524
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:05:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id ADFED5C0223;
 Wed, 29 Nov 2023 07:05:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 29 Nov 2023 07:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701259515; x=1701345915; bh=Pv
 cUH33d0gLc51JeoA7fOxMUp/Mfh6H9s/2UCQT+vek=; b=0LkbOJJi1KXwmteb6H
 qTKV4wDTe7YVU2eICv9YHk0rJsu60qKVBLLAYqWz8LeagAfgwkIoey3QTItdkfPx
 S1HFXI1SJ6lBJQulHi8yX4mAtC/htL3eKBRVqMQ1sAQpIOaxPv7bpJz9LUPmgn1E
 JOzG0Q1tn+HfILaExsV9gthZKFg7E23Tj/v1k90FWtn5EBRnYJJUQN3+nSgjaD06
 YL8IzSSm8xuoALb/Ue872Rg6J9xZGIOIDmkbIp2Tav06R6QLE0eg8XvIrTJsncOQ
 zJEMra2/az5Wer1/B6jeEXP6KRl+6LAKPg1LjCnhXUuuPVV1FMTM0/VdnQY2oQVE
 BORw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701259515; x=1701345915; bh=PvcUH33d0gLc5
 1JeoA7fOxMUp/Mfh6H9s/2UCQT+vek=; b=AkoDqvKVxZKamkj2By6cdapyVPI+z
 7UBfQRi31fAG02HdE2vVusuUXR0DvdSrgXTM5o4dVWEjTw7gAwsi7Mp3iipEpT7P
 nKglaqvYTKlGAhLbv+KVDpDf1YX5R2hGNYPhssYcH/JEN5T4QqFLWyvnBZnEp6Fn
 b1erpc01Bc2ag0AT+blnH/qDdOZoXaAkEHPASaLCadJlXrkAZj1ql3SSss+4zdwU
 YfFseC10MqUlubVWdbg9gxgjxsbtS0Qy7gnHueWN3R+CNWwP1sJXgGm5YFf7dozH
 ChMNDVVOnxlkw4zqfZHI7P56sIUIqkwkuzsuqBtc72Ehyzk3ncj7QE8/g==
X-ME-Sender: <xms:-yhnZWK1TYY7TDlV-PPNjgMWAO4x67BNPlM2UF2cWLuanrBrm_Xl9w>
 <xme:-yhnZeJiWnrodS9vhVU7ffUGphr-8CP-QeAehfq19rZ95wTw6EuFG-mzCMS2QXiK4
 VyuIRlDGTvJq-T_FL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-yhnZWt-C2mfbhvSwkv2I8oNx9GBah1RXpNVglfWANwTsjtc8kseng>
 <xmx:-yhnZbZhAKfLz-MoDpVEuGG22AX8vBb2JNIUziyj7LpU2mWDK9J5eA>
 <xmx:-yhnZdbi_pZ2wNdb7TFUZSb3o20SX-ktRYx0aXjee_i3zh4eRhTG4A>
 <xmx:-yhnZflbaQt3xGUtNZv2HbEZl7jId55Cn_Yf7LZxBpUA1Koc5kvZVQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EBABAB60089; Wed, 29 Nov 2023 07:05:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <d4d42b22-076b-4980-aa43-d5458a094873@app.fastmail.com>
In-Reply-To: <9df9e4f87727399928c068dbbf614c9895ae15f9.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
 <20231129113825.2961913-2-arnd@kernel.org>
 <9df9e4f87727399928c068dbbf614c9895ae15f9.camel@imgtec.com>
Date: Wed, 29 Nov 2023 13:04:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Donald Robson" <Donald.Robson@imgtec.com>,
 "Frank Binns" <Frank.Binns@imgtec.com>,
 "Matt Coster" <Matt.Coster@imgtec.com>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 2/2] drm/imagination: avoid -Woverflow warning
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023, at 13:01, Donald Robson wrote:
> Hello Arnd,
>
> Thanks for the patch.  I'm slightly concerned that we've not seen this 
> warning when
> building here.  I guess we need to check our CI settings...
>
> Reviewed-by: Donald Robson <donald.robson@imgtec.com>

This was previously enabled only when building with either
"make W=1" or "make C=1", but not the default build, which
explains why it only showed up after the merge into linux-next
that has the corresponding scripts/Makefile.extrawarn change.

It would still be a good idea to add the extra compiler (W=1)
and sparse (C=1) warnings in your CI system and address all
other issues that might uncover.

      Arnd
