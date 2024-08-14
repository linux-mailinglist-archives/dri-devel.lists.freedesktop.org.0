Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0110952134
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A9D10E4F9;
	Wed, 14 Aug 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="qNjn7tNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94F810E4CF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=+Q3KV87gK1VRLxAD2pzYYpy3QuJKu3N0u85aamBDwjM=; b=qNjn7tNL1177aSnVJPjd4RZG13
 gxY/c6lFQRQMY9b9vgk7eDl9g1MsdiApc0NVOoh3KpB1c55ulob78MsotM8erb6LmHwt4wLbn/2A/
 vMf4HBf45epu1zC5NvX7GnSzIDbI6NyXELRsjtsE7uP5QjxCC5j+gqUMITW/Lg1VPb2yUg5YSLXMD
 9jdA8Gmn1/LSuh2P966D8axTCqTBoUqDu8e+xXp+SdGth9zzN+XYPDyr5SIRVuGoNikEc8jDK7Qpx
 P7//z+ebF0Ghdtvm6jPuTD+HtQKlIxSQxUMN4EH7BgZ00efNBHfcpr823JuubKZ9G+zfX4+mBS96k
 4w3QVT9w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1seFun-0006UH-QI; Wed, 14 Aug 2024 17:27:58 +0200
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1seFun-000J8C-0e;
 Wed, 14 Aug 2024 17:27:57 +0200
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
In-Reply-To: <97f60cd3-1433-4dc5-9dc4-ad9a53c1b35a@kernel.org> (Krzysztof
 Kozlowski's message of "Wed, 14 Aug 2024 17:26:49 +0200")
References: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
 <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-1-22a5e58599be@geanix.com>
 <ec3462d8-e300-4273-9ce5-5380b506821e@kernel.org>
 <871q2r5fnq.fsf@geanix.com>
 <97f60cd3-1433-4dc5-9dc4-ad9a53c1b35a@kernel.org>
Date: Wed, 14 Aug 2024 17:27:56 +0200
Message-ID: <87wmkj3z0j.fsf@geanix.com>
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

> On 14/08/2024 16:43, Esben Haabendal wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 14/08/2024 15:10, Esben Haabendal wrote:
>>>> Add vendor prefix for JMO Tech CO., LTD. (http://www.jmolcd.com/).
>>>>
>>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> index a70ce43b3dc0..5d2ada6cfa61 100644
>>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> @@ -758,6 +758,8 @@ patternProperties:
>>>>      description: Jiandangjing Technology Co., Ltd.
>>>>    "^jide,.*":
>>>>      description: Jide Tech
>>>> +  "^jmo,.*":
>>>
>>> Wevsite is jmolcd, so prefix should match it - jmolcd.
>> 
>> Ok. Even though the companies name is "JMO Tech CO.,LTD", and does not
>> hint at "jmolcd"?
>
> We use domain names as vendor prefixes, so when another "jmo.com" comes,
> they will get "jmo", not something else.

Ok. I will change it for v2 of the series.

/Esben
