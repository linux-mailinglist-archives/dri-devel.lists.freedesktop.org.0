Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E77A751F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E50010E036;
	Wed, 20 Sep 2023 08:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8510E273
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:35:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CFB7D5C01A1;
 Tue, 19 Sep 2023 09:35:24 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Tue, 19 Sep 2023 09:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1695130524; x=
 1695216924; bh=bzYopflC5Ycg8A2mJPw24w/sj5t1CGgoOnaSWed8JPs=; b=G
 xkvsvm1Lv3PVPu/1d0UOhoBRpcl6vGaXwglXl7zL/K2X4XwXEcu26QIVR96ZqJ9D
 ve09wgF21jfWJmXoRdEVt4GRq+wP8NEDQhF+bnIBsehFnzxw1gDCoxOeXNfsEctx
 dsDNbVOkNYx93GJzeQJLRdOI1t5vszmAOJnXyILewQu/uD2AiEqSii94BQd4l97M
 bFlGX6j0M1nit11hzi2d52OMqb2LU7a+1HhvpyvwYmsfxwbkLpzqs7B6VtPFqNzn
 P+cM6CdSyPmT5RFV8aAuhSW0fZ3WZqfVQwqqEjYERFarlYudYxv6vyRj3Yvv477d
 0ZXUhUYSwKh+niWI9+Kow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1695130524; x=1695216924; bh=bzYopflC5Ycg8
 A2mJPw24w/sj5t1CGgoOnaSWed8JPs=; b=cJ40j89MtlxPv1P76qx03WptbAU0Y
 N1XDGCPeqOJ+a+vXaaujdtlx2+ahVGHk1BuhjHklocmR6jgySY+AtophrMYRUTaZ
 1l48dPYYaHWmH+0dKwI6+toRv1FwmMDchseSCaqqavhEAt14mrhsWoOpocM16XN0
 +yhL3h2SDsGVt4lZ496YIi6UcOKCeRg1PHd1F31zKPHbLO1Vc9XQel+QPZqvExZm
 EQwN00GMvYFHicAGxbYTNEU2Bz5nopZ44sPybpkcZQmk0rXPbkbEoJ9eQ9BtlAxq
 2GXV5V5yAE4roHzux5EVGepdzDWWZuKfmdNGvKdIAPy9wNvMrI54cAkAA==
X-ME-Sender: <xms:m6MJZeYPlnBDGfO9EiuXstpqZbWk8fH-neCoq2pQXg1LBVz7MVpoYQ>
 <xme:m6MJZRaFKyZX62E7ATL4RRdobt_AbADJtLsolBlpya6eHc1mrOtyPvhwZC3Z6gEel
 tFWq9FbO5p8htHy6oY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekuddgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
 vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
 grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
 ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:m6MJZY_GwRUhftXlMxJCw9Rv6bQwZ82is_lAZf-TKrplb4vS0jHQrA>
 <xmx:m6MJZQpxna4jNlTNejkmH80f-rv4cqSCu4syUY6nzphWXsb3uwRQ0Q>
 <xmx:m6MJZZrhE-qHyacNyyye8opYDn8qgylQyWjL5D1DjksUzl8hLjTzzg>
 <xmx:nKMJZSA0wjtME7UWU_7b4iBqgE-CqN8PVX8G9dgEPNlQhHa6DoT0wA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 93789A60077; Tue, 19 Sep 2023 09:35:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <c6dd2daf-f833-4c2f-9a67-640fb2c424fc@app.fastmail.com>
In-Reply-To: <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
Date: Tue, 19 Sep 2023 15:34:56 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Janne Grunau" <j@jannau.net>, 
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:01:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Mon, Sep 18, 2023, at 09:11, Thomas Zimmermann wrote:
> Hi
>
> Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
>> From: Janne Grunau <j@jannau.net>
>> 
>> Multiple power domains need to be handled explicitly in each driver. The
>> driver core can not handle it automatically since it is not aware of
>> power sequencing requirements the hardware might have. This is not a
>> problem for simpledrm since everything is expected to be powered on by
>> the bootloader. simpledrm has just ensure it remains powered on during
>> its lifetime.
>> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
>> systems. The HDMI output initialized by the bootloader requires keeping
>> the display controller and a DP phy power domain on.
>> 
>> Signed-off-by: Janne Grunau <j@jannau.net>
>
> As a simpledrm patch:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Do you want to wait for another review from  someone with 
> power-management expertise?

I can't claim to have a lot of genpd experience but we use very similar
code in a few other M1/M2 drivers that also require multiple power domains
to be up without any sequencing constraints. So for whatever it's worth:

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Best,


Sven
