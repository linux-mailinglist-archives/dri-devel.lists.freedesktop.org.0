Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43672CBE49F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A9F10E50F;
	Mon, 15 Dec 2025 14:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="fUmNs04/";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gClGOi7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 14:31:16 UTC
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56B10E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:31:16 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 04DBAEC00EB;
 Mon, 15 Dec 2025 09:22:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 15 Dec 2025 09:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1765808576;
 x=1765894976; bh=9HyQIW7paZTmpd7oGNgDO8ECgFOi2OBLlj9No90UqJE=; b=
 fUmNs04/zi1RmvmhfEQwU24OSg5RnVJCi6TE5G7pVyjIQJZdyn4v8qt/Ib/TQ4R5
 RGwvZnCwNYjyy9iE3XOHYoyqJ96ZQgVWbniJ8vUVSyda9ULJOWHyDB5ZQMunEEc/
 EJ3SQSf47ZFkj1Na4gU50g4mwXn6/lvD5w9OJYurKEaSUrZ8zGhyXnl2Ia3NWgIm
 qeJ//iexQPzZGxOI9/lfBK4VkLwlAPgEiLymkfwgty/LGUw266AIl/p10IKHCiqT
 KTRx0Q5OkyhEg6AW4XXUmYsZF89jOWKp5uPcmi79rJKPrKx5SGkpSaNus1IsPDT9
 94onQAVGOU7dOsI9urBfjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765808576; x=
 1765894976; bh=9HyQIW7paZTmpd7oGNgDO8ECgFOi2OBLlj9No90UqJE=; b=g
 ClGOi7x0V3ubDir6IPd0JOUKXRki7j8vadqQFkQi8ChSImC+n7eUHpxqTHEFdriJ
 jD/y5B//if9yTB/tPxajcjYmdLaV6XGkcBDyb85X3E4kdlzBnh0jvJ5Vvy4PYYVf
 obGoPm6f03oIKl4o5sKqTSy8V6KJsC3yeHkwlYUjFpO4mvs+69IqJ3xc02fZw1qk
 D45WfxVzYCyLPEavCdsRzimTREQKYG3kUHhKlnUucHI84+uxTpKxuyV92UlEkb2Z
 QwAmL2uDIsGx5yonF0qUu0Q4lKYur9hvSzCHWUFGKV+FgFva2UoVwnJmQn/Gkv9h
 Uwb1fnoJPwdUgBozIQd7w==
X-ME-Sender: <xms:vxlAaV3tGXQi_rADmwrXrB32m5j_K5kT40eQpP-4oxD7w7JKv70H4g>
 <xme:vxlAaancjRFEHR6WNFoppWhPer6a3AtVqO1d2pRxzVRZP6c9uzaZzbk4_NRUyb1op
 15Kp9avyfS_DSGYyoeeUwl7cQa-y2cMxR6m7jXVvpqvxkentF7Q5Kwi>
X-ME-Received: <xmr:vxlAacvlbl02fZdEHrt-SypV76w-WIm5kTuunNoxkiWEGuXWYF243iY6qioOLutp-TdbHAUSInxVk8lxy-6Oknxq6x9gevU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefjedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
 ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
 gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdtgeefveefgfeutdevveelgfelkeeu
 vdefgefgfeehfeeijeehudelhfejkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
 lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
 hopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihsrgdorhgvnhgvshgr
 shesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugi
 dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehfrhgrnhhkrdgsihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehmrghtth
 drtghoshhtvghrsehimhhgthgvtgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehg
 mhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtph
 htthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgt
 ohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 epthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:vxlAaS2FNh0lEQB1ZK2Cqg4GaSoUvHiGPXfSst_8TeaxMIkltiL7ng>
 <xmx:vxlAaQRgWAd9M13wpdXLgwtt5DK7By9Q7GdlJzaJI-XH3dnU2ZbU1w>
 <xmx:vxlAaev3zL7wTy2rlblRt-e8gBFnJRS7WSRMC_c4bPECJeNmJXWBLw>
 <xmx:vxlAaeK2U5k-UCUNqVrFpMI3xnJPxuHZUa1t5zPm6btNjJjLx9Nsrg>
 <xmx:wBlAaasLEDGARWAjwac-SK0PL6fjL9khye6eJ7OEW01Dh54O3-58EHvX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Dec 2025 09:22:54 -0500 (EST)
Date: Mon, 15 Dec 2025 15:22:53 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car V3U
Message-ID: <20251215142253.GA1324977@ragnatech.se>
References: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
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

Hi Wolfram,

This is posted already here [1], not sure why it have not been merged 
yet :-)

1.  https://lore.kernel.org/linux-renesas-soc/20251106212342.2771579-2-niklas.soderlund%2Brenesas@ragnatech.se/

On 2025-12-15 22:36:35 +0900, Wolfram Sang wrote:
> R-Car V3U has the same unit as M3N and its GPU was already added to the
> DT. Add the binding description now, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Fixes:
> 
> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
>         ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
> ...
> 
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 225a6e1b7fcd..86ef68985317 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -20,7 +20,9 @@ properties:
>            - const: img,img-gx6250
>            - const: img,img-rogue
>        - items:
> -          - const: renesas,r8a77965-gpu
> +          - enum:
> +              - renesas,r8a77965-gpu
> +              - renesas,r8a779a0-gpu
>            - const: img,img-ge7800
>            - const: img,img-rogue
>        - items:
> -- 
> 2.47.3
> 
> 

-- 
Kind Regards,
Niklas Söderlund
