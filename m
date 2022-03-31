Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD34ED3EC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 08:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90E310FA40;
	Thu, 31 Mar 2022 06:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7C10FA3F;
 Thu, 31 Mar 2022 06:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJlqfHOlluLKud91JLaV/MoSaegSlKaf98W6gQdpK+imoZ7dKmqzTRBlwgHuAo2lU6JnLTUoVaQXHR3tJNv3A6cYdFzNL+X7cydF3C8ZckRR3KzJXdujyap9izRQGI0Y1m5tdVeOR34bAjqvFrhzFaVbQZy+4fRJP984hQ7+jRfb/sPplusD1P0NxGuYwB6AJYpdjcMW2Tus1EZ2kJ1ujNtT+dvypGFuUzI4UOwkmOtQNMaq4EDRuCBfdoswqdrwrrG1t9rrITWBR0B0Cb6P4jQvQIpixegZ1ZcWm/7TJQzmF78bhZt2bF5rWAT2V54hI1Li6rbIUJEXsolcHiEMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxGZTPxuD30Q7MXQqGBW3bKATIjseWdV94YdJqFkMP8=;
 b=hoAvxgcD2gjl0+3sZO50o49Og8YdE0slMNCJ/UQ2H12PwSenmDn/8jkPMiaZVmrldFCrnOUCAJ2QI/DWb721YVGYF4MH+PlDKtOB/ly80jstnkMEpU52280w/BGV3zL71JmElQajLzQFaaGkx9X8rv5svFDVQHagcP+jqWDR2n+KhWNcFBxFti+Pbm6e29y0dgcFPjTvQRdN+GHVfYajvGMD+4hyW3ys76fiPjQJJqPON2fIcg0iKsR0KrNL17sQtQ2iPeS7axc+3Hu5v810RQ2WjaP6Ajxvi5LYR+1TgkTGGUcLhWD0njEEllzKdlqY38HXvF6gHDLdEi23OAAULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxGZTPxuD30Q7MXQqGBW3bKATIjseWdV94YdJqFkMP8=;
 b=tO6X/jiXdBOnscokVR8VLHd8YRUUX2+hujneYxqjqBMh3ANTAvPSWSHDfCooLg/OZdkJwg8bfEsIKYNZwMOVgyqAd2mbDcfMX2QCUOqETGkxhtaND4LX0Z2BUXj2Oj7EvZqfBNBEPbSufO+26nfD6K/HGeaxbTaxzlEs0fyxjs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN7PR12MB2753.namprd12.prod.outlook.com (2603:10b6:408:31::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 31 Mar
 2022 06:29:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 06:29:00 +0000
Message-ID: <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
Date: Thu, 31 Mar 2022 08:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: drm-tip compile break
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0101.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::42) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42c9a62c-c388-4aea-808c-08da12dfbd9b
X-MS-TrafficTypeDiagnostic: BN7PR12MB2753:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB275321A6738AA49D9FCBAFA083E19@BN7PR12MB2753.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IsYg7ExJEtMQkrxlKAqtRdNQhvPwQxq7aLpxozUMCZ8h4P8BsPJTYbPwdYgFcGGlizJJ/3UftOmjhap8rkxIrkGYUm+yX+OJWlw1vnW3pYrRYUpDmFIXfP8qFPi7r31QcTLbWljpGHV00wptlULOIbPuyRmSx+g52TuSMc1ZVuFTm7vY2WX6gtOlDJ9Q8BpwKVBjYkOqd0UvPIsiUtxwB2NRkHv03IYrDySPqCSE9WxsTOjCIyK0kaaB69E6znuWdX+39hyqrZwQD9t4yuZ8724rubPfYNgPaA7DAF+a/u9enXwQ4d0b0YSb665CccCgbQb3JGbZclG5ts41TJsNBeEc1RpxHDN1Ez+6cZz7FKc1iA1wFMxvpnLQKVFg3x0q9pftpV6ZJ+eJQNLzeGpm8ZepUv4ATGEpWCf4TVHrNxaN0m+Yzx1KOjUP3LGWq2pRjVVtVAfLCaFbLeIdGooUBz4xGQ9RLNLZ5NLoj5nhqmc/MtpwlOYZ/oh5tu+72Pq8q+BXIcY2LUUrCN4FzqKGfguBlH/00hq6RCXND6PhX3kphJosetTESyFZQnS4erwEot6QMKBD8BoyTkjORViX6w/P1L5pOlkgbROiv/GH4xLi37g2lf5ZxRwK7+Pos+Fz9Dr6wH0Bvpqg08XO+giAtHbk90KFZjMaYjerTpCRAABKcXPA33B/6S9Up5bpDX9UpnU6Hp6lYe6BQ50GNShnVkzbNNYi1lVVVpUMtH0b2nGTitNSMDRS+prEj19icY8n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(66476007)(8676002)(6916009)(86362001)(186003)(2616005)(316002)(26005)(66946007)(66556008)(4326008)(3480700007)(6486002)(508600001)(2906002)(4744005)(6506007)(36756003)(5660300002)(38100700002)(6666004)(31696002)(8936002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUk5ZWoxcjZKU1duNHJCWVNHS29VYWxqbXdudFRJemdUK1hjNTBhYTRYOVBN?=
 =?utf-8?B?U29lN08rZDliaTQ3eEhKMG4yQ2N1Z3A4OWQ4YVdPekphc2lJbkxyRkozdTRq?=
 =?utf-8?B?ZStBUnJKOXRBNGpZTUR2Z0NuZ09CK2xwWnR1T0drUGw1Rk0wVENzMTdKRDNO?=
 =?utf-8?B?VGZzakJtOVZqOUdYbE1yRldRaGFnNUloVFIwcFJwblJURit4c3F0WGNyTFkw?=
 =?utf-8?B?US90QkFVS0FsMFlzZ0JrN2FDNEVlekwyTmwvRzNHT3F3L25XYVQrOHV6K1JR?=
 =?utf-8?B?djd4U2E4UHA1MGRoTmlLZTNOR1MyV1BNb1B4VVJqRWdCRFc1K1VCeXFPSFp5?=
 =?utf-8?B?SGREUlBTMGxTNUNyaERINU1aZ2QrWmVBcGtmNDd6eENwMURZWXcyUmxBMTlJ?=
 =?utf-8?B?bmNjQlVVVlRsTTEyU3B5ekJtYzVYb2g4ek5zajlCeFhJTERsb0hxMDhISXFG?=
 =?utf-8?B?Znd4T0ZPY2d4cm5OcDRyN1ZGMCs0YnZ6bDE5WUF2TWt2RWkyT25NdDJsVWxQ?=
 =?utf-8?B?SHMzakdIVFhYbUlML244YjdaQ2l1Q21Ka0svVEJVMUk4Tk9jMmsyUVZJWWlZ?=
 =?utf-8?B?a1N2U0pCbVNwcTZUTjhoWTJXVlJoVkFmWHBXeGlpRklNN3J1NlNQM05nYllP?=
 =?utf-8?B?MnVvQmlyMFZuM2liRXpLM0QxdmY0QSthNlNOWCsxRUt1K1M0Ry82RENJeUJW?=
 =?utf-8?B?VitROFF3TWlVUzZ6aHpYSWl2ZVFVRnE4VFNlWTBxRXhyU3l3TFoyUmdTUGJx?=
 =?utf-8?B?dS9jUk5rVDlSRFhpaXpFdFlxUGRsMlZMTWs2RlNVVUJYRU1ZZVVHdExaVFQy?=
 =?utf-8?B?TWdOaEszMEZUdzRzaHFCdVIzL1Z4K2YzbVJOcE0vaWt4RWRIbzVpK21ETVFh?=
 =?utf-8?B?QjRUNVlEL0VxSVNJWUJQaFVCV3M4eEJxSy9nT0gxbUtZd01weldONmlGL2o3?=
 =?utf-8?B?dlhsNGh2UVJIYTA1TEoxM3V2ZnpNUjJRbWpjb0NuRjlZZXRxbWZoTXZsREo3?=
 =?utf-8?B?by9Lb1JuaFRpOWFIMk95Y2pWeEtsRWZFcW9JSkZRSExDTFA2MTRWWENTcEdy?=
 =?utf-8?B?U3loenJzajVIOE9EVWV0RG9NTDdyNHZBbENNeXdtaDZoUTZoN2xFOGVpbEY4?=
 =?utf-8?B?RmFuN2JueFU3SzFuTzFjTHdEZlJ4TmcwV2d6c3E1OGRPcW9Vb2V6RmhtTXB6?=
 =?utf-8?B?OExGSDRGdnVBYUx1VVNQV1pLSWtLK1loeEJIcVh6b1VPN0FoYXNwcG9VVGpB?=
 =?utf-8?B?NEFuVHBVbVJadTVna1dWaVNFTDJvOXE3VmNmRDJKV2NyVjNuQlg1Z05vak5z?=
 =?utf-8?B?WTBuemZRL3lhZ3NVVk9tZFl6NUFwRHNzSllXODJnVzdoeW5pcHhtam4xNzRj?=
 =?utf-8?B?c3NaOWtHQnBGUkVLd090QkhWL000Y1BjNHJjalExUTVEK2QyZjFOVUJ0UzEv?=
 =?utf-8?B?SS8zMTN1Z0g0bENJRnhDeGRORUFWaGp3QTZCcnRTcnlER1lONkRUUjJ0anpl?=
 =?utf-8?B?OXB1VzZYdlhNbGgwYXZVbGhMS2YwaTRUZHVEUGRNdlVaYytKendObFJhYTlP?=
 =?utf-8?B?NmU3ZUh3Z2dPUmxnMFVqRSt3YzNCVHlLeEh5UWdUQXkrV2N0aWJpajVGRG85?=
 =?utf-8?B?SFo4elkrZS9DOTNyaXR6YzdMSENVV0pZc0x0d3d0WmJhVkZ2ZGNTNlVEdVJq?=
 =?utf-8?B?di8rM3VLUzN1K01ldk5ONzRMbDY4alFuWjRPNTdCTDRDNzlOQjhMcVlmWGlL?=
 =?utf-8?B?TVQ2cFVaVEovL3lDcHdmTHJKemtKM1NwcmdPN0xuS2NPTnE4NmovU1NGOWdJ?=
 =?utf-8?B?QTAxS0FNK1o5UTYrbDJhUExZM1dBbXdHbE5MbDF1MFhwQ0xaVnEzQU54UWgr?=
 =?utf-8?B?akR0ZnNQa0pMajg5MjY2KzB2ZUt4Y0tjNEpwTjZaNjcxWFczT1g3a1BIR1Y5?=
 =?utf-8?B?NHZtcVhqbkE5NlpqRnA0R01VbGJoOWpQNVRPR0c3MExrTW5qUThUQTJ3YzNs?=
 =?utf-8?B?bU5uV3M2U2RKNHZjN2YybHdwclZWdmpRdXlVN2J2R0NoakJwZkp3UlhXMHdM?=
 =?utf-8?B?eUs2QWpFSzlLMmtFQU93V0NITU9YQktmNU0ySmdDR0FFWXlNTW9TQWRsNUJx?=
 =?utf-8?B?TlIwSjNqZ1dCUkJIajYwMmFOTjVLZTF0RjNZRzNqVS9QQkFLMVZpTVVEMWQ4?=
 =?utf-8?B?aHl2amdzSWUrTDUyN1Z1RUZQSDN4RXhVNkZ5YU43Q29OOUd0VnVoTVc5clVl?=
 =?utf-8?B?Q3lWcFVLWUhTRk1Yd3NrUkl0MDJMeWlLczM1bGFNSU52Ym5hbUdaNzUwQ1Vs?=
 =?utf-8?B?M3RwNmZiRFVIbi85M1hzdkpiblg4akkyNFBGZ3ZsZ1RyeVJ1SXRhZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c9a62c-c388-4aea-808c-08da12dfbd9b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 06:28:59.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL/sgTG1cBiJJu+L7QzZB0b6YtX5lBtnSRJoT250x3rliEOh7VwXSuoUrIL58gjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2753
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm going to take a look, but need to figure out how to find the broken 
merge

Christian.

Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
> Is anyone looking into fixing this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function ‘amdgpu_gtt_mgr_recover’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: ‘struct ttm_range_mgr_node’ has no member named ‘tbo’
>     amdgpu_ttm_recover_gart(node->tbo);
>                                 ^~
> make[4]: *** [scripts/Makefile.build:288: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>
> Thanks.

