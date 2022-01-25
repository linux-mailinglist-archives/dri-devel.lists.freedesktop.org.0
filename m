Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D000949B403
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 13:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55D610E40C;
	Tue, 25 Jan 2022 12:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3F410EEFA;
 Tue, 25 Jan 2022 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643113853; x=1674649853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u9AJTqvXCP97gVrhYGyjcB/kRhTCPVY1IaX3HPBtueE=;
 b=jM0ndWdASxq+35DyfKOksYX5k0qJZh/ywKhpwqMXo5wedGnN5nyTd/9g
 dGWunR3yJGo3GSx+5xAS8Q0Uz7wDriU9/GroKqrGOwCcNEDfnDczXOBpU
 r0U8Mt/AXlmRM/s++tiWVvj+SdsKd/l2FdMhfu3/aks7tiFNySMdeOkZP
 bs/jX/ud7BOSwHtHYa8AtIPiEPFiD03VMo7pjnqOhfA9U5Lu/Cks+E3Db
 dW6SXrAl8b9Glphk5/FSDsXQHEJZhhEiQ7hSnxI3hSFLSwTrJFOQcYcJX
 kqlH8Jky4Hv/VriA2NrgTXjwMKwu3UJNN5ksBC4jsoglODPVSwH0v7/jo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="309605856"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="309605856"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 04:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="580735986"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2022 04:30:51 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 04:30:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 04:30:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 25 Jan 2022 04:30:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 25 Jan 2022 04:30:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AALngoRpB4xJMgJV7s9xjsPt69NCLfKt2ro6ebCmr2W6Z/9UYctvu5sM7LSPp9XIZhIfr1GeWFGVt1UiI6HxTL52Zgzjw2O7Loz0ePAq1tFCHr9RX/qJEcQpkNnRkna8Poy3PmCfwm7xrrnArjj3tQrS0jhFbS+Mf3/e77OPkR3qwPJR7y+per/9z4OLZOnM3uI009A9sQFWTxphJoWm9xPnLtY/oCaXqFslbDKHIgoV0Fqh3Z2iwksSLbr40U9CRt8qh2nGPnWYVXoCKAle8xsTR94dqQ3JtYkORbwhJhjbcMy6hZPZx4Odx1dwKNgwm6kVQmsm73eDGtX8cx5WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1TM5SjPpGHsAHmlTfJl0txCMb6VvvSmnnk4fG6nMHA=;
 b=C3cOR46HocGcJyfO4ooxztZnCoqtFgaxGaKoVxFAaXWQGGe4kaMgawgV0QoyFDY7yeu/zpmu9/52dHR9Lm9reVF5dMUAYox67OVXDBJ76CURsXugtPuxuPfhr3lXxh36f6RUbDs9+AsVcoxR6mJjJEEz4++yw41GytZfD4LlamHN8eg1durp5hpEYPO59l5z5BSgZpvQZlkb0JuvNY+h07gNCEV0x8G2SmD4ieaRh72+ptUj9msrDTAIegCCp0o7sFEsOVtlnG0sVfubEXgbnAVY9AXcWhrwACgt7WOk0LgR2fDle/zUb8wonJzjRYb9BYSQO2i+p1HQbLB9vO3dwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 12:30:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::8989:c0bd:dd1f:a432]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::8989:c0bd:dd1f:a432%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 12:30:47 +0000
Message-ID: <573030d7-d578-bfea-17fd-4d4eb1c01b96@intel.com>
Date: Tue, 25 Jan 2022 18:00:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] drm/drm_edid: Add helper to get max FRL rate for an
 HDMI sink
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
 <20220125085801.1025521-3-ankit.k.nautiyal@intel.com>
 <87czkg16sc.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87czkg16sc.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::26) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e08b33f-dd6e-4275-8f66-08d9dffe83c1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5055:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5055DDBACDD8E4D439B51547CE5F9@SJ0PR11MB5055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41yQZ3F4GMLCC8WeqBCj3RXyTem7qlCJNyOZXWtvpEtV/WNXFhwOESb/aqmkGsdrb/TolcTttUEUfC6oubcaSh1upynMF1HeUTHeXvxyKW5naPAFinaGQuqQmdjMf3kMjsc7amR5Hin/OpMROVd7ZhGFg5jDPzxVtdjMMvnBLsM/wKdRcB9BtjGo920cu/jSejjyKaKQRHPXk4gdcqKZ0GXDj4uckLz6G7BGwxm0rzCWk/a3QOppOGvm0bCsu5htAPQ9y7MzWybFTK1KXUFWK8cMCto/O+cbpAxDd7nXMnOOzKD9KsvxDPEIR+UMqC1LXPrQH6M0zEckuZ6MaM3yTHU9bR642qTLri8Ts8v4rOUItbttZ9fbYz+DGcGB3utg/IEsEW9TaZTQbJ3QxzXrecMx3AS5JdWcxwngAnL55TX+BtgUyN1Sd22bFAsroSH5dRbeW7WlGvtL3J2TB+VjwsgpS2hE5jbSXmC3YhsfLibO9umBgy/LnHXBBucc2jtlA012q1CLQ638xmdFm9PY9YJ1OZ54HetCqn5R12CWtwR9wmV01F6r84k/gx5B+gSZiBEkgtvM0EzbZjkeOrTBOBRH8xfWslk/cntqpDcnEbkDam8XD4pmZskbPbqz5rfjvKKQMF/znITPUEJqm873uG1AH+f6F2ibi5EsKXaWHbZX/yqDblSFkrVlP4JSGVFvQsOS+CaQ/tT4d7Ev2BYw13MuFyTCWjagcO6gQdvvXTYZlLrmLPj+d6KlQzHBqj2s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(53546011)(6506007)(31696002)(8676002)(31686004)(2906002)(6486002)(316002)(26005)(186003)(38100700002)(86362001)(55236004)(8936002)(6512007)(4326008)(66946007)(66556008)(66476007)(2616005)(83380400001)(6666004)(36756003)(508600001)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1UwaEkzTzkwc0ZLWG4zTG5iSHphZCtqZXcrOXlONm1hOE9USlBhQ0F2eDEw?=
 =?utf-8?B?WTUxUjRJVXgxY3FpcGo2azZ3TFFoVURsR2YraE5uWnROcFRwclRaWXQzNC9w?=
 =?utf-8?B?a2xaZFNoaW9uS1Jzei94N01lZjJGK2hOQ1V6VmdoNVNseTVZMGI2RmlTckI0?=
 =?utf-8?B?c1FPbGR6UFVSVlZqais1cTJlekNIOWQ1N0EzMmdBeXJVUHVJSE5UWEJZRGJx?=
 =?utf-8?B?OWxuREZEcUZEcW9oaC94T3lIcUdJdmJjMHlmdFNaWGUySkNuY0VHa0hiSEdz?=
 =?utf-8?B?ZS9IQU5HL0tCT2l2Uk4xbjdWdmM2OWNWbGN1UzU2dDRPbXd2cnJzR1JDVnIv?=
 =?utf-8?B?Z2xOT3VHbVRhZmh5TWxHK0Q4QkVkbzdNTDBneHdtVVdnWG9paDM3TXlObkE4?=
 =?utf-8?B?aWZ4UTlBaldQb3BHZmYwSzZyaTJyQTUvNmNNc051Q0NCeDY5bUV3aGdzNndY?=
 =?utf-8?B?bXVYeHhDbkM3emFReEEyQ1Jzb0NHUnBWWHZkVUR4dHJ6RE1la0I3ZDV4cytK?=
 =?utf-8?B?aXZoU3g5T0lUbTFCaEgzeFZLb3pwQmZmZTkzYUFNTmtjd08zTVRrblVlcWFX?=
 =?utf-8?B?dW11N3VQSG9rM1ArT2FPcDZSdEUvSVB6ZnYvaHY5NVJ0N09aL3g5UVhwcmdM?=
 =?utf-8?B?THJxcUViZ0FZTVRUV0lZbkxVaGdia3R0M0ZURHVNdWFTSTVOU3pYS01NL3Jr?=
 =?utf-8?B?bENoeWV4V2ZkaG91ZnpFQzk2dlZRNUhBUXlGUDBxWjlmK2JVWFFiVW1KWm1z?=
 =?utf-8?B?dXRUNjFQTjZ4V0VoSVdjVmtyejBSWlJ6OFVIM0VaZUNLVVcxSG9CRnZwTlhD?=
 =?utf-8?B?U1o4NW5DZjBLaVJ1ZkJGTGdKSVZpbGFtRDV3N2EvSUthSkJoNldZSzBZZVI2?=
 =?utf-8?B?c0ZXMnBNdkZ6YzB2VUJLS0RMeUlyQWxjazZEOGJxZXpUOCthN1R1RDhBUkhS?=
 =?utf-8?B?VzhEdWNKZ3J2eXlvRXF1cDljSk9sTnhUMHpNUVhFU3llY000WEg3Rzh2UEZw?=
 =?utf-8?B?U01MNW1yRW9UWWlLSjRUd1d5bE9PKzVxb3RYZlgxd2NISU85bzN5U3RGbHRp?=
 =?utf-8?B?TzNTUXVBVFFmeDZnVjdEWGx5VUZqTmwvZVdpWnF6VXVjSHc2VmowVFZvQTRB?=
 =?utf-8?B?ZVhrdGJmZUZnMEhwTUVJN0pxTVE4Tm5ybUlFdGt3QzRya1E1cGpkZVZZWmk3?=
 =?utf-8?B?YUZaUWZXbWVZa2pxMnZaRDVFd1VRVjF4NWJoSUtwaHN2RkpiZUpWeGJvRFJn?=
 =?utf-8?B?bUxVVHgrWW9XZmFwUE5HY2V6NGYzZWZTdCtxMWU3SFhHWkdWME9abE1JWDIz?=
 =?utf-8?B?ZVc5VnpFcksxNDVPejZoM04vY1J2UUtUNWZucTdTdytLc20rcXFBWmc5dDFh?=
 =?utf-8?B?VHZiNVlMTDJNVWZSQ0tiNjNpSzJqNVZ5cHVKN3RWNDFiTE55cGptdEVKMVBZ?=
 =?utf-8?B?NGJHYTErcGovWkRhQXphU081RzQzUXFDRERlRFkrcVhjamJkTng2ZmQyMmt3?=
 =?utf-8?B?aTRwb1R2U2hlZW03c2VVVlpNWXErRzA1NEJSRDFFc0x2N1VIeG1UTUZ5Wjhm?=
 =?utf-8?B?ZnVBM0M3THppOEt2aXJQSjJUSHpNUlhTek50RGRsNTdHMmpINzd0TlhtNTdR?=
 =?utf-8?B?UWZRdkdGVHVCdUUyWk0wV0c1aUpUUW15QTlRNysxR0lGZzRrMGREQ2NnWWNN?=
 =?utf-8?B?ZmV6OGlCeC9iakxZeG5kNytQRVB3Yk1MUVUyNmwxem14OUlhWkdsUUMvbVV6?=
 =?utf-8?B?NWFMK01jeFNwQXc5SUhOdVhIbkx6TlFDekN3MnBsNmE5em5BTEhiMnhHOGFE?=
 =?utf-8?B?amtoNTJsNUY5MllTbFBKcDJPQktXdS9KRDMyUzlVbWVSOWNPa2d4WnVDSGEy?=
 =?utf-8?B?LzVaSnRKdUR5TXlpWlYrc2VaNjdpQzRWWW1TVjh5Y25IZ2FFbkZrNmk4QnhC?=
 =?utf-8?B?RWM2T29PT1gwQ3N3ZkZjVkV4Tk5sbktJZ3N5ODZwcWwrSWc0R1RwWE02SjJL?=
 =?utf-8?B?THRQUUJjbXhFait6b0RPaDMxZ0M0VG1BeGVkWFlodlNLb1B4aXlVWUkySUNm?=
 =?utf-8?B?MFZOVm5TNUgyc3VoUXVyaC95WTJXcXd2bmV2eHdsQldMdXA4aTV3MVJBb1du?=
 =?utf-8?B?K2JKbGlUSEdZQ1VwK1hHVUN4QWtQYWZYenVtRmI1RmFqSG1QNlFXMktHZmEy?=
 =?utf-8?B?VU5HWG9vUEJUQXl2VWpXQzdDVUJ5V3JKUVVrMlVsSjZma0pzK0xBZGtGODBs?=
 =?utf-8?Q?AiSnzhou/vs3H3TJ6ZsGPa1zBeCutLOr9cjk7naxXg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e08b33f-dd6e-4275-8f66-08d9dffe83c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 12:30:47.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKbOMXg2fFbs1McZMEcP1o9DFL2XBEbmKJ8MCitcdUl5zjpcMP8Pneo5asnZ0dLh4824lxaMbxoCtZYCSsEHxMahHeaCG4Pbr1KImsBnyls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2022 3:22 PM, Jani Nikula wrote:
> On Tue, 25 Jan 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Move the common function for getting the max FRL rate for an HDMI sink,
>> from intel_dp.c to drm/drm_edid.
> The subject prefix should be "drm/edid:"
>
> But I'm not sure these functions belong in drm_edid.c though. If you see
> a function prefixed drm_hdmi_, this is not where you'd expect to find
> it. Not sure what the right place should be though.

Hmm. Another candidate which came to my mind was drm_connector,

but since the parsing of the edid got these values, I was thinking this 
might be the correct place.

>
> Please split this to two patches, adding the helpers in drm and using
> them in i915. It's generally easier to manage that way if there's no
> other reason to keep the changes together.
Alright, that make sense. Will split into two patches.
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c              | 38 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.c | 19 ++++---------
>>   include/drm/drm_edid.h                  |  2 ++
>>   3 files changed, 45 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index eb61a1a92dc0..75b538b4c87f 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6176,3 +6176,41 @@ void drm_update_tile_info(struct drm_connector *connector,
>>   		connector->tile_group = NULL;
>>   	}
>>   }
>> +
>> +/**
>> + * drm_hdmi_sink_max_frl - get the max frl rate from HDMI2.1 sink
>> + * @connector - connector with HDMI2.1 sink
> Do you need to first make sure it's a HDMI 2.1 sink? That's what the
> documentation makes you believe.

The thing is that, these fields are the one that helps us to understand 
if the sink is HDMI2.1.

Perhaps I should fix the documentation here:

drm_hdmi_sink_max_frl - get the max frl rate, if supported.
@connector - connector with HDMI sink

>> + *
>> + * RETURNS:
>> + * max frl rate supported by the HDMI2.1 sink, 0 if FRL not supported
>> + */
>> +int drm_hdmi_sink_max_frl(struct drm_connector *connector)
>> +{
>> +	int max_lanes = connector->display_info.hdmi.max_lanes;
>> +	int rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
>> +
>> +	return max_lanes * rate_per_lane;
>> +}
>> +EXPORT_SYMBOL(drm_hdmi_sink_max_frl);
>> +
>> +/**
>> + * drm_hdmi_sink_dsc_max_frl - get the max frl rate from HDMI2.1 sink
>> + * with DSC1.2 compression.
>> + * @connector - connector with HDMI2.1 sink
> Ditto.

Similar to the above lines, here also the documentation can be fixed.

Thanks & Regards,

Ankit


>
>> + *
>> + * RETURNS:
>> + * max frl rate supported by the HDMI2.1 sink with DSC1.2, 0 if FRL not supported
>> + */
>> +int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector)
>> +{
>> +	int max_dsc_lanes, dsc_rate_per_lane;
>> +
>> +	if (!connector->display_info.hdmi.dsc_cap.v_1p2)
>> +		return 0;
>> +
>> +	max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
>> +	dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
>> +
>> +	return max_dsc_lanes * dsc_rate_per_lane;
>> +}
>> +EXPORT_SYMBOL(drm_hdmi_sink_dsc_max_frl);
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 4d4579a301f6..f7fe7de7e553 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -2190,22 +2190,13 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
>>   {
>>   	struct intel_connector *intel_connector = intel_dp->attached_connector;
>>   	struct drm_connector *connector = &intel_connector->base;
>> -	int max_frl_rate;
>> -	int max_lanes, rate_per_lane;
>> -	int max_dsc_lanes, dsc_rate_per_lane;
>> +	int max_frl = drm_hdmi_sink_max_frl(connector);
>> +	int dsc_max_frl = drm_hdmi_sink_dsc_max_frl(connector);
>>   
>> -	max_lanes = connector->display_info.hdmi.max_lanes;
>> -	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
>> -	max_frl_rate = max_lanes * rate_per_lane;
>> +	if (dsc_max_frl)
>> +		return min(max_frl, dsc_max_frl);
>>   
>> -	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
>> -		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
>> -		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
>> -		if (max_dsc_lanes && dsc_rate_per_lane)
>> -			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
>> -	}
>> -
>> -	return max_frl_rate;
>> +	return max_frl;
>>   }
>>   
>>   static bool
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 18f6c700f6d0..5003e1254c44 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -592,6 +592,8 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>>   			      u8 video_code);
>>   const u8 *drm_find_edid_extension(const struct edid *edid,
>>   				  int ext_id, int *ext_index);
>> +int drm_hdmi_sink_max_frl(struct drm_connector *connector);
>> +int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector);
>>   
>>   
>>   #endif /* __DRM_EDID_H__ */
