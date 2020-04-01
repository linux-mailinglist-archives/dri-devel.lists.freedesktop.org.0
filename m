Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFBD19AC3F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 15:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224CD6E087;
	Wed,  1 Apr 2020 13:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479156E087;
 Wed,  1 Apr 2020 13:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjQgrx9BpaWzWPXNiNBAjd/iWyx7HJD0+5EZ2hWqFSrffHbo7Wd4ULDTgJccTft/n6I96i0TFkwGzF2dtcdKOqZN5MaF3a43N2OJaStkkP+Ef9L1BCSLv+jYsFrCJdpTx/UeFoFqFfMoG5myP91RR9C4Fig1fxMiKx2j/Cdwvqg7PU/io96HodY/71Oz7/oAfW3Gn6jCtBvXdoi5V8Ty3L9861oO78BKh/kOR5vpl6kUzNS6/E+uG0ZxarZbwc1BEa3khgkItlnXW6YmDFHyfCjrdGEr/LzVB/1fqbY+NMkUcNioZ2B29l0a57phEi8r6Sgs5h//wy0ABUDPfPjJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNHw1Ps+zj1WjyQ+elWAVl3ZvShNW321engzUGiby9s=;
 b=M+7UtZrCdRjjFVLhR5JqTuJD7ocObLls9VfvoZ4iy9JegZgoHA25utMsQC6nwYkxwyt4vrx2OJgCD7Za5CaBX4RNMr1KYxP0j8cw0CkoscqCPEY+7PoEAhC7plnngdjz+svw4BnaY3EmQNIqYlETaT8PSgzAwWe0Evn7ca43lD+fquER1yNbScXeEzin1Lrd0tG5ayAUnW1akFEpxq0BATJTKZ33Dnx0Zc9/if/JGaq2+gs5EHyTUUgRv3lKl9dbh57VVEZczGRjUusWsY4cd0bVyLnp59MJgWQsuC4qAYns6dttM7F77xeeBWbHPPFCyxUZZmcXJWl2m/kB6x3Umw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNHw1Ps+zj1WjyQ+elWAVl3ZvShNW321engzUGiby9s=;
 b=NfKKnWniKsduIVXbAS9O0KP5EUxZG0mxUGhFx6yyBrpTim/8cxQ0S7dbjkRUZvMswE8S0A5GAUlMc7x+83VFv2G27g+ey2TkW7/DY/7dup0meoo3na1ItAvq3HwQdao9PS88kGji+EfCCmpMPLqsrRA+x4YcOxzm/drcLdyyQOI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3559.namprd12.prod.outlook.com (2603:10b6:a03:d9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.23; Wed, 1 Apr
 2020 13:00:27 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d%5]) with mapi id 15.20.2835.023; Wed, 1 Apr 2020
 13:00:27 +0000
Subject: Re: [PATCH 2/2] drm/amd/dc: Kill dc_conn_log_hex_linux()
To: Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org
References: <20200331212228.139219-1-lyude@redhat.com>
 <20200331212228.139219-3-lyude@redhat.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <48f2037b-1939-2ad3-750e-4ad4601d88be@amd.com>
Date: Wed, 1 Apr 2020 09:00:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200331212228.139219-3-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: YQBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::43)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YQBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20 via Frontend Transport; Wed, 1 Apr 2020 13:00:23 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54c15f0f-2ba6-479d-3090-08d7d63ca582
X-MS-TrafficTypeDiagnostic: BYAPR12MB3559:|BYAPR12MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3559808CEA270CE1DEFCF78FECC90@BYAPR12MB3559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(66946007)(54906003)(26005)(5660300002)(4326008)(31696002)(86362001)(316002)(186003)(31686004)(478600001)(2616005)(2906002)(16526019)(6666004)(956004)(52116002)(16576012)(53546011)(81156014)(8936002)(36756003)(66476007)(81166006)(8676002)(66556008)(6486002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOx9PHq0zebnzeU4KHLeFDEnr6P4sVr5/25/SHcKpX+/WUiLbcYZKPhYR9OfPuGyh+HYW0ZilPDdPXKgy6PoaH2wJYdAXrGVlAfGFhmRaOProj6Un4MR6yl6BY11xk+OpMRXFFQX3CA+eiRKJaEJtJ7pI+mXb51KiHwWWg6Y5AyGxJTO+Z5K+x6xT2bChA/cvpSNq3pqa+tOAdVQEps4G9K/8u7AEtweRqVbp66iGTAhaHRFep6F5w54Pd6O4xcGBCq3tVh4KGmUr4C8Fyhusm88LL3XgbURdRVM6aaVt7oXf15BTOHUg3QKVGT8CHwh1T9BjceT1Q5qmu/yHcfgRB6aEQYrpI1Gx1uTvS9j3aS0qKaPYiKYF59in3NIRGAykLm1ImaPbHHUxmyibbFA0Lkr2/XwfXwUzfB/Q9Q22FXn64+VTkY2vQSC87fqyxPT
X-MS-Exchange-AntiSpam-MessageData: RS9M8KauP4/LZTA8x7k+8WMrJGNeav+93iSFapZbBYwCZFDmuvk9n5hzir2Jwq5G1xIWkkr1/ijWDaTDXUeB4fuXZe6xPtazEfJd8qbjkiYzd6a8j5LcsPUTRZE7MdaE8V2Rvlp06GRmFT9vqBV8VQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c15f0f-2ba6-479d-3090-08d7d63ca582
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 13:00:27.0272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb9G4HEIL4az3xhhhw3v0IlS3p5KP6BnT6i56Z0SoKzJL0F4SGXQLe28wQz3vB1D3PmQ3OmM3oaJHRQmMJj9qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3559
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Wyatt Wood <wyatt.wood@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-31 5:22 p.m., Lyude Paul wrote:
> DRM already supports tracing DPCD transactions, there's no reason for
> the existence of this function. Also, it prints one byte per-line which
> is way too loud. So, just remove it.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Thanks for helping clean this up!

Series is:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Regards,
Nicholas Kazlauskas

> ---
>   .../gpu/drm/amd/display/dc/basics/Makefile    |  3 +-
>   .../drm/amd/display/dc/basics/log_helpers.c   | 39 -------------------
>   .../amd/display/include/logger_interface.h    |  4 --
>   3 files changed, 1 insertion(+), 45 deletions(-)
>   delete mode 100644 drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/Makefile b/drivers/gpu/drm/amd/display/dc/basics/Makefile
> index 7ad0cad0f4ef..01b99e0d788e 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/basics/Makefile
> @@ -24,8 +24,7 @@
>   # It provides the general basic services required by other DAL
>   # subcomponents.
>   
> -BASICS = conversion.o fixpt31_32.o \
> -	log_helpers.o vector.o dc_common.o
> +BASICS = conversion.o fixpt31_32.o vector.o dc_common.o
>   
>   AMD_DAL_BASICS = $(addprefix $(AMDDALPATH)/dc/basics/,$(BASICS))
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c b/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> deleted file mode 100644
> index 26583f346c39..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/*
> - * Copyright 2012-16 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - * Authors: AMD
> - *
> - */
> -
> -#include "core_types.h"
> -#include "logger.h"
> -#include "include/logger_interface.h"
> -#include "dm_helpers.h"
> -
> -void dc_conn_log_hex_linux(const uint8_t *hex_data, int hex_data_count)
> -{
> -	int i;
> -
> -	if (hex_data)
> -		for (i = 0; i < hex_data_count; i++)
> -			DC_LOG_DEBUG("%2.2X ", hex_data[i]);
> -}
> -
> diff --git a/drivers/gpu/drm/amd/display/include/logger_interface.h b/drivers/gpu/drm/amd/display/include/logger_interface.h
> index 6e008de25629..02c23b04d34b 100644
> --- a/drivers/gpu/drm/amd/display/include/logger_interface.h
> +++ b/drivers/gpu/drm/amd/display/include/logger_interface.h
> @@ -40,8 +40,6 @@ struct dc_state;
>    *
>    */
>   
> -void dc_conn_log_hex_linux(const uint8_t *hex_data, int hex_data_count);
> -
>   void pre_surface_trace(
>   		struct dc *dc,
>   		const struct dc_plane_state *const *plane_states,
> @@ -102,14 +100,12 @@ void context_clock_trace(
>   #define CONN_DATA_DETECT(link, hex_data, hex_len, ...) \
>   		do { \
>   			(void)(link); \
> -			dc_conn_log_hex_linux(hex_data, hex_len); \
>   			DC_LOG_EVENT_DETECTION(__VA_ARGS__); \
>   		} while (0)
>   
>   #define CONN_DATA_LINK_LOSS(link, hex_data, hex_len, ...) \
>   		do { \
>   			(void)(link); \
> -			dc_conn_log_hex_linux(hex_data, hex_len); \
>   			DC_LOG_EVENT_LINK_LOSS(__VA_ARGS__); \
>   		} while (0)
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
