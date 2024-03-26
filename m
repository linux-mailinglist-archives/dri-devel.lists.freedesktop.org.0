Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA488CF75
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF4910F2E2;
	Tue, 26 Mar 2024 20:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="WlOtjyaZ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="oTYV8adQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E746910F2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:56:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id C0777138014E;
 Tue, 26 Mar 2024 16:56:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 26 Mar 2024 16:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1711486577; x=1711572977; bh=bTK7qxB/Dz
 ZvcacQ3ARgA6AoDzT5XFaivWWd8YVHcDs=; b=WlOtjyaZiklsRi4cCh1jYIRpIM
 pLVHILPIPgQ/oogUIpqoqYnwK1W+6v8z0OA+zU38ovpQrKeC5G+uoNavTn26eOcw
 Rx9zFSqTneqsXKVF54y5rwO2vHU/viQNr11OsBlahezKkGRdxR1vhDu/HNpjHWZH
 Hw8/5n6K5X+u1wgp5XcZivytgK6eq1An+lKKX426vYBoEHRjKtJ2g5tzqxxS1pN5
 GnkBq5GRV0kmxf1/iX6DMkND5yOLsrsoGUtnkkew0BYhBhDf12kqBMhkcdMKdzRv
 1ZZvx0c+58bG33DpLg54XvIvoERfC3DtCU/rHLAyGy1/fVXzvUpuuDc60MwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1711486577; x=1711572977; bh=bTK7qxB/DzZvcacQ3ARgA6AoDzT5
 XFaivWWd8YVHcDs=; b=oTYV8adQxdjRh9Snl2cz1eHQHqctI5puzvhK2J/F+mJ8
 7tl0gvwKM0afyXZkz8C6MXAAifZckQygqw5ORc7w0qpS1TPlbO+w9G7jd3heTiCC
 r8I6RrrlNvFIk91tWPjbL747c8kuc3cUPm9wPnAItnHcvIkE5C+9ExKz8Ajn6gg4
 XtFClsZhAv7KlA2mcHHBjgSBHAdbPX7syjzicTpPVslBt7hIXn/nym+aa8280ApW
 IeFHW75gBBPdbNdhp32G4czj+aGTUaSrQiNUAlmapyxtBNnRSxScoAW/oimlmTKi
 uS/mrXXVeAnS/EwrWwW0shCoI/5h1CnBk3kKJ1UCxw==
X-ME-Sender: <xms:cDYDZnJ8rnTBWm06xK346QIC-QafLXL2gNmwIgqfmVnvDbkBSqHQWQ>
 <xme:cDYDZrKEJ0-53M2cA3w9Y_dAEKcjYEVn8bzx34Tifka9Xow_kVoe0xGHM4NN3qkKF
 gRRP3ldGGLjW5vpIVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cDYDZvvDg9wFUZ4OAUyKEggLe0cNB4rFNN936cbq-sR_6OTqjVXIrw>
 <xmx:cDYDZgZgdeDjBNgszo_zOpuYNlLc03uqLjysmZTeLwTAqDSTOmltzw>
 <xmx:cDYDZuYKC_wI7ro2wW0eBCrJnbpxAudYAU5P82Iecn1qctEWiMRPFw>
 <xmx:cDYDZkDkbD19cuKpTJQbi0S_atQZTcbT2a9iBKqGsY57IhQu9VXbdA>
 <xmx:cTYDZgYxthdidcJydzecKKASkiaYUTKEbJFDurjUEzrMsGAkjExe_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 658BDB6008D; Tue, 26 Mar 2024 16:56:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastmail.com>
In-Reply-To: <87jzlohhbc.fsf@intel.com>
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org> <87jzlohhbc.fsf@intel.com>
Date: Tue, 26 Mar 2024 21:55:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Harry Wentland" <harry.wentland@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Oded Gabbay" <ogabbay@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nicolas Schier" <nicolas@fjasle.eu>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
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

On Tue, Mar 26, 2024, at 21:24, Jani Nikula wrote:
> On Tue, 26 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> index 475e1e8c1d35..0786eb0da391 100644
>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -50,7 +50,7 @@
>>   * the macros available to do this only define GCC 8.
>>   */
>>  __diag_push();
>> -__diag_ignore(GCC, 8, "-Woverride-init",
>> +__diag_ignore_all("-Woverride-init",
>>  	      "logic to initialize all and then override some is OK");
>
> This is nice because it's more localized than the per-file
> disable. However, we tried to do this in i915, but this doesn't work for
> GCC versions < 8, and some defconfigs enabling -Werror forced us to
> revert. See commit 290d16104575 ("Revert "drm/i915: use localized
> __diag_ignore_all() instead of per file"").

It works now.

The original __diag_ignore_all() only did it for gcc-8 and above
because that was initially needed to suppress warnings that
got added in that version, but this was always a mistake.

689b097a06ba ("compiler-gcc: Suppress -Wmissing-prototypes
warning for all supported GCC") made it work correctly.

     Arnd
