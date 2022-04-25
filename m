Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B6950E06B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 14:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695910E78D;
	Mon, 25 Apr 2022 12:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDA710E77D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 12:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQCbwOIuMitwlYedMCporA1QK/lBuArJnzXW2UwJhZKJq1SZ6Cj/Eh20R6SDJ4LigG9AIdDiIxIaBRUf2pwbX3njsXiLcMdeGs6Bl+UA9XBi3jwZnvnLkbFLgyb6JEdm8FW3k9gFnBmxNrn/gyT5isGb8CMr5hrPcbp+w/jJWsDdkwR+nH3mQiWEKs1sgG9cVqADH84BSfM6BeoQ3Wlfge8mbAsgAtrVfCN64rF/A9eCuzeEoWkP/5DjswtxAkLTAY9w6ZNGkgWprZPNECHjBv1PHHwNuzblhkmSZlvzpw6oetPzWPDcYRs3Plo47TB/AFw6s9RjVes4WeBdCGHzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoFd5qM+vL4vBr607owBAsnry3pY8bKDGikthNxf/0E=;
 b=PVY6AeRtvyFMBkeCo60w8GTGEnb99azVZbCHQCedPYfijrPyQRMLM6L0IbfRXe38+S9bmTaqrX5hzJlEw5TPGqAS2q0nbB5gwxWZtkRVfKKgynLBbi8lWuHomar1t2ScS1/dCsBJ98brpJHqnfqkQLb0pkUXyugViIuTDH6aWCVZGximUAtdVztdSa2XID90ZWbKvfgC5y70vUnS9kpJRt4e99/V1gaVuFn4WlRGzUqvVJRFK3bYYsmSx0f3RbjgJvTLvhf8F4ihnv6Wt0tH5TSJ9pvIPyn4iBW+ow5G/TBLZOmrAO1PoWl1jGbO9e0yfT9NWPwCI9B/CXthoTRg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoFd5qM+vL4vBr607owBAsnry3pY8bKDGikthNxf/0E=;
 b=lvBiiA85ZIpp1pUKKArJTLPK2isfrQZRgUzixqDKe2nQEkfVMoRFDCgkF42v7Tm14BhyiZPkWAsDFMm9Fnf7KjzKTr57AdeT6p2fV1AhBsyjXpsVhlQJf3bovufh5ibfgkvLp8jiHi8Awow5lbeh2sIQ8ZakwOdYZcU8/bYSokQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by DBBPR08MB6041.eurprd08.prod.outlook.com (2603:10a6:10:206::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 12:34:33 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::3de2:62a:3915:9d6d]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::3de2:62a:3915:9d6d%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 12:34:33 +0000
Message-ID: <089aa1bf-38e2-ec90-f683-5f23d703c4f7@wolfvision.net>
Date: Mon, 25 Apr 2022 14:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20220422072841.2206452-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0056.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::7) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e8322a2-c3b4-4ecc-9417-08da26b7f348
X-MS-TrafficTypeDiagnostic: DBBPR08MB6041:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB60412CFCF4C762112FE0CEDCF2F89@DBBPR08MB6041.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yquYbxqhagI9FuD+tgFyp3KVSQ6Y+lO5+QA3xMdQZVQsFP/pxroBqsZM2uGarO4d4KZlq24UXs5W86pcpTWrqbs8Ak8ji53R8IDmoNZk+QVm9W+8EMDKu4PQNnM3aRDJRyiq/kpc63bRHPrwNJY3ueoJ+rVsNs19+xRjzC2zVKCuhbLDfpnS9PzVhiiApjPLvhzmZzVeq/D3vdPC4DKdrIM1rvaGKAeaVQ4nZXsDO2wJ/fg2VcHX7CnubhRwCaDdpYgrhr+a7Rsfnq3uLNZ+4gry8suFk7B39x3kQjcYLg0tSvG+miGIA2RGiVik0jodAid0lYE6vDRt9fNffZ+7yPboxWFzlRJsZmVXEJPc7PKkPQwNh1as1BXrI0nDoZRjtG73xnBxJWOq6xrVSIr4CpaT1Hi5/KpID7pf3hVkIJCMGKHZrc9IgQzqNJMx+edjb5JB9R7UaR0Rbfn4FvwLCGwuLy4OdyCjigCbn87uB6PW5Xyf7CoX15HJkEcbIwUbg0tPAo6f4nx0Gjii2cLubUde06EoHBbrfWDXHBfHv/sbOWDkvufruOWXcKfVk9uBDRR+pNc6zHFN8tpdKiDFfevZVClUXsAbGlZFFDBL3ekKA0IiBPYSRal/9NREUITUZaw0cPW1j0t4RpKjHwhrRs3FbNnPKfpMSFFcPqwHngc5lw6/V0JERzHgQLfGnZbyrqlETDig5nHOMekCFxm485gVG43spuwUCI3FDcYdshk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(346002)(136003)(396003)(39840400004)(366004)(66556008)(66946007)(38100700002)(66476007)(316002)(83380400001)(6486002)(6512007)(54906003)(53546011)(86362001)(508600001)(6506007)(31696002)(186003)(2616005)(52116002)(2906002)(5660300002)(44832011)(8936002)(36756003)(7416002)(31686004)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlA5ajY4RjNacEsvNjJCM29CQ1hHL2xsQWU4S25HR1R2Y25GZ2tORDYrMmR0?=
 =?utf-8?B?Y1lVem5OMXp1NlVrQnFPOStoWEdXT01zR1BrMWl3TjdRYzIxQmkvZys4NkJy?=
 =?utf-8?B?K2xTMmxaQWg4WDZkU3dGMWRSc3gySFZteXVQL1VyNENvU00wNFFoMDVCN3Nm?=
 =?utf-8?B?RTR2WWwrYmlzVG9QaTFDOVpLcm4weWk5Wi9ySS9iOFhYbjcweWY5U2VZKzJr?=
 =?utf-8?B?d3NYVjJnSzhlM2E2dThsOC9TWVA1R2ZzQVJOenNnclhkMDZuUzF4Z040VnlG?=
 =?utf-8?B?Q2xTTVFJVzRHcHFNM0E0ZGtMZHVWVnZNemtld29adFVjVDFoanJaMUoyQ1VL?=
 =?utf-8?B?Z1JxdHJVck1LendLN2I5eGNLN0o0d3pXUlBNVXpSbzdLbzRJMTFIYXM1N3gy?=
 =?utf-8?B?RkN3U3pqUWxzWGM2S0FNcEYvcUkwbDRGTTZNY2g2aEJJRkZHand0OFd5bkJn?=
 =?utf-8?B?MjNsTFZtcmVaSFRPZjNEcFd0ZTFPNVRadnhaL2dkV2FzMENHNGFaQjVqTm1M?=
 =?utf-8?B?TDB6YS91MllpV0pRZ0xxTGliNDUrYnZTcGNEMHNvN0pURW5rUFNyQkxQZVBy?=
 =?utf-8?B?KzVSYXRyQkYyNFVqTGQrOThLaDlZL093OGJuMU5kRTBlaFErbEx1aUVObEFh?=
 =?utf-8?B?Y25aMVcrMmZQeFhQYnp4cDlZbVZrY0VyRURHTEtCVnpQS2s1bGZEUHZEa29B?=
 =?utf-8?B?dUJMejJQbjhzQ3ovL2t2SzFnS1RtaHNSdjdsckpqNzdReExVSUVxNXBFY0Fy?=
 =?utf-8?B?R1djNlk1emlaNnRwSkhhc2VENnU1RU9waXlmV2pTNUNTVlJvNEpwbHRVTEFs?=
 =?utf-8?B?WURhVk9aemdiMDVweDRQNk05ajFQY2ZHTEprUk9aYlhCUlFkMjJWc3pwSGxR?=
 =?utf-8?B?SmgzQW5zT2hyZUtyMVZibkNpWWhNdWlXSFVZVVZseFRRV2FFTGlxemxYY042?=
 =?utf-8?B?TFcrZFJLR3IrY3hrODlnM2ZTcHY1N2llaVdkcUcrZi8vWjdOeHV5RXQ5N0o0?=
 =?utf-8?B?L2dwQ0pUYkpjOUJhYTR2NTNjYnhoMU9ZVzB0RTl2bGRxbklnYjJxYnVKOVdn?=
 =?utf-8?B?aHpwa0tUd0lnVmhVYlMyWWllMjNpWDZsN3lycEdxRy9FbmxoZmV0Y0thdllu?=
 =?utf-8?B?TVBWa21oeW9aQVArNUh1dlh1b3BpcHNkMHJOa2M5WUc1MGh3R1J3QkdwVDgv?=
 =?utf-8?B?NHZDcVZDejVXVzJKVGVqalZqeXlPeDQzSG1ZYnlOL1U2b201TmF1T2VrTFdK?=
 =?utf-8?B?RW4ycEpoSTdvQnlIaWZBK3VnQi9idGdocExmTkZ0djFKT0VPUG1qV3NqT1RB?=
 =?utf-8?B?bVNOT2FtMXY3bXM3SDBCOGJGb3BMa1g2S2ZOVHF4SDA3aWlhMFU4UHFBK1cw?=
 =?utf-8?B?QStMdDAvdUl3dlJ1NENmejh1UndZM3Rtb3FYcDdqWVBxOFU2RVpnM1RqQWIz?=
 =?utf-8?B?SGUzaHlMYU9mOFN6T2dUem04eTVlb0VVMWloR3FORzNiYTNvRjlKZnpnODJs?=
 =?utf-8?B?QkdSVW05UTZCbXlmK2xWUXNDNmlMbzEvZGl2a2dXbEdaWDNtRHdZK0VPTzFI?=
 =?utf-8?B?eC9GQlhnMnNCUVNMOUFuVXFGYWxhNUhjVEtXekE3amtHckNTNmlMZVl2MjJu?=
 =?utf-8?B?S1Vyc1hPZVluQnl0dlJmenBwY1dzNTV4NmdRem5rM1ZxeUxxL0xUcUNTZFdJ?=
 =?utf-8?B?djFtVGgyVUMxWW5FdTlNREVFRFlLQ250VWRLc0ZTZU5GcjRCNWVkeUswL0ZY?=
 =?utf-8?B?RHQzSkZNcTkramV2OFVhRGpkK0ZvbmtiR2c5dmFsQ3I5UzFqd3pGNm5NdVBF?=
 =?utf-8?B?Ym93THRDbDR4VHNrWlRoZVFJQklmVG4ybFlieDBuQnpCanhiWHpjTWUyVFFQ?=
 =?utf-8?B?RXViK2FFZGJGVC8wUGljWEQrV0ZQVTBrdmRTblk5bUxSOHd4c0lWZ2R2a1py?=
 =?utf-8?B?S3JqaVc3Ri9Rc1JHRFFUMFRpRHBtLzdwUm42Tm02UmFiTWJzZ1hNckgvVWg2?=
 =?utf-8?B?Rm95amhlS2Ztems0UEZNL0pzMHFMZkhVUEk5Zld1Skw3WlB1Q09ubXdFVmg1?=
 =?utf-8?B?U1M4UEowSzZvSWtXY1p0akNNd0taUVBtNVR0clZuc0laOXN5Q0p0cC9nYWk1?=
 =?utf-8?B?Ny8xSHRuNGV0MWg4R1IydTM1cWY2M1pVWU50YmVzVE1MWXd2SWh6c21uN3BM?=
 =?utf-8?B?TkErdm1HMThvdmRoUUh1QVNDZkt4dFpHcW94MjdIRkRVNGpZZkdHNFdESjNa?=
 =?utf-8?B?VjRsZ0pwSHlwSUdSczVnRmVTUXhMUlEzcnlwZVFLNkZhbjEwSlF3ek1tZmRh?=
 =?utf-8?B?TWRSWUptZHVZMFVuUjZDMEdubTRxTlQxKzdtQ2FickMxaGpycGlnM04vMWxW?=
 =?utf-8?Q?dn9d9KBXzlaKBPP8huYBkq3w6V7eCOdp+WEKlfjIkbCD7?=
X-MS-Exchange-AntiSpam-MessageData-1: QJUnyEjgbQruHvC05QcdKG5T2t1/MHxWyqPH0qScm8g9s+y0j0eIJthi
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8322a2-c3b4-4ecc-9417-08da26b7f348
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 12:34:33.0711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsONwzlHFu4UU2cvGAWDTQQVhT7KXDuMkqmUcYkTNPTKhFPgWW/1WI+sM6sxbaaXqzGslViv0ZgJ+uikqyKIW8JOYf9HMb5tC3f4rvfbnK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6041
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sascha,

On 4/22/22 09:28, Sascha Hauer wrote:
> It's v11 time. There's only one small change to v10. Discussion seems to
> have settled now. Is there anything left that prevents the series from
> being merged? I'd really like to have it in during the next merge
> window.

Oh yes that'd be awesome :-)

On a RK3568 EVB1 and a Radxa Rock 3 Model A connected to a HP 27f 4K
monitor, using

$ modetest -M rockchip -s 69:{1920x1080,3840x2160}-{30,60}

as well as using weston and glmark2-es2-wayland:

Tested-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and best regards,
Michael


> This series still depends on:
> drm/rockchip: Refactor IOMMU initialisation (https://lists.freedesktop.org/archives/dri-devel/2022-April/349548.html)
> arm64: dts: rockchip: add basic dts for the radxa rock3 model a
> 
> Sascha
> 
> Changes since v10:
> - relax mode_valid hook rather than dropping it in hdmi driver
> 
> Changes since v9:
> - rebase on v5.18-rc1
> - Do not register windows which don't have its own framebuffer on RK3566
> - fix mixed up register writes in vop2_setup_dly_for_windows()
> - move call to rockchip_drm_dma_attach_device() from vop2_bind() to vop2_enable()
> - Fix zpos handling
> 
> Changes since v8:
> - make hclk_vo a critical clock instead of enabling it in the hdmi driver
> - Fix vop2_setup_layer_mixer(), reported by Andy Yan
> - Limit planes possible_crtcs to actually existing crtcs
> - simplify vop2_create_crtc() a bit
> 
> Changes since v7:
> - rename hclk to niu
> 
> Changes since v6:
> - Move of_graph parsing out of runtime code to initialization
> 
> Changes since v5:
> - Add new patch to fix dw-hdmi of_graph binding
> - Drop "drm/encoder: Add of_graph port to struct drm_encoder" and solve
>   issue internally in the driver
> - make checkpatch cleaner
> 
> Changes since v4:
> - Reorder patches in a way that binding/dts/driver patches are closer together
> - Drop clk patches already applied by Heiko
> 
> Changes since v3:
> - added changelog to each patch
> - Add 4k support to hdmi driver
> - rebase on v5.17-rc1
> 
> Changes since v2:
> - Add pin names to HDMI supply pin description
> - Add hclk support to HDMI driver
> - Dual license rockchip-vop2 binding, update binding
> - Add HDMI connector to board dts files
> - drop unnecessary gamma_lut registers from vop2
> - Update dclk_vop[012] clock handling, no longer hacks needed
> - Complete regmap conversion
> 
> Changes since v1:
> - drop all unnecessary waiting for frames within atomic modeset and plane update
> - Cluster subwin support removed
> - gamma support removed
> - unnecessary irq_lock removed
> - interrupt handling simplified
> - simplified zpos handling
> - drop is_alpha_support(), use fb->format->has_alpha instead
> - use devm_regulator_get() rather than devm_regulator_get_optional() for hdmi regulators
> - Use fixed number of planes per video port
> - Drop homegrown regmap code from vop2 driver (not complete yet)
> - Add separate include file for vop2 driver to not pollute the vop include
> 
> Andy Yan (1):
>   drm: rockchip: Add VOP2 driver
> 
> Benjamin Gaignard (1):
>   dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568
>     HDMI
> 
> Douglas Anderson (2):
>   drm/rockchip: dw_hdmi: Use auto-generated tables
>   drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
> 
> Michael Riesch (2):
>   arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
>   arm64: dts: rockchip: enable vop2 and hdmi tx on rock-3a
> 
> Nickey Yang (1):
>   drm/rockchip: dw_hdmi: add default 594Mhz clk for 4K@60hz
> 
> Sascha Hauer (17):
>   clk: rk3568: Mark hclk_vo as critical
>   drm/rockchip: Embed drm_encoder into rockchip_decoder
>   drm/rockchip: Add crtc_endpoint_id to rockchip_encoder
>   drm/rockchip: dw_hdmi: rename vpll clock to reference clock
>   dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
>   arm64: dts: rockchip: rk3399: rename HDMI ref clock to 'ref'
>   drm/rockchip: dw_hdmi: add rk3568 support
>   drm/rockchip: dw_hdmi: add regulator support
>   dt-bindings: display: rockchip: dw-hdmi: Add regulator support
>   drm/rockchip: dw_hdmi: relax mode_valid hook
>   dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
>   arm64: dts: rockchip: rk356x: Add VOP2 nodes
>   arm64: dts: rockchip: rk356x: Add HDMI nodes
>   arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi
>   drm/rockchip: Make VOP driver optional
>   dt-bindings: display: rockchip: Add binding for VOP2
>   dt-bindings: display: rockchip: dw-hdmi: fix ports description
> 
>  .../display/rockchip/rockchip,dw-hdmi.yaml    |   46 +-
>  .../display/rockchip/rockchip-vop2.yaml       |  140 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |    2 +-
>  .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   47 +
>  arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   47 +
>  .../boot/dts/rockchip/rk3568-rock-3a.dts      |   47 +
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   83 +
>  drivers/clk/rockchip/clk-rk3568.c             |    1 +
>  drivers/gpu/drm/rockchip/Kconfig              |   14 +
>  drivers/gpu/drm/rockchip/Makefile             |    4 +-
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   32 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c        |   18 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.h        |    2 +-
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   17 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  257 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c          |   32 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   34 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   36 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   20 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2706 +++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  477 +++
>  drivers/gpu/drm/rockchip/rockchip_lvds.c      |   26 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  281 ++
>  include/dt-bindings/soc/rockchip,vop2.h       |   14 +
>  28 files changed, 4235 insertions(+), 173 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>  create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
> 
