Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFBB447FD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888010EAE7;
	Thu,  4 Sep 2025 21:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="quwR8jsf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cUzuDv8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC9810EAE5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 21:03:10 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHsQ45BFRz9tc9;
 Thu,  4 Sep 2025 23:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
 b=quwR8jsfvnQjtTD8/HQnSbnUWpj2NWzwl0bMcKZ9nc2R/k90VqFtrDIpX8dzwReyHc8BeW
 4EY6ifikPS3E5m6hsKrasLc79GqPCK0GDt5LvujQXWswUqRGK6vRVOxMYI2IeGZlBWjhoz
 eW6Q8UTRjj0SnpeH3H0uBdrUe8SD1OJBb1BrUO6YJiEa9RzVp7tKsftK5Oqg0PwufrzE8S
 BAJBI9iIB4ozswCOaLkkoAnuTqxV19affKZkDoU+24qteN2tGSYIurVujEdpGLGrlBC02A
 a3n/2V98s105qSZ4o0/1FWmssC01D0ct1nKokECMzkd9nQWc2o7TS/TEG2jYpA==
Message-ID: <fe5e8f92-6f53-4bd1-80d6-f27d93f1825c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sCKhfcgyHLiVbYIn51AYNR068gwdjjMoPj7gk9BYRE=;
 b=cUzuDv8BxsNOqajONwHHhcqnezzwr3+44lOS3V44ZgdPmsngmkkI8CujqcmxgHWaWrf3N9
 /ewV0e22UrRiO8RmFQhRUP7mQTKj/xUDfZ3+cRJ8tx5g07NWNhrMpXdOOu5ynBMO83eYCa
 inWY9QDKjn/TrnqRHIG9Oxmtr1C1zEy2LfyO0VG6/RlyO7JSlFPCG7S9F2TFEj36X/0Rhs
 G1ptaN4WObcp9rMgi2Qecrg5eqJ4UwgzBNXcsA824TIoSMfQbNemN1TjVXz54ttlRw7urh
 lj5fVMm5rU2OBDz3YNdFIpBLNPXhPas8SOzR3u2OQnbMBLP2be03KNQb5V10XA==
Date: Thu, 4 Sep 2025 23:03:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
 <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 80edf943af1d9f462a7
X-MBO-RS-META: 17ofh69nbdfj47cie4s645me1csma1jj
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

On 9/4/25 10:23 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -80,14 +83,14 @@ required:
>>     - resets
>>     - ports
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>>       #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>>       #include <dt-bindings/power/r8a779a0-sysc.h>
>>   
>> -    dsi0: dsi-encoder@fed80000 {
>> +    dsi0: dsi@fed80000 {
> 
> As you are touching this, you can drop the label too.
> 
>>           compatible = "renesas,r8a779a0-dsi-csi2-tx";
>>           reg = <0xfed80000 0x10000>;
>>           power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>> @@ -117,4 +120,50 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
>> +    #include <dt-bindings/power/r8a779g0-sysc.h>
>> +
>> +    dsi1: dsi@fed80000 {
> 
> No need for the label (dsi1:)
Both fixed in V2, thanks.
