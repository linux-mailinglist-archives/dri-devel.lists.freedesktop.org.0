Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28F8CF179
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 23:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB710E5B4;
	Sat, 25 May 2024 21:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="BmR2WNOW";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QgdM7xhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0FE10E5B4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 21:41:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 66C7A1C0007C;
 Sat, 25 May 2024 17:41:27 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Sat, 25 May 2024 17:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1716673287; x=
 1716759687; bh=77klsfvfcOZG10PZknXMDeYJc7yaylYKZFfQRcOUhtQ=; b=B
 mR2WNOWinNERIEw/ItVHpjXJWZhd6+JNro+mX+oDuB0QyaJIVq+GiN+KUv5inyCl
 BnLqQKH7y+hOPEXxVrNuGx8VS8713b8f0qbBm+8uRV5vIz6WcIPbKpEEm8Vj9oSB
 BkTR2Dyz+Uk90V12OwY5yR53iOjTDW3rXJHI2piA8WEd9fYQke6iHIO6vov5dWns
 Rv/YH+/SUtQqqErsR/RWCDtbf7ZsKtP3+z6eQLoLvT17BH6Oktv/i6GfceJ9rWsc
 +nnMlgXOHOzBspLDprCJ53AtvCl2OIoGXFnen6MQMUCuUGuZgc+8+bwBAG+GJYRa
 3MQyHwtiKC5Xa59tLEdfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1716673287; x=1716759687; bh=77klsfvfcOZG10PZknXMDeYJc7ya
 ylYKZFfQRcOUhtQ=; b=QgdM7xhXDTXWBrG3+lAale/o4rsMglwKkQLpW2Qz+qo4
 aE1swVRXqPKDhriEZv0R5TCO1mnZvMa9Sk8ZLZ4v+FX6mFjQO3G+D2Zgp1lkGX6/
 /Ztc0GpYvd1J+Z1cWHAOcK03JkX1i7/J33DpAf4Qyl5ozamOPoxsMfZ81tI1xOOB
 R8G6WYJg0F0ZcWZtpl5u3Nd3suL08f80hNMeAlW79Q2cyxv0UMa8yP3YUNq1qz02
 J6DzwxLQ1YMKzAtjlyobVyD+X0JI+a9opJu+PRI63kFTo+5ei84M+e+ESFGb4BgF
 tazda/QvxHhoBCBGEoaNy9D0iIgUW2sC1Ag5Mre8wQ==
X-ME-Sender: <xms:BVtSZpC2zCHDl3XVQINatSDgaoP5_oreelPFciMGEqABc2wJUiVKCw>
 <xme:BVtSZng35cTqrP8TJT-Bc8X5cS2Cd6QClBnWXb6fiu55r7OFT43A2hEpPb63IWeC6
 er9c8Ej0ZH2VA9tFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejuddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
 ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:BVtSZknGbu-05aladTeSN7-Bd-biWO3VQrBb_t1ykdjVQn8RoNVM2A>
 <xmx:BVtSZjxvf9bI_9VPzyHcBolhKgoP8PqUFP5vXSl0L2wj7cyUPq6uYQ>
 <xmx:BVtSZuQIxqH02iZGwdxqAWImSa-5z8DFyj934fxFh8yqGrnGEqJ88Q>
 <xmx:BVtSZmY9ZThbddWd9uviVf2tdJcdyciOS2P-CGJtRGvkHETPSO0LhA>
 <xmx:B1tSZjheAPLXFYJ3MhKSm5aP9_IcMvMp7OpXrQBU4PMv8hvd8Qdv0BbB>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9F479A60078; Sat, 25 May 2024 17:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
MIME-Version: 1.0
Message-Id: <bb8b54de-c894-4fcd-a2ea-89b22cdb3a47@app.fastmail.com>
In-Reply-To: <20240525-velvet-citable-a45dd06847a7@spud>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
 <20240524-purveyor-outlying-5201f700a56e@spud>
 <a7363cd2-4e2e-4894-8a16-f1913927e332@app.fastmail.com>
 <20240525-velvet-citable-a45dd06847a7@spud>
Date: Sun, 26 May 2024 09:41:04 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Conor Dooley" <conor@kernel.org>
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
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
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

On Sun, 26 May 2024, at 3:22 AM, Conor Dooley wrote:
>> 
>> Thanks, I don't actually know the vendor, would it be acceptable to just use "wl"?
>
> You mean, "wl,355608-a8"? I did a wee bit of googling of the thing, and
> yeah, there's nothing that a surface level search turns up for it -
> other than they appeared to have a logo with a W in a circle...
> I think if we genuinely do not know what the vendor is then we just
> don't have a prefix.

I was going to go with "wl,wl-355608-a8" as the whole string seems to be the product/serial code, but happy to just not have the vendor prefix as per my V1 if that's acceptable, seems pretty obscure as you've found.
>
>> >> +            compatible = "wl_355608_a8";
> Not _s :)
Noted, ta.

Regards,

Ryan
