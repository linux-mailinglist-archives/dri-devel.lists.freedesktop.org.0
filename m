Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64C717251
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5B910E450;
	Wed, 31 May 2023 00:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366010E450;
 Wed, 31 May 2023 00:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685492068; x=1717028068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I4BzgHH7zIkteONMHraK9gCJrtr4MoAndp/XsZSUKoo=;
 b=IK/RkQ+MojkumAOizjrnD2AdBoCGi+ypTGzcmcOZfutxYV61yGA3/2wH
 is0gSHtKs3McmwEvvS/iVWuA10YDx/Ige1A1CmT2cPycwsVtUbIXGG6ma
 HjafNPjaV+qPb1/GxVoOuLzIht7QpQW+twAXr0l+IlXS+ZrvhSWBxFL92
 jwRReBkPr5Qh7NHqyvCHKHU6+ohsJIX0cmGufE8kYer9JLdOAtzmbdIFN
 OBkyKV8W1eIpx7BRPuB6VUb44sZcAliOPpbCdjY3FH7HvjntupYKW4k4J
 fyp3iPeyo4If0+PhJtWlk4wr/g1Gi/stkPtle/BV9jfcPvTz31Cx8axnB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357470650"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357470650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739708190"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="739708190"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2023 17:14:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:14:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:14:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apgPY15KDYfS/dbWCc+++36Lc0cGXYAi5+g9MXr1AmYt+ymzPcMUpkLIY8xvEGsm00/5mgKSZ3O2OCc+ZOCX04U+766VjtB4D4GymGG/3mzqQVhqRsh49zjOd6rgJVN1ci3MOf89g9/akPuktxYrjg9JwgwOQRd+8WXhjWJ84GUhOQcBNeSO5lrUS3T206yIXCWtu6+mY/od2I8ZaGJkIIdI9qD8G8/I4hoLOBzoXtW8QJKEgVFjbmoqlFtc2BxSiZoPkY45bRTJ4Uyg7AN24wPeFD7dh/wJ+gf+MZTty1GJRsHl+Ole7hO6mqqLu1kz0qBC4iMlsCOm+9C3YgbirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V4oFxlvLPOzy8RaAbf84JIsubhmsff2WNtcLREGRv4=;
 b=cPQizGhqRLDTVQMx4PBl0bkg81LmcOMnVzl1yYExik3RhPMay5gkzMDYnjOaw3M/1TCL7T7flNmfG0UxSwgapw9arr+Wz3vg3v0E/8ZOIcZnhJGLXGwbegNE0LF/1aBd0qqXRIIrFIJnXe9fvuTztMv2yA/frWCNmxM/WPYqWKySGr6fOlqMKPRayo74XQ9ENrOET9sxl9kA8sIFcAorYvgjIaFjSl8pDYfFwEPCkNQWinemlZ8XYWFJR1PcdKtm09TO/gEAQrgy/ssiqzUQ6YGqhk46jpYMWrG6u+vWE1GXI1wwuXcRpAgZ6IgMQfFASk2gFr6QMoe5KDZ7Wd/o2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Wed, 31 May 2023 00:14:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::8e92:306d:7cc4:2953%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:14:18 +0000
Message-ID: <83ba1ff3-604f-00cb-d8f3-9e544d58fdde@intel.com>
Date: Tue, 30 May 2023 17:14:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] drm/i915/huc: differentiate the 2 steps of the MTL HuC
 auth flow
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
 <20230530152958.1384061-1-daniele.ceraolospurio@intel.com>
 <7e6f34eb-cb4a-6de0-3e8f-83172b4a035c@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <7e6f34eb-cb4a-6de0-3e8f-83172b4a035c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5168cfa6-7231-4342-6eed-08db616bf9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WTTLkSKM3M2wSpmLk14KeLvib/JjMQNnR5A2UQZsqNUgxQ7fboAiWrSZ9EqPBgWI/TvpaMQr2cTmpAvubw67EwPbfPbv/qBC5yGUHZB+sMgogmtwWvbEtZOh9bwq3w7Rfcr+eFA5+uGFSW+dpcD5DAmv6d+XtobC5WU64qYPqK6VDJVWVtZdQB1PPDjIzXt2PtcKCxPd6lKqMbnb4SxEpQVYYkEpOSnM1py/efdaNY+476kz9kC9tYSfBG/vUsuRYyjCPXeMmgxfhANkMN9sBTrLe3Im9dA6eCt3QURNRBqr6hEx84/x8Fs/v71QE+6d18/r6p/Rz16XxD/4GT23fP2hxAEYkEhnLbYn0+6pECAib2RPjsbhvRYT4sB7AiTZxeuBB06SOm5e33sOSdVlVzvlcmabkAFdw6Zqy0VGBcjXjJTZKf4W41+O1xByuy+zRD1+psTwZaGGl9CvQDzZPZLhWUrLEOLl8unn1Ge3ilskLEKlDZyDGkQFe4oe411MKYUMH1m8pRcgPjckU0Mt56e2P6Fwne1RW+8Jc+RAbVswY54i7w2Jwc3b31ooBVJqZCaOZI77EZaDWjlrQRqkSY6fw/VDvutTshleQNFTb7vGwD61PREQ5LsgFxuoD9H9BowH5lSsnwDgpzH+7DmQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(478600001)(8936002)(8676002)(5660300002)(36756003)(30864003)(2906002)(31696002)(86362001)(450100002)(66556008)(66946007)(4326008)(66476007)(82960400001)(316002)(38100700002)(41300700001)(26005)(107886003)(83380400001)(31686004)(6512007)(186003)(6506007)(53546011)(2616005)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tSU3ZoSWlCOWNCMmtON0Q2eTNmZHplajl5a0R3eThsSGR6cE83c3FYRU5O?=
 =?utf-8?B?ODZTV3V4WUR2UE1aSHBTQzhwd3hsd1FIMVJmMUVKUWd5Z2Q0czVuZzJVVVoy?=
 =?utf-8?B?V0N1MmU1SU5oUWlpRk05TzdmT1V2anQ0VUl0VjUrVXhvOEc0dnJOWWFINzhq?=
 =?utf-8?B?cmpmRDlLTmNySTJPNXhsZXdCY2MvdGk1VVV5UEtTanY0bGZBb2dJWEJHR1FF?=
 =?utf-8?B?SzdOUDlRR3J6SE1pZnY0VHFvMUJXMkFaQ2pWM0s2dkFGRGsvMHBnQXR0a3hM?=
 =?utf-8?B?RUhlTlowbUgxQkZXWDB6RVFBNWZ4VkIzRmJ5elFTOEVpR1crUWF1dFg5RG1h?=
 =?utf-8?B?RW4yZ0d3cjd1bUsxQ0szK0NxdzRGT0RybUpzR3JISElrNlpRWTRDeFBrOEc2?=
 =?utf-8?B?aG9NRTZ1cVFva21KNTVqbjFhcnhPWjNDRnU4ZGN4cDkxeEU5YW1la1NLMXJQ?=
 =?utf-8?B?eEh1dkliMzIrUTdTUy9iT2FSZWFoNXRCVk9kVFNJVnlPNFIxU1NORzVwakRT?=
 =?utf-8?B?MlJNdnlUdTVHMi9MWm9ONVNzdDRJc0hGMzV4VmFxSDM1TGQ4alphWi92SkF5?=
 =?utf-8?B?L2NMc25xdkNDam9BbmIwdk1IU2dzTXJoV1RnTnRTVEtRZ21LUHlSS3JmeFpx?=
 =?utf-8?B?WHc2OVdoMGdUSlVkck1sS3N5SDVaMFZMQXplQTRMc1RJaENJS1YycG5OYnl6?=
 =?utf-8?B?WHFpNzhqZ2RJckZZSlVPTG56WFNLdVN4aU93SHdkRGxmSW1YRmt2cXB4SmFn?=
 =?utf-8?B?RHNYWkMveGs3QUMrTnpDWW5uMXIrV25VMlNJcU5KaWY5UTQ5Q1pjaURjZHFU?=
 =?utf-8?B?SHZXVWJQZjl6Q0g4N09rNUNlaWFTYzV4eTRxZlpYUGw4MDVPOHZpcTUyaUd6?=
 =?utf-8?B?eFh2OXM2ZEl4VENyQnZqQ2p1T3U1bGpPZXg5OWJ0VkdpNEJPR1F0TjNSeG9u?=
 =?utf-8?B?dGlUT3JpRHhTbzRZcUhSdFUvN2pMTWlJUk8yR3ZDWmFpN2dwR2FEM0gyQ0k0?=
 =?utf-8?B?ZGhKRVpPY0dnbDNBUDVFYi9wbk5PYXA3cnNObmtsYjFwMGVTaTBMM2tHdTBy?=
 =?utf-8?B?YXN0OERuT1B0UTVtbC9MUjVBb3p6ZnFkMUFBYm03RTZ3aEFXVHY2c3dveGk2?=
 =?utf-8?B?dEg4aXFnV3hxRk56OFNsNCs3NzBaUEdSb0VDL1NpQ0lYcTJjTTA2UjFvdVd3?=
 =?utf-8?B?MkxFaWtKUnltWlhOZjZSbHFJdUoxcmthNCt6NXZoS2tiV0lPcUpZQUFES0Ri?=
 =?utf-8?B?V1JvQTdMSWtlSEZ2dzIyMHY5eXgwSlgvbnBaVTM5aU5vUEVaWDNHVGlWYkhJ?=
 =?utf-8?B?RXlsNnFSQ3gyNzdVcWVjQllLMHZoWk5RREtmbllkcmkvS2lHOGZhKzFndGpW?=
 =?utf-8?B?UXd0ZXEreGJ3eURKRWQ2NmJ2OWV3QVIwaE9CMmQrUkRaKzdwMnE2VktNY0w2?=
 =?utf-8?B?T2Y4RHB2cUdRaC9Xd0pxTml1M0dHN0dFekZOV0ZYcXNXc29RRVI5Y2RmWUZX?=
 =?utf-8?B?eHhlaGY0cEhhdjRCY3l1a3R4Y0RMUlJjVGtaSCtYQXIrS01FcUtXcXdKT1Er?=
 =?utf-8?B?UXdKWlhnUVVjS1U3Y3BCdzJyUWUya1hHemVlcnFLcmI3THJnd3ZwNVI0UjRn?=
 =?utf-8?B?N1N6a05UYlpVczhEMExPTUNzY1UxVHYzbE52NW5aM1ZsTTdWbGNHOG9MOEFQ?=
 =?utf-8?B?VmFlbmY5cVdQb2lkcm0wODFYWTNvVXQ1UzdObHZIbVZsQjlRVSt4bkIzdXll?=
 =?utf-8?B?U0RmRUYwNnJ2dEdJaFJiZkhuU1lxRU1pMHk3SkFFZGFyM1lsQ09vTmdXVnlq?=
 =?utf-8?B?am1ROWNxUUNaRzhFV0VGS2U2Yk1oaWg0K1E0V2s0S0orZ0FhK2pVd21BUk9U?=
 =?utf-8?B?MEFZZVgxMDdsUnZOVFFkQktTSno3QmlLZzhmUjZ1bEcwNjdYQU9sTFBCWHFz?=
 =?utf-8?B?ZU1nRncrbWVzSkpid01BKzVpSWdIdUxiRU5naEJVcEZMQ2FaQzJ1dGFSRUJl?=
 =?utf-8?B?WkhkcUhKQkc1SWlyL2IzVk5RaFk3TUREK3hDN01BRFBqQTRzZ1hsUG4zSzVp?=
 =?utf-8?B?djhCNTdWckl4VkptSVdLeXpGWTNlOGlIUWpDaWlmWGNWWWpjZWxpaUhKRDV1?=
 =?utf-8?B?K3ZMZTgxcXdmcjdscXZ6dERVTzl4Q09kT3FCYTR0Z3JRbXljTUlrcEpKTWY5?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168cfa6-7231-4342-6eed-08db616bf9c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:14:18.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CepNJ8KYGoJnld9sj2iRcJlAfBdZBEntQs3NrQzzpq4OF1pUftDd4DCGRuFgPI2BmmjX8Iv2FQV7eztWV2ze661Jk3Hhp/29IAcdNfttgns=
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



On 5/30/2023 5:01 PM, John Harrison wrote:
> On 5/30/2023 08:29, Daniele Ceraolo Spurio wrote:
>> Before we add the second step of the MTL HuC auth (via GSC), we need to
>> have the ability to differentiate between them. To do so, the huc
>> authentication check is duplicated for GuC and GSC auth, with meu
> meu?

leftover from the meu drop. Will reword.

>
>> binaries being considered fully authenticated only after the GSC auth
>> step.
>>
>> To report the difference between the 2 auth steps, a new case is added
>> to the HuC getparam. This way, the clear media driver can start
>> submitting before full auth, as partial auth is enough for those
>> workloads.
>>
>> v2: fix authentication status check for DG2
>>
>> v3: add a better comment at the top of the HuC file to explain the
>>      different approaches to load and auth (John)
>>
>> v4: update call to intel_huc_is_authenticated in the pxp code to check
>> for GSC authentication
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c     | 111 ++++++++++++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h     |  16 ++-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c  |   4 +-
>>   drivers/gpu/drm/i915/i915_reg.h            |   3 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |   2 +-
>>   include/uapi/drm/i915_drm.h                |   3 +-
>>   6 files changed, 104 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 37c6a8ca5c71..ab5246ae3979 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -10,6 +10,7 @@
>>   #include "intel_huc.h"
>>   #include "intel_huc_print.h"
>>   #include "i915_drv.h"
>> +#include "i915_reg.h"
>>     #include <linux/device/bus.h>
>>   #include <linux/mei_aux.h>
>> @@ -22,15 +23,23 @@
>>    * capabilities by adding HuC specific commands to batch buffers.
>>    *
>>    * The kernel driver is only responsible for loading the HuC 
>> firmware and
>> - * triggering its security authentication, which is performed by the 
>> GuC on
>> - * older platforms and by the GSC on newer ones. For the GuC to 
>> correctly
>> - * perform the authentication, the HuC binary must be loaded before 
>> the GuC one.
>> + * triggering its security authentication. This is done differently 
>> depending
>> + * on the platform:
>> + * - older platforms (from Gen9 to most Gen12s): the load is 
>> performed via DMA
>> + *   and the authentication via GuC
>> + * - DG2: load and authentication are both performed via GSC.
>> + * - MTL and newer platforms: the load is performed via DMA (same as 
>> with
>> + *   not-DG2 older platforms), while the authentication is done in 
>> 2-steps,
>> + *   a first auth for clear-media workloads via GuC and a second one 
>> for all
>> + *   workloads via GSC.
>> + * On platforms where the GuC does the authentication, to correctly 
>> do so the
>> + * HuC binary must be loaded before the GuC one.
>>    * Loading the HuC is optional; however, not using the HuC might 
>> negatively
>>    * impact power usage and/or performance of media workloads, 
>> depending on the
>>    * use-cases.
>>    * HuC must be reloaded on events that cause the WOPCM to lose its 
>> contents
>> - * (S3/S4, FLR); GuC-authenticated HuC must also be reloaded on 
>> GuC/GT reset,
>> - * while GSC-managed HuC will survive that.
>> + * (S3/S4, FLR); on older platforms the HuC must also be reloaded on 
>> GuC/GT
>> + * reset, while on newer ones it will survive that.
>>    *
>>    * See https://github.com/intel/media-driver for the latest details 
>> on HuC
>>    * functionality.
>> @@ -106,7 +115,7 @@ static enum hrtimer_restart 
>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>   {
>>       struct intel_huc *huc = container_of(hrtimer, struct intel_huc, 
>> delayed_load.timer);
>>   -    if (!intel_huc_is_authenticated(huc)) {
>> +    if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>           if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>>               huc_notice(huc, "timed out waiting for MEI GSC\n");
>>           else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
>> @@ -124,7 +133,7 @@ static void huc_delayed_load_start(struct 
>> intel_huc *huc)
>>   {
>>       ktime_t delay;
>>   -    GEM_BUG_ON(intel_huc_is_authenticated(huc));
>> +    GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
>>         /*
>>        * On resume we don't have to wait for MEI-GSC to be re-probed, 
>> but we
>> @@ -284,13 +293,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>>       }
>>         if (GRAPHICS_VER(i915) >= 11) {
>> -        huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>> -        huc->status.mask = HUC_LOAD_SUCCESSFUL;
>> -        huc->status.value = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = 
>> GEN11_HUC_KERNEL_LOAD_INFO;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
>>       } else {
>> -        huc->status.reg = HUC_STATUS2;
>> -        huc->status.mask = HUC_FW_VERIFIED;
>> -        huc->status.value = HUC_FW_VERIFIED;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
>> +    }
>> +
>> +    if (IS_DG2(i915)) {
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>> GEN11_HUC_KERNEL_LOAD_INFO;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
>> +    } else {
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>> HECI_FWSTS5(MTL_GSC_HECI1_BASE);
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = 
>> HECI_FWSTS5_HUC_AUTH_DONE;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = 
>> HECI_FWSTS5_HUC_AUTH_DONE;
>>       }
>>   }
>>   @@ -381,28 +400,38 @@ void intel_huc_suspend(struct intel_huc *huc)
>>       delayed_huc_load_complete(huc);
>>   }
>>   -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>> +static const char *auth_mode_string(struct intel_huc *huc,
>> +                    enum intel_huc_authentication_type type)
>> +{
>> +    bool partial = huc->fw.has_gsc_headers && type == 
>> INTEL_HUC_AUTH_BY_GUC;
>> +
>> +    return partial ? "clear media" : "all workloads";
>> +}
>> +
>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>> +                     enum intel_huc_authentication_type type)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>>       int ret;
>>         ret = __intel_wait_for_register(gt->uncore,
>> -                    huc->status.reg,
>> -                    huc->status.mask,
>> -                    huc->status.value,
>> +                    huc->status[type].reg,
>> +                    huc->status[type].mask,
>> +                    huc->status[type].value,
>>                       2, 50, NULL);
>>         /* mark the load process as complete even if the wait failed */
>>       delayed_huc_load_complete(huc);
>>         if (ret) {
>> -        huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
>> +        huc_err(huc, "firmware not verified for %s: %pe\n",
>> +            auth_mode_string(huc, type), ERR_PTR(ret));
>>           intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_LOAD_FAIL);
>>           return ret;
>>       }
>>         intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>> -    huc_info(huc, "authenticated!\n");
>> +    huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, 
>> type));
> Not a blocker but should this have an exclamation? It sort of implies 
> the authentication is unexpected.

I can drop it. I just left it because it was already there.

>
>>       return 0;
>>   }
>>   @@ -442,7 +471,7 @@ int intel_huc_auth(struct intel_huc *huc)
>>       }
>>         /* Check authentication status, it should be done by now */
>> -    ret = intel_huc_wait_for_auth_complete(huc);
>> +    ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
>>       if (ret)
>>           goto fail;
>>   @@ -453,16 +482,29 @@ int intel_huc_auth(struct intel_huc *huc)
>>       return ret;
>>   }
>>   -bool intel_huc_is_authenticated(struct intel_huc *huc)
>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>> +                enum intel_huc_authentication_type type)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>>       intel_wakeref_t wakeref;
>>       u32 status = 0;
>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> -        status = intel_uncore_read(gt->uncore, huc->status.reg);
>> +        status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>>   -    return (status & huc->status.mask) == huc->status.value;
>> +    return (status & huc->status[type].mask) == 
>> huc->status[type].value;
>> +}
>> +
>> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
>> +{
>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>> +
>> +    if (!huc_fw->has_gsc_headers)
>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
>> +    else if (intel_huc_is_loaded_by_gsc(huc) || 
>> HAS_ENGINE(huc_to_gt(huc), GSC0))
>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>> +    else
>> +        return false;
>>   }
>>     /**
>> @@ -477,7 +519,9 @@ bool intel_huc_is_authenticated(struct intel_huc 
>> *huc)
>>    */
>>   int intel_huc_check_status(struct intel_huc *huc)
>>   {
>> -    switch (__intel_uc_fw_status(&huc->fw)) {
>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>> +
>> +    switch (__intel_uc_fw_status(huc_fw)) {
>>       case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>>           return -ENODEV;
>>       case INTEL_UC_FIRMWARE_DISABLED:
>> @@ -494,7 +538,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>>           break;
>>       }
>>   -    return intel_huc_is_authenticated(huc);
>> +    /*
>> +     * meu binaries loaded by GuC are first partially authenticated 
>> by GuC
> meu?
>

Same as the other one, will fix.

Daniele

> John.
>
>
>> +     * and then fully authenticated by GSC
>> +     */
>> +    if (huc_is_fully_authenticated(huc))
>> +        return 1; /* full auth */
>> +    else if (huc_fw->has_gsc_headers && 
>> !intel_huc_is_loaded_by_gsc(huc) &&
>> +         intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
>> +        return 2; /* clear media only */
>> +    else
>> +        return 0;
>>   }
>>     static bool huc_has_delayed_load(struct intel_huc *huc)
>> @@ -508,7 +562,10 @@ void intel_huc_update_auth_status(struct 
>> intel_huc *huc)
>>       if (!intel_uc_fw_is_loadable(&huc->fw))
>>           return;
>>   -    if (intel_huc_is_authenticated(huc))
>> +    if (!huc->fw.has_gsc_headers)
>> +        return;
>> +
>> +    if (huc_is_fully_authenticated(huc))
>>           intel_uc_fw_change_status(&huc->fw,
>>                         INTEL_UC_FIRMWARE_RUNNING);
>>       else if (huc_has_delayed_load(huc))
>> @@ -541,5 +598,5 @@ void intel_huc_load_status(struct intel_huc *huc, 
>> struct drm_printer *p)
>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>           drm_printf(p, "HuC status: 0x%08x\n",
>> -               intel_uncore_read(gt->uncore, huc->status.reg));
>> +               intel_uncore_read(gt->uncore, 
>> huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> index 112f0dce4702..3f6aa7c37abc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>>       INTEL_HUC_DELAYED_LOAD_ERROR,
>>   };
>>   +enum intel_huc_authentication_type {
>> +    INTEL_HUC_AUTH_BY_GUC = 0,
>> +    INTEL_HUC_AUTH_BY_GSC,
>> +    INTEL_HUC_AUTH_MAX_MODES
>> +};
>> +
>>   struct intel_huc {
>>       /* Generic uC firmware management */
>>       struct intel_uc_fw fw;
>> @@ -31,7 +37,7 @@ struct intel_huc {
>>           i915_reg_t reg;
>>           u32 mask;
>>           u32 value;
>> -    } status;
>> +    } status[INTEL_HUC_AUTH_MAX_MODES];
>>         struct {
>>           struct i915_sw_fence fence;
>> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>>   void intel_huc_fini(struct intel_huc *huc);
>>   void intel_huc_suspend(struct intel_huc *huc);
>>   int intel_huc_auth(struct intel_huc *huc);
>> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>> +                     enum intel_huc_authentication_type type);
>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>> +                enum intel_huc_authentication_type type);
>>   int intel_huc_check_status(struct intel_huc *huc);
>>   void intel_huc_update_auth_status(struct intel_huc *huc);
>> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>>     void intel_huc_register_gsc_notifier(struct intel_huc *huc, const 
>> struct bus_type *bus);
>>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const 
>> struct bus_type *bus);
>> @@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const 
>> struct intel_huc *huc)
>>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>>   {
>>       return intel_huc_is_used(huc) && 
>> intel_huc_is_loaded_by_gsc(huc) &&
>> -           !intel_huc_is_authenticated(huc);
>> +           !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>>   }
>>     void intel_huc_load_status(struct intel_huc *huc, struct 
>> drm_printer *p);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 3355dc1e2bc6..d2b4176c81d6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -160,7 +160,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>> intel_huc *huc)
>>        * component gets re-bound and this function called again. If 
>> so, just
>>        * mark the HuC as loaded.
>>        */
>> -    if (intel_huc_is_authenticated(huc)) {
>> +    if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>           intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_RUNNING);
>>           return 0;
>>       }
>> @@ -173,7 +173,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>> intel_huc *huc)
>>         intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_TRANSFERRED);
>>   -    return intel_huc_wait_for_auth_complete(huc);
>> +    return intel_huc_wait_for_auth_complete(huc, 
>> INTEL_HUC_AUTH_BY_GSC);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index 0523418129c5..c14433795c91 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -941,6 +941,9 @@
>>   #define HECI_H_GS1(base)    _MMIO((base) + 0xc4c)
>>   #define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>   +#define HECI_FWSTS5(base)        _MMIO(base + 0xc68)
>> +#define   HECI_FWSTS5_HUC_AUTH_DONE    (1 << 19)
>> +
>>   #define HSW_GTT_CACHE_EN    _MMIO(0x4024)
>>   #define   GTT_CACHE_EN_ALL    0xF0007FFF
>>   #define GEN7_WR_WATERMARK    _MMIO(0x4028)
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c 
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> index 8dc41de3f6f7..016bd8fad89d 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> @@ -196,7 +196,7 @@ bool intel_pxp_gsccs_is_ready_for_sessions(struct 
>> intel_pxp *pxp)
>>        * gsc-proxy init flow (the last set of dependencies that
>>        * are out of order) will suffice.
>>        */
>> -    if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
>> +    if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, 
>> INTEL_HUC_AUTH_BY_GSC) &&
>> intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
>>           return true;
>>   diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index f31dfacde601..a1848e806059 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -674,7 +674,8 @@ typedef struct drm_i915_irq_wait {
>>    * If the IOCTL is successful, the returned parameter will be set 
>> to one of the
>>    * following values:
>>    *  * 0 if HuC firmware load is not complete,
>> - *  * 1 if HuC firmware is authenticated and running.
>> + *  * 1 if HuC firmware is loaded and fully authenticated,
>> + *  * 2 if HuC firmware is loaded and authenticated for clear media 
>> only
>>    */
>>   #define I915_PARAM_HUC_STATUS         42
>

