Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC4937705
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 13:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC84810EBE4;
	Fri, 19 Jul 2024 11:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="wBqBFAtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB0D10EBE4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:12:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J9GNwR009690
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 13:12:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UNW0BvAxj2Pn7uxNn6Z5bxfQwwbcSUhtuOjKXXpCXa8=; b=wBqBFAtxCEAzlN2Z
 PKOnpQwhxVQZY1hRqC3PgavdXo+Os/8Hna7+U+/fdoI18tks6AMuv0AbQ3VbyV8s
 A3hslM9KzTYgrQq7EW2kMLBcgB9wAAPsWjTgoQaL0j3OQzG4OyKY87YRVJj02R7t
 wCW+orfIqGNPsZmxAYZDitBCHsVXgTAOzZOo3Kgn+7vuSLvXXKyM85GR1rXq7pNI
 iujjjAzJbdMyRPY1EGcZXPg//J/i0iWkAdvIIsE9w2/JOdN2vJoBekYqV9d3uAgl
 h6woaoAkDu4ZNm+E4NB6RoE3wtpWS0jk9FGi4OGN8Li9k/HyIw6ztQOPtVoul5uZ
 LQ03RA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40fdwdj3b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 13:12:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AF9BB4002D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 13:12:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EE6F232E7C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 13:12:03 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 19 Jul
 2024 13:12:02 +0200
Message-ID: <c3d0757a-07c0-4f83-9f06-c3ad205aa1e9@foss.st.com>
Date: Fri, 19 Jul 2024 13:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: add COMMON_CLK dependency
To: <dri-devel@lists.freedesktop.org>
References: <20240719075454.3595358-1-arnd@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240719075454.3595358-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
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


On 7/19/24 09:54, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The added lvds driver and a change in the dsi driver resulted in failed
> builds when COMMON_CLK is disabled:
>
> x86_64-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_remove':
> dw_mipi_dsi-stm.c:(.text+0x51e): undefined reference to `clk_hw_unregister'
>
> x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_remove':
> lvds.c:(.text+0xe3): undefined reference to `of_clk_del_provider'
> x86_64-linux-ld: lvds.c:(.text+0xec): undefined reference to `clk_hw_unregister'
> x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_pll_config':
> lvds.c:(.text+0xb5d): undefined reference to `clk_hw_get_rate'
> x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_probe':
> lvds.c:(.text+0x1476): undefined reference to `clk_hw_register'
> x86_64-linux-ld: lvds.c:(.text+0x148b): undefined reference to `of_clk_hw_simple_get'
> x86_64-linux-ld: lvds.c:(.text+0x1493): undefined reference to `of_clk_add_hw_provider'
> x86_64-linux-ld: lvds.c:(.text+0x1535): undefined reference to `clk_hw_unregister'
>
> Add this as a dependency for the stm driver itself, since it will be
> required in practice anyway.
>
> Fixes: 185f99b61442 ("drm/stm: dsi: expose DSI PHY internal clock")
> Fixes: aca1cbc1c986 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd

I've applied your patch to the drm-misc-next.

Thanks,
Raphaël

