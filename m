Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1266F1A71
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8C10E11E;
	Fri, 28 Apr 2023 14:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53710E11E;
 Fri, 28 Apr 2023 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682691955; x=1714227955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JwRIBiz+Fkjt4IFmX9EeZXy9Fe1LOccxJCt/GKXM/bs=;
 b=jWy/bH8LmLvbsr7MzBJGMUAyO5K2F2OMRXYIXXjCEeIaKVW65+E9Z76Y
 11LayllGY7VRGpSVY01TzzQvmhfwj2CpHFAmw34M6ozUIu4GhDpU+TruJ
 hgfaD/girfHeCfdaa+lBfSCwzzJd5d/ZdcauAuGmSlS6wNLi2cLaau+Vt
 PpZPhdgJ3pQqcmAzXgJTru/WWu/V7AiJM3rFmUsweNUUaPLQ+lE0jMWvx
 HX3eMKBBmx3y+XB4RlxgFcMyU3atL2gSDUbYXlalFBroOgKi5PdS8OQqj
 dkSHXTzt8chXYk86sXmCtI0mbXc59eLMf6hfUkA2EEyNV684+hrpIpCHV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410859134"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="410859134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 07:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819029880"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="819029880"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 07:25:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 07:25:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 07:25:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 07:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXuSK7lEcSiT1v+SIAznXNPTG0Ym/+z2UVoRf4eB9cWmJ5iUZ4fyjkeAzOhUP6FUNQt5PRG6Nv/zr9w9R3203dHiNF3B1d4D2a7e1ZPioPafayFKISdHJ2w7KXr1YXaUjG8mAo7DUdi4Vz1oOMlZw30AV9SjfwTq91wBUA3hFgErJBf+I0yO/kIU2uQsCDLzVGZI7xIeZRJ/yLsl8BbdTQCpAg1Dc4i5tJohqwjcFZFXUES7F5rmQ9t07hn4APZ+oLzzgCyKHbrF4WFdr+SGhnEnHNznuPytcQOsMdRP9EZBGixqtZWXog6AVzTeLvTo7rMq7IEGCjS532/SD9KFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4henntU9qiOnaIs3SJC4yytx+Zt4iSQ55ZMQOb3XbA=;
 b=Zrlo6PIbSClN5hD4dNA1Ui1fAyl+bcfetuWhFb6tb4c7bW26SGjjOsVf1t3muz4/4rntPhvyigevW6h80H4XnvKudmXYdhk3dWULHDYJhsbl1dHlkBRg4Zz3h6ABVETTiEp5R2lspjYcMWgQt0ZCvZRVIVvzmSrMcjSfU+EKWNk7DKMaemofCswUX8cEG5y6uO53Dc99dEFvv5f45QG+oTk6tv06v+/pp8ueO9XAjmPa14ssfSs1UKwBKDDVjjfhNUh3iqXVi9oLTSkAAmgABDA8+xLFnMTRbPMycwHghvYcs3U/BvARANjV7h+RxHWCnL8TiiC851GNgFQqKDbwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21; Fri, 28 Apr 2023 14:25:52 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 14:25:52 +0000
Message-ID: <7cc5fec6-3d4c-328b-6ac3-c7c3b1368a57@intel.com>
Date: Fri, 28 Apr 2023 07:25:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: HuC loading and authentication
 for MTL
Content-Language: en-US
To: "Saarinen, Jani" <jani.saarinen@intel.com>, "Ye, Tony"
 <tony.ye@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
 <9215760a-dbc4-16e1-6856-e9966992a231@intel.com>
 <DM8PR11MB5655599E9FE225DFFC35FC87E06B9@DM8PR11MB5655.namprd11.prod.outlook.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <DM8PR11MB5655599E9FE225DFFC35FC87E06B9@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 436205f1-b16d-4126-ee01-08db47f4782f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hr1QldRMEI+sIGrwzeeEkYwLB76IdBjNzE5dWkDUu9VwIqZGjvYalZLqzfwkPySokPPsZG/Hl/tDQydI1HFbjHYSYMMIxm/u96aFUX9MkrdkUKKCEUHvKM9NodABpkdZ0jM5b4z/R4SDJHum4qKVhSJetD5zydGm2pUrbwpCkayQbh+lRIzvjzL1zE1OHfpplc5VW1HH5AUMnhiN++9pkLuMBTQYxDVwxEgBv9UrdxFAvrYpeggLKlw6Pw8FYzjWmEKuWsH9tAdEkzlAL9MZjlIcCnx1AAO5XEHb/5BVdwB2pg0B4eGjYd1QCOYQywCayTMbyaoqh6hz7Qnn/DYEOu6DD64dcl9kr+Et5auh7qA7rv5OsLFVNa5glytJt7HhLI8ydelyzgpgj2Ogk0Db7/3rcmLnW7oI/d15+QpjmRFsjMsNv3HhDjZ/RNjJ4F/Skv1p/QS40nirWUt6X3s5ZWpXyKtjQwiQ0I1LsEghpu1bux03nrDOaAtE/QkR9BaCFV+DDcANbsml9lfP8FQngI+StneZVBTKj+1znaX2VNZqlrUakhtCqcU2yptKU9JG9miVesL8JeJCoB4HXc1QHYmuh0D+/DAbuSE8TtQ2/4ztE4NLjyXkW6+Ldm7sv9Br
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(54906003)(41300700001)(66476007)(450100002)(478600001)(66556008)(66946007)(110136005)(8936002)(5660300002)(8676002)(4326008)(82960400001)(38100700002)(316002)(186003)(53546011)(83380400001)(6486002)(6666004)(26005)(2616005)(107886003)(966005)(6506007)(6512007)(2906002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlM0TGZ0MW5iQUY3VWtjWHhrckF5Z1JTaFhhNk15TXQxR21SZUt2UGtJeWVU?=
 =?utf-8?B?SUpVS3FvdnZDenZXbWwzWERvdlFocTlPNUtQMzNkYmdubHhBdWhuMkhaeUZw?=
 =?utf-8?B?VkZyQmdlNXlDY2hBQyt6bEdtYTdqekRER2JTbkNqeDhNMkhHNkhybDhmdEhj?=
 =?utf-8?B?MGNTUFYwOWpZQ3pTeWVTRW1YU2ZtVGVSaXZVVEdQKzg4RG9TYlE1NGxYVHVD?=
 =?utf-8?B?SVdqbGZ4c2lZNit6WEQrMElPRlNPZkFQc05LSnRvRXgzOXhseUtuWDdIY3Z4?=
 =?utf-8?B?NGpFL2pvcjR5bEVpVXlOeFpCTUhEeEd6cXYxU3h4V09Hc3ZQMzZDaFJnYkxH?=
 =?utf-8?B?QTMvN211TjdiRUo5MzlERzdibHl6ZCttTi85THZJSmQyWk9oQ0VYMDB6Ny8v?=
 =?utf-8?B?UmhXTW82M1ZBRXBPM2JHRnY2Qi9rUXFHYTIzOE9nL1AxdllodkthTFluanQw?=
 =?utf-8?B?WjljVUxqQlFrcWdaS3JJMjNHNmx3bHhDd3hJUTVNVW0xclloSm9uZmxoR2po?=
 =?utf-8?B?Qmh3K0UwVXExbXd6RmJuSHhPUXlpenpTWFZhaGRMa2crb05hejdBcnJacEdO?=
 =?utf-8?B?eDJ3N1E4NmU5S2VnMWtGUnBucUFTWlBLRXkyVVFRdVFVQmxSSTN4N3pOMFVx?=
 =?utf-8?B?ZzJwU3pHTW9JZ2JvSHNNelphODFrRnlEMXdZVW1DL1R1NkZIc2pWTjZtK3lB?=
 =?utf-8?B?V2tOUEI0VlVaVFFqc3FLMlI4Uy9RUkpvRmYxbHNMVWRXdGtGZlphakRJQkZZ?=
 =?utf-8?B?bjdhZ0R5SkxOa084QVhJSHcrU0UwZGdDM3NZWXRQbUkzSk9rMytDM2ZLelA5?=
 =?utf-8?B?R0VCMDhkSzNLcFQwTTNnVlhRMVdQd1cydWlIbGp1M3RORk1TcjdBUWkxWmNq?=
 =?utf-8?B?dGRCSDZsVnE1TWFzZkROYWlqdFJnNWQ1bzRQOUdneXlqSVVpd2FldVc2VCtS?=
 =?utf-8?B?VUt5Z3VJdFFIODA2enBadGNpRmljbzVlQjFNZ2Jkalo1U3hhWmt6UmoyV0JI?=
 =?utf-8?B?cTFTamRySmU0RjVKY2hwd3Rvd2RQREVSZWhKTjdvNzBKait6eHBBQUdDM0dp?=
 =?utf-8?B?Sy8zNFBvRC9yWGhIcUJ6THVTWFUxYlY5bzlmdjlXcEI5ZmNGQ255dlRvS1or?=
 =?utf-8?B?VW9kTE5Zd09Hc3NUaUZ3ZUY5bE1TZlg3WklIRnozWC9XQ3ozSzN2c3NLd2Fw?=
 =?utf-8?B?VEpZTUV1ZHo5L2ZSWWY1MG00OGxNNnBJQyt0TUduZHhvWHUxcHI3U0N5N1A2?=
 =?utf-8?B?S0lMbU5reDExZUFhKzVCTnZlZFBTUFBpaU02NnY3d3pwZWhmd0twSmtQS3Nx?=
 =?utf-8?B?bE9KSTRYc1JYL0JBYUZTUnhHV2NtL05YamdwM2I1UmVTUmhIa21QRDhPcVRj?=
 =?utf-8?B?WFdJejFBaklxc1FUTlVrZXZQeEZXQ1A3VkZuRmRuWWp3dkNBdTJoQ0lwYTVu?=
 =?utf-8?B?T0RWZDNERlM1cFpiQ0RGMjhUdjZYSG5QOGdyTmpLWks4VFI5NmRDeW9oRnNE?=
 =?utf-8?B?TnBQRk5JV2djK0lrbnFNb2RZZ0QxUHlJazBTWitFVlBrUkR1eHY0bFZmeGVi?=
 =?utf-8?B?Z1llVkJMUVRaZVhmSHJvUE1BK2JBdjVKN0tOREFhait5M1dKbGlOcENVUG0w?=
 =?utf-8?B?VmN4MGQ2dVRtQUZabDF4RWYvVU10Q1YrV24wVk9sZGtjSEF1T3B4elNKV2x5?=
 =?utf-8?B?RmVsc3kxWDRETXEvT2pRQ01BRkhEa1dBSzZQOXpPbWU4bEN4aFdaL1JmOXBC?=
 =?utf-8?B?R2NkL3JHb2o0UWhwQ3ZuR1U1SzlWMGhuYy9vTnJBN3ZkcWFLaVk3WHdNUWFw?=
 =?utf-8?B?ZzNYYUhKcTdydFppdUlWN2tEYUtzbit3YnFWSHVaaW1aU2Q2Y2VHZmdPd3gv?=
 =?utf-8?B?NnJJaWE5b2dkZUpRdDdpM2hrcWhFQVBOOUFkRDdYYmNWajI5MWJKVCtJMkZ5?=
 =?utf-8?B?dkVMZlk0WG9DSUJPbTBNS0pkMVV5bkFCT0RLZEs4MlpRUmwzUXlvVkMrQVpo?=
 =?utf-8?B?WjlUN1J2UXBEZTFzTHNucGdONmEraEtYVVJIUDNaeHVVZWZZOWtiMDZYekNX?=
 =?utf-8?B?VlhVM2o1dDVKZFBGK3VSZUpzVDVsK2hFSVpIcE1nRzQzamJsSTh2NlhJZ2hm?=
 =?utf-8?B?RGhWZGdZM01Ha0tTWWdBOGV0U1RvL3AvZHMzN0FKdlJaYXFDT2RVNkg1Vktp?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 436205f1-b16d-4126-ee01-08db47f4782f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 14:25:51.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h3E+82/Z9u1VWqQyjrw/1xauolS+G8QMFRb6PGdfof8INSb2BWfvybRx1abrO/NZlMaIx5cKL2g6ErDuj1CJ8SGtbfCmBlb3IVFMwX3uGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Zhang, 
 Carl" <carl.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/27/2023 10:25 PM, Saarinen, Jani wrote:
> Hi,
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ye, Tony
>> Sent: perjantai 28. huhtikuuta 2023 6.11
>> To: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; intel-
>> gfx@lists.freedesktop.org
>> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
>> devel@lists.freedesktop.org; Zhang, Carl <carl.zhang@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: HuC loading and authentication for
>> MTL
>>
>> Acked-by: Tony Ye <tony.ye@intel.com>
> CI results would be also good to look at before... https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_117080v1/index.html?
> For some reason no single MTL tests and many aborts...

Is there any way to know if the MTLs where just offline or if they 
failed driver load? This is working fine in my local MTL testing, so not 
sure what might be broken.
Regarding the aborts, looks like I have broken DG2 reset. I tested a 
previous local version of this on DG2 but not the latest, so I must've 
broken something when refactoring the code. I'll figure it out and fix 
it up.

Daniele

>
>> Thanks,
>>
>> Tony
>>
>> On 4/27/2023 7:34 PM, Daniele Ceraolo Spurio wrote:
>>> The HuC loading and authentication flow is once again changing and a
>>> new "clear-media only" authentication step is introduced. The flow is
>>> as
>>> follows:
>>>
>>> 1) The HuC is loaded via DMA - same as all non-GSC HuC binaries.
>>>
>>> 2) The HuC is authenticated by the GuC - this is the same step as
>>> performed for all non-GSC HuC binaries and re-uses the same code, but
>>> it is now resulting in a partial authentication that only allows
>>> clear-media workloads.
>>>
>>> 3) The HuC is fully authenticated for all workloads by the GSC - this
>>> is done via a new PXP command, submitted via the GSCCS.
>>>
>>> The advantage of this new flow is that we can start processing
>>> clear-media workloads without having to wait for the GSC to be ready,
>>> which can take several seconds.
>>>
>>> As part of this change, the HuC status getparam has been updated with
>>> a new value to indicate a partial authentication. Note tha the media
>>> driver is checking for value > 0 for clear media workloads, so no
>>> changes are required in userspace for that to work.
>>>
>>> The SW proxy series [1] has been included, squashed in a single patch,
>>> as some of some of the patches in this series depend on it. This is
>>> not a functional dependencies, the patches just touch the same code;
>>> the proxy patches are planned to be merged first, so it is easier to
>>> base the new patches on top of it to avoid having to rebase them later.
>>>
>>> [1]https://patchwork.freedesktop.org/series/115806/
>>> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
>>> Cc: Tony Ye<tony.ye@intel.com>
>>>
>>> Daniele Ceraolo Spurio (8):
>>>     DO NOT REVIEW: drm/i915: Add support for MTL GSC SW Proxy
>>>     drm/i915/uc: perma-pin firmwares
>>>     drm/i915/huc: Parse the GSC-enabled HuC binary
>>>     drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
>>>     drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
>>>     drm/i915/mtl/huc: auth HuC via GSC
>>>     drm/i915/mtl/huc: Use the media gt for the HuC getparam
>>>     drm/i915/huc: define HuC FW version for MTL
>>>
>>>    drivers/gpu/drm/i915/Makefile                 |   1 +
>>>    drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
>>>    drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  22 +-
>>>    drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
>>>    .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 +++
>>>    drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 424 ++++++++++++++++++
>>>    drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  89 +++-
>>>    drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
>>>    .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
>>>    .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 182 +++++---
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 214 ++++++++-
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 120 ++---
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   9 +-
>>>    drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
>>>    drivers/gpu/drm/i915/i915_reg.h               |   3 +
>>>    .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  14 +-
>>>    drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
>>>    drivers/misc/mei/Kconfig                      |   2 +-
>>>    drivers/misc/mei/Makefile                     |   1 +
>>>    drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
>>>    drivers/misc/mei/gsc_proxy/Makefile           |   7 +
>>>    drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
>>>    include/drm/i915_component.h                  |   3 +-
>>>    include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
>>>    include/uapi/drm/i915_drm.h                   |   3 +-
>>>    33 files changed, 1428 insertions(+), 134 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>>>    create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
>>>    create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
>>>    create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>>    create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
>>>    create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
>>>    create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
>>>    create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h
>>>

