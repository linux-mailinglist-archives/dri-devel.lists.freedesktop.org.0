Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5752717244
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77C10E446;
	Wed, 31 May 2023 00:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B810E446;
 Wed, 31 May 2023 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685491624; x=1717027624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8moTF8w6MKilXjGgUFrph0uOBLLK7UyqDeQmc/WUj8E=;
 b=nwRyHFg/sj9TID5Gggn+zbPzTJyDxdAM/4FBcHLnYsEiJSA2xkHxOj13
 je5VbWl9St88NWghZjXyrWx26kCBDctTWrU45fKOqrxA07KpvKSyvsRNk
 RpkrYoNAs/VWQZGOervP7g0mr6DYbmjOjKFBcWYbJTUtu56JEvqCALep2
 T5Bef9WQOXPwyPPwN6Vke47GBKw9psFhIF7bgSeCpHKMvjbaupVyZlEm1
 owEVuJMXSrCnsFkZ3JI+ZmGpkGKozmNkmf0CKL1Bb1M6qmivqG7dFS0y0
 khP7iBc7CJznksE2vLQom/ijvC9WRHi/bIdYCVTqzeoWQt2wWjS5HekUI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418570216"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="418570216"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="700853758"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="700853758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 30 May 2023 17:07:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:07:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:07:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:07:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBP6BXpak2giG0R9xs8gSUbA3UzF9wGvQ8OyiwSfC3ZdV09JKG5x8p4ancaSYGcRIxitNGbClvTqxW3bmGtfid+EI3kLqKdVsSpn4HZHOexiru2vDfZ8DEhveDwHxNYN8wxPWHt9ASXXnpR3tF5MqB7v/1IAmh3UV79n36y4joFRFoy8wOAhbsgMTkrpdxDQmB7Z49D5CNCZ4SVqysVBVNwdoheGBYge7aqgcIRz78Z/R/cbeQMwM/sh+FKD4eTDiULXBIFo4irt/tFyusdZHqqrVhMfRqN0RCLXint5SQuPKBm5neWE12tmHDUxC0bGS4WJYATRRegM/nJmGBvwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA2WbyKiHXKqU5jhlbFor4x2gBgt2fqk1TGUH7kw9Ew=;
 b=j8Qz4hHccyY5pHVN8EVddqfXxMIsEPinFxZgDsbfgVqUXPuC2vK+QzyOotjxLXcNaHsXkYt++jO9jJc5vlWshUh7YIABRE7SKmuQftsRTAGk2nwFR/CimWWdg78R6zEVLoauSSPqonMEPjN0mkQ/xZM2K52KwaidTx3MWutZK1x5XVcLkcJCq2uJzgf903ZGnvgHc+PK1JBQpVw650DCbX5kwYh8oh9kV9tud37GkHJr9+m0n31IhgDwnjU4E27kWiZ/a/+m0bLzHnr7q/GQigywDN+NXKoFQb/EctvFTfMkPBtAkAcdPiBrqkVbdl7ToMWzegN9UO+w7ExIJeRLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Wed, 31 May 2023 00:06:20 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:06:20 +0000
Message-ID: <ed576336-7b56-efa2-5355-f49001995182@intel.com>
Date: Tue, 30 May 2023 17:06:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/7] drm/i915/huc: Parse the GSC-enabled HuC binary
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
 <20230527005242.1346093-3-daniele.ceraolospurio@intel.com>
 <f4cd5240-ba88-8b7b-167c-81d90be88c52@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <f4cd5240-ba88-8b7b-167c-81d90be88c52@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb9aa93-d443-4173-b2b0-08db616adcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uG/iTTY/1x6pG52zAjIcHYx5NMbUbCNJi9srpZjp/pjSaZlyf/4MSLMp0j4Cm1Q8a4iHwsYsP59HcXOeoheyUfjkPv7z1B+1ASqYq+oDHwnLatR1SrILUzlOpjGwb6mUgx6758Avr1v8nYldLZBAgtura6cXxwKR1j5aeyse9wAzKVjK0GgVMnjxjoozxEvtvRKp5DrxuE89zVOa1xAPB6JFw+sqx3asoERKxcllgJ+LUF31v71xWf/INt1xC9UCWmCkpSL81hkWqpKZySos/Xk0OyW+vEzL+o6ldGf7BcqkMwZvLZX7m8EQfwh8ZeNvb7F5xaeCR8pFyX/A8Jc602LFBXIPdTTlWJOFBeKVPT7dIBCAPNkKHbIxoQR3nPu00yPsujFbKD6iEXj44lSARTxoSX4Zom7PUD3nXrZrF7lN/Wuz/Ft6h8SVU+DUDNWbuQLNCBPcBorVCfSm+gyYPzeGCVeGkYKW0nupNe1OZjUdLftVg936HpJ8LL/ZX3N4iV0TpNCIBWoDxFYBz0ZlcgXN+pb5LMgfVgebH1eheDg+R+2JWC1lbl6poKB6eHv+Eglq95Wrq7ih61jd4AGiEUiA2M7q0IW1A2CjPphd1NTwnh5g2wjrOYJGZLpsV2I7II09B+GsRwJ7IveQfpNrjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(478600001)(8936002)(8676002)(5660300002)(36756003)(30864003)(2906002)(31696002)(86362001)(450100002)(66556008)(66946007)(4326008)(66476007)(82960400001)(316002)(38100700002)(41300700001)(26005)(107886003)(83380400001)(31686004)(6512007)(186003)(6506007)(53546011)(2616005)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTMrWVNtSEFYT1RHdzl3R2xjekVCWTl1OW9jejhtNmc1cDY0eXhoVkxtLzFx?=
 =?utf-8?B?bGRnRXMzbFpMNU9Rb25CNmp4bjBqNEx2c0ZuKzRZVFIwWXlUMTdzVHB1ajFT?=
 =?utf-8?B?aTlrYkdtMXlvVlZ1U1padGJ2T1AzbmJJN00zTG1ubTQ5S1BGQW5TSHlrOGcw?=
 =?utf-8?B?VmhHQ2lSam9LSGZtYUtKdGxqTm9kbnNGbitEYVIzQVh0YWJkUXl5ZnpmWXd5?=
 =?utf-8?B?ck5ndzl1ZlpFbUhQaSt0NmFrUUxCRzlQWVdxVHRjSis5ZWYzcWc3NXo1MEo1?=
 =?utf-8?B?RnZmeXEzaSsvbU5na3E4ai8vR3p1VTFzRnQyQUNaakJhanJkdTJRYTlwem93?=
 =?utf-8?B?dEkzQktTU0tDSUs3Zi9JZ0lXT0dJcytocWtPbnZGYzJyalloUmNUa1RRNjRi?=
 =?utf-8?B?ZUFPNzNhL2h4QXRpMEluOHkxdXBVeEVRcVlKYTdEK0JhMXROZm5uN0M5YnZr?=
 =?utf-8?B?MUc3RW9FeGNzOHRIV3dFYlFuUTlCbnFkblprb1hJRkRWeUNPdnJrY3YxVXd0?=
 =?utf-8?B?YmlTT1B0UExHR3dSYWJITy9ucnNJUU1lOGRqRnF5dGZXQjNlTFlIMU80d2Vx?=
 =?utf-8?B?SkhhTE1xODFPM1VveVdldmViMnplSmVxUWQrSGwxUS9MMk1hQzFGRzQwSlF2?=
 =?utf-8?B?T2NvYklnUHM4YWh0elRkOGNLcFBZanZvU29JTTl4Z1g2UVJZeXFoSWlHZDRv?=
 =?utf-8?B?SU00UGVlYnY5RzJLUHdvM1BqbWRUN29CUkFVS0ZjakxHMDJ3Slk1T2hWeFFB?=
 =?utf-8?B?NVp0M2dJVUd4MzF4S21lRnNHY1NrQisyK29ROWFodkUwS1VFcmI0QkJXNjBh?=
 =?utf-8?B?VDhOU0RFalpIbXptUmhwV2ErNHRiakVoVGIwY1dBcmoza0o4SllLam53Mzlu?=
 =?utf-8?B?WkR5T2E2ZmJNczhDNnNnbDIvbjZiTHo1T0F1N0J6UkdKL1lnbnhRVEhSblFD?=
 =?utf-8?B?Z2hybkRyZFZ1clZWWmdVeEwremdaR3huQ1JGL252S3lkZFNpc2NVN1Q5Nk5y?=
 =?utf-8?B?a0YxdFFaVHBNT0ZBUHZwakZEWElzZDM1OVVhUEdkcU55NHluT212TzdoTDJH?=
 =?utf-8?B?b2VCKzZGTHBIblYwVElMZzZvNzByUE1pSmtHcFcrVVM1RDJwOXdEWVBzMXNN?=
 =?utf-8?B?c1lyZWNHdHRZVjlaT1Qxa1haWVNoOGlDdzVXWUFUaFVVNFdkeHBMRi9sek1o?=
 =?utf-8?B?SFFkSjVKTUFKZHduRVpVRTR6VHZ6N3JmU1MxYlBWYzVWZWJBM0F2V3BRUmNM?=
 =?utf-8?B?YzVyRU5mQVR0UnFVNlY0c3RMVVVGWmNSWlg2UndNdW1hZlp1MFZxcW92dmhZ?=
 =?utf-8?B?Y1cwRGNLeFdNZUpsWnh3d0c0b1J0UmcxMnplejhmaDc5V253NVZ2SHZkdWFF?=
 =?utf-8?B?UTVCUXMyeHNvaVVkNGw0YTdONkk0Tmd2LytPNXFadkxMaHBzK3Fldmt5b2Nn?=
 =?utf-8?B?VDhqZ243SDRBOWwwR1owMWdZaVVyQkVRTU10OTEvYnQ2bnQxUVQ3em1MNFha?=
 =?utf-8?B?RXBhdW10eFFnakxOaWd1aCtsK0RlSHprTkZWZVUvS0RFalVLY0paeDlLeVhT?=
 =?utf-8?B?bjg0Q28wQWxlRzRNNWNZSW01V2Iyb1RNOGRkN2lrbktSR1FrcXU3MFdBUERB?=
 =?utf-8?B?VFBBQ1dUQ0RRU29DaVkrd2JZRTV0WlNWNkUzd0k1ZUhFSzFMaGJSdmwwbTRI?=
 =?utf-8?B?N0tuRDV2MHovWTIrQ2hKcG9PMU56Szl2Nk5PZjBtZVRwbkFOK3haeVJrRnZj?=
 =?utf-8?B?R3hJUmdyVmJ4TVNock1VeWREOFBlcnpDaVNIL1RZYlJQQjBTTE9CR2dycjN4?=
 =?utf-8?B?TjRQNG4weDhITm5wU3pROTFabzk3cGdYdGtvdkt5aHNRbUlOVmZzdytPVWNk?=
 =?utf-8?B?OXd1QTFBL25OcldVOVFmc2t5VGJZWnYrWUhibnMwMU1ZWVJvYjlpZTQ0dGhi?=
 =?utf-8?B?SDAwZWdYV3I0K05TV2lYblRRSGtjQjhtQ3JHL05ZbGF6YkN5V3NjWGFXeVRw?=
 =?utf-8?B?bGtBcjl6TEJlL1AxNWJDc3l2bHZUcWlBMEpQZ1ZYOW5VNDR6U0tXbEtNVy9M?=
 =?utf-8?B?bUNEb2lvbEtaeUFhR2o4aHNpeUJOTXBCNzJZNDUzU1VLS2lqbU1UdFdldElJ?=
 =?utf-8?B?MVV3NWFQblVTQWpyRE1va2VUM1JqZmN6SS9aZXF4aC9wQ2g0SDRpSDZYRWhQ?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb9aa93-d443-4173-b2b0-08db616adcb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:06:20.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpRQzNNZBW4yKgJNva2Qb3N1D1Ec2u88VE1iOnke2h3gnRLz/aWL1DAKyqxKLFI2Pf9VYMZL80cKhMo1V/hfaritQTfPB9MshIfJe2UkbkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 4:30 PM, John Harrison wrote:
> On 5/26/2023 17:52, Daniele Ceraolo Spurio wrote:
>> The new binaries that support the 2-step authentication contain the
>> legacy-style binary, which we can use for loading the HuC via DMA. To
>> find out where this is located in the image, we need to parse the
>> manifest of the GSC-enabled HuC binary. The manifest consist of a
>> partition header followed by entries, one of which contains the offset
>> we're looking for.
>> Note that the DG2 GSC binary contains entries with the same names, but
>> it doesn't contain a full legacy binary, so we need to skip assigning
>> the dma offset in that case (which we can do by checking the ccs).
>> Also, since we're now parsing the entries, we can extract the HuC
>> version that way instead of using hardcoded offsets.
>>
>> Note that the GSC binary uses the same structures in its binary header,
>> so they've been added in their own header file.
>>
>> v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
>>      message, check ccs validity, drop old version location defines.
>>
>> v3: drop references to the MEU tool to reduce confusion, fix log (John)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
>> ---
>>   .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>>   8 files changed, 272 insertions(+), 53 deletions(-)
>>   create mode 100644 
>> drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>> new file mode 100644
>> index 000000000000..714f0c256118
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GSC_BINARY_HEADERS_H_
>> +#define _INTEL_GSC_BINARY_HEADERS_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/* Code partition directory (CPD) structures */
>> +struct intel_gsc_cpd_header_v2 {
>> +    u32 header_marker;
>> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
>> +
>> +    u32 num_of_entries;
>> +    u8 header_version;
>> +    u8 entry_version;
>> +    u8 header_length; /* in bytes */
>> +    u8 flags;
>> +    u32 partition_name;
>> +    u32 crc32;
>> +} __packed;
>> +
>> +struct intel_gsc_cpd_entry {
>> +    u8 name[12];
>> +
>> +    /*
>> +     * Bits 0-24: offset from the beginning of the code partition
>> +     * Bit 25: huffman compressed
>> +     * Bits 26-31: reserved
>> +     */
>> +    u32 offset;
>> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>> +
>> +    /*
>> +     * Module/Item length, in bytes. For Huffman-compressed modules, 
>> this
>> +     * refers to the uncompressed size. For software-compressed 
>> modules,
>> +     * this refers to the compressed size.
>> +     */
>> +    u32 length;
>> +
>> +    u8 reserved[4];
>> +} __packed;
>> +
>> +struct intel_gsc_version {
>> +    u16 major;
>> +    u16 minor;
>> +    u16 hotfix;
>> +    u16 build;
>> +} __packed;
>> +
>> +struct intel_gsc_manifest_header {
>> +    u32 header_type; /* 0x4 for manifest type */
>> +    u32 header_length; /* in dwords */
>> +    u32 header_version;
>> +    u32 flags;
>> +    u32 vendor;
>> +    u32 date;
>> +    u32 size; /* In dwords, size of entire manifest (header + 
>> extensions) */
>> +    u32 header_id;
>> +    u32 internal_data;
>> +    struct intel_gsc_version fw_version;
>> +    u32 security_version;
>> +    struct intel_gsc_version meu_kit_version;
>> +    u32 meu_manifest_version;
>> +    u8 general_data[4];
>> +    u8 reserved3[56];
>> +    u32 modulus_size; /* in dwords */
>> +    u32 exponent_size; /* in dwords */
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 268e036f8f28..6d795438b3e4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -6,23 +6,14 @@
>>   #include <linux/types.h>
>>     #include "gt/intel_gt.h"
>> -#include "gt/intel_gt_print.h"
>>   #include "intel_guc_reg.h"
>>   #include "intel_huc.h"
>> +#include "intel_huc_print.h"
>>   #include "i915_drv.h"
>>     #include <linux/device/bus.h>
>>   #include <linux/mei_aux.h>
>>   -#define huc_printk(_huc, _level, _fmt, ...) \
>> -    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>> -#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>> _fmt, ##__VA_ARGS__)
>> -#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>> probe_error, _fmt, ##__VA_ARGS__)
>> -
>>   /**
>>    * DOC: HuC
>>    *
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 534b0aa43316..037d2ad4879d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -5,11 +5,146 @@
>>     #include "gt/intel_gsc.h"
>>   #include "gt/intel_gt.h"
>> +#include "intel_gsc_binary_headers.h"
>>   #include "intel_huc.h"
>>   #include "intel_huc_fw.h"
>> +#include "intel_huc_print.h"
>>   #include "i915_drv.h"
>>   #include "pxp/intel_pxp_huc.h"
>>   +static void get_version_from_gsc_manifest(struct intel_uc_fw_ver 
>> *ver, const void *data)
>> +{
>> +    const struct intel_gsc_manifest_header *manifest = data;
>> +
>> +    ver->major = manifest->fw_version.major;
>> +    ver->minor = manifest->fw_version.minor;
>> +    ver->patch = manifest->fw_version.hotfix;
>> +}
>> +
>> +static bool css_valid(const void *data, size_t size)
>> +{
>> +    const struct uc_css_header *css = data;
>> +
>> +    if (unlikely(size < sizeof(struct uc_css_header)))
>> +        return false;
>> +
>> +    if (css->module_type != 0x6)
>> +        return false;
>> +
>> +    if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
>> +{
>> +    return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
>> +}
>> +
>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>> void *data, size_t size)
>> +{
>> +    struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
>> +    const struct intel_gsc_cpd_header_v2 *header = data;
>> +    const struct intel_gsc_cpd_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    int i;
>> +
>> +    if (!huc_fw->loaded_via_gsc) {
>> +        huc_err(huc, "Invalid FW type GSC header parsing!\n");
> I'm still not understanding what this error means. Is it meant to say 
> 'Invalid FW type *for* GSC header parsing'?

yes, sorry that was the idea. I'll add the "for"

>
> 'fw->loaded_via_gsc' is set from the blob table, yes? And 
> intel_huc_fw_get_binary_info() is only called from 
> check_gsc_manifest() which is called from check_fw_header() iff 
> fw->loaded_via_gsc is set. So it should be impossible for this test to 
> ever fail, yes?

Yes, this should never fail, but with GSC FW the code changes again so I 
wanted to make sure I had a check in there in case I got things wrong. 
There would be other failures anyway (because the parsing wouldn't work, 
so I can drop this check if you think it is redundant.

Daniele

>
> John.
>
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (size < sizeof(*header)) {
>> +        huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    /*
>> +     * The GSC-enabled HuC binary starts with a directory header, 
>> followed
>> +     * by a series of entries. Each entry is identified by a name and
>> +     * points to a specific section of the binary containing the 
>> relevant
>> +     * data. The entries we're interested in are:
>> +     * - "HUCP.man": points to the GSC manifest header for the HuC, 
>> which
>> +     *               contains the version info.
>> +     * - "huc_fw": points to the legacy-style binary that can be 
>> used for
>> +     *             load via the DMA. This entry only contains a 
>> valid CSS
>> +     *             on binaries for platforms that support 2-step HuC 
>> load
>> +     *             via dma and auth via GSC (like MTL).
>> +     *
>> +     * --------------------------------------------------
>> +     * [  intel_gsc_cpd_header_v2                       ]
>> +     * --------------------------------------------------
>> +     * [  intel_gsc_cpd_entry[]                         ]
>> +     * [      entry1                                    ]
>> +     * [      ...                                       ]
>> +     * [      entryX                                    ]
>> +     * [          "HUCP.man"                            ]
>> +     * [           ...                                  ]
>> +     * [           offset >----------------------------]------o
>> +     * [      ...                                       ] |
>> +     * [      entryY                                    ] |
>> +     * [          "huc_fw"                              ] |
>> +     * [           ...                                  ] |
>> +     * [           offset >----------------------------]----------o
>> +     * -------------------------------------------------- |   |
>> +     * |   |
>> +     * -------------------------------------------------- |   |
>> +     * [ intel_gsc_manifest_header ]<-----o   |
>> +     * [  ... ]          |
>> +     * [  intel_gsc_version fw_version ]          |
>> +     * [  ... ]          |
>> +     * --------------------------------------------------          |
>> + *                                                             |
>> +     * --------------------------------------------------          |
>> +     * [ data[] ]<---------o
>> +     * [  ...                                           ]
>> +     * [  ...                                           ]
>> +     * --------------------------------------------------
>> +     */
>> +
>> +    if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
>> +        huc_err(huc, "invalid marker for CPD header: 0x%08x!\n",
>> +            header->header_marker);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* we only have binaries with header v2 and entry v1 for now */
>> +    if (header->header_version != 2 || header->entry_version != 1) {
>> +        huc_err(huc, "invalid CPD header/entry version %u:%u!\n",
>> +            header->header_version, header->entry_version);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (header->header_length < sizeof(struct 
>> intel_gsc_cpd_header_v2)) {
>> +        huc_err(huc, "invalid CPD header length %u!\n",
>> +            header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(*entry) * 
>> header->num_of_entries;
>> +    if (size < min_size) {
>> +        huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    entry = data + header->header_length;
>> +
>> +    for (i = 0; i < header->num_of_entries; i++, entry++) {
>> +        if (strcmp(entry->name, "HUCP.man") == 0)
>> + get_version_from_gsc_manifest(&huc_fw->file_selected.ver,
>> +                              data + entry_offset(entry));
>> +
>> +        if (strcmp(entry->name, "huc_fw") == 0) {
>> +            u32 offset = entry_offset(entry);
>> +            if (offset < size && css_valid(data + offset, size - 
>> offset))
>> +                huc_fw->dma_start_offset = offset;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>>   {
>>       int ret;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> index db42e238b45f..0999ffe6f962 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> @@ -7,8 +7,11 @@
>>   #define _INTEL_HUC_FW_H_
>>     struct intel_huc;
>> +struct intel_uc_fw;
>> +
>> +#include <linux/types.h>
>>     int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>>   int intel_huc_fw_upload(struct intel_huc *huc);
>> -
>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>> void *data, size_t size);
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>> new file mode 100644
>> index 000000000000..915d310ee1df
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_HUC_PRINT__
>> +#define __INTEL_HUC_PRINT__
>> +
>> +#include "gt/intel_gt.h"
>> +#include "gt/intel_gt_print.h"
>> +
>> +#define huc_printk(_huc, _level, _fmt, ...) \
>> +    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>> +#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>> _fmt, ##__VA_ARGS__)
>> +#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>> probe_error, _fmt, ##__VA_ARGS__)
>> +
>> +#endif /* __INTEL_HUC_PRINT__ */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 31776c279f32..9ced8dbf1253 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -548,33 +548,6 @@ static void __force_fw_fetch_failures(struct 
>> intel_uc_fw *uc_fw, int e)
>>       }
>>   }
>>   -static int check_gsc_manifest(struct intel_gt *gt,
>> -                  const struct firmware *fw,
>> -                  struct intel_uc_fw *uc_fw)
>> -{
>> -    u32 *dw = (u32 *)fw->data;
>> -    u32 version_hi, version_lo;
>> -    size_t min_size;
>> -
>> -    /* Check the size of the blob before examining buffer contents */
>> -    min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
>> -    if (unlikely(fw->size < min_size)) {
>> -        gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>> -            intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, min_size);
>> -        return -ENODATA;
>> -    }
>> -
>> -    version_hi = dw[HUC_GSC_VERSION_HI_DW];
>> -    version_lo = dw[HUC_GSC_VERSION_LO_DW];
>> -
>> -    uc_fw->file_selected.ver.major = 
>> FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
>> -    uc_fw->file_selected.ver.minor = 
>> FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
>> -    uc_fw->file_selected.ver.patch = 
>> FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>> -
>> -    return 0;
>> -}
>> -
>>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
>> css_value)
>>   {
>>       /* Get version numbers from the CSS header */
>> @@ -631,22 +604,22 @@ static void guc_read_css_info(struct 
>> intel_uc_fw *uc_fw, struct uc_css_header *c
>>       uc_fw->private_data_size = css->private_data_size;
>>   }
>>   -static int check_ccs_header(struct intel_gt *gt,
>> -                const struct firmware *fw,
>> -                struct intel_uc_fw *uc_fw)
>> +static int __check_ccs_header(struct intel_gt *gt,
>> +                  const void *fw_data, size_t fw_size,
>> +                  struct intel_uc_fw *uc_fw)
>>   {
>>       struct uc_css_header *css;
>>       size_t size;
>>         /* Check the size of the blob before examining buffer 
>> contents */
>> -    if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>> +    if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, sizeof(struct uc_css_header));
>> +            fw_size, sizeof(struct uc_css_header));
>>           return -ENODATA;
>>       }
>>   -    css = (struct uc_css_header *)fw->data;
>> +    css = (struct uc_css_header *)fw_data;
>>         /* Check integrity of size values inside CSS header */
>>       size = (css->header_size_dw - css->key_size_dw - 
>> css->modulus_size_dw -
>> @@ -654,7 +627,7 @@ static int check_ccs_header(struct intel_gt *gt,
>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>           gt_warn(gt, "%s firmware %s: unexpected header size: %zu != 
>> %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, sizeof(struct uc_css_header));
>> +            fw_size, sizeof(struct uc_css_header));
>>           return -EPROTO;
>>       }
>>   @@ -666,10 +639,10 @@ static int check_ccs_header(struct intel_gt *gt,
>>         /* At least, it should have header, uCode and RSA. Size of 
>> all three. */
>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>> uc_fw->rsa_size;
>> -    if (unlikely(fw->size < size)) {
>> +    if (unlikely(fw_size < size)) {
>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, size);
>> +            fw_size, size);
>>           return -ENOEXEC;
>>       }
>>   @@ -690,6 +663,32 @@ static int check_ccs_header(struct intel_gt *gt,
>>       return 0;
>>   }
>>   +static int check_gsc_manifest(struct intel_gt *gt,
>> +                  const struct firmware *fw,
>> +                  struct intel_uc_fw *uc_fw)
>> +{
>> +    if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
>> +        gt_err(gt, "trying to GSC-parse a non-HuC binary");
>> +        return -EINVAL;
>> +    }
>> +
>> +    intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
>> +
>> +    if (uc_fw->dma_start_offset) {
>> +        u32 delta = uc_fw->dma_start_offset;
>> +        __check_ccs_header(gt, fw->data + delta, fw->size - delta, 
>> uc_fw);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int check_ccs_header(struct intel_gt *gt,
>> +                const struct firmware *fw,
>> +                struct intel_uc_fw *uc_fw)
>> +{
>> +    return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
>> +}
>> +
>>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>>   {
>>       return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 
>> 0xFF;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 2be9470eb712..b3daba9526eb 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -118,6 +118,8 @@ struct intel_uc_fw {
>>       u32 ucode_size;
>>       u32 private_data_size;
>>   +    u32 dma_start_offset;
>> +
>>       bool loaded_via_gsc;
>>   };
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> index 646fa8aa6cf1..7fe405126249 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> @@ -84,10 +84,4 @@ struct uc_css_header {
>>   } __packed;
>>   static_assert(sizeof(struct uc_css_header) == 128);
>>   -#define HUC_GSC_VERSION_HI_DW        44
>> -#define   HUC_GSC_MAJOR_VER_HI_MASK    (0xFF << 0)
>> -#define   HUC_GSC_MINOR_VER_HI_MASK    (0xFF << 16)
>> -#define HUC_GSC_VERSION_LO_DW        45
>> -#define   HUC_GSC_PATCH_VER_LO_MASK    (0xFF << 0)
>> -
>>   #endif /* _INTEL_UC_FW_ABI_H */
>

