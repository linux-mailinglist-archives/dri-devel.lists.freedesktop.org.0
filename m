Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1835D6F5B87
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B2610E318;
	Wed,  3 May 2023 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2097.outbound.protection.outlook.com [40.107.247.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8B710E318
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivqduU6GAv+pHYylIsoLzN1gwwOaN+eaLJ87S/lSKbxl6wvVxxYgEgZTpxG6WfPQHKrAq9mQiz9w8Udgpw+rqJ4L0LhEn1iJRBuVy6srCpuqbhlnMM0OyHIbCe++bvioftNOOUStsoqPRXSnjDzDYM19BI0sECFb9eYdAQEUM14+qPP9TVjkRxSVW/MGcMNAFtr/SOW0vCRFn2v0N3eGc8jOCEHIKpUBxDDHG+75QM+myMeeZ/kpP+jzuKMK2DD8cQnjju0FtVpayt4DBrl35BSgexHOxOUMvbH4VT8HSRFEbQmXp+8OVKgUnICIFnPN+IgigQNOm6kfEINDo2a7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsHsLz2agpWrbdHj+OTHjp/RSDGVBL/elqaaaUHs7tQ=;
 b=QInLIEdM98P2j4Ffa757zyNfkrPFtfdK8IoapFRU0Qm+eLOKpvC3XLVKU4nKJHtO+eV8Hb6xpRA1f0DKF00m7sx+qeW/+N53oO/ngFOKFbEJ2X3Yjd1SkA0Zzgq0fMSnBuB0Ek1rFoURx9TWPtUguAhEEPT35P0QTgfbGkDkOH2yIHhz4SlJmCVEvEozSM1WOc884UvmWTuDwN595vtUTud6rk+1ykFRzI1/vdP2Vmi2iqb3jHZyYxNDTvYSpi3xy7gAZvtEzktDFpUu0K11Sx3TTheX98F3D7FZhNWtfI9K43pX7L4oeWAEZRuuQORTZa3V4Qke8mDQFfGSWauzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsHsLz2agpWrbdHj+OTHjp/RSDGVBL/elqaaaUHs7tQ=;
 b=N7gcVgom5FyDrbr7crQ5V7HqU1rHZRR/R6+oxEKRGEletp1iWHWJdRpWc8Z8MhPde7ivMQCWmkDgFy/GLmsN1sUdy+e3huRCHNkBx9dOI6otIHLFqfE5oIp0c6v60lDPS1W4ALljYkiiwgkoVCKLd7lqoYTg7Tqd/P1JavTNe48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM7PR10MB3542.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:133::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:52:02 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:52:02 +0000
Message-ID: <ba50c423-2678-3865-8f9a-907480c9870a@kontron.de>
Date: Wed, 3 May 2023 17:51:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 7/7] drm: bridge: samsung-dsim: Let blanking calcuation
 work in non-burst mode
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-8-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-8-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:208:55::42) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM7PR10MB3542:EE_
X-MS-Office365-Filtering-Correlation-Id: df4ca3c7-585d-4ded-101c-08db4bee55f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +mrNpE7L86tyK9JExy3njjv9KRxqeRIztpyHxuBLjv2oQ2ImyUf9sM/ibdjggxxIHEJ/M06zkRFtjCQPJVF1UnQwIRE7Fl8segIX9l4TC+qmUdE3vkSg7k+6vKMwT55xyjOZntZuhd9Amn8SszUcXNsIZN4ajvSJjFXwJXaswP2MfOuYsS4Pv6FKR0Da3ZZ528TzW3ZmFvwgD6VuKCfw3UHLQ7SoNFRh9me5imL0Bk2BAv9DE3sTwCC/srAFkPktRFdzOLZLrTptnp4QSn3GplTbjvGG9aJ0MX2AWnuKeHOb2cyyfUlplYLVM/ukcAxs5tGx1JElrW2QkzM6WeVCJqfG4kLmjOFQBVUY00/BexAc76YqXB2efd2zNp32OhH04XyEwi+g/PZNRNIT5A83ZZew6jzhO0h/pBRzmVr3GZUNUQpUfFB3/Fx9mpgO5whDWbre1UwIuQwQDH2tmxLeQcvOe48bk3riNCMcQs5ESKWznaI+76AsM8U83cRpwgtiVYV71qcI5J1vcOx5gG6Z1i/NjTiqeO7b5EA0ZIL34p+SX0Xn/DKM7x97nthq48i9ctEPGPt+a3yHl/rirK99NB784RNnrK2PqRDChep9+0iZ2M36J6+7hDJsBKWEMSKOOQ/GywMRBPP62Es2ePNqRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(31686004)(86362001)(66556008)(66476007)(6486002)(66946007)(4326008)(6666004)(54906003)(316002)(478600001)(31696002)(36756003)(5660300002)(83380400001)(53546011)(26005)(6512007)(6506007)(41300700001)(8936002)(44832011)(8676002)(7416002)(2616005)(2906002)(186003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0sxeEZJZ1NFL0xVc1B0dDJHcWpwMFdpK2p4UVc0UFM0cWwzMTRrL0JFSDdJ?=
 =?utf-8?B?ZlhTY0RhMkU0NnI5T1lYdVI5TllCczdTSUM0c3FieXhvT1RaTUxaRlRxUTlW?=
 =?utf-8?B?dVBxa1VMSDVtRTRLOGhvYzViZUFiamF4UXdqQlovdXkyZkdldDVRcVpFcU1v?=
 =?utf-8?B?OGt5OTU1dnV5VTl4eXBCeElVNUVUOWUrRUxMeTZvK1VmSnFHanczbjlRMkJp?=
 =?utf-8?B?ZkpRaVQ1Skw5ZEZRdVo2ejV6bGlWZkc0N2QrMlFkaUVPNStsbDdHZTQzRVdy?=
 =?utf-8?B?N1doYit4UFJTVFFTWUUwZndFVUN0eVJ3ZG9DeXlFTERGMnhQUTZHOWtsdUhy?=
 =?utf-8?B?WHh4S3JlZk5VeWVWNHhJV3hRUmM4QURoVXVvRkN5SWJheGNZTVhOM2VVZVhE?=
 =?utf-8?B?dmxCOHdwVWg1ajQ4d2Q1YXZhVXRhdGtVS0JRMG51WVltQm9iMmZmLzZpSEsz?=
 =?utf-8?B?T2xaT2d4b3dEQ1ZkOSt3aEtKWTNxY05kTUVXRDVlZGo2YnlFcmgyenVucTdr?=
 =?utf-8?B?WUdHY0RtdnBMa1JyOGoyUFdrQ2w0bnlwME9WejY2Y09SZWNBejZNUDlhMnM3?=
 =?utf-8?B?bHNCQ1hIQUpTclBTK2czV1VXL01DWjRGZ1F6aHYrbFA5Z1hqK1Vlc2VzOFNH?=
 =?utf-8?B?S0RWbTd3RFcwSWJ5SzEremlQWlF4UTQ0cUFQRTlGRE5ibW9RYUhwWHhYUUtV?=
 =?utf-8?B?VHphZzBoT0NkRVdqWXExTHd3Mk5CUjNxOVRKS2d6ZnZ5SXFwMHQ1MmpSUU5u?=
 =?utf-8?B?VG9BTHZUZG50eEZhNDJPYzNpd0Rpa0t1NWF2azZyRjlBWUdsOUtyYjlHSmls?=
 =?utf-8?B?VEtMWmNXOUhlMW00LzlacXplYy9MK0ZkbjVyeEpFVVRFTGpXcVNrNzNxd0s2?=
 =?utf-8?B?T2NmazZ1TmtJbmdYZU1pNjVsR0VmTDd3aXB1RjAxSjRSRUl6alROQzZSQ0Ja?=
 =?utf-8?B?Y2hOTnVBRDM2L3FsTkJRcWlJeCt3SWswcG5TT3BQeTdCMjE0TE1OdUdjdjFB?=
 =?utf-8?B?MXdNc0k4QTdBTlVMMlMyajhhNy9RU0RPMjJHMVRYTEY2REVvR1R6SHV4YVVq?=
 =?utf-8?B?REpwUHVCZ2hlVjFhN1VGbEtsSkgvc1dnM1NMRHo4dnFod084WE1LMU9OOEZG?=
 =?utf-8?B?L2ZEZUc2clI1eGtGV2JtSlpOciswQzFVOVNtVUlmUWF3djNrOHJqZ1N2a0g4?=
 =?utf-8?B?QWY0US9jeFNIT25ZdEtJbDRwSHhGaEtQMWJuNmQzSVVPcDFmSURtTnZGVmVK?=
 =?utf-8?B?VXNFTC80WVFCSUpjM1A4YmRzRHpoc1FpMkczLy9pZXFyWFJOT3hSZWd6UUVX?=
 =?utf-8?B?dWZ5YjZmN1pFUEJHeVFaZCs3aGFQeDZpa2FlanVLTkNxOEM1dXlJT0I3QnNn?=
 =?utf-8?B?cHZjQ2NOWXNOazdOWGwxYkwyV1c2SC9pbFJ1dmV5Y2hJb0RRZWpaZ3oyOXhz?=
 =?utf-8?B?YzFTV2NVREpZWFMzbnh1Yll6OFJyTE1zTkpXc28vZEZiVlMwTmNpc01LVmZS?=
 =?utf-8?B?NXloV2FUd0UwaG5LVmRTOHJjcFVLVVBVOVlsRGtXKzhCZDM3bzIrVlpxbHQ3?=
 =?utf-8?B?TzZZNVZXcnh5ckZuT1YzUWVzaGpyL29yaWx5ZGp2SjlLZ0Qyd3MwdERtNlRN?=
 =?utf-8?B?dUFuN3BpVVhUVlI1YVpiU1U0cWJqcFdwMUpnVis2U3dPaWZCeCtXVlgwN2sw?=
 =?utf-8?B?aDFBTnBYd1VNWUpVMC8xbHdsUWFnVzV4c1BIckpvb2FjcGZ0RkMzK0Q2YjNM?=
 =?utf-8?B?RjJwZCthQUt5c0J4M1RmS2VkMkg1RVR5YzdTQ1NlNDMzYk4ydXFuVm1Bblcz?=
 =?utf-8?B?US9mVllML2QwVGJXaFpTWFExRS92TEQrcWhFYkwrOXFZclNSdndIOUcrZ256?=
 =?utf-8?B?U0JoYldKTVNDUHNjQkowY0pJQXNHc3RFbVdRZHhEQlp4dCtycUV0bndxdm94?=
 =?utf-8?B?UkN3clpBWjJhS3kzV3JyeDY1OUJVOUlhLyswUHRYVlZvN3BmeVRoQXpQZ0Fv?=
 =?utf-8?B?NEpHbW9tQ0NRNjNXOVQ1ekc4NkJwQWgwdDRuNW5zaldNVmt2b0xaZk9DVHQ4?=
 =?utf-8?B?bWZOczh2MFF5TnRDVzE0STF4Z25IREQ2ZHJreEVIZHJlNU9GckRvR1EzM1Fs?=
 =?utf-8?B?UHpFWUVYY2djN1VxLy80MjZKNzU3UGk1aXB5OTZrZkVRMVRKTU9qcTVzQ244?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: df4ca3c7-585d-4ded-101c-08db4bee55f6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:52:02.0948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LV8vS+HTHoCFOUH1+jVmGlXrqoEKdpKrD3CwB+XPHY9DfFr7YetwxL2i23WpHYlPT2dW0BCiSkSZy/p5uizRulKS0rCfz2OSNNfnzD5EWLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3542
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> The blanking calculation currently uses burst_clk_rate for calculating
> the settings. Since it's possible to use this in non-burst mode, it's
> possible that where won't be burst_clk_rate.  Instead, cache the

"possible that burst_clk_rate is 0"

> clock rate configured from of samsung_dsim_set_pll and use it instead.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Maybe this patch should be squashed into patch 6/7 as otherwise
burst_clk_rate could be 0 here causing bisection issues?

Apart from that:

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 +++-
>  include/drm/bridge/samsung-dsim.h     | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 53099461cdc2..1dc913db2cb3 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -652,6 +652,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>  		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
>  	} while ((reg & DSIM_PLL_STABLE) == 0);
>  
> +	dsi->hs_clock = fout;
> +
>  	return fout;
>  }
>  
> @@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
>  	u32 reg;
>  
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
> +		int byte_clk_khz = dsi->hs_clock / 1000 / 8;>  		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
>  		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
>  		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index 76ea8a1720cc..14176e6e9040 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -94,6 +94,7 @@ struct samsung_dsim {
>  
>  	u32 pll_clk_rate;
>  	u32 burst_clk_rate;
> +	u32 hs_clock;
>  	u32 esc_clk_rate;
>  	u32 lanes;
>  	u32 mode_flags;
