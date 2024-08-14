Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF7952136
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254810E4FA;
	Wed, 14 Aug 2024 17:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="XoFViLeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC210E4BF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=fjWYlXHURzMvazFX69sFcrsxkhMV8rtJ9vxGR6z3YW0=; b=XoFViLeCZOr/NL2+kTMmOrBFdy
 pYfJrUZvoDPdfFQD4rruwBC8ol5JKxOrW1p8nzyPlH6orOOHxIrSdPsQz5k3+haVt4lFVAGMkroHU
 BTSOe5Dd2+iqmCaZyh8yNtHbDMsNuqo+CJM6G821C3Z0GUtjD8nbnkMNbplOFk+LQZpvquQ0xhKi8
 l82v5U5+8GkVDSqyJdKI0+AxXH7qltXC8FKB1rAp6coZCNrdExczp1Il/eTCqiK2ypoFUJLeZ3z92
 sVL0/48WlgqA0ukxzBO4xO1SplXnYYQNRQQxOFzpZ+o4ldKO1EojMxs/A0XfFf+gQSsCdMuxSMqdA
 9SC5zsOw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1seFDN-000ORW-UE; Wed, 14 Aug 2024 16:43:06 +0200
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy05.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1seFDO-0007Id-0O;
 Wed, 14 Aug 2024 16:43:05 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Jessica Zhang
 <quic_jesszhan@quicinc.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add JMO Tech
In-Reply-To: <ec3462d8-e300-4273-9ce5-5380b506821e@kernel.org> (Krzysztof
 Kozlowski's message of "Wed, 14 Aug 2024 16:25:00 +0200")
References: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
 <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-1-22a5e58599be@geanix.com>
 <ec3462d8-e300-4273-9ce5-5380b506821e@kernel.org>
Date: Wed, 14 Aug 2024 16:43:05 +0200
Message-ID: <871q2r5fnq.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27367/Wed Aug 14 10:36:34 2024)
X-Mailman-Approved-At: Wed, 14 Aug 2024 17:32:02 +0000
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 14/08/2024 15:10, Esben Haabendal wrote:
>> Add vendor prefix for JMO Tech CO., LTD. (http://www.jmolcd.com/).
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index a70ce43b3dc0..5d2ada6cfa61 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -758,6 +758,8 @@ patternProperties:
>>      description: Jiandangjing Technology Co., Ltd.
>>    "^jide,.*":
>>      description: Jide Tech
>> +  "^jmo,.*":
>
> Wevsite is jmolcd, so prefix should match it - jmolcd.

Ok. Even though the companies name is "JMO Tech CO.,LTD", and does not
hint at "jmolcd"?

/Esben
