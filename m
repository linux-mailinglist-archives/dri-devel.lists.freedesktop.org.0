Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF51B3A522
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F24891D1;
	Thu, 28 Aug 2025 16:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="nXKed/BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ECF891D1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:00:24 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SFxaSH1602979;
 Thu, 28 Aug 2025 10:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756396776;
 bh=+aFMOvBq3ZFq1Tp80wQe4r/4UlP4tivV9Yfs3oQewgA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=nXKed/BJz57kpGyG/xMvntEONI589vf4HWNcl5lJfnxVAX9SNZCchCmxqroXc29R5
 QD5YCxWpKHNoaU+qm9u/9BP5NOzfa5ImkWDlf65UPjAJmbi4TJvvrB+7XKpoEuAJhw
 EL2iWs1NcEj8yaUF9Yj40ysOEUthbDhikPYypTO4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SFxZ8I3570839
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 28 Aug 2025 10:59:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 10:59:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 10:59:34 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SFxTKv593218;
 Thu, 28 Aug 2025 10:59:30 -0500
Message-ID: <670a6d68-3011-4241-a2f9-fd23373dcb43@ti.com>
Date: Thu, 28 Aug 2025 21:29:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Decouple max_pclk check from constant display feats
To: Michael Walle <mwalle@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250819192113.2420396-1-s-jain1@ti.com>
 <DC83F2197OLI.2KRLEH7GUBKSA@kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <DC83F2197OLI.2KRLEH7GUBKSA@kernel.org>
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



On 8/21/25 17:39, Michael Walle wrote:
> On Tue Aug 19, 2025 at 9:21 PM CEST, Swamil Jain wrote:
>> In an effort to make the existing compatibles more usable, we are
>> removing the max_pclk_khz form dispc_features structure and doing the
>> supported pixel clock checks using "max_successful_rate[]" and
>> "max_attempted_rate[]".
>>
>> Changes are fully backwards compatible.
>>
>> After integration of OLDI support[0], we need additional patches in
>> OLDI to identify the VP that has OLDI. We have to do this since
>> OLDI driver owns the VP clock (its serial clock) and we cannot perform
>> clock operations on those VP clock from tidss driver. This issue was
>> also reported upstream when DSI fixes[1] had some clock related calls
>> in tidss driver. When "clk_round_rate()" is called, ideally it should
>> have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
>> clock is owned by OLDI not tidss.
>>
>> So add a member is_ext_vp_clk[] in tidss_device structure to identify
>> this and avoid performing clock operations for VP if it has OLDI panel.
>> For the same checks in OLDI driver, atomic_check() hook is added to its
>> bridge_funcs.
>> In the atomic_check() chain, first the bridge_atomic_check() is called
>> and then crtc_atomic_check() is called. So mode clock is first checked
>> in oldi driver and then skipped in tidss driver.
>>
>> Had the tidss_oldi structure been exposed to tidss_dispc.c, we could
>> have directly checked VP type in dispc but since the structure is defined
>> in tidss_oldi.c , we have to add additional member to tidss_device
>> structure.
>>
>> [0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
>> [1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/
> 
> Since that wasn't picked up from v4:
> 
> Tested-by: Michael Walle <mwalle@kernel.org> # on am67a

Hi Michael,

Thanks for testing the patches. Sorry, I missed T-By.
Will add in v6.

Regards,
Swamil
