Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA63B253F8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 21:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC1E10E798;
	Wed, 13 Aug 2025 19:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="S1eTEko5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B785E10E798
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 19:32:55 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DJWmAU1716526;
 Wed, 13 Aug 2025 14:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755113568;
 bh=DP9g1YaqAXl0Ni9gsYFNtLPP9+dGOYc408wFaAfyNxk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=S1eTEko5c2sZbfSUg6KnuhOl17TYUJOCUJlWkOy0ytuw1KEQtzWIYVR/17Zm52U/Y
 Z4XCh/E1/DuCFmzHizFEZYlEIELlYyR2Fssp6Tbb0E4rAFr6bja9ZlIIgAX3trhAeE
 PXLDnKHbXe5AaAeWlOWwJID8gzemcIMIqp1SskWU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DJWlfB612929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 14:32:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 14:32:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 14:32:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DJWkYE2476900;
 Wed, 13 Aug 2025 14:32:46 -0500
Message-ID: <4c6a7db0-dc75-4ed1-aeae-418fa004ea53@ti.com>
Date: Wed, 13 Aug 2025 14:32:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: it66121: Add it66122 support
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20250813190835.344563-1-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250813190835.344563-1-nm@ti.com>
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

On 8/13/25 2:08 PM, Nishanth Menon wrote:
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
> An alternate implementation could be to drop the revision check or make
> it66121 check include alternate ID check.. but that seems a little
> non-standard.. Anyways, I suppose mediatek platforms will face this
> problem as well at some point.
> 

Hmmm, since these boards will probably have to switch parts mid-production
it would cause us to need to have a new DT with the updated compatible
just for a otherwise transparent revision. Might be better to just
loosen the PID check so the alternative part work just the same.

Andrew

> Nishanth Menon (2):
>    dt-bindings: display: bridge: it66121: Add compatible string for
>      IT66122
>    drm/bridge: it66121: Add it66122 support
> 
>   .../devicetree/bindings/display/bridge/ite,it66121.yaml   | 1 +
>   drivers/gpu/drm/bridge/ite-it66121.c                      | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 

