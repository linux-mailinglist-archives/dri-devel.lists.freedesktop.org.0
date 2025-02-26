Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43326A46E5F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B3510E9E9;
	Wed, 26 Feb 2025 22:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="CqdwBf3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7BA10E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740608325; bh=6+ds0fDE230uGEJmCn7EW1JKMdx4MNGD35GrH5IvopU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CqdwBf3UB1FYG6uHtww+aGb8/5OdgV02krxsyJZcuVQLjOzTnKnYfOuYkR1VXs7Ct
 fZDxUrIVkjl1mUzDYTvsB8Oc6I6Ys5P/i3jX4tU8q/vCgDR4RMaJZmxmSGWlbGYbZh
 BAiGNnPn9VpMhKhVsPuNO2/BjwTi3BESUE8Bfd8o=
Message-ID: <ebb3d366-05a2-4ae8-9b50-4b6a76d108a0@lucaweiss.eu>
Date: Wed, 26 Feb 2025 23:18:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
 <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26-02-2025 8:46 a.m., Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
>> it.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
> 
> Discussion is still going. Sending v2 after two days is hiding that
> previous talk, so that makes me sad.
> 
> I am still at v1 and I am not going to review this one here.

Sorry about that. I'm going to be away/not have time for kernel dev for 
the next ~1.5 weeks so I thought I'd send v2 with the updated compatible 
string already.

Regards
Luca

> 
> Best regards,
> Krzysztof
> 

