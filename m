Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2724BDEEEA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8AF10E7FD;
	Wed, 15 Oct 2025 14:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ApJoSdLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569110E7FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:09:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmtHR3qS6z9v5D;
 Wed, 15 Oct 2025 16:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760537347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe4Cg3XHk9WX/sshl/sHtnnh4SOJatS1Nt7rugFQLpk=;
 b=ApJoSdLY1bjutb57XiLr/4vKS33N2MbZIv+lzF1Tw1O3KqYimZORZhsAxQ1BbzIgaxj5Mi
 zPp+7ZP10rLlK+K5udsvhPAXN0avGNSL9X0PFnbvvcUgT98cKSU0Lr2+C1QfLQkeiOXns/
 6U+W20WlAv9r7In95ZSwJxETQqxmUiQzAqnZB9pqJr/mbcfEiv1HP2mn9oSzVhfTpqJOD0
 83JRyg3aO2qnNmNnmKxNXBvA4JiShfkPf2rH4WK1LGkTI1pv9k6H+lZKCxXqqh+g+UPkTi
 9zoYnBAV0KrxNf8z0Jv/Qpc1g6CSjFrdvPE7BhTo7Wn/MnQrIuX8yRoaKs4mvA==
Message-ID: <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
Date: Wed, 15 Oct 2025 16:09:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
From: Marek Vasut <marek.vasut@mailbox.org>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
 <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
 <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
Content-Language: en-US
In-Reply-To: <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0fb8f56894de275614b
X-MBO-RS-META: g54wzxtnzjkakehm6fai3y4gtt1n71h4
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

On 9/19/25 7:08 PM, Marek Vasut wrote:

Hello Tomi,

>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>>> "bridge" node (you can just rename the panel to bridge to test). I
>>>> thought someone (I just can't remember who was it =) will send a patch
>>>> for it, but I think that hasn't happened.
>>> Do you want me to drop the bridge part from the commit message (I assume
>>> yes) ?
>>>
>>> Any other change I should do before sending a V3 ?
>>
>> As we found out, this has been fixed in linux-next. For this, and the
>> rest in this series:
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Understood, thank you.
Do you think this 4/4 can now be applied ? The rest already is.

Thank you
