Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056CD8D1036
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 00:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86FB10E2A6;
	Mon, 27 May 2024 22:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="D4dZKY/m";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="GP+hsWTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A78410E2A6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 22:23:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id F147E11400A9;
 Mon, 27 May 2024 18:23:49 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Mon, 27 May 2024 18:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1716848629; x=
 1716935029; bh=DUOZu0UGShFWgVguBazhgGtegaOl661c55YH05FpAYg=; b=D
 4dZKY/mgNFKJfIRxfFQinE9P3nz06VoiPzDKoXxO8DMF05HvJiQ+niDWeJljfB4O
 BMlAAAycO7wympnvw64FqiWlh2Hf0X1mA8zNASl2h7a5pTLiX2Bj+s+Mv6HDXJ5l
 pLzJIU0ButvP5EmQcyiSDUl+9CGXnL/Crw2GYfw8wgZTqzoUm/3BjqB89elVBHLy
 j+IcXq5R9lEjhUsLNhN0I4yxG2vtNMjrsJmiMRMSFV0ZGMKBQVCmkA3X3mksbPX5
 GfPW2OkrQbSYsQrOtTcowAVn8Nebiwd6FYuFirj1jLMN3CbzkQI2CkhVRWXvJxFr
 E1nRLGzt1v6T9/N6T4Obg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1716848629; x=1716935029; bh=DUOZu0UGShFWgVguBazhgGtegaOl
 661c55YH05FpAYg=; b=GP+hsWTRGAaIq7GJiUukQhbqq09NcqJj94aIgbj9G5Ck
 LwehYnFf7/19YP00lYgogotw6hX80NqVecQYzvL4so/db6fbj70zWCrkme/5ohmF
 lU1C1UWHTdVX3Xl5xSqHuAIJVCOD6SW95exsl95ZmtPJIE0QoqyzCXiY9X7lDm6H
 C0VUjcNLThcydTCVM26CVDRWe/wUMzG2nqQRq+lmYleXX6nks8KO1GNcEJoyHtN9
 jsuqePAPYbyxK7iQhK4028IFU04Sph1upI+uLIrPkdNqRe391OYvm1X9H2BWzOl/
 eNqSatLzOkAldg3/1IBfW+UT0zhZZfrxEtMsFKeXow==
X-ME-Sender: <xms:9QdVZk0Xz23OXcvK2q9SBV3m3_-IkAIbrJe7NFquCzR1zbtXHVzq2g>
 <xme:9QdVZvE1Dlk734YUssSGCDLa4jFXCHjMdSMMdKTUFg9uRvWEgXrmGmPFLm6E-Ml6C
 ZVL1DRaiuonaWY5Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejhedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
 ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:9QdVZs7VD1-_HP9QOlhUq7zlqJ2lSusWMWV6FZLuf7pxaYKM2KM4pQ>
 <xmx:9QdVZt2IoLaqmQ_rMIkroY_yuhJF4SOJyxeGMqzZ4n_QOn7bWKxUig>
 <xmx:9QdVZnGYUAsP_mXTpPQHIf7lh5Ap-pcvZI6a8ctXbwHWCXqE3Jomag>
 <xmx:9QdVZm8KWUH0ZvBnxhhsvQKTqpmvZIjbEQDAnqyLBr9-1_3cbnkAPQ>
 <xmx:9QdVZhGrzb_2L-bER7VXJJPu-KTwZuLp-rx0YQ3OkatrbnPFzq3qhVYc>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 62940A60078; Mon, 27 May 2024 18:23:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
MIME-Version: 1.0
Message-Id: <6ae18669-7ca9-4e5d-82a5-4821a2ec4236@app.fastmail.com>
In-Reply-To: <ZlUGWSdbvZqQirrt@titan>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-3-ryan@testtoast.com> <ZlUGWSdbvZqQirrt@titan>
Date: Tue, 28 May 2024 10:23:28 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "John Watts" <contact@jookia.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Chris Morgan" <macroalpha82@gmail.com>
Subject: Re: [PATCH 2/2] drm: panel: nv3052c: Add WL-355608-A8 panel
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

On Tue, 28 May 2024, at 10:16 AM, John Watts wrote:

> This all looks good to me, though I understand you may need to change the
> compatible. Please CC me if this happens so I can re-review.

I think the consensus is to accept an absent vendor-prefix rather than use the device manufacturer, so I will submit a v2 with the documentation changes presently.

> Reviewed-by: John Watts <contact@jookia.org>

Thanks!

Regards,

Ryan
