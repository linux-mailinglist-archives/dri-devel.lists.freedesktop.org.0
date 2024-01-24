Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5983AB50
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 15:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9791510F6FA;
	Wed, 24 Jan 2024 14:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA9D10F754;
 Wed, 24 Jan 2024 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706105055; x=1737641055;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P+VTViZmWqpXIv8k7joAiuz0Yr6GixhrenZce8Yyo48=;
 b=fQA0pjOtuDfbTgeUSDTqBoDRYSenEzZidXH/M/M1itMh5RC8s/VUYLVF
 wnhoEPPSXGAwprhirGuAleHIaCXe+KabpAGge8BsfJ0fCm4Ywl4j7k64H
 k8UUArX63+EwSrC77GBtau3j7outgDbWPKptWdFR2FMpBMuBXYkch6p/R
 mVY4Z+MGkC25bdDClZQ0w2Pfu9DuRW57XMCIzrc7DI78p6ayh79L7d+sX
 AqYJ4UcwJW2vpvdbbcG6j04xyECfgumzKVZUWBaKEb1MMmcUb2ELsYmhW
 SDQyhE4UymEAiQYr10XMGlXLWumyjI40E6MoWQFL9TiEM7CHr7l9s/vvM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15198155"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15198155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 06:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929690627"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929690627"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 06:04:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:04:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:03:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 06:03:59 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 06:03:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEND3Z4yIWIGw3aXkQiwm2uy5P2z9KdkebdUW+f9YVbElvz4lJD+voCmaFjLoyovnRZyfRgJoLOAVJJtQNknp/loa4rwkxr1fB+9is048l8fQVsC3dkb17lsa3bSsGIpanIFNhMzyLKGsEiRKYt4rrsBhHTREtHCqHXTntfJvG89p1ohfOl3EQibXwpwtlUEjrvi4pTlOuyyO+d03lu7Rvj8PLtwmbQKt0IdJq8vrcV/js7Op4UbkaFS/mT+ZAibrBiW2yoLRtf5dI0s8peI3Ko4jWdo1694sCzT9kED2CTIjGy5onzDWLhLh+4f/85CwajUnEbiwlLgEH3AiOEFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek8n6iE/MsRfjvYtPNSxhXaAoEP5GuCl3KmO5NPiX0o=;
 b=jYJkMOxTIkHbXVZ69cDh6cQpvjxcz9FWxurVdjvZAZHFIc6zhaPoDwf86T7ChZETa8iG35tJ7BmtZ+4/8SeVWcfgbBWcz345EXxVqOPpxj2fLTC05lPR7LboE93sXFbhdpT39qGSxoUjiSxo6SgzUsPDAif5PxeO0PmJj7CEBVRIjhAnwA4squ7i2NEzZ2MnXIwBWuIhipC4CNEt41vs/k6vtyrtT4JyLAMH7ZQkKAX7dJkS6dVkBnsCKJec7iwRsmIJ3MNte+s5VFWOYcgWlc4hqIuy6rp3PPp5YjuwMV/7HqjoQY5pTqfgb+P5tLnPXa4U3vDeisPGqU+ntQDdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 14:03:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 14:03:56 +0000
Date: Wed, 24 Jan 2024 08:03:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Re: [PATCH 1/3] bits: introduce fixed-type genmasks
Message-ID: <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-2-lucas.demarchi@intel.com>
 <87v87jkvrx.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v87jkvrx.fsf@intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: e33b601b-7c58-4c57-c7ee-08dc1ce54e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E9TC1y9Gj4oY+Z1QMFwmGsR7lHcnuvDkxAsLAqjmx5usnOGUv9oudYv80o3J9D+RbD6qLtvO62qJF/kmADL5ZtN9tZJps29Js8PAloQq33+fVzL5Kv9tq6KT0AqrPbtYJrwRZ6bdU5M7FO0NNlAyiiah5rQKKI23BdTROhNoLXBWN4UoRzpufi2jEmH9u2vxzjcLeYQQyuw3Jl99ZdnRT7KdNXrABlCfrNnOZNMIVqueBjkCdQJ2rfE+MiNtxl4aRVo51dB9iWlW0rTeXeKhHTkJww8K53tPkr5+ud0cNNJr30ClWVDiFUVyBB3E23uhHiBwDRGOPQbmi0ePHH+0khAEoQxgRSTsHyu4FFGhtaLK+aVlNEE3+8ZnxHTWAkZ5u+YvNf/kwd/+UAMSAZZsOsthWzArfEFknZ/c2tumoEYlwihm7/xJqezMFa1/y1KlN1kRf3G5kEVwQPfPF9HtTWz8xfcNydygKCY0Zk/g4XQZjjkf7s091vCZI+qdmORir8MQAUBz3mykejL4ohjmrIY6lOaqROJULs3ka+/Bcg1Utvt79O2O1FrkVtyrktbZb4nqJySS/ADk64lpm6DhXrSxVt+QtAaFQ5ERmbKc4cGBvU+MqRb6Wd3K8g33LkmM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(6506007)(316002)(54906003)(82960400001)(66946007)(66556008)(8936002)(8676002)(6916009)(66476007)(26005)(6486002)(6512007)(478600001)(83380400001)(4326008)(86362001)(6666004)(9686003)(2906002)(5660300002)(41300700001)(33716001)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGdPWWxNekpWZUhtTTN3U29lNWI4ZFBJS3cxRjI2WnZtVFRjcllYV2ovQ0Vz?=
 =?utf-8?B?UXpNWXZpaTh3NUo0QzRoaG1qN01NdTBFWHNuTkR0ZThkRWpveTh5bFNFVFht?=
 =?utf-8?B?NVc2K0QxQlVPNE9ZQ0pMdXJybktUQnBTZC8vNFRZSm54ZnhFU2V0RnpRMk9T?=
 =?utf-8?B?N3JTa2pOdWM0enFSWjBuOFBBa0JqYlRMdWJKUS9kQWMvSUxjRkdLbHYzVytl?=
 =?utf-8?B?d3dWQ3RhTlBQNWZmUjlYd3dvWWxDemZEWUFjZXRUbUFTNWExbElVTStzeXIx?=
 =?utf-8?B?Y0picFlyaWU4cGdzZWlkNTY5TmNrK0dPRFo1bVI2U2YrUHh3N1gwUEszN1ZE?=
 =?utf-8?B?SGVFSEsvS2ZycTUvREx3eGRPSEQ1SEgyODQ3bGQ0bURaR0VhNHRTWXBycDc4?=
 =?utf-8?B?RmRkcEQxeFVhaU5BSC93bGZYaDQwRW8vZVhQN3RwL290cnhEMTBteVVac1VY?=
 =?utf-8?B?WlUwREMzayticGt2YVRUK3kyWklUemYyYkszZ3puZ08wVmFPaTBDRHFOald5?=
 =?utf-8?B?NW85MC9iQ0JRL0tvZW5lL2NSOEltSDB1TERLRjlCd2tuRFhPYVc1Mng2Qms2?=
 =?utf-8?B?TjFNMGlpT1FHNFFFS1lYRmoyTURTWVJWUjJQcHRmZWlPWEh2TUd3TURwd0RE?=
 =?utf-8?B?WVhReXpkVjQ2TWVnd0lCK2d0QUN5TnpOWE9KQk51TC8zZ2U5KzJ6UWRYdTZM?=
 =?utf-8?B?Uk1EYmdjeTZVZ01mNTBUcGt0U0FnczZJNDFHeW1jSjhTMy95OVBsdEx6Y25E?=
 =?utf-8?B?Zmp4eHU4dkgwZHhqMHNheTcvbXptL0ZtajNXdDNjVmN0QnpEV1Y3NGt5TjMz?=
 =?utf-8?B?aFdFdkJqb0swMThyODdZcDJoVzBXWmFSMlFpZENzdHJoelVkZjkwbDYyOG0r?=
 =?utf-8?B?K0ZRZFJxaTNwbUlxNUlUdkErUVpmbDAwTkpwaE5ZRHZJZkU0OHN2YkpsM3Er?=
 =?utf-8?B?Q3ZURzBCcTM3aEprSnhyYWxZMy9YWnBQZklRMG1ra0lPSS9qU2pCdnVlWEEv?=
 =?utf-8?B?WFNjMHp1VEpCSDE5ZGpqMDNBandFR2FTY1IzM2VUaDREK1BDNjZuUDhONEl6?=
 =?utf-8?B?ODhnODVjRFMwK2F0cEZxbS9YS1F0b0xEYWlCZUhkSXZoektJNFZZKzNJRCtW?=
 =?utf-8?B?K0IrN0ZOZ1lIY1I3aTZNSVRWclUyeGhwMlB6MnZ1eTFMYTY2Um1Ca0FjNEp4?=
 =?utf-8?B?cStKVmJPWXFPWm8ybHd6SGxRZmVYVGU0OS9QSHI0T2k0Vk0rSUpWOVRrRXlB?=
 =?utf-8?B?SlpnaDN1MzIzbW5wV3UrZnRta1VQeitXdWRPeHlIOVBkNTdsb3I3azFWSlFJ?=
 =?utf-8?B?S2UzT0JvYStQYUVlRllHbEs5UmhkRnFVZy8rVE1oU2JZQllTMHRzZXVZRzhU?=
 =?utf-8?B?a2d2ZUtYc0NYcEozWXBLQ0FaeUMzOVFBeUsxbUdWTU5heS8zenh3SXIzVkN3?=
 =?utf-8?B?ZTEyYTEybUxYVjRSS2dzaW4rL0c4WDFScEtrTjRvcGptRXE4M0JBZ2JXVU1G?=
 =?utf-8?B?OGQvbjJQUFl4VnhHcUkrMHlDYllEdGdBUnAxb0FhbUhueFloVkRRT0J4ZUZS?=
 =?utf-8?B?aW9JdTJuWVQvdlpObWFJUHoyeEIzSm04QlJBK1VSakxmMkFoRGdCQnJaTFJL?=
 =?utf-8?B?aWU0S2NIVXRVdk1xZG5LU29INzJpSkQ5Mi8zMzdYT3lseHltMjVtVVlJZmUv?=
 =?utf-8?B?WkpEWTF0ZFFBaEJWRi9Bdm1TYm5tMjJWZ2o1MDBPb2w2dEJyN0d4bWI3TENK?=
 =?utf-8?B?bUhrRGZFdXk3b3hEMm9yU3JFdnZkY3lvYmVhbGtTWDBVMDNkamRLSURhc1pW?=
 =?utf-8?B?VDdQM01JOWJSb01zRnI1cThZUW1hb2R5YW9qVWV1TWIyeVJDWk9GNmY4NjVH?=
 =?utf-8?B?RWJnbFlwYmRIYWcwbFRiSDdWZGpTUkxib0R6U1NwaGtid3ErNnB6R09PdVRh?=
 =?utf-8?B?eVdjWFVhc2RUZUl3UUxUNlAwNHk3NFBtbGVNSHNxSWs4Yks3MzdqcTh5UWVC?=
 =?utf-8?B?SHVjaXJGT29RM1NKVXVZMnUwbzYwYjFPYUJSdWM4ZmFsU09VNGM3ZVhpcEhY?=
 =?utf-8?B?UTBnZEpYY2dWMDYySndlREZPcFhuS2lmbG9uc2VoZWJpMHNVbzJNaE1neHYr?=
 =?utf-8?B?S055bkZ5N0ZYNkx1bUpoNGs5VFNRdGJGbHdhWHNxUEhvcnF6WGEwcHdjNVFr?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e33b601b-7c58-4c57-c7ee-08dc1ce54e2e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 14:03:56.7796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKBVc32HUjBY30EEWv59PV3P6JJBICK/ggbOKTl2kM9XhopRPPkRR+tQfy7tR1tGFT18SP2P2sJ7v4uQZ/Zgkf+ycBzrjOvvajTm4T9SKzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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
Cc: Yury Norov <yury.norov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 09:58:26AM +0200, Jani Nikula wrote:
>On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> From: Yury Norov <yury.norov@gmail.com>
>>
>> Generalize __GENMASK() to support different types, and implement
>> fixed-types versions of GENMASK() based on it. The fixed-type version
>> allows more strict checks to the min/max values accepted, which is
>> useful for defining registers like implemented by i915 and xe drivers
>> with their REG_GENMASK*() macros.
>
>Mmh, the commit message says the fixed-type version allows more strict
>checks, but none are actually added. GENMASK_INPUT_CHECK() remains the
>same.
>
>Compared to the i915 and xe versions, this is more lax now. You could
>specify GENMASK_U32(63,32) without complaints.

Doing this on top of the this series:

-#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
+#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(62, 32)

and I do get a build failure:

../drivers/gpu/drm/i915/display/intel_cx0_phy.c: In function ‘__intel_cx0_read_once’:
../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
    41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
       |                               ^~


I also tested them individually. All of these fail to build for me:

1)
-#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
+#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(32, 27)

2)
-#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
+#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 31)

3)
-#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
+#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, -1)


Lucas De Marchi
