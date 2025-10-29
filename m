Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D338C1CF4B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD1810E824;
	Wed, 29 Oct 2025 19:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aFIAOlpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7695610E824
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:14:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cxcPC0SYXz9tg4;
 Wed, 29 Oct 2025 20:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761765263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgSFXoYn7Em32WFW3BVTgANJxXcye8GHIxyESfWI5hw=;
 b=aFIAOlpXWVzZvmwCDnAJwdHLbLI/iwfSecCLYMLrRzv1QCogyGxlBtSdxnGoz3Bl+zctc8
 JkW9URo10GuawTV2n5o4LfCbKbp0S6rWQyAEay6qeWQoOJpxt2bCCEd0HGT0rfL7pe8Iw5
 +jKKY/f+NRv1j1yUilYA/+8zBTk8xx98GIZm/V3xa7//EWFIVjMLAEq4rSaDmAK/Pwcl5Q
 S4eMVpceS2UsM9XS41nLoI0H6q3gu8PIlRs6u9K2NT56LVQvPSexKu6lLtG6JoS4tyuZ4x
 UsN100MNFEhhvpsEvEJJahB/ZRY6Up7feS4SOsK9CLpxwNdDD8P04APj91yW7A==
Message-ID: <b40f26ca-ef1b-4dc2-b770-4e0d0a39053d@mailbox.org>
Date: Wed, 29 Oct 2025 20:14:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Rob Herring <robh@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
 <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
 <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
 <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
 <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
 <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bdou18kg7zyskcn66r8tigekqcsxofk4
X-MBO-RS-ID: a339a4accc6c9967f19
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

On 10/29/25 7:44 PM, Rob Herring wrote:

Hello Rob,

> And now a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb:
> panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch']
> is too short
>          from schema $id:
> http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb:
> panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>          from schema $id:
> http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml

I used dt-schema
d6be03029a35 ("Add yamllint config and fix all errors")

I used linux-next
f9ba12abc528 ("Add linux-next specific files for 20251029")

I get this in a dedicated clean worktree, no error:
$ make dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml 

   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   HOSTCC  scripts/basic/fixdep
...
   HOSTLD  scripts/dtc/dtc
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dts
   DTC [C] 
Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb

I am not seeing the error. Is this invocation correct ?

-- 
Best regards,
Marek Vasut
