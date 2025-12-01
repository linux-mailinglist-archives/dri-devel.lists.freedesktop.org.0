Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40CC98089
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F12010E3F0;
	Mon,  1 Dec 2025 15:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="k3JX/8u5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6E610E3F0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrueGj92TRzQWCqa5VC7MAmAvEyEumkGYbvOWVzCqCXeD1ucUMYG7hmRqy2kA2cmj/I7vcIJe76CBrVepTFEO5PVdHbcNVUvWea1+0LP5nFKS5FCxZKp7ZrspsazfHuCpurJVtRh49Eon1W2vT437uhhMn+cZtYx+iOZJ2QYUsj0regt7jJFFQhJYlFuq5YTfkXIgcBOlbUCCeokwEKKPAI45npHxqMpsqylJKsUHHgo3ViOCocprlAcaOtU7T3zFeIWVSozR+soFNmaumBOGg+/Fo1HBwvGhbJRYC9NWFAyv3MROTVWUvMRTZGLUWP5b59e/yoL5zBPWYg7wvYvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY4KiEgd7XvExDqkC2X0oHiKKVOjdcmTd4F+j6wKC3g=;
 b=E2vcQfK0SEHQx9zo4KFekGxa14miQf3WhwEJRPvcHRBNA/Z3qbnM07m+4Psrarr1HYm7jWMw/xJdPjXC6bU/nXW2dnITTyaKyBOCtKhEnC5dPdIcbk7/k+GoGoO83ID93QnSeCa12hdwuxrgSWiSPXi45pNIYybYZ/VqXAoM8iJrkQy6EE4R1GIAE4MK9rf9+s5F8E2SGe9xcoAhCgSqtauMl40MC6Gyu4Qo7VpBHYMoIgxmzfZSqil//C/InRWXovFZKO2MUHEamBavY5S5is9/recRa6lbY4LUbvDg2o85JdQTooMqhz7rw6udHVrUHd6RXi56rBWzOoNoOfpSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY4KiEgd7XvExDqkC2X0oHiKKVOjdcmTd4F+j6wKC3g=;
 b=k3JX/8u57+wY23cqjt7qEO8oesmGDUNqZZEHriasgvf1ZEwogkC/Wo5VxA8Ip2if0QqEtf4ik3P8GOj2CPOhwTVx70spcjFerA3OCPGavHNOtgAat2SNN8iQl3p5IZoStMJTF/ZAZwAD3VYgDQ6Wo/4/SA4COsa+YRPPUBOMyIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10666.eurprd04.prod.outlook.com (2603:10a6:800:27f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:24:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:24:01 +0000
Message-ID: <19a9498e-c8d1-4e1c-b89d-8d1a7e6aa54a@cherry.de>
Date: Mon, 1 Dec 2025 16:23:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] arm64: dts: rockchip: Add power-domain to RK3368
 DSI controller
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1418e3-416c-4d15-40ad-08de30eda77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNGNm9NTUlTc2ttdXhibmFid0QxYWZkTWtXVzdwazY1NklQTUErZXNmK0JJ?=
 =?utf-8?B?UXIzQTdyL0JZbXgwNTJ4ZXVFYXhvOFBWYlFabnVFdHNQeGZJQTQyalVIZjdy?=
 =?utf-8?B?dFgyNStDejl1d0pKYUxiM2htN1hEU1E2QzlxYWtJQ0NsN1N3SGVoN2FQR0Yy?=
 =?utf-8?B?OUc0UUF3RitIYmNacUJ0UUFiS25QbHhMSGd0eGNTTExsSUN5WU83Z2ljRTRv?=
 =?utf-8?B?d0xQaU1aK0tEOVBhUmZ5WWtpbCtKZ1JEUFFrcXljOVBEUjA2cTFsMXcyclZH?=
 =?utf-8?B?UzZkTjRJTWZ5SXo1aHA1cFZOZlVrRGJaamFMMTFoM0srU2NTdVFmVHJkaTBR?=
 =?utf-8?B?YVlPZ3luSytwb1Ryb0kwdHYxWEZGT0EwenBZbHo1SFRPeTY2ZVhPQ0ZsOHRj?=
 =?utf-8?B?TkRaR3ViV1ZIK3hVejVqWmlJSG1UTFJuVkJmYngxeHM1RGNuTEpnSFczVld0?=
 =?utf-8?B?TXB0d0E0aWw1M09JM1FDTFUrM2RTbE5zQTZWeXBndUR4cDdPU3MvcWR6bFRO?=
 =?utf-8?B?bVkvSmZQNkF3NFp3MVpzQnpaRHQyTTBWTUZxK2ZXY0tLcUYxRXV4K01EaGxy?=
 =?utf-8?B?ZXUxSXFZN091S2ZCSW5EOW5EZXpHdU9uc3JFUUVzQ0kxOTlUSndoVDgwSlBm?=
 =?utf-8?B?WWRMM25GSG1WcFZBeVNORmhHTEdWNnNhUlBxY2ZiR042ekE5SzVFdEVLUm1R?=
 =?utf-8?B?dVMzYUJDeUwvZzExbGZMb3ZDc0Njclh4QWVuc3FkY1lhZzNGb080Z1lvZThR?=
 =?utf-8?B?eWRCNytTYmZSU0l4WElPenB0anhCQlp4RGowN3Rsa0MydTNZM2pQUERVbXlt?=
 =?utf-8?B?M0tMbHU3d2hBM1RmUUpXWGVHV0ZWWklNTCtXVjZqak5JckxOZis1R0NrZ2l5?=
 =?utf-8?B?cllHQ2JXZzRMNDZxbVB6ZXVzUnVvd3V0N0V5UndSN25lTWlCZHpyRXZUa01t?=
 =?utf-8?B?ZW9TamlFQTRweFJxV1BkYkNHTEpBelB2QXdDQi81QXNJSGtiZ05Ra1VaWmR5?=
 =?utf-8?B?dG9ENnkycHo4dFdadXJLNzlCUzNLakg3SWErT3k0VnlqSzgrLzhvVEo4bFZs?=
 =?utf-8?B?ZWcyR3RtbmcySGNCVzFIS21GRFJPa3F0RUZqc29rU3JONDZ4NStkODFlUFhr?=
 =?utf-8?B?ZWlMVkhYN20vbkhha1hwUzQ4V0oxcnA5WVg1cHFLaHUvbkozYVN2YmRKcnRv?=
 =?utf-8?B?U1UveUZONmplTC9XWG9EQUJFTTR5bDMwZ005U0h2Y0JhQnpsdUkzTFlRME5S?=
 =?utf-8?B?bHhXeU5KOHN3QXFFMTR2cEthbEpGeXNzczBHTmNITHhTck1ER0dBdkxEbDBH?=
 =?utf-8?B?QWhsQm9LWmJ4dEg1Nnk1cDQyMFVrMkRHTzdxQ25oOUo4OG12bElxWHdpNUtS?=
 =?utf-8?B?Wk5LM29KQndOWkx5Tlh3V2xpaDkyZ0lOdkY5cDVKR3Q2M0FoMnJGUm9abVJZ?=
 =?utf-8?B?SHZEMy9iOCttcVJIU3NDSzdRQ2YvdlA0RlYzUUdEeFNkR0F5ak8xekdvR1Ft?=
 =?utf-8?B?eDhaK2ZpUzdld1FWcXZ4YVd2VE9oektZZHFsMWVsVjcvL3duNDVLbzExM3JU?=
 =?utf-8?B?MUE5SHo1K0kvL3p3dG91djJVUnNJT3lCZFgwWXJTVTRwUXVlVWxDaE1ZK0hE?=
 =?utf-8?B?MzBia3lDZk5jMHdYVUgrVDYxUy9icm5IbnE1c3p4Rml2OHpENkpHVlgwY3l3?=
 =?utf-8?B?aUt2YVRZZy8yUjQrVFB2L0E2OFVyQ2NHeWhZcVNKQUN3bHZJYXNvU0hDZ1Yz?=
 =?utf-8?B?Y00wSnBiV3krczlIQWVzNVRnUnVmbnIxSHFSMlJWY0dKNWRZMS9nM21hUTFB?=
 =?utf-8?B?Z21icTZJNVhFUXgwZ3dMNngwcVBhSm1CbGExTkthVUhYWFlJRkJVTzhTa1lC?=
 =?utf-8?B?Z1Brb2IwQktXT1c2T3ZNOUk5cG5QeHJsNllHemYrMVNISE1LZ1V6RGUzdHEy?=
 =?utf-8?Q?ENChyBJ/5Byl5EGuAZDwgMKPiv/Glc51?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGYrcFNnVEJHNjFJcFpKQnlsZEsybC9rWVozU0g3ejcyVW9GaE50U3Q4UkJs?=
 =?utf-8?B?TEhPY2JYQkFVUU9CNk5MTEo4WEQvemh4L0ZHaXlBc3F2Yjg4M3RUWUtkbktJ?=
 =?utf-8?B?dkFkMGxQaE9kekhSeW1UMlQ0RitVV0FJdGVYcDQzczE3dTZjM3dpUVN0aHRL?=
 =?utf-8?B?TTVqLyt6Mkc4azBrMFc0WkR0NFdYS1JhQ1h5QWlMKzFRa1FMRFpqWWtNNHNa?=
 =?utf-8?B?amZrdnJaamdPa1RZcE1UUFp5cFpqMkJuU213ejVrSkx6czM1eFhWM3laUkJI?=
 =?utf-8?B?U1YyM0s2bG9HY1FoNnVtcXFjU09rZDcydUlRSFpmbURPcEowUlpBS0VuMEJk?=
 =?utf-8?B?SFJraWpHT1p3dVlCd2dyMnJIamdDcHZKdVl4RERzUk05djErS2hRQnk0TUV6?=
 =?utf-8?B?KzNxYkI4S3c2K2g3RElRYUUwQTBQTEJkWnZvbGQ2YVd5d1FSVzI0eUN3ZkMr?=
 =?utf-8?B?RDN2aEsxcUJ5N005NGMwaTVwTTc3cjQvM2c3Y2haSHdTbkdoTEU3M0NUTVMr?=
 =?utf-8?B?bStCTVRPVnRWSU9Bb1pYeW85YSt3Mkxvb3VNTU5SWEsvdnZsR2lFK1ZOZ0pz?=
 =?utf-8?B?SlphN0EyaUIwa1pjVTgraGJYQjE0MTZDNWZpQ3JPQkdSdXJnL0JtT3AzYjNW?=
 =?utf-8?B?dEEvMUVpVFBzbzRjYXhpbjBsWFpVcUZKcHFpa3dFbCtPTmZCbi9aK3Y1MENI?=
 =?utf-8?B?TG9sdGljMFZ0elZDUFNNTXRncEFOSDdpZ3ROT0ttV0xXQXNvQ09hQmNsaVY4?=
 =?utf-8?B?Nk1HbVNJcHJYU2l2dmZPVHlZMDZRZUZ4QXhDVFZaUU5aWFFSSExlSkxlZnJp?=
 =?utf-8?B?M3JLKzRjUWpReHFKVDMzZVJvRVBTVlRiSW5GTG9mbU9oQVR5SWRLbWRxMmNL?=
 =?utf-8?B?YXg5UVdVRWRJWmVnOENyQkZOVnFjNlNKQm9VTU9nZlhRT21wZDBzUUtUeFNG?=
 =?utf-8?B?UFQ0dnllbjJtNHFyVUVUSDNmMXErU0xnZGk4MTNzMnJkZDluSjVGYjNiTUln?=
 =?utf-8?B?RERtMVhudzd6WTVydHR2cWI1Qk5MeU5ncDVMYS9PR2pjRTMwQ1o4YzBCZkFN?=
 =?utf-8?B?RDd4RVhaTjZwWEJ6ZS9kM2xKVUNBSCtreDdSV25aaExUQWFBUHNiaXBzdk0x?=
 =?utf-8?B?R1loSHZad2IydTFFa0pBM0l1dzd4MDdyY0RHZk5pUkhWK0lyMXBsZWQvKzlK?=
 =?utf-8?B?V0dUTHNOUEN6WVlDRkI1c052b3FKektwWFExdVJPYUpSZ1RJczdtamNEbExE?=
 =?utf-8?B?QUk2ejdITTdGOEVEdE5ITnl4WFk0RDkrMG1IeHdxVW1tYjB1VGU2SytiaXdl?=
 =?utf-8?B?dnk5Nk5OaUI3MkI3a29QNGlKODBBWVozYWV0ZXNlblRpTXdCbGlhbEtXc3d5?=
 =?utf-8?B?V0dLMy9ncnF4N0NISk5xdEpRL1pSNXJVTTRJQ3piOThYZEJVcWVnZ1Z6QVhW?=
 =?utf-8?B?VDk1alVBSDJVNkRQUnhrbXJjOWw0QTRBdWtjcEZtbFRLaFlsNzJOTnlIcThR?=
 =?utf-8?B?VVFiQXJoczVVNXhFN3lIOFNpZXZ2ZWpZN3Yzb014bXdFL1VaNElwa21pSjJ6?=
 =?utf-8?B?dUluM05Ra3VlRFZoMUI2WS82aDh3QiswVURmR2VLYUQvcXNYYmFsV04zSkxP?=
 =?utf-8?B?dVBMenpqbUhoOFRtSlUzeWRxUGxDOHVVUWp5M3NJa21QMjNXZUp0bjhIeUpj?=
 =?utf-8?B?eFF2c3dzYWtHeHVxSFVaV3hKQktKcG8vaXo1aVNOcHAyME1Tcm56VjI1MDhY?=
 =?utf-8?B?S09aMkpycVV4RlRsNTFKa3N5YXFjdXZ5Z0RLZVBqZEFCTlZNY2Y4S1F4VFN1?=
 =?utf-8?B?dkV6V1plQ0F6RGl5ZXMvZ1FhUXNybG9XamVrNmovTmJIeTc3WjFkODV6OGp2?=
 =?utf-8?B?Rm8yMWpZdXQ1NTlTWWM4d3V0Y2k5Rm4xT1lpdTk2bFF3RzlwcWZVQ05SdW1n?=
 =?utf-8?B?RktDejF1VHNVb2xpaTI2STFYZ1Jra0lDZ29mZ0lYUE9EUXBhN0lIWWZ6S2E3?=
 =?utf-8?B?NjhuejNZckxSVGFPOXZSRE1tZDRzK252RmVkcWg1dGw0SG0zWkJiODlqSElY?=
 =?utf-8?B?V1BhZjRyUHpHOGpRVWduKzRvUnphYzNneDhjcnFvZU4zNWdVdWFmRlFqR05n?=
 =?utf-8?B?Vk5ENWR6RTh2a054ZDRmelZ5WmRVcTQvT0xFenYvTFZFeVlGRzhTaVBCKzlo?=
 =?utf-8?Q?gjwqTKhZmkc4jdxGT4qLCaA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1418e3-416c-4d15-40ad-08de30eda77f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:24:01.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQLGjc0APU1qfcUuXRZIK6wyLTb/3b1pe/65Bxif2YNSdvvaLD0ip6AJ6btTvhBv1x8Ga5n1gyVjPa3Scf6FVkx/aU7wFktISLpgTeDz43A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10666
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

Hi Heiko,

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The DSI controller is also part of the VIO power-domain and it
> definitely needs to be on when accessing it to not cause SError
> faults, so add the power-domains property to it.
> 
> Fixes: 5023d0cd6183 ("arm64: dts: rockchip: Add DSI for RK3368")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/rk3368.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> index 8f0216203241..5b2cbb3003b6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -896,6 +896,7 @@ mipi_dsi: dsi@ff960000 {
>   		clock-names = "pclk";
>   		phys = <&dphy>;
>   		phy-names = "dphy";
> +		power-domains = <&power RK3368_PD_VIO>;

Shouldn't we have the same for the PHY as well?

It's not entirely clear to me as pclk_dphytx0_phy seems to belong to 
PD_ALIVE according to page 62 of TRM v1.1, but Table 4-1 RK3368 Power 
Domain and Voltage Domain Summary doesn't seem to confirm that.

Cheers,
Quentin
