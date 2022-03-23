Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB54E4B50
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 04:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850C10E578;
	Wed, 23 Mar 2022 03:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409D10E578
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:14:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DF5B9580259;
 Tue, 22 Mar 2022 23:14:43 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute1.internal (MEProxy); Tue, 22 Mar 2022 23:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=L0SvsihPk0D6/q
 9wCsLi7ZzaZZ1wSYEuefF72MQXOXg=; b=PzEyKpMYj6Pf1xaYL4WZi9/YHBolcN
 DmW6NTOixVYflJ6WoBxgBksMGQxi56btWsGQ+DPWW0PlmsTb8FEkFUokuV1dv7zb
 9qBApPrPkm0HpvWcBV4oBC6iLiZQqXn9ktNs1yZ6Efd4CgO1g3ndFxYDktUhBk6a
 c2IcQjO56Fb50VE04t1lwjxWYhN9N5rAFZuSTy/FlhBShf/AWuU//7QL5jj0p/so
 mLiA+6bbNL9y1BBfuc0nQ469oBZ0L6pho4kOmUugSR3H3PJZMHbs2aSd4lC7u4PB
 BpVnSpvK7PVt2R842XlVYePAkVEcwGei3WGG0MYnKNtyYKZlX50+Cw2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=L0SvsihPk0D6/q9wCsLi7ZzaZZ1wSYEuefF72MQXO
 Xg=; b=QJczCdVtsEOknGpSj6yCcMEeWP/9teRXgWQsyKc1JoI2hlSP5FprJ+6AZ
 wa2za9+Has9VuNsOfSAXfpLSmtDA+GKGMylVhjszUeOjrfXmHyErH9BK4i4cZdH+
 SMpGvEYGpgSY7UUibE5Aj5eZP7LQ2niJbC7i/OpDxKmihAmN9SqWkoz2tw4NUgpT
 tHYDIk2lyUK+lD3qFtUO0tuRZmyk3L0KR3neZeHbi2WoFSlBbmFwrKiTV3Uz/dUU
 8srcxAwMIQwS7hIgbfstcgWJu4ye5iQbT15VdeX7OOHiQfAITNqvy5r8vXpt7ZIV
 gffBnpeh3kpAlq/sIq7VoAgDGc2HA==
X-ME-Sender: <xms:opA6YpO4FgQrvrHNvrGpXqku3T9ZOdZHfy-2Rfb-CHsga8KtpPM7kw>
 <xme:opA6Yr_E-hD3jbkPL1wgv-qHirnaTelKCeW9YckgJihkz1EkOlXewufHmcDHYgeCQ
 xfFwcOHJT0-xMoQlYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnheptedtjedvvddthffgheeujedttddtgfektdeghfeltdek
 leefhffhleelvdejkeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:opA6YoS3_YBWTt5X0iX_aG5fBypQ5oPHEdL8yJiQZx9-M-UAR2X2Ng>
 <xmx:opA6Ylsne8mRYIXj25nFHOo6HHtbShdOkYPlXBVobu5vd4DsCWRTCg>
 <xmx:opA6YhdI89yNjP2eLi9NI6vcPwUJ068I0ZiHo9r3SlTA1sPj8B6hzA>
 <xmx:o5A6YqurSieiMc5LkoIhPHd6PuJfOgHZe_f7oj7OH4L0OpXfMrQW4w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8646DFA0AA7; Tue, 22 Mar 2022 23:14:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <8d474c46-c354-4dec-920d-dbbc67377690@www.fastmail.com>
In-Reply-To: <e0d3648e-3055-9f9b-878d-0fc22a93a806@189.cn>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
 <87d4f869-2ae8-f8d3-a55f-1a563cb21115@flygoat.com>
 <e0d3648e-3055-9f9b-878d-0fc22a93a806@189.cn>
Date: Wed, 23 Mar 2022 03:14:23 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Sui Jingfeng" <15330273260@189.cn>, "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Roland Scheidegger" <sroland@vmware.com>, "Zack Rusin" <zackr@vmware.com>,
 "Christian Gmeiner" <christian.gmeiner@gmail.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dan Carpenter" <dan.carpenter@oracle.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Andrey Zhizhikin" <andrey.zhizhikin@leica-geosystems.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Ilia Mirkin" <imirkin@alum.mit.edu>, "Qing Zhang" <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, liyi@loongson.cn,
 Huacai Chen <chenhuacai@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



=E5=9C=A82022=E5=B9=B43=E6=9C=8823=E6=97=A5=E4=B8=89=E6=9C=88 =E4=B8=8A=E5=
=8D=883:07=EF=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> On 2022/3/23 10:29, Jiaxun Yang wrote:
>>
>>
>> =E5=9C=A8 2022/3/23 1:53, Sui Jingfeng =E5=86=99=E9=81=93:
>>> Hi, Jiaxun
>>>
>>> Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
>>> How does the kernel get the dtb is another big issue, either from=20
>>> built-in
>>> dtb or pass from the firmware(pmon and uefi etc). This should be
>>> solved with another patch carefully. Providing board specific dts
>>> helps to code review, it helps reviewers understand that there are
>>> variant boards and have to be express with different OF graph.
>> Hi,
>>
>> I insist my taste on those code. If the only intention is to demonstr=
ate
>> the usage of the driver then please just leave them in dt document
>> or commit message.
>>
>>>
>>> Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
>>> Suppose loongson have 1000+ different board, do you want built all
>>> of them into vmlinuz?
>> Note that we are supporting all those boards on "platform" bias. Which
>> means if they share similar design then they will use the same DTS.
>> If we have a new design then unfortunately our kernel binary must gro=
w.
>>
>> For those who intended to build a size-optimized kernel they will be
>> able to disable unused DTS in Kconfig.
>>
>> If you want to blame somebody for the problem then please don't
>> blame us. We tried very hard to fit all those stuff into kernel's mod=
el
>> of devices. You should blame those who did the initial design of
>> Loongson's boot interface that failed to introduce a proper way
>> to describe the platform.
>>
>>>
>>> Besides, ls7a1000 and ls2k1000 lack a i2c driver, gpio driver,
>>> pwm driver, clk driver, can you pay more attention to salve those
>>> problems, please ?
>> Are you trying to make a TODO list for your colleague :-)
>>
>> We , community developers, don't owe you anything. So please
>> don't expect anything from us. I lost access to most Loongson
>> devices since I'm currently study abroad, but I'm determined to
>> keep platform code in a good shape. That's my duty as a maintainer.
>>
>> Thanks.
>> - Jiaxun
>
> Providing a few board specific dts doesn't hurt anybody.

There are a lot of things that don't hurt anybody but we shouldn't do.

The standard of reviewing the code is not "doesn't hurt anybody". It's "=
do the right thing".

Please reference:
https://www.kernel.org/doc/html/latest/process/6.Followthrough.html

>
> Can we leave the problem(passing correct dts to the kernel) untouched =
and
>
> solve it in the feature with a another patch, ok?

Then please drop platform DTS part.

I must NAK this part, sorry.

Thanks
--=20
- Jiaxun
