Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC470FA33
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A0A10E2B8;
	Wed, 24 May 2023 15:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D810E2E3;
 Wed, 24 May 2023 15:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKgJYwYthLQNkQsOe0vU9sYWmxGfaPmT7UH2cwH0m27W2b1v6X7ismG9Upvgtg2gzn4IlUK2Ur9JjYmoWcQ0YAc1RKV6WxvnTrVykzjyE+98dVCLX/WdldNdYjL/s/LgOcGxytNQ7V25lzAyVUu7h9b/vCx/ZoXdnpA1t321qCd+Fs8+DhAWR0jTeLhnPtBJtyjjJlVkEyvkDZmCm33PtYY1u30TxTfA7zwG7vo7HxD3J2jMgXwrF8nYbyqlHLRz8uleKLU7zZtnr8VOm0KQkhVQCxLor3vaGrXC0MkB+cFBXpLxUGM21VzoJphVEH5Tc+cqJRuqFdpHK5gCCO7lcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6hfyoKesjMvZdDskLJrk+Polnugi9Urd4XRsrP2XpY=;
 b=D7v+U4Yg/dD+9Ipk3xQxMy7Lh0kfNHGPmp+KkN3dsO9gyiRRAbDjxhTzI07wqKiKD+eohT7wAUCFu2jNoYPl8H3iQMv5RG4Dz3vcGjtHf7pDTJJGC0MuRjaJFybCghL9mjfSOpBcHieeQlmJlbJcGDFmI+zX2TAuZfubjAVpfziAPXxzSB5aJBSRHF7k+Dz5U8OOgGvpNrp0Er/5oFHNDJm5hJJNbtnJbpw0cd9PBcGaa803+kVF+vHZrhQe2xNNuJNIQcjgJ+PneGKB9q+4+SNPpmI/xXgBQeajdHZSozwtCcpb6uXscIDcvPErt4EYOUrbMPNR/nKyBY52rRivjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6hfyoKesjMvZdDskLJrk+Polnugi9Urd4XRsrP2XpY=;
 b=yN4/HrCJ2+xJ3zfDA2GObk6yjaAv+e/anoWHDffMVOGSA5oTOqHpGAm3ezA2PTwE/QPLWT4Wyf1X/DR6kSEehomn/3FeP87IHKIWZfVAmlEOqeQcHmuXRFTgB6xXvOyCOdm08JCdfQTGslBdKzyePCu6AvuvYBYW79pj/A9lJT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:33:43 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:33:43 +0000
Message-ID: <5d48a7cb-29eb-9177-f95a-ad686d15fbd8@amd.com>
Date: Wed, 24 May 2023 11:33:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -next 01/13] drm/amd/display: remove unused definition
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230524035952.123590-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0173.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::16) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a9725f-afd8-43da-f523-08db5c6c417f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sLXsD9anm7D1WHJhrV+DC+bAAGlx9gCaZvP7IA0C3OUBz6dlLfYucWLz0O8UYo9YhvjOYDWCvrOt8E1MLRik8pkxIb/ukBWAu6Osmm0kWRx//HTVuVCPn8uCY4eNTL4nVe9G/KlVCJYtzQTCWApCJAT8j/F6dEJ81FgrDjp1wqNZQNWbPuqIpl60BdbeMt1n/4iQpmXoS5hxXEas/ZuQV3Ldzxb6cb+MOByuhr0odB3HSYz7ROhdXaJ44bhCoGo8HrAKq+rBxnGmwRMmiH7m+zooKSOm0ZaCsyrmVOg1iRUX2nIsNWWVCrhOzbpPxEXpl98ekv58WfKyqiPbl56tN0WFuhBd1I3NKIUr68//53NiEF9cFLM4vPhSXz7RiI7c0KhBVFia3HX34yQ6k/GP+TgwzbShtYG93plPUjnKVo9NLH1j+s3tJzdVqhONbypkrKsAqt7yqebDk1OVPLAHQ1HWEkNsuqYcRZTxzfRlsyBj4OYHzKkdtRD1I6qHzrkCck1WFn7dklywHRWQNj2B76vzn5Io7vMGRaBQLjDvtLsTn3Dx7TBm+YbyOsNRjUbvMiagmUoF6c10uU7g5O9OAkLEhvBt5ATFdToF9/2k52n8G2Ab5ZpGxTihN6aBLKQlfBpaHHht6TXGg2kfC2ccAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(41300700001)(6486002)(478600001)(31696002)(31686004)(316002)(966005)(4326008)(6636002)(6666004)(66476007)(66946007)(66556008)(86362001)(5660300002)(8676002)(8936002)(38100700002)(2906002)(44832011)(26005)(6506007)(6512007)(186003)(53546011)(83380400001)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFlbkdpUmVIRmhFUmZNRG1CMDd5cFZ3QkkrM3k3V1pZaURKK0dtbUJOWnpv?=
 =?utf-8?B?aGVQaGdUeHNUemowQjFZRGtNQ1k5V2FqSjZiaGVreWZDaFhldG5YMzU3ZDY2?=
 =?utf-8?B?czhZOTRrMEVpM1NxRUMvTHdsRS96Rkp0NGRBNGlCK01SMGlULytxdm9mMnhY?=
 =?utf-8?B?U1FDVnhLQ0w0bWI3NUp5eWNrNEo2WlJzR0dOTkxnclpITHdpMU00NGdESjB0?=
 =?utf-8?B?VXpqQWQ4T216V0JiY3NHRjFhdlo5Nk9aOGNkOUVpZkl3L0ZoRGhqay9FZXpE?=
 =?utf-8?B?bkYycG9KRXhiRURZdzlHcDI3aGJYQktUMll0VzQ0Ri9rM05yWEtQY0Ruc3pM?=
 =?utf-8?B?QXN6SVpsck5aNzVpOUJNV3NhMVEvUU1vdk9oSDR3YWVGaEMrbHJDb3JpRXBS?=
 =?utf-8?B?clFOK3MwM0Fkc01VeG5yRkUrRHphK0MxVDJkZmNYZ2NYdVlhL1AwTFNNWG9T?=
 =?utf-8?B?Z2ZDT1drRnMrNzBDM0dOUU05UFllNGNtR0I5OFlodU00TFVrbndvd1RQVU1a?=
 =?utf-8?B?QWI2dHFjNEJEMURQRElKWGZFTVJTYzhodWJMTnBrNk1BRmxxa1V2bVBodCtB?=
 =?utf-8?B?Qk9HN2I2WExHWHFBMVBlSjhqZm12WngzRWpuL0x3azlMVUQ5eVRYQVIyUGlU?=
 =?utf-8?B?b2oydmw1c3dLcnVvOUcxS3RsUzIwN043TFoyclZsY0tvZEw3TVdZWEthT2Zm?=
 =?utf-8?B?amJvbXFaMXZxSGVDT2h1dks0VVhSU0JPNkZwRE5LS2Y5NnlEcWd2SmVxcXZF?=
 =?utf-8?B?SnpVL3loSmJLK2ZUTjNOUE83K0VMT2Z0Um1BYUN4eUhSSnpvVlVlbFUwblJ4?=
 =?utf-8?B?bkZ5TStrVHF0blpLYTJ6NXdBNmczcEwxQW9za3BmUG5YRWdhWnlmMnJDTXpI?=
 =?utf-8?B?cXFITzNLeEtxS2Q1dzNtNndzUVBHNWFxbEpSUjlkN3lPSDFQQ3NMQytPTU9u?=
 =?utf-8?B?YnEwY1JSR0ZsSng3UlcwK0FmUUc2a0tEOFdvWVRvUzFNSGcyTW5mTnpnWGZ1?=
 =?utf-8?B?eFhSRnprdmx5Vy9pajhQYmFmRUdrT2ZpWFY1TkJTQVhJckt4MFh0ckFyZEY2?=
 =?utf-8?B?QnoxSFhxL04vSFk5SExJSktmZUxGL0lNbHRMano3M20vRzFkOGVBNVhOTlBX?=
 =?utf-8?B?N0JsL1N6WjhQL2pwTFRMc0J2am5KOVpZZkViWUFiU0ZDbEJLaGZmQ1M1Vm9p?=
 =?utf-8?B?azBJTlhrSW9PekFUOFNiTDJ2VDdpTnpKcnV4TU9UOW1JREFma3VPb284d1l6?=
 =?utf-8?B?eHZFYkZFR0ROcUpLR0JaQUUvWHpFbFNVUVY5TXVmZVcrQ29PMVBlK3dhM0R0?=
 =?utf-8?B?V1Y0dERvdDdtWE05QjRhbzIzN3Nvb2s1cW1sdWplZmtjRG5GaFZ4U0FVb0Jj?=
 =?utf-8?B?ZG1NbklVT0lGczhxckpiL2pPbzVxVHBETldpWnhma3ZkMlhrZVBuVndQR1Fr?=
 =?utf-8?B?N3ZpRFNZYjZSdmN0L1hwYWh5c0lValhsUlNONGVqZ3JCaUwvMlBVRlBVekta?=
 =?utf-8?B?NWxaVyt6dmd0SW1nM3A5RFpOUVNwUE1iSFlsNTIxc3oraUJRNlFGVDhtazR0?=
 =?utf-8?B?blpkMzUySnBPRzlySFhIRWt4dmRyMEE1em9PWi9wbTNLRTVGdzMxa3Ezb2Zy?=
 =?utf-8?B?YjZ0WEsrazFKNG1XQkd3alNNS0VzRjhFd2d4MjdlSmdzNWJPaVMxZlJRVG9r?=
 =?utf-8?B?V0taK2Q0T0V4MGJLdnhxME5xSUNtbXRZWjhQck9jckFFd1pGTVIwaTJsbmdR?=
 =?utf-8?B?RDhCd3hrRmxpTzhpUWlVcGM0bU1Lc2Zidnp1TFc0RGxTU1lSTjROVUhhNUdE?=
 =?utf-8?B?b29MV2xQR3RseG9qcnpqbmhOL3dLYnJnU3BBcGZPUnVhWFNSSDVPK3ZoLzV6?=
 =?utf-8?B?ZTFrM0d2S3k5QjdCbVlrNUJaRmhLcmp2cm1iMDBTbURaQVlKd091R2ZsVjZ3?=
 =?utf-8?B?cFZEemhtNFpCbWUrMDNsb0tiUWxHaVFCTkRMaVppWDEyN3ZyN1EyQldteU5D?=
 =?utf-8?B?TUowRGxpM1ZWQkJSbE92S1VhQVgzcDhQR1NySGFEMFN1eDJNMm5XeXRsVTJu?=
 =?utf-8?B?K3d4c3U5WGhtbFlIVHB6a3FCUUI0Y092eGM0T1BPckhkMkZGSmFmMWdNMVFW?=
 =?utf-8?Q?B+KDtaqK4l+DVLPHV4QuUim70?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a9725f-afd8-43da-f523-08db5c6c417f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:33:43.3930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vr/K1pBO8HdBZ4PXUFXg3l2z/QptYUyrREYpjX1RyqA2RTVfC9uC1YVP1ZLUSmW2a0+oqTVG54OHGo9qHtIo8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/23 23:59, Yang Li wrote:
> Eliminate the following warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_resource.c:889:43: warning: unused variable 'res_create_maximus_funcs'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5296
> Fixes: 00df97e1df57 ("drm/amd/display: Clean FPGA code in dc")
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

I have applied the series, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index a0625209c86d..26ddf73fd5b1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -886,13 +886,6 @@ static const struct resource_create_funcs res_create_funcs = {
>   	.create_hwseq = dcn10_hwseq_create,
>   };
>   
> -static const struct resource_create_funcs res_create_maximus_funcs = {
> -	.read_dce_straps = NULL,
> -	.create_audio = NULL,
> -	.create_stream_encoder = NULL,
> -	.create_hwseq = dcn10_hwseq_create,
> -};
> -
>   static void dcn10_clock_source_destroy(struct clock_source **clk_src)
>   {
>   	kfree(TO_DCE110_CLK_SRC(*clk_src));
-- 
Hamza

