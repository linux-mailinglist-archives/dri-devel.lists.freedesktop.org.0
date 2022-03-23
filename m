Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3F4E5228
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F377710E6C0;
	Wed, 23 Mar 2022 12:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7E10E6C0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 12:29:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 849145801A3;
 Wed, 23 Mar 2022 08:29:33 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute1.internal (MEProxy); Wed, 23 Mar 2022 08:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=U/ewyp5y3Q5PVO
 u36vKaYrXTr8xm2PIaC+1xyM55hhw=; b=3s/P5v0SrlAsYc4jGnxlP2wGQwyM5P
 C/bx6Yr9RDoinqfZET2ecfTblc3g9ChOBwWx1MezRZWICJ6RFJ9qqA4x9BQfavst
 RpJTlEUHe+vX6CoVwfKPBc4UN3iy8S89xUddafHgfrK7zrkjthZAEzC/Rd9ceGU2
 bScHMtdsDgpOlePe4TCKOzehZVDsQg9Vk2Ma2M+Uq9q8lok4LClYzUJ9xE5zUVo0
 nmVaOdLTVIbKmMVg/5c976Ry0yT/sv3iJzh8Fh11SNNeTiXlAOJGuxKySAhJZJ4F
 9n6dJiSBhpQw3Cc7e21t9F40SxvUXANwCzBSBDSXSihBnTp8ChY+Za0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=U/ewyp5y3Q5PVOu36vKaYrXTr8xm2PIaC+1xyM55h
 hw=; b=I/flf/tYX0qs0esw7uam9MB+H2H2m56aCRHkq/2W6i6cpPaLWnYG47pzo
 RYHsnB6Uhlw6o7JggLeC2av3/2sKkvkmm/0XyztJkW5HratOgYStMKocduFSyxmy
 4BhBP5nj8yVsyvRDNAkHKFX/8i+kzJuiTCFLRM32wBI2+oKvqPWlfLN532xaTl3u
 IpFb69ixjB76hJ1VwyP/t8pwa71EgSyEQNB4avAfYYtThnvsbQgw75zG8EHBA3Ie
 rxd9Su1sAec6DH6FgvjVD2SpulzniN7RZlaK5gPhmYhtgqq3nIVUm3cIj+bWy5cS
 xSMtE4nG1XMLXxDqTh8qhB0WXrt1A==
X-ME-Sender: <xms:rBI7YnMFDEKEpWG0wFCS74gL-3fOJAS4rYtxxj7AZM4fMZDzvVN0Ng>
 <xme:rBI7Yh_A_fN_VkOhudxRj3GQCUtHaeXBO7o4RL_TigCEuVcYQmQOEVZwjvNQt-bhe
 vutDhqCOKk8gE7Ko2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegjedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnheptedtjedvvddthffgheeujedttddtgfektdeghfeltdek
 leefhffhleelvdejkeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:rBI7YmT_mtPvWJfSAR6aH4tH_gTCJlifICGgCDSu-EhFM3Qa-1Rjjw>
 <xmx:rBI7YrsBhsfW1GzZcQQLxNrRFV3Wt3bvUty6hF9CkIS7gugWEcM_fg>
 <xmx:rBI7YveCRFh9Ixt1JCwyCnUXY76XlyczIpTn5o-muqczIMVphxdCsA>
 <xmx:rRI7YotjiVzS8G-JGBwVyP57xQ2EHgi_6DhFrc8G6QZNyJQVd-A2Zg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0E500FA0AA6; Wed, 23 Mar 2022 08:29:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <01028879-99ee-41bd-9222-c2c2703fbf4b@www.fastmail.com>
In-Reply-To: <c9357494-6472-e0a0-50a8-e62df56dceb0@189.cn>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
 <87d4f869-2ae8-f8d3-a55f-1a563cb21115@flygoat.com>
 <c9357494-6472-e0a0-50a8-e62df56dceb0@189.cn>
Date: Wed, 23 Mar 2022 12:29:12 +0000
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
=8D=887:07=EF=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> On 2022/3/23 10:29, Jiaxun Yang wrote:
>> If you want to blame somebody for the problem then please don't
>> blame us. We tried very hard to fit all those stuff into kernel's mod=
el
>> of devices. You should blame those who did the initial design of
>> Loongson's boot interface that failed to introduce a proper way
>> to describe the platform.=20
>
> I am not blame anybody, please do not misleading.
Your language seems to be aggressive from my point of view.

> I am report problem and try to seek a better solution.
>
> I have my intention and ideas, i just don't want to solve
> all of the problems in one shot.
If so please just drop this part from the patch. I've repeated several t=
imes.

>
> I could provide one more patch wire all board specific dts up.
> But i don't know what's the opinions of other reviewers, does
> this is plausible?
Please carefully read section 6.1 about how should you work with reviewe=
rs.
https://www.kernel.org/doc/html/latest/process/6.Followthrough.html

Thanks.
--=20
- Jiaxun
