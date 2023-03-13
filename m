Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DC6B7042
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED4710E481;
	Mon, 13 Mar 2023 07:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C37310E481
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEbOMnWrzseOPn9FdSX/le72jZbaWh085H+jLIiNteOhGvgaN9N0xGOr3GUa7dP3stz6q+gdXpQX+VfsVneaDaArUnDUpMjxf942G3XrgNCIvPSDpdzGPmp9zrX0QeltV/mYVFPhSJkunPDbdSBf/P1SN99gSjiVIA5+X5Sr++A/8lHkB02xl+sJMARQZmp0JIsnH0LAjS+E/gXOTFVBz1ZN1/VIm381uND/fgwAGP1raoi7yTYceqgvuXC6yD5RsOUFwMoNFbSNMWX4zcJ/B3/UyudlrXyRuVfanC+Kc5mkkyFx2O1sW+/YGy47f1ZWIZ8V75cBrZxETduKLNINoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwi7wJICROlaY/e+ytU7v20FwDTKq9KOPuNDcxUjQSk=;
 b=YDL02FAZb9V1vpCz5iybjjgbzrQagUH+GoZA4r0xofAEfSA+zSKsdH/xvjLl3AnxVj57sFiqV7MOqC7hS0jqPcQSf19rnB6rgQVfchsIqsjIxWbbRech+MCpiwYepPlYLcqOnGOliVkWumUgEwe58DIN8xFLBipBq7eEE71VQRI2PnOg4N0XpA5l4flylQOuQeDHHXzBMOCzQH94K3/XQ26NuT6SrxLVdBSws+c+Fc14CfaO2TGUeOvk4qG+8Ezq5QfV0j/KlE9ZRzKhRJUNQpELiFX36FcXRS8n+QbwHSj3WexbZaVFEe+23ut084/txqMXAsnhisEltYwHZsqeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwi7wJICROlaY/e+ytU7v20FwDTKq9KOPuNDcxUjQSk=;
 b=HK9Fmv/dogBIj+RR7umb9LsMSqGbMz3Ce+r7q0S18JrEFTIb1eKRp9ne1CB+tZGh9N9VNUOEfBpmlaKeI+48iF+Flhg+g2DvbpwcPddVmaFM4KsJlFe6YtaQa2lz9PbLhviSfmlaKEinsEXAAu2OA8ldfMJ4lt6ZhpEUldsK+CU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:47:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:47:28 +0000
Message-ID: <58224a49-654f-0026-4286-c6103d2057dc@amd.com>
Date: Mon, 13 Mar 2023 08:47:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/ttm: Remove comment referencing now-removed
 vmf_insert_mixed_prot()
Content-Language: en-US
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <cover.1678661628.git.lstoakes@gmail.com>
 <db403b3622b94a87bd93528cc1d6b44ae88adcdd.1678661628.git.lstoakes@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <db403b3622b94a87bd93528cc1d6b44ae88adcdd.1678661628.git.lstoakes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cbd381-a2b8-4765-c7cd-08db239731af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcHiza4OE5j6SG7/LrloJgC9sCF7FbuiPAG+9cv5m6A2U/4cjc9DCIaSnJvAGpieU2BBeGrPfZRrVeXC+Key/HdI6fgNP9mExjGd6ieFx0XVBsm9sfTENKyp91URjUXbfpAPUYl5gopXcPpIzALxbbLvEgrDF7ofV9DzibRkj1x/yGyh0YzxvlOlrt4zESGBRyRsohtMiSsh95Yw5UROibo5+B9kLAAwCLPyBnScVh5SIImT5ezZxKlquNJ6i5lBf2RlmmCQh+F2LwK2Wb6X7/ZxDG7hPqkdiym52oLdkCCKXZW5Kvwfob+LUV+/6/1txlFJjGJqZI0rQWDp6cffbQ6jdjOhRQxKtBDqdwmGh/US1lM4XtCVVXmHxKsDqujjOPqy8eQ5KmSf9h6zlekbBUb/zDc57Fsh46yPuyvD/zQm7G6/eTMSsUDrFRbF2m2W7a089trNqCExb/UmlnZNt4wL/PyZJnaS44h2RrbHhU+soFEcE7MVxzAnIfzrKHvJxFLms5BNhXOyzN96aXzkkGPjZuOjYOYzpOTj5yGUiYB8BQyap6S81sAiwzeNKR9rk+BALP9wQwem0w2mur76RFi+mFXleN9/ts/a7KQuscYSVm+6mZR/Vg+ddZ2IgQzdAT0CTRxa5JDJI264A88FrKsHsVrYZouKYJdfPTNTZp2WztZpD5qjOqvvNhHcwAe/yHuz1FseC+KhnRJAyCDwlt/zBILUoI2gFkR4HU+iL6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(2906002)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(86362001)(110136005)(31696002)(54906003)(36756003)(478600001)(38100700002)(6486002)(5660300002)(66574015)(6512007)(26005)(6506007)(2616005)(186003)(7416002)(31686004)(6666004)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRxaERIOVVIMlQ3VDBIalZrYlZaTGhnWC9WVWVNcUxKMUFXTjllOXdYRkRT?=
 =?utf-8?B?b2toVU5VNHV3SmhDWXpvLy9KQUR5SEZvTW9FUUgzZ0lmQlFPdDczRzlnWTAy?=
 =?utf-8?B?TTZVZ0wrZVJFMGtiMHIwNEhHdm5HRDdqRzFOUTdGMVlkVm1pRDhmNUZzc3Yz?=
 =?utf-8?B?VUNLN2NabG9WMlBIUzhZZWpQNkxqQ2h4SWt0YVF6MXk2UVMySXZ1WXhPQjdN?=
 =?utf-8?B?bGFwcG1RWmJkNitoeDVJS3UxTHJVVWwvSjZQb2tYcjUyOGZhNDZDc0ZDZTA4?=
 =?utf-8?B?cGJFYVQ2TGw5cjEydTk1TDhnQ1c3VVVTL2dadGJNdE9KMmR0RzNjMWFPUFh1?=
 =?utf-8?B?aWM3Q1lROWs4U0t5a3lVZjZiL0NtNGFOK25QSmtlTVY4VS9Zb2o3U0YyRGZG?=
 =?utf-8?B?cTYveThTSGk2Rkt4VkF0dzJhUXhsdEcveUVZMlh5eTRMRU1mc2M2QUJ2RGtC?=
 =?utf-8?B?MmlZWVE5MWw4dGdaT3JOZUs3ZVM0M2c2NWxsVktLYWZKdHNYdTVWaTlQVDBI?=
 =?utf-8?B?b1duZFFNd0hxRXdQNlNUNkpPVkxra3UwNmU0WnZVbHFNcForVFpDaEE5S1k2?=
 =?utf-8?B?SkxuUStjN0QxYW1qUTJuU1N0dnpFTGN2Y0pVajBrMU5HcnM2aTBDQ1RSdmJR?=
 =?utf-8?B?YlZpZkJLRml1YUR0TGVKbHA5cWVWQWxOMXRSeXJhRSs1dUU4NFZVclpyMndp?=
 =?utf-8?B?ZGFSMFNsWnpiamVFV0FtRUpkNFpkVUZJLzFrMmNuY2NKTWpoaTNnbGNlMWRI?=
 =?utf-8?B?SlpkNnBEai9BVEJoY1p1WTRlMEpWOXQ5L0hZdElZM0VPdlVYRUpjb0htWGpB?=
 =?utf-8?B?OFRtaFdkZFZXVEVHNzR1TnlGdjZxb1pwZkJ1bzA5d1lqS2ppcG5WdG5PbEx6?=
 =?utf-8?B?TVNKOElRbEVRRUJCeGo3SkZxWDZxLzRiYk03QjVhd3BYbzlQdHNoYmM3N1pn?=
 =?utf-8?B?UGtZczh2azNBdDRTOGdoc3E4aloxREl3eTB5eVJYeG12OHdZZlFkQ1VKeDYr?=
 =?utf-8?B?K2JJc1lyb3ZjbndtUktNMDZqMUtIcmkvc3BCVzV4WWxOdm5qTU9UYURCM2xa?=
 =?utf-8?B?Z0tiMEdMN3ZqY2lxeks5WktnZFRtREJPMkdSVm5SVC9qYXd1a2Fubjl0Tm1r?=
 =?utf-8?B?dHB5Z000ZERnSnFhZWozNTVaeCswSUZoUi9QTXd1ZHJuUVdadW5oYzNNZ3FC?=
 =?utf-8?B?QkVWY21acERDVVVwSmtMWVptaDVZaU56eHEyOS82aFZ5RFpXK042TjdDNFNo?=
 =?utf-8?B?eWlLSngxQ1pkTndZcm1ISGwrUEl1U09HUTcrZlF2RlZKYndsOG94bmRIUndO?=
 =?utf-8?B?Z29RQ1pBa0M5SEp4WXphWHM4M0E0Yk9EK0NrVzlWOXpVcm1OMlk3Rm11a0tS?=
 =?utf-8?B?UlYwakFyR3BFMmdGdUIrVGsxemVqb1ZBTnJTZ1hPZFg3eEYrWUd6dE83YWl1?=
 =?utf-8?B?VzBUeStPK1dQUk8ybEl0MzBjbi9qajhCWFJ6UVFLSlBvVDBOaGprWklBWVVX?=
 =?utf-8?B?UnhEMzdaVnd1RnlVYjYyWGVDcVY5YSs5Wit5R1NoWGN4Zlg4RDI4YUVoa2ZV?=
 =?utf-8?B?YmJEcUN1ZllKU3RTUUtvY0NXRThhUVhBVGtQaTRDcVU1TzZOMnZ1aTk3RW1P?=
 =?utf-8?B?R283TkppVlAvcytQaUh5SENlcXU5NnpDWTlpd1UwbUdCaFpRTUVaQVh3d2Ny?=
 =?utf-8?B?UnZLUTlqbG9UK2MzVzRlaDlmZlBhWjZ5d1JvbHRTSjluMlNXNmF6NTlDbkJE?=
 =?utf-8?B?aHJTRjVib0VQSUxrRnZabGhnTGpDR1FWNzlyN2o0U2VjL1diTFRjS2xld3Nm?=
 =?utf-8?B?cTEyZ0w1K0dYcXhTbjJtUUFrQzhUQjJFbStlNmdQN3hheWNyOUxQWCtjLzBT?=
 =?utf-8?B?UjkwbjBvdk1Ob3RRSlRqUFFaSld0V3FHRER0RlJneEppS3hTSFFmamk3Um1h?=
 =?utf-8?B?NE1MZGM3dVYxdmEzQjA0T1RnLzBFQVh5NzRuRXJtcXM3Q2s3cHVvTkhnYmI2?=
 =?utf-8?B?dmlnK3U1OHlLTmFhWHlPaTc4cFh5a1pTVkNUdU1MMkRzbWlTQTB3a2FNUUF0?=
 =?utf-8?B?enVsY1lxdUZFV1c0R3ptK3JWZkhtcEIwVVRpMktzdldtR1FZSUJvZUp0REl6?=
 =?utf-8?Q?Wdd064GY8MBF6LUq17Q3yIhQq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cbd381-a2b8-4765-c7cd-08db239731af
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:47:28.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPFHegJhOZgrJ7TbfmGmfIMWJv7wFjQh7YfU+vr6GfUJTykH9qaD/da26OVbOg5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.03.23 um 00:40 schrieb Lorenzo Stoakes:
> This function no longer exists, however the prot != vma->vm_page_prot case
> discussion has been retained and moved to vmf_insert_pfn_prot() so refer to
> this instead.
>
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Feel free to add my acked-by to the other two patches in the series and 
upstream through any branch you like.

Alternatively ping me when you get rbs for the first two patches from 
the MM people and I can push this upstream through drm-misc.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index ca7744b852f5..5df3edadb808 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -254,7 +254,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		 * encryption bits. This is because the exact location of the
>   		 * data may not be known at mmap() time and may also change
>   		 * at arbitrary times while the data is mmap'ed.
> -		 * See vmf_insert_mixed_prot() for a discussion.
> +		 * See vmf_insert_pfn_prot() for a discussion.
>   		 */
>   		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>   

