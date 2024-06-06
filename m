Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404F8FE362
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9E910E8D3;
	Thu,  6 Jun 2024 09:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="p7YjJ3Fg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="g0Wb56c1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1710E8B7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:49:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E7B6D11401FE;
 Thu,  6 Jun 2024 05:49:16 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Thu, 06 Jun 2024 05:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717667356; x=
 1717753756; bh=0l98p+Hf5zWmytUlzXZpMoC4wXxBDLfTsek0INlCHrk=; b=p
 7YjJ3FgWGyZHe1wMuSxORvFXh+3ByRxfMqs97AcnaaSi6J2bwU+wTUCYortZTrTr
 digkkD084dpISQD36X1Dfw1l2GSP1tSb5PKtWDBTEZ3xHGWhxALlVdgvXf6cEUH/
 S4rnbZ4TFb9j9LYJKm2aAaApN3xBYxAEvAqsQr1gB89EVguw4L+0zBFpDDY5JdRF
 O1owiqJzfRjPpKlyX/pkHbWwW2C9ZQEj1CQJCMxpW/1CtvDeznH8/gJaRRopNVOp
 G4KI/KB7RIYwYfoPvJ3VUC3+vGPyKrheQXd9iH6gUlNs4jsRj+/RGOpucd1is7rt
 ALq2ZT3VPfeUeTQnaYtuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1717667356; x=1717753756; bh=0l98p+Hf5zWmytUlzXZpMoC4wXxB
 DLfTsek0INlCHrk=; b=g0Wb56c1vnTfSB3Dr1hCA0jaYAaSMWK4dWDY3Qq/vmql
 dTkGYW5NHTO8vZJ+M40l0kNZ9EoY3m7Bwrgz+FHcVIsqrALxTmpkg0NCb/5Ufb1U
 Cxo/gLklQBQG+LPOAxTcKufRjgfN9exggm82HHp6HsQKXa48RVyBkd5sFphK9YCi
 HnPETIG4EIqrXKYm4HhXQwN8B27pzfNyqQsgnLei5SoGD/gyebgPnEhDinntmHO4
 MJTBUkU3v2LqjDrBO+HuEaoI/z3NEkG7QABCOD39NUAkvEnotEBvTRkIW3Edrp/o
 yBWMY9nqGV3KoY7gQl1e0K/0WWGF7OFgOxOf9Tk5TQ==
X-ME-Sender: <xms:HIZhZpndTAm5yuAyhAfqIJGo8xTsuQ6fbmm69iZojBPQ_KN4gGNXWg>
 <xme:HIZhZk3s00NtHT15bNbHpd4EysmWPaIPon9NJxjtrd9s3c9Xe3UEHIYMIawWCtTxJ
 DQnOCuwMOrarvXSNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelkedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhepgfeghefgleejudfgudduueffhfdvudehteekveduudehhffhhefg
 gedtkeehkeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfihhihhtvghquhgrrh
 hkrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:HIZhZvoi5dvAa8eZhdAPW8q3uUKncejeVrrTp2ktrVdHyGBxTYAC1w>
 <xmx:HIZhZpnsV80hmy7Ygi7NjRSOcP60MDK5tQouvXQWD8acZxOJpYigOQ>
 <xmx:HIZhZn33UHQbqie51CVzDMO3mXFSZAWtqaDtnucVGA82u4nl1XaEYQ>
 <xmx:HIZhZotK9lLvQ0k4f2DnOHuiYRPDlRcf9EPQYn33l8G1eJq3I2O1CQ>
 <xmx:HIZhZr5Y_LHmHAUrqvEOm1sj5dPKziHnUTcIFfKvsCMPPXWqcEfWaGyi>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 06A6AA60078; Thu,  6 Jun 2024 05:49:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
MIME-Version: 1.0
Message-Id: <7d9492ba-5285-471a-9ce7-c2148a388b41@app.fastmail.com>
In-Reply-To: <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
 <20240606-intelligent-aromatic-magpie-80a7a4@houat>
 <2dc1fdec-7673-4462-abe1-fecf8e3e826b@linaro.org>
Date: Thu, 06 Jun 2024 21:48:54 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Andre Przywara" <andre.przywara@arm.com>, "John Watts" <contact@jookia.org>, 
 "Conor Dooley" <conor.dooley@microchip.com>
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

On Thu, 6 Jun 2024, at 9:32 PM, Maxime Ripard wrote:
Hi Maxime, thanks for reviewing.

> Where has this consensus been found?

As Neil notes Conor suggested it [1], and we did consider Hironori's suggestion [2] of using anbernic as the vendor prefix, although my (not strong) feeling at the time was because Anbernic is not the panel vendor, just integrating an unknown OEM's panel into their devices, so at the time I fit was not quite accurate to say Anbernic was the vendor.

Some discussion was also had on IRC at #linux-sunxi [3]. Admittedly not a *broad* consensus, but all offered opinions were taken and the patch was accepted subsequently.

> For this kind of cases, we usually use the device it's attached to as
> the vendor, so anbernic in this case. Can you send a followup patch?

Thanks for the clarification, I was not aware of this. Happy to prepare one but will perhaps wait to see if there are any other comments.

> Maxime

Regards,

Ryan

[1] https://lore.kernel.org/dri-devel/20240525-velvet-citable-a45dd06847a7@spud/
[2] https://lore.kernel.org/dri-devel/CAG40kxGEw4AyHk3P_dixKRdesGT0pLtMfpYcCCTbVGUs2NMD-w@mail.gmail.com/
[3] https://oftc.irclog.whitequark.org/linux-sunxi/2024-05-27#332264
