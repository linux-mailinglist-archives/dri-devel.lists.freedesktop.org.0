Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CCBFBE73
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC57610E774;
	Wed, 22 Oct 2025 12:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ELfdDuMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFF810E774
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:45:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cs86C1w6Pz9tTc;
 Wed, 22 Oct 2025 14:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761137155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzUax9fdH9Q+7uhR0AVunlAerrb+3qRgdTcqDjLZB2U=;
 b=ELfdDuMbVQr6UZ5kbpXZAF+BVE6RjH4j9m4CisJh3pb2vVCFxQFGIpp16uUrQwTr6BpmDs
 ssXDNc83GNFWOmxcGJ1WJEVXvcM2pDHVNIKI530jYVrfUJ1m2pLiuDKD/Nv9OYrc/404k5
 Fh6AkndoEnddGsDVA5Q1XkBHFf71rQHX+i7HWPbgNPYuHEl2zhQZzT5SFxo079tPfe9Z6x
 y21+8dUG040OfvnBRH1/664SKwdWaMWhWmS7LtPoHoF8Dwz936aurNsKlXDQRTtgM1pd7E
 bs/9jdApzngHo3hbeVsuXXZTzbhjUc1KAVrBLPVGtE3rsnmXbB8gcEatxvsb5g==
Message-ID: <0d809766-36bb-478e-a77b-ed786bfc84d9@mailbox.org>
Date: Wed, 22 Oct 2025 14:45:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
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
 <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
 <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ggjpzsuj5xs3yrwikn5cwggs4wcxzw1r
X-MBO-RS-ID: 6a1016291c5f2f21ca7
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

On 10/22/25 9:19 AM, Tomi Valkeinen wrote:

Hello Tomi,

>>>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>>>>> "bridge" node (you can just rename the panel to bridge to test). I
>>>>>> thought someone (I just can't remember who was it =) will send a patch
>>>>>> for it, but I think that hasn't happened.
>>>>> Do you want me to drop the bridge part from the commit message (I
>>>>> assume
>>>>> yes) ?
>>>>>
>>>>> Any other change I should do before sending a V3 ?
>>>>
>>>> As we found out, this has been fixed in linux-next. For this, and the
>>>> rest in this series:
>>>>
>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>
>>> Understood, thank you.
>> Do you think this 4/4 can now be applied ? The rest already is.
> 
> Pushed to drm-misc-next.

Thank you

-- 
Best regards,
Marek Vasut
