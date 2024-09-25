Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AED98696E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 01:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245910E86D;
	Wed, 25 Sep 2024 23:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="EYVjzcmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE4310E069
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 18:42:57 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 55A9523D1B;
 Wed, 25 Sep 2024 20:42:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66obs_xSAmAR; Wed, 25 Sep 2024 20:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727289775; bh=iH3kv/Fhc3qp7AndKlRXmww1+0hDdkL2ol8oXq9fdgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EYVjzcmTrWkOV3fPFDqE6lG0O8exqtCr6cEZ40KYnLYm8mx9ZzSwSrSnwWHXf5JM9
 YxCjWJkBHSCySmZVbKPakgV7+0FCyylObZH9LsY5Qj3sQYS2ivDkFsvc+hnguzPbGx
 gVG/L2KambHRNn13IJktK5RidJffO+z5g+5grdbmfpsU7u4PA4HDhmwts+F7YEtbxw
 hvJUyoQJJcP+sMq5RzuP7y00iU9IdJLwK/5AS3rg0cingNR4G/JrMAoAuZ48/7hz6C
 amWZNfoz/7tNQiv8CTqvL+Dn0tgIjbjg0ppmZx/HBCXW7plYFpK4K6jLfM8dxH28ta
 G1vbnv8g7fang==
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 18:42:55 +0000
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
In-Reply-To: <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
Message-ID: <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
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

On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>> Add the compatible string of Exynos7870 to the existing list.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> 
> ... and the DTS is <please provide lore ink in changelog>?

Didn't quite understand. The patch adds the compatible string
for Exynos7870 DECON in documentation. There's no DTS involved
in here, right?

> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
