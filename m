Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F9565CFF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 19:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A31AB51F;
	Mon,  4 Jul 2022 17:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778859FAA6;
 Mon,  4 Jul 2022 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656954898; x=1688490898;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WNAYhJcZoZqi3nIW9qppiq9EFwaEQjL9YtFalJrkHrU=;
 b=Y124Rrjyx1GVaXO+KOqSoVIzEnYJiPVK1b/HGce1nwWIklndtrwZ5T4N
 ArIzjQGVn1KVB4PY+VmX92WrqRh1ZL6tRwcoijFtCFQgTKIvK6fGiORYZ
 p36T5CBs3AjaxPI83zU22cPDC4iewHycnRjIGjSMYDXjLmyhbBQuJSJBk
 3uB4nV60bJf5B27M2vWmhJ/BglpblXFJU3KJNx/uVijefUzU5K5CY9820
 zJDlC8Px9kO2EJtT+Bbd6PIbIWLsVn75HOlH+gLX9pgj+aEKXxyZXWWcn
 UaU7D1i3q71qs7sC99HZ9lBIliw1reJR78cTdb9B63C57mKqQcV1+aUO8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="283199821"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="283199821"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 10:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="769317675"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 04 Jul 2022 10:14:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 10:14:56 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 10:14:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Jul 2022 10:14:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Jul 2022 10:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjGPMcbkDYkqCnSlrhJQiNpjB3HLBcd1Wrni4Bp5/sPxKuYG+DuwF4hTxYQq7QjrzGdAfJ9QmKm1fdxTJlyLCPdn638WHR9g41KzWlOy+4Oj8TQ7IYAplsIZL0X4G593AP6/vt4OBsOcTGr0lAuvyigS96Nom1ufNyX+jCRzUDOpAAHbTGStyrvAtQmnKmvd3RfzjuYE0h9Dk1l64ghhEWgxq56RTBIHw26M0jDEGMvWsUKtceAObwJzYptPpnQ0hk6FCcEWIFziGfqEjRS/vr5sqkeYyWY0S/mkr17steAlLuWi61CtWLTZT331y/ppJcgYGoaZk6HpJX/fBA+iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxsHzgawCaLOnob6LemlVWIOheOipZ0kn7+CsFKr4l4=;
 b=Rhp5bhNeC3Dqmqnb70vH2Kvqln4BgWSVjpO17aVSeAGx8JVqWo6cOeO7suDBdXjquBymEXRDFuEaDBaOuDZIP6zP7+THzBJh6d3h1Mr84cxP3LQ68IYM+/pFQ1+2YaEzDtZuqHAYDzxVDy4Upbhqkn7Xxy/WdqteVAbbftVjTZlOVATJvzg4jFAaPKkeG3aKLxbJCFUCAZb5OKXgfcWUp5mUZyVL6MD87/O0Qc9xaNYcTwp8ld+OFZyxTZAuqVMAkgNUE32FC8U0mYc0zgtIhVju+I2wCXSaOjSkhI1ecuLMfDIoBzdR6JYhutyeRrBxhY/C4G/rxAllhTWdwObpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BYAPR11MB3207.namprd11.prod.outlook.com (2603:10b6:a03:7c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Mon, 4 Jul
 2022 17:14:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%9]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 17:14:54 +0000
Date: Mon, 4 Jul 2022 10:14:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [CI 1/2] iosys-map: Add per-word read
Message-ID: <20220704171452.atvmef6cn3bbnbsm@ldmartin-desk2>
References: <20220627224751.3627465-1-lucas.demarchi@intel.com>
 <032a834c-3dbd-e997-9e4c-b3baccec43cb@amd.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <032a834c-3dbd-e997-9e4c-b3baccec43cb@amd.com>
X-ClientProxiedBy: MWHPR2201CA0051.namprd22.prod.outlook.com
 (2603:10b6:301:16::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a672ac4-5170-4d87-17c5-08da5de0b68e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3207:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6awwxd5RVlC9LItJJ7iAdWLPJiJeGwQLPPZ5foFQ8sLT/pucMFv6FNyO/pPsXK8ucfJ4SCYhklxKyEovDdwrSKyYEJNuzLiHb7E3pKwxGCuDwZVgjQGFHDRCxpcgcd8UeuXUh7ftQfY+WPQEDqQxMf7Lqyl3BRcJzzfcFoQg6A5t26pCEpNorPVRx0UoZxk+ZjU4F+wPB/GbupDk9cKe47OtW7W2WPBwvFGDRGFW0994A5YhD4seKZkbqopL6op/Np/XW0WCnc4RolGP10Wh4PJWIc9OwzlJLcUhoHh1poTdVK2geITv555l6qp7x6xJMRzYcevjpxNhjNFx+o4J2VSLZSPQWx4EBl8b9bsyvcS22tX2k9RYHoUcvJC2wcNIdbaEI8AedGe1YCIdHnjctzll35F3RvrYEdmmlWgw/Mw7vaNieeNVvN1Pai9TfFIK2wGGlmbQkQIO+ZW5R5FpuL8La0DDmFCSu0R/PniHiWHCAK+Xo2HffonmCzJzWBYlegvRAOanTfaw8BYZu1IVhLlaV8t6TQEQyXqPSIzbBc1EteYdpEOOCpUwiCaJFUPUJKmQEYG2xo2BKx6bDQaTjm2t75TanXsWTsaIs+4HB+IwBlFztzpXZxNHJ4h+QdXZhVKM+OiOQCmnSshOhcccVObqX4/9bRe6jmMkT5DKv/jPYADBRGg6NeJaP7saTUB9UvjH9qWmeahooiOc8fNiHJyVlclnx7Ie6KPE7vjgStpr2OzufYfaXrAtw064DAw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(33716001)(66574015)(186003)(4326008)(83380400001)(1076003)(66946007)(8676002)(6916009)(66476007)(316002)(66556008)(38100700002)(5660300002)(6506007)(6512007)(9686003)(6486002)(8936002)(86362001)(82960400001)(2906002)(26005)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s2ptz9djYDd8yoBKd+7VSkl0UDA3ZGAczBV6RQoZ3GCkJkB7NHSXkqYE9Z?=
 =?iso-8859-1?Q?ZC4xHiZLak1ygXE9DnLGuCnklDxqB4Cw15WXt++Hyru7CjcjkXR16plRv0?=
 =?iso-8859-1?Q?Ueu2m2v3wihalE4cTlugLE5uxUzGhuS1VpWrlTJzYSXxyNr356OviItwrS?=
 =?iso-8859-1?Q?mEIAWEGpbvHXVTd2pRsOZYtOKV/guJiOro0fTidrOV7TUtjTqK6Xo6Czn8?=
 =?iso-8859-1?Q?E7b3HoUCNX+4maPYp70whZoF7bJLiZHh4mnB0tEanFx7yQoxShpSOSHdhR?=
 =?iso-8859-1?Q?xNYwyEhzYeO/1SovrhJ0mDphFXIns/mJlp7PaRlpveaMruromZkOFoKuDD?=
 =?iso-8859-1?Q?7bxj9zANSBNNnGfKTTRC9pqQhARNCZP7T3kOMJHJZsDYGisOTDjZjoJvor?=
 =?iso-8859-1?Q?sDMEVx2Na0fMdcYtx4u0oQiyft8d4Znnk4fO/QeugDnARogcl93dPlz3cy?=
 =?iso-8859-1?Q?dQboHkKvR/+8+tg/8SLytcn1eP2E8osu4RcjgF63tIwU1a7eLsJOSXHWRY?=
 =?iso-8859-1?Q?BeOxXTb2VWVSiwJdiVgnzaE/kyDXWORPVIKiLpgQOXK3fPnDscmGA3eSPa?=
 =?iso-8859-1?Q?Gq2tuFBkR4EwCRSKcprzvcRLhBS1ptfKkk3pFBJNRonqe6qULBcLh1QLnl?=
 =?iso-8859-1?Q?Oh71yLCo6POuZpFK3ajB6Cgv8jEBNSSfIosk+FQ6CvrpoRXIN4E2KVhGEr?=
 =?iso-8859-1?Q?a5ZEUACNkqhTr7SLUgP9vA/67hbFzKaYsnzL2tcnMjcqF+8ozAI6l4KOKk?=
 =?iso-8859-1?Q?iWmTiXyRJPflQFVx+3djtBmrHjv/Wa1HkmoGYj2/U8LtWeVdp5pUa+nOFJ?=
 =?iso-8859-1?Q?Tv4L4vaYQ0roD8I1bB/AAHQwbXwZCDVN2vW1tqANp4odZ/cw714Wq1hEBk?=
 =?iso-8859-1?Q?OYD7QO1bfY4kkVJUZmVVdEZHEQKFJscF+9jppjEiAMlX5RNjBg/pH1rFbV?=
 =?iso-8859-1?Q?/s7+wikmvpzoSZruOBKs27tmuHdkFeDPF1Sl2hAB7p3l/bz5CBlldZ3pZO?=
 =?iso-8859-1?Q?YjK2nSIFVEtGM8MMZdwDOmiY4sPQ7/lYjb40j48gOek+UUMmYRBF/c5CsD?=
 =?iso-8859-1?Q?5BCyQ7u/uALzB1TY3x+XIcbG1l9ykltpWw3JWABHd6BMr5hTbleFKPopsW?=
 =?iso-8859-1?Q?g6s27GJ9vvfJKWj3ynPN93cSBWGtjyocw9+4FyTs1JcB5+EjdnEL/GxLgO?=
 =?iso-8859-1?Q?4dKNIT6lKYytkbFVfwcHI5kyte1YylG7K72qvFUJRhTJ9b4qegtgtyhoLW?=
 =?iso-8859-1?Q?fcllcw/invGfIfygfjpaHt+Y8llAIlEzDRydF6NZ7yfVQwcjpCNeyDPovF?=
 =?iso-8859-1?Q?aO2rUHAQKK6tHl/njPAUFoPW43WGg0VTxlPNvuAs6oSfeftdlKE4QR5F4B?=
 =?iso-8859-1?Q?NMTlxvpsfGIOkcnTToTYdRtDdRBP8HK7VQsR50ZgwpHlOBkx21ziZC5QAE?=
 =?iso-8859-1?Q?ZElLi4HuC2XSUOttJVvp6w6I61wkubDtPD7ur3oB8ubhW7Nx0TGWPVpv9D?=
 =?iso-8859-1?Q?Xw8q0I43Sw3N9B/wbsSF40M625CKn/LU0R7spZMR+4Et7z6gfjS7MbDpx1?=
 =?iso-8859-1?Q?iWwlzTOwKmeBa/ZGlOnfnEhCG7M2YeFfE10S2mabEeGmCpzxTINYRdylel?=
 =?iso-8859-1?Q?QONPURNaem7xfIWn8ILi/tAT2RyzFgLqp5/bwxdrexDuNSovI4AF4VbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a672ac4-5170-4d87-17c5-08da5de0b68e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 17:14:54.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URHg+uAAIOy2NM2KUq/IlfASHTrWlctIEaM0c8CRaewkRNQEftmPfEVL1bIwsNXGDM2zVwCVGSIG7aMjYc5JypU1N3civZ9YpIDugL4MO6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3207
X-OriginatorOrg: intel.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 04, 2022 at 08:30:08AM +0200, Christian König wrote:
>Am 28.06.22 um 00:47 schrieb Lucas De Marchi:
>>Instead of always falling back to memcpy_fromio() for any size, prefer
>>using read{b,w,l}(). When reading struct members it's common to read
>>individual integer variables individually. Going through memcpy_fromio()
>>for each of them poses a high penalty.
>>
>>Employ a similar trick as __seqprop() by using _Generic() to generate
>>only the specific call based on a type-compatible variable.
>>
>>For a pariticular i915 workload producing GPU context switches,
>>__get_engine_usage_record() is particularly hot since the engine usage
>>is read from device local memory with dgfx, possibly multiple times
>>since it's racy. Test execution time for this test shows a ~12.5%
>>improvement with DG2:
>>
>>Before:
>>	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
>>	median = 9.52548e+06; var = 526149;
>>After:
>>	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
>>	median = 8.33955e+06; var = 333113;
>>
>>Other things attempted that didn't prove very useful:
>>1) Change the _Generic() on x86 to just dereference the memory address
>>2) Change __get_engine_usage_record() to do just 1 read per loop,
>>    comparing with the previous value read
>>3) Change __get_engine_usage_record() to access the fields directly as it
>>    was before the conversion to iosys-map
>>
>>(3) did gave a small improvement (~3%), but doesn't seem to scale well
>>to other similar cases in the driver.
>>
>>Additional test by Chris Wilson using gem_create from igt with some
>>changes to track object creation time. This happens to accidentally
>>stress this code path:
>>
>>	Pre iosys_map conversion of engine busyness:
>>	lmem0: Creating    262144 4KiB objects took 59274.2ms
>>
>>	Unpatched:
>>	lmem0: Creating    262144 4KiB objects took 108830.2ms
>>
>>	With readl (this patch):
>>	lmem0: Creating    262144 4KiB objects took 61348.6ms
>>
>>	s/readl/READ_ONCE/
>>	lmem0: Creating    262144 4KiB objects took 61333.2ms
>>
>>So we do take a little bit more time than before the conversion, but
>>that is due to other factors: bringing the READ_ONCE back would be as
>>good as just doing this conversion.
>>
>>v2:
>>- Remove default from _Generic() - callers wanting to read more
>>   than u64 should use iosys_map_memcpy_from()
>>- Add READ_ONCE() cases dereferencing the pointer when using system
>>   memory
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>>Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>Feel free to update my rb to v2 as well.
>
>Apart from that do you have commit rights to drm-misc-next? If not 
>should we push this?

I do have commit rights. I pushed this last week to drm-misc-next.

6fb5ee7cec06 ("iosys-map: Add per-word write")
5f278dbd540b ("iosys-map: Add per-word read")

thanks
Lucas De Marchi

>
>Thanks,
>Christian.
>
>>---
>>  include/linux/iosys-map.h | 45 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 36 insertions(+), 9 deletions(-)
>>
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>index 4b8406ee8bc4..ec81ed995c59 100644
>>--- a/include/linux/iosys-map.h
>>+++ b/include/linux/iosys-map.h
>>@@ -6,6 +6,7 @@
>>  #ifndef __IOSYS_MAP_H__
>>  #define __IOSYS_MAP_H__
>>+#include <linux/compiler_types.h>
>>  #include <linux/io.h>
>>  #include <linux/string.h>
>>@@ -333,6 +334,26 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>  		memset(dst->vaddr + offset, value, len);
>>  }
>>+#ifdef CONFIG_64BIT
>>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
>>+	u64: val_ = readq(vaddr_iomem_)
>>+#else
>>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
>>+	u64: memcpy_fromio(&(val_), vaddr_iomem_, sizeof(u64))
>>+#endif
>>+
>>+#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,		\
>>+	u8: val__ = readb(vaddr_iomem__),					\
>>+	u16: val__ = readw(vaddr_iomem__),					\
>>+	u32: val__ = readl(vaddr_iomem__),					\
>>+	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__))
>>+
>>+#define __iosys_map_rd_sys(val__, vaddr__, type__) ({				\
>>+	compiletime_assert(sizeof(type__) <= sizeof(u64),			\
>>+			   "Unsupported access size for __iosys_map_rd_sys()");	\
>>+	val__ = READ_ONCE(*((type__ *)vaddr__));				\
>>+})
>>+
>>  /**
>>   * iosys_map_rd - Read a C-type value from the iosys_map
>>   *
>>@@ -340,16 +361,21 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   * @offset__:	The offset from which to read
>>   * @type__:	Type of the value being read
>>   *
>>- * Read a C type value from iosys_map, handling possible un-aligned accesses to
>>- * the mapping.
>>+ * Read a C type value (u8, u16, u32 and u64) from iosys_map. For other types or
>>+ * if pointer may be unaligned (and problematic for the architecture supported),
>>+ * use iosys_map_memcpy_from().
>>   *
>>   * Returns:
>>   * The value read from the mapping.
>>   */
>>-#define iosys_map_rd(map__, offset__, type__) ({			\
>>-	type__ val;							\
>>-	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
>>-	val;								\
>>+#define iosys_map_rd(map__, offset__, type__) ({				\
>>+	type__ val;								\
>>+	if ((map__)->is_iomem) {						\
>>+		__iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
>>+	} else {								\
>>+		__iosys_map_rd_sys(val, (map__)->vaddr + (offset__), type__);	\
>>+	}									\
>>+	val;									\
>>  })
>>  /**
>>@@ -379,9 +405,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   *
>>   * Read a value from iosys_map considering its layout is described by a C struct
>>   * starting at @struct_offset__. The field offset and size is calculated and its
>>- * value read handling possible un-aligned memory accesses. For example: suppose
>>- * there is a @struct foo defined as below and the value ``foo.field2.inner2``
>>- * needs to be read from the iosys_map:
>>+ * value read. If the field access would incur in un-aligned access, then either
>>+ * iosys_map_memcpy_from() needs to be used or the architecture must support it.
>>+ * For example: suppose there is a @struct foo defined as below and the value
>>+ * ``foo.field2.inner2`` needs to be read from the iosys_map:
>>   *
>>   * .. code-block:: c
>>   *
>
