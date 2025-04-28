Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A934A9F828
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556BD10E67D;
	Mon, 28 Apr 2025 18:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Hgrm6XxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60B010E67D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 18:13:33 +0000 (UTC)
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
 by mail.mainlining.org (Postfix) with ESMTPSA id 4D466BBAD2;
 Mon, 28 Apr 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745864010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzisxXOIvIt99ecAlPMk+mfkIlF+kp2Ehh9SvEPsx/4=;
 b=Hgrm6XxFsLPmkiFUr/E6kZw7iJUUJq7ANQdlFZTDIPiaz1CLld4JQmCo70YsggLEkEFup3
 xzRsbSYVQEBKS6+qUVBrys+IlXb+/I6qy7u0Io7nHRIzzx5n09xF3uL8U7LM+4ib28zfSh
 CaQm7z1QLUQ6th4mgcllmfjvEnNo298ORww9v92JjDtEPIYe+WmMFNw7OVOOZcCjwcsSB/
 3RVWj/xTscwTOOlEXiuSiWxdASHOFOai8B1J/sqdtNyvNgTLexK5EV99xbe4uRLfYoUbI9
 1OW/AJWswZXisUqfY0QZ5pj421KZpnaIxMKs4UTp0ArIDxcnmtyjhLSf0gA3wA==
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 20:13:30 +0200
From: barnabas.czeman@mainlining.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add BOE TD4320
In-Reply-To: <20250428-versed-boar-of-charisma-961cbf@kuoka>
References: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
 <20250427-lavender-panel-v1-1-b2611674166c@mainlining.org>
 <20250428-versed-boar-of-charisma-961cbf@kuoka>
Message-ID: <d838dc2006c52bf6099767a2805ad826@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2025-04-28 11:22, Krzysztof Kozlowski wrote:
> On Sun, Apr 27, 2025 at 11:11:11AM GMT, Barnabás Czémán wrote:
>> Document BOE TD4320 6.3" 2340x1080 panel
>> found in Xiaomi Redmi Note 7 smartphone.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/display/panel/boe,td4320.yaml         | 55 
>> ++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml 
>> b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..65da1c392cafbb7cd3ce32e347fba1b9244c1ad8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/boe,td4320.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: BOE TD4320 MIPI-DSI panels
>> +
>> +maintainers:
>> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
>> +
>> +description:
>> +  BOE TD4320 6.3" 1080x2340 panel found in Xiaomi Redmi Note 7 
>> smartphone.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: boe,td4320
>> +
>> +  reg:
>> +    maxItems: 1
> 
> No supplies?
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
> 
> No supplies? This looks really incomplete.
It works without supplies because BL is enabling them and there is no 
qpnp-lcdb driver yet.
I do not see worth to add them at them moment but I can if you want.
> 
> 
> Best regards,
> Krzysztof
