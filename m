Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C0398696C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 01:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047E110E167;
	Wed, 25 Sep 2024 23:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="EYrvypxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DB710E305
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 20:05:04 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5A4FD20F7F;
 Wed, 25 Sep 2024 22:05:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trsbTqBmpoLE; Wed, 25 Sep 2024 22:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727294702; bh=rxEvAK/GRkVetb0C5ec3bgN3bKf21B0o3rbeuLq6tOc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EYrvypxsASewCrHk/GsjVA2OgV7opGfHcjvLR06YTr8Kj6XSvb5AOB8heJgG2vFnH
 yJwHCdNwX6WHcUZfm0RveZG8JMctTDAorkr3j4NQ0nVHJcCIvDmwVp+2/VPyanwRvb
 +uV+gN0Jh2ht4lWMpg3KpYIb8rb2OI8gq0RK4nFwpdbyVjjI3syRGXipskR78sFutf
 jXJXapfeZtZavzalN/GfDohOwSD7YUxBOJRcqLXD1MKWcvjKvkLkHGM1HRZVl+yfNW
 wcBa1IfAzOLiYaTeeobXLrOVq0fUPd4aof4jUgTax1go9dAO+5O0d05sWZYRToEUcU
 BHGL0l/VGtd2w==
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 20:05:02 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss@disroot.org
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
 <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
 <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
Message-ID: <d8f5999921a31d7723e0aa9b12bb9eaf@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 25 Sep 2024 23:21:53 +0000
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

On 2024-09-25 19:56, Krzysztof Kozlowski wrote:
> On 25/09/2024 21:36, Kaustabh Chakraborty wrote:
>> On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
>>> On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
>>>> On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
>>>>> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>>>>>> Add the compatible string of Exynos7870 to the existing list.
>>>>>>
>>>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>>>
>>>>> ... and the DTS is <please provide lore ink in changelog>?
>>>>
>>>> Didn't quite understand. The patch adds the compatible string
>>>> for Exynos7870 DECON in documentation. There's no DTS involved
>>>> in here, right?
>>>
>>> Provide lore link to the DTS submission.
>> 
>> There aren't any DTS submissions *yet* which use the compatible.
>> Is that an issue?
>> 
> 
> Yeah, users are supposed to be upstream. Not downstream.

I understand that. I had plans to submit it in the future.
If that's how it's meant to be done, I'll have to revisit this
submission at a later date then.

> 
> Best regards,
> Krzysztof
