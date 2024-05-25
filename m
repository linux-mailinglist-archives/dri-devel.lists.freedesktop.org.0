Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57E8CF20F
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C406010E9F6;
	Sat, 25 May 2024 23:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="pLSur5J9";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="WnX4rYgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE5110E9F6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:10:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id 0F20018000B7;
 Sat, 25 May 2024 19:10:22 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Sat, 25 May 2024 19:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1716678622; x=1716765022; bh=TzT1NPNMS/pcYuB0SdShn15N5I6VVJd2
 vtZEThuMygk=; b=pLSur5J9CNwa/U8RNfWZuHSriQ4zLzcHE+IzJQEYZlHtTRhn
 0X879yI4SQUJ1YxTI60wT1Ao2AyxOGg8840M9viLdoymgYZdGk959k+TE1UljDFw
 ZfMcjkg9LVEL8psti3AURrcAGyo+byS1D2JhxK6MsahPE+EWi6XdEUGfHQK9vVM6
 8KLWPXqKlPlxNLOwCe+1M/tse7IF1RDVYosKDb9+oC6d4X0P48DiWldeeYXYOxhw
 VuMefqjNLSNZOn6CDUk1odOJHxX924GBQyZLVHrzLehc3OpqbwotiSzFj7he17ly
 q2pz2X/54k/Ie5LUH23HUoGLwpQMBtkZWRdEvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716678622; x=
 1716765022; bh=TzT1NPNMS/pcYuB0SdShn15N5I6VVJd2vtZEThuMygk=; b=W
 nX4rYgl1OXdPiqm7y5aDvfaGn5iOR+aQW9U0rV6z0Qn+8mwCzhD6LZUfErrWvAD+
 sUBjY4U4Mb0709At+UeHAHnInKExqzKkc84uTVTwHXXsRSa1Jo/szg4gZLIUcKhu
 m+iXsblmg1Lm29UMfHEbx0/iEoktNvtcMJFgDUILLA7Gi9YtumT4i4jlak3CtWAe
 hUszBU6fyxi4AckGpiJIigNGKpakD8zYKvEI1LTYtMCPAf5RGQxjXO5x4aDUspf9
 ml4mmMiwHUiNJXRkL9fheu9wzHPvOR4tV7goNhMzu8PFNq+EGaMj/52gEuu9/29v
 qL+NnRUalFjY2Zq/er75Q==
X-ME-Sender: <xms:3W9SZupnbAaD0xmnxNvGkPSPfV0UhetAm8tzhRyvcjm09dFJ-uZ6Cg>
 <xme:3W9SZsqWMiHcy2NIO98649z_6z8yLGNlNCyAguBVZM3EC7n2qXn60OLEMQbLhU5Ya
 qTG1KyCfDkbKzjI9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdft
 higrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedugfffhefgudejvedvudffleekteeliedtfeetteeifffgtdel
 tedtkeeigedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:3W9SZjMInLsqzHxIEuu2Fx7s5b0l_De7tg4oZMz7WNta1iv72pHi-g>
 <xmx:3W9SZt67tB4FtcFSTNJhd85NWgoWjCg8wTI1Yv4Yk9vAg8F8CCrG7g>
 <xmx:3W9SZt41qWSSiLjuVGxd84_YTBJwz57Xlh27AjHmblBsnWRFD-eq4Q>
 <xmx:3W9SZtj__492TFZWF86saKPWFmtctGny60e-q3Fwb5aollSxQxHS2g>
 <xmx:3m9SZkqebNlVbFheG3tAmixIstlT9Yht7uY2RJP1cL-JJPL91VpAA557>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C5D10A60078; Sat, 25 May 2024 19:10:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
MIME-Version: 1.0
Message-Id: <6ed1a5f3-0d54-4169-993e-0d7f57cef530@app.fastmail.com>
In-Reply-To: <CAG40kxGEw4AyHk3P_dixKRdesGT0pLtMfpYcCCTbVGUs2NMD-w@mail.gmail.com>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
 <20240524-purveyor-outlying-5201f700a56e@spud>
 <a7363cd2-4e2e-4894-8a16-f1913927e332@app.fastmail.com>
 <20240525-velvet-citable-a45dd06847a7@spud>
 <bb8b54de-c894-4fcd-a2ea-89b22cdb3a47@app.fastmail.com>
 <CAG40kxGEw4AyHk3P_dixKRdesGT0pLtMfpYcCCTbVGUs2NMD-w@mail.gmail.com>
Date: Sun, 26 May 2024 11:09:59 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Hironori KIKUCHI" <kikuchan98@gmail.com>
Cc: "Conor Dooley" <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Chris Morgan" <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 May 2024, at 10:49 AM, =E3=81=8D=E3=81=8F=E3=81=A1=E3=82=83=E3=
=82=93=E3=81=95=E3=82=93 wrote:
> Hi Ryan,
>
> How about to use "anbernic,rg35xx-panel" ?
> It's not generic though, some other drivers use similar strings alread=
y.

Could do, although I think it is used for more than one of the Anbernic =
devices, so "anbernic,wl-355608-a8" might be best. Happy to go with what=
ever approach is preferred.

>
> Regards,
> kikuchan.

Regards,

Ryan
