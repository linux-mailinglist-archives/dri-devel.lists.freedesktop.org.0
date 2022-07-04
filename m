Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC717565BB7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A1310F302;
	Mon,  4 Jul 2022 16:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD610E00A;
 Mon,  4 Jul 2022 06:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcWA/0mB4Q78WNnZ3tEdQUNuf4a4HETZ3slAm6as82sh37YZct+kRDiMZbMUdQunfVDI4a0ZMuaBq9D8edesQmvUi0uJ/vu63iDB7WAGL+J9fIWeKDT5EsJpnieNa2/DIVchbZMeOYAcWkEoI9WmfB5lZXJnA2zc+OfBLzWxpQCzqYLwBvWBWe1AN6I7T417loqMX+GpygbqCD12c2BJCktxqLkVpgYHrovy/t9hrZn2/ODobAHNlgt7sFSlF5DV8fi74g+5niduQ90yzMxLSdCI/3H2BrHpdaedfmvNKgm38ajCzcQFbyWe94Hd6GeQ0JMCj5Wq8uGHGGOMBtrx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47iqASiXIE64BFeTJdF+dJ1eRNuci9JCVv/ssSMXITU=;
 b=eBibkVDOjR17dIrpCcb9rNiLMrOOR0GQRj64cDDvf3m3bWPbPjY6bir00yEBzJT+xAQkHaGrCo+EaqE6mmn/QWhuVx08iyPR8l35xE3IG6KTyR5+4YwT8NNsNyE3lz4sTYm880aftaahswjHLSTuo4SX2ObDRvmuiJD3lB7HQiA9Lasul4HoH0gNgIsHb2STMB+TCpkMSr6R+6p4toFXM9pCmkiwSg4PN6xDOp9wqMsFpji9xlWNyd9bUz2oDl2yKGNs7TrLrX6HhPnNadmplKvXZtVzw4Hp22iwYuYHhUS1TeEs5BMCllRvi3jRSTvYR6rjKiJPmG9RO0Hqtn4y/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47iqASiXIE64BFeTJdF+dJ1eRNuci9JCVv/ssSMXITU=;
 b=yYP+M2KP0n0s7wfTTeC9zgwnMcg4gIGHecn2Fi6Lg9FRFnuPnPBEo3FN8HTtECOkGydztZz8YTfi8jNmlMpSpySM7d5pBmIJst+PQlT0VWzZZg4CR64amkGeB0TsvAJBV0fl28qSgLvaKAQDwNp7mWliSPH2471b9hjpAgjoyjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN7PR12MB2836.namprd12.prod.outlook.com (2603:10b6:408:32::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 06:30:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:30:13 +0000
Message-ID: <032a834c-3dbd-e997-9e4c-b3baccec43cb@amd.com>
Date: Mon, 4 Jul 2022 08:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [CI 1/2] iosys-map: Add per-word read
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220627224751.3627465-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220627224751.3627465-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0264.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ee5b88b-108d-4925-1f56-08da5d86a6bf
X-MS-TrafficTypeDiagnostic: BN7PR12MB2836:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSXzOJsVZRZ6pv77lpsy6vHR3ExXCr/lJZUISNmcQH8ArpzURSaobdBU006haTSvsIIe2j2SyRCLmkYjCqceSRg9L+7imnYA8pDgaGT6bHew0WphMyJTGuQUrk2ezEPR8juM0oo1W6PSxU4ASZpLzu7pDmVjziNgPBOVfYv1cXKvRIxX9sSaHTcpd0j7L45dJnvupIBTaZmt0PM3lnL2mtBgv+PakXZ9qMpF1HuzPDY/UdL6fc/uUKrJ/pQpI3Mhylxtjz+4ytjSGzEK+WO4g4bCkTEceNuaF3iBcrAlDVvQYRiCEjZtybKDjdP89ttxFZnwga+n0C1m91GSC3fr1kyIzfd8pPs7g5MrmwpIItdswAik5O+yZciAdeDeE1b2CKahHaq489xoCZTc8bMQj+l9ubsDSRGcPPkBnrDhjBa2DySz4+4eD54pHlKuTX7AQa6bdJJQtOqv5w539WFLJ5X9jmHgL4ERnNXnfscYzIAaqyQX22w7oPBs4w/0de7a4jp8QzEOhy7MxxeEX37FOt6Aosdb3huQEYZeA0JXQH9/hnXivEKm5fJWDOCzNr91hofEKqIkELNrNiutHEUAJIx1UxbcVWNxu7PMYdWnKigZG43IrclymplJqytMDRxob5eyDckI8/du2K27vNKEyKfuQ2e8LAws7NhCm8BHXY/hwIeDIQ4v0Zk+BUfYEhgJLCu5hKdSznJW+GN/fl6ZV3oM+6wW+z5+lARpSvoolWNqxY+lE8CWtnYBJyiBoUow+Z81GXYxyPmFubZvFNMPXWnl33v6BVHAhq7fzIpKHLCYHlFmwHyp0H7j7KILfRumQH8RCrQkkoHz/8VYBNBdmE0W9QBsLcWBEUhbznWxpeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(66476007)(8676002)(4326008)(66556008)(66946007)(6486002)(5660300002)(478600001)(6512007)(86362001)(38100700002)(31686004)(8936002)(41300700001)(6666004)(2906002)(36756003)(186003)(66574015)(83380400001)(6506007)(31696002)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pBK1JUbFFhUDl0c0V0NEtUcVBvRkhlRzNQNEVqdlUxQVVVcGxtRGxTL1or?=
 =?utf-8?B?SDU0bFdGM2FpcUtabWdjOU12N25GcUlQUmtCTCt2RlVlZVFvRTF3STVheTIz?=
 =?utf-8?B?cDJ5ZDhaeC9BM0doakx1NGN3MEptNXZ6N0Z1bFFMUUFGcWNGWVU2UFN5ZzQz?=
 =?utf-8?B?aXFTUytLcnRNeE1MNDdxU1ZoMHlDUFNNNzA4MnRFQmpic21ya2lOVHFPTENn?=
 =?utf-8?B?N1NLOXRyZjVEcHQ1YmVzMDdaR1QzTlpuZnBQN3VmOHEwVThEemlDQlpaVTdz?=
 =?utf-8?B?K0docTcwZExHY3lHWHFQV1FZcmdNYnIxNzRCUDRtUThrWFFSajJwSEowRE91?=
 =?utf-8?B?aEtNTTVraUFvQ1BXTXFiYStHeitzU2lPa2tCa2ZDa2hxSkdscnZ6djdKbEwv?=
 =?utf-8?B?anpOU3p3bTVyZ3lLT2lEZ3dWaTZKYTB3OFc5ZzFpYTJhZVR0YURNdUhyMEhT?=
 =?utf-8?B?dHdrRW1xOU9tY2ZadWRJa1BzNTJPUUxsa1BQSHJ0ZSs2TWtHNGJGMVh3Nkh2?=
 =?utf-8?B?SmoyQzRGRGZHTGpjWXNjcHpkSDgyZjQ4TGFDb3grWmtUM3kyVkJNU2h5bXJS?=
 =?utf-8?B?c0N3Qy85QUhaZW4yQ1hSdmowakg0d0liQ2lvVzRvUjFrY0prRW0wVVBzUmV3?=
 =?utf-8?B?cFYzb25IcDJ0ZWVMNHJPRWtzWE81K2Q0amZKWGJ2T3dWSVBuOS9NZXg4aytW?=
 =?utf-8?B?c2dzNlora1pSbGhxQWlIOGhuSzdONEx2SGppZm5pcHk5VzlZbm1LWnlSQ1ND?=
 =?utf-8?B?ZU4wcGpoTkJqMTltZTR6TnlIWS9PKzdYYnpEb3FtNDJSMzNrdlh4bzd1WExL?=
 =?utf-8?B?VDRha0FtMG5qZFViTnBVUit4cER5OGNIWUpxcWMwaDd4ZURqN05DcVJWTk5O?=
 =?utf-8?B?b0lVTzNNcnAvdW9rNTdZZWNMbk9wd3lISEVaRXRoSnhpRGV4aGZJUGZJaEdQ?=
 =?utf-8?B?N1d1bWIycWNIK1ptSFdOZDVnOVNoNVdoRTdLbG93Y3Fic2VmZlpOT2x1M0Vw?=
 =?utf-8?B?NzhpMjBmWUFvTHlkQzBBZytkeEZVc2UzNTMvdDlMMTV3bllEZ2RQa2dIcG16?=
 =?utf-8?B?YlZrNTBZamFmZGhRazlMTlNzeHdkUFJKWDlPaHM2U3YvNVpWSnBrZ0hEWlg1?=
 =?utf-8?B?T1hvRDNnUmpxTjRHc0xTUHdvWjR4eEo5L2UzYVYwSC9pTlVmeUR0QzlUd2pC?=
 =?utf-8?B?WWQ5dUphS2J0dUNiNVh2bjM4QWlDV29Cb1NoeldiSmtBWVpLbHR6RUIybXlh?=
 =?utf-8?B?dTI2QXA1c3JXUWR6RFFlTk9TS0ZlcmR6QXVRZzRpaUJ2aS9NY2xScWo5YnRO?=
 =?utf-8?B?Skh4YXlnWTlGVy9yRnNvSS92UmZ2T2tjSHRacXNja25tekc2SFd0Q3lYVWFV?=
 =?utf-8?B?OTdtYkh5RTlzbVNCWWlWSDhUeHJxMTBNQzhhRFVaenNwNFowZ2YvemJWOUpF?=
 =?utf-8?B?WjdkdEdUTVlaNTJ6a0pEakdQano4cEFnWGRxQ0tKS3FaWm5HZGVVTjNuSUp1?=
 =?utf-8?B?elR3bUU1bzdFR2pISnpHci81MFFnQ0M4enZlRm4zYWNuQ2l1Nlp0MUNJQ1NQ?=
 =?utf-8?B?QjVQSnY0SXZ3QWt5YnlzVHdaemlLc2o5MkZGZmFjUFRrSklRbzJhN1U3bVEv?=
 =?utf-8?B?VWRGbnQxblJHRmloSndZZkJMYmxmdmxZblBUMG05bXR2dzV4UmI5S1pQUkkr?=
 =?utf-8?B?clhvNjR2SExUa252MEVOSFUzUEZtOHpiaFoxVXc2SnJEbWFORjZRcG0zeVVQ?=
 =?utf-8?B?NDJLa2VnYlgyZDJrdGRPZkdXOUJQNm5FSmJzR09RTEdMa3BtanBxb3RzRy9q?=
 =?utf-8?B?WHhKck9Xb1RCWG1HTHlBWExuMnJXYzd2OFArcTdVWktWNWxSMjZwVU9kUXh5?=
 =?utf-8?B?Nm1GTXNoVmJ2bkRoYkp6MEZLelpvQ1VXS05aZTVLbWt2VWRTL1NCQmRzR0V2?=
 =?utf-8?B?QXJaU3ppc0xVcFNRRmM0KzhQNzJySDVnYTRmdGU5Z2NGS1I3bkZYcmZHcVJu?=
 =?utf-8?B?TmhyNjVIRTM0NUhjdnVJUUxlZTg0dkxEbC92cUgvbFJzaGc4Y3hoOXFzSUtu?=
 =?utf-8?B?bDUvSVU1ZXBhN0VXRFFHS0IzUmJrSTdDYW1uSHB1anFEeldkcW5pWlFGWnVB?=
 =?utf-8?B?SFh5QjlJRVEvUVhnclhUVlQxdEhDYXEvd3ZhRmpDeTJ5R2Z0ekczWXp5TjI1?=
 =?utf-8?Q?OzkwsC69czbz+r56cOiejwKkqptBbZbr85L+bBSpKTNx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee5b88b-108d-4925-1f56-08da5d86a6bf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 06:30:13.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0aJp2IJO/G8s/NTh2ytiS3NizPrRkU3sVYOB00ktIaMTDNkRYleTwtFOZhywjpO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2836
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.06.22 um 00:47 schrieb Lucas De Marchi:
> Instead of always falling back to memcpy_fromio() for any size, prefer
> using read{b,w,l}(). When reading struct members it's common to read
> individual integer variables individually. Going through memcpy_fromio()
> for each of them poses a high penalty.
>
> Employ a similar trick as __seqprop() by using _Generic() to generate
> only the specific call based on a type-compatible variable.
>
> For a pariticular i915 workload producing GPU context switches,
> __get_engine_usage_record() is particularly hot since the engine usage
> is read from device local memory with dgfx, possibly multiple times
> since it's racy. Test execution time for this test shows a ~12.5%
> improvement with DG2:
>
> Before:
> 	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
> 	median = 9.52548e+06; var = 526149;
> After:
> 	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
> 	median = 8.33955e+06; var = 333113;
>
> Other things attempted that didn't prove very useful:
> 1) Change the _Generic() on x86 to just dereference the memory address
> 2) Change __get_engine_usage_record() to do just 1 read per loop,
>     comparing with the previous value read
> 3) Change __get_engine_usage_record() to access the fields directly as it
>     was before the conversion to iosys-map
>
> (3) did gave a small improvement (~3%), but doesn't seem to scale well
> to other similar cases in the driver.
>
> Additional test by Chris Wilson using gem_create from igt with some
> changes to track object creation time. This happens to accidentally
> stress this code path:
>
> 	Pre iosys_map conversion of engine busyness:
> 	lmem0: Creating    262144 4KiB objects took 59274.2ms
>
> 	Unpatched:
> 	lmem0: Creating    262144 4KiB objects took 108830.2ms
>
> 	With readl (this patch):
> 	lmem0: Creating    262144 4KiB objects took 61348.6ms
>
> 	s/readl/READ_ONCE/
> 	lmem0: Creating    262144 4KiB objects took 61333.2ms
>
> So we do take a little bit more time than before the conversion, but
> that is due to other factors: bringing the READ_ONCE back would be as
> good as just doing this conversion.
>
> v2:
> - Remove default from _Generic() - callers wanting to read more
>    than u64 should use iosys_map_memcpy_from()
> - Add READ_ONCE() cases dereferencing the pointer when using system
>    memory
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Feel free to update my rb to v2 as well.

Apart from that do you have commit rights to drm-misc-next? If not 
should we push this?

Thanks,
Christian.

> ---
>   include/linux/iosys-map.h | 45 +++++++++++++++++++++++++++++++--------
>   1 file changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index 4b8406ee8bc4..ec81ed995c59 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -6,6 +6,7 @@
>   #ifndef __IOSYS_MAP_H__
>   #define __IOSYS_MAP_H__
>   
> +#include <linux/compiler_types.h>
>   #include <linux/io.h>
>   #include <linux/string.h>
>   
> @@ -333,6 +334,26 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>   		memset(dst->vaddr + offset, value, len);
>   }
>   
> +#ifdef CONFIG_64BIT
> +#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
> +	u64: val_ = readq(vaddr_iomem_)
> +#else
> +#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
> +	u64: memcpy_fromio(&(val_), vaddr_iomem_, sizeof(u64))
> +#endif
> +
> +#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
> +	u8: val__ = readb(vaddr_iomem__),					\
> +	u16: val__ = readw(vaddr_iomem__),					\
> +	u32: val__ = readl(vaddr_iomem__),					\
> +	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
> +
> +#define __iosys_map_rd_sys(val__, vaddr__, type__) ({				\
> +	compiletime_assert(sizeof(type__) <= sizeof(u64),			\
> +			   "Unsupported access size for __iosys_map_rd_sys()");	\
> +	val__ = READ_ONCE(*((type__ *)vaddr__));				\
> +})
> +
>   /**
>    * iosys_map_rd - Read a C-type value from the iosys_map
>    *
> @@ -340,16 +361,21 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>    * @offset__:	The offset from which to read
>    * @type__:	Type of the value being read
>    *
> - * Read a C type value from iosys_map, handling possible un-aligned accesses to
> - * the mapping.
> + * Read a C type value (u8, u16, u32 and u64) from iosys_map. For other types or
> + * if pointer may be unaligned (and problematic for the architecture supported),
> + * use iosys_map_memcpy_from().
>    *
>    * Returns:
>    * The value read from the mapping.
>    */
> -#define iosys_map_rd(map__, offset__, type__) ({			\
> -	type__ val;							\
> -	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
> -	val;								\
> +#define iosys_map_rd(map__, offset__, type__) ({				\
> +	type__ val;								\
> +	if ((map__)->is_iomem) {						\
> +		__iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
> +	} else {								\
> +		__iosys_map_rd_sys(val, (map__)->vaddr + (offset__), type__);	\
> +	}									\
> +	val;									\
>   })
>   
>   /**
> @@ -379,9 +405,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>    *
>    * Read a value from iosys_map considering its layout is described by a C struct
>    * starting at @struct_offset__. The field offset and size is calculated and its
> - * value read handling possible un-aligned memory accesses. For example: suppose
> - * there is a @struct foo defined as below and the value ``foo.field2.inner2``
> - * needs to be read from the iosys_map:
> + * value read. If the field access would incur in un-aligned access, then either
> + * iosys_map_memcpy_from() needs to be used or the architecture must support it.
> + * For example: suppose there is a @struct foo defined as below and the value
> + * ``foo.field2.inner2`` needs to be read from the iosys_map:
>    *
>    * .. code-block:: c
>    *

