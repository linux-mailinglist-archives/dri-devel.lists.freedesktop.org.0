Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413DE5624BB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A79F112A6C;
	Thu, 30 Jun 2022 21:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A7D112A53;
 Thu, 30 Jun 2022 21:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCeNj1V/QKvGBiEuuWV1wWPDebShCx50GOwqG1En6mzTSLAxmOEKd2OBRJFBdXZa5BqRG9oUCpPN9WwJViFBmfCXO5N0C38KF36kmo2/8cAX3z2FH8uG4ne7aIzjFfjuad2hruZ0n1NsrmN9GfYfzOYXgo3xnZmGYfDVyX+IaWfmNlHmYI91+wmi6GinexRW7Eb9RIBKGcgDJQIGU049Nu0no3gO4ohy6hGz2a0gmMcGztPA8s6+5Ie+gImWRouoH5dqzt0shUXjahD54P4elT/JPy44/PsVuhrMauoRkk5P8WMst19VuPqBEc5izVX9+fsJrpwMIatzfZUnMpaVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywYaWMjDSqaNx7KmlEQ1YOtkMZTrZXGFn2NV/1RcntM=;
 b=j2ITRgD4tsJTIQhg4ODXzM+rdlo/F+JOz96yDMYqaiq4q+VCEbzo23cZD9hs8hA21XJlfTev+vbijjoa7hbB2dky+DMLCJuaqa8QSpGTba6caWmPHV4nFx4UitPH4+oA/v/X6mYasofkufiqrg7DBo9rNc3gmZCA+xGulfxJSyEbeTz/MmcMfCFHOKOWNuA9OFcVgdHcyIucmRsYgt+53wEb8LvZarjL4G2Z0k315wIH3bsrmC/Ct4+D+39jCTJDLH9UK2XExE0HpxL1JzohnoSYKtLRRYv/vQL4CavKMSPWXTbqSWwhImbb7B4EYIOf2Ni4RMfnF8KNhAuWdRntzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywYaWMjDSqaNx7KmlEQ1YOtkMZTrZXGFn2NV/1RcntM=;
 b=pgQFzQTk/1pyDzNUHUDQMWGroZDMeFDC+Jl1sxV+LXPyG2kxHpng1mSOCQ571+ou62wNFVxyuBBEuYcRS9rX2n8r38qOgur6iQBDu1H96FMeq0bmZaj0ftKURNHjGG5UBOyaPOkoAE7xz52yR5AMy2UGSP1+al+dZAUO7ODRrQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM5PR12MB1513.namprd12.prod.outlook.com (2603:10b6:4:d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 30 Jun 2022 21:01:03 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::85a:3075:1744:8317]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::85a:3075:1744:8317%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 21:01:03 +0000
Message-ID: <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
Date: Thu, 30 Jun 2022 17:01:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Harry Wentland <harry.wentland@amd.com>
References: <20220618232737.2036722-1-linux@roeck-us.net>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220618232737.2036722-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0049.namprd15.prod.outlook.com
 (2603:10b6:208:237::18) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88951fcf-81c5-4a7a-1333-08da5adba46c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1513:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1Mv38kUg4TN44f8JO1t1MUfFrGk1CfEsVBV0Fvw13ARJlb+aFiD+O0zJZ6GobMnELoShRJuL8BHaPy+kWRQ+A8r4ZPK/kvW8mrrfrBO8m5TUmGsImsH1ze8sMwME6b74FIg9FapaYYIg+2/15iW+mnLlN3mEUPf0lYKmwMlDfvysTx1wWCQXHAqWe8fA0c1QGYL1y2hWCHg7mdbHBGrKtiAwlp6odm7Mb4LCEXE5O7FpmO1RrpKkorvQ/f7HEzcunPI5sd1NRlYtdesNVLN1n+N1h1jihvVSFv+bkExadEzZMimABVm7uuW/XEYpQkd20pqv/PBmnR41L9eZI1t5hS5D6UvdrDqkF2LnXvPfVCdglxVuC0vTM0UFEFVUa/2g90fOMEwLlILhgNUGfVp600HC+zbgj6rPvvbIjhZj7CrGxkE4moz5nDGi13d/9BW4ECdw3sElmgmD2w43JvbL92NBzIQFAe0xeJhvMIg1ojE6KPuSn+eY7D5uJpweC+LbXgweffRvvwtrwSx/lFBqIkmN1ah8o1mWsxgJuCerpWFQ5qKJxrcm4RK6OZZhDQlEsIS8AafZiqulYE9NqQiyiBmFEm5PA6e4Pyihu9vkNX3iRmTEKKUiUy2uxkOdQvaFP+Bf8KyVRAox+54M/GhcoC/eogMjUnFr0lhsFN+i/HvOsUJeNuALPAorfeQ2EGcEfBxjbty/dTBGAmDPghC6drxTRaY9q7vAX47MJYdH83xhFbfEpGfhhoTuDOKaqiABbOr+0KVh9votvNUfyibNGzvWyTDmjx8zmFWiiI46S4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(53546011)(186003)(6506007)(6512007)(26005)(2616005)(31696002)(41300700001)(86362001)(38100700002)(2906002)(478600001)(66476007)(66556008)(66946007)(36756003)(4326008)(8676002)(966005)(31686004)(83380400001)(6486002)(5660300002)(316002)(110136005)(6636002)(54906003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWVYc1Z6NVhobm1FR3F1bURZNFozV3l5QjdFZjJQS2l4RVpmMEtGTUFnTUVB?=
 =?utf-8?B?R2NaLzE0Yms0ZGtDYTZBUkRnQ1NiMjNZL0Qybi9XaE1aTklKUDNiWUJ1L0dr?=
 =?utf-8?B?aFNnVmpPR1lIdXRjQVFjVGIvYVZobnY1YnpHUUdIWitlNnNWeDVSaFJYSG5p?=
 =?utf-8?B?WHZGNi9tbHBsL0YwUkFzTkRrcjFoUHhuemt3S0liRGdPbjBLK0FTS1hrelJN?=
 =?utf-8?B?dENFUkdobTV1clFTbmxMTXkxUDBLUm1WMG5IQkdaQVVHSWM0M2ZmdEpFNmhu?=
 =?utf-8?B?UFNzd0gyQTNnWmZnU0VDQ1A0MDYxMEo1L3pwWVFCaVVPMmVwUUp2VE81WlJZ?=
 =?utf-8?B?bkpCS21ZUVJJS2k3a2xTWTYxRlhPV1ljK1UvcGtrVXBzMTNpNWttVFdZSFFk?=
 =?utf-8?B?VmRvMzdPcWs0MVBRTk5ETloxNzlOUG5OVVJOczh6U0lmT2hMMzg3ZGRLdElU?=
 =?utf-8?B?cWdMckVwZmVKQmZtcmVNMGphdllkMGJIYWUyMmVDaXRGN0d5b004aklhVEI0?=
 =?utf-8?B?VmhlUU9JeldObVdJNzV3c0lRMmJNZmxVNmhVUndVbnBwY1VCVS96RWtGV0dC?=
 =?utf-8?B?aUZJSHRaaGwzRGdRVmJkZkpyMDBPNlAvblptR0hVNC9UR2ZRNGNQaW9EZ2di?=
 =?utf-8?B?RERycklMdTE1d2FoZFp4ckFQKzNQaVg4di8zd0Flb01BOWFqaGFycGI0bTZa?=
 =?utf-8?B?djM1Q0pjbHQwalBJMUpZQVpXNjhtNXlHekZ5eHlpYllheGJtVkZVbHI4QWVy?=
 =?utf-8?B?NzF1RXF2YUtIOTNFVGd6UjVaOUplRDRiL0g3OXIvcmdoNG1QS1JWOXhDbjFz?=
 =?utf-8?B?NGxoOWpobWdNdU9vZWZIOXVpelI2UXZxMUZ3TkJyK2dJRy9ldGRIcnBYQXJW?=
 =?utf-8?B?a2VOYlhPdlNGd2M1aEZHdWlMTXZWN01rdThJYmtXdnBpb3loSXZxUlRYRDJo?=
 =?utf-8?B?RTJqaUtkREo3MG84d0gyNitZaHFESjFJd21lV2JPMm5leW1QUHRLMUhsSVEy?=
 =?utf-8?B?SHVOc0hTeDNRZStNLzlEeGJnUlNrTm5jbTYvcFJpZkJqNlZGOHhDaWxJb0E3?=
 =?utf-8?B?NkNWek41UW9aL0xabkRXNkNybDAwSHFZZTZqc0o3ZVQ5Vk9tNVRJSG1oRVln?=
 =?utf-8?B?S1VQUHdNU1cyQm5kMWcrSjRFcVpVUGtIVCs0VGpnTmxIaEtIY1FvTWc2aU5y?=
 =?utf-8?B?TWRlVG9zUFM1cGFlL25zdGQ0Q3B2NU10eGVKb1REKzFINzA1V0JNNURkWjRN?=
 =?utf-8?B?RURwZlIvSEJMc2toeDJ0N2d3bnRPc2tVM0lPL3VhTnk5Zk42OTZzakN4bkJY?=
 =?utf-8?B?a0I2LzNSNFQwV00rYkR2bVRWK3J1djdaSDBnaFM5dWJFc2VqbUhic0o4dU0x?=
 =?utf-8?B?amhUMkNYVHVRdXQ0NmpGeHppOC9VR0dNQnByK2RKWGEyQ0loQUx0VEN3a1Rk?=
 =?utf-8?B?YmNHQkdrdWV0ck5QWTJtQ040bFdWZGNnOUQrUHVCcmpNKy9xckJXMjF4SHps?=
 =?utf-8?B?UHlqcnIzOEYyTmExdm9hR0hMMFBHYWN2Wndna0Z5VnlmRUhQMTUwRU1mdHgw?=
 =?utf-8?B?V3N4Z2VhNW1JTnJSVi9qNlh5YTQxVWd5TGExeU9iK1o1allRZ1RYVDhOdVNP?=
 =?utf-8?B?MmZsM3ZZYXFOby9lWHAvdXhHTXZIcFZaTmlpeEVoMStvRXU4TjZHWWRaWXJr?=
 =?utf-8?B?ekhmcTIwK3FMYXZCREZmSkdnRmhseXdsdDE1cWYyN2poUU1TazFxN20zK0Iy?=
 =?utf-8?B?RnFLeVAyazNRbXlpWEVDakdYKzhRd0JQVWxlV282V1FaMFNtak56RzZqNzFR?=
 =?utf-8?B?Uno3UEhJZTJEaTd0K3lNNlZXeUZIa1F4S0lHUjEyVHg5VUplVm9FeXlORytw?=
 =?utf-8?B?Wk5LMHN2YTFvQUJObllaL0drbytnTjNYK2prOEw1VmFib2VlOEtQdzIzZmR4?=
 =?utf-8?B?RHl3ckxicnk1NW90K01wd1c4ZmEyb2lUWHMzQmRLQXIwRE9kRnZKQUhKOXQ1?=
 =?utf-8?B?QzFVVmhMaVg0ZVVZWGVMd3phYS9vNlQ4SGZ1MHduTGdMNTdYRGRoSTIvenp6?=
 =?utf-8?B?TE5jV1cxdW90WDY0aEhyWmcwWisveDlDbDcrbVV2SGNIT3Y0Vnl4MDNtTlpG?=
 =?utf-8?Q?e7vX4qftbxb8q7GJQ0WEOBIRp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88951fcf-81c5-4a7a-1333-08da5adba46c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 21:01:03.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+te8ttIDozBVp5HZCHTD/suoeOq0Tv6C4AxEv2K1nDZ2j8lGo0cwB014W2lc9DVUsfg7eQfnkPXd/jjegA+xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1513
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-18 19:27, Guenter Roeck wrote:
> ppc:allmodconfig builds fail with the following error.
> 
> powerpc64-linux-ld:
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> 		uses hard float,
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> 		uses soft float
> powerpc64-linux-ld:
> 	failed to merge target specific data of file
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> powerpc64-linux-ld:
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> 		uses hard float,
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> 		uses soft float
> powerpc64-linux-ld:
> 	failed to merge target specific data of
> 	file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> powerpc64-linux-ld:
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> 		uses hard float,
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> 		uses soft float
> powerpc64-linux-ld:
> 	failed to merge target specific data of file
> 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> 
> The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
> 64-bit outline-only KASAN support") which adds support for KASAN. This
> commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
> KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
> compiled which lack the selection of hard-float.
> 
> Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
>   drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
>   drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> index ec041e3cda30..74be02114ae4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
>   	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
>   	dcn31_afmt.o dcn31_vpg.o
>   
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> +endif
> +
>   AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> index 59381d24800b..1395c1ced8c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> @@ -25,6 +25,10 @@
>   
>   DCN315 = dcn315_resource.o
>   
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> +endif
> +
>   AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> index 819d44a9439b..c3d2dd78f1e2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> @@ -25,6 +25,10 @@
>   
>   DCN316 = dcn316_resource.o
>   
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> +endif
> +
>   AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)

Hi,

I don't want to re-introduce those FPU flags for DCN31/DCN314/DCN316 
since we fully isolate FPU operations for those ASICs inside the DML 
folder. Notice that we have the PPC64 in the DML Makefile:

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/Makefile

Could you share what you see without your patch in the 
amd-staging-drm-next? Also:
* Are you using cross-compilation? If so, could you share your setup?
* Which GCC/Clang version are you using?

Thanks
Siqueira

