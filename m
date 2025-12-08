Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A858CAC5EE
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99E610E3AA;
	Mon,  8 Dec 2025 07:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ITgXD7tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E5610E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkuLGOh2DRmbzk6jwJ7lcZYQqrMrWn4lgE/1CMEL3o+RnHQIYqCBTg9svWxKd3nf1qFwBm30ek1cLTmnofcfG3DmM2E9+6UvlERN/GXr7Cp+c0drSHlRO1w6f/MtWlqKJZIe6+O8rI/oSeDTvwmGo8mNZtaP9d9+9POv7uMmf1p3dMOW8IdN0AwfW3QkH8kndNgADnE9XGqxOWjvU5WSiNMT5k0bGc3OXitG1zzcOOZqON7xS4cPCjoJs3XFw6qBcw8ZB40sVtrfKd0j2uru33ERSVwuHD+ejWG0xU5TbmU7plOrcxwrWksX+u8C6tSulzQqVhkVLPGgiDf3KFEb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mFhsXynfYMRTAqLVNk7K0jzc5DMqiEN48/jhDZOcOk=;
 b=sXPTcSFEvHwcHXVmc9EP9Zvyy6w+th7pyIfWh27Uh0BPdQ8Kmf0vXwHj4s2kFbwIj9/2xviTfpLsmXscsbfGVGlc5c+yNzIsGuPRSoFpKll/uklNj9RBM7wEK+DV53cZMoQ0634Uvjw9Si86I8pjAPJKX+GPcOi7gDnKIXrIeE0SwWaej6RAxGflDNUpkQ11taw5sAYgwzFzpwoyXOKV/a5bpY0seoVbKgp2qv9ZhRJpih4kxBn8SWuOhIQhTvaHuhbc16+ZoqZDK55BOp08zi8Nf7yqyAiRqQjYtnWD8MbeZR2OYzLZP+41HzA6lJMxa+diYL11Y05KDZZvbpU8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mFhsXynfYMRTAqLVNk7K0jzc5DMqiEN48/jhDZOcOk=;
 b=ITgXD7tleKQmyy4m8JPlhoV7tt3xlXkARjBWgrGs5jh5GyJAkHQzxf3ne+j9odHabdNweNb5BekslZvS5mcdKHXajhgh5dHc+CDfrrlvtuRZJ9VWd0+wpjPh1lzg4Sc7qvZrO/TSMP2mwLT3SMHDTTeB7luOva/G71HbgNDr2jdaWENT3L6Mpz7ZeNMNa2Kkme8WzrFz9iPPMdSmp5mfQih4xHgN/PL3nr/HMo6WgdjHtmwFCQt3A3IY9+61aTxPZ3cjv4MfsoaCNIUFOn2i+2l1T3Fg/akPe1DUBLOYTWe69YIBEwIcwv5zqAi9YUCKJ3TFyrb2Hhww3mEibQcyYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AMDPR04MB11702.eurprd04.prod.outlook.com (2603:10a6:20b:719::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:37:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:37:40 +0000
Message-ID: <e4704da5-2532-4559-b0a5-58ebf087681e@nxp.com>
Date: Mon, 8 Dec 2025 15:38:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/atomic-helper: Support atomic flush with an
 optional kthread worker
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AMDPR04MB11702:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ba44e8-0f47-4486-10af-08de362caa6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlJqcDRETUVRU3YwM05sNndVdllXNUFtL3RSdm50VU9Ld3E0ZDY5V0RjWTJR?=
 =?utf-8?B?QTROWGtxbGlrL2VDdnNYSnhjQW96akhNTklqZDNoQ3FoRjNjTk9Jd2NoOGpH?=
 =?utf-8?B?RGNnVGNyT05JY21DQi8rWUVHbU5TWm9Kb2FGUWRHeFZZRGQ0MERGNVpGeVVz?=
 =?utf-8?B?cnBzQ215SDZxVW1LWXNaZEFISUNwTFdvUzQ2M0RoYmlCbXlzNWlSN2NDQ2hh?=
 =?utf-8?B?R3pGeGh3RmkrOTFFRThiV05nSVFkOVRSZzBiUjJ3Vmk4SHVRcDRKVVkyWVlQ?=
 =?utf-8?B?cU9VM1pMalJsVldXM3UxNXpwNG00MkNreTZncjM5NDY0dzlJdFE3M1FObzhZ?=
 =?utf-8?B?cnhtRlB3dzFsa2hxbkt5OTh6Y0NveEljT2FYKzRzT3VIRmFKSzdRS3FTcXkw?=
 =?utf-8?B?elFGM0FseUduamZ4VEZDc0kvelo1dHB2V2hLQ0Jrdkg3T243YVFHZGM1VnR6?=
 =?utf-8?B?eU1qSDg4TEFUbVpiRFA4Z3l5bXdoRTFjdHE2bVYwSjNPVElQa0NZQlpnMy9l?=
 =?utf-8?B?R3lYV0swd1RKQVRHaW15WHA3dTZTd1lGd3hhNHRmZ3l4UG1qWllQVkprMEtw?=
 =?utf-8?B?eEtTdDVPQTkzaHJXblRjSU1UanpTeTRRR2hPUlJ5Ui9GbjFscFZYdFI5R0wx?=
 =?utf-8?B?YXg4ZEhQMXk5d3VDTmNKYTJGQUpxNVhZVUJEWmR4dVBudWkrSTBnVWU5UWND?=
 =?utf-8?B?L3RRWDRnMDZhU3RENExEUXN4dUgvTTZwd2c0MW9JQlZOMGdsTXlOR3AwRDVp?=
 =?utf-8?B?NG12dDZaM0U3MW9zcUFxQWxRaXFtK0NjN1N6MFJEV3BLUkVDd0ZXWTdVMEcr?=
 =?utf-8?B?SVJVaWxUNnl2dHB3N0twTUtNWmJzQVRDeDB3YlV6YVZDcTlYSmpGTHNuQ0g4?=
 =?utf-8?B?cGFQSmpCVzB4Vkx2ZWxDdzJtTkVCSTNXZVdjRXF5Y0kybWVMOFpPSzh0SzBZ?=
 =?utf-8?B?ZUxuUnlFOHpYTGtvRFRYZWt1K1BmbC9PVWhXaHFSRlBwbDM3d2U0WmRNSlJk?=
 =?utf-8?B?bythVmZiZmQ2VXIrZ3R6aWZMWXFSTTFITndlUzFQSmp2V2ZsMlQ4RDlNbTVV?=
 =?utf-8?B?bkl2S2FNTWdtMWd2QkZPMExwWW56U2xSaHdiUCsvdUJzWkpWYkF3eHIxYTAw?=
 =?utf-8?B?NW9Nb0tic1M4Zm5pU2srQ0dRMWRVQlFzL2lUQUpIRW1hSEljdy94a3NxckNU?=
 =?utf-8?B?cWUvV08zMGdBMThlOThHS29NUUh2d1V3eHZwYUphaDBsQjVqc0hXMWgybW0r?=
 =?utf-8?B?T2phY1E3VHRBaGVqV09JakpQbFY0R2FRa1JmbmJqVjJMZ29ZdzJNbmhtWld2?=
 =?utf-8?B?b0hHN3V1WGpXUGtoNFVVbG1pTnliR3JXMHdqcEcveTNaYm0vbU9MazA0VGhO?=
 =?utf-8?B?RDhhdUJNNWdERkhOaFJXWVZqQlV5T21ka2MxV1pLT01mSHQwdnQwN1lXUFBB?=
 =?utf-8?B?cFlpRzNMcHdZSEtaZnRQblA5TndqQkhpS0h5ZjBGWTlXVTJuTWRERHVZYWRJ?=
 =?utf-8?B?T3VMMWhQQncvb0lQOWdNK1BQUDF3aTFtQm1lbFg4UktzejNUS2Y1TkZaM0hq?=
 =?utf-8?B?dVpVcVlNUEk0WTJMbHpQN3JMSWlXZGR5TUlmajZPa3J6TWc1c2ZKSlRoM1Yy?=
 =?utf-8?B?VnB2enplN2FyYXNOUkxkUVlTdEZrcm0rdUNXMUVVRDROOUxPbVgyNlhRNkg2?=
 =?utf-8?B?ajZQNEtJK2FrNzBoZ2RvT2JFVDhoSWNRYmpBNkZQNUZmSmxHYnJDMkZ3VURm?=
 =?utf-8?B?dUwwcXpoNGxEaFRYZ0FQekc3VHJSVFlHUzVDTy9QcE56NFlEc0xhaytMcmhP?=
 =?utf-8?B?eFRuL3pPVjM2bGgvaEh4WVZCRGhmMEFyRU1MNzgwWnNuZlZ2bEJwbXhrL0Jm?=
 =?utf-8?B?aGRjWUVkTUx6Mm5LQjR4Ulo3cENaM0ZXTDhFd1dJQXBKTVBZanZNMEhwSVBw?=
 =?utf-8?Q?+o1lKlmF+QWs1dOVH4pz0RAfzc6fIXXl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFlTcE5VcER4QjJYbWR1OFZmUEVHU05NS05SZTVSWjZEOE5UWkZ0eGNZaW9r?=
 =?utf-8?B?SFN4V1I3S1d0T2Vwd0dKTUNLNkI5cE5SM3ZJVzJXa2tER2dDZW9EaTl1cE0v?=
 =?utf-8?B?c1A3T042aGZoMXEwcE1DOUFKUGRWcm9DeDQ2dEc2bjMyZ2FVbHF5SFgzL2h3?=
 =?utf-8?B?M082QnRhb0ZPbWtrdDR6OWp3M0hDRDZuVjUrTksxMHpWUW9aMS81MDMyTERo?=
 =?utf-8?B?NUorbWNnZzc0WTczU3JQc1VISGlWZHVSTlJKNHMxOUs3cERYcTV3S2RzMHJv?=
 =?utf-8?B?LzB2RmlwSDFHaC9IdnB4cTVCdnFpSThhNllDMWRqeFVRVUxVb3Z4SW1UMkg4?=
 =?utf-8?B?QU9pc2tiVUxLRG1HT2h5aW1DQzh4TlphUGJtRFR6alF5aHQ4UEpKTytUVjhj?=
 =?utf-8?B?UjJvVEcvY0VvV2NLOTNGWCticWJCMnliM3UvdWloK1BJMU5sNElyMHhUek9C?=
 =?utf-8?B?NXJ1dVNaT1pFNkNaVlQ1a25jSnUwUFRId2xNVlF6d2JnNWFhQUdOTC9DMGFw?=
 =?utf-8?B?YnN5bklkOUlUZVN3LzE1akJ3bWppTGluVk5pU1AxQWVHUkRwNGRrTnBqTHJt?=
 =?utf-8?B?OENXK2k4bnptZ0NYQnJWMlJENGF3dHJsV09zU3ZzcU9mSm05OFFTT2xMNlNk?=
 =?utf-8?B?djhtM2ZHcnBkakZUOHZkbTI3bDFjTWtwTVc4clJQWC8vVFJZaVNXMHBpMTBQ?=
 =?utf-8?B?SWw0YlNvK3pmSFdnNm1TUUlzc0FOcFZFcGtxTGV2OVFGSGMzUjhCYVE3NEdm?=
 =?utf-8?B?eG9Hb1U1dFlncG5sUEpWcEI1dEtlekd0YUk5bXUwUWp6NTNUTzZsSHkrUGV0?=
 =?utf-8?B?dnc4V0FMSDFuSnVITFRydVBrRmVOdm5sYWtBbTRuZVdCV01DUFVDMDFxK0xw?=
 =?utf-8?B?RmorWHhvOHZxU25zcWllSGN0YkJYdjIvTkpGTmU4TmVMU21NMWh4SFQxUm1x?=
 =?utf-8?B?UWZNNVNKR0t0Rm0rd2tNbmpibjRtU2NPWDBxbE83RndQdytPU1Z0TlF1UzRt?=
 =?utf-8?B?OU1tYkprSkJoR05JRFBuT0JwU25IVnF1QllFYVN3dWpOclFMYk9Bc0FZZis2?=
 =?utf-8?B?YXNtdVZoTGtSYmZMeUNHYmlrZWFtNG5RZTlXUkc2aFBUdHhQS2xTUjQxYjl1?=
 =?utf-8?B?SVhUanJ0emNoWWVzZldhQ09tclByVEYveXRjN3JMN2lxcG04bEdLZWlNYnJU?=
 =?utf-8?B?TmNwM3p3UUQ4Z3RzM2VKd2crRWgwcXpveHFkdXFiNTJINWJ4UUtCZWw0L2s2?=
 =?utf-8?B?ZmFhdk0rMHdPS2M2Q3hvNTl6TEVMSlgxbWdSbWJOSFFQWUZWZUpObnZDY3Zy?=
 =?utf-8?B?OUl4d3AwWml5a1IvcVcvaU9FVm05V3NsWTRYZHozcEk2OHg4WXlkSDhYR3pQ?=
 =?utf-8?B?YU1wWHRhWFNwdTlCWXZJMnpDRkhpWjJydmlnQ2J4Q25JUnNjNms2bGlrN1dk?=
 =?utf-8?B?ei9zeEtFeEJCZmdpTTdQOVhHQ2NzYTZGNlgyM0ZpWCtsb1pwcWNtQjRtUWc2?=
 =?utf-8?B?eXFWY24wZmJNWWVLNTM2cWJqaW9vWUFQc2Fid1JDOGliUG52UWdjdGE3MGIz?=
 =?utf-8?B?VjhpU2NYcmtrWXB6R0ZTdnZjZmFpVTZYMER3QU1LZzJ6U2xxaTZMUk0rdk0w?=
 =?utf-8?B?WTFRR3k2cHJPU2M5d2hFOVhyaFlTbTkwTDgyTE5KL3FuT05FSHZGOFRiY3B2?=
 =?utf-8?B?ZGtiVlJPVDdTQTVGdjNnRDYvZ3NKNGNETjloQXZLK1RCZnRVQTJtaFAxc3hw?=
 =?utf-8?B?NVIxbWE4OGhjUWpHQ0s0bk1oWkJLcjUxeVJiN0tlTFUvZzNENnFYQWJGaUw4?=
 =?utf-8?B?MzFGZjBVbkZFS0pVamVZVy9vUWRNVlNuQUZCblJrbGplYnBoT1lJZDNuamxp?=
 =?utf-8?B?bHdUYU9RTjhpb1UzMC9mbkwxWHdLODBzSEtjR1c2dWRLM2RaeFVpeWFLcENI?=
 =?utf-8?B?Y2k5STNybmhzQkpRY1Y3SnFxOHZlWUlyRzF6MEVIYkpjWk44SVJ1dno0aEE5?=
 =?utf-8?B?anpYSllWTk9ZY3IvLzRESFFSN2piUVdiSVVVN1FnQ0ppZWRObE9ONGRtVFdw?=
 =?utf-8?B?ZkpQVC9ta1laNnVxRTNhamtVMWlKblR0aTFYVEc2UUpmdWVaSWhpd0hSZFdu?=
 =?utf-8?Q?QbH83aKnhkGGq6NuAqwefvw6P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ba44e8-0f47-4486-10af-08de362caa6f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:37:40.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PlA3Eizo+qrlseUGbGUED1fANVB1NLA6LhbunQTG7lSIDjYeuCAlQPsz8apsafX6biitigvdgtMArqpoaN+mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11702
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

On 10/31/2025, Liu Ying wrote:
> Hi,
> 
> As drm_atomic_helper_commit_planes() calls atomic_flush for CRTCs
> sequentially and a driver's atomic_flush callback could be blocking,
> the performance for flushing multiple CRTCs in a single atomic commit
> could be low, like page flip for multiple CRTCs.  A real case is imx8-dc,
> which supports two CRTCs and does atomic_flush in a blocking way, i.e.,
> waits for a done event for loading shadow registers.
> 
> To resolve that, introduce an optional kthread worker to conduct
> flush in drm_atomic_helper_commit_planes(), so that flush can run in
> parallel for multiple CRTCs.
> 
> Drivers should call drmm_crtc_flush_worker_init() to initialize the
> kthread worker if they want to use it.
> 
> Patch 1 adds the optional kthread worker support.
> Patch 2 makes imx8-dc use the kthread worker.
> 
> Let me know your thoughts.  Thanks.

Gentle ping for review.

> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Liu Ying (2):
>       drm/atomic-helper: Support atomic flush with an optional kthread worker
>       drm/imx: dc-crtc: Use flush worker
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 27 ++++++++++++++++-
>  drivers/gpu/drm/drm_crtc.c          | 59 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-crtc.c    |  9 +++++-
>  include/drm/drm_crtc.h              | 45 ++++++++++++++++++++++++++++
>  4 files changed, 138 insertions(+), 2 deletions(-)
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251031-drm-crtc-flush-worker-0aac27acf40f
> 
> Best regards,

-- 
Regards,
Liu Ying
