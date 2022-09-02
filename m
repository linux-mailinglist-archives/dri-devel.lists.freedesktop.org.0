Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D55AB2F8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 16:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8575010E859;
	Fri,  2 Sep 2022 14:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0645710E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662127599; x=1693663599;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pzW4rnYiGGn7UYOVE/wkes3/7GcLDsFfIynZohGReRU=;
 b=BpgVpcljz8wUPQSkgH7gN3AZzW/dT33bK6NA75TXJ7LEhxQtJHIBxTQ4
 cESnG2l1fqmPXuAXvxFToS/m9hFncFYTkQGhM9xZ4xBsWupIuZBzNJ56g
 OcG43J3GLuDBcdt38jKvgm8PB8zkcnNPjNGsvtuc+zt9EVhDHFh4KhxS4
 nTJp9GP8np3kNPiUxwXah2Kqa+zmZTiOxueuIL9FyMxyUfBK7Wwm3x5Ye
 t3gR06BGYU8uraZ2AIKbSMjIBH1MNoE1LMh1flGyqiOtRRL5G4OYb2PUu
 lQ19V2Mpj6MlpeR/EVtsECQ81bmZi5nIkoptrweUGgk838s8fH+MTdiUh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="294726518"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="294726518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 07:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="941300418"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2022 07:06:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 07:06:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 07:06:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 07:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmMhz2nVuu+Vpe1acsfDEwfQQhRzJnvRFkUldfyYcgDgzoZM+9t0gfsE6vbFUvVF8l8ZMhgVCZLBrdoaqAmGyPsGj5pLn57oul9EW6Oq9xt1Y0LKAhPUp0Mv+nVPjJcyiofUdNgMoIHvhcP7fW+WIF4Zgsi+cvK6LOGHmiTOwr7nlBnoU45HgFEnoJd8Q0g9DDMnJX67JxV6lPOsqvENZ9QPai5VWreOmylQYzJhSl1bTH494c2jiBlUQJH6GdPAORj/YO3dUYgvWpvy91GCJYZzDLLpNSpI5CCD/Ejt0UjdZPD+N7PYajf7SA25SpqNaI1egtp2IWDhn/sG105yDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u2HfjDyziHz30kaUY9rfT6Dosa/RqEqXwXrEDwTNOw=;
 b=Vdm9GsbLq7agbFkeXH7v6Ul5/6mD6uT9OUghVZw74NXMpg79YKphMJqrfinNBEDyyMJD/J06vuIKYDnYV4Y99PYVJ32tn2KEvKAd7LheiBWa/tdny3wQ9esUwBvu6yTLA8LKq6It+f/y2RB+jmWW5j1k4YgBvZvrZbHtfhyJlU0egVSPUgJ9CFTl1202XxHxMIMohm0ZBDeZqIJY+ENu5h3UsfOrukPm6VIzJCzWfngA+zpqeTTEKmC+KT4sgMsLRIOtf8gWfXNSy7EGPhzNH1KODA1NXZg0fIW5HpgbTwBmHRCUlyEiWjL2dV/YyP/UTAVfOf8ys++lHPksuTcq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Fri, 2 Sep 2022 14:06:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 14:06:34 +0000
Date: Fri, 2 Sep 2022 16:06:27 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 2/2] drm/format: Split into more granular test cases
Message-ID: <20220902140627.rqzyvfaosf25cz5v@nostramo.hardline.pl>
References: <20220831215608.349269-1-michal.winiarski@intel.com>
 <20220831215608.349269-2-michal.winiarski@intel.com>
 <a314c255-03cc-da7b-b595-77402ec6dda4@riseup.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a314c255-03cc-da7b-b595-77402ec6dda4@riseup.net>
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa2f0983-31bb-45f8-bbbe-08da8cec581f
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23mMlrw67RG26izSuPy4rUlSZns0rIbrfMdjq8MYBy0ATcW59SV8RyQjc9QfGiBaXN76sokSBgjRnxG2dmg4+5JoNW6KUj5EeExtehIWpyvhmnNtF022ihKs9WBHZzKGUYIKmuYl1dthFTeqoZhj7SvvnCXNa6jAaCNcYbxD0JOR/4YXe5EUCe9faDOowPAYoOj51DH3YQxhor9OUAlE7GFKNfFQnnOXBLNkyV6u57z2UXnnsdz1pDUo1Jgtvi6lPBLHmpkLuXmMHFxEsc12QbHAZ16MUuApK+JvV+36Mp5ddyPnedv2NPtUp+a0SOjVRiFjJnV06nI8eb/RoCcOEtItPrCHk+Hz53MOQewWHvFaSliFsSbffGy6TsrS85NBK+cBuAtSdwq8E+cSUg3xUXeKWPa+PkEhQwF3wntHcEcMR6g95RyUTs/QmhNLDvoIWfTPdN51CbHzOTe36arvKYZMlcUWaGBOmtdDCLKZdWmnE6vJwgqMeZmAj4HCjsmzYmsKQXLSIfT7/CIwq3Obqe6PGr7w7q4psXwAU3Qd+ZZAedIbU3af9lZihxe0iwvHDYTyZLszEL2gsmjC1Nj+Jr5kL/Z+BdxMSTioRNDwzUq+n4SthdF1yZYT49wfWKosSK8Ta/wAFw0VnrND7ok4RMqZJ8MeCDBfY4/3kqvuLhZCsENFd4WmWeIrXvQ0J8J9Wc86th/amPtxOF1ExR+E6HHByQn/VYooGC01pmOi9fY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(366004)(396003)(136003)(39860400002)(6916009)(82960400001)(54906003)(2906002)(8936002)(966005)(6486002)(478600001)(86362001)(83380400001)(186003)(8676002)(66574015)(4326008)(30864003)(1076003)(66556008)(66476007)(66946007)(5660300002)(6666004)(41300700001)(316002)(38100700002)(53546011)(6512007)(9686003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVptMGVhbTI5RUVyb1dtTGs2QktrSW42V2F3ZTZOTkxrMzZLYklzZGk4Tllu?=
 =?utf-8?B?enpBc2RSODJ4cUNFLzZKZGhMdSszWmdBVlBpQlI5dUgzTm5qcTkwYVdBT1M2?=
 =?utf-8?B?bXg2QWI4MzdjUDJ1ZmV5VkZ4NVJ4SCsweU1DaEFyVzd6cy9BYnprSFh1MjJm?=
 =?utf-8?B?dzVZVDZBVkx4KzFEc3BwU1ZZQ3B4allDbC9tbXdBVmJFd2pNb0VDUzVtZjZt?=
 =?utf-8?B?bjAyYmFleTczTHhudGV1U053UU1mdnhjNEFCOHI0MStoMXdOcGhZU1RvR0tV?=
 =?utf-8?B?U3hqUndXT1cvV3hIYnROcFNNZ09rSk1UY0tkaFRvcU96andUWDd1bk5QWGY1?=
 =?utf-8?B?emI3bGthWm5PcEUvMWRFMkJkdThlcHA4MEJZb2ljRWZMYktqQ0N6RUcwcVlP?=
 =?utf-8?B?clpTbXorNmlYTXB1SzRyQWl1dTV4VWdBMmdiYTI4MDloSTFqcUpJWGtIVHda?=
 =?utf-8?B?aDJZTzdKVWgzbklMTGp2ZjJ1c3ZKOUNHdmpDRCsvNUNielVKWlZaS0FBM3Zk?=
 =?utf-8?B?eEdRVytyeitsVzYzRlpCdkgxbnQ1SjlkM2d1dGI3ZzRXRUxiK05jMkZZNi91?=
 =?utf-8?B?MDd0cG5FbkppbmFpaVhJU3dWSWxrSzdrZXhlM2xsRWFWYnZlTFJQcTlLV3dG?=
 =?utf-8?B?eXBtQlY0SjBNQXBrS2RzS3owSEhKYi9RZXB3dzZQMVJJVmpxQTEwRUNmd1NG?=
 =?utf-8?B?M2d3bUNTVUFoeEJFYUx2WVAzRWNxWjJQTitMcjVuSGhwQWlFQ0sxMWk1WHR2?=
 =?utf-8?B?aHBPK0RvdDZwVG52TmEwN0dCQTVkTW13blZObUV4aTNkaTBJZkVDckcxSjFo?=
 =?utf-8?B?YXk4VC8yUFcyU2tadGYrK2FDa0FsTVNhbS8zaEhRMVJyVUUyTTRLb202TVdv?=
 =?utf-8?B?S25BQ3JQMkRGVXpqMUdPa2txZHl5LzRLd0FKK1F6T2RLY0M1NDA1aXpoNlUz?=
 =?utf-8?B?N2tJNzJYcTQrUUFzdkZwV2hQTERnMmNSSmdhSzJLMS9SMnBVQ2IwbzFueXBv?=
 =?utf-8?B?dnM2dmVWLzdiYkpzNWVFNkRUaGszLzBUbjJhWU9hZ3N2T2NKYkdsY1oxMkc1?=
 =?utf-8?B?eGFWQWl0S3k1NVFMb0tlNlZWSmVVdVA4TWRNODFpMFpJWnJwMEt3RXlqOGlN?=
 =?utf-8?B?YjR1UnU2SVlHNVkxZklGZ1NqS3NjQzR0NEhMUmZoK3RVTnBuMzR3WU05cDFC?=
 =?utf-8?B?SS80TlpSd0QzTDVVa2RjYVZIZy95L1NUZ1ZhSk41VVBTTnlhelZKcjAwamRF?=
 =?utf-8?B?UFRyaU44YTJZR0ZBd2xnRGRKQWFTM09TUVY3cEgzUGkvbUsyT0ljRFFJQmxG?=
 =?utf-8?B?OEo5aDMvMGo2RGw5WnNDQmJGcFBSOG9KVkNhNklIaVpnQ29lQXVNcisycjZo?=
 =?utf-8?B?eklZWDRCVDdqdXBEZmFZTGg3eHFSRGQ0U1QvTURZbUFoSjZMbFdLZHBYY0Yw?=
 =?utf-8?B?cXVBOFRWWDBtMFYzU1R2enYwamY1Sk9Oc040bTFnSHE5REN3RnJWOGxlbXJT?=
 =?utf-8?B?OE1XcFlpcXp2ejNHTjhJVXREVEFxZXN2cUN1VXJ2VXBPZGhZTWRzbi9WL0V1?=
 =?utf-8?B?aTRUTlhST0VlWG9aUE1pVlNrVUxPdGVhTGY5SzRHRGhkUWtXZzVsT05mNmYy?=
 =?utf-8?B?SFhiM2RHcU93eFFWUlBLZ0E4Mmt2d2J3ejdrb0svUG1ya2o0RStEVXlTaTJC?=
 =?utf-8?B?MXlrQ0VtaHVVMTY5bHVsVlhoaDJaQjJkNnVvTjloZHRwTHhwZWZXNEg2a01r?=
 =?utf-8?B?YU5RS3FueFlsVVc5a3RmdWlvYTRtTEVEL3RuMFBQL3R0STVTRGVWKzlHVjRs?=
 =?utf-8?B?M21yWFh2K0diMlNvdDQxV0ZyM3R0Z2EyVXlpdW1mblhueEUrVUZnbzZQamg0?=
 =?utf-8?B?MGw4TUZvVktSVTYvNEpZSkNGZGVQMWNwVnJMQldxeklzQzM5RGx6OHFGRFVp?=
 =?utf-8?B?Zll1NFZhUmRJRU41V2hVQjBLSkV2dnI5bUpNYUg3N3pMSS9oN3ozaVpXQWR5?=
 =?utf-8?B?d1hOMHNKSU41aElVdHlSZkFPL0JadHZ6Rm5kSWI4Zk40dHptMW5zem1jelJY?=
 =?utf-8?B?TFNrM1BZL1pZWm83Y1RXR2wwUzZaeUVLTlU5UDlDKzFGQTRhQVpmblFua2Vi?=
 =?utf-8?B?aGwyT3daWTRLeDJZNnlvQ2NyN0VYckEvbUlRZ1NtTVRleXE3ZWZ6ekk4NVMv?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2f0983-31bb-45f8-bbbe-08da8cec581f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:06:34.7647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJaWFXxmS+mBu6dP7/6CNb/diUhlB4Pe17k6Y6Y2PtnZI20MZ3hlrvvr2z6nqkJtAC2sFA5E4y/469TdXl/RfENmz//rB9P+aUump1hFC6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2859
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 07:15:11PM -0300, Maíra Canal wrote:
> Hi Michał
> 
> Some very minor nits inline, but either way:
> 
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
> 
> On 8/31/22 18:56, Michał Winiarski wrote:
> > While we have multiple test cases, most of them check multiple
> > conditions, calling the function that is tested multiple times with
> > different arguments (with comments that indicate test case boundary).
> > This usually means that it can be easily converted into multiple test
> > cases.
> > 
> > Passing output:
> > ============================================================
> > ================= drm_format (18 subtests) =================
> > [PASSED] drm_format_block_width_invalid
> > [PASSED] drm_format_block_width_one_plane
> > [PASSED] drm_format_block_width_two_plane
> > [PASSED] drm_format_block_width_three_plane
> > [PASSED] drm_format_block_width_tiled
> > [PASSED] drm_format_block_height_invalid
> > [PASSED] drm_format_block_height_one_plane
> > [PASSED] drm_format_block_height_two_plane
> > [PASSED] drm_format_block_height_three_plane
> > [PASSED] drm_format_block_height_tiled
> > [PASSED] drm_format_min_pitch_invalid
> > [PASSED] drm_format_min_pitch_one_plane_8bpp
> > [PASSED] drm_format_min_pitch_one_plane_16bpp
> > [PASSED] drm_format_min_pitch_one_plane_24bpp
> > [PASSED] drm_format_min_pitch_one_plane_32bpp
> > [PASSED] drm_format_min_pitch_two_plane
> > [PASSED] drm_format_min_pitch_three_plane_8bpp
> > [PASSED] drm_format_min_pitch_tiled
> 
> As Jani pointed out in [1], "drm_" prefix can be a bit confusing. I will
> send a patch tomorrow using the prefix "test_drm_" on all tests to make the
> naming more consistent. It would be nice if this patch already hold the new
> naming, but anyway I can send a patch changing it later with the new prefix
> gets approved.
> 
> [1] https://lore.kernel.org/dri-devel/20220831104941.doc75juindcm5mcl@nostramo.hardline.pl/T/#m82b4e710063b47029a8bd4716d137e575640da9a

Sure - I can resend with different naming convention if needed.

> 
> > =================== [PASSED] drm_format ====================
> > ============================================================
> > Testing complete. Ran 18 tests: passed: 18
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >   drivers/gpu/drm/tests/drm_format_test.c | 156 ++++++++++++++++--------
> >   1 file changed, 108 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/tests/drm_format_test.c
> > index 0efa88bf56a9..1936d2d59908 100644
> > --- a/drivers/gpu/drm/tests/drm_format_test.c
> > +++ b/drivers/gpu/drm/tests/drm_format_test.c
> > @@ -9,100 +9,133 @@
> >   #include <drm/drm_fourcc.h>
> > -static void igt_check_drm_format_block_width(struct kunit *test)
> > +static void drm_format_block_width_invalid(struct kunit *test)
> >   {
> >   	const struct drm_format_info *info = NULL;
> > -	/* Test invalid arguments */
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
> > +}
> > +
> > +static void drm_format_block_width_one_plane(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
> > -	/* Test 1 plane format */
> > -	info = drm_format_info(DRM_FORMAT_XRGB4444);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> > +}
> > +
> > +static void drm_format_block_width_two_plane(struct kunit *test)
> 
> s/plane/planes

NV12 format has two planes, therefore it's a two-plane format.

-Michał

> 
> Best Regards,
> - Maíra Canal
> 
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
> > -	/* Test 2 planes format */
> > -	info = drm_format_info(DRM_FORMAT_NV12);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> > +}
> > +
> > +static void drm_format_block_width_three_plane(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
> > -	/* Test 3 planes format */
> > -	info = drm_format_info(DRM_FORMAT_YUV422);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 2), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 3), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> > +}
> > +
> > +static void drm_format_block_width_tiled(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
> > -	/* Test a tiled format */
> > -	info = drm_format_info(DRM_FORMAT_X0L0);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 2);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, -1), 0);
> >   }
> > -static void igt_check_drm_format_block_height(struct kunit *test)
> > +static void drm_format_block_height_invalid(struct kunit *test)
> >   {
> >   	const struct drm_format_info *info = NULL;
> > -	/* Test invalid arguments */
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
> > +}
> > +
> > +static void drm_format_block_height_one_plane(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
> > -	/* Test 1 plane format */
> > -	info = drm_format_info(DRM_FORMAT_XRGB4444);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
> > +}
> > +
> > +static void drm_format_block_height_two_plane(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
> > -	/* Test 2 planes format */
> > -	info = drm_format_info(DRM_FORMAT_NV12);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> > +}
> > +
> > +static void drm_format_block_height_three_plane(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
> > -	/* Test 3 planes format */
> > -	info = drm_format_info(DRM_FORMAT_YUV422);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 2), 1);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 3), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> > +}
> > +
> > +static void drm_format_block_height_tiled(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L0);
> > -	/* Test a tiled format */
> > -	info = drm_format_info(DRM_FORMAT_X0L0);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 0), 2);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, 1), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_block_height(info, -1), 0);
> >   }
> > -static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> > +static void drm_format_min_pitch_invalid(struct kunit *test)
> >   {
> >   	const struct drm_format_info *info = NULL;
> > -	/* Test invalid arguments */
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > +}
> > +
> > +static void drm_format_min_pitch_one_plane_8bpp(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB332);
> > -	/* Test 1 plane 8 bits per pixel format */
> > -	info = drm_format_info(DRM_FORMAT_RGB332);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > @@ -118,10 +151,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> >   			(uint64_t)UINT_MAX);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> >   			(uint64_t)(UINT_MAX - 1));
> > +}
> > +
> > +static void drm_format_min_pitch_one_plane_16bpp(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB4444);
> > -	/* Test 1 plane 16 bits per pixel format */
> > -	info = drm_format_info(DRM_FORMAT_XRGB4444);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > @@ -137,10 +174,14 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> >   			(uint64_t)UINT_MAX * 2);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> >   			(uint64_t)(UINT_MAX - 1) * 2);
> > +}
> > +
> > +static void drm_format_min_pitch_one_plane_24bpp(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_RGB888);
> > -	/* Test 1 plane 24 bits per pixel format */
> > -	info = drm_format_info(DRM_FORMAT_RGB888);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > @@ -154,12 +195,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
> >   			(uint64_t)UINT_MAX * 3);
> > -	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> > +	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
> >   			(uint64_t)(UINT_MAX - 1) * 3);
> > +}
> > +
> > +static void drm_format_min_pitch_one_plane_32bpp(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_ABGR8888);
> > -	/* Test 1 plane 32 bits per pixel format */
> > -	info = drm_format_info(DRM_FORMAT_ABGR8888);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > @@ -173,17 +218,16 @@ static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
> >   			(uint64_t)UINT_MAX * 4);
> > -	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
> > +	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
> >   			(uint64_t)(UINT_MAX - 1) * 4);
> >   }
> > -static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
> > +static void drm_format_min_pitch_two_plane(struct kunit *test)
> >   {
> > -	const struct drm_format_info *info = NULL;
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_NV12);
> > -	/* Test 2 planes format */
> > -	info = drm_format_info(DRM_FORMAT_NV12);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> > @@ -211,10 +255,14 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
> >   			(uint64_t)(UINT_MAX - 1));
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
> >   			(uint64_t)(UINT_MAX - 1));
> > +}
> > +
> > +static void drm_format_min_pitch_three_plane_8bpp(struct kunit *test)
> > +{
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_YUV422);
> > -	/* Test 3 planes 8 bits per pixel format */
> > -	info = drm_format_info(DRM_FORMAT_YUV422);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 0), 0);
> > @@ -256,13 +304,12 @@ static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit *test)
> >   			(uint64_t)(UINT_MAX - 1) / 2);
> >   }
> > -static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
> > +static void drm_format_min_pitch_tiled(struct kunit *test)
> >   {
> > -	const struct drm_format_info *info = NULL;
> > +	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_X0L2);
> > -	/* Test tiled format */
> > -	info = drm_format_info(DRM_FORMAT_X0L2);
> >   	KUNIT_ASSERT_NOT_NULL(test, info);
> > +
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, -1, 0), 0);
> >   	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 0), 0);
> > @@ -281,12 +328,25 @@ static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit *test)
> >   }
> >   static struct kunit_case drm_format_tests[] = {
> > -	KUNIT_CASE(igt_check_drm_format_block_width),
> > -	KUNIT_CASE(igt_check_drm_format_block_height),
> > -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_single_plane),
> > -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_multi_planar),
> > -	KUNIT_CASE(igt_check_drm_format_min_pitch_for_tiled_format),
> > -	{ }
> > +	KUNIT_CASE(drm_format_block_width_invalid),
> > +	KUNIT_CASE(drm_format_block_width_one_plane),
> > +	KUNIT_CASE(drm_format_block_width_two_plane),
> > +	KUNIT_CASE(drm_format_block_width_three_plane),
> > +	KUNIT_CASE(drm_format_block_width_tiled),
> > +	KUNIT_CASE(drm_format_block_height_invalid),
> > +	KUNIT_CASE(drm_format_block_height_one_plane),
> > +	KUNIT_CASE(drm_format_block_height_two_plane),
> > +	KUNIT_CASE(drm_format_block_height_three_plane),
> > +	KUNIT_CASE(drm_format_block_height_tiled),
> > +	KUNIT_CASE(drm_format_min_pitch_invalid),
> > +	KUNIT_CASE(drm_format_min_pitch_one_plane_8bpp),
> > +	KUNIT_CASE(drm_format_min_pitch_one_plane_16bpp),
> > +	KUNIT_CASE(drm_format_min_pitch_one_plane_24bpp),
> > +	KUNIT_CASE(drm_format_min_pitch_one_plane_32bpp),
> > +	KUNIT_CASE(drm_format_min_pitch_two_plane),
> > +	KUNIT_CASE(drm_format_min_pitch_three_plane_8bpp),
> > +	KUNIT_CASE(drm_format_min_pitch_tiled),
> > +	{}
> >   };
> >   static struct kunit_suite drm_format_test_suite = {
