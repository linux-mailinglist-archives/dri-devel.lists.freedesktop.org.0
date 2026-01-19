Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC9D3A2D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08BB10E391;
	Mon, 19 Jan 2026 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="KdVE+e2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784110E391
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:26:50 +0000 (UTC)
Message-ID: <ef7f344b-2c56-46ba-9718-72b490465749@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1768814807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XowlzC+p1/HbYmLkdmabnkTGKmKO4cNKigcp24lQJsw=;
 b=KdVE+e2JCQIkOgvcAERTfuhedah++E3+DZZoZGl3w66Nl35JmOWewhrOp0Hb9/Ik4UghP0
 Ku1wNvp3D0TblcxH6WxSXf23/TaMg79Can9wWaX+6E4fkMjflWy2q5eX9odyUINHN4DE+7
 IfE8od9CTP9In6nUlWHFBhlJ8nhZsjgL8YxxNEXd0iGVJe+xhNbiX6G0b1g0kBg9nhkAqz
 P8/PTRwLc3si1Ey3vIWNP6UZTH+lU1Fi8EutYFd5Yii1HIggo9dcMVt/jRDyaqFqFP37bS
 I4Gue5yBiLZmUQr7b7BHPVfteVitrIv0+46gG+74sgWw8SO4s5yIB5nHd3eMUw==
Date: Mon, 19 Jan 2026 06:26:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] dt-bindings: display: bridge: simple: document the
 Algoltek AG6311 DP-to-HDMI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-4-val@packett.cool>
 <h2vft6wwp7765i7rxtsr2yddnx52a52nv5acfg3l2mm5vmjbz4@d3aossnwdkjf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <h2vft6wwp7765i7rxtsr2yddnx52a52nv5acfg3l2mm5vmjbz4@d3aossnwdkjf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 1/19/26 3:36 AM, Dmitry Baryshkov wrote:

> On Sun, Jan 11, 2026 at 05:35:10AM -0300, Val Packett wrote:
>> The Algoltek AG6311 is a transparent DisplayPort to HDMI bridge.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> index 20c7e0a77802..e6808419f625 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>> @@ -27,6 +27,7 @@ properties:
>>             - const: adi,adv7123
>>         - enum:
>>             - adi,adv7123
>> +          - algoltek,ag6311
> I tried to pick this up and got an immediate error from checkpatch:
>
> -:22: WARNING:UNDOCUMENTED_DT_STRING: DT compatible string vendor "algoltek" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
> #22: FILE: drivers/gpu/drm/bridge/simple-bridge.c:264:
> +               .compatible = "algoltek,ag6311",
>
Yeah, same with the "ecs". I'll include the vendor prefixes in v2

~val

