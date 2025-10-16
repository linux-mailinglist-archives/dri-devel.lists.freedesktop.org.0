Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D966BE2ABA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D51B10E99F;
	Thu, 16 Oct 2025 10:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LQ85WnW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF910E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:11:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNyT6mbXz9snK;
 Thu, 16 Oct 2025 12:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760609474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XEkHO0Qp+G5qiHbC61D2twuNKFoICnhB602ktEQ9pg=;
 b=LQ85WnW/giG/wNYUMGjaCpnEWsvmiu3le36bj7e1dlLUvFaY5qdXIN78mHJ+zGuk3IApJ7
 dAx9mklKSK0MAA4YwN5NocvIlPI7q86NbDz86wW/5xL389vr9hCOVqmn6MMfvN+mJ/b1tr
 HSE2bhtI9wtL0aMUfA/Yvr+avuxDSzXSHxMOPN/Xb/ZkkQwBATiflC92Lo18bJBBuLnLzQ
 8kRf2J/NMOX/JyC7UxwSL7SjW5WNBG+Z24M+Nyqwuo/u+zE+pBfbRbQr8SsMHyZMrfs+9+
 C3vFDd4YGvfPv7iyPn3m/N5zME1AT9wlfITX2w3GbLiGbHQ6CcpLW0TbIK1a+A==
Message-ID: <921ac611-63b0-460b-86b5-67340eeb5dba@mailbox.org>
Date: Thu, 16 Oct 2025 11:55:19 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
 <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
 <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e2d7ddbfc98dbd254b
X-MBO-RS-META: 48n3zgsbymmnn5ca9mfuipkjb6dxnd4w
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

On 10/16/25 10:48 AM, Matt Coster wrote:

Hello Matt,

>>> Would you mind splitting this conditional block up? We already have a
>>> constraint for 2 power-domains (see img,img-bxs-4-64), which should be
>>> applied to the entire img,img-gx6250 compatible.
>>
>> I will add a patch into V3 which splits the allOf section up such,
>> that clocks and power-domains limits are limited separately. That will
>> make this addition of GX6250 easy.
>>
>>> As for the clocks, for the currently supported GPUs, we have "mem" and
>>> "sys" clocks that are optional at integration time, so those
>>> conditionals are based on the vendor compatible strings (ti,... etc).
>>> However, these older GPUs always require all three clocks, so it
>>> probably makes sense to create the properties:clock{,-name}s:minItems:3
>>> constraint on the img,img-gx6250 compatible as well, rather than the
>>> renesas,r8... ones.
>>
>> OK
>>
>>> You shouldn't need to explicit list the power-domain descriptions at the
>>> constraint level at all; if there's a build warning that they're missing
>>> I guess the correct place to add them would be on the top-level
>>> power-domains entry, but I don't really think they contribute anything
>>> meaningful.
>> The descriptions basically emulate minItems/maxItems: 2 here. I can
>> also just set minItems:2 ?
> 
> I think that's probably much cleaner! We can add maxItems:2 back in
> later if/when we add additional power domains at the top level.

OK, will do.

>> I have one more question -- does GX6250 _always_ have two power
>> domains, i.e. the constrains always set minItems:2 for
>> "img,img-gx6250" "power-domains" property ?
> 
> Yes, that's correct. All PowerVR GPUs have the number of power domains
> defined in the IP. Even where the SoC does not expose control of these
> to the OS, the GPU still communicates with the SoC power controller
> directly to gate them on and off during normal operation.
Understood, thank you for the clarification.
