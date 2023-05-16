Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA41704813
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F8910E231;
	Tue, 16 May 2023 08:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038010E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:45:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 522B65810AF;
 Tue, 16 May 2023 04:45:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 16 May 2023 04:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1684226708; x=1684233908; bh=u/
 Wz5MhNACKrizGF564GZclX7WtuKcDjHIIc2sgb46k=; b=LZwQORTPNRSuxtpmnd
 ncA/M0GDtg3dh7wxSU7uqTrOJWQ0JudOtVmLMg6+XYJJN7JkkhOaqWr9JMUJ1LYN
 qlsXhsVFZwKdFi7LcqNMpziHyx+mheLQlbmWNeBmG7grA0HCXVgHp5i5BFWTv7Zk
 c6MbjEN04eqMeNz2WPg04ABVYJiNbL2d4kHKuk9xBc/be9SRSFSG3sdJ2P+YmXuM
 sWJERm3eaXVLB70uKqLNxSMUjmQZH6ZZra9iVh2PASs3OS1MyTeDVJMwZ8sqRMtF
 jVJTgCxreoiAubEYMI1cLq2h2/KsLcGqMlxUJTbEv7GhFoqyI5CridlFzwyCyASg
 t9Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1684226708; x=1684233908; bh=u/Wz5MhNACKri
 zGF564GZclX7WtuKcDjHIIc2sgb46k=; b=dIM0d/rWDZRxe7l2yHA8Ys/6jAjJ1
 jzn5PVRh0UI3hEhDGSbYeitApDeupBmoKf8Z9yRSFCrmvoM7bvYQ3l15E7isPivU
 Cl+5R+XQQCgSYMG/DRxE/H01o6IhPDbLn9fEsKAlOzn2y4vEsgLxNVmB5WNNJZ9h
 93ORydUw+VR3p9D5ITaAuZuQ7rIwHhvawr06BPgUH40iOl0/7UbJYdV7H0cNSn6U
 sAliTsQlKy3hNA7w4PU7Rf87KgM8UDglyqB3tAmaTM+4RSnE+H/GmMrPd/buYSlM
 w4deceGtaJ8L0m5z3S2tBm5Z7Pt35x0TcDCS+QcRR/N8CCnn3GO4dySDQ==
X-ME-Sender: <xms:k0JjZHYINi_B2oYrUdT0aJgPICFzDz-f3r20UBg6F9qO6G1GhhxfXw>
 <xme:k0JjZGa6WQ40P-MeUsiDH97ab1HHMRq3UjfkwX3sF4ds5FYVgY4rFUEwYEt861uJ2
 WyKDPTJfKgrJkbVQkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehledgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:k0JjZJ9ZFPvUQMdXbAcgS7dLsrFIbc8_NFycwgYtMqV52neATnsIkA>
 <xmx:k0JjZNpupvUMEJJbur4eJj0b5lnHQ5_2TRz-gy8bZxP9efgBLd7hDw>
 <xmx:k0JjZCrTsJg_ZlDnOiKui63PzKX-TM63SjAnwzZ8wbPJHvFGGygA7w>
 <xmx:lEJjZKB3kWYt21PwpKFT5sM6_1Q5NhXKizj5u523ggsCHuQu0KNR9Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8FDBDB60086; Tue, 16 May 2023 04:45:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com>
In-Reply-To: <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
 <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
Date: Tue, 16 May 2023 10:44:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Sam Ravnborg" <sam@ravnborg.org>
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023, at 18:22, neil.armstrong@linaro.org wrote:
> On 15/05/2023 18:15, Krzysztof Kozlowski wrote:
>> On 15/05/2023 18:13, Krzysztof Kozlowski wrote:
>> 
>> Also one more argument maybe not relevant here but for other cases -
>> this makes literally impossible to include the clock ID in DTS in the
>> same kernel revision, because you must not merge driver branch to DTS
>> branch. SoC folks were complaining about this many times.
>
> Actually we handle this very simply by having such patches merged in a immutable
> branch merged in the clock and DT pull-requests, it worked perfectly so far
> and neither Stephen or Arnd complained about that.

It's usually benign if you just add a new clk at the end of the binding
header, as that doesn't touch the internal header file in the same
commit. I'm certainly happier about drivers that just use numbers from
a datasheet instead of having to come up with numbers to stick in a binding
because the hardware is entirely irregular, but there is usually no point
trying to complain about bad hardware to the driver authors -- I unsterstand
you are just trying to make things work.

I agree with Krzysztof that using the same identifiers in the local
header and in the binding is just making your life harder for no
reason, and if you are the only ones doing it this way, it would
help to change it. Maybe just add a namespace prefix to all the internal
macros so the next time you move one into the documented bindings you
can do it with the same immutable branch hack but not include the
driver changes in the dt branch.

    Arnd
