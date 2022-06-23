Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DEC557FC4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3788A10E0B5;
	Thu, 23 Jun 2022 16:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730E510E09E;
 Thu, 23 Jun 2022 16:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQ0ZgjggfRk93aFcj+nAqtswJWWT5QQJjZI15KSaT2oCuea5Q1+nXvETAtoChMxh4kLNIDUPwETBjXlR8zykQuuQou2xR62CAn5IAn21RHTvUeVlVceOT4dLk3z1PGU8cCHlbvILrifE4IsivtzvtFXdyXasAEbCTRxUWirlA/V42+PwRd8mUXWOpYrUYCjQW8OXJ4l63JAqzwmG7recfqSbPeE+WbhD4hhBQVoVDYBFtEb7QOIo6CneQjWvCj6A+CepEdv3NhPQfuBBRHJcyhxBcId6Shs7g6pyDn//zMYDhmqFHl1WdhDeEcpIHy7tzwAalAvIrTBJ83/9ZiQ8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4k46ZdLznY6X4dfs0aV8l3RjcIWwWv/UWDR2ehFDQU=;
 b=iKf3o3NXYvqNXqzC3684r6k3d4lcg6S18thacOFVq7WoCVXtRfYmLNiMlbQ0LWOpAb2ZF1eYaXTvaWCMwWgyyzpVp3U5V7fYyD58HVQaWvysCZXe27IcnmlG3iuqQXtMNWR6c31gYyQwP53Uc0F/66HGJbIBvEofS5m8MyyAnUwBgwzCB3Ym0ORfuLL0e/IwNpC2Sn7ES5b7ROPDrI0kn4xCgA7H9VXggqqgiX3WTYyNeM3KNNEnGCiv7ZuiM8AB1ZVspVFQYTPOkfb7vRUzKTuyZEJiGZSKnlXburOsjTBO1dY9RyOHMneVfatNorywHokrM3QCGM5NiU7Ypy+gAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4k46ZdLznY6X4dfs0aV8l3RjcIWwWv/UWDR2ehFDQU=;
 b=NSDUQgGoPvvZ8LlDRHUPBpbUa0DdPdanBe2qphjdtoZYhfZhKM82LKzYmk6QOdrz0rK7qTWumqNhKd/ggPYF0lMeKu55H36tRZB5vVOI+cJZmXD0PkzYe21BHN0JcvNp9lyeVx1A7/rvET9lAnQiVUGEKuX7JLI9T5RS4we1ZkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:63::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Thu, 23 Jun 2022 16:26:33 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d53:42b5:4803:8703]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::2d53:42b5:4803:8703%7]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 16:26:33 +0000
Message-ID: <03448497-30c9-7655-ae6a-a66a1f649828@amd.com>
Date: Thu, 23 Jun 2022 12:26:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amd/display: Fix indentation in
 dcn32_get_vco_frequency_from_reg()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20220623153001.3136739-1-nathan@kernel.org>
From: Leo <sunpeng.li@amd.com>
In-Reply-To: <20220623153001.3136739-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0006.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::19) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb33f1f-0be9-4dac-9247-08da55352297
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4GNWXqOwGFO3s32XOYupdE4hQajdQCOGi4WcuWL/LUgxtAK+ICE4i3OojM7wA11J9mVcz9pCXNNnRHCP7Er9+lgMZDZsrIkzaMXyCXP7PgAr0a/Oe2AvZDWL8COkwTW9Xohs9rT3hmD0nJNaNgRJ6VmkHZWZqbPoSQIVQ7YA+FLOeCJ9HqneB6i+3p7v+RT4cRilGKSBvF79fJDsOplWRV/4hNLokRNywmZzj+5E2JuJZt28HszwJv0qJPHP9g2sqqBVebtRAmcQx5CKTFwuJuZ8Hk9oDXZjZOCbfo6MWrrHi6B3ZBlundX2KiXBKUC0QGJ+gyY9Ze7EAwh9hI/s/DBfykpMqYjGZQxm4pij+5kRdfQ7w5/XgqLa1uBK4kNgHh3HICaI03z1/Ydihn6cCbGLFvUn6xIxS330zXzCn5npuUSLmNniS1EW5NGYZZYY/cjchCELAYGFbUlLz3NtDCWq2QaQ4HycttchFIiu467m1V/SlXy4Ii/Y0kHQi+jxTiKOjS0XjZWJSnz8elSS6pnamv/7MUyzcaKf6sQ1l3DD6t+4ZGA4h/4Ccmg3+zgiuSrrPJqd3itu8cPaxPdMnGqE19BhsNzPq/VzU/wibtK6c+zEhglHkCzI3DYT9QNWp+ThFttmBUBl4437BEfZhxTXT3g1nrHs95P5QR95Ex0Kmxu6rw4Co6qWzFGaa6cPCscXQtLzH1MQJtXbKX10vpq0839XDydyhqAYEatzp8GiuPmBxxmMnDypPLJuzKmCzhXKXa1tjpOPHjohXsQ8PNnlxe5wQWftBQozeBnZUilCFCaOqYY6eNTuh5977FJhDDL234K7MVQQrdoFBOATnCp3HF3T5nPrWMzKjNXVCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(6636002)(478600001)(36756003)(6512007)(316002)(41300700001)(110136005)(8676002)(966005)(26005)(8936002)(6486002)(38100700002)(6506007)(31686004)(83380400001)(53546011)(66556008)(31696002)(86362001)(2616005)(4326008)(186003)(66946007)(2906002)(66476007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhEWDdDVzFYNVNGY0hXU21VVGVxcHdyWnR4STFGbXhZUk9qaExCS3o4YnhR?=
 =?utf-8?B?M1JMSFJVMzEwK3hmYlRJUFROSnM3SFl5VUpFaUh0T1RqajhPZWMrcjhOckg5?=
 =?utf-8?B?bWNZQy9LQ0xMTkE5THVKaU5Bb2VrdkpJSlJHTUZuK00rUFArQi9UdnNzYlNx?=
 =?utf-8?B?WWJIVXNzZXRXWC9WR2c2Z0U3YVVmL3VBd1VZWG52VlROVGtwcUNmVXJ4KzRI?=
 =?utf-8?B?R1ZkOHJhUXNBT0o2YXFVWGtxSkNiamQyRHdwZzZVdis5UkhuWWt0Y0JEeHZO?=
 =?utf-8?B?TTB6ZlhtaTZTS0RRT3JlSFhNTVZkaXRxNTBHVi9iWUI2cFZIYW5ZK2RVbzBD?=
 =?utf-8?B?d2NSZXFEYW1sZjZwTWxxcFNhQ0pmSkZRZjBzRjYwUndaRnAvZUZJZTQrMm5k?=
 =?utf-8?B?c2xxR3VSS0JJTU83ZUtLMWc1TlJZZWkwQjNFbXAxQnpBOE9LNnMvQk52UjVx?=
 =?utf-8?B?azVBZFNjQ2VtY3MxTEVTdytJU000bHQyUW9Wa2M0SDRkczFFTTllR3FpeFZr?=
 =?utf-8?B?ZUJsc1hjRVVGRituQWtRTjFCamxEWHorMG1NRGpMNDVJVU4ySUJ1SUN0a3ZR?=
 =?utf-8?B?RFdLYjBNTFgzblc0V0NPT3FpNzhvalRYTnNTOUdMZHMwNFg1Ym5WMjRDVmV1?=
 =?utf-8?B?M2hidlUrUkZnSVFTVVBhMWpJY0c5Zkl3YWczcWd4VzErMk9sOUVSajZiNHNa?=
 =?utf-8?B?QVhldkhqMjFYOVhPVlpQZjl6Tjk4czJzMkdMVnp1Mk9saGQ0WUxEcGhTbUVL?=
 =?utf-8?B?UzcwaythNXZ2QlVEa0hsMXlEL2IxbG9nS3JBbnJpaXNtSjBHekFCcDlIb3Jv?=
 =?utf-8?B?VWxzQ2g0bHcyWCtzOWYrSEJoRTVhQjE2elJRNVRhUTlsRU9sYjdXOVQ4aEVx?=
 =?utf-8?B?dWxYRmJRcG05V0MrL3RZR3NKcGFySUJBRGJmaHlEcUc1TG5LVGtKbXBDajl1?=
 =?utf-8?B?aEREckRyNFhDREh0NTMyOG5EOUwrdVZaS1g5SlhqeXVzbmZyZldma1cyVDk4?=
 =?utf-8?B?cFl5TUt0UnlUemZlNTJqL3JDMW8wUGdsWVZWOHBzeWtiS1FCdEVJTS83aExC?=
 =?utf-8?B?am1lNnZkNnNZNjR2U2VycllPUE1IWXVyVVlkK1lrZUtHYnkzeUozTjI3aFpj?=
 =?utf-8?B?N1dSVzBSSmVvTGVQaFJUNHNCSDNSdEVtTHVkR3RRSWt5bDA2aGc2enIrSlla?=
 =?utf-8?B?cjlIcnhVMnlDaTJuVmoyb1NKMSthZmdPcWdjWXBlUHVDaGFPTGo0cTB1dGdO?=
 =?utf-8?B?YjZabnpYL200WUFEcTczYVNSdWcwRkNlbDQ3cWdMZ05NYmtPb3dtR09lSjFa?=
 =?utf-8?B?Qjd1L2RuaHZKS1hsQXdmb1ArWitNZ2V1U0gzemR3S0d2cVhDcGg4S2ZuYkN1?=
 =?utf-8?B?b1lxUklGM2dKZVBSZ0dwNmE4Rll2ZzBaOEZ2TG1DRW1CNUU4YWN5N2FUUm1V?=
 =?utf-8?B?d0E2WmgzR0V1bGoxeDNQL3BJRXd2WnJhZHR6b2dTYzV3RUt2OWNsOWJLSXdF?=
 =?utf-8?B?VXAzelZ0aXI2VGZsV3dpazBtNm1wcWVlWTRJeVc1bHZCODVGV1pLdFB3Q251?=
 =?utf-8?B?TkkrVHhUK29rSFYxSmJuYklNdE8xYXQvcE1sWkZQNFRWdHZjdi9JY2R0RTNy?=
 =?utf-8?B?Zk1xQm80ZEtLUGdOUjdqaUpYRkJxeVlaN0d4T1UyekxaSzJGcUd1bkVBT3JP?=
 =?utf-8?B?VnppZUltY0JGb0UrVnFzWHQ2NTY3dWtRMlU5SXFtTDVQcjZ4KzFZYWgwMXU4?=
 =?utf-8?B?M3NHWjZnZzRrT0dMVVBBc2RKWlY1QWltcWpzNjRMaWpPU0hSNWpyMERQYmo5?=
 =?utf-8?B?cXFjV3BZQXZwMGJhNFYxNVNaRVBtK0tKaXlZUGFiNURoVDhzN0hMN2Y4SUR4?=
 =?utf-8?B?dnVKNG1oZ2NmL1ZoYTc5a3VLY1p6bFFYUnk0UnR4aFlGVDIxSDBsblFUWFlQ?=
 =?utf-8?B?eTNzeStPc1d1Z3d5U0NIVHM5clJMblB1Q3ZxYm40QWVMY2lXSzZIWlNWN1Jh?=
 =?utf-8?B?NVlMMFd4Y2h2NWJyT2s4blljY1Q4ZzVzdnltL0xvUkpHVC9OVUhYMGs2bVE1?=
 =?utf-8?B?QUFrKy9XQkRPVEdsMlpoaWRqbWdDcmEvOWZXcWw4MHNwc3BNTm4xR1BKa2Rv?=
 =?utf-8?Q?GzYJv2jukOPj4HetXbZbxjrTY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb33f1f-0be9-4dac-9247-08da55352297
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:26:32.9752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY949H0qV8owGBWT69gKlBNlXJWRj8+UBEg3BYOUyIVKnKvS3IV7TY5hoDUN1mf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
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
Cc: llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-23 11:30, Nathan Chancellor wrote:
> Clang warns:
> 
>   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:549:4: warning: misleading indentation; statement is not part of the previous 'else' [-Wmisleading-indentation]
>                           pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
>                           ^
>   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:542:3: note: previous statement is here
>                   else
>                   ^
>   1 warning generated.
> 
> Indent this statement to the left, as it was clearly intended to be
> called unconditionally, which will fix the warning.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1655
> Fixes: 3e838f7ccf64 ("drm/amd/display: Get VCO frequency from registers")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Just hit this myself, thanks for the fix!
Reviewed-by: Leo Li <sunpeng.li@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> index 113f93b3d3b2..4e8059f20007 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> @@ -546,7 +546,7 @@ static uint32_t dcn32_get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mg
>  		 * this works because the int part is on the right edge of the register
>  		 * and the frac part is on the left edge
>  		 */
> -			pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
> +		pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
>  		pll_req.value |= pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_frac;
>  
>  		/* multiply by REFCLK period */
> 
> base-commit: fdf249c70a36e2daa7ddf1252cf3b71faed87abc

