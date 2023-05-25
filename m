Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC58711173
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD31610E6D9;
	Thu, 25 May 2023 16:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F7210E6D8;
 Thu, 25 May 2023 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685033787; x=1716569787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NIX56+6M7xptkGh7iF1hiNYjcm62JEIJXFXGyeGVHls=;
 b=E3A1gl7ieIXEBZfpKKx90GYLCE7tBuk3zdoZP4NGf/nNPGu1ln8OheIA
 LRW458DB0JLRc5CYtrHc+zTB5lMaQPbhYrQJrcw34aUifSRYkxiWMYKHs
 wBxfB2bwKg9hZK/hSV5w7nwlu8TFm/uQjIMi3sxUMadSWQErktEFb03y9
 kUdZVcfus11V0Nc0uq77YAMClulrzjorP0GqZspQVy3dDcx328/dMucic
 dQVAOUonarkbsz4XdHGB2PAspSZ+8gnBJERXhjt3T4NzyZb9TOq+7TQ7h
 WOH0YwVRykas+f0Lm4TgawTdxjmJsgo0UMToikJMbxTFrUocWEsMmpas0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352797794"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="352797794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 09:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737852404"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="737852404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 09:56:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 09:56:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 09:56:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 09:56:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 09:56:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvlEQy725QrRzwRdVbkRiFyQkkjRLBbKUPTYb4P/7Boo9kfL42hOdp2O0qlefqmfdFWqIPkYQ2Ym28dwpDMVZB/0M+x4GL63pDVqKGZE2qrnOeE0QSvtxY2JvlUruMGJr/ZhBdWsl1y8l2kCtUjrqRmH8uyyfgbGcXZXXMZ1SQIiBK8suaml3Jx0JaSk0wGASyjWHNW2JD03gBYkmaXEckib6LR3RPKyWEquQ29OsXWKkDOYnKpKFss59g9mnXKCbarwJqznXT31zM7WLTxTANLAfmCR9IJ+j1T0SHl8N6RGEGXp6vOigI9/B1MZjuVMTnWAeloJi7IooAOX8TbsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=en8XfNkxDcwgab7kY3zDS99p5G0k1tAdwwElhOI0nNM=;
 b=MfPZLID3a0xXrEoBLaJgLiKoyIWsk1tclhg+4hrOekO9KX7MDZ6GKQJz/7b17Eb0AvAXj7EykOjj6oFUSe77M0l8VXP2RwD4ZZZTb9e/ZvagaZ7ejWKH8Jw/sPdk6dRLVC0DThgJ5Faa2Th9+5ujLCbsKMUWIQGbA69OFlGrailjyzMkxvBQewridBd9/acRdoXYNDl85vzuaSgtKTi7M3cYX0vo5Vh4hbyWojb1J+fJYrdHG+PqRDV8oxrhnckFnHSDufD9N1P8acROtU+cmDAFQ1lMvzv53E/m443DdgD1WJj7bYKfazVY93qfnkVhXroezB8jSoBoTKKfZLz/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB7129.namprd11.prod.outlook.com (2603:10b6:806:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 16:56:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 16:56:22 +0000
Message-ID: <5b16ee44-3645-88e1-4c03-b46eb57ca1f4@intel.com>
Date: Thu, 25 May 2023 09:56:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-4-daniele.ceraolospurio@intel.com>
 <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: d10055e3-adb5-42fb-690e-08db5d40f805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XvjQAYNVzbNPxy0ctqUTchKY59hv34CwU4UIYiyWCq14peS432BelmxezQHcBvxdPQCONFaMi7btP6xCqLysi693z3it76N5a9T0s46t912/cRPJfSGTy7lfojWnw6YD/XkA68bAJ/9vBjK3A5DVyhK0e2tLQrM75hObbUHEGx0olIW1UCDDu5dgTNb/6OY3F1rkKt4Ie9gN/ttbC/x6Hg2H3Q01R4ZSqR8u7plQ+NZxxPvhlcXRq57cXEZkHjiERNR5sB84jR9L1TFQJXdXS7XvACbHVx0yHyYVH89UfWdOJ+3h1CVApwRiDGeWK8HWe7YIumfp7iVUAK7EE7CSbZRJktNcpBRzZwqs2xjgA5W749gg637s01KKBtj0OgxTvwpLOqKVG8bc+e8cR/zmfc9CIklh6LePtlXf+cOPfhxyDw6q+pxOnoTTaRAPrE2RDaFDTGIjXcrAMkIKpWWJEiOzgv4AtEGp9IgiN3m7/7Dwvc3SuOL5IQr5nqCo8iNxBRA3oHgpTicqS60dWbTL0ZTbnRza0zGQ9iVPvDSxOt5shUmaA72OoZK0Wai9PnrHIChUEZVbU4QShRetQFRDN2bzAJTnc8lkwgtNxJezQlMSJQtVHRF+lEbV5LBcM4YfeLZcaxv33wM/yj7ZHg9mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(31686004)(450100002)(66946007)(66556008)(66476007)(478600001)(110136005)(4326008)(316002)(86362001)(31696002)(36756003)(83380400001)(6512007)(6506007)(2616005)(26005)(53546011)(186003)(41300700001)(8936002)(8676002)(15650500001)(2906002)(6486002)(38100700002)(82960400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFREMVFSWTBib2F3d3J2WUxLcG1sUE5HWTZRZ25kWjBsakkxZlJhUHNpMzV4?=
 =?utf-8?B?eHJWTld1a1pCMzNCVTNiWHpaaytFMGQwcTRuVE41cGJiOVc2R28zRUpDcS8r?=
 =?utf-8?B?MFgxbTJwUE1QU1dXSHExejgzUEkrdUI0amMvNUx6dWxGSUM3WWJiYXJSWUNp?=
 =?utf-8?B?VWI2WVdlRHd3eWpwUEFnbE5aVG1IcmY0V2crczBMM0hVaUtpQUxMWWVzblZh?=
 =?utf-8?B?c0V2WUZNT1F2cXNFVjl2Q0gyV21yVWdMWHJObjJkbDAxSWxLaVRDOThZNzZO?=
 =?utf-8?B?WFoyNFJGd01uNXVQZ0ZpRDd4WTQ2aWhnemJNcHFpTXhSalhBS05takM4Wk5X?=
 =?utf-8?B?YnFVWi90dmRyV3k3Rm1LdjV1L0l6V3lIR3dZR2NGNjE1VFVHaXg1bkNGK1RD?=
 =?utf-8?B?eHBLZ096THRHOXRVOXVybkR2K3IwdCttSXRWZm43NWNxb2dSSk9CSkt1eDBP?=
 =?utf-8?B?Vy9ETkprZnZvM2R1K1hsNGJQanc3Yk03eTFiUTZpekEwSDJhdjBCL3VPNXUw?=
 =?utf-8?B?TFB6anVUcG1NSWtpemszQkF2RFd5R2p5dHNKS2c4cFVPdmFhQUxIU3BUZWZY?=
 =?utf-8?B?QWhmL050Ni9EdHdVVFNTcnFnQVBIb000V1lndm5jY2Q2T3NrdmFiVzBzam02?=
 =?utf-8?B?R2FnbXZZMHJOVU5WYkdLSzhuTnpHMG5wQlppY3hmNmpDZ3NOTVVKTlJYcFhG?=
 =?utf-8?B?M2pJbzRwWnI4alMwWHM0MEhTLzdhRHptN2c2eHVoTlA3SXNOdk85cmp4UzZP?=
 =?utf-8?B?U0FqNTRsRFZseHY5RVJSQUZlZFZXSzBUY09WVVVJazljRHpoNkJSbUJzT2Fp?=
 =?utf-8?B?Z2E5S3RoZGJPMzF2YmVtSWFiZ1B4ZWwyNzRpbTR6ZWJ5Vlc0cGJPMXpsMlph?=
 =?utf-8?B?dlkwRXFHUk9iKzVLVU1TcWVaV0dvMk1WMDFTcVdsSWdOOFo1WmVYZ1d4dHBt?=
 =?utf-8?B?SDZuSWtNM0RpcmtRaWREUnRVdlJic1M3YW52UlBOKzhYZWU4Um40QVJhbGlp?=
 =?utf-8?B?ZDk1b3RzMHY3N0JxWU40Z0dsdFlHL01UMkpIcG50R3UxVGFvWVZQZEhRVyts?=
 =?utf-8?B?b3FnejRCY0dPT0J5L0t0Si96MFcyN3BKUCt4VmtMeTBKQ2FBS3k5eTJvOHRp?=
 =?utf-8?B?Z2xKU2VnSmcrVFBzMUREcllydnVhOVJZY0NBK2x0QWNTbExJblRXcmJLdFlX?=
 =?utf-8?B?ZGI3S25KTVpUS3VBcEp6UzBLOTJlTmJ2Y0FOcDhtenZVM01ydk53MU13QXlo?=
 =?utf-8?B?eGtPa2ZsY09qUmhsTTlPbDhxbkJUODFNNGFIYWplRWlyZGV4dlJzNWpVUXVD?=
 =?utf-8?B?cllRQVRFUlY4UW9tRGdKSXRDQ0xQeGJpL3ZIdUVLNmFmVWJZYTlqaThiYnMx?=
 =?utf-8?B?NWxBSTRMTko4MFF4OXRXNjNncWNoYXBISVl5bXdnUzR1bnVJd21xMlc0QTk3?=
 =?utf-8?B?UlFLNGRsOGNZemdjcGl4cnk2ei9BVjRpeUZZcGJnbmMyL3MxeTFpcjRaK3VL?=
 =?utf-8?B?S0M1RlAvYUpZVFU2bHN1YjBPS3FZK0V1b1BIZU9TRXc3TkJKcThENVIyRWlZ?=
 =?utf-8?B?ZXdjL1BBbUV5Z1o1Y1VrRmdsVDJPcXVhdGEwTVFidzg5MlVKVTBPUUwyWTEv?=
 =?utf-8?B?NkdyQjZxSStqRTBxcloyYjBMM3hzSkVrSm1UdHFFYVF4SnI1TkRGSUxNazdF?=
 =?utf-8?B?TFo5VzR5RjZiZkg2MXU0WVZaOVNJZ2xKUk1PZUI4d1Z5L2l6eHBOZjAxWnJS?=
 =?utf-8?B?djFmY2kwSWsrb3FXUkM5YVpCdDlCd0RJRkwzelRIcnhWbERnbHJtZEtvY0U0?=
 =?utf-8?B?ZnhrZXlwUExPcC9CSUpOY2NYeTdhemx1bWV3alZBUTBDWHZVbFNrR1FBeWhl?=
 =?utf-8?B?M1RQM2E4RjVjSjBITWNHbmgzZkxQL0dSZk5qeU40R1k2bm4wTUIwVWkyK052?=
 =?utf-8?B?MHp1ajF1TWZKeVZneXoxZGhiWVVWTHA0VUphdWVvYnNkWGMvWThObjVOQ3c5?=
 =?utf-8?B?dDRQTXBMSWVLbXBxME95QmQxeDRFL0ovOHlIWExnajU1UTNXRm9KSlJRWUR3?=
 =?utf-8?B?ZW9RN0ttUEUyd3BVdS9uYzhVRDNPZHBtQXpZWkN3eUR5WjRQS2tScVVPbHBV?=
 =?utf-8?B?L0Q0MmUzWDd5L1RuVG4ybUFWR2dMalNqVzV1V2hENyt0RDJERlRHRFV2cUlX?=
 =?utf-8?Q?+6dRiDJss6OtVBGxw2kyFTI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d10055e3-adb5-42fb-690e-08db5d40f805
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 16:56:22.6432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+8SVLdAw/ycrGtsWEJJf3ns9EvnABERUIhB9//jlr+K6YOPEbW2JD3gKajJbajrbUkfxUsgOerMZ2b141nJGbSQoBFnwtfEenEoMoBd/0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7129
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2023 10:14 PM, Teres Alexis, Alan Previn wrote:
> On Fri, 2023-05-05 at 09:04 -0700, Ceraolo Spurio, Daniele wrote:
>
>
> alan: snip
>
>
>> +int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, size_t size)
>> +{
> alan:snip
>> +	/*
>> +	 * The GSC binary starts with the pointer layout, which contains the
>> +	 * locations of the various partitions of the binary. The one we're
>> +	 * interested in to get the version is the boot1 partition, where we can
>> +	 * find a BPDT header followed by entries, one of which points to the
>> +	 * RBE sub-section of the partition. From here, we can parse the CPD
> alan: nit: could we add the meaning of 'RBE', probably not here but in the header file where GSC_RBE is defined?

I have no idea what RBE means, the specs just says to look for the 
section named that way. I didn't dig because we don't really care about 
its name, just that the CPD header is in there.

>> +	 * header and the following entries to find the manifest location
>> +	 * (entry identified by the "RBEP.man" name), from which we can finally
>> +	 * extract the version.
>> +	 *
>> +	 * --------------------------------------------------
>> +	 * [  intel_gsc_layout_pointers                     ]
>> +	 * [      ...                                       ]
>> +	 * [      boot1_offset  >---------------------------]------o
>> +	 * [      ...                                       ]      |
>> +	 * --------------------------------------------------      |
>> +	 *                                                         |
>> +	 * --------------------------------------------------      |
>> +	 * [  intel_gsc_bpdt_header                         ]<-----o
>> +	 * --------------------------------------------------
> alan: special thanks for the diagram - love these! :)
> alan: snip
>
>> +	min_size = layout->boot1_offset + layout->boot1_offset > size;
> alan: latter is a binary so + 1? or is this a typo and supposed to be:
> 	min_size = layout->boot1_offset;

it's a cut & paste typo, it should be

min_size = layout->boot1_offset + layout->boot1_size;

thanks for spotting it.

> actually since we are accessing a bpdt_header hanging off that offset, it should rather be:
> 	min_size = layout->boot1_offset + sizeof(*bpdt_header);

I can add a check to make sure that boot1_size >= sizeof(*bpdt_header)

>> +	if (size < min_size) {
>> +		gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
>> +		       size, min_size);
>> +		return -ENODATA;
>> +	}
>> +
>> +	bpdt_header = data + layout->boot1_offset;
>> +	if (bpdt_header->signature != INTEL_GSC_BPDT_HEADER_SIGNATURE) {
>> +		gt_err(gt, "invalid signature for meu BPDT header: 0x%08x!\n",
>> +		       bpdt_header->signature);
>> +		return -EINVAL;
>> +	}
>> +
> alan: IIUC, to be strict about the size-crawl-checking, we should check minsize
> again - this time with the additional "bpdt_header->descriptor_count * sizeof(*bpdt_entry)".
> (hope i got that right?) - adding that check before parsing through the (bpdt_entry++)'s ->type

will do (same for the comments below)

>> +	bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
>> +	for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
>> +		if ((bpdt_entry->type & INTEL_GSC_BPDT_ENTRY_TYPE_MASK) !=
>> +		    INTEL_GSC_BPDT_ENTRY_TYPE_GSC_RBE)
>> +			continue;
>> +
>> +		cpd_header = (void *)bpdt_header + bpdt_entry->sub_partition_offset;
>> +		break;
>> +	}
>> +
>> +	if (!cpd_header) {
>> +		gt_err(gt, "couldn't find CPD header in GSC binary!\n");
>> +		return -ENODATA;
>> +	}
> alan: same as above, so for size-crawl-checking, we should check minsize again with the addition of cpd_header, no?
>> +
>> +	if (cpd_header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
>> +		gt_err(gt, "invalid marker for meu CPD header in GSC bin: 0x%08x!\n",
>> +		       cpd_header->header_marker);
>> +		return -EINVAL;
>> +	}
> alan: and again here, the size crawl checking with cpd_header->num_of_entries * *cpd_entry
>> +	cpd_entry = (void *)cpd_header + cpd_header->header_length;
>> +	for (i = 0; i < cpd_header->num_of_entries; i++, cpd_entry++) {
>> +		if (strcmp(cpd_entry->name, "RBEP.man") == 0) {
>> +			manifest = (void *)cpd_header + cpd_entry_offset(cpd_entry);
>> +			intel_uc_fw_version_from_meu_manifest(&gsc->release,
>> +							      manifest);
>> +			gsc->security_version = manifest->security_version;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
> alan:snip
>
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> index fff8928218df..8d7b9e4f1ffc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> alan:snip
>
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> index d55a66202576..8bce2b8aed84 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
> alan:snip
>
>
>
>> +struct intel_gsc_layout_pointers {
>> +	u8 rom_bypass_vector[16];
> alan:snip...
>> +	u32 temp_pages_offset;
>> +	u32 temp_pages_size;
>> +} __packed;
> alan: structure layout seems unnecessarily repetitive... why not ->
> struct partition_info {
> 	u32 offset;
> 	u32 size;
> };
> struct intel_gsc_layout_pointers {
> 	u8 rom_bypass_vector[16];
> 	...
> 	struct partition_info datap;
> 	struct partition_info bootregion[5];
> 	struct partition_info trace;
> }__packed;
>
>
>> +
> alan: we should put the 'bpdt' acronym meaning and if its an intel specific
> name, then a bit of additional comment explaining what it means.

BPD stands for Boot Partition Directory, not sure what the T is for 
(Type maybe?). I'll add a comment that these are the structures for the 
GSC boot partition, it should make things clear enough.

>> +struct intel_gsc_bpdt_header {
>> +	u32 signature;
>> +#define INTEL_GSC_BPDT_HEADER_SIGNATURE 0x000055AA
>> +
>> +	u16 descriptor_count; /* bum of entries after the header */
> alan:s/bum/num
>> +
>> +	u8 version;
>> +	u8 configuration;
>> +
>> +	u32 crc32;
>> +
>> +	u32 build_version;
>> +	struct intel_gsc_meu_version tool_version;
> alan: nit: "struct intel_gsc_meu_version meu_version" is better no?

no. struct intel_gsc_meu_version is the basic struct used for versions 
encoded in the meu headers and it is used for multiple entries in the 
various headers. This particular one is the tool_version, hence the name.

>> +} __packed;
>> +
>> +
>> +struct intel_gsc_bpdt_entry {
>> +	/*
>> +	 * Bits 0-15: BPDT entry type
>> +	 * Bits 16-17: reserved
>> +	 * Bit 18: code sub-partition
>> +	 * Bits 19-31: reserved
>> +	 */
> alan: nit: i think its neater to just put above comments next to the #defines on the lines following 'type' and
> create a genmask for code-sub-partition (if we use it, else skip it?) - the benefit being a little less clutter

I think the lines would get too long if I put the comments on the same 
lines as the defines.
We only use the lower 16 bits, hence why I only defined those, but I 
wanted to have the whole thing documented for completeness.

>
>> +	u32 type;
>> +#define INTEL_GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15,0)
>> +#define INTEL_GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
>> +
>> +	u32 sub_partition_offset; /* from the base of the BPDT header */
>> +	u32 sub_partition_size;
>> +} __packed;
>> +
> alan:snip
>
>
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> @@ -17,6 +17,9 @@ struct intel_gsc_uc {
>>   	struct intel_uc_fw fw;
>>
>>   	/* GSC-specific additions */
>> +	struct intel_uc_fw_ver release;
>> +	u32 security_version;
> alan: for consistency and less redundancy, can't we add "security_version"
> into 'struct intel_uc_fw_ver' (which is zero for firmware that doesn't
> have it). That way, intel_gsc_uc can re-use intel_uc_fw.file_selected
> just like huc?

I'm not sure what you mean by re-using intel_uc_fw.file_selected. Is 
that for the call from intel_uc_fw_version_from_meu_manifest? I'm 
purposely not doing that. Note that the GSC has 3 versions:

Release version (incremented with each build and encoded in the header)
Security version (also encoded in the header)
Compatibility version (queried via message to the GSC)

The one we care about for communicating with the GSC is the last one, so 
that's the one I stored in intel_uc_fw.file_selected (in the next 
patch). The other 2  versions are not strictly required to use the GSC 
and we only fetch them for debug purposes, so if something goes wrong we 
know exactly what we've loaded.

Daniele

>
> alan:snip
>
>
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 0a0bd5504057..0c01d48b1dd9 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> alan:snip
>
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 796f54a62eef..cd8fc194f7fa 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> alan:snip
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 8f2306627332..279244744d43 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> alan:snip

