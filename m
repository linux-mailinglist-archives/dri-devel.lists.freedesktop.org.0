Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD9917BFC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E66E10E7E8;
	Wed, 26 Jun 2024 09:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="iUYE8TQE";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TMI/WBn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BCA10E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:11:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id C2DE811401A5;
 Wed, 26 Jun 2024 05:11:16 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Wed, 26 Jun 2024 05:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1719393076; x=
 1719479476; bh=1XgaL0ZJjZT740Vm65mI9H/lF8S7J1Gz9fJ+DAnK54M=; b=i
 UYE8TQE5etrwl1wQxvS6nkf76603/PVQ2aXBHyhSpyArSRRI/xLLdGD25gbLEErS
 Bp7m4M4RO8D8dSRh0BUgmCdoceU7ysTIquuZYYVXcnzSZKEAdi1UmD+J+3z7QqRi
 01+qLqmTRj6dUAyxyYxoQ19UL/uY3dlA/RPJZP2kR9nnCfEso2igyWiEYKyb5eiU
 AERa7+cAk7ZXLD9NVaIz2SUnS+vehtSbmZi4TTG+w3CiFGM7Vd6rNWTbLQ/S1AFm
 0MMyNZJk6rqyY6EtGCGN6lHMf70iMzavI75Stgaig7FxW7jKjZQJX1206EGOjle3
 WaRaETVZvIIPj5X3LXT7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719393076; x=1719479476; bh=1XgaL0ZJjZT740Vm65mI9H/lF8S7
 J1Gz9fJ+DAnK54M=; b=TMI/WBn7XtwV9EoqGrq5pdd3N00Fbk41ufBsSDqGaWoC
 bpuePGYcQvFENfqdh8LqpmLHj4EZUP5l90OlUnfYV0e7laV5uWmHKtWE3dJ9uLf3
 x3qP0//OqMofAX9TJKvNXIA+FF+i3xFPW342kJYYSwaz1O+XyfKIXFCsnB9gxyTJ
 K/USSo+sfQH2dyjVz2hPhjisKHK0Mzvxo3a5ozUVkuotpWYIJRPl1e/xuFkiMHQy
 xxmXKBOfC3fm9jXASToyxjpglgg5lJ8xcjprI5qAn0h51RycVkj7SJB4rgVaatSf
 gvT+rmee/+TfD0ZHMD8uh0UZzC5upyaDff9wtE/Efw==
X-ME-Sender: <xms:NNt7Zo_DMSJnB4_j_5hkfwZzs9Cm0Ty_kdO3CSPdp_CD7stZwxyqbg>
 <xme:NNt7ZgvarNYEpDiwZMHQpLC4hYFOf7FfKcbH5_gD7jeO2ZOej1h39XI_ryj5gOu-B
 cMi_smoxTKsbQhnWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
 nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
 veeiudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:NNt7ZuAQAzeu2LG8mSLaTXD1QiMdksbhysiLJnbUSr3K7Pcq6BHzzw>
 <xmx:NNt7Zofb2kCrX66WcQo-53DFII9MEhttOaovItlUxFBRsGWze_vxUQ>
 <xmx:NNt7ZtOGIu1bXp21_dRV1g6o3pIjx-Z9YHWm0YGABypS3B0xsvWDVQ>
 <xmx:NNt7ZimWP8IN2Pze7HBpEpof_uowdDks6wzb2GWyQ2PaNWMh5yQf0Q>
 <xmx:NNt7ZoGgpXBR5Cd7meVQZODGTmeLyrFjChaw0lAdduNRQfIkMZl5TaBH>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EE254A6007A; Wed, 26 Jun 2024 05:11:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <5f989c7d-fb70-4e13-a1e9-86fc6326d633@app.fastmail.com>
In-Reply-To: <20240626-agate-ibex-of-effort-c72ebc@houat>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
 <20240606-refreshing-cinnamon-ibex-a0fe73@houat>
 <20240606-authentic-mongoose-9485904a91a1@spud>
 <20240618-silky-holistic-oyster-bf59fe@houat>
 <20240618-reverse-kinship-7f8df8c8e111@wendy>
 <eb50b8d3-b56d-42b2-a277-02a255b2d6c0@linaro.org>
 <20240626-agate-ibex-of-effort-c72ebc@houat>
Date: Wed, 26 Jun 2024 21:10:54 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Conor Dooley" <conor.dooley@microchip.com>,
 "Conor Dooley" <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Andre Przywara" <andre.przywara@arm.com>, "John Watts" <contact@jookia.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
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

Hi Maxime,

On Wed, 26 Jun 2024, at 8:56 PM, Maxime Ripard wrote:

> We're getting fairly late into the release cycle and I'd like to get it
> fixed before the release. Can you send a patch to address it please?

Sure, happy to. So to confirm add 'anbernic' to the vendor binding list and 'anbernic,wl-355608-a8' as the panel compatible?

Regards,

Ryan
