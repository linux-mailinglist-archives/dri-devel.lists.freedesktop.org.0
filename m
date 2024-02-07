Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97884D26A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 20:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E8B10E747;
	Wed,  7 Feb 2024 19:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfD45H/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D8110E7EE;
 Wed,  7 Feb 2024 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707335551; x=1738871551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXCDMKzYTq04n0OuvzW8lUuX+OApOwTBR5k6wqJ4bWc=;
 b=lfD45H/0KdB1kJukE4WC2afr3xBqyY+mKg1yV5gZqr77Q0Bvho5y8TrP
 AzJzuV0Ul7xpoFmEeYIVdW/zFjuWMcA7fQqbxwzyYpQV14cROqPAkeMjj
 SVbw967MWfyESlatV4pFpnlOHSMQQbZOcDq7KU6cYMhIu9fVJ6u8WNBAV
 qRukLWJFAy/RNSCldXGL4SK1aUsZbLVKOUEXQcJgVSepn9y4CQdcdC6pG
 ZAcmEV43s87BTtXq6RNtkfnciea8nyBHu0wT5odXvohPPr9okGNah7Hqb
 WGLjDhu3pqN6PS+VcWAa6DSIE0j5rHcf9Cwo+a8NOYtOsFzjvdGNfwR7Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="436205292"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="436205292"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 11:52:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1791911"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 11:52:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 11:52:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 11:52:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 11:52:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGpa4ay66vVb0t7eelK6/v6JOI5eOQkefFZzrk5dSZ54tOlBMzKew/zIDJQIDKifIZp369iH+6ZLEzhqZUHvhu/0/FYfsVJ9hyxlQIYodtl4MUGmkwkZqBjUw/vYaZf88IUN3Nj/YufN68r8vDRvQtpQE5n5a6JyGsOrWQVtiiAuGm5sUuoe4v89H0E8eeLLUMTTa35r1ElqVKznQQeTANtZrIr+H0k1B7JyqGHmhUe2YJ9Oc6pWv7XoduY0PSylySg1OQm0TPrt21cqKTjvTz5Ih11lqyYT9jsyGJ4eFgynHQpCd1Vdhan1uFBsfhtTJOvKWlXqbjW+nbDLDybS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIyrwsJLs595FRruqznz/R2q5mcKHnoYq30nS8N/ewA=;
 b=b/LtGM9lkxViEj5+D0cnQvFtcCiTayKten3O0PFq3W1qDkvXmgLWthg5URdGJrDSm3jYg66req+uhiMLo2z2kNI3tpqw+7VJKboups3pyOOWUU0pKMzSVMDFO9yGgw2+Ixp3u/NN7/oy7kJ8l7nQCi5bClVoG+N0iIbEkAVsrD5cfbAJDSiKHertUsALEn7fHAom2YBdh2pB9+4l4S/C/36keHvqThc3eN0xGY60gi1TjEmKihhz1HAfVr4NCkSw8n09g8JEbTZIhi4eklFMMJZbiUVCLftZCWHsgUeKtNu3g1IbTNhs0aq3IWTTdSuNtxEliaoVgFv0vjW50rtLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 19:52:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 19:52:22 +0000
Message-ID: <1e7161b0-5d42-4980-8a97-61083da15a69@intel.com>
Date: Wed, 7 Feb 2024 11:52:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Intel-gfx@lists.freedesktop.org"
 <Intel-gfx@lists.freedesktop.org>
CC: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Ghuge, Sagar"
 <sagar.ghuge@intel.com>, "kenneth@whitecape.org" <kenneth@whitecape.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
 <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
 <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
 <cdf2554bdd2774d51bad89e415d4c46732d4fddb.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <cdf2554bdd2774d51bad89e415d4c46732d4fddb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 820ebeaa-b981-4df0-fd06-08dc28164d07
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuYRAEhAuADCq/7999Xtij2E8TzKLmy45Xnb9RTgcn143npXB0FC0LSf8aOJrUzroXf+htAkmp0fQihMrxzbXNfTLN0aULqF3Er73K1nWKBdGly5pDNSFcoT91JbFestdCwubYAGFAOQI3dfs5fN/40LigkgaAX7VxAhw50M8Lh9fdspV7Sb1VAaPY2k9MV7vOKSH8j4QMKRQAUE42kpBwsQlnZaV8l9yHLjdSxLaV1hcS0IKPwsk7QNGRJCzjyw5iFh1KM7ONxA7EofBbUudZhO1oa1ti+lBynms6I/7xa5ChOsmTEtf0Mbixw9uD9xXFdUDMDj8QVZnn9/wKioWtqTp+bNw7wY8Any2DSBcZWIoVvtP4FBd6frMA7AWcMWRwjyfwywWsxzsna6he20RIjA5SLoxUnPPJQCDDpKi8MpUzQJNcmrJPB5Y0KQ4YtQ3ieMtv3c+vZFD+O6/aYRy4DsqkyOudtuCzVmnRP/mB6J6nWPo7A/9ptjKXsnjZdy6NCVrGYx3AZfl0OSRDzVO9ZLpUjPKuA9hF30fR2N2wfDHv2K1Qq4X1DgkgmyWQ+GMuqiFOcunk67tawWfjT8v2QBDppbmsOdfnIeVlbXMRM9r41Jpj0GLMMokes4HQFL5TDS0HnIq7vs3mz6a6lggw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(2906002)(31686004)(83380400001)(41300700001)(6512007)(26005)(38100700002)(82960400001)(31696002)(86362001)(2616005)(6506007)(66476007)(110136005)(53546011)(8676002)(8936002)(478600001)(54906003)(6666004)(36756003)(66556008)(6486002)(66946007)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFpSNU1kVDVhOWh2UVo3YW4va2ozV08vSURwUHRJV2tFSnZuQmtrekFMN1Zv?=
 =?utf-8?B?REFXeWp3VFREVWo4c0Y1VXFncGE4LzhuZXFiU096UmZXaGRKU3cxT2s3cDh0?=
 =?utf-8?B?L1ZNTUtXSGZONWZPcVJONHE1MnNYM0dVWUloODU0M2lRS1h2VHNPWEIxUVRm?=
 =?utf-8?B?QXhTcWZvQUIxYm1GK2xzcGl3NmVGcFpzelFNVGhES0VYL0s4Q2xGSHRyVjNN?=
 =?utf-8?B?V2cvem90UEFSbDJTV2pVV3BaSmZMSGI5Ni83UURXOEFYTGJGQy82NFVHMzA4?=
 =?utf-8?B?cTYwMjZlYU85ejBEVEtqSi9FZmd5M0FQTnVqMGVQZVptNHN3VWUwY3BzdjVo?=
 =?utf-8?B?aG4xY2tJRTZjS0RBN1BKcGlEV2Nuc244Y3gyQ3JGOXBxay96dEV0VTJQT2JC?=
 =?utf-8?B?TDE2MUJwMnlGV3BzMmE5cGJuRG1Lb3ZLSGlHNHhLeDk1Y3ZqeVpONmFoYmFu?=
 =?utf-8?B?TVJlRVlWUEdJMWttRVpCWlhHM0hwNHVrSUs4cUNNWXVSeFR3YnV4VG01ZGdx?=
 =?utf-8?B?UC9yMmljUi9oUnlIWnd4L3VSeWg0Qkc2cm5BMDFNTDlxNVNkbkRWb0pyZTd6?=
 =?utf-8?B?eWZURUtFTzFxMDYvVVNuL2o0anEvR0VHQTNkVnI5Y2lpN0xSMlRTaU9rY1Jw?=
 =?utf-8?B?aVFoZlY3dGxEMTVQS3FsRTkwc0tsak9HSDVIUmVrT3pvZjV1N29tRFNzTWZ1?=
 =?utf-8?B?NjhiUDdOdEdTMmZ6blZzc3dFL0Nza2NDUjVOSmlJbU56ZXdYUUhsOFlCKzhj?=
 =?utf-8?B?WlhpcVdFbUY4c2R2ZW9HZ2E3L3hJMWdRdUFESnlrOVBIV29JcXIycWZZZGI3?=
 =?utf-8?B?UnFnM2Roa2VqcXdtUFgyaVNnOWdpUmFTM0JybVI0NXdUd2tMdG9hWmROaXo2?=
 =?utf-8?B?R1BDU2MrRUQ0S2VCbjNqSUUwN3lFUUdGYmJkRTFTRWY3S09ZZnB0YVorOS9M?=
 =?utf-8?B?bWZGUzVZSGY5cVdvWHgxL0ZEVTVDRjJ4OFkzdWVyNUpadFRkU2RnNkZQKzhU?=
 =?utf-8?B?T05aUVpmdUp5RTJOMXBzVmplTmMwOS9zaUltS0VoYnduV0toSVZSQlNadUV5?=
 =?utf-8?B?VGRLVkt6ZG9zOXJBU2t1QWFOOG5jR3NvWC9xbnN1WmFrQWRJYW9ZcW9HSE1R?=
 =?utf-8?B?dnZRUk5IZzJoa2tGNWRjWXdjY25KK3Vpa1Ryc1N1TktPa0FtUFA2ZUdraGNO?=
 =?utf-8?B?bFJGeGV2VFFnZWNnUTJyVzFuRDB1cXRSY0VFQ0FyTWZyZGhkNUoxa2hXUnQy?=
 =?utf-8?B?d0ZpV0t3OEVCQlU0SVVvNzIwbGpKTFk5bzhNZFczbU5PRklsUUd5L0hlSXBV?=
 =?utf-8?B?cjFoWGFValEzaGk5QWhXU1UvUmErU1k2VGl0Y2M5ZXNDbU9mT0ZtbjRVK2lN?=
 =?utf-8?B?azFYR0FHVXhkd2NxaVFZdG5hbGJucFQ0UG9kcVFMcEFkeHFLRzhYMDU1UlVo?=
 =?utf-8?B?bDFKbEZmaFJHZVFxeDBLUW1SS3dvWGZpaUhreXB1OGZyUlo5cllkY0dwSUhm?=
 =?utf-8?B?cGpubUFubnYwS21NNVVuZEpKa1JVNnJlRzc3emxyc0FzZVlrcXZERDJwRCsx?=
 =?utf-8?B?WHhLeTdDWUhPWU5BZ2FnbzBjYlAweDJhVnQvdmVhQTJ4V1ZXTE5tSXBXOTRI?=
 =?utf-8?B?a1hoRmRJSzJ5eDI5dzZ3RnRUNkN3L28ydTN3U3dBUGJWSEVPWG1uaHV6VnNq?=
 =?utf-8?B?VnpRK2tPMEUvMGhoZE1VZTZldklOSDJGOFFLbEc0Ry9MbmJ3VmxqNW4yZUtX?=
 =?utf-8?B?Tk0yNlVBNFFWNGRtU252Mk85eUptWnk2c3EvV204bVMyUFh0VktDQW5UMU9K?=
 =?utf-8?B?S0hFRlRkUExzeEl1Qy93Vkt2aTNTQVNmQVFlNXpNZUZNZWhnUHhEY0dyNXZJ?=
 =?utf-8?B?WUZiYm1kaDVta2xYZU9RQjBOdXJCNEIrS2JMdGRKZmlqVUx4dUlTUXIxRzU5?=
 =?utf-8?B?QW1zdDFYTkFZY0swNjRIdlFkWEo5cThWa2t5ZDlLaCtMTU5ObUdqRGxjRyt6?=
 =?utf-8?B?NU5lUUl6NW9QTmh4OHV1bngwdWhLWi8zdjYxcHJmWFNrcVo0bi9jWmdTb0Y4?=
 =?utf-8?B?RUtaY1U5TEJLeVdPWHVlbzFJVExWR2padnRJbWU2Sjk2ZDd5YUFnbU01NGxY?=
 =?utf-8?B?UUcvVUZFL2FQVVgxNU8yMXJYNU5GN2E1dkZlRGpubm1oK2pXWmh5UGtkTzNW?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 820ebeaa-b981-4df0-fd06-08dc28164d07
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 19:52:22.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV6cUDYLx1P2MU2PHGwBLE/TL5hygqox51shA5P75wRMUkG1UaSqEcVrqS8ghJ5J21p6lqt0ImgIS2OLP3RqU3DmtEjw/zUOWxBsyIWk0Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
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

On 2/7/2024 11:43, Souza, Jose wrote:
> On Wed, 2024-02-07 at 11:34 -0800, John Harrison wrote:
>> On 2/7/2024 10:49, Tvrtko Ursulin wrote:
>>> On 07/02/2024 18:12, John Harrison wrote:
>>>> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> Add a new query to the GuC submission interface version.
>>>>>
>>>>> Mesa intends to use this information to check for old firmware versions
>>>>> with a known bug where using the render and compute command streamers
>>>>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>>>>
>>>>> Based on patches from Vivaik and Joonas.
>>>>>
>>>>> There is a little bit of an open around the width required for
>>>>> versions.
>>>>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>>>>
>>>>>    #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>>>>    #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>>>>    #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>>>>> ...
>>>>>    struct intel_uc_fw_ver {
>>>>>            u32 major;
>>>>>            u32 minor;
>>>>>            u32 patch;
>>>>>            u32 build;
>>>>>    };
>>>> This is copied from generic code which supports firmwares other than
>>>> GuC. Only GuC promises to use 8-bit version components. Other
>>>> firmwares very definitely do not. There is no open.
>>> Ack.
>>>
>>>>> So we could make the query u8, and refactor the struct intel_uc_fw_ver
>>>>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>>>>> u8 I simply opted to use u64. Which avoids the need to add any padding
>>>>> too.
>>>> I don't follow how potential 8 vs 32 confusion means jump to 64?!
>>> Suggestion was to use u8 in the uapi in order to align with GuC FW ABI
>>> (or however it's called), in which case there would be:
>>>
>>>     ver.major = guc->submission_version.major;
>>>
>>> which would be:
>>>
>>>     (u8) = (u32)
>>>
>>> And I was anticipating someone not liking that either. Using too wide
>>> u64 simply avoids the need to add a padding element to the uapi struct.
>>>
>>> If you are positive we need to include a branch number, even though it
>>> does not seem to be implemented in the code even(*) then I can make
>>> uapi 4x u32 and achieve the same.
>> It's not implemented in the code because we've never had to, and it is
>> yet another train wreck waiting to happen. There are a bunch of issues
>> at different levels that need to be resolved. But that is all in the
>> kernel and/or firmware and so can be added by a later kernel update when
>> necessary. However, if the UMDs are not already taking it into account
>> or its not even in the UAPI, then we can't back fill in the kernel
>> later, we are just broken.
> This sounds to me like a firmware version for internal testing or for pre-production HW, would any branched firmware be released to customers?
See comments below. Branching is about back porting critical fixes to 
older releases. I.e. supporting LTS releases. There is absolutely 
nothing internal only or testing related about branching.

Just because we haven't had to do so yet doesn't mean we won't need to 
do so tomorrow.

John.

>
>>> (*)
>>> static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32
>>> css_value)
>>> {
>>>      /* Get version numbers from the CSS header */
>>>      ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
>>>      ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
>>>      ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
>>> }
>>>
>>> No branch field in the CSS header?
>> I think there is, it's just not officially implemented yet.
>>
>>> And Why is UMD supposed to reject a non-zero branch? Like how would
>>> 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I can
>>> respin if you definitely confirm.
>> Because that is backwards. The branch number goes at the front.
>>
>> So, for example (using made up numbers, I don't recall offhand what
>> versions we have where) say we currently have 0.1.3.0 in tip and 0.1.1.0
>> in the last LTS. We then need to ship a critical security fix and back
>> port it to the LTS. Tip becomes 0.1.3.1 but the LTS can't become 0.1.1.1
>> because that version already exists in the history of tip and does not
>> contain the fix. So the LTS gets branched to 1.1.0.0. We then have both
>> branches potentially moving forwards with completely independent versioning.
>>
>> Exactly the same as 5.8.x, 5.9,y, 6.0.z, etc in the Linux kernel
>> versioning. You cannot make any assumptions about what might be in
>> 1.4.5.6 compared to 0.1.2.3. 1.4.5.6 could actually 0.1.0.3 with a stack
>> of security fixes but none of the features, workarounds or bug fixes
>> that are in 0.1.2.3.
>>
>> Hence, if the branch number changes then all bets are off. You have to
>> start over and reject anything you do not explicitly know about.
>>
>> This is why we were saying that exposing version numbers to UMDs breaks
>> down horribly as soon as we have to start branching. There is no clean
>> or simple way to do this.
>>
>> John.
>>
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>> Compile tested only.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>>> Cc: Jose Souza <jose.souza@intel.com>
>>>>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/i915_query.c | 32
>>>>> +++++++++++++++++++++++++++++++
>>>>>    include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>>>>    2 files changed, 43 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_query.c
>>>>> b/drivers/gpu/drm/i915/i915_query.c
>>>>> index 00871ef99792..999687f6a3d4 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>>>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct
>>>>> drm_i915_private *i915,
>>>>>        return hwconfig->size;
>>>>>    }
>>>>> +static int
>>>>> +query_guc_submission_version(struct drm_i915_private *i915,
>>>>> +                 struct drm_i915_query_item *query)
>>>>> +{
>>>>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>>>>> +                        u64_to_user_ptr(query->data_ptr);
>>>>> +    struct drm_i915_query_guc_submission_version ver;
>>>>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>>>>> +    const size_t size = sizeof(ver);
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    ret = copy_query_item(&ver, size, size, query);
>>>>> +    if (ret != 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    if (ver.major || ver.minor || ver.patch)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    ver.major = guc->submission_version.major;
>>>>> +    ver.minor = guc->submission_version.minor;
>>>>> +    ver.patch = guc->submission_version.patch;
>>>> This needs to include the branch version (currently set to zero) in
>>>> the definition. And the UMD needs to barf if branch comes back as
>>>> non-zero. I.e. there is no guarantee that a branched version will
>>>> have the w/a + fix that they are wanting.
>>>>
>>>> John.
>>>>
>>>>
>>>>> +
>>>>> +    if (copy_to_user(query_ptr, &ver, size))
>>>>> +        return -EFAULT;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    static int (* const i915_query_funcs[])(struct drm_i915_private
>>>>> *dev_priv,
>>>>>                        struct drm_i915_query_item *query_item) = {
>>>>>        query_topology_info,
>>>>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct
>>>>> drm_i915_private *dev_priv,
>>>>>        query_memregion_info,
>>>>>        query_hwconfig_blob,
>>>>>        query_geometry_subslices,
>>>>> +    query_guc_submission_version,
>>>>>    };
>>>>>    int i915_query_ioctl(struct drm_device *dev, void *data, struct
>>>>> drm_file *file)
>>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>> index 550c496ce76d..d80d9b5e1eda 100644
>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>>>>         *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct
>>>>> drm_i915_query_memory_regions)
>>>>>         *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob
>>>>> uAPI`)
>>>>>         *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct
>>>>> drm_i915_query_topology_info)
>>>>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct
>>>>> drm_i915_query_guc_submission_version)
>>>>>         */
>>>>>        __u64 query_id;
>>>>>    #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>>>>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>>>>    #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>>>>    #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>>>>    #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>>>>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>>>>    /* Must be kept compact -- no holes and well documented */
>>>>>        /**
>>>>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>>>>        struct drm_i915_memory_region_info regions[];
>>>>>    };
>>>>> +/**
>>>>> +* struct drm_i915_query_guc_submission_version - query GuC
>>>>> submission interface version
>>>>> +*/
>>>>> +struct drm_i915_query_guc_submission_version {
>>>>> +    __u64 major;
>>>>> +    __u64 minor;
>>>>> +    __u64 patch;
>>>>> +};
>>>>> +
>>>>>    /**
>>>>>     * DOC: GuC HWCONFIG blob uAPI
>>>>>     *

