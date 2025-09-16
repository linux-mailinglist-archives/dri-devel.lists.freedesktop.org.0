Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A59B59035
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7D610E30F;
	Tue, 16 Sep 2025 08:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="t0CSi7sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D356D10E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:18:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cQvt04SNgz9v0s;
 Tue, 16 Sep 2025 10:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758010696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/vF9UevhN6ZN5SGz1v+nHr1RKJ6dgc+bwkrlLnvagw=;
 b=t0CSi7sKDbYEv/8E/fYWlpoeQhtYkjgg15cupEZz1ZelEuN/+K++lgwpYrhM2eEMnrM0aB
 jDIDxDgeF6whui0P/JMjnOWFwTz6C6+WVD5fcJbvICH8ZublcO44VYkn3y0Mr93AbaNmqC
 Y4KQ9Bsq1sjVH3+iPjH20pmCgdHy68z/1jglFAI3GaAU7VuxfViNLLtGYTxCWzxTCMDFtp
 W+m8I+fAtbompRrDvSKNL/fJ+mGKByEJF5GUmOf+NLWIDuvl47D+hOR4SnEq0Ezvk/0lw7
 k618WFUwhYzomjqJACwML/2Qo9DQE85oRJ3yo2TLkq2rbgoBBfL4fod5cxeIMQ==
Message-ID: <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
Date: Tue, 16 Sep 2025 10:15:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
 <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b32751bbdc6a1c7e7c
X-MBO-RS-META: fjk88fwxmddi989pozr1d4cfss6c996q
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

On 9/5/25 9:51 AM, Neil Armstrong wrote:
> On 04/09/2025 22:01, Marek Vasut wrote:
>> The ILI9881C is a DSI panel, which can be tied to a DSI controller
>> using OF graph port/endpoint. Allow the port subnode in the binding.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/ 
>> ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/ 
>> panel/ilitek,ili9881c.yaml
>> index 434cc6af9c954..cf0aa996e072d 100644
>> --- a/Documentation/devicetree/bindings/display/panel/ 
>> ilitek,ili9881c.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/ 
>> ilitek,ili9881c.yaml
>> @@ -30,6 +30,7 @@ properties:
>>       maxItems: 1
>>     backlight: true
>> +  port: true
>>     power-supply: true
>>     reset-gpios: true
>>     rotation: true
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Would it be OK to pick this one up via drm-misc (and possibly also the 
other ili9881c RPi 5" Display 2 patches), or shall I wait a bit longer ?
