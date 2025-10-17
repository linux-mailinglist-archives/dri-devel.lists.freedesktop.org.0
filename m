Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF87BEADEE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B38F10EC95;
	Fri, 17 Oct 2025 16:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="p7BzawF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9CE10EC95
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:50:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9n526C3z9sr6;
 Fri, 17 Oct 2025 18:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mW/HzZ3gW1VojRmfulxz/q3LPA7ybA89Muj9W/fDTPY=;
 b=p7BzawF8M8QCK6v4CTLnkyHlWvhCxa5QXUljUyQErxSPSp7PWc+zy+UDhxCegUcrku92l3
 vOKM2xepz5l8LPThpvffyZJEhwQgTUzu9Lr6VJNjiaayMZBMQNWAp/COPtjwNGK4VRK9o4
 glv1spDZqP15qe6XJXaSynjVn1OKskW1UmogBtG/DljndEGn1H5tGTkj18JCbVSjRKieDR
 0jd3u3gDiTc6Xpl0olBv90PSPAlfruVMgBd+qEbKOJusXCtWEcpRtXCcrBShjfi8aOIyX8
 qP4Dzm3OuPTqWeeJHmORAb1kOfdCEwCIuAfI4gp+E6GGXzu7a8HKOfDA1VjaWw==
Message-ID: <cbfb1076-6a23-4b93-9ac4-4401b5b4a0eb@mailbox.org>
Date: Fri, 17 Oct 2025 17:04:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS
 display bridge binding
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-33-marek.vasut@mailbox.org>
 <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 009385e66b48b358479
X-MBO-RS-META: 78us17p5xfqwgitsrb49mw8bgn1heybj
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

On 10/13/25 9:20 PM, Frank Li wrote:

Hello Frank,

[...]

>> +patternProperties:
>> +  "^channel@[0-1]$":
>> +    type: object
>> +    description: Represents a channel of LDB.

...

>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port of the channel.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port of the channel.
> 
> most likely port@<n> should be under ports.

The topology here is a bit different, the ports are directly under 
channel, just like (usually) endpoints would be under port . I think 
this is correct, even if I agree it does look odd.

The rest is fixed, thanks !
