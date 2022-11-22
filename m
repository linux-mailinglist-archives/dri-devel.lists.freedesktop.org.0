Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA06336E8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93E10E39F;
	Tue, 22 Nov 2022 08:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959F910E39F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 08:20:32 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D7562D9;
 Tue, 22 Nov 2022 09:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669105230;
 bh=LbhkI5gTxUpZ5zOH7qkzXvnWyaWWN/TtRQOMEKSf+Ek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BIn+/o9sLB4fhpniMBPR5FGDY6rMZv8mtuV3Zhg9sZYYRJC43TVHcxpbcR1B3ecSo
 MPTi0cfj4bWfL6C6lh4e5h8RJV+bEkmqIxqzyQYjCNpGZR6cfhcJc5+N3O7d9k3Lc7
 veSkg2Un1xdQOnXuaM/p7zpM694sNw7KVlv1ix7I=
Message-ID: <f5df3cb8-d315-b06b-aa04-f0b4af64a1c2@ideasonboard.com>
Date: Tue, 22 Nov 2022 10:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Add r8a779g0
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
 <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 17:14, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Thu, Nov 17, 2022 at 1:26 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> index afeeb967393d..bc3101f77e5a 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>> @@ -11,13 +11,14 @@ maintainers:
>>
>>   description: |
>>     This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
>> -  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
>> +  R-Car V3U/V4H SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> 
> Perhaps "R-Car Gen4 SoCs", so we stay within 80 chars, and don't have
> to update this when the next member of the family is around the block?

Is V3U gen 4? Or do you mean "R-Car V3U and Gen 4 SoCs"?

> Is there anything that might be SoC-specific?
> If not, perhaps the time is ripe for a family-specific compatible value?

At least v3u and v4h DSIs are slightly different. Well, the DSI IP block 
itself looks the same, but the PLL and PHY are different.

  Tomi

