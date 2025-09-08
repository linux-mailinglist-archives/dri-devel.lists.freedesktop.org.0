Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC182B48E3B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5356E10E510;
	Mon,  8 Sep 2025 12:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IB3cle64";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cgOt7SeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118A10E510
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:54:23 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cL6NG0Z63z9tGX;
 Mon,  8 Sep 2025 14:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757336062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLg9bh33bXVIKLGiohlmqJP0n8UW6cjhY+uJOZV8XrM=;
 b=IB3cle64uqKld1NLaEF656hneXh+E2Oe89+Af8ZDIAQmAXGfYFb3Evukz8S7D/Xfit4OTs
 UxBr6glYOrwbTxiFLtSdRlttYKMcMJ3EtKoTHtFEAtSw1I5lVpj/LM2OoD6/0fQJ9abqUf
 EcWbbkvyWrqi0rSGUiV62HjfZf0nT5QPIVfu6/ovb9uokpZQBslKdhsODv5t7NknE8gGSc
 vNFBVmF+EtnVZWEvTnKdywneFvHVhR64rp/p/trhlANrjFeewCIOrvmKWhDYhSXv1pvNV1
 Gql4wOIdocIA8C9D3MB43rEGNWqwD2SNdh6GAsSYp3P0tTTtbJ/T+PyALUfSlQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=cgOt7SeL;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757336060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLg9bh33bXVIKLGiohlmqJP0n8UW6cjhY+uJOZV8XrM=;
 b=cgOt7SeL07uK4bbfI4wSxfemhkBmH98e5h/kcTxUlWI/f9lWSFePcVqP6xDh92fuSBxMKy
 aAhhMoZMrE0o3UWqNEZqUYG9KBCYFmItrAN3GAUeCr945OElSXIQtG2M3eNSxPIbr8N1eo
 dUtcKCECxMmkZoIPMEHF65mOxSP0x42HylWyXEzT45AL0Iful0NoBQoIf79ytLBB/CUdYT
 o4M5/YFVt09A7uqCOJeKwibPgm3ZOMcW5syS9ge21VoCWPL078nQ/GgBOtuFGCu9XqHcQZ
 Y2GvZPG2AYxdm0K1jW9x1jiX6HzfvP4rs6ryHODDYk+2wxQW3j7JBR5eYSyy6A==
Date: Mon, 8 Sep 2025 14:54:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5b7806702f524cb8287
X-MBO-RS-META: enummhz4zqtmsbae8u3fgxqa3gjahjpr
X-Rspamd-Queue-Id: 4cL6NG0Z63z9tGX
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

On 9/8/25 9:43 AM, Tomi Valkeinen wrote:
> Hi,

Hello Tomi,

> On 05/09/2025 00:01, Marek Vasut wrote:
>> This controller can have both bridges and panels connected to it. In
>> order to describe panels properly in DT, pull in dsi-controller.yaml
>> and disallow only unevaluatedProperties, because the panel node is
>> optional. Include example binding with panel.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Drop the dsi0: and dsi1: controller labels
>> ---
>>   .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>>   1 file changed, 51 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> index c167795c63f64..51d685ed82891 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> @@ -14,6 +14,9 @@ description: |
>>     R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>>     to four data lanes.
>>   
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
> 
> Did you try with a bridge? dsi-controller.yaml only allows a panel. I
> think I discussed this with someone not long ago, but I couldn't find
> any patch sent for that.
Nope, I only have these two 5" and 7" RPi Display 2 panels.
