Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297B8CF875E
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 14:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8A210E502;
	Tue,  6 Jan 2026 13:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tD3zL4Dm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013038.outbound.protection.outlook.com
 [40.93.201.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860A310E502
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 13:19:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRQ9X45blSgR5suSOxR5oSxDnJ+YRdqCFTZhE68BV9xqCOcHi1xXQiOdeGCnCvoJOUDAnMFuCGm2lmUdlQCqvtd3yrCciG3hPsTBxM7nbOma6okzC8fcPFVSDGlYC9Yegz6TG45N7buLWWA52fwnMKP+ad88hWc0167R5n1dlEeNqseM4/wNVDP32/elOiLw8P5XRMnA4entsD1Iqq0ccutgGAKRALMhTBjK8bBKtXEKiVN0FKH/pMjJFjTB1cXAJ7csPz8lDpixdZqAj6c0XISa365rUwVpEmZd8oNQhilOzNisBZmYSMSvPcODT17gxSfkCFkIwjkV4Q7OXOcrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L84Y23RR5+Hk5RMtH8LvdQAvphtZ2e8wjCgv/z6yPRY=;
 b=XdUiCraBpDFQLlBVH1wU+cbOshZDc4kKLMBxorb7L0YhCwbKbWB0/YEaMxGUqX+wsG1h7voZtcEfk+1eMQ9af61Z6hTMz4guezhjkfzb7SQ87z0gCecLyqYAW0QaB7Xfc5XMFOXPNBUsxrJcRA+SVcgNftVf8kalHYQyoxJx76/yZJ7lRXa2lIJK2wE/tZwwlkIpuGMK8LunWtH6h4CVCt2ypecQ72roOnDYh0FPl2yZjVhuJJZPWJoBiDyhHlq3wRxCZnLWCpK/4AeT4yeIyomjpiVkmsK4BnUel/57u+q3XDy3nWkbB0YZBd9qMLZSzliEZCdPtjLWe02ufA7aCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L84Y23RR5+Hk5RMtH8LvdQAvphtZ2e8wjCgv/z6yPRY=;
 b=tD3zL4DmZ9eEuYbE0K5tl91Fc5CQVD3XiqeMK0EmY04jypCVX9fAflpYKVe42F+G/OfaIuATzRV0ulWLzh59yUrEAb4i1MNtB01pDeGs/XTwO46DJNIV/UvNm43ItR4T5AOaBkcxptRFkKNQjABj7RGdL4hMo6x7PYYGWVJlZr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ5PPFF62310189.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 13:19:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%5]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 13:19:40 +0000
Message-ID: <3e19f17e-3d5d-4b48-8776-65ac2543c066@amd.com>
Date: Tue, 6 Jan 2026 18:49:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 max.zhen@amd.com, sonal.santan@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
 <20260105172956.3732123-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260105172956.3732123-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ5PPFF62310189:EE_
X-MS-Office365-Filtering-Correlation-Id: b498149b-7df0-4f80-cf42-08de4d263f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFdONjVpd1p3dTdIQTJDZm1sanNUd215TkN3U0RZdU1iQ1EvUitTWHlDekVP?=
 =?utf-8?B?ZVdkYVFBWUpjTVQzMXhoRkhvcit2ZHY3VXdaNHN1cFFSdU1FQjVUbEZNWTJY?=
 =?utf-8?B?b3NiUmlLS1VSNE1mazd6bGhtbXJBYTQxcUI4Ynhha09UZ2JYNXo1bndia1NS?=
 =?utf-8?B?MGJHcG9DR0ZRVHpEVFhRRmpTSXM0Z0dwaG5ZV0J3RlZFWDlxRzA3QU1WYUE3?=
 =?utf-8?B?cjlEMFc5dlU3T3dUczhSQzVSZ0RUY1VOK0NkcW9TcXVIM01yNlNLYnpNMXA4?=
 =?utf-8?B?eGxBZlBZYjhLa2dhenNqdkJLQVQ4YTRhL3Fhc0FXNldJb2lQeXlwWVRTSVlm?=
 =?utf-8?B?YVAydmQ1ZjJDeENOZk1MSzFVQ2owSXU4ZjdGR1JVZlZUMWFMVTRZUU00VTFY?=
 =?utf-8?B?V3ZWTm9DSnhtVmphUW5uWnVkOGFrcC9lWE8wSmt5L1IvRk1jTE5WejJkVVB0?=
 =?utf-8?B?eXBjbE5INzhoZUxXcEhOWTZScHE2dmNKQmJnYlllbVBDdXJ1WlBjWGg2RnZS?=
 =?utf-8?B?T3YzcmhPbEZXTlg0aFIyZkNKek45R3c5SDlOaWhEN2U1N09uZTdraG9RUGtr?=
 =?utf-8?B?N05tZkx6dnk1K0NzV1d5SlpYV1llbTRianZnb2E0MTdsOFp0UjY2aVNMcHlw?=
 =?utf-8?B?Sk9ieWJPVkFRYTZFNWZObENEVkZQYU5NbXZaU1Vqc1dmcW1Lb1h4c0xMY0FT?=
 =?utf-8?B?bE94cTdwNlExeGUrbVpIdXVINjErYkp5OEN2WDNNZjJvTit6UW5IVUdBV1lh?=
 =?utf-8?B?ZGZRMVFSWEFSK0xGM3ZiMGcySi82VWtGVU1HdVFCSFRINlJwWmNTd2pFcEFR?=
 =?utf-8?B?ZTdQNWI2bnh1YWhEajU4UUpXbkF3aWNDeXJ3R0thZnhSWldBbFB5bUVvdVNO?=
 =?utf-8?B?MlRWTHpNOEZPV0p4clJULzNHcGFmMEV3YnJxNjc3QVhIWDBEbnN3Vi9aTmtX?=
 =?utf-8?B?bVpEOXBsWElmY3ZwMVdwRmdoMnZudlk0QVc5TU0wL3pNMnNyRUZnbDBjWXUx?=
 =?utf-8?B?T0ZKY3NjWnZNeW94c3FFWGhXT1R4c2VCWUtYSHliNnZGcHhHMVBITU1TNHZ3?=
 =?utf-8?B?TkZiZDlkZ1lpc09QMkNselRyZ1M2WTNLN0ZCMGllWVpxVmVVMnF1MUxXT3ZI?=
 =?utf-8?B?bitwS1NEVlo1KzNMZnluS3hLdjc0SmduYVY1Zkt6YU5UdWg2YXZzMjRnWHJF?=
 =?utf-8?B?WUVCa05GUXlMT1hxeDR1OFpMS0d6dW1SLzEwWU01b2ZUWDRIYlZhUTg0YVZz?=
 =?utf-8?B?eTQ0bmY1dVJQWDZ6MTROcGRlRVJHRWVGZ3FCQVFNaXZielg5VGIxQXRSZDhD?=
 =?utf-8?B?NisyYlByZVNOR0s0M2VGRnY1bUw1UWF1OTE1KzRFM1M3ZXNiT21QQzBVaXR4?=
 =?utf-8?B?djFJOUpucjhMbFpXRi8yNC9DMDk3Tk5ZclBjM2V1TTk2OEVscENtejJSVk4x?=
 =?utf-8?B?NDZ3MzZKOUhBU1F2VGdxTEYyU2tGdmY0eGhxZlEyY1JEL3NXT1Jrc09paHZL?=
 =?utf-8?B?MmZqVDRmTGtHaEIzS3dIdVhRTVpBand1R0pPTnhOSGhkbGJTZ1N1TDRKaS9k?=
 =?utf-8?B?aTYyMHlXUFd2V3h2T1VkaHpkb3NhRkd2RkVPM05XUitPNlNIUjViT1c3ajBB?=
 =?utf-8?B?QlZaNDU1RkpROGF6Q1BsZFVraktxeGY0bUhyVEVvWGtXdWFiSlBRVmhpZFU4?=
 =?utf-8?B?RExUa3cvd05KZ1VqcElyZnNCNVRaUDZqUEVwTDVncnVOUDJGNy9EdDhoQ1dv?=
 =?utf-8?B?Y3lLWStOMGVaazZ4R3Zua080YmtjcEtnRnJWb3R6a21sUWhJL0ZZUjVSN1hD?=
 =?utf-8?B?QU5HdXR5OEpuaE5jUTBPQXEya292dkNxdlZPUDBwR04rbVpxVTNmWG14MEhQ?=
 =?utf-8?B?ekxBSWFXUjdZN1g2MTBXSXQ0MVBMMElmcUtuOURqK1gvQmZ2WkZsQ3c2ODRS?=
 =?utf-8?Q?+eZDAC2kmux88J8AD7OH9HYRvSbcX+rE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm4xV1JRRklIVzhJNVYwZERkVFpBcHNpUVRHcVB1a1ZWTnM2Ny83SkV1OCtu?=
 =?utf-8?B?dXN0emdBMzVUTzN4NTFWNjZ2WCtwZytteUFXckVkSjlYV011eDM5Qk9PU2Ux?=
 =?utf-8?B?azkwNGFCa2xPdThhakN6WlBEbTRjYno2K0VmNVZPSUhoK2FwTTg5a0VvNVNa?=
 =?utf-8?B?V1ZRcXg0VXdDemYwaFdmNGZUM1NzQmEwUXplS3ZHZXNQbjlxaTl5T0ZCSEhq?=
 =?utf-8?B?R01qUktEWmJIamxYdDgyVE1WN09UUThrQUpod1FoZ0w1TEM0QWMzS0o4dkNu?=
 =?utf-8?B?MmVRblpxNlAvZzE4OENGWDRjTXY3MEpndzRqUDk0Si8zNFlMU2hjNjJzeEpa?=
 =?utf-8?B?V0Rtem5MRlJiMWhLRjdaSTZ6NzhncXA0NXBUdjNoU05QVjJLbzhOWHhTc0cx?=
 =?utf-8?B?QzVkcDBSRUkzQU9ZMkpVblBPUzFNbXRreXBZeVd0RzdUNTR5VDVucyt6ZXhp?=
 =?utf-8?B?bTVmSWcwZjZJQ2hCcy9pblZ1S29ZakFBUlFmT21vNnJFWWVVUmkvaHNtSzNE?=
 =?utf-8?B?T2YrdlFTMGdBTFVvOXQxVGtvbDZDZlFjSjVwYStJWi9QREJYWWRGWUJhSEhF?=
 =?utf-8?B?ZjAraWVCOFNMQS8zb0gzNGlrKzZ3b2ludkRCTHRMcFVjVUloOGFCcDBrU05t?=
 =?utf-8?B?TC9SNDBRSGJaR2NVSlFQNGNubzBmVzhGTEVhbFExMG9YME85Z0FiTXhYN1Mw?=
 =?utf-8?B?WW5VM2JOcFNwUDRhaWFVQVlvcHlOUzZzQ014dzd3MEp5M2UwaTQwQk5NMnlQ?=
 =?utf-8?B?Z3ZublA0ZWxYakVRNkxhRDg0cTVJdnlWalA0RHRJeTV2UWdWWE5OOEtRUXpM?=
 =?utf-8?B?dnI4UjJLeHd5K1h3MnJaRThoOXQ5cy9FWlMxSjE1RjBTQWhVNUZGcFQ3WE43?=
 =?utf-8?B?d2RIb2REVzJGeUFqZDZpQ093SEpWNU9zUVBydnRTRkxTRTlQdzJFMmEzdDBZ?=
 =?utf-8?B?bktnanV0RUUrYzRPSTUyMldjTThWcGlFTmdMak1rVHN1ODVmVndEcFMrL2Zt?=
 =?utf-8?B?QWVkRnVhSkduc1lLV1crM3kxcGFZOE1HclJxNEN0UkhpK0lmaEI2TmdHSUNt?=
 =?utf-8?B?Q2hWSlJ0NzdzQ3J4enpYOVVHeDhZOWxZRVIvWGhjaExveFBpaDdKS0dyWTFu?=
 =?utf-8?B?Nk5HNjVsOE1rSWRsS2NPMWdTK1JkMHgxaFZmU2VFS1pCa09jYU9ra2lnSkNl?=
 =?utf-8?B?QmErK081RUN1OENweDlSVmtzekdhS2RyaERCUTF0U1pBTkpNWFRoenNQV1R4?=
 =?utf-8?B?a2lrbGI4SFFHVzFOeDRNRXNncGhVeEtBYWRkUU82cjlralhNeFROMTdyLzNx?=
 =?utf-8?B?N2NQYjVsNHBNYjFaVXEwb2RtNndmbnc0K0FkSE1XcUZNWllLTUgzOGtWVUM5?=
 =?utf-8?B?M3VlcnhMMkkxTVYrMlBsKzdQcE1Vckpva2dPOVVsaGhjTk1WcVl6N2hyR29P?=
 =?utf-8?B?K2V5U0tub0dxSkd0a011S0k3N2Vzb05TMkpzakMvSmxnNDhGNllOMTBDZFBn?=
 =?utf-8?B?bEpRM3Q5WGNaRkpxSnFsTklySy9QSlpUamtWTWJ3WUZKUU12Z016QUhjVldZ?=
 =?utf-8?B?WFdvVExsNEJSN0phWHpCNTExdnFHRmRicWdBMkk0bXBXR29VM3VDVXhackYx?=
 =?utf-8?B?aGdNeDV6azVmN1ZYWGxjSkNUazEzZy9FQUpwdHkwTnNDSEdSZWdXK3VBMm1h?=
 =?utf-8?B?NTRyZmJ6S2p6WkxqWmZQZE5RYkJDWlZGTnRoVTlhTHJDald3TWxYMGt6ckU5?=
 =?utf-8?B?WDdtQXVDUVBDZFRCejVTL2ZPMjQxc1lKVGNUZTBHbnBLR1o2alpYb2d4OVpV?=
 =?utf-8?B?WERTcFZpTEdYWmdZUEdma1gvTjJ2UEtWaDFialpsRytWR0JMa0VuQThMNHhq?=
 =?utf-8?B?blBHYk9ZS1YrbHBFMDBOdnZRZ2UzVTZPa2pnQmFRMVo1cnQrblBYZ0MwNTFO?=
 =?utf-8?B?QmVRVkN6TzBxN1FhbElxTHhFR1dOaVNUTm1WeXZTSWk1SGVLVGdWWFJhTVRj?=
 =?utf-8?B?bTh0WHVmdVRVcjZBV3B5UWJqZ0x5L1RYQmdYWG83M21KUDhQWXUvNk8zTHNj?=
 =?utf-8?B?VG0yMGEweVhZV0V4Vmo4K3JFTmlsNkQ2SXUzV25lV2M0NmxTaFRERGF2M1Zy?=
 =?utf-8?B?SW5MNzlHZHYzbUFTQk1aMnEralVKT2FtYkRMY2RtVXBxZHZnS3lxZ3kwKzlv?=
 =?utf-8?B?Q290TTFEQ1Q3NFV2dHNkaXlPbW9oa1ZheFBrWk4xNjI3eXd0MmNQT21nL0lZ?=
 =?utf-8?B?QU42K1EvQnRnb2g1bDFIVzlIeG1GdDl3eUlMUG5ndkJ3MmNuaThCbWdVck1q?=
 =?utf-8?B?N0svdEtsWWxwV2Zoa1R1U1RicWVqQTNVZWQzZ0xCdE9xUTZpSmVwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b498149b-7df0-4f80-cf42-08de4d263f46
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 13:19:40.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeywuUx4Pz2yesah7Rm1aMIwImR/7nOgc7ggKPOmPzutshKzTb0qvu5Dys6thko0GjIjsYeUr7GB+hCo+2OxXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF62310189
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



On 1/5/2026 22:59, Lizhi Hou wrote:
> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
> interface to make NPU metrics accessible to other drivers like AMDXDNA
> driver, which can access and utilize this information as needed.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> [lizhi: save return value of is_npu_metrics_supported() and return it]
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Lizhi, just noticied that this patch may not apply cleanly on
Ilpo-next (which tree does this change land? drm-misc or
platform-x86)? If platform-x86, I can share you a rebased version
offline so that you can wrap into XDNA series.

Thanks,
Shyam

> ---
>  drivers/platform/x86/amd/pmf/core.c | 76 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>  include/linux/amd-pmf-io.h          | 21 ++++++++
>  3 files changed, 99 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8fc293c9c538..d180a39e03bf 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,12 +8,15 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> +#include <linux/string.h>
>  #include <asm/amd/node.h>
>  #include "pmf.h"
>  
> @@ -53,6 +56,8 @@ static bool force_load;
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>  
> +static struct device *pmf_device;
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> +{
> +	int ret, i;
> +
> +	guard(mutex)(&dev->metrics_mutex);
> +
> +	ret = is_npu_metrics_supported(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	memset(dev->buf, 0, dev->mtable_size);
> +
> +	/* Send SMU command to get NPU metrics */
> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +
> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +	data->npu_power = dev->m_table_v2.npu_power;
> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +	data->npu_reads = dev->m_table_v2.npu_reads;
> +	data->npu_writes = dev->m_table_v2.npu_writes;
> +
> +	return 0;
> +}
> +
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> +{
> +	struct amd_pmf_dev *pdev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (!pmf_device)
> +		return -ENODEV;
> +
> +	pdev = dev_get_drvdata(pmf_device);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return amd_pmf_get_smu_metrics(pdev, info);
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> +
>  static int amd_pmf_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> @@ -477,6 +547,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
> +	if (err)
> +		return err;
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_dbgfs_register(dev);
> @@ -485,6 +559,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>  
> +	pmf_device = dev->dev;
> +
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 9144c8c3bbaf..1bf896c5b92c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> @@ -413,6 +414,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct mutex metrics_mutex;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 6fa510f419c0..55198d2875cc 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -61,5 +61,26 @@ enum laptop_placement {
>  	LP_UNDEFINED,
>  };
>  
> +/**
> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
> + * @npuclk_freq: NPU clock frequency [MHz]
> + * @npu_busy: NPU busy % [0-100]
> + * @npu_power: NPU power [mW]
> + * @mpnpuclk_freq: MPNPU [MHz]
> + * @npu_reads: NPU read bandwidth [MB/sec]
> + * @npu_writes: NPU write bandwidth [MB/sec]
> + */
> +struct amd_pmf_npu_metrics {
> +	u16 npuclk_freq;
> +	u16 npu_busy[8];
> +	u16 npu_power;
> +	u16 mpnpuclk_freq;
> +	u16 npu_reads;
> +	u16 npu_writes;
> +};
> +
>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
> +/* AMD PMF and NPU interface */
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>  #endif

