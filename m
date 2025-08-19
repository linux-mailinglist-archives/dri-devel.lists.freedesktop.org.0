Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACBB2B943
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1710E530;
	Tue, 19 Aug 2025 06:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NI3MFEjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4010E111
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 04:55:02 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J4snJb3233182;
 Mon, 18 Aug 2025 23:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755579289;
 bh=OA7Xl2y9m1pGQhcLJLJihjo9327iQyBxjRtMkAYl/Ds=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=NI3MFEjNMvGKVWrZLebUVp6djYQaBJ15aVESCGAARYSOtT4UF9jSmHoT2EuZ2RDCm
 Pnm0lk2Rii7Mqt2CbfVTleHQ6uE3WV5oTaa2zUGmXoNuqPth+7mYGV/zVOjuljt3ML
 SWEOh0eI8+fEpfp6qZMnc0TuabubpyMEibQmcJII=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J4smI4332746
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 18 Aug 2025 23:54:48 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 23:54:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 23:54:48 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J4sfiG2430521;
 Mon, 18 Aug 2025 23:54:42 -0500
Message-ID: <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
Date: Tue, 19 Aug 2025 10:24:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
To: Harikrishna Shenoy <h-shenoy@ti.com>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250818154746.1373656-2-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 19 Aug 2025 06:15:29 +0000
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


On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
> Add RPi DSI panel[0] as a valid compatible for simple-panel.
>
> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1ac1f0219079..65f486f2bc9d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -268,6 +268,8 @@ properties:
>         - rocktech,rk070er9427
>           # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>         - rocktech,rk043fn48h
> +        # Raspberry, 7" dsi panel
> +      - rpi,7inch-dsi

Hello Hari,

Driver changes should come first to match new compatible before device 
tree changes.


>           # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>         - samsung,ltl101al01
>           # Samsung Electronics 10.1" WSVGA TFT LCD panel
