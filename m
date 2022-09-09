Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1B5B40D2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BACD10E178;
	Fri,  9 Sep 2022 20:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A7B10E156;
 Fri,  9 Sep 2022 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662756143; x=1694292143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bJntZcsGnjg7Whv2vs1ph1VJpw1yKSq+V6bM0y96rrc=;
 b=O79tD0fTQXmJm/j40xB9nM7Dq55w0kt1o2pw2Q92AmqipIifcuXRZ5Nn
 aKAjcx/0NN5938qi07oU7IL64Dt//ZlY5xJot5PFl0o/tqbSSiNBh0l4+
 /BUUiMQgtuqPdzjBEcY0mS5mIlikjlqccdub5ascJbful/heGfaavYnKT
 GUJ0QIxuiNxwWjs0BO1pk4nPP/PMCQBXUC/YH/G3Vwp7pK5kB/l2glvgD
 t8KfFYu6deBsZJbiXLpRkpgfc59L+Jc3R2Ta+zElap/C5nljJjwE8Nt0G
 fs85hoBFHIu6f4W+elKv/Q10EMwFyUN4jghwm1EhlpbSkFLFb6f907RJV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="296304542"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="296304542"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 13:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645679311"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 13:42:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 13:42:19 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 13:42:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 13:42:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 13:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkGx1ijF6QdRJng8D3aYu/t1LMq15G+Hjm3LTkUj+EsR3Wy6WTwsOR4yR5jsJ35lEdsdiroZjMZalQhCo5dbu7TB5nJ6gvKV3fX7VUadhV4rGLNMVroZqaKtCAeYYBcGfesJb1tkeLQLwiKxObbvuD5sauv0xKymw0/GJai7kE1bS10FOqV7c+lhNfuzvlWaE6a9fmtAwokc6eaWWO8TOMOT4gKo/0y/UWT5vmRyUsafiHlKRwf8z+NgUX9xyf9szI01gs0TjkEVTQ9WI2h4WAmgzYZphfGnBS1rpFMF2kOwBnuYiW996fqzbAEKOL7x+5A88Bjm0S1mPxFPF5Eitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOBa1b6VxQP+bfd9BDlWE/YRDuvwvY06aUTJJNJ6czo=;
 b=oT38ducE3Vyly8pLMquyeYQErw66fgvjDWKjL9xLPRlrwmaNWFUg8UqQwhzfKgEjYjc0ctWoYhbQ8WqhQOs+qhBEPPwVYC23C0XE9edx254EYQoiTeQNVh/25Ls+g+cVMu0URSjW+hEMlKKwiTqVff4GYrTGUADNWrAr3wWv7WjJVj20C6ibs54TfpQD48P8PDeN4GVUz5kHFegPCnNFnYo9ofx2u9CH25YEcx0hqex5Z5dRB2ujkJaW2Aly94+VGbhs9iUgeufgiEUzaGvh9OANx1JWPNGdDxxe8aZpcLUb8Wcl8uLpeIsGNk+99HrupAR6lVMwS7/XWN+skL/OJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 20:42:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Fri, 9 Sep 2022
 20:42:17 +0000
Date: Fri, 9 Sep 2022 13:42:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2] Revert "drm/i915/dg2: extend
 Wa_1409120013 to DG2"
Message-ID: <20220909204215.6p6xh6djjydaci2b@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220907232541.1720966-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220907232541.1720966-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:a03:100::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a2b47db-036b-40e9-78b4-08da92a3c88a
X-MS-TrafficTypeDiagnostic: BL1PR11MB5287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0VShj5NKYOum0/f/v6fn6SXChVm1Vx6vyqjP7Nfk0j4mVKwuWA9ugnuH8RdD0hRE4GqY28ZN5nZOjmqDv6fWn9ChO6xlrqXx18e3YdCadK/vWvbDLO1nCoujJAxUkM3xMNoSpUPiRE44I1XxBnwYNR3SKolXi/KUhsuklRcSygdjcgqdXbbFZwUZD93hI+xuZ53wVad478G8e6kzjtzt7dudXtkasV0HLFn8ZnJJSQRxCTHnihlhtFhl5fWaVpNhO7fEvbpMqePnM5Mz0K+EevpmCrW08zgsqTqKzie4dMaRqfiY9pniiz+zuIJzalep0SVlO3af+mRNOz1ChluGU/Fw5AYGQaSTs6wQbvnjQ4h6t2bs77udTwT7Pobqz8/qyoJrthny4X4MI8/VbylxmgRQaTJnhA9bpvATfHR8EbLTQQNDS2zL2PpDuhTL9/oLBs4FwseW687qsZLrRp3I48fcJu//kSa6fD6hvBBk9AUqRQhKz00wNTWo2lsi7zUg06Sa4lbAz4IXMPO/FbTvbYAAQXzD+b5gyHD/O0u5ynO85OFBFtMzsvPR6lt/QzUKY9Zdyxs5hFYxOi8pV86l5sz5otq9d5FGhcL2STAfkZIOLsf3o/kocM7nJ+oX99cfniPt2NGcKHxlaD2dfZCrcEqJL7l7yhYNcGB7xTvVA9AWjzODMSCfEZFZi965jTYNzjqw4u015UcCDkORYqrGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(396003)(39860400002)(136003)(366004)(26005)(83380400001)(6512007)(478600001)(9686003)(316002)(186003)(6506007)(1076003)(86362001)(36756003)(4326008)(66946007)(6916009)(66556008)(8676002)(66476007)(2906002)(5660300002)(6486002)(4744005)(8936002)(82960400001)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vHuJyJJwGinjQBQaIrQEE6DSggdrL5i//8uVEhTCmBygrKvldnKRq3y26OYq?=
 =?us-ascii?Q?h05zUx8P9jLrhSKaeKuIUlGK+ycygAFotzvC4YBsCI8H4anOlzXPr8PoBBEM?=
 =?us-ascii?Q?1KMkNe6A+LHdd4BEqVpR/sXLKIWbZpwEIqr7XM3q4LH/seuRutTjNFTUip5B?=
 =?us-ascii?Q?/BYhQhue9uNwvNd8PFcOOl4UwHHoYgCYPzNENT7v+AUV9dG0VHC9geyLfYGf?=
 =?us-ascii?Q?iYd09cw22s6jAHYRr4EZyphsut8nbz2Ujrn95D/AZn7lEL9SJ8NVKSbK/vuJ?=
 =?us-ascii?Q?Xb15tsnWs/YRB/p1YryF6iVekrnVzyldZcII+N3Q4hG7LD+Lb3Y7OxWBTjyA?=
 =?us-ascii?Q?/Yfm0YNZFYqRFMHEMFTIqyUomvkZVJ9spGmXacRNqUq0cq0dqYoaiejMZq7B?=
 =?us-ascii?Q?N8TEnjLDCMqD5f2ftfekUGV9WVKWuQOFMptxlOHjyEF+vGe65WjQPWVrZhbv?=
 =?us-ascii?Q?Z3cDfALa9DJTLiFgvTKlTO8eWwS2xceoDm1ChZkYz2rZu1PESyKbcORPj81n?=
 =?us-ascii?Q?mkVHNZKLwPkwMM3oNI9BZYI2FNno0neXH2s5dCW0R38cyyx/6Mk9AtHd4XrW?=
 =?us-ascii?Q?Q8cp+wXtSH21tLcy8yDv9Q6Yz84vNUOu6efQOOQ/dXFdfOsnQvuXGswPuHcE?=
 =?us-ascii?Q?kRFhww5XsgubLLEUziCbgtVm8/Xa/1xr3O7uZ7iPmoWOnSYIWx/+58bazkGS?=
 =?us-ascii?Q?a1bHkzkSJZD5y/ntMxesFX6IoojWyJy59p0+DIhtDBAAMFtD36w/HnLfsUq3?=
 =?us-ascii?Q?NqMEFT5D6RQrVCkZFCYZksH+UzH6s8m9dtgTFyBVCLJfmK+ueOgJ0BNUVjgt?=
 =?us-ascii?Q?nTkgSm01cvXXduxtqyBCiDyQQwLQn2K9GNBen/KhWdoLw+3jq50T6MdYBYj7?=
 =?us-ascii?Q?lSN4Ldudg00n20KqyI3eJz3xRSb9RS4hbaltYp+3Lo6nhXyDjUd2TUE+uTy6?=
 =?us-ascii?Q?cvFebLnTd4+x4JHHAZ0hVlJwMuFbPf3u+9ofEtfXe0vrJI8wyC8RtOminjtE?=
 =?us-ascii?Q?j3rtUgayiqazNQ721Xxfp8hRjxebw7oyGwcsCFOf6G++uQfO0hiUi8p3P6HQ?=
 =?us-ascii?Q?0koKjzcgrNba9e06ZALBfF/lVI5zz2jpqvNXyV6VYjonaSdldIDjeTm+h4f9?=
 =?us-ascii?Q?wtznSO4FomHMwhVzNqev1GIktpJh/rW7CmsZbqRyb48mQAbitZStIKnV1yvJ?=
 =?us-ascii?Q?JOTfkSteTwmovC1kjLnlS/NjRP0hpuw8G8bNqNQ10J0UlUNpiI9o5mOcauIX?=
 =?us-ascii?Q?uG+4UTjjxelB8Nyk7EN62+Ko+GmatEfPKKJrn4X9f7dq5KuO4SH6eI3WXKq/?=
 =?us-ascii?Q?sQtR0SSy+kHNj2X0l5ITxWciiqG3vWy8Wc5/CnCgs7XAfzZqrIGCvVe5SyD0?=
 =?us-ascii?Q?1Hl0/kuL7mOy0kskITS2inETBw/v0fRsglIB36ua/MmVlOB0FL6ZbyRKXMIr?=
 =?us-ascii?Q?Lzrx5nq1nlVE5ghnBwbK/5YEvKpEnaV4eulOOkOvE76SJaLQ0EVooup03h0c?=
 =?us-ascii?Q?3fn47M60pd/PEKhEQ20i1VRK19TRKVQtopcz5ZdC79WPjWcIhtbRiigcbq55?=
 =?us-ascii?Q?Nec4URbRbIL4RdrqtnXJ5maaSu4POT/EbxtqZM3Mm0cg+uFYxMTmH5F04Wr5?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2b47db-036b-40e9-78b4-08da92a3c88a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 20:42:17.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLh4hfuup/P+98r7Wd2JRTnIBccYDn8+PoRGE44Mu8P64A7Ae1uDyJsC/50Er3p2OibStmxiF9GZYprAvtwQtmCS1Vcn+tkoPob4OGRy9/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 04:25:42PM -0700, Lucas De Marchi wrote:
>This reverts commit 487970e8bb776c989013bb59d6cbb22e45b9afc6.
>
>Updated bspec and workaround database note Wa_1409120013 is not needed
>for DG2 (or any Xe_LPD) platform. Simply check by display version 12.
>
>v2: Simplify condition check to display version (Matt Roper)
>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Cc: Clint Taylor <Clinton.A.Taylor@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/intel_pm.c | 5 ++---


+Joonas

heads up that being a WA I ended up merging this through
drm-intel-gt-next. On a hindsight that should probably had gone through
drm-intel-next instead since it's a display workaround touching 
drivers/gpu/drm/i915/intel_pm.c and not the more usual
drivers/gpu/drm/i915/gt/intel_workarounds.c

Lucas De Marchi
