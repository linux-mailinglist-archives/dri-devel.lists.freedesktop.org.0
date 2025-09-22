Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36833B8F52B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 09:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BFA10E3CE;
	Mon, 22 Sep 2025 07:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EoZ34g1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01F10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:42:37 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58M7g6SQ735091;
 Mon, 22 Sep 2025 02:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758526926;
 bh=aO2LzmOjhosxt9azbVbxxXomsetXJgHol6XZ8UGPR7k=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=EoZ34g1q3+ZTn+DC6DUOCzO916pCtWETOGIaequ1Yem4qtHj9AmbG4wYehQ48P28Q
 w6P6CB2cHBAQKXv4xmN0vxtIcV8sQaURjE+1BnwL8KShz7NngS8X4sJwTbJA4sr8c7
 N///I1netzgd13445l/Wp22+Jf2Ljt6TKGLquueU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58M7g6cU133343
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 22 Sep 2025 02:42:06 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 02:42:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 02:42:05 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208] (may be
 forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58M7fvAS2140361;
 Mon, 22 Sep 2025 02:41:58 -0500
Content-Type: multipart/alternative;
 boundary="------------OH0AgMhyWsRrvVHGonSWrgyY"
Message-ID: <d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com>
Date: Mon, 22 Sep 2025 13:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <lumag@kernel.org>, <dianders@chromium.org>, <jani.nikula@intel.com>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
 <20250915103041.3891448-2-h-shenoy@ti.com>
 <20250918-dandelion-guan-of-storm-fa2051@kuoka>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <20250918-dandelion-guan-of-storm-fa2051@kuoka>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

--------------OH0AgMhyWsRrvVHGonSWrgyY
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/18/25 07:00, Krzysztof Kozlowski wrote:
> On Mon, Sep 15, 2025 at 04:00:40PM +0530, Harikrishna Shenoy wrote:
>> From: Swapnil Jakhade<sjakhade@cadence.com>
>>
>> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
>> DPI/DP bridge.
>>
>> Signed-off-by: Swapnil Jakhade<sjakhade@cadence.com>
>> Signed-off-by: Harikrishna Shenoy<h-shenoy@ti.com>
>> ---
>>   .../display/bridge/cdns,mhdp8546.yaml         | 24 ++++++++++++-------
>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> index c2b369456e4e..2a05a7d5847f 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>> @@ -27,13 +27,12 @@ properties:
>>             Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>>         - description:
>>             Register block of mhdptx sapb registers.
>> +      - description:
>> +          Register block for mhdptx DSC encoder registers.
>>   
>>     reg-names:
>> -    minItems: 1
>> -    items:
>> -      - const: mhdptx
>> -      - const: j721e-intg
>> -      - const: mhdptx-sapb
>> +    description:
>> +      Names corresponding to entries in the reg property.
> No, top-level should have broadest constraints. In your case it is
> min/maxItems.
>
> Description is completely redundant. Wasn't here before, so why adding
> it?
>
Noted, will remove description and add minItems:1.
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -100,18 +99,25 @@ allOf:
>>         properties:
>>           reg:
>>             minItems: 2
>> -          maxItems: 3
>> +          maxItems: 4
>>           reg-names:
>>             minItems: 2
>> -          maxItems: 3
>> +          items:
>> +            - const: mhdptx
>> +            - const: j721e-intg
>> +            - const: mhdptx-sapb
>> +            - const: dsc
>>       else:
>>         properties:
>>           reg:
>>             minItems: 1
>> -          maxItems: 2
>> +          maxItems: 3
>>           reg-names:
>>             minItems: 1
>> -          maxItems: 2
>> +          items:
>> +            - const: mhdptx
>> +            - const: mhdptx-sapb
> This is wrong. Previously CDNS variant had two items means it had
> "j721e-intg". Now it's something else.
>
> First, this is an ABI break.
>
> Second, there is no explanation at all for it in the commit msg! Looks
> like random change.
>
> Read carefully writing-bindings doc.
>
> Best regards,
> Krzysztof
>

Hi Krzysztof,


Keeping this patch series aside, The existing binding-docs clearly have 
a bug.

Since even for cadence specific compatible "cdns,mhdp8546" it 
compulsorily expects "j721e-intg" register space

which is NOT part of the cadence IP block mhdp8546 and hence not 
applicable to "cdns,mhdp8546".

This was also discussed here [1] and can also be referred in this TRM 
section [2],

which clearly show that "j721e-intg" is part of TI wrapper IP block and 
should be

applicable to "ti,j721e-mhdp8546" compatible.

Yes agreed it breaks the ABI but it also fixes a bug and I don't see any 
one using only "cdns,mhdp8546" yet.

so I am thinking it's more appropriate to fix this as a separate patch 
independent of this series.

Kindly let me know if I should submit a separate patch to fix this bug 
or I should just ignore this bug.

Depending on your suggestion, if it's agreed upon to send the bug fix 
patch first, I will send out an independent

bug fix to remove "j721e-intg" for compatible "cdns,mhdp8546" and then 
rebase the series for adding DSC reg blocks

on top of bug fix.

[1]: 
https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/ 
<https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/>
[2]: Link to TRM ZIP:https://www.ti.com/lit/zip/spruil1 
<https://www.ti.com/lit/zip/spruil1>
Table 2-1. MAIN Domain Memory Map
DSS_EDP0_V2A_CORE_VP_REGS_APB are EDP core register identified by name 
mhdptx in DT.
DSS_EDP0_INTG_CFG_VP identified by j721e-intg in DT.

Section 12.6.6.16.4: EDP_CFG Registers

Driver use: TI j721e Cadence MHDP8546 DP 
wrapper(drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c)


Regards.

--------------OH0AgMhyWsRrvVHGonSWrgyY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 9/18/25 07:00, Krzysztof Kozlowski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250918-dandelion-guan-of-storm-fa2051@kuoka">
      <pre wrap="" class="moz-quote-pre">On Mon, Sep 15, 2025 at 04:00:40PM +0530, Harikrishna Shenoy wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Swapnil Jakhade <a class="moz-txt-link-rfc2396E" href="mailto:sjakhade@cadence.com">&lt;sjakhade@cadence.com&gt;</a>

Add binding changes for DSC(Display Stream Compression) in the MHDP8546
DPI/DP bridge.

Signed-off-by: Swapnil Jakhade <a class="moz-txt-link-rfc2396E" href="mailto:sjakhade@cadence.com">&lt;sjakhade@cadence.com&gt;</a>
Signed-off-by: Harikrishna Shenoy <a class="moz-txt-link-rfc2396E" href="mailto:h-shenoy@ti.com">&lt;h-shenoy@ti.com&gt;</a>
---
 .../display/bridge/cdns,mhdp8546.yaml         | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..2a05a7d5847f 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -27,13 +27,12 @@ properties:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
       - description:
           Register block of mhdptx sapb registers.
+      - description:
+          Register block for mhdptx DSC encoder registers.
 
   reg-names:
-    minItems: 1
-    items:
-      - const: mhdptx
-      - const: j721e-intg
-      - const: mhdptx-sapb
+    description:
+      Names corresponding to entries in the reg property.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, top-level should have broadest constraints. In your case it is
min/maxItems.

Description is completely redundant. Wasn't here before, so why adding
it?

</pre>
    </blockquote>
    Noted, will remove description and add minItems:1.<br>
    <blockquote type="cite"
      cite="mid:20250918-dandelion-guan-of-storm-fa2051@kuoka">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
   clocks:
     maxItems: 1
@@ -100,18 +99,25 @@ allOf:
       properties:
         reg:
           minItems: 2
-          maxItems: 3
+          maxItems: 4
         reg-names:
           minItems: 2
-          maxItems: 3
+          items:
+            - const: mhdptx
+            - const: j721e-intg
+            - const: mhdptx-sapb
+            - const: dsc
     else:
       properties:
         reg:
           minItems: 1
-          maxItems: 2
+          maxItems: 3
         reg-names:
           minItems: 1
-          maxItems: 2
+          items:
+            - const: mhdptx
+            - const: mhdptx-sapb
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is wrong. Previously CDNS variant had two items means it had
"j721e-intg". Now it's something else.

First, this is an ABI break.

Second, there is no explanation at all for it in the commit msg! Looks
like random change.

Read carefully writing-bindings doc.

Best regards,
Krzysztof

</pre>
    </blockquote>
    <br>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Hi
      <span style="white-space: pre-wrap">Krzysztof,<span
      style="white-space: normal"> </span>
</span></p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><br>
      Keeping this patch series aside, The existing binding-docs clearly
      have a bug. </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Since
      even for cadence specific compatible "cdns,mhdp8546" it
      compulsorily expects "j721e-intg" register space </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">which
      is NOT part of the cadence IP block mhdp8546 and hence not
      applicable to "cdns,mhdp8546". </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">This
      was also discussed here [1] and can also be referred in this TRM
      section [2], </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">which
      clearly show that "j721e-intg" is part of TI wrapper IP block and
      should be </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">applicable
      to "ti,j721e-mhdp8546" compatible.<br>
      <br>
      Yes agreed it breaks the ABI but it also fixes a bug and I don't
      see any one using only "cdns,mhdp8546" yet. </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">so
      I am thinking it's more appropriate to fix this as a separate
      patch independent of this series. </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Kindly
      let me know if I should submit a separate patch to fix this bug or
      I should just ignore this bug.</p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Depending
      on your suggestion, if it's agreed upon to send the bug fix patch
      first, I will send out an independent </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">bug
      fix to remove "j721e-intg" for compatible "cdns,mhdp8546" and then
      rebase the series for adding DSC reg blocks</p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">on
      top of bug fix.<br>
      <br>
      [1]: <a
href="https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/"><span
style=" text-decoration: underline; color:#64b4fa; background-color:transparent;">https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/</span></a><br>
      [2]: Link to TRM ZIP:<a href="https://www.ti.com/lit/zip/spruil1"><span
style=" text-decoration: underline; color:#64b4fa; background-color:transparent;">https://www.ti.com/lit/zip/spruil1</span></a><br>
      Table 2-1. MAIN Domain Memory Map<br>
      DSS_EDP0_V2A_CORE_VP_REGS_APB are EDP core register identified by
      name mhdptx in DT.<br>
      DSS_EDP0_INTG_CFG_VP identified by j721e-intg in DT.</p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Section
      12.6.6.16.4: EDP_CFG Registers </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Driver
      use: TI j721e Cadence MHDP8546 DP
      wrapper(drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c)</p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><br>
    </p>
    <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Regards.<br>
    </p>
  </body>
</html>

--------------OH0AgMhyWsRrvVHGonSWrgyY--
