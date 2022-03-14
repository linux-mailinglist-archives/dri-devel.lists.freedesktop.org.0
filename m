Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9A4D8652
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BA510E742;
	Mon, 14 Mar 2022 13:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C14D10E71B;
 Mon, 14 Mar 2022 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647266316; x=1678802316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DRzT5Gbg1MRiYfR0t0SCV44NvHPv8MCVhAWyfIogLyg=;
 b=JFI6NIxZDPSWg3P6LZxIJzSUdrWKNY55cAYXV3DUGbPS/6PHPH5YyaUS
 TRlXLURF52poK/7V6n8A4ITZjFuRFRMtBMhIl/btjA6/kgioIXNJq7kHt
 thsehzW1xx/wURCUj11N56mS2p3+umynfDLlap1pTTYLjmx7rV3G8kOFo
 LoEYmkv7jm8sl3yCXdxPS/1sW0NO9DxLfnWB+uq+uS57R4JOvdaX4lGp1
 lEf1PB3c5gLPxVJ0YDjJATil0LHYNha2qOlOnt0NFiZv+ApzxFyNiOObr
 FYe/z3IUOoj6q+lm6SprnhRjt0tgEQUpQAV2kUu6N9NZE6vi6eeIBUAWY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="319254957"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="319254957"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 06:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="497618192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 06:58:35 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 06:58:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 06:58:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 06:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dK9J8moXzSAXu4iHNDS67CLRjj8sw6h0R4wtPpRM+IwnV1SlKIjIzYJ2KStKM8hrhlVXbo6sgOVn53BCfB84A544JWDzf3fQmnVGtMDuc0ahwBWCOPjcmq5lmZxlqJC3T5gn9kCkID7QL3fiUk8l9goROPtGx5df/IKAccM3NkIW7zPkig+I8sFrdxeHF5gIaSXKQ/L65z46PdSx7qXq+M6EHDgvytfKzngiHfGWQkviQN1a1XqDajvrpGrm0YOmLhSILnxhYc9wOMVSE2AaEFUy2zsoCqyBgnYc9Shv4cWMwMhPtvIY+0owtO7uQh8uQDNi01VomSrnWFagk4vBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIvLPrqDD6THHHRIfK6YQ0CYR/auQd6j16Wa+RSINaM=;
 b=f+d/v/n1z+b7SxIhexbPxnii1TO1tMHx6IvHDQSFfv1rD0ZigWArsHkUWi7he4Qka6qn8tydQlWgTKGIU0EHSzY6l2WonAz29BcFjINQ32CXQE0g7ntBnPzKRe83lMscA+h4VEkI90/u6epH8CWwXyoXFfYuvgc/RRqz69UWj7dgOEaS9ZEJq6/h3gqwFld01Ym0CLVp/5MNdzKXu0WlSiUbnssqB+uP9gKiOMJGJ/+TR1JACAsjxyVoC8SZAIhc6Hl0zWZoYxgZxt4R6UqRW0HT6jMVIOXgd/j45NjvwC5Oi39Arf8ooWPdZD/N4g+RbHTs5jqm0UJ4WtzkuNxbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by SN6PR11MB2878.namprd11.prod.outlook.com (2603:10b6:805:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23; Mon, 14 Mar
 2022 13:58:32 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 13:58:32 +0000
Date: Mon, 14 Mar 2022 19:28:20 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Use iosys_map interface to update lrc_desc
Message-ID: <Yi9J/AmkJdbY8Cwu@bvivekan-mobl.gar.corp.intel.com>
References: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
 <20220311184028.phqpfrnbzkryf2zs@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220311184028.phqpfrnbzkryf2zs@ldmartin-desk2>
X-ClientProxiedBy: MA1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::26) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1a3adfd-ede5-4c0b-5f07-08da05c2b926
X-MS-TrafficTypeDiagnostic: SN6PR11MB2878:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB287879E11552CD4029052A089F0F9@SN6PR11MB2878.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRkVRq+9xIXNhpN4plqVnvo6PGmsfDsrDvgB677HU0XogLg6VonZ2GeQzRL1oHaBj8wVqupwOt8yOzAuE8yl5FUzsvLYOIIwDhIGDjcyUm2H1EPtTtyPvtaYaUUZno3cSP/oSRAziRKuE8Vi7/s9vnBp42ExsxD/JTcmDXBDyun3pwJprTgW6owEozL4snvBO4poQZq+3p5EBetj2jOi9QYIp5zI5+TBN8g5dxTUw1UWXjeCAj04pi7fDxPYaApa5Fsru8UfjlJNiRAjtNWTs0eAFzaaXM1W/SUAIvjoQEEVlcPCQe3TJkfD0bjbuRIICakWoNOC7b3kBrp8t6rJTFUw86tm4zz2nfV6fKLoSP/0j3TlBoCXHpYrf1G8kQEPJ0StboFiWla6ZlELg9DX5YEwcog8OS/lLlwA6P51BbIiL1qCb07v1RPUUA4xtdKxVRVrZMVIY5RSXfzXu5RwQnNPqx/jYs4o8hvuZcOy8QFNUsTuU3HPC+fASxHMH8UL0aYgRXSpQs1XJZY8sw8l5FFnnL3zLXr+0oJg1XRSRLLscGmrdttge6ZBYvC75UC+wiaHZqW9SDipFJ6sIstp5FQxL8eDnWLzrGbyZ7/Oc1yA7M80FtuG6oDV0wli3IxMIhj5RbztiJm7je9JXwCIqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(8676002)(4326008)(450100002)(6636002)(15650500001)(2906002)(6862004)(54906003)(66946007)(66556008)(66476007)(53546011)(966005)(6666004)(6486002)(6506007)(6512007)(5660300002)(8936002)(508600001)(44832011)(26005)(186003)(83380400001)(86362001)(107886003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJyUWdTOTZqRnd2c3g4aSs2NjErUXNFek40cnRiWEtjV3hxcE1XN0lEMkdv?=
 =?utf-8?B?OFdjQ2hLSmZWb2pDSk5WNTZIM0JUZUl2bnBRSWhTWENNVy9kby9sTmxuc2oz?=
 =?utf-8?B?QzdSZjdva1FNVnhMYjVrSGZSVForckJxSFlPTHRPUm8vTW5taXFWRnByajMy?=
 =?utf-8?B?QnE2eVF1WXlNQmRGLzVHbGNlZlBIU1BvSi9SYlhjanBUYTJTc1o0UXdDYWQ3?=
 =?utf-8?B?dXFIZlRIeUZaRWIyTDNTMkF2b1FETTFMai9NWnVNRk9LcEczc3NyR3VGSk51?=
 =?utf-8?B?bUw0aVpMdC8rZExuaXErelF4TzV4aXg5RUNacFA5anQ3cXlaWEpQMitJT3Z6?=
 =?utf-8?B?bFg4bXNDcHdjSVk5NEtqcEZDTGFtQUV4ZlR2WnczRmNvTzg2YkdaSGVjNkcz?=
 =?utf-8?B?MXI3YmdzVmVFNnh1a0NGRUJrRkc0OFp3dXo0c09rT2daZ3dTVGNrNXJrUjZl?=
 =?utf-8?B?VzJhMHFrdTVtUXJUd2hyckdiazVmdFdpZEIwQklHL1F2MHY0UnRVa0tWMDNJ?=
 =?utf-8?B?SVhTN1dHeEc0ekVxV2ZqZGpvZkpUdlhPckxVWDFobGh5N0pxTUxvMGdpL3px?=
 =?utf-8?B?S1dod2VqNVE3cGJnRUZuRXMrcUdxUDBJcnkwdXdGMDVGYzJTM0h0U1hSTThS?=
 =?utf-8?B?cEFiY3J1QU5xcnlKek5yQmNBUC85bzRpeDBBU3BLRVJGekk0b2pmdTZabkky?=
 =?utf-8?B?OVRVU2VrcjkrME1Pa04zUkJTcURhamtZdkxMOFowS3QxRW1OdjhWVnZoR0pR?=
 =?utf-8?B?WC9JQVhla1V2clIzdXhKdHdmNDZES1JiOUIyd0VybXlJQUVqcXUxZS9tdjl1?=
 =?utf-8?B?QXZMUERxelRLMG5qaEJOWThjYW4yL1BzSGtkVi9pTFUrSGt6emdsS01DUWpF?=
 =?utf-8?B?Zy9JSjh1aktZL05ZbEZNazNFc1pLM1Bld0U1SUhndkZpaDhjMU9xeVJqSU1B?=
 =?utf-8?B?M2lPWE5qMCtZbmdDSng3VXZub0N0ZFlENEwyd1UwK0ZTamkwa2FxSXRTM0gw?=
 =?utf-8?B?a2pzQmp2UFRmeGk5T1FGTlJXRVAzRmt1aENVNFc4SUJETWJtVExVQ3BnVUYz?=
 =?utf-8?B?dmppQ3ViTnR5Z29aSGVXTStKQlFRWnk3K29sTUEvQzJpWDdzWkFocVZ6SExn?=
 =?utf-8?B?YjBiZnJnRmswa3lPUEZ1MDg5V1I0SlhWLy91cWpNd2Vkem5tRkpPSWJVRlQ4?=
 =?utf-8?B?QjVjVjhUdmZJOGMrSEFIdTFKTmhFbU1oM3BSNTcvSHhtWHdzVHFjQTNqSnI3?=
 =?utf-8?B?b3pQOVg0bzFMWlpGZUVQK2NXb0RJMHlRd0trRHJhMHZWd3pPTGwwVndCbW0r?=
 =?utf-8?B?Ukx4dTUvVklBL0tWK0NpbUlBUmZFZTU3R210Ymx1ak5MQXB4YnBhdlVJTDRY?=
 =?utf-8?B?V0FlZHBUWkdrcUlUUG9pbDAyYlFGR2NrSk45bjdkUGxCSmZSUHRsSkg5ekZZ?=
 =?utf-8?B?dWlHeHZNT1VTaHd1ZGN4VGFFeEkrbi96YWxqNE1ZOENZVVdFKzVYUHA5N0pN?=
 =?utf-8?B?cmt3MzdPd05ldnlDeiszNGFDa01nbDNCNURjcFVMWjdVT2prNlVEbG5TNzlL?=
 =?utf-8?B?QkJRYjgyUHVSUFltYXpQeUo5bFBhMWFyckpEVTdsVVczeEdUS2xCVlYvSG95?=
 =?utf-8?B?ZFNPbWFWMGNUaG5vRXNoV0VwWXZxb2pQN0pNTXhtdWpramFwUEhvdmU0NGJN?=
 =?utf-8?B?MzZjdlBKVFQxMUJKZFNoTDZSRzcrb0grZlNDcjZzOUExd0RySmNaYTIzVGV5?=
 =?utf-8?B?dGE4YTd3aUNQTnB3bFRvZDR0YWJ6cUt1QlcrQkdCaTVKM3RJeThWclNDRGhC?=
 =?utf-8?B?Y2FIbmVLd2dBMHpvNFFmNDFPbnpRcWwrdUJ4V3BxTkJVblN4L244RkZIZXE1?=
 =?utf-8?B?QldjenVGd0k4MnZmYnAzTFBxYVorSlRTRUpGcFNtZFFUT0t3VG1tTmFUSUJ6?=
 =?utf-8?B?Sys2VU9FTVp4dTdwMXpBVktnN3owbUVKYUFTS3c3dWF2TkwxME1MdEI5N09r?=
 =?utf-8?Q?bwRm9pd5N5EmckWJaxSXQox1Eu3oks=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a3adfd-ede5-4c0b-5f07-08da05c2b926
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 13:58:31.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNSptcTwyeSb/nbMCrX53cuzUfYldzv4rha9jkZ8YAMU3xlhrjE2OR4yV/c1ig10EdFDNRCjsLSiUVq0QwKd840s3T+E1ei7sYFhy5HCq1LUj0mK/cvCb7jhhQRC+rmD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2878
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, dri-devel@lists.freedesktop.org,
 siva.mullati@intel.com, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.03.2022 10:40, Lucas De Marchi wrote:
> On Tue, Mar 08, 2022 at 10:17:42PM +0530, Balasubramani Vivekanandan wrote:
> > This patch is continuation of the effort to move all pointers in i915,
> > which at any point may be pointing to device memory or system memory, to
> > iosys_map interface.
> > More details about the need of this change is explained in the patch
> > series which initiated this task
> > https://patchwork.freedesktop.org/series/99711/
> > 
> > This patch converts all access to the lrc_desc through iosys_map
> > interfaces.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -2245,13 +2256,13 @@ static void prepare_context_registration_info(struct intel_context *ce)
> > 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
> > 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
> > 
> > -	desc = __get_lrc_desc(guc, ctx_id);
> > -	desc->engine_class = engine_class_to_guc_class(engine->class);
> > -	desc->engine_submit_mask = engine->logical_mask;
> > -	desc->hw_context_desc = ce->lrc.lrca;
> > -	desc->priority = ce->guc_state.prio;
> > -	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > -	guc_context_policy_init(engine, desc);
> > +	memset(&desc, 0, sizeof(desc));
> 
> previously we would re-use whatever was left in
> guc->lrc_desc_pool_vaddr. Here we are changing it to always zero
> everything and set the fields we are interested in.
> 
> As I'm not too familiar with this part and I see us traversing child guc_process_desc
> which may point to the same id, it doesn't _feel_ safe. Did you check if
> this is not zero'ing what it shouldn't?
> 
> Matt Brost / John / Daniele, could you clarify?
> 
> thanks
> Lucas De Marchi

I verified that struct guc_lrc_desc is not updated anywhere else in the
driver other than in prepare_context_registration_info. So I went ahead
with clearing it before updating the fields.
But I will still wait for comments from Matt Brost/ John / Daniele for
their confirmation.

Thanks
Bala
