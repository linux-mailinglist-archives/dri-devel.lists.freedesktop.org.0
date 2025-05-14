Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3AAB6E2E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 16:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318C10E26A;
	Wed, 14 May 2025 14:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Xq6TwNBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (unknown [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415610E26A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1747233085; bh=Gcj5nd9FKHE5cWwXkk4NEvyBItenXrqDWNZrSF1XmE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Xq6TwNBabd44lFs7H9hpcoAP3rrASWp5S/QzAT8JaEA+NYJMgDo3zyHOG63vfh1ZP
 rUxXUn75tginS46bGlHBNU3fe6Bp45qnObhDeqn/2pUOOfSJy18R371QoZ9Ukrk+cM
 jS+T/0Q5LbUaJrDIg3l51w9FMnYz4mCZ/IsP4ezk=
MIME-Version: 1.0
Date: Wed, 14 May 2025 15:31:25 +0100
From: Luca Weiss <luca@lucaweiss.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
In-Reply-To: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
 <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
Message-ID: <932d5cc223f8d1ff1bb09c68990e4a82@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

Hi Krzysztof,

On 2025-02-26 07:46, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN 
>> using
>> it.
>> 
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 
>> ++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>> 
> 
> Discussion is still going. Sending v2 after two days is hiding that
> previous talk, so that makes me sad.
> 
> I am still at v1 and I am not going to review this one here.

Apart from [0] there was also no other activity in v1, could you take 
another look now?

[0] 
https://lore.kernel.org/linux-arm-msm/emwpl2e7zpzkm4uea22g4hayz66nk7nxylinsd2stuwlatwdc3@ixkbc2bxbz4p/

Regards
Luca

> 
> Best regards,
> Krzysztof
