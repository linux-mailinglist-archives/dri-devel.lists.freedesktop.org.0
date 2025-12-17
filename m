Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE6CC8C0F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 17:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08AE10E07B;
	Wed, 17 Dec 2025 16:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dc7wHJfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253310E07B;
 Wed, 17 Dec 2025 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765988831; x=1797524831;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8xASTMMQNq69hCMXPdmb/9CcAX1GEUaLLZnMbEMBsf4=;
 b=dc7wHJfADNjhS3paGS52xfI3tS/74nZ1vrLZ/8sFqY80BCJ5YW9QZiT1
 BPoueBZDt/pqk5NTLapwGnDlfcmXfafSJm5DHSqK5Mik9WxdfAV6HbPjj
 os93YrM9ljzZv8XiqJLdMr1hFp88Py7vsPj2IatnFaWTIVcdU/Cb0go0s
 Eym+IaecrOfkIfaqUSdDAPUjyrqNGRz4456BxuFQBtrlvhwiAfEOKXG4I
 z0JIS+el3pMXYmxqdCFFgbxYaUkOVn2Li/QI86J7Bp22XqHDojfVLtPdh
 9O+9h+8/r3aXNr+P2hcHGsdkOT840LLJxag6mdlDYuB3iidJwHznx9qQg w==;
X-CSE-ConnectionGUID: cRqziOUkSDOaGQbIILVazQ==
X-CSE-MsgGUID: 7eyP+hFDR+yzdqyotrmw5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67970812"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67970812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 08:27:10 -0800
X-CSE-ConnectionGUID: NV1Euke+R3unaWFuoF2ZcQ==
X-CSE-MsgGUID: 5TXI5GEiR4ucWbqJSNnlbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198825407"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 08:27:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 08:27:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 08:27:09 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 08:27:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmTmSMfTBHCgk1M80D+Gk/RCbViJY1GzItHlIIptRunw7RoSLU8++X5peufushbVblda/H+/BpGOpo+vI05QvUNbgvWgV0ttrzuE8LENrW1k07yNytdsgcLJfB/vvyp1qgUvpbRvJ4phm7P8WKU0gtUCnaQp3FQhwldFMEEiIYlMyuhljghPwCXZVx+JTsGJR6I4ceZMzkOwqsMN1Ja8xiJ63MlLZt/vhKegKC+zZfyU7QzKgSo2HS77fBJYxTdS6HN2Jq/EkAGcK/8lMeXBvnEdl2py+AXF2VWbux0ZJs+WBVxa5cS/Y8KrdFh9HqVDdXeUzzpcm36XNkGJV/WaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FduHKJflL1B6GfctmtcUIX0OP0xXQQQQlxf4yalIPA=;
 b=p1MlMyf1bH/xjokAZ1YLX3dScORrAz36sc0XsrQy0v3H25Fm+Lw+gn4MLtbhuC4CFY41mUXDuxGT2OXodGEeL8iJIZlTLxobCJIfhHJTcIl0BuSZ6+K5UvFAr5dhdU3QqmKu3XCvr9HSkE3hAiQaEWz3CU/FZs13Tgvtbt9o/t/42vvhGt066GYiI1gp1NC9fml2qmIVvCNEQmizFqCpm6kxwUMb2sVc17lRksUEy/UQiZhj/EaxvWwxOH2NFeuKyOlGMs7ftELgWI0nOTzKCdUNWMhZc/FzU6vHp6IEQ/zf3v2EXjQUtZJqObOJhIkKXF0T656aP3hx3qf+BJk0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 16:27:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 16:27:04 +0000
Date: Wed, 17 Dec 2025 11:27:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "David Airlie" <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <aULZ1E0W5i3R5Pc-@intel.com>
References: <20251204193403.930328-2-rodrigo.vivi@intel.com>
 <aThMKObVFAMWqkva@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aThMKObVFAMWqkva@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: 83efbb2a-326f-4448-a7e8-08de3d891ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mp1J254idAblIIyFylCoIRXeOwNNn9jpR0uBHKpFYQ3mM4fuf6F95sLA6v?=
 =?iso-8859-1?Q?ub9o3X7RhWA7n/NyYZfaJwzyFkhY/o8z81ud7wNPqD2rJJ1LuJEemqv+/+?=
 =?iso-8859-1?Q?BgZHEcvqV0hc9sU/fOknPMfEI5W4eOXt8rT1uvDANK/ZHcX7vzYvGkufd0?=
 =?iso-8859-1?Q?aYXwnRdWPvVPYbSjKKceFsakOCIpaCE5SfZDP0kTHXcUrstShjkpTS62o8?=
 =?iso-8859-1?Q?n28Is9y5BvAmgYp9ZaXSrujsM7TZu/BJnXRosE8lT9QSgvYnvHG9HDCdHN?=
 =?iso-8859-1?Q?1gx7bf3SGjQhMxUxu6H2AcDqG3vMVaKh9z2c+Lbn60X89AZ3cGnaDLpOYU?=
 =?iso-8859-1?Q?yRR5vY93Akq6uwkisQHXM1s1mcie9/xq9j4uWlYXaQNrAHD6cTkgBrVELY?=
 =?iso-8859-1?Q?NddK4Mzdyt9P+cW/ESyedagMOjIHctmn4w6yyr6YPCpGCqcDy701xYzmzh?=
 =?iso-8859-1?Q?srWNKPolA1+XxUqmfQvIXXnUZvN7yrK+2j0zbKyZzCtaxygTpuNTgLu411?=
 =?iso-8859-1?Q?VKQ3i/rNklSB0NGOhie9VQyIJ3QudXYge8vpOAv0bHUm1Uc+TEDs4pp5k8?=
 =?iso-8859-1?Q?rUgrAeNnrIA1TsSjE/7onDBv/W3Ccj1JkOpgAOFKuL/2f33eVQ1QrGyGx5?=
 =?iso-8859-1?Q?cZ+ZQlsN+WW0x+QdLgTQ3xxMzhbCsVAYVJh6g55Z6B8KEn06jMDtSPRqYh?=
 =?iso-8859-1?Q?XLOdGm2VZptvogbGNvpWsBTEamzQrD6b4HAkMCW5TpEGY8+HupImCS+PSr?=
 =?iso-8859-1?Q?WN6eIpf/kYyMtxXtwiau/6xLNGrKAsvfGi+Kk65u6hY6fIy74q1H/43HBh?=
 =?iso-8859-1?Q?2yKEG1UukUeNn8zkjHbsGj8WrqpiqtunHowhjq96OntbMTWYW2mMlw850Y?=
 =?iso-8859-1?Q?vuPzVNWAcezI4Ll/0Sznr+wYBLmNgNnEVh0F+3uOUes9AaMKXNcmAS3NFh?=
 =?iso-8859-1?Q?8GwA3HKnkZSqnvQvw5dFfSjWzqAFZhwaM7x0nqfgd2y35JDxujnheCJdGd?=
 =?iso-8859-1?Q?9FZm1GVU7lsW26s5MBkhm0U0FnTUv5hWLwlSy9oAxVamddEoncYAX43kEN?=
 =?iso-8859-1?Q?JtYSx5FXSzNRkoM0JCT+X8WPupbZSx6jWFr5KhRHnHRVo1NsDVVdNnTcIX?=
 =?iso-8859-1?Q?Vwi6yrwDFd7b/zLEuatv5VSWpYHWqGt5267o8d66rkSHu8BQVyfkErBoL0?=
 =?iso-8859-1?Q?F3BpT0hU9tZ09dWY0UUkv9K48NW8Jg6AQsuBIon2yeiypYcGrMDYWyLajf?=
 =?iso-8859-1?Q?dH5r6uTQ/9XMI1das41ZKMq3RJmxn2rGo2tj8R7SZcocM1tBKz/O/6Jix8?=
 =?iso-8859-1?Q?mRLGBSEmQz/AMCPuw+8scwICA8Op1Uwi4qUShj2astjg9FIYVIGxFlM4sE?=
 =?iso-8859-1?Q?BjnhnvH8QTFo8CmCdV0LBoVNKqgPtrkfQXT2rmHOS26fTuh9ibaju6odNQ?=
 =?iso-8859-1?Q?XTkRlOXg8SgMcIT7uC4ptskdXZKn8GvqrjiaMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9LAuo7vR8xbeVgU4QmOwPjCjlYsbCp1clE47C2RbCnaKgudDRsKZHhxbud?=
 =?iso-8859-1?Q?nU1s/dY68e3m1/HJKKs8sU8xwBeSMBYjI75NktVYNn5nt0DKJlXIMkuvdC?=
 =?iso-8859-1?Q?LTYRdFSP5p2PCFfrUnAbeFFDKtxtqxGf4QGzFIQDByHK2QJdstwAf84dqu?=
 =?iso-8859-1?Q?LjowzEz59L2vEUTM+bIBxYMntOaU57vFwvl7tLGh0WsD6Nmh8Ah2x0LtbV?=
 =?iso-8859-1?Q?2ZbIuGutjrgfLH5w1xsq1GzkogCo8PFO8cq2VLK3KoUQoXshCBZcUNRVmU?=
 =?iso-8859-1?Q?RgOLMxneqKQKG0Z0ToQJ9v9obuqvbXxXmxOSFTKddWoC60P9wFpH3bP45x?=
 =?iso-8859-1?Q?9Sri8Iurz63kcANF6IJC+HFf8RRx4y4UpGei7f1dmpyYcs38TGwDpzxiGa?=
 =?iso-8859-1?Q?tq7+of197I3ZQ529FT3XpZoUUKYcDen2ze53UrZBkjCQ5StftQdH/cFzDM?=
 =?iso-8859-1?Q?kAYEVE2VlqVMFyjk6835eEYjLkvTL2WM8j4CNyObiPW3paaGJ2k41NNGJd?=
 =?iso-8859-1?Q?3HdMmLrL7bbaPyn1dhtUlYHijhzFdI+Qz2qWFnAj8j0+8/zqufuQibRV5t?=
 =?iso-8859-1?Q?O8+bL9YKSM2Qf4oJ22KVCsKE0lucmw52YxcWHO2kVCiCNnU3+44jxgqaI+?=
 =?iso-8859-1?Q?QoJrrcJopZ2wadn4RPJ2HjtxGZArogtN0e1gPKhsP8h8s3AmNwimo+Tl4F?=
 =?iso-8859-1?Q?mBMI6tC+iikr4p943v8gGgm75LMnPEzMJT279DcGu28S6/4fwKWPXqHPxk?=
 =?iso-8859-1?Q?pZc8B6cswy+N6S5yeHXEyTvZiswlqTdpjPaaeLTaKkXTqNwF2cgU0T+9pH?=
 =?iso-8859-1?Q?P9YScSQFB3H2bavloOXB22AcdYu3Tp4LZ7gyN1X1GNSejU1OK30MZuVObq?=
 =?iso-8859-1?Q?ORfwY3mtbrqyIiKmVAUB8AP4Ahvp4ZS4lXQF5nHw4gPEEvVTaYTymZYJLW?=
 =?iso-8859-1?Q?9afJYURqeOZKsMoKbTvHEtIeqJnuzbwbEIz52Ln4vdQwkjjkApEH8DrqMD?=
 =?iso-8859-1?Q?f8bvcLzHS4vljSf9S+HyGGNbw/wVqczl5xva2d2yDHtDxXI4gTQ0cPSYkq?=
 =?iso-8859-1?Q?ttuTMkr8VjWORF+GpIDiTmx/m1yc91JeEqb6WqnMmEy5T60QdsKj2qCF1a?=
 =?iso-8859-1?Q?hO4O9l/5zjVRQM7Q2+3AzD30H+gHCM5Oj8gPhgzi8S9dIWPuSISeQI5AFV?=
 =?iso-8859-1?Q?eFovzibYcGP3qNEzj5GO0yaqw33f6ah//TYRxzs3gxcLXM4aVaGqFh/zma?=
 =?iso-8859-1?Q?m3R+NQco95dsgbchTWV1797NCeIlQdbnzoW2VuB6rGsEv/OqOKmKS5+U9V?=
 =?iso-8859-1?Q?yavYYL91+GG4ZFGnwNI0sMLKkz1I7vvBaYT+st9DXapIqCjgfECIUxkveb?=
 =?iso-8859-1?Q?bcdAaLf2oK2N7pLg1OeCv/oWV+omfXndexAIPvZOvJO3oFZ463nDki4W8T?=
 =?iso-8859-1?Q?EgvyyEtnMjdu+6R3nsQug1ctq1OmH+PApqrNYQsco5XVBGiL9s7MLsgVjz?=
 =?iso-8859-1?Q?eSh4qOyjxzDDRGC1nUnbkqmURc1d09Gy08UAja+BgHsSFFYOe4yYTZs6GH?=
 =?iso-8859-1?Q?MInw+5nePDAY65W4lxpeibFPMLWDKBzpmUxKOrWtTNVaO+Mjs9uutetjbR?=
 =?iso-8859-1?Q?O8IL7PLWwat7m/W75wo68qEpDTg3UrhXvJfpZeXmp8Z1/e2PLrbJ1zIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83efbb2a-326f-4448-a7e8-08de3d891ccb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:27:03.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/6XuqaYKufTfMSeNvntJn2qvpJpDH9wPVBhS91D+mY9AcJlqN2BzIdA5fF5+iD6nHg2OXaaZdoSUlhvrrMg3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 09, 2025 at 05:19:52PM +0100, Simona Vetter wrote:
> On Thu, Dec 04, 2025 at 02:34:04PM -0500, Rodrigo Vivi wrote:
> > Add Matt Brost, one of the Xe driver creators, as maintainer.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Thank you, pushed to drm-xe-next

> 
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7774cacab5f6..254649de9c26 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12517,6 +12517,7 @@ F:	include/drm/intel/
> >  F:	include/uapi/drm/i915_drm.h
> >  
> >  INTEL DRM XE DRIVER (Lunar Lake and newer)
> > +M:	Matthew Brost <matthew.brost@intel.com>
> >  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> >  L:	intel-xe@lists.freedesktop.org
> > -- 
> > 2.51.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer
> http://blog.ffwll.ch
