Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFFC97CDEE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 21:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECA310E76E;
	Thu, 19 Sep 2024 19:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mBb5TT4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29C410E76E;
 Thu, 19 Sep 2024 19:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYRFFerVPKDlFiDHFAqylHjZLGkmN+LeSeqPF3HhW/IWKxfQXlyB50qaj3TDKP0aOpnScwzoBACEcEvgKS6Kj3tvRyX9W1KZa5LZmkyodFGcGwlmpSXLnM8pglT/QvWRipwqnJ/o/HSytBB8n1AAdTPlOX+EokqAQj0NjU6b0Awb4sqY3pb1LmmoB5mQuYVV6tnINQk6Ate0V5A6bBhVGQ4JZvKQhEjznBf4A8ISakrlo4hBktf6u2mWABPnIg4n9yNy/Xv8br7LncUGmpEYJKlASEp1+mOFug0ZR00u+8hKHEhhVNC4kbGfMxQuh5As3eLqCP8pL+5ptFFM/ZaCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djK3fO/uIF3DwuAEFZfzytFkt3c9k8cEkyZGwS2CmVA=;
 b=i3najr3cfKFM/YyyumCyTcvjBTsuME0AnN1yUMx4Jm/t3X1lbd8JO+cfGZo0N0diVzfI3UpIzDF2vd4sf6Ovcl9/fRBsrDtybhNSOiB/6Qnd1TY3QBhtnMT+TTCamsgX9gh6QxlnwBEG45ZvFFT7IZMvrc5sExv5IRg4zt5Zfyhrl1blmIvL+mMG3/YyROQjx7cii3XZ4ZJAo7KI545ysiBKK5LAB6WYCSshJatTYh3Ch1bEdD28WLhteZcLI4JOUghbS6PR12aFxM2m7GLos/4j+UcD8yLCQ6hd2SgUFnnQHiLL3Ix2zax/RNjpXWpIf1EcfMYJ3jB7sd/4CzMn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djK3fO/uIF3DwuAEFZfzytFkt3c9k8cEkyZGwS2CmVA=;
 b=mBb5TT4I44ogJqSW0ivnDngRg9QcKxABqSrf2C/3Rti8G187ARbZPRYHlIYG2qNcEzD3qRNjPs+tBdk80gJnJoPv6aqPFZyvonWbV1q102NojPLBuCFfQYdU4vgZwOQzTuQMDQBLdiuIrQpRJiDwe4Ao/PuhNFpUqLnDnIuR8k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 19:01:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 19:01:51 +0000
Message-ID: <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
Date: Thu, 19 Sep 2024 21:01:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
To: WangYuli <wangyuli@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, vitaly.prosyak@amd.com, yifan1.zhang@amd.com,
 Tim.Huang@amd.com, jesse.zhang@amd.com, Prike.Liang@amd.com,
 Hawking.Zhang@amd.com, kevinyang.wang@amd.com, srinivasan.shanmugam@amd.com,
 Jiadong.Zhu@amd.com, tao.zhou1@amd.com, pavel@ucw.cz, lee@kernel.org,
 aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: af41b901-651c-4774-c680-08dcd8dd8524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNoODV3QnUxMSsxNVZlY2RqZ2xTYWx5YTJZMDZuUlREMERIRDgvSUJvUFVs?=
 =?utf-8?B?OVBaTEZ4N2g3MENZS2U1RTNRWkZWOUlHaG1VYWRvaExzZ3VHYW5FdWRSNkRp?=
 =?utf-8?B?bEZBblVsNGZ0N0VVZm1pVkVPMkQyZjY3cWt0eUI4RHVVQ2R6dFJMQ1ZONENw?=
 =?utf-8?B?YUNRVmRiKzQ0ekNLaS9HUHllY0VQUWt1b2JwUWhtUzJPeTZ0a0xWbTVuUHNL?=
 =?utf-8?B?dlN2SDg5cXlDVS9rUDVZL3lDMkdmNHRSZmEyM2JGQzFmK0YwTHpjWEF4SHFC?=
 =?utf-8?B?aDlWUFczY2ZVcnRHaVhPc2dRNi95dXBnNHdoVFJKZnc1bGxlbTVTYmhLOWk5?=
 =?utf-8?B?MzJuamFwb3gzUFFwc0Nud2tLYW9CamZLS0VKeGJQTGZjNFZsZnpNZFlpQU40?=
 =?utf-8?B?RUp0UkNqNXVVWVEzVUV6ZzZYWlJaeTc1NnBuK3BvaERXbzZoR3JyK0JUQTNw?=
 =?utf-8?B?M1RabU5HR2ZhOWM1d0xaaWRldHJkVktSY0ZKZ3Fub0xRejJhek5qckw2cEQ0?=
 =?utf-8?B?cW1vcXc2Qy84YnkwTFc5RU5VUy9SSU16MjA5NlRuNXliSzZCU2x5NGtXMlR5?=
 =?utf-8?B?bTRhNTVETFFmRHBrYitBRGtVTkNHcktpZTdyTm0xZTBPSXNhK3RYUS9tV2FZ?=
 =?utf-8?B?UVVUQ0doMmVrUDE3c1RFSllGOVRJS3ljbWdhYXV5YjNKZnJocVF2dkdLbFBK?=
 =?utf-8?B?dk16NS9sR3ZQdnlRME9FcGJUcUoxWWxaNERQb2V3VFB2eTZTVTdkZ0FPT3R2?=
 =?utf-8?B?dXdlSFlkbWNMZUo4dE9OcklMK0pFc2FMSFk1SmxiTm8vdWJCWkZpMjM0ckor?=
 =?utf-8?B?bE1QZjJrVjNScEVQRHowSGQyMkRJaTFOSzFZWDJiV3hycjhGcHJndjFqaDR0?=
 =?utf-8?B?dXErb1VvR3A3d1hYRWM2bGFYalhCekVRMHpDYnFLNVQvS1FHNExZWXRsWGNq?=
 =?utf-8?B?a3FZdFNYSldTZzQzY0JNN2duZHI4R2J4b0FrS2QwQU5rbnc0cUlwYWtLVGcr?=
 =?utf-8?B?TmRRWE5nZVFrZi9CakpBeUdLTDRWVHhGTzFDODc3Vm91Vis2Qk5jNzlMQzEv?=
 =?utf-8?B?L3FhUFlFL1N2eVJQRjBHaFZ5c01iRUtoUGE0cHp1QVFVYVB3YWhwSnl5SVg5?=
 =?utf-8?B?T3g5Ymk5Z1oyMG82WHFSN3pBK1lDMWhUZFlIZk5XUG1LSXFPcFFuSTIxbStW?=
 =?utf-8?B?Z0JqazgrTzVna0xwaGh5SmVuVmtwQVZUSkppNStOcXc3dnd5dHJjSm4yRHVw?=
 =?utf-8?B?OXV3T0xoZWp5bjZVRGFQeFVJMmJqMGpScklRcXBOck9oZ3Vrd1JMbXZ4T2lT?=
 =?utf-8?B?V2lTam1ldkY2aXR0VCtJTklzNFA5MjNIWSt0aFE3by85NkI2WXNWbXlGYWFx?=
 =?utf-8?B?Q3g3RHY2WmxIU0RDTWI0MTNxUzA4UUpKOVJpcEo3c01zdG5xbzVxNTZEbTFv?=
 =?utf-8?B?Vm1Bb0RrRngxZW91UUxpc0ErNjhqMmJ4RzUyM0syMFNlc1F4QmFZaVdPSlNP?=
 =?utf-8?B?ZjhjOHpJSFZIY1AwZEluUjZ6ZEJpbTlyeHJkS053TzI4UjdKQklqMFExMnZr?=
 =?utf-8?B?VzhqcmdCNHVxTmFXcXZmWmROdGFJOFN4b1N1TVVqaUovVHVGYStNTkhHL2E0?=
 =?utf-8?B?bUlReEtVN0lTN00zUTBKYm1EU2h5Y3BvZ3lhSC80WmpmTmI2cTZXb3lYbVp5?=
 =?utf-8?B?eCsxVVZlTUx6eTV3S2RmTHN1R3dvZHFqcFpVTmRqODhiV2lrVkdEd0Q1T2Jy?=
 =?utf-8?B?dzRzWFhFWktNMHgyUktSUWZIU0VOK0tjektQTnhZRDI0V0pXbkdWQlJuY3Ay?=
 =?utf-8?B?ZFMxYXF0ZVpaYkZtUVNkL2E2YWdtK1B4K3BuL1RsR2lBV2tQWXhUWnlLOXhk?=
 =?utf-8?Q?NID171z8Na6tz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2p2eC9IZjJ0OFV5T1NEQ2NyQW9YZDZWbEd3cmhlVVlVRzNhQmJlRVdKeERF?=
 =?utf-8?B?Wk1FemZER3hxcFhYNkRNTFJWVCtzWU1NRTNnamkyY0dMV1pSelRjUmhHUG9J?=
 =?utf-8?B?TGtGR1AyY093UDFCRXR5dGswOU1wRm1aOUF1M29zaTI0cVZUOERMQm9ua1R6?=
 =?utf-8?B?SVlLNEh4dzVlQlpFMlkxOXlkdVpuZzlmZi8vVGRmTGNXSHRiZXRDcE1Pb1dk?=
 =?utf-8?B?clBXaTByOTNUUHFwN0NySVhYT2dFQXJISytreXZwOUM2RmxCQ0R1elJrNkVB?=
 =?utf-8?B?OGp5Mi9mVG9iWnpEWit1MVVqOTNvemg0c3dodFQyUkNHS0JNVURXb1E0Y2lP?=
 =?utf-8?B?VmFyMjJqd3oxcmZDaVJNMnFlZi9yMEZEaHJsZUx1VEtxeHdaTy90RXlyczd0?=
 =?utf-8?B?NkxTS05rSERmR3dYZFpxVzA4c3VlaHRuN1ZCcFpZTUtiNXhkbktmb3BwMEZY?=
 =?utf-8?B?cnhDM2d5ckZBY05QeUhtTEllOEVYS08yODJCRHhoT290Mk9FT3J3cmRmc3pw?=
 =?utf-8?B?SFp4UUl1YXh1NGM0T0VxU2FwMnBhZFROajNJaDdaWWo2QUNaVmQ0ankyZzNr?=
 =?utf-8?B?M1FXdXprNTcvUUVmQWxxaDVrbm95YXRpeXFaUUwxU0FHMmd2elErYTI1dml3?=
 =?utf-8?B?clQxSmppVkpqaHFDb0VCek1rZ1c5TDRxT3BZYnUrcXhKcVlHTzA0S0lFbHpW?=
 =?utf-8?B?ZEk2R1dBTWVxRGtPcXhMNzdyL1pMZ2ZWTEU2VXN2VU85MlVrSXV1L1J6UGFh?=
 =?utf-8?B?M21SR3ErR2l3QWdTSjFrZWgvRnJObE1sNnQxa1Zmb3BHTlVYaDdyUXg0NkxM?=
 =?utf-8?B?S1pFOWFpNStPd2pqWmNxbnNSODdTK2ZQV3FNeXp6TmFCeDlsd1JlTFA4MDZU?=
 =?utf-8?B?cFlQbERVRXlPOGZBZWNQb1hlZHZoZ29rcFRES2YvU1J0OC9ocGhpdENEQnQv?=
 =?utf-8?B?WENIZmhBOVhheDczcUV0aUs0VlJXcXp2VDZxc0dzQ2RFT200OUMxY1RxYm5X?=
 =?utf-8?B?aVJBSWxqSHJiM241NmVERGN2S08rOTBuZFUyRmdVbU9tRFhMUmF2VHdWS09T?=
 =?utf-8?B?bkdoOEF1VjBETUZTdk1VOHZJbHpCbGlHT2lXUmlVaXlSeUFFSnYxVWtjUGNY?=
 =?utf-8?B?c1laZC95UWdmK0FVc0J0NUpkajR5emhnbkxheXlsdnJaODBTN2NIZlZZbWd0?=
 =?utf-8?B?WTlOUS9vLzg2QWNpL1QxQ1htS0xKM1VVWVd6Ym9TaFd5bU1YUFV2V25wbzJV?=
 =?utf-8?B?ZUpLVU12ZUFBTzFSZk9xMERTZU4xTlhQSWFXTmhXWlU0YlRSVnF1V1h2Z3hi?=
 =?utf-8?B?MWVMcXA2ckdFUHJvWUlGSTdWeFBjMTNYSUZiOHNFbjlUbHQrUG9PeHlPK01a?=
 =?utf-8?B?cGx5ZjlkeE1HdXlwS2pOQVJJRGFGOG1yUGJML3BLL09wR0xhRUlxRm1mT0tH?=
 =?utf-8?B?Vi9rMFNzQ2tYS1E1U2h0WUxTcVJjN3p2MFZVczRVeDZSNWJBNjB5ZkhYOGJw?=
 =?utf-8?B?aFVSZ3hlakZSbmlidEZPZTczR0FYRmJqMXBUYzc0YjRncHJNYmkwMFlNZnhB?=
 =?utf-8?B?OVYrQTRiUUsxd09iK0Y4RkFtQm1KUFhpVmJwY2RJMkNiTzlFcUVGbXE4dUx3?=
 =?utf-8?B?ZGdxdjlwZVJKaFVUa1F0VjBZQ3pNTmZBQ1RiVG1hSDB6VVlNbENMRGYwTHZV?=
 =?utf-8?B?Rk40WWtOWFFPREgzTDZtS0hmSjBaRkE1dFpjRGhFSjRWbVhQa1U4cFp5SU5T?=
 =?utf-8?B?Rks0SzRUWGV6VkFWMUhFTDR6OEVZUFBuUUpBandrN3ZCdUZiRk1icTdPNU9p?=
 =?utf-8?B?a053bVBpR1I5RFVHakFSSFdpckIwZzRXT3Rrd2xraXBtZTBwVTRZOUJ0SUJp?=
 =?utf-8?B?TU1DVi8yWG51dkxkTW5xQnhTQVJJSmxpbmNSMjJSV3hiYXllTjl6SW5DYitj?=
 =?utf-8?B?d2M4R0o0VC9SUXNqemh0c3BkUnJSaiticjJvelgxMDh0bHpOMTQ3NWNmKzQ2?=
 =?utf-8?B?eE9ISTArT1NQbHkvUE1wZDhKdHZ2TnpxRENWVFhUNDZPbzVZZVBxc044dzRI?=
 =?utf-8?B?TzRpajFPSXk5NjRITVhtWGk3M1B1TkxvdTJtMGJERDdtMXh0VXQxZHQ4NGRa?=
 =?utf-8?Q?/+cY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af41b901-651c-4774-c680-08dcd8dd8524
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:01:51.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFNwOT0ireB7i8ZnNXSaK2I3VBLf0wnRpmRnBj309E7h7vzDGnND36whfk8SKERq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
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



Am 19.09.24 um 20:28 schrieb WangYuli:
> There are some spelling mistakes of 'acccess' in comments which
> should be instead of 'access'.
>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 2 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c  | 2 +-
>   drivers/leds/rgb/leds-group-multicolor.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index d3e8be82a172..f847a9fc61e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -1894,7 +1894,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
>   	mutex_unlock(&adev->srbm_mutex);
>   
>   	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	   access. These should be enabled by FW for target VMIDs. */

While at it could you fix the comment style here? E.g. use

/*
  * Text
  * Text
  */

Thanks,
Christian.

>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> index 408e5600bb61..13dca7377f53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -1248,7 +1248,7 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(struct amdgpu_device *adev,
>   	mutex_unlock(&adev->srbm_mutex);
>   
>   	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	   access. These should be enabled by FW for target VMIDs. */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index b6c7679015fd..548c7dd63ba1 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -55,7 +55,7 @@ static void restore_sysfs_write_access(void *data)
>   {
>   	struct led_classdev *led_cdev = data;
>   
> -	/* Restore the write acccess to the LED */
> +	/* Restore the write access to the LED */
>   	mutex_lock(&led_cdev->led_access);
>   	led_sysfs_enable(led_cdev);
>   	mutex_unlock(&led_cdev->led_access);

