Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A728C86C451
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9310E19F;
	Thu, 29 Feb 2024 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="cP7n2UeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F110E178
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:56:09 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41T4cbCP014616; Thu, 29 Feb 2024 09:55:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=PRClVcFO7m3xuOH5U/cKOHOTQgP4AbIEED6u8ca7mZQ=; b=cP
 7n2UeD+dqWjp2VgHFeaJV7rLqzqvAv/tCpec0uTogLLHJlLCXgW6l2qsPYBcgRPe
 yomymGQy1m8Uq4MwbLXz6IHX0L/PxPqjjKIQ2f71PrrnbCYcs/FFetp1gcfE254D
 SAbww/pouzlgpYMf7G+Org7WIoB8HMQTwl+IKg8dNRY0/x0Q0LsNFIbtNbMLOfXH
 9+iUCSEwSMV0dmt81O9mJvGbcwgYuV8JU2G4Fm21Ty8rsf1Ch0GDRbPKsz9FERgD
 hAB6Wm/LO7QQCDJCRsE9rd898qoCf/k4wxgi4YFoVRf6Odz9JYD/cGiA/KxlEZcF
 LLidL0NXM3ENveByDsTg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4bh934-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 09:55:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 056F840049;
 Thu, 29 Feb 2024 09:55:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADD16249A2D;
 Thu, 29 Feb 2024 09:54:20 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 09:54:19 +0100
Message-ID: <fe3b18a0-c25f-4c81-ba2f-f6daf5eca087@foss.st.com>
Date: Thu, 29 Feb 2024 09:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm-drm-misc:drm-misc-next v2] dt-bindings: nt35510: document
 'port' property
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor@kernel.org>, <linux-kernel@vger.kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20240131092852.643844-1-dario.binacchi@amarulasolutions.com>
 <20240131-gap-making-59055befaf04@spud>
 <494b51fa-0f0e-4c1b-add3-73b5fe0b3c29@foss.st.com>
 <CABGWkvr8RQrUf0Uc+e83qDgqmzUT7OBcS4EDr2DFQnavfRTRDQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CABGWkvr8RQrUf0Uc+e83qDgqmzUT7OBcS4EDr2DFQnavfRTRDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_01,2024-02-27_01,2023-05-22_02
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

Hi

On 2/25/24 10:01, Dario Binacchi wrote:
> Hi,
> 
> On Wed, Feb 14, 2024 at 10:47 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi Heiko
>>
>> On 1/31/24 16:53, Conor Dooley wrote:
>>> On Wed, Jan 31, 2024 at 10:28:44AM +0100, Dario Binacchi wrote:
>>>> Allow 'port' property (coming from panel-common.yaml) to be used in DTS:
>>>>
>>>>     st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>>
>>>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Rework the patch to drop errors found by command
>>>>     'make DT_CHECKER_FLAGS=-m dt_binding_check'.
>>>>
>>>>    .../devicetree/bindings/display/panel/novatek,nt35510.yaml       | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
>>>> index a4afaff483b7..91921f4b0e5f 100644
>>>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
>>>> @@ -31,6 +31,7 @@ properties:
>>>>      vddi-supply:
>>>>        description: regulator that supplies the vddi voltage
>>>>      backlight: true
>>>> +  port: true
>>>>
>>>>    required:
>>>>      - compatible
>>>> --
>>>> 2.43.0
>>>>
>>
>> Do you plan to take this patch in drm-misc next branch ? As I have a
>> dependency with it to merge a DT patch I can take in my tree
>> (stm32-next) if you prefer. Let me know.
>>
>> Cheers
>> Alex
> 
> It's been some weeks, so a gentle ping seems in order :)

Applied on stm32-next.

Thanks
Alex


> 
> Thanks and regards,
> Dario
> 
