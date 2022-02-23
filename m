Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88024C06CF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C2610E37C;
	Wed, 23 Feb 2022 01:19:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5B210E1A3;
 Wed, 23 Feb 2022 01:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645579155; x=1677115155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fWVSYqj98+nRKQzW8+ztwkUH8l20AhO2AsnufZoJm7A=;
 b=CCY+j8BTKAJYHXjq6WT1zpoZ3ycAbTiU68rw5gcAbhYI1pvppKCoE9T9
 y9H/HyfEOLmocwKNv3ozptGh60U0pTZW5EGDggJBQt+6hxTeaAiNRarcb
 ZB3hb3oWhG0pH7DeRwxsCoFvI1h4mLBe7yw9DVwMHUSGGiSFZ78VMg89e
 SQDykOgnMcOB+99imUgJcJ4tl1l2wOCb80gvsHiXFU/ZyG07zjXZRU+Ls
 bP5mJ/dkLp8x/JeWlI41U9miKKYa/CnTlE3LIg+2ulqt8uv5VPF4Amq0p
 chrC17YlN7NNX04i5qdNx7Zp5aNtuAGsrzHntIOOPgx87vQ2/fZXrsTKc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276468602"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="276468602"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="548014530"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 22 Feb 2022 17:19:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:19:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 17:19:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:19:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/vRCe9jefnzUwZuzlTA1clKfcA0GFNRIgczDPBw3yV9ygp2xpQiR/2D+J4Wn2tsulaER1wf4Nl+edb8DkIUc5UDej46trit1rwLM9DxE4NrJRaoRrJO+C79CQFNhZgd/HFkORE/4Hq8arTU7xbIZVqfb5ld3gWiwrvsfo/ildaEvD04dTKiAOcha6uHoSIh0HMddOzrtYc4tl5VJARqSIcsDaZNfhAQZ9rg83hFkYC2e+HgMHpVxcF2HEFzJeKXvLHhkAI6R9L/NR+A3ebCFsSe75tY0BNRqgaqXs9mbIwI214s3xapcxqZ29yNX50vpr7NjDggjVqlnpSPQIkBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALCB9aiBrsQ+OABk50BIBPDiZUsun2w9kBlTjJkyoKs=;
 b=QcTkW/0KBvuxP7fyV9ruvCN3r/8QTCLer7CckKiCvEncBEBaobz5Q9NsClBy+b65rYMlF5qsRzenebHWUQkxDWrefldOgno6/LZ5d5qT2V3JeF9jNsdjXqXDMsMoL7K757QX+mLwrT/tuzDN/3kIy7Fw70wn1fPUVTe0te/rXyDHb0rERkRvawAnRbueNSQ8Qxy0luQFT6JhShex8+XfE/dXj7/7GvrnICg5OuCN0wgK+xTyn37ZKlH3f/qUvFBThPVZ32iDquMRzpTAE3mmHU+lBp+//NPbFNoPcMHnq+dkfM1Q/CxXjcZgdSnyjLR6g0n2KqS6U74H1ABWkySRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BYAPR11MB2614.namprd11.prod.outlook.com (2603:10b6:a02:cc::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Wed, 23 Feb 2022 01:19:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:19:04 +0000
Message-ID: <c27c71f9-313b-60a4-d323-e7b05c50bf83@intel.com>
Date: Tue, 22 Feb 2022 17:19:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/8] drm/i915/guc: Drop obsolete H2G definitions
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-8-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-8-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e85dbc25-50f0-4d32-af52-08d9f66a7b33
X-MS-TrafficTypeDiagnostic: BYAPR11MB2614:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB261412AA2AF72DF6A81C584CF43C9@BYAPR11MB2614.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IzQMHOQKGYCb/9xPyWbcbZKgPxENGhx5NSjfePeigVCOPZhny6xE1TqEnh7llMUmnSAbEwb8584DcMlCEK81oOdO6rpaj33XlE+Lo77SxPGDVBK3Yd5PiMelgkeDUoGqpc37iA9DI/5fW+3/cWg9sUhqcqmdWIbA6z6VK3Ua06MZz1zOAf/3ziZ5M4ZnOOFGzWaHb0yg4yzLqCDf/8Xcc6sY8vKJwep96nKN7oDPiOTaZygA3/6XGN91ApWIuV5eexkVfMpEGo1TpIZCAhbzCpL/0rpGJFpTNLxUJz8SBJ7rub9WQchWPlbklr0QEAFGSrrorMcaWQk8xEUC6VS5EI/7o5ta0BJkykW+BfxHQewJ9C+yuZIiWFL5r19W2uklHz2GHOkaP1B/zh6KGfQzXzA4cO3KmjctVUROYRB22Hd9oLTJVB48nx3UsMU7vtcNK7KAEunkrf131jE2J2KftsafzitOT7kWGtQjLDGHOCEQh3v2u6RPAROs3oOXtMOkLiXoA+DSvT+TSROqFiMNCi6N8tOiUK6XgFPPp68PQvbxMsD4GWZ4bhmYAP9V5s27dlXHL6SPDUdcXegpE2OaIEU/CSUWEbqY9rSWirj81wSj4y179qHGZbAfInnJU3OgUTOuzlOBWRE6sGLm9SmPgW2b8q13OvOEoDLvZpMWEl18z7BPUWgE31YxHZnI05Hf9bqwClubAih8KT7AtcaWXwXa2cDyMqBRQf4Yuyw/q3h0jlRhC0hVd8Mw9pYXF68
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(6486002)(26005)(66476007)(4326008)(8676002)(316002)(31696002)(450100002)(66556008)(86362001)(66946007)(2616005)(83380400001)(508600001)(5660300002)(6512007)(6506007)(53546011)(2906002)(31686004)(36756003)(38100700002)(82960400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pxa01MZHpVZk9yWnljVTVvMnI1dDVxZndiV3ZrYWZKT3B1S0xHTnNsa2Z0?=
 =?utf-8?B?aWJNZVh0WGMrMmUwNXVTVUp2THJRNWRrWCtaV09IMmhkK09Kd1l3aXBIQldn?=
 =?utf-8?B?K2xqMVIzdGV3NUFOOFZnMm1NM2doTmhzTGFSSlhZU0EvN01RdzQ4YlBZU04z?=
 =?utf-8?B?QVA2c2tGWDdwd1JsMVZLNVdqUGMrSFd2eWlyNlRKYm9LT0k2QURpd1BhcmNx?=
 =?utf-8?B?VEgvWk1NREFwQ0YrYm5iNnh3WjhxRkthY0Y3MithdzFZYVZnSCtTRGR0TWlp?=
 =?utf-8?B?dGtqVU9kMVNBRUs4aUQwbUZ1bVJCZ05XQitSWTlaaVkwenhrMVBmbVcwTW1u?=
 =?utf-8?B?SE1xNVVuaFFYd3M5U1NhMHkvd2hNQVg5V2ZnQzRVOGdPWmU5ZWUvcmdCUnE2?=
 =?utf-8?B?YnA5V1hSaTEzY3BUL2huYk1za2pqbUJPbGNZeDluVWRBZjU2MkJjZTEwNDQy?=
 =?utf-8?B?aUR0T1Z1RFppdVgwZHBGODVKaFQwUHcxQ0NPQm1WakpqeFh2cGpGRS96azFF?=
 =?utf-8?B?MUFycjhyV2Q2TUNLUGpndVNOSTFWOU9ncDdCZnRxTEFCcG84SWdwd1BrUFdQ?=
 =?utf-8?B?WWdtcjFFZzBObFM3bU81YlhCVEQ4L01OcDh4R0NGTzB3SHZqS0JrdGcxZE10?=
 =?utf-8?B?VGRPaWJUVmNmc0RKN3pmdzg2MW9uZ2FneVNZS05peTBBNDJwV25PREV6MUFj?=
 =?utf-8?B?NG8zR0M3T2ZvcEM4RXZWQXE1Sk8zV1dqZHVCZkU0bzVjckhHSkZaZ3ZCL3hM?=
 =?utf-8?B?UGY0Wmp4dkN6eGZsVXloOVhhSDhGSlpiTHhKWXAxM2greDdJemtuM1lKLzht?=
 =?utf-8?B?MVE3ZUxjWXZyVmpJY1g2bnQrRFZBZGpoOG1URmFlU0QwRHk1ajVWN1VtZjZ5?=
 =?utf-8?B?ZHp4aTEvYmVGQVFkQ1Z2dWJjcmcrZlg3ekRJQi9Ramw5eUt6SFRUK1dnU0lk?=
 =?utf-8?B?WWxDYXJFNWNyaTdWd0poQTE2ajRSSXpvTnkwSVZ2Rmk1S0szZ2h4ZzJjeGNC?=
 =?utf-8?B?amIzOHBMQnk4Smk0a2FCSjVMSzBqdGRIRFMya0VDQ05MVEdUV2JVVEJSZFZo?=
 =?utf-8?B?Ty9aZnhDV1B5cjVFeUdZT0pGR1Q2dXAzNGhsMnVyR1Z5SlpnaSt5UThxVmtr?=
 =?utf-8?B?Z2RadXR5UFNlUTFONnlWTks4T3E5MktweUEvQXlyeEtsb1c1SGcvRzZaWTF4?=
 =?utf-8?B?djUzeFNyRkE2MmJ4MnZNWk5qZlMwWjNYQUk4amhoR0l1WlJaV2lDR0R0cHJS?=
 =?utf-8?B?REZlTTNkZVlmL2IvYWpGMk84YTFGeTFBaTBEVW5aOU5qTHBNWmVjeWszRGY4?=
 =?utf-8?B?dWF6aFFNRHRDNUE4dEZaQVlOanVKVmVFbGY1YXBzSnI0dUFlRWxnaGZzMFUr?=
 =?utf-8?B?WTZvam53cm1PSGJCRTJveW4xMEI5eUNGMFBZODY3YitLbTBOSit4Y3dhdWtB?=
 =?utf-8?B?VTQ2N1RyWWlvdlZidXFtcXJONjRZRW1rT09IMUxGcTlQaEZzL1U3MU5nY2JP?=
 =?utf-8?B?dVZ6clVFSHRsVnRuRUx3NWxNc0VNOXFSTmwxdjJMRWF2aHZ4MTVnMlRJMnZ6?=
 =?utf-8?B?azdsZFgzWmhtc2xpeWs1cWV3QW9zWHl1dUZYcjBvTDkvVkdneUllM2F0WUh0?=
 =?utf-8?B?eTZhUldKRlVkNkF2dkw5V3ZNeFZmOUUzVGpKQm5obk5WRlY4Ym54cjMrOU8r?=
 =?utf-8?B?Y2ZZMkJrK2xXRXFzQnNHd2NxSDBoU2J6T0I5SmxRV2M3VWZrNnk1aDNDbDBi?=
 =?utf-8?B?TzFUUmJzSXRjalBpcXBHb091U21Lc1o4VGE1aU94eE5DN1I0dFhBc3lJd2NZ?=
 =?utf-8?B?QzVqSnlodzA1VWhWdjU0MDZiUUl6ZXNpVldSdGFPaHZXczRWRzcrUUhrUXhT?=
 =?utf-8?B?cGJ0TzRDT2ZyVHNMa25hSXN6aTZhcWx0U1k4OFcvM3k4K05ReE9QZExMejJ1?=
 =?utf-8?B?N1ZVOGFXVE5ma1pjYU4wcDBPV1VoVFNMZWxnSm4va0tFbkR1SXR3ajV6Mnk3?=
 =?utf-8?B?Nm1FVHpMcm14WUc3TG5DR1BLT2hwWjBrcHVWeU1hQ0lzU1pMWHhxdngvcWlS?=
 =?utf-8?B?cEVhWmcwa0orRTZMU1JTY0xrNHVOd0pEc25WM2kyNTMwY2JiQ3A1azRDM3Jw?=
 =?utf-8?B?UjViWld2aHJFRUwwcUlQcXpmODdFUjJ2dXd4UW00bWJld3ZLNnJJSkp0YW5U?=
 =?utf-8?B?TnlrR2IwQTRvOUczbXpNVTA3OUJMYUtoRUpDNnN1WGNyV0dKQkpSUmNPbmU5?=
 =?utf-8?B?SEhzamVmTGRGVTllRFRLVHdYU1hRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e85dbc25-50f0-4d32-af52-08d9f66a7b33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:19:04.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auNiel/9KzLiYGeX16z9e5czm22rwk+9EoNXdqX3ofc/5VAa10Z6DJCKwk/nQ8nQPd5MKG40J7hMgkyV01uxbWHYBppMJ1HppjxF6QIrRFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2614
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The CTB registration process changed significantly a while back using
> a single KLV based H2G. So drop the original and now obsolete H2G
> definitions.

The GuC specs has those defines marked as deprecated since v63 and 
they're being removed entirely in v70, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 7afdadc7656f..e77f955435ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -131,8 +131,6 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>   	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
> -	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
> -	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>   	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,

