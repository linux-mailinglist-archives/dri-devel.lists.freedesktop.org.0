Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC419553FF2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D681133DA;
	Wed, 22 Jun 2022 01:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4021133D9;
 Wed, 22 Jun 2022 01:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655860611; x=1687396611;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XTLv+URxZVT7PiwF16d8kb+if/J8DyO7sD1d161olXc=;
 b=VFPIM+OQa2ZnjrTYlfUPPrHAesOpMHI9P1jq+3epnwf4bEALG6RQB4yr
 i3cOz0vDNwty4w3KTd+Deh9t+TidFs35S9/jhR8a3PttE3TXFL/PAAfWn
 i6Vo9NxfL65QcYa5M1DfSORSYANAIPJH+4Sv+8S+iOHJH2TnZNPArwS5q
 i1qz9sg8CtHaWW5uBNrZJivtW03vvvmKeHHzJKj0omu++dY91vjR54O+s
 BoH/f/Wm4EInn2ESco/W14qW7BaXQfho7/OT1jq05tQ4FSoV+CCTo4II/
 VoQ3NHrb4OFHGoBQXsCTWzhivYBdo6XMbBhQ7qQEyHL15c+2q+q/W0Jpd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263314710"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="263314710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 18:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="677275929"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2022 18:16:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 18:16:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 18:16:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 21 Jun 2022 18:16:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 21 Jun 2022 18:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzABG3J+7BEuaTFeCvIjN4+lfSk3enucounl8nWoJCflS+1XfB5m/yNbSljvwHqXjVGydWhP0Kkf21on6qySQD64XzQiXAMxERjKZFJ0DgReHSkLiZfG9qU3hxSR1A1NCu/A8ZsreGGYD2srGO3A02niQXjAqZNgQd1sA3DSBOP1+Xq6kiPQGsYbBQ7oQIhDckaNosvFr1z6d2R9Gi6gZQZ855bidoS0urfiARryncam5eMJfsnN7zePCKrOpP27VpRzoAXL+0Rvk4HO3T/iigH5NlTBZ/mPgiUzoxJ2SnjdlSxszHHz1n2bGQTr/8iuQ+YbCpaJoK8Y9NnIe48hLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYRZc1PlwhHNGvkqKRFgJvaqmQ8Ai8zi7hB9W5HrMEU=;
 b=LpgcycW6ZTfw3wHbE4+PYz/R4EEL0lG6qW1OIrJGndetMVBg4szb0dow8IMC87WOpREIL8ow9AObi3O8YriYCRUYQ0g2iZrt7A7DbdqKb2GhFLYubf9rVsKUOpfhJbXJ0uAvqLDr+n1vK39ylidZcYr4I4vAKD8W4rNeIAa9E1snPtTWe/gNVmnzVJ7HQz6A5gvfR/GFN47aUhq9F4rYRmk/eadvJm0oIp3bhInU7GRbfiW3fqY6I1ZZhVrZacD1TIKcGGXMCbSmwioJUV2DMoe8xR+aksJdagXy9Z2tQK3pw1sll0M9+mpZTKyEo+3oUmIrEvN5Gvea4BS0eEHUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR1101MB2091.namprd11.prod.outlook.com (2603:10b6:4:57::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Wed, 22 Jun 2022 01:16:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::468:a5f:1b4f:8d7d]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::468:a5f:1b4f:8d7d%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 01:16:47 +0000
Message-ID: <6ce1e11e-4128-10b5-f5bb-6054d3a68e2e@intel.com>
Date: Tue, 21 Jun 2022 18:16:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: ADL-N should use the same GuC
 FW as ADL-S
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220621233005.3952293-1-daniele.ceraolospurio@intel.com>
 <YrJjefR67IzdYrwJ@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <YrJjefR67IzdYrwJ@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a1333fb-51c2-41b8-508a-08da53ece06d
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2091:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2091E8AC04AB4F1927FD2A37F4B29@DM5PR1101MB2091.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/FiNbtJ+qtj+S2xnqzlbBqE/U4FE1Tu+PJb4tl+kE5nmJlzLPx8OEKu0pSJfH1uY2MUvV/EYAF1HBU110INeAGtgPrMvvKqSQ6nrqH/ZiSH/tLszd1nMlka5N5SOAWM7C2XQBID3CV5paD4Zyw1w1gAdpNybmx4Ib+5cFWlKrG89LhrTZbwGqou1tKoEDMe2obKRihreSgJaiFiy612ONukAt7On0MlHZ1Aoi+uGM9Czlx6AMFPGqqTzOQR9IY7iaTj2RFHZSxesDPu9FLW6mqqOnTcfMqkPpBs2LgWcH5z0KieUBxK1foG8o0Z8Ow2TUhPd2I0sitIgJi4RTXp51FuUJcBCNdrxJptUpQO0lmcr89uzMTCE5vLfl56eqCCUTvCSPuzBQlvkXWSfQvTWZmkEfq9xjVg/fFxexEUvXRYX0ZMRqYkLbqNlF8hZHKzRl1KJ6qQWbec/9IK1OQxYiOaEgvPvCk0aXpu/MbPw+Vpjp6MN0c/Ou09qHYOMb6+G9vUVaI/JyC5o4ELyWhCDWtq78oRaEkEjuMzcSGqxd0GI9TKGmHGSTYMfMzILrAKZhaJY1lsw3xyen+kAkGUyaOrK5q21pnJLeBkCwDTpMjT6l2x5gWIjFjJjSgnbwUpVohe9fDH7aKledts9eCb2MGZO3aPplfpZc8SVuBjsSdmosnjLIfKfBsgpw2xajH+v/+gapd10M7wxx+Zl4TO8Ly9JZwGmhZD/RdZCqLz8fI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(346002)(39860400002)(396003)(136003)(53546011)(26005)(2616005)(31696002)(82960400001)(41300700001)(6506007)(6512007)(66556008)(6666004)(186003)(38100700002)(31686004)(8676002)(66946007)(36756003)(6862004)(66476007)(86362001)(2906002)(5660300002)(6486002)(316002)(4326008)(37006003)(478600001)(8936002)(54906003)(450100002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy81OTR3Rm53ZlVrUnFMS1RxL1lZVHplaUpmKy9CRE5CeWtOYXYrRGtlek1y?=
 =?utf-8?B?d3BaWWxZVno1Q0U0bjhhRnFlUnplN09pbXkzTFdyU0RtSzRJdjQySEc5UXRE?=
 =?utf-8?B?NG9sODBMWFlYb0tlWnZCZXJHM2Z5QUVZZnljb1lQbzZBYm5RMUxvcXFZSFdD?=
 =?utf-8?B?aFlEbVJDMzlPZkpJcmEvOElmdnVtZXlZdkV6N1NDSVZvYzFHVEtuK3JsQWhy?=
 =?utf-8?B?cWFOQVdNZUZJSDltYnkwcndTNnFXMGVVRkZoTDcvcG5xZ1lEMCs1bFJpeWpy?=
 =?utf-8?B?SHo1b3NsY3d0WlhIWkkySFV3d1Q0UERZaGhyUXdGN2pnYlgxdHR1a2M2RTV5?=
 =?utf-8?B?OTRzL04wWXJDNlZlbUVtN0NBZ3ZTZDBVU2RVZjl4SnVaSlp5QjVFc1lRdHpY?=
 =?utf-8?B?ZE1HSXIrVFpQT1RGZitjRDhZanVFQXFNeGlzcFJ3SHF4VFFhVjNSLzdqMXpv?=
 =?utf-8?B?U3BWblM1MTMzY000NzM4VFpJSGFuVGh5SjFvNzkrK1dCMmFiUFEyWThEYW12?=
 =?utf-8?B?Y0hySDVDcEowMGQ3SFdJQjI4aGNtN2FqME9oRjU1aEZZc1pmNGtPVytma0xy?=
 =?utf-8?B?N2l6RW5JMytzUzJPTzMwR3FJUzFlU3NKTEFyc3VuQjN5a1BiYXBCU05HQzgw?=
 =?utf-8?B?RnJ4RXJsYm1kQURwd0Q2alEvQXVxdkhWc0diVEZnV0Jrb0s4dEVNbW1KSFJn?=
 =?utf-8?B?UEQ4SlMvNDIzMzVONVRaSzQweGhJLzVTUTRSMkcxNHRUR0tDOFVDOWdPQWth?=
 =?utf-8?B?K0dwQy9NM3BVNUN3cGNQbWc1MGJMUUZHa05MdVowQWZmbGtEaVUrbU1mVDFm?=
 =?utf-8?B?cFFZY1ZSNkFXOXRsa0xrQmhGTUJNWGppRHloSENxVHNTYVJkby9ZOHpNMlda?=
 =?utf-8?B?Mi9XN1M2bTRwaHA4ajZLbEoxMjVIUzIvSWdtRndiZVZudEQwdTBOeis3UnNH?=
 =?utf-8?B?cHV2ejBINGQxTkEyeldaN2JhbWQ4NGZxNkUzVzFDd0VvK3JrSjFwY3oxV2Z5?=
 =?utf-8?B?QXQ5U2dJSjd0SVVPM2thUGRrUldwdnJNMzl2T284SXFUVElwYXFmbmM0RXFY?=
 =?utf-8?B?b0ExUUZaaDRZOXQ3NFVGU2JOaXNGMHBxQk5jSDJHWWowaUlabjJuaDVpcFF2?=
 =?utf-8?B?ZSswcG8wQW91ZlVSMFJ6UGJYZStIRUhyQ0dGTUh1VlgxamdJbks4Y1ZhNjNV?=
 =?utf-8?B?enJjWWNUV0Q2RjNPc3RUUWg5bmxsdkFIQWJTYVcwbDR2VStlVGtYVG5VKzNs?=
 =?utf-8?B?MGZRY0xlMHRSM3JjYTNqOFA0THM2a05tQjYrSlBkdXRudWZMWEk3WWFHTHY3?=
 =?utf-8?B?MUNoSTdYTnZWVWFubzBkenFROUdjRUFLMkk5cFB6dUx2UE02YVZpMHQ1S3N3?=
 =?utf-8?B?QzZOcjBFaG1MZEt2clV0WWRjVGxXcUNhZXdlTUI3Tm1LeFFZWlV1OEtKWGNP?=
 =?utf-8?B?QnJDZm1lQjBaRmdPaDNUbko2Q0lNcUF1eGtDQjVJZG1DSXQ3RGZPNk5zM1oy?=
 =?utf-8?B?NVRvN3FwM3RtYkFOdEpEZll3cDNERjY1MGZpUi84MjZqTGdSSDJhcE1obXli?=
 =?utf-8?B?R0F5eHlheTVYK2lNQmg0cGgvTUZNOVc3VTJ5YVJmSUd6UHgxMnFaTnorV2oz?=
 =?utf-8?B?VEF2UHNKaXNzSGUvUEVOSWo3L1RJeEsxRHVweEhRZzdBSEpUZDExMjloRkVP?=
 =?utf-8?B?V216bUU4M29yZ1Vhd1lrb0FSVDh3N0lKcEdDM1dacFFuUjBOQ2hOZ1k5SXFE?=
 =?utf-8?B?aEdTR0orbUtZMVVkSHAyTWJvVWZTM2hXMjB2dllHMkt4c2UxNUZjK3pvVkxp?=
 =?utf-8?B?bnM2aE1ucG1BQllUUFB0NW1zYjdub1BjMzRpOVFTVGxBZVhBYUlldDFveXNK?=
 =?utf-8?B?aFU2L3l6eEx3WGJodFJRTkF1Qm52ekRGUzdqWCtBSEk2WGxHbG41aytFUG5L?=
 =?utf-8?B?UFZsa1plNVZuZEtGTDltL0FoUjkxRyt2ZWVVY0dldlhaa3hhdXF6V2dMbGFa?=
 =?utf-8?B?TjhUNVY4N1ZBbnovODQ3Rm1VTmd1Vm9GK29qMEorWlZQNVJ4d1hQTkMxRlB6?=
 =?utf-8?B?MVhxeXlteVdOaTRCM2llK0tQV1FRYTJaZDVxZkd5bVJXUnFSczBKV3hjM1Yz?=
 =?utf-8?B?amxJV3A1cUZBUDVSRWFQZFRXaVl1N1RPUTI5K2w4V0dLak1SYnZXNy9CQU9O?=
 =?utf-8?B?K1E1S1pzN3BDLzFTOW0yeEF2Q05XeWZvRXUva0Yva1l2UWpiTHMxU0pSRXlh?=
 =?utf-8?B?OU9XYnZaNkxGUm1LbCtjOVcyb3ZOSXJ2QjJiejBIYjY4emNFV3dkblZFbmRB?=
 =?utf-8?B?VVhvZ2NXajJqUTV6Q1puRUxucThrMmlaQk5OVm9UeHpoTUJ4NWtqdWJUNDQ4?=
 =?utf-8?Q?UVvziQNE+kYwRR4hOcsIeTiUG1mco/FYdHOHd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1333fb-51c2-41b8-508a-08da53ece06d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 01:16:47.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncXnsUaWNN680BDXXU7+TqPNAlVJBKifZNN+T+4yuRlA212nCKjc37cENNy9NJCBpikB9tpJtqs15AVbqqvGICr3CJdn3JNCrfp3wj1h3r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2091
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2022 5:34 PM, Matt Roper wrote:
> On Tue, Jun 21, 2022 at 04:30:05PM -0700, Daniele Ceraolo Spurio wrote:
>> The only difference between the ADL S and P GuC FWs is the HWConfig
>> support. ADL-N does not support HWConfig, so we should use the same
>> binary as ADL-S, otherwise the GuC might attempt to fetch a config
>> table that does not exist. ADL-N is internally identified as an ADL-P,
>> so we need to special-case it in the FW selection code.
>>
>> Fixes: 7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Would the config table still get used somehow even though we return
> false for ADL-N in has_table()?

On platforms that support the config table, the GuC does always try to 
fetch and decode the table during the firmware init stage, even if we 
don't query it later due to has_table() being false.

Daniele

>
> Even if it couldn't be used, this change makes the behavior more clear
> and explicit.
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index d2c5c9367cc4..ef2d10184ee2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -162,6 +162,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>   	u8 rev = INTEL_REVID(i915);
>>   	int i;
>>   
>> +	/*
>> +	 * The only difference between the ADL GuC FWs is the HWConfig support.
>> +	 * ADL-N does not support HWConfig, so we should use the same binary as
>> +	 * ADL-S, otherwise the GuC might attempt to fetch a config table that
>> +	 * does not exist.
>> +	 */
>> +	if (IS_ADLP_N(i915))
>> +		p = INTEL_ALDERLAKE_S;
>> +
>>   	GEM_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
>>   	fw_blobs = blobs_all[uc_fw->type].blobs;
>>   	fw_count = blobs_all[uc_fw->type].count;
>> -- 
>> 2.25.1
>>

