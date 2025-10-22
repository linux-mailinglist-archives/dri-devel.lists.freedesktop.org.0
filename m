Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B08BFA804
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABA10E6CE;
	Wed, 22 Oct 2025 07:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VGidfkyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A0E10E6CE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:19:22 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51037557;
 Wed, 22 Oct 2025 09:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761117457;
 bh=Z8ZwCkSX/8/aiTv9fav6N9vdybzcbu6o+Lr/dVyzBMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VGidfkyFdjQs4Xkqali8Z5l5zRQs85bEr4mlwVU2ttknMtDtwguMjyeHSHG0X1eeD
 wvT4Av+FK9CL54YTcg8DLc+L0sXV9bvh2LV8Lmqk0KgDMEkEnYtrwfc364QUzjgNzX
 0HBBULOj+w71ZBqFRWGz47VyKZDCtESJPW7L0HQo=
Message-ID: <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
Date: Wed, 22 Oct 2025 10:19:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
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
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 15/10/2025 17:09, Marek Vasut wrote:
> On 9/19/25 7:08 PM, Marek Vasut wrote:
> 
> Hello Tomi,
> 
>>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>>>> "bridge" node (you can just rename the panel to bridge to test). I
>>>>> thought someone (I just can't remember who was it =) will send a patch
>>>>> for it, but I think that hasn't happened.
>>>> Do you want me to drop the bridge part from the commit message (I
>>>> assume
>>>> yes) ?
>>>>
>>>> Any other change I should do before sending a V3 ?
>>>
>>> As we found out, this has been fixed in linux-next. For this, and the
>>> rest in this series:
>>>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Understood, thank you.
> Do you think this 4/4 can now be applied ? The rest already is.

Pushed to drm-misc-next.

 Tomi

