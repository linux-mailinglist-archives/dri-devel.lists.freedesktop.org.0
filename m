Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D419C66FE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 02:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA09410E31E;
	Wed, 13 Nov 2024 01:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TrUMjkjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA5010E31E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 01:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em7qKt9tFrELaErkOJLudLnfqIle2av2JWSzDWqnZzbbCnMK8DcM2UT+A8XLwtgOMrZLOP5kzMIy5kH/pRSxNI7bWqNMCvS5pzHXHujHdgw6eC/Icz9Gmb47DIW7L6pANnLXq1kzQ75RRagpBXwjNoy4myaEi07Svh2w+3XN9f0Q32EvfAAX2OaP5Zdya7ysiqsiEKkxt01BB6pf99oxW0rA9Ett4UxpUbh1Fj9/Z5ExufzJq62fNhQa3nBoLkuP1bCt7l7mv/d1vHtOKN7ItJq3WXphUaAqvQFbVTSVrpf2oqyzPbj72admEypWxYfjo4Y+cgV8LYRJFPcTL3PZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNKFUr5C+ijbgNE7tqeO3WDONjfPmZqZL4S6LV+rOO0=;
 b=no94nZB8CwaIr7ba+vZ6TBqfUlpWNXIFxIX74HO6baOKM2TNNs4ePVNQNE6TQCgqzNRg4LpHe4bAVgLVwQq04p6FfiWdrsx6+xN20aJFZbZvJjCaaerYGzstLkDtpKnQStiB1yG3amdjBO4xuXtfIYxU+ncIf0JOZnqZQrnOozYDjLofh9a6Obf4E1mURZGD+5XVG3ewEqOrPol9lCp/9oymyLCu05hcawAVO6iZCHFbbfGXJMi3AloNh5hlUZS5rGIUUFPnCAYm1vrY8uGSOTRLmfmzfQZE/x0R3YBBOdwFTG6GWc/oA+Y55ANwM6pXURPcYNFqMTdMRjJ+YxHTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNKFUr5C+ijbgNE7tqeO3WDONjfPmZqZL4S6LV+rOO0=;
 b=TrUMjkjByrR8p5C6lX6PIgZ/MYzH/sIrFKUrswJSENv8J3q0dLKtS2UnPsXQGwgN9hTnKHBFH038quf7KbcaEDR47teTPWQqAuXQobVjAWMDD2z2LCcJX2MZN0e6zEO1dc43aBj6Hbp7dWIH/p8aUDlG8PHfMoYAqq6XaHrKCBvtqtmksnyuP7fDvbEgUec4sZ9x/hJq6X2QRnMb+C6mXLUGOeVLHqKf5Upzn6DICk01a5D2uxc1O4zeiiRngIOlcDOEglLaT+lopX2f20FbCrxi2aNirrHKnn4H7eglNXCYupbIm24WW80rXDaxgBzHmW2EiKsM2bWwHFQmERXRew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 01:59:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 01:59:08 +0000
Message-ID: <f931ce90-eba6-44fe-9296-674547cf4cf4@nxp.com>
Date: Wed, 13 Nov 2024 09:59:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: e35db923-4128-4ad2-55dd-08dd0386c2a7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW1GdldYTVR4VlNiN2FnN3pMcjdWKzk1Nkw0WXQ3WVhyUW0xc1lUc1BZb1lU?=
 =?utf-8?B?dHhMZi9Cank4VUhnSGVVUWQ3US9kbnJhcWQ5TDlqc1dIc1NEZzBOdFVVT1RZ?=
 =?utf-8?B?cElORnFtZ0RCV0RBVXJZUU13TjlVVzErOGZJMkRlZityMVZFdXBSek5pcnJx?=
 =?utf-8?B?VEdIZnkwbzlrVXdoYS9CQ3NaeUhvYXN3SExKTzczL2tIb0MrTnNuTkN0aDdx?=
 =?utf-8?B?L1pWSzlLNjJtQnhvbW5NTEVNOE85cmYyZmptNWEvbFdCZzFYZ3lnNjI0b3NT?=
 =?utf-8?B?eVdpRlYzVmtJNlJReFlQZ004dmttb01KVkhMVFU4bk1HbGxyWVJyMmlJUmRu?=
 =?utf-8?B?aXl6S21WdHMyMjRBNURJQjN6dGpWdElUd1FqNWhXZldtZS9kVG1JSGhQS1dL?=
 =?utf-8?B?Zm9pTnlKKy9IMzc5WnZnY3NXcUNFNHB1b3owRm5LcnkzNTBvb0JwUklmemQ1?=
 =?utf-8?B?OGZqeUh0ZUFIaEFOS0JJQWxnVnNCNXpIVllubHpiaHY5ay9VT2x4MXEwT2pM?=
 =?utf-8?B?bUdwajl0N2lmY2JqYVZ2VS81SDZhdTBKRXpLTHBualM3NFd4d01aYkxvQXZ5?=
 =?utf-8?B?eDVpMS85aDM1dS9Fbmt0b1Z5YmgwTnptaE9acy9BQTNlRmgwS0hHM2xmMWVm?=
 =?utf-8?B?Wnk1bSt3VldKa0ZlSVNhRmN5QUVxWHpYV3JoVUx6L1hFUWs3dzJseXVzUitG?=
 =?utf-8?B?MEFReWRmSDczTHNKVnJVUzl2VHJRT0ZBTlZrMVNmbUxiU1c3MU1SeGRpS0dR?=
 =?utf-8?B?c2N4cXRLM2tYOFZKbzdGTVlYKzk5YTNaVkQ4NUJWdkRhNURQajZJMndjL2JY?=
 =?utf-8?B?ejM3STJYMG80OFowNHlRZWI4elBPM2FQSnlWYms4cUZIRnVHdHlhUG1MQmJR?=
 =?utf-8?B?L2QvMHcreW0rQUlwMk5uZUVWR0Z1ajhDUWlNMXRrME4rWjJxRGtISm1kT3RF?=
 =?utf-8?B?Yk1qQUQxYitxbHIyNHZRV2VJWTBqNkdMTDF2UlJMMzVRUFAwVTgrT1hnSk5p?=
 =?utf-8?B?SXVkblVnY1B1OWdENHhXbW1HQjc2aVAybGV6SXlzc3h0OHAzNlYvWVR2UHJx?=
 =?utf-8?B?YlhVNzlReEVETndjdzlNTWZEandjcjJicWFlUTVvZms1Z0h0R0l1SDd4ODBn?=
 =?utf-8?B?SlU3MGdvNDlCVWNHYncwcG9xZjBJTDVOTmpDSEJGdU8vdUJhSy9USU5kK0l1?=
 =?utf-8?B?UHFoUU1aYUFFQkpEanpMcnBmdzFVVVdUNjlhZm9qR3NJMjI2U0RxV2M4eUNW?=
 =?utf-8?B?Q3pZekhxdFhhZlpPMWxRbXpnNld4WHRpMjhXTHNGK3Q1Tnl5K09PdUZVSU9s?=
 =?utf-8?B?NjNRMFBzem9oWllTaG1hWlVGbDlaeWZidW9vWWpvUVpzRXBXdkZQM1luM3px?=
 =?utf-8?B?TDYyeUFPc2Vzd0JkTnIrZVpSenRoa052aVNkazU2WGJuQ3pJTXBXN2VJckRD?=
 =?utf-8?B?d1dkOFBLUFQ2MVVRdEowQWE4UWc1Skp2emlmd01UdUZCbXVxRWprRENJNDcw?=
 =?utf-8?B?Rit4ZkUyZ0k1d0hibmUyY0pveGpvUlFTRm1GaHliY1VOTlYrSFVNcUxna0pD?=
 =?utf-8?B?YWZhazRJK3o0R3UrYy9nMk8renpPelV0RG9ya1lLQXcxOHVWQ2tvaVpsZzJ5?=
 =?utf-8?B?MU91dXEvRmk4eGIrMmROU0JVUlNZellVWEdNdDIwSUZqUEJ2dEhwTnhhWHBH?=
 =?utf-8?B?ZGV0L3JBdWZLSzZkSXE3SFFqSElna1NIQjJiZ2V3ZDlrK040T1hjbG9SQXEx?=
 =?utf-8?Q?GBd0YdGiPAkoT3r0Ftbj4bSG97tUVKRBVdlP0ig?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2g3OTJOelRvWHF2Rnc0dUFqTS96WTZiNGFzbVR1bkI3UEdMMm8yeFh5dDVz?=
 =?utf-8?B?MDhESlNCcmQzVGl1cWMvdm1mQXNYYXRxemlnWUVTZFlpYUZSRVc4aGhFLzM1?=
 =?utf-8?B?RWI0aVg4ZU5SSUQxRWJMdlQxbEEzd3hOTU0vUkwvb0hORU43dXRxcjh6M3Jq?=
 =?utf-8?B?RmtzTk1nREdmU2FKc2FRdGNyaCtPSFBQc3FLSGkvNHdkVkdLNHUvdlN6TzRj?=
 =?utf-8?B?S3hIT0Z1TVVZQ2pRNUszanFIM0tjUU9TdjM4YThPTWJzWEh0SkdNQStiTmpj?=
 =?utf-8?B?NldkUjRqWEVsL2NtVU5ORTN4dDZBNTZmUmp4SFQvb0dDLy80dW1SMGtwWWpU?=
 =?utf-8?B?YXVnVU9hdUR2eEg5Y09QYXV5aDlEK2N1dHBHaEVxMVVxQTVuRHpKb08va2RT?=
 =?utf-8?B?aVRkNUxZdHZNMFlRanJUZ0I1SWlyOHR3cktRN1R0TzZvRGVWM0hWNlNQVlQy?=
 =?utf-8?B?QzhJRFZXUjFvQmlmYTdrcUYzbGhtaVpjaGg2bnFxOUNPZjN2aWZTUE1CVk4r?=
 =?utf-8?B?TkhpS285YW5haFUxYVlucG5EQVF6dk0vSnVIaWUwbVZaT2l1SDNDZWduQUVn?=
 =?utf-8?B?S1ZZWUcrcWVTOUJSaXcyTGFjWkt1NDBvZVNuTVg0QllIa3pBR3ZwNlZqeEdF?=
 =?utf-8?B?d3lENGlYaXdxb21QcU1BUFl2RS94dXhiL0RlWG5QNFJscVhSSnpVZDNFbElh?=
 =?utf-8?B?dDBGeXQydE5jY1hveTkrQXRjL2JMVU4rUTN4bGZWMlZNY3k2R0IyVjhUT1po?=
 =?utf-8?B?Z3RTYnd2Z3VnVUNMK2tUUVpTTzdCVm5kMExoSmxRbXJFMktiTUJOR0ZZY000?=
 =?utf-8?B?RHFPV0lwYlR5ZnJ0bXpHemJsWnhOdWFXRUFqdE45RDdvaGd6WHdMemdrNFNi?=
 =?utf-8?B?K05DdjdaSzdDYW1zaUhWd2ErL0NRTjRxdVNqTnkrQkNxV3JCVHZsaVRMWHVK?=
 =?utf-8?B?L1hIQ3FYZXphSUdrZTBSVVozaFdPRUhHSUtyTUNIcUxPTE9yVlkxTnVENkE3?=
 =?utf-8?B?aUxuamFqUThwNm1Xb1B6QU9QSDVkMFVKQzF0ZHF4SE05aU9QcjAzWi8yOU4y?=
 =?utf-8?B?QmdlblQzeUtYV2t6SEd6Y0oxUlFoek1kUkhoSnVWbzB6dFNHNzBmK0crTXIr?=
 =?utf-8?B?Y3JXYkNyNVkxYm40K3d1aWV3VFNSRVR3N2p1NGdkeStzK2pqQnNtd1BndTlD?=
 =?utf-8?B?aDkyV1k0VmJEcHZvNDN6cGtmZ0VaZkh1amljcUhXVVhsMjFwd01BYzRYZVZX?=
 =?utf-8?B?dVNqLzA1WWE2SEY3SFk1a1N3QVZXSUFVUzZOTDlrQzJPeTNWSXRQemwxVTQv?=
 =?utf-8?B?bUFFVElhdm8wR2ZOU2F6U0F1VFhwVjNzeHBHQnBPdFN4Q01Gc3puWFg0T0Ni?=
 =?utf-8?B?cE5BeE1XNGpjTk96NjB3UVl5Ulp2Mmk0ZzlvL3FPNDRlNUxPcDBmZ0N6R2t6?=
 =?utf-8?B?L3daL1JBdVYxMzNGYnNKNW5NV3llY0Q2aWxqWjVXUjNENHJLSkkzR2J1VjZB?=
 =?utf-8?B?SmZhbndFRFRXbjNNOURwbFN5dENlVEZkMjlmRzFpaGJJL2lxM3drWG1KQWVI?=
 =?utf-8?B?eUE1Q0NMdDJGM0c2bTlRWXpKb2ZHcjZ4WTNaMEE4WitqQ0ErdHRWRzFjcTNm?=
 =?utf-8?B?Y2crUllnOUZyeHMrbDBoblJsYmIzUHkrMTBtb0duczZpbnVRaHVIQTA5a0dR?=
 =?utf-8?B?cGdxb0JHTjkzMTYrWkFCKzlSWExLT0lmWk9HYVpiL3ljSEJiQytqOGJsbnFB?=
 =?utf-8?B?ZnBLbWpaeUxmNHAwYWJXd3p4eDUxYzU4RXNuTDZyT3Y3MUkweUl1cVRRSHV6?=
 =?utf-8?B?TGVsRUpqQTMrZnU1T3lweFFjQTNrd3c1THVrUklqdDkrSFowY3JubkZvSThw?=
 =?utf-8?B?dGZMTko4a1A5ZXNDU2V1SUdHU1R1K1VGa1UxOFFGdFNoRklvd0V0RVlha25L?=
 =?utf-8?B?WUdnVFpTRjhzUGZaTDJOTVBpZ2NVSG9FUG5mdU03cHJWdXpFVnNnT0R5M2li?=
 =?utf-8?B?d3JWdFNPZVF0cVJrckF3ZzhieW5QcTh5YTJVbU4xK1JxVXVIRTd2cHoyTGY0?=
 =?utf-8?B?RnpBcjZMUXMxSG40QzhaTkRyV3N2aXdWVUoxWDJ5UGIvcWxoY2xTKzN4anYy?=
 =?utf-8?Q?01QVwrLCFoWlxu4P+nuTK43Dj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35db923-4128-4ad2-55dd-08dd0386c2a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 01:59:08.6472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS/i+cG+7al282j8p7OY/IlQl2vc0IemJbkDHAe5rbMk7xH8kzR5Do4RmTnruGeE98S1vNXKPVr5VwOU+6fdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
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

On 11/12/2024, Dan Carpenter wrote:
> If devm_i2c_new_dummy_device() fails then we were supposed to return an
> error code, but instead the function continues and will crash on the next
> line.  Add the missing return statement.
> 
> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
