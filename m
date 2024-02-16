Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FD8579EC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A8D10E530;
	Fri, 16 Feb 2024 10:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="H1B0V7in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477E010E536
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:07:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GA7cWK042769;
 Fri, 16 Feb 2024 04:07:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1708078058;
 bh=dLTLIlAYxcZ5PaqaE2ofqGOyAZiVCTA/khFLfSDc5Uk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=H1B0V7inKaD6BhKKMurdxr7YCdPnGyb+4K75vF5C8W77fbEfM9rYpxFqj+Y+rFuYk
 FI7oV+vHtQ/zDgVf2bI3CGbL7x2tlQJJsLlhf4/oEjLcPOikDMoLQwOPrREJd2zcEn
 RdcL23YUhHzJUrJvo7aCgpe7KcFP+qBjcPjyRDP0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GA7c0B053980
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Feb 2024 04:07:38 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 04:07:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 04:07:37 -0600
Received: from [10.249.128.244] ([10.249.128.244])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GA7UrK096668;
 Fri, 16 Feb 2024 04:07:31 -0600
Message-ID: <8a481b57-d55a-44e3-a38e-8dbad3cc79a8@ti.com>
Date: Fri, 16 Feb 2024 15:37:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add common1 region for AM62, AM62A & AM65x
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <j-luthra@ti.com>
References: <20240216062426.4170528-1-devarsht@ti.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240216062426.4170528-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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



On 16-Feb-24 11:54, Devarsh Thakkar wrote:
> This adds DSS common1 region for respective SoCs supporting it.
> 
> Changelog:
> V2 : Remove do-not-merge tag and add am62a dss common1 reion
> V3 : Add Fixes tag to each commit
> V4 : Add Reviewed-by tag and AM62A SoC TRM Link
> V5 : Split dts patch to separate patches for each SoC
> 
> Devarsh Thakkar (4):
>   dt-bindings: display: ti,am65x-dss: Add support for common1 region
>   arm64: dts: ti: Add common1 register space for AM65x SoC
>   arm64: dts: ti: Add common1 register space for AM62x SoC
>   arm64: dts: ti: Add common1 register space for AM62A SoC

For the series,

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya


> 
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   | 5 +++--
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                  | 5 +++--
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi                   | 5 +++--
>  4 files changed, 14 insertions(+), 8 deletions(-)
> 
