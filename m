Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170E4AEF99
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 12:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40210E12A;
	Wed,  9 Feb 2022 11:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277010E12A;
 Wed,  9 Feb 2022 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644404570; x=1675940570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ukyBmUqcNBe5A3vY05sL69PmlDiHShGSACOzFWUFQQk=;
 b=TEyR+c63YIvfa1XeQn84eC2F6J3PgxPYadWiXojZvhiR+0JVlPsKobSB
 9xgPIlJUJGwDif/kqhNapdjM9rl3piCLULNoQjQadRI/3hj6DNgaHCjD/
 zrJ/VsYXGP8CR8R4JQ9gDKhoAAAAHn81Yxeldvdp3DppKZd0uEGnqM6pO
 SEUi8DssNuSQnCumLrYpkU4Uf9nXy+W2uXVxInWZwJD3W0lRHi5YXtLjv
 oSKlScq39/jlwDtdVrdSqP6ggeGilYOqVJB1gfa+yBa4w6cQI7+U2Zl+4
 647OwgLhwh+wuPdhe8br0IBk2It0Qsra6IHL2LkrUqhc3JGwDOmh+veJb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229149304"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="229149304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 03:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="482294067"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 09 Feb 2022 03:02:43 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 03:02:43 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 03:02:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 03:02:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 03:02:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHhp2jAD37dqj5xLyM5yLsREFORE6wOo6VKZBXYJFV6gS4tM2a1lTIgR+lHkQmdqOVtfJ9w1Z01lF89TyTt/E8RhZk1SFUHHGrm4Brrk0kULidE21K2MRkYpOW8V9rZtkDp2D/YoJMmZS1PQIIRYdcXnwNpGT3o4manls/R1L6btRb6GOZ6YZ71EiYl/7xdgTUzxBRjijqPaVU859FYxrXABKOQSBZC/6I4IxhQ/haE3B56o26g/YObk7GIjjhmKZo8lAseuY0fIcU+rjQRL96/2uWFodu3g3Uo78UoJQ3riYkTO+j5alCVP352T4UWlAKv4P7f4Csywa9L/tQ1Dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEPoBfTJioDWfs2O226bOE5oGU4/PhYhLaiUgcCA1Gc=;
 b=l5EYPmIpTIX8nI8/X6bDvwzwBSxKQJ1rEg4RwbhUHwz2mrNAl/Nv2HVQcxEt7UXp+E3YKtUa6ixsUGcuIA0Tyvlf9FwfCAeNgWjTdtee88bdw/So4FIKwVBGWHVTpXRzu9lG5Ek2odekic8mAFVVkv3wFAuoaT224xIEUmyP599VUi7eljAfAGfEjIAi1kTSQGBGX4/wXwCgVN8Cs1LT196YV/uclW6SiNMxyEIDzt7mKxLheeFjl1PsGK5or3+b9WNiCi4bzKznqr7GcrUp5mN3oYR7YY7iRKj+qGrfsJ9AtyczznAs/pnCsZPJdO0mtRwL6JC87WjWZEp3d1/uQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB2011.namprd11.prod.outlook.com (2603:10b6:3:f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 9 Feb 2022 11:02:40 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992%6]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 11:02:38 +0000
Date: Wed, 9 Feb 2022 16:32:29 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] drm/i915: Add fallback inside
 memcpy_from_wc functions
Message-ID: <YgOfRYw0DfCMZD1I@bvivekan-mobl.gar.corp.intel.com>
References: <20220207161308.447676-1-balasubramani.vivekanandan@intel.com>
 <20220207161308.447676-2-balasubramani.vivekanandan@intel.com>
 <20220208191155.xrgpbqqounobyesz@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220208191155.xrgpbqqounobyesz@ldmartin-desk2>
X-ClientProxiedBy: BM1PR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe6057fb-7c04-4abc-59e3-08d9ebbbaf70
X-MS-TrafficTypeDiagnostic: DM5PR11MB2011:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB201129B7C350041E41E59F069F2E9@DM5PR11MB2011.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIFvQsCwJWBoJWwoJ5oKOTgwv1cjiAUnu4pz/DnZa8e7R+xDBdNkv3DptOD9lFOuutrUVrcbdDDCu2n2dFZ55C9rxk/zNtBMkEYhS6fkIlKek4GQlsVPXWVoMfUqGt1T8Q0X1+10Jpf4RSZham+/xq7GUXD05c8lC6622pLaXoDeXpNCeCfwu+hG0V0zE3P8IRThFAgUISvcDtJ3O8cv8ahlDplbfkpsCv99lk0AAEcsIUMdd2bdT9HFCBk9eXSVI0ZesKod600iVHu/xzaSAJLaVoDhbs/3hb8SnGzMttaDNLAFObUwIa543dRdQR0x3dubca11Lxb/033SqPW3Rg1go/V/TcwovdAaMjzuW9prScBT10GL9k4Iw7AISzJbTM0n4/47lafbgrVfnzMs0QM2xefRHr1U/nMteEAj+5TKiwfoxCqEA1GkdR+f+rSXXlwt+Mxij3iw+lO+sP6IkZd7efjWfGvRrE7XlxBrNai2HsU7QNv1mopUrHqqZoCf6h8pTkgSY2wx23m8B8JYSunZhPYV0eSZBapp10ViOI3hcg0d1jO5cnO62efsm1jIVej0O9HO0S3sgjh3UHpaGj85dR6PKRyJgniX8fqFNe+HVKeQLZSGNwFkfrVKNBdO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(38100700002)(8936002)(8676002)(66556008)(66946007)(66476007)(6636002)(316002)(26005)(186003)(450100002)(82960400001)(6512007)(6666004)(83380400001)(6486002)(508600001)(4326008)(6862004)(5660300002)(44832011)(53546011)(2906002)(30864003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBmbXBaMzBSRGRQRVM1ZEgyS25Ydjg2c0FpNm93NVFURGduUmJiemhoREh3?=
 =?utf-8?B?bUh4UVBGalBFc2JTVHFreGZ3cExzNFpUMURyMGF6aCswaVdQTWJsODhrV3lB?=
 =?utf-8?B?U1Y2dFBldnpCS1hFcHMrVkh6dzhvWUx2T2l6TXNGS3VyVmlNdm1sd3ZsbjI5?=
 =?utf-8?B?NFNXaDZhZEJyOU9UcXc2WWVENDQyUnp2QWp1OTNxeFdQTGhyNThpcE1PNjh2?=
 =?utf-8?B?N1RXMk44YnB5cmNGNERYL3Jzc0x1TDhhcThkNytBdEY5UFo5eUhTU3FLY1ZS?=
 =?utf-8?B?TlJCU011L3VqeGtremoyYTk2a2N2eG40MVdCc1BiZGx4UStGVGthZEYxYlhD?=
 =?utf-8?B?YnhtVkhKM3lseHpnUnBWUjlLL21oNUZmTjNlamlxWG9CSzlGYmNPWFhKanNz?=
 =?utf-8?B?RnMyTk1UdkxiK1BnZUdYVEorbVB0YjlWM2x5NlBsL25VMEJldEpUeENGL0tJ?=
 =?utf-8?B?YnE4ZktGQTVsYU9CYUw0MXpycENIWk1BMEZlbDVCb2RMNTkvRXlMVVdRbHhh?=
 =?utf-8?B?YjNvTEswVmgxTFJKVWpRem4vdEJiOU5nQWNlL1J1UmNZMkxUQUZobTViMzBl?=
 =?utf-8?B?WHJmamt5RWh4UllwVVQvcGptbFdUSkZuNkpCeCthbEV5OCt3VTM1UGRvQVNV?=
 =?utf-8?B?TkNySjJxOVlnNkhaSUZPZnFNck4zSmlaSVhzRVZubnR0VGtLbC9QQ2ZRczV1?=
 =?utf-8?B?RHJuclhVTlNqbktON2JPTmc1M2lHM3ZQK2JHaEhQVUZlZE1wOEdkU0N4Qys1?=
 =?utf-8?B?T2lGS3FiYWs3RW1zMU9LWGtuQlVGU0xjS1lGeHA1SnZQay9hRnRQaFVReWk3?=
 =?utf-8?B?QXBRenJCaVQzZFlZRS9yd244N2Rhd1hnM2l6YW1BQm1RaXJSMVA0SzY0MFpE?=
 =?utf-8?B?b3dDS1pGcm9uUm40cGxRZkRROWtyNjYwZHJiMXdBNitqTkszdzJWSld5QTV2?=
 =?utf-8?B?L1Zpb2Y0Y09OY1BuM1Y4cmd5S3pGN1RYS21YUDVtY2VsRERlMVpNbkFWaXBy?=
 =?utf-8?B?ZkpkVUtFYjg3MkNIblF0Wmp5YVZJS1hiR0JKQjJXQXdvNWhIWDNRbmx0Nms5?=
 =?utf-8?B?UGNScGJpVWJhNnp0N2dSVEFRT09HOGtWbG5xVGhMV2NESmJULy9nc3ZHSUtz?=
 =?utf-8?B?NkVSb25aajAxWHJjVHJXYUVOUGJxZjIxdEpLU3Zua3FmRjF2ZzRNZjVvYlhx?=
 =?utf-8?B?UVV1L2JwbmIwLytCWW04MWZlK3haWjY2MVptSVV0SnJLSnFYTmlWejB0WnhB?=
 =?utf-8?B?RmczTWQ5dlFOcGg4Q2tyZEJIaTlGOVFqNm5yUWdtNlFubk53Uk9pZUdiV2o3?=
 =?utf-8?B?STNzK3h1UkRyYlFpUVJBc0cyREFibmxMYmhCbG1sU1ZrTjRVTTlnUWY0YlJY?=
 =?utf-8?B?aWZteCtBME1jcU5wWmcxTlgzc04wR1VqS3JhbGFhcm05enFVcjFtd1o0Q3Br?=
 =?utf-8?B?dE5OT2t5RHhyWGptWGlPajRWQU5TQTBMbGNZTWpoclJESFpLNE85TUM0MmNM?=
 =?utf-8?B?WE5XYUg4Tlk4aFd5bTRxbkF1am9OOXgvcHNjZHZ6ZDk4S1VORHhodVYreGJk?=
 =?utf-8?B?VVVBMXV4V1JQUzJnaHFoUDVSb1VFR1dBMDdQTnRRbTBHd3dLRWg0c2liYnpK?=
 =?utf-8?B?Smh1NnEremZFTnNlNkRibW55YWh3WEdXejhtejB0cHRNOWhpZkEzYjMwejFq?=
 =?utf-8?B?R0FLR09LR1B1VVU0YkVQYWxDcDAzajBWWElNY0NIS3V0NEd2eEs0SWR2ZFNJ?=
 =?utf-8?B?cXByL0xlUlBBSStiMFNjQzVBYW50K2lLUzdmVGx3MG80ZUR3MzIrY1ViZ1li?=
 =?utf-8?B?YVM5QTlYZDdGRk9PL2hlVVBYYllBUFQvVUZWK1F4ZlNjMmhNS0FpREhrUVQ5?=
 =?utf-8?B?WVNCa1FJNkZMMWE1WkMyT3hBZmU2TGlGNkZ1MSt3QmZFV0UrcFpuanNESDJs?=
 =?utf-8?B?MHJUaXVwMmMvb29IdVE1MHJlVkp6OVVObFdJbC9qTGtnNnpmT2cvNm5zb1Jq?=
 =?utf-8?B?OVIvc1g1MVhma1A5U0lRUHVqWXZFcy93cE14YWt6eHNLOU5wSG9KaHo4ZEVD?=
 =?utf-8?B?UzlNUUFneG16QngvNnRNejZpdW4yWXh5VTBPdzN2WnNmMXV0dlRlWldCUWFi?=
 =?utf-8?B?QXVoQjV1STlORmRqYVlNU2s2RWdhWFNXZVRZb3d1UC9EbHYwNjdJSEhWVVF3?=
 =?utf-8?B?L0hoaklwOFlNU3pMRi96dXYvZmI3QW9GOEl4Y093MENZVk05eVdXSGRxWmV1?=
 =?utf-8?B?bjg4NXo1a1NpUk5LWDF3NE0yOGgxRU9IMzhRNWR6QnlUYUYyL2VmaW9pVmt3?=
 =?utf-8?B?UFR5aU1aMWlvbTZIRUdoakNnbE0rSWpaVGZpQmVubUlBTmNQeGFDQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6057fb-7c04-4abc-59e3-08d9ebbbaf70
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 11:02:38.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGaHE9UHqdFH152DYE/CJpymksDIRwFu7AKygKirXnTELXNe3nwTeqZ+P8sET/jprMAjBmmKjuEoY2zfZ13nSO1oRdasLTw551gnoVzKf8lNn7JohD0qOIlyzDvWF4E8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2011
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.02.2022 11:11, Lucas De Marchi wrote:
> On Mon, Feb 07, 2022 at 09:43:08PM +0530, Balasubramani Vivekanandan wrote:
> > memcpy_from_wc functions can fail if SSE4.1 is not supported or the
> > supplied addresses are not 16-byte aligned. It was then upto to the
> > caller to use memcpy as fallback.
> > Now fallback to memcpy is implemented inside memcpy_from_wc functions
> > relieving the user from checking the return value of i915_memcpy_from_wc
> > and doing fallback.
> > 
> > When doing copying from io memory address memcpy_fromio should be used
> > as fallback. So a new function is added to the family of memcpy_to_wc
> > functions which should be used while copying from io memory.
> > 
> > This change is implemented also with an intention to perpare for porting
> > memcpy_from_wc code to ARM64. Since SSE4.1 is not valid for ARM,
> > accelerated reads will not be supported and the driver should rely on
> > fallback always.
> > So there would be few more places in the code where fallback should be
> > introduced. For e.g. GuC log relay is currently not using fallback since
> > a GPU supporting GuC submission will mostly have SSE4.1 enabled CPU.
> > This is no more valid with Discrete GPU and with enabling support for
> > ARM64.
> > With fallback moved inside memcpy_from_wc function, call sites would
> > look neat and fallback can be implemented in a uniform way.
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/i915/gem/i915_gem_object.c |  5 +-
> > drivers/gpu/drm/i915/gt/selftest_reset.c   |  8 ++-
> > drivers/gpu/drm/i915/i915_gpu_error.c      |  9 ++-
> > drivers/gpu/drm/i915/i915_memcpy.c         | 78 ++++++++++++++++------
> > drivers/gpu/drm/i915/i915_memcpy.h         | 18 ++---
> > 5 files changed, 78 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > index e03e362d320b..e187c4bfb7e4 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > @@ -444,7 +444,7 @@ static void
> > i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
> > {
> > 	void __iomem *src_map;
> > -	void __iomem *src_ptr;
> > +	const void __iomem *src_ptr;
> > 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
> > 
> > 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
> > @@ -452,8 +452,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
> > 				    PAGE_SIZE);
> > 
> > 	src_ptr = src_map + offset_in_page(offset);
> > -	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
> > -		memcpy_fromio(dst, src_ptr, size);
> > +	i915_io_memcpy_from_wc(dst, src_ptr, size);
> 
> nitpick, but maybe to align with the memcpy_fromio() API this would
> better be named i915_memcpy_fromio_wc()?

I too thought for a moment should I rename to i915_memcpy_fromio_wc()
but stayed with the current name, when preparing the patch.
I will rename it.

> 
> > 
> > 	io_mapping_unmap(src_map);
> > }
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> > index 37c38bdd5f47..64b8521a8b28 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> > @@ -99,8 +99,10 @@ __igt_reset_stolen(struct intel_gt *gt,
> > 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
> > 
> > 		in = (void __force *)s;
> > -		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> > +		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
> > +			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);
> > 			in = tmp;
> > +		}
> > 		crc[page] = crc32_le(0, in, PAGE_SIZE);
> > 
> > 		io_mapping_unmap(s);
> > @@ -135,8 +137,10 @@ __igt_reset_stolen(struct intel_gt *gt,
> > 				      PAGE_SIZE);
> > 
> > 		in = (void __force *)s;
> > -		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> > +		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
> > +			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);
> 
> but you removed __iomem above
Yeah, it is a mistake. I will change it. There is one more place in the
same file which needs correction.

Regards,
Bala
> 
> > 			in = tmp;
> > +		}
> > 		x = crc32_le(0, in, PAGE_SIZE);
> > 
> > 		if (x != crc[page] &&
> > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> > index 127ff56c8ce6..2c14a28cbbbb 100644
> > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > @@ -297,8 +297,10 @@ static int compress_page(struct i915_vma_compress *c,
> > 	struct z_stream_s *zstream = &c->zstream;
> > 
> > 	zstream->next_in = src;
> > -	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
> > +	if (wc && c->tmp && i915_can_memcpy_from_wc(c->tmp, src, PAGE_SIZE)) {
> > +		i915_io_memcpy_from_wc(c->tmp, (const void __iomem *)src, PAGE_SIZE);
> > 		zstream->next_in = c->tmp;
> > +	}
> > 	zstream->avail_in = PAGE_SIZE;
> > 
> > 	do {
> > @@ -397,8 +399,11 @@ static int compress_page(struct i915_vma_compress *c,
> > 	if (!ptr)
> > 		return -ENOMEM;
> > 
> > -	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
> > +	if (wc)
> > +		i915_io_memcpy_from_wc(ptr, src, PAGE_SIZE);
> > +	else
> > 		memcpy(ptr, src, PAGE_SIZE);
> > +
> > 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
> > 	cond_resched();
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
> > index 1b021a4902de..4d9fbf3b2614 100644
> > --- a/drivers/gpu/drm/i915/i915_memcpy.c
> > +++ b/drivers/gpu/drm/i915/i915_memcpy.c
> > @@ -24,15 +24,10 @@
> > 
> > #include <linux/kernel.h>
> > #include <asm/fpu/api.h>
> > +#include <linux/io.h>
> > 
> > #include "i915_memcpy.h"
> > 
> > -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> > -#define CI_BUG_ON(expr) BUG_ON(expr)
> > -#else
> > -#define CI_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
> > -#endif
> > -
> > static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
> > 
> > static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
> > @@ -93,6 +88,26 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
> > 	kernel_fpu_end();
> > }
> > 
> > +/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
> > + * as well as SSE4.1 support. To check beforehand, pass in the parameters to
> > + * i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
> > + * you only need to pass in the minor offsets, page-aligned pointers are
> > + * always valid.
> > + *
> > + * For just checking for SSE4.1, in the foreknowledge that the future use
> > + * will be correctly aligned, just use i915_has_memcpy_from_wc().
> > + */
> > +bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> > +{
> > +	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
> > +		return false;
> > +
> > +	if (static_branch_likely(&has_movntdqa))
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > /**
> >  * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
> >  * @dst: destination pointer
> > @@ -104,24 +119,18 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
> >  * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
> >  * of 16.
> >  *
> > - * To test whether accelerated reads from WC are supported, use
> > - * i915_memcpy_from_wc(NULL, NULL, 0);
> > - *
> > - * Returns true if the copy was successful, false if the preconditions
> > - * are not met.
> > + * If the acccelerated read from WC is not possible fallback to memcpy
> >  */
> > -bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> > +void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> > {
> > -	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
> > -		return false;
> > -
> > -	if (static_branch_likely(&has_movntdqa)) {
> > +	if (i915_can_memcpy_from_wc(dst, src, len)) {
> > 		if (likely(len))
> > 			__memcpy_ntdqa(dst, src, len >> 4);
> > -		return true;
> > +		return;
> > 	}
> > 
> > -	return false;
> > +	/* Fallback */
> > +	memcpy(dst, src, len);
> > }
> > 
> > /**
> > @@ -134,12 +143,15 @@ bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> >  * @src to @dst using * non-temporal instructions where available, but
> >  * accepts that its arguments may not be aligned, but are valid for the
> >  * potential 16-byte read past the end.
> > + *
> > + * Fallback to memcpy if accelerated read is not supported
> >  */
> > void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> > {
> > 	unsigned long addr;
> > 
> > -	CI_BUG_ON(!i915_has_memcpy_from_wc());
> > +	if (!i915_has_memcpy_from_wc())
> > +		goto fallback;
> > 
> > 	addr = (unsigned long)src;
> > 	if (!IS_ALIGNED(addr, 16)) {
> > @@ -154,6 +166,34 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
> > 
> > 	if (likely(len))
> > 		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
> > +
> > +	return;
> > +
> > +fallback:
> > +	memcpy(dst, src, len);
> > +}
> > +
> > +/**
> > + * i915_io_memcpy_from_wc: perform an accelerated *aligned* read from WC
> > + * @dst: destination pointer
> > + * @src: source pointer
> > + * @len: how many bytes to copy
> > + *
> > + * To be used when the when copying from io memory.
> > + *
> > + * memcpy_fromio() is used as fallback otherewise no difference to
> > + * i915_memcpy_from_wc()
> > + */
> > +void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len)
> > +{
> > +	if (i915_can_memcpy_from_wc(dst, (const void __force *)src, len)) {
> > +		if (likely(len))
> > +			__memcpy_ntdqa(dst, (const void __force *)src, len >> 4);
> > +		return;
> > +	}
> > +
> > +	/* Fallback */
> > +	memcpy_fromio(dst, src, len);
> > }
> > 
> > void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
> > diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
> > index 3df063a3293b..93ea9295e28c 100644
> > --- a/drivers/gpu/drm/i915/i915_memcpy.h
> > +++ b/drivers/gpu/drm/i915/i915_memcpy.h
> > @@ -12,23 +12,13 @@ struct drm_i915_private;
> > 
> > void i915_memcpy_init_early(struct drm_i915_private *i915);
> > 
> > -bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> > +void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> > void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> > +void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len);
> > 
> > -/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
> > - * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
> > - * perform the operation. To check beforehand, pass in the parameters to
> > - * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
> > - * you only need to pass in the minor offsets, page-aligned pointers are
> > - * always valid.
> > - *
> > - * For just checking for SSE4.1, in the foreknowledge that the future use
> > - * will be correctly aligned, just use i915_has_memcpy_from_wc().
> > - */
> > -#define i915_can_memcpy_from_wc(dst, src, len) \
> > -	i915_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
> > +bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> > 
> > #define i915_has_memcpy_from_wc() \
> > -	i915_memcpy_from_wc(NULL, NULL, 0)
> > +	i915_can_memcpy_from_wc(NULL, NULL, 0)
> 
> I think the has vs can here is confusing. But a cleanup on that could be
> on top since it would just add noise to this patch.
> 
> I or someone else probably need a more careful review, but ack on the
> direction:
> 
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> Lucas De Marchi
