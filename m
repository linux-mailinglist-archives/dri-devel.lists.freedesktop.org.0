Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31017630B35
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 04:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B815310E258;
	Sat, 19 Nov 2022 03:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA610E258;
 Sat, 19 Nov 2022 03:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668828780; x=1700364780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mqlpZITN7VPTMlVkIquD5/B0hTsKvdmHwQStxaZlROY=;
 b=UqMwXGc6JNo1am/xKZD0qxyyFzrDzYeI06AL+EcGjP9GIVZSbP9JHiaH
 oRMhTCr5zWqeHv/B+sHwo+cbc2aQM0dMY9EXsvH3NDXzkJIGryPHfBfsN
 qhio9+awIHl4tiAyp11ZZ1TEIIPo1n3wGNvK5VLZ3QvPuO40xq2a75mGf
 c3zD5D1uJNW1VJcZA71J0wIC5Lae/a9gAHbE2mgEjPYYOWZa16gGKGqT/
 n29DRvDLyxhey8hXZIokJ56K5OP382n00Q/+zvMOErxGVd9PD9yMl8cpC
 bR79A3GqNF9GwHTmM404jUESKKzi4cVesQVsi7NEZIXzO34Xuqk8wA//U Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="377550987"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="377550987"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 19:32:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="782869763"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="782869763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2022 19:32:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 19:32:58 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 19:32:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 19:32:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 19:32:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UewmpIOVPx3uS7E3c09VhCHHUIz4WcTTD0fycpoFvc4YUWonbPLkaoEjo/4ulT4dRUZT6s+HzZgR5djPiUi/Hr4YmJ4RaHm1bVS8De4B5TwVI9Si5iYxdYWy9v2Hl43KWnJCBi6oASyZqdXUP4sEwdL9rU6OZCXDrJXFpRYYtd7HrguIVpHNF+XJFt4q0tW6AZlk6LblV5lrXsZ6eVpCx2L3eU9ol4X7P3VEIGyQD02MsV8IT875pkSLgtUVTHmTwL+oumkW8HzjHflaw1Y+loW81zEP2DhReVo50pt+UmpM39OaQkCOsvRbgzUzENdkpiTeK7/d5v+Yotbx45V5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLlglG351eheot6cgCD2s8MCVcMhI2/XrehTAyy42j0=;
 b=lKe+Do1HjB0qVePcQC6R2CnCKoEiexnwXWyAs5YhHoNSMWv57uSlJOAP3Btk+xFdRTD9QGbvTm4Y149vdqhelu0c8HzkHlLNfBnvuP3m6voMtcmjjMEYdDNdHXDFIrFzLQFB2FMBky/VpOhhsaD2TpzQWMr7yCc44xRWiUzGe+yUdmU76irL3S4K9W7Cy2AOQ5r5P/hlibl1gf3N7l7SAtML/8J39gehkO8A3NZ0yMAlE5ARUVbv19fqtAHaNfTdfRJAmJNRLpSK43mVZE2Pn0119Z6wqhVhc0ddL+ThYr83FMF6GqP9EieocZHgOwWYp2bZTKmJiOMUt2J2iMkyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 03:32:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::cb08:7a2e:4297:26a]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::cb08:7a2e:4297:26a%7]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 03:32:56 +0000
Message-ID: <929fb32b-7dd9-c9bc-f735-a0d0aab51cec@intel.com>
Date: Sat, 19 Nov 2022 09:02:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20221118183354.1047829-1-badal.nilawar@intel.com>
 <be06273fc45d5cc758a57c2244a1ba43e26458d3.camel@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <be06273fc45d5cc758a57c2244a1ba43e26458d3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a91fe1-9d6a-4bd2-e364-08dac9debf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fa6QF2k/Ur5uE4JwrnqEaUFskNoF7kh+gFhuApAw80/Cfs1LxUO2FcCaA7kZypEDd4+PsXVXeXcRHsv/+Jj1k4mVfyJJGki3v5VqCk/3uqFrWufG14uC3j30xs2oTf+15RWvm80fk0fcsfYgUhNFNlI3ktH5tLK44DgUIQ4Do/LoTGChyKX8wDxIRkSFk7c2YHT+8izXomPLpAfxBCkP2pYnChOsfcH9UmSv/iRUhZxCIziFsfnAsKqLE0k7NQOpil/6MtuC7sbKQ9zhrwO0GzVfb5E+GF8jY0qSpNNgwffxBuhMafcL9FabgpgmhJ7Br7L3mDuC3Mxi2pHeHrl9z9uto9pqGMvwzx5ppfKV7ovuqJ89QZhlcWZHqX6sYHzT3BzKYwY2isEzrwf+t9bQ/NN55rhHiVJaz8zhmk2vOR/28K3JFhUT3f8Y0AjX9rEfkTopwInVLBG4xiZWqjnuiT8opsRKku2fIEskoSIwyMjom8sqkPE8Aa4mLySlB9FYLUF/riByxtAUnGuuc2gXy+3Lkx9RcU6LDYM9g+VUS7ecnHkaeW1xjmDsxFmPH0gbUtBgCPGhstdrXOE+jslIyrMqLKeE3cbR/8bpy8WQdyQPv8I/8fxDMERrtzqb/9f7JWOczRb8J4Crj8ZgsNM9en7fQqSBsPlLStJ1C3A1fJJjWQlQdCW5XjfqqSaojSOmZ2amNc7Sn+AYWyBfI6By3KB/KtTTxgU0UrWvrcJZlHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(6486002)(31686004)(110136005)(107886003)(6506007)(6666004)(478600001)(82960400001)(2616005)(186003)(450100002)(86362001)(53546011)(83380400001)(26005)(54906003)(31696002)(316002)(8936002)(6512007)(66556008)(38100700002)(66476007)(41300700001)(4326008)(2906002)(4001150100001)(66946007)(36756003)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUlNRzZ6dFVpMUxiM09CVTV1TVJMNU5XaTAvU1B6anpUWjgwTWU0ZkVieGh6?=
 =?utf-8?B?ak1ZL1pLSk9tdVZ6cW1hZm1uNGFDK2V4QUFGNzNLaGkvTUZ3NDJFQ21YcHVp?=
 =?utf-8?B?TFZqL2k4ZjlJL3loaHQyK2pRVExCTStXamdGU2tyVTl0M2E1bHBwVHBTS0R3?=
 =?utf-8?B?ODNPNFpKZnI3WXlGMWI5elRURmJKKzh6RjlsL3NvVExlNzFHR1JzR3kxbHFy?=
 =?utf-8?B?RHVJbFk3N2ZXRnNoTXoxL2twTndGOS9lZmNDNG16eXVSQTRrZ3hldERoSlky?=
 =?utf-8?B?TnNjbTZ2b2lScTBxWG9CZlRlZWlXV2pYWjBDcTJiRmw2QjYwMllVNE02SjhX?=
 =?utf-8?B?ZGpFTTVaNDZBUi9TRmNqYUdVQTMxUVpvR0MxK2orbFg0SmhPamp4ZkYyK3VS?=
 =?utf-8?B?aVloa1RiTjVGY0MvWVF4b05TMFBXSWVYck95NXB6UjNOdTA5S21aSFZaaE5E?=
 =?utf-8?B?WVpjVk9NREs5MWU2dFhnOEdkSHFMejQ0QVJELzdxVklvOENHWXdoUWVqenN2?=
 =?utf-8?B?VndLTXlSMHN4d09Ma0FrTldEZU8xeEM2SC9Id1lHVEpsOWlGbGFRaWFzWDhV?=
 =?utf-8?B?alEzY2M2L3lMOUZnUDV3YXI3NEI2SkNPcWQraXBxQnNoN1h2OUkwN3BLaisr?=
 =?utf-8?B?MUZjZ1IzOWF1aEJxaHJuempRaGJIcXE3a0pVdjkxcUp0ZzRNTVk1dVRwa2RP?=
 =?utf-8?B?eENRMUs2c2JBUDRjaXA2cVBnc1NSN1MrcVdyaGJqMDN6WEJwdXhXZTVlSjFD?=
 =?utf-8?B?MGhqRWZPd2tBekg4dnpKc2ZjU0NJaFNUTWRHQ3BDYldObUQvR2tLSFdsRU9E?=
 =?utf-8?B?QUFEUkM0WDVUQ2VENmRTSjVYQ3RzQjc1K3lyd28xZ0tPZ1dhWGRzeWExY3RJ?=
 =?utf-8?B?azM5M1NEdFRrTVNSSSt5eDVMZWE5cFdRbGZYdGoxbktPNk9PT2RBWVJBdGR1?=
 =?utf-8?B?a0JLTXFNS2J3KzUvOGRVME0vNFl5THN1TVN2cFhmY2ZrYlFJSnNFaFlUV3VT?=
 =?utf-8?B?OWx5aHRZT1NPaDh3S09mYi9CTmM2bTk4d1JaMzBYbHVJUmVXRnRtcGpzU3U2?=
 =?utf-8?B?NmtTZ2pGVXpldTcxSVFYOXdrK0lURTE4cGNrMmp6a05SYVZBUnk3VDlnU0ty?=
 =?utf-8?B?K2daMDV2WWdaMEE0dWtmNUlQbDFBMGJGYmV6YWo5WGFLN1RiZWVjOE9mQTJj?=
 =?utf-8?B?TlNPYXl4Zk96SVZick94ZEdXaDZXcnpHeWVFTzZtbnlKNlM1ZEptS3o2STRh?=
 =?utf-8?B?TDBmdFV6RVc0L0U5MXhxRThCMUxTSGE1bnRXQlUyK2hWS3B4dDY5cUNSZ0Rl?=
 =?utf-8?B?d1R6emlrbitwZXR3bCswNXEraGVsVE1TdkE5T3RnK1VHQTZ2RHQ2QzZ0NVlp?=
 =?utf-8?B?YU1Xa24rNDJxRDNId3JuUUxMUENsWHVFQmVQckpodDlHaUJHWjVsNkNDWm5C?=
 =?utf-8?B?N2FqWFRNUEs4bFljelo3bUFYQ0JQVGhTdWJjeEErMmhFWnh1VkZnVy9PbTYw?=
 =?utf-8?B?ZlhRVlNUVHlQY09jMzdvZ3dmQkp5cnJjWVNURUVYZGlHRGhhdk83ZkVna0dH?=
 =?utf-8?B?dXl2dXNTenVOQWprcGhWMVBUeEMzZFFXOXo5SmIycWlrbHlBUGNvV0NIRFRh?=
 =?utf-8?B?Z2E4Q1MrUkY3K2c2Uk9sVnFsMFRUQUdZOW1zeWltUUE1RlN1K1lWdUdMNTZX?=
 =?utf-8?B?L21ub0k1dmVsazhXSnRDZDh2cUpvdHd1L2pQeTRQZGlFQTlSVWFJYTVYbVRN?=
 =?utf-8?B?cXh5L2xpNTllK3FCemhEMHAxYWsweVl6UW50TVpNaUVOTnE2clVkR3F5cE1u?=
 =?utf-8?B?aUdlL3d2ZktxcFM5NE9ZUjRvdjFxZlRSbzZ0UlhBK01UcW1LNzYzYVRTUkg0?=
 =?utf-8?B?V2VSdkVCN2JnVGdtSHlUaXYxTFNLOURaczB2dVJJNXJCNEpIclQwbktyT2Rs?=
 =?utf-8?B?QWZuZnhDOXRDemhWa05yOWxqMFd6K1I1VDNMWWFZV25meEdUaExIZDVxWUsy?=
 =?utf-8?B?WmFpSTYwVDlsNDZLQVUxYjZYOFVpNHJBWkliOUZQUHo3Y0d0ZGR1VHc4eHJi?=
 =?utf-8?B?OHAzUTFrc3R6RE9YYnBNZmZ2UUppNzhTVzQ2MEEvbmRjQWcyRTViVUJoZ0p5?=
 =?utf-8?B?K2M1ejU4RjUveEdrVWRYNWxMK0dYM0tpaVNwTEo3S1FYSHo3MHFNbTJhV25G?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a91fe1-9d6a-4bd2-e364-08dac9debf62
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 03:32:56.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf2WC78ry+0tvImPco+7gw1WEtcP/JWt5xwPOmovkmeTzPED+IdSfC3o+kWMbJH3Z6D0eL+oLdxwjaQeZFdFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19-11-2022 00:07, Vivi, Rodrigo wrote:
> On Sat, 2022-11-19 at 00:03 +0530, Badal Nilawar wrote:
>> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> By defaut idle messaging is disabled for GSC CS so to unblock RC6
>> entry on media tile idle messaging need to be enabled.
>>
>> v2:
>>   - Fix review comments (Vinay)
>>   - Set GSC idle hysteresis as per spec (Badal)
>> v3:
>>   - Fix review comments (Rodrigo)
>>
>> Bspec: 71496
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> He is the author of the patch, no?!
> or you can remove this or change the author to be you and keep his
> reviewed-by...
> 
> or I can just remove his rv-b while merging.. just let me know..
As he is original author I will prefer not to change it. You can remove 
his rv-b while merging.

Regards,
Badal
> 
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index b0a4a2dbe3ee..e971b153fda9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -15,6 +15,22 @@
>>   #include "intel_rc6.h"
>>   #include "intel_ring.h"
>>   #include "shmem_utils.h"
>> +#include "intel_gt_regs.h"
>> +
>> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs
>> *engine)
>> +{
>> +       struct drm_i915_private *i915 = engine->i915;
>> +
>> +       if (IS_METEORLAKE(i915) && engine->id == GSC0) {
>> +               intel_uncore_write(engine->gt->uncore,
>> +                                  RC_PSMI_CTRL_GSCCS,
>> +
>> _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
>> +               /* hysteresis 0xA=5us as recommended in spec*/
>> +               intel_uncore_write(engine->gt->uncore,
>> +                                  PWRCTX_MAXCNT_GSCCS,
>> +                                  0xA);
>> +       }
>> +}
>>   
>>   static void dbg_poison_ce(struct intel_context *ce)
>>   {
>> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs
>> *engine)
>>   
>>          intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>>          intel_engine_init_heartbeat(engine);
>> +
>> +       intel_gsc_idle_msg_enable(engine);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index c3cd92691795..80a979e6f6be 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -917,6 +917,10 @@
>>   #define  MSG_IDLE_FW_MASK      REG_GENMASK(13, 9)
>>   #define  MSG_IDLE_FW_SHIFT     9
>>   
>> +#define        RC_PSMI_CTRL_GSCCS      _MMIO(0x11a050)
>> +#define          IDLE_MSG_DISABLE      REG_BIT(0)
>> +#define        PWRCTX_MAXCNT_GSCCS     _MMIO(0x11a054)
>> +
>>   #define FORCEWAKE_MEDIA_GEN9                   _MMIO(0xa270)
>>   #define FORCEWAKE_RENDER_GEN9                  _MMIO(0xa278)
>>   
> 
