Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8910A36AFC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 02:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1B510E0AE;
	Sat, 15 Feb 2025 01:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Hl2dxZXe";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="FvlWvLG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2915810E0AE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 01:27:56 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6BC6D11401B6;
 Fri, 14 Feb 2025 20:19:20 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 20:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1739582360; x=1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2Gz
 sTIwm6goNGc=; b=Hl2dxZXeV307gE122iJ/3jRfFeTDxZQISO5FBFwIgCvbs1YP
 wlQSzTfHHGgfDCSf33uabD+jcQ/2J+kDGe3EXgl6CVJOQxMZ4BAEM5VwWxt1HXqk
 9OuiO7JMiFpCk3ApcVeW43JiwT0PbPyJWCZOXWnkUhHm5XzH3Cd/CZu3VAkwpcsi
 MHEY/eNmSzIuA1Sf83jhjQRJ0YF107EhoS860ucNxGMRLcePEsL5b84978STsWFz
 HqZBmn/KHUcUWLoO2iQJLLxhJHvt6NlWNT6kfODpJRyu+zpRZeahwSuTDEoBhMkH
 mTQXVxpLYMyYYG7Lztqxjs77wEE3XbYccaQlwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739582360; x=
 1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2GzsTIwm6goNGc=; b=F
 vlWvLG99wUSOP/zMRkP9qVr+B/2dTNe9AqxVr/mKKNc091mS3zqVrQaXyBthor6E
 h3Gi01UYL62L1mCUPEc8zgpIpyO7th9jNVXOz0hnrh2620vFL0zdm5TFnjibaxYj
 d8Yrbyz84MBTgHzs4ByzZWeUxrwtAUJ9NjotRP/1z4IXmWTMhxQLIyrStHAecjU5
 qOLyqJYS3nr/zJcCeb3REIOP4keYza2EoF1pLP1RvHu7X5W1xLnDeVqXbISURuaj
 YxSvtk64lz1qunGsuK96u8qYQT3ehZmoikZjpotygo0TuyZP9sAg++o4iyRQ8OwD
 N+g+r9C27UMzGyYgm6XHg==
X-ME-Sender: <xms:mOuvZ58osQ0I3vOmGKfQdpQBY83_i83DfAdI1HvRkVEiTHu7nuOEMQ>
 <xme:mOuvZ9tBd5v0DM5FjV4xHRfRyyqqcMDevNG9toTbWfUfQ47ox966KmbitaTyH25U-
 UlIU4ixnQP3lM1efQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
 grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
 tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
 gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
 vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
 dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
 esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
 lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mOuvZ3AkNu5FEzvDhjznN9rdipvJ5mHnqNeSuE_PNojHd9hrZ3GCUg>
 <xmx:mOuvZ9eP7Q2NP4e19l68Xa3Ayi3Xa_JDMDbqWUZM17dql_ttn57l0g>
 <xmx:mOuvZ-Ms2aUq_dCBvtstZfX12jE7Pg0D0K-hYv-Lgy7o6ecsb4JeIA>
 <xmx:mOuvZ_mq9nez5yynAmFWQX2RcXkvq5vB-b_HS8xMf6VWMfpwfc7zlA>
 <xmx:mOuvZ6srJHxh6iK0HRdurHbPvILiwIhGlkJpRxXqAmBtbtDB62vIttO7>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 408AEBA0070; Fri, 14 Feb 2025 20:19:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 14:18:59 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>, 
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
In-Reply-To: <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Sun, 20 Oct 2024, at 3:14 AM, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:

>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
>> index c48cbc1aceb80..ffafc29b3a0c3 100644
>> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h

>> @@ -151,6 +153,9 @@ struct sunxi_engine {
>>  
>>  	int id;
>>  
>> +	u32				format;
>> +	enum drm_color_encoding		encoding;
>
> Should these be a part of the state instead of being a part of the
> sunxi_engine?

Sure, would you suggest in sun8i_mixer_cfg?

Regards,

Ryan
