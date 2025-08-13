Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3CB256D2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 00:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318610E7D6;
	Wed, 13 Aug 2025 22:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="k2FMaNbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E9F10E7D6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:41:11 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DMf2TB2171409;
 Wed, 13 Aug 2025 17:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755124862;
 bh=uyxszRMjUFHRYO2H8s1R+5W6WN98rFLX3bt4sSaC4OI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=k2FMaNbk56GmaqkPGgUH5jhHQJaJS0qV4yqirOHd7EWW2OjNBa0C7F1nbNxTABv4Z
 cqJyEImGazUoQW/5krB8xLRGsYPReko/NJyK3kOY0pobWsNbLlFrqmIfcLMh/225gy
 wEWTdwaDl48QTqzkkC3ke7VWehfTUQc08baNAGec=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DMf2kb1392339
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 17:41:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 17:41:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 17:41:01 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DMf1392974091;
 Wed, 13 Aug 2025 17:41:01 -0500
Message-ID: <940c1c08-cdfc-46a7-875b-abcb5c24df71@ti.com>
Date: Wed, 13 Aug 2025 17:41:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] drm/bridge: it66121: Add it66122 support
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20250813204106.580141-1-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250813204106.580141-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 8/13/25 3:41 PM, Nishanth Menon wrote:
> Hi,
> 
> Add support for IT66122, which for all practical purposes is
> drop in replacement for IT66121 except for the ID register
> definition.
> 
> BeagleY-AI uses this new part as the old part is no longer in production
> as far as I understand.
> 
> Now, BeaglePlay uses it66121 at the moment, but at some point, it might
> end up flipping over to the new part.
> 
> Quick boot log on BeaglePlay for compatibility check:
> https://gist.github.com/nmenon/6cb8b8a00bcce1755628d131df878840
> 
> Changes since V1:
> * Picked up Krystoff's binding ack
> * Switched over to a vid/pid list

Best of both, looks good to me,

Reviewed-by: Andrew Davis <afd@ti.com>

> 
> V1: https://lore.kernel.org/all/20250813190835.344563-1-nm@ti.com/
> 
> Nishanth Menon (3):
>    dt-bindings: display: bridge: it66121: Add compatible string for
>      IT66122
>    drm/bridge: it66121: Convert the vid/pid entries into a list
>    drm/bridge: it66121: Add it66122 support
> 
>   .../bindings/display/bridge/ite,it66121.yaml  |  1 +
>   drivers/gpu/drm/bridge/ite-it66121.c          | 32 ++++++++++++++-----
>   2 files changed, 25 insertions(+), 8 deletions(-)
> 

