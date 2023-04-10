Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77C6DC919
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB73910E3B7;
	Mon, 10 Apr 2023 16:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE2B10E3B3;
 Mon, 10 Apr 2023 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681143146; x=1712679146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+w4RPqCg9eKA6mF+H8bpWhGqsj0XmiQ0uQ/piF+z4h4=;
 b=WGSsd1cAoEO8bZoSt7OjudZGhQmWV7/xIo3hnOithF4Jf9tSUL3hfveV
 HJa/PjCq9VE+NAPYNytEr3T+HwnOOCzhdsCh91fIwDLqNrsAe92fETRfk
 EBPs/SSX/o0GrodJIAEOu9hsejPDJh7IaUXPyJqXMxse/hI73Cbl2P6xT
 sElItUK+RKVlodwV6XjHP/7gfMdedJqsxPSunLh0Gn3uaCU9NqTJ97wWp
 72ATV7MnG2nVeWBdixy9gwPaz4T2VRZQE/vbOqwISSIx3wqMSDrvvsdhw
 ufF9nKXbjAAzasM+NzbbcEMun3WZ6ePfYYHzSRQRjgW1IptYWCCi9yMj3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="346052027"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="346052027"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752819239"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752819239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 09:10:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:10:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 09:10:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 09:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koaYu1n+aGHTLzBgww7PE9Kxs6gNIFWYVXN9Mfhisd/53SHDBGsbyX9UtXK08bDZ7o0mVtIJ8OyOWUEt3XCZbdufEyYjluIEtBaDwIiwZdtuyySj4haB+0BDWPDrsk4T5KpMBRZMw44USWEUF5vfMaP5OaIufCGY2WH5EdPnKRzJIxZkHpmkLto6IK7Ag8AEiKiVjSmLhrUAA6qQ+jJSv15v8vwVvoNeq7gWgiwmyH2yseSt7g50LOv5Oms+J+r73U7n/G5s6ygDD6ts3uQG501ttPrzmphiz9iz5fDOJwvmv5oxJRDHbtAx4Uxlkc7YHZZ4Ol0q1cMkUWfXK7sOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGPRE1rQQQL+TbwfQkt11gSNVANOk1SrhmULICkwzkU=;
 b=UcfCvCbOibpsajCAixs5SaBtw7GWHyXIU9AAAgaIdi8p9r3iseZXmj0WqB5SOQ/rJqjK8ys9kIaiHHyFY27xgaAj+4ue3CyaW+RfpUoW5Im5fxiG9y+VMnWx4ugy1Z2lhwsBCPtfMW4+0pPuigzFlVNAlHQhedKWKg6eDgFaLcGbgXSjD2XwMTZm+DR19BiUOKJRitP5vMlbNu1UmypcABoLeggfil/PX18/mVEl1n0/5ADcE/SdNXGGB5WlTFvXN8/WSQ1Pc/V5dL3t/Rrmmgo/VosT9ZB9i3Ok3jD/FRmz9TpKZMxkvUt5FPJBtdBOrZ38zyOT1lzt9wxjhiLERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 16:10:51 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6254.035; Mon, 10 Apr 2023
 16:10:51 +0000
Message-ID: <b568ae8f-64a7-6a56-6760-ac0b2ff63191@intel.com>
Date: Mon, 10 Apr 2023 09:10:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-4-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230406174419.471256-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f32c46-f053-4489-294c-08db39de2780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AH5bvgCuxjXKzq6wsaTL/GyaxaXhc9D5CCxsq/QAaYvD+9rR4Hj1zvvsb2vhOgX+zESn4M/XTLtL0/MiLkfM6UxtplRfsP1jJ8X7Y9Bz8eKqDBDyOFbju5qAunPihqfJB/bMgFMeZ9OsUt9eUQH3z3y7X6MEdhkdc7I6KAGwrReTH1DaOeU2zRtP4qTSD91Pk3k8kdTVDG0QEdYOIqURmhO87Hr3cBL3LXh5TjbBDJ2qF8xZzvddgW25uEc1K0/dF7QOR34KwWsUjNpZkFyoqjqyWE37DqTDFVtC0exQUBfaLlgv2u5yfJr+NJfsoE75GI9r2fg9BxXpPSV/82lHiCNk+ZFuBxPtOxRWVpst1pNIkG34reOSXmku54HU4fawhUxCiDGqDqhTS/KsUVhyytMSD88XkfyFZnf7v3CLEnbM0RlOAwBmd32ma86RKJt0yOKfDyLIrAUfzYda+3OD14yGNUL9xRBm+zDUiOGads/TR1xKvFEO9vss3a7RYu457Wb+BFoqW3q0Cg9+bVJ6s4J1RnwlXZpQ5MuJNipzyJ3IjmyZGLfJLGSOzHwpletx7V96D3h7Y3wAJ8Y3Or0CNwuDVtJmu5hmgV7ZSlTpuF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(31686004)(478600001)(86362001)(31696002)(83380400001)(82960400001)(36756003)(38100700002)(2616005)(6666004)(107886003)(6486002)(966005)(2906002)(54906003)(53546011)(316002)(186003)(6512007)(6506007)(26005)(5660300002)(41300700001)(8936002)(66476007)(8676002)(66556008)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uzc0K2FWYi8wSE5IYUhkQndRMFNoY1hjTkhjNmRUVS82ZWxLUFlYQlV0TjBY?=
 =?utf-8?B?ZjlrOHVFRzZJN0Qyem5JVktIUW1yVVovMkRXNWlla3dlUHJzMGhrODVwOUx3?=
 =?utf-8?B?azlmV08rZTQzR2JpL2FXTXVsUVpPblllbmtWd3U2ejFKWGhGQ0JuNnVMcjBB?=
 =?utf-8?B?V1ZVWjExRkJCc2pJNys0Q3o4aXFMU2VsWmVkMGpDYUZDMHo4cHFrKzgzZVpS?=
 =?utf-8?B?MGVJQWFiMTVEVTgwQlZJREhxU09GTk9FV0ZSYmVidHBCZkpyTGxjcVlISW5D?=
 =?utf-8?B?aDJnYnJ5ZytkSWw5L00vM0ZFQzJ2VVlxYSs1ejdNWW9kRHRaYXYwQTNsL054?=
 =?utf-8?B?QlVYMi9ITGppVHlMZytVdktXY2QxQUppTHBZY0UwNFN0dHkzU3NWelFzVFBw?=
 =?utf-8?B?MldiWFo0OHpVNnQ4a1F2R3J0RTVpQVNWUXpCb0lpanQ2d3ZvUEtvY0hVR1VE?=
 =?utf-8?B?Vk8zeThWb1FqVjVFaVdKN0prdXlOWmtEaFpEWCszSEMwTE5XbExJNGRLTHVk?=
 =?utf-8?B?Sys1V3NWR2VvaUFReW10L0x6S2duVFkwaFNCd2VxRE1GNDNaWWNCVGJaNHdk?=
 =?utf-8?B?cCs4UE1qUDVtSjEyZGtydFpNQlQ2UjdBV2RTOHpOa3VtRms1QUlEVFU4bVVa?=
 =?utf-8?B?SzBHWXNib1VzZURGT3NXbGE4ZGI2RUlJTDF4OXRtaENtRVVmMUpYQ2hzUnlT?=
 =?utf-8?B?RkxNbmVScUhuKzdTOU81OEEvZUVobGNaZWxIYkxzSzBOQkZTeWhyZWQvc1R0?=
 =?utf-8?B?UFIzKzB5aTRmeVpHZTJWdHBZMUpaZDRrTWZpN0ZJRnZ4WkErdmU4enFOWUph?=
 =?utf-8?B?enh0b1QwdE5QNXIwTXEyTzJuNUEyV2NXSlhOMHQrbHhmYmdvblg1SVBWblR3?=
 =?utf-8?B?cGoxL3l1cXZGZzBzM2FSZXBmdk9XWm1rOHdqODIrNzMwdXE5aXUzb2pBZnlS?=
 =?utf-8?B?M0J3em5zNHZ1dkJuNDF2M0h5a0xzNElUc1pUSElMdFRsam9wNFlJTWlLRUl4?=
 =?utf-8?B?RCswZFdLaHMwcWtpeDdCbkhZem5hQ1hUdm51N25HRjE1VHhzckNRR01KbUsv?=
 =?utf-8?B?RklUMVE3ODZBUkJzTFpYbEhGaFpaNnhDSkhhbHpTaEExRUVvV3dJSWhWblJw?=
 =?utf-8?B?dmcvL3M5QlNURUF3TzIrN0laT1FwWTF3dXRWRUR5bXFnQzNUUXBLSkpseDUx?=
 =?utf-8?B?Vjh0VkY2TkYrdGdycEJDVnc0N1ZlTTZLeFRCSVVDSUxUYjhTWm04NmRlSHhG?=
 =?utf-8?B?MEgrVWxjNmV6SWVTaWg2d01HMFR4dlBYTThqdVMxeHdhMUpyclBTaXQ3VTBB?=
 =?utf-8?B?OWVFQ3NOQ0pEeG9JZ2ZkZUJzQ1hWSzlzcWZlR2xCVG5Mb3RGTVhLTU5pSnk1?=
 =?utf-8?B?Y2lKQS9xTXhmb2Q1K25hWlhtMjR5UnFZNVhoZi8vVzIzUkJ2TS9PcGsrSHpp?=
 =?utf-8?B?QWxkQlQ3elM1NnNRK2cwUXU4RGNMWmkyTWE3UVpROHFmWkpIck04VUhqalpP?=
 =?utf-8?B?Zk9JaGc2clg0dStTWGNqTm1oTjI1WkFDNnAwRnl1RW9SR1JWK0xORklxUmNl?=
 =?utf-8?B?ZytYcy84RXZZdHBtT25wdUl5TCttejNMSHdyWUVJa3dlRVMwSkIzZ2tXZUh0?=
 =?utf-8?B?dDhuUXE1cDdCVHRleG9BVXJGT25SQkozQmFlVlZ4bytVREJTaUJpaVRwdUlP?=
 =?utf-8?B?Wk02MmNFNmJnbnJadlpGTjZvRWlzaHhGcGpIY0Y1NjJINGVMN2dvYnZVaFp1?=
 =?utf-8?B?OUI1Y3N0dHgvOWxSODd0Z213S0NaY1UyZFZwUkZJbUFLempqUVNoRW9EbHY2?=
 =?utf-8?B?MHlKWXIzMlkzYitQT2F3RE9oeUYwWFJ5NUV3WTZIL0VtN1I2R1ZseXpJUHFZ?=
 =?utf-8?B?bkZIWGUwdXVTRHFPdjcyMEJZRnQzcXlVdE1lc01kTXpWZlUrYXliMGNqSkVJ?=
 =?utf-8?B?NVBQdGpyWmhFL3VueSt3N01QczRpS1cydldsVFJjTFJxRU14MktVS21LT05q?=
 =?utf-8?B?ZGhEMUVlRGZxaUhsODJQdVU2VktxZGw3TlZKVUZrc04ySFluMDlocmZZMVRl?=
 =?utf-8?B?Z1IxaHRDUWkraTg3Wk93dWo4c3ZvT2hyU3k5aFBGSk8rallyY3dSdzRnaWkw?=
 =?utf-8?B?aWp4cUVGcEVKZENFOVJxZlg5VDhpOEIvREozUWxSb1M1MkdPL0xhSHlyN1M4?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f32c46-f053-4489-294c-08db39de2780
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 16:10:51.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHM+Tb5VhYRBwOTKLSfqkixftB60bQkBa2ak8j359yCfBv6kParKB12Uu0d0Obm999CeoZdQipJz8Bu9cTqno83s6K/5dbMPNnrgv6vfSXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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
Cc: Juston Li <justonli@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/6/2023 10:44 AM, Alan Previn wrote:
> Add helper functions into a new file for heci-packet-submission.
> The helpers will handle generating the MTL GSC-CS Memory-Header
> and submission of the Heci-Cmd-Packet instructions to the engine.
>
> NOTE1: These common functions for heci-packet-submission will be used
> by different i915 callers:
>       1- GSC-SW-Proxy: This is pending upstream publication awaiting
>          a few remaining opens
>       2- MTL-HDCP: An equivalent patch has also been published at:
>          https://patchwork.freedesktop.org/series/111876/. (Patch 1)
>       3- PXP: This series.
>
> NOTE2: A difference in this patch vs what is appearing is in bullet 2
> above is that HDCP (and SW-Proxy) will be using priveleged submission
> (GGTT and common gsc-uc-context) while PXP will be using non-priveleged
> PPGTT, context and batch buffer. Therefore this patch will only slightly
> overlap with the MTL-HDCP patches despite have very similar function
> names (emit_foo vs emit_nonpriv_foo). This is because HECI_CMD_PKT
> instructions require different flows and hw-specific code when done
> via PPGTT based submission (not different from other engines). MTL-HDCP
> contains the same intel_gsc_mtl_header_t structures as this but the
> helpers there are different. Both add the same new file names.
>
> NOTE3: Additional clarity about the heci-cmd-pkt layout and where the
>         common helpers come in:
>       - On MTL, when an i915 subsystem needs to send a command request
>         to the security firmware, it will send that via the GSC-
>         engine-command-streamer.
>       - However those commands, (lets call them "gsc_specific_fw_api"
>         calls), are not understood by the GSC command streamer hw.
>       - The GSC CS only looks at the GSC_HECI_CMD_PKT instruction and
>         passes it along to the GSC firmware.
>       - The GSC FW on the other hand needs additional metadata to know
>         which usage service is being called (PXP, HDCP, proxy, etc) along
>         with session specific info. Thus an extra header called GSC-CS
>         HECI Memory Header, (C) in below diagram is prepended before
>         the FW specific API, (D).
>       - Thus, the structural layout of the request submitted would
>         need to look like the diagram below (for non-priv PXP).
>       - In the diagram, the common helper for HDCP, (GSC-Sw-Proxy) and
>         PXP (i.e. new function intel_gsc_uc_heci_cmd_emit_mtl_header)
>         will populate blob (C) while additional helpers, different for
>         PPGGTT (this patch) vs GGTT (HDCP series) will populate
>         blobs (A) and (B) below.
>        ___________________________________________________________
>   (A)  |  MI_BATCH_BUFFER_START (ppgtt, batchbuff-addr, ...)     |
>        |     |                                                   |
>        |    _|________________________________________________   |
>        | (B)| GSC_HECI_CMD_PKT (pkt-addr-in, pkt-size-in,    |   |
>        |    |                   pkt-addr-out, pkt-size-out)  |--------
>        |    | MI_BATCH_BUFFER_END                            |   |   |
>        |    |________________________________________________|   |   |
>        |                                                         |   |
>        |_________________________________________________________|   |
>                                                                      |
>              ---------------------------------------------------------
>              |
>             \|/
>        ______V___________________________________________
>        |   _________________________________________    |
>        |(C)|                                       |    |
>        |   | struct intel_gsc_mtl_header {         |    |
>        |   |   validity marker                     |    |
>        |   |   heci_clent_id                       |    |
>        |   |   ...                                 |    |
>        |   |  }                                    |    |
>        |   |_______________________________________|    |
>        |(D)|                                       |    |
>        |   | struct gsc_fw_specific_api_foobar {   |    |
>        |   |     ...                               |    |
>        |   |     For an example, see               |    |
>        |   |     'struct pxp43_create_arb_in' at   |    |
>        |   |     intel_pxp_cmd_interface_43.h      |    |
>        |   |                                       |    |
>        |   | }                                     |    |
>        |   |  Struture depends on command type     |    |
>        |   | struct gsc_fw_specific_api_foobar {   |    |
>        |   |_______________________________________|    |
>        |________________________________________________|
>
> That said, this patch provides basic helpers but leaves the
> PXP subsystem (i.e. the caller) to handle (D) and everything
> else such as input/output size verification or handling the
> responses from security firmware (for example, requiring a retry).
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 102 ++++++++++++++++++
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  25 ++++-
>   2 files changed, 126 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> index ea0da06e2f39..12c2a0e1dd1e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_gpu_commands.h"
>   #include "gt/intel_gt.h"
> @@ -107,3 +108,104 @@ void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
>   	header->header_version = MTL_GSC_HEADER_VERSION;
>   	header->message_size = message_size;
>   }
> +
> +static void
> +emit_gsc_heci_pkt_nonpriv(u32 *cmd, struct intel_gsc_heci_non_priv_pkt *pkt)
> +{
> +	*cmd++ = GSC_HECI_CMD_PKT;
> +	*cmd++ = lower_32_bits(pkt->addr_in);
> +	*cmd++ = upper_32_bits(pkt->addr_in);
> +	*cmd++ = pkt->size_in;
> +	*cmd++ = lower_32_bits(pkt->addr_out);
> +	*cmd++ = upper_32_bits(pkt->addr_out);
> +	*cmd++ = pkt->size_out;
> +	*cmd++ = 0;
> +	*cmd++ = MI_BATCH_BUFFER_END;
> +}
> +
> +int
> +intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
> +				     struct intel_context *ce,
> +				     struct intel_gsc_heci_non_priv_pkt *pkt,
> +				     u32 *cmd, int timeout_ms)
> +{
> +	struct intel_engine_cs *eng;

We always use "engine" for engine_cs variables. IMO it's better to stick 
to that here as well for consistency across the code.

> +	struct i915_gem_ww_ctx ww;
> +	struct i915_request *rq;
> +	int err, trials = 0;
> +

Is the assumption that the caller is holding a wakeref already? 
Otherwise we're going to need and engine_pm_get() here (assuming it 
doesn't interfere with any locking, otherwise it has to be in the caller)

> +	i915_gem_ww_ctx_init(&ww, false);
> +retry:
> +	err = i915_gem_object_lock(pkt->bb_vma->obj, &ww);
> +	if (err)
> +		goto out_ww;
> +	err = i915_gem_object_lock(pkt->heci_pkt_vma->obj, &ww);
> +	if (err)
> +		goto out_ww;
> +	err = intel_context_pin_ww(ce, &ww);
> +	if (err)
> +		goto out_ww;
> +
> +	rq = i915_request_create(ce);
> +	if (IS_ERR(rq)) {
> +		err = PTR_ERR(rq);
> +		goto out_unpin_ce;
> +	}
> +
> +	emit_gsc_heci_pkt_nonpriv(cmd, pkt);
> +
> +	err = i915_vma_move_to_active(pkt->bb_vma, rq, EXEC_OBJECT_WRITE);

nit: I don't think we need EXEC_OBJECT_WRITE for the bb as we're not 
going to write it.

> +	if (err)
> +		goto out_rq;
> +	err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
> +	if (err)
> +		goto out_rq;
> +
> +	eng = rq->context->engine;
> +	if (eng->emit_init_breadcrumb) {
> +		err = eng->emit_init_breadcrumb(rq);
> +		if (err)
> +			goto out_rq;
> +	}
> +
> +	err = eng->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
> +	if (err)
> +		goto out_rq;
> +
> +	err = ce->engine->emit_flush(rq, 0);
> +	if (err)
> +		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
> +			"Failed emit-flush for gsc-heci-non-priv-pkterr=%d\n", err);
> +
> +out_rq:
> +	i915_request_get(rq);
> +
> +	if (unlikely(err))
> +		i915_request_set_error_once(rq, err);
> +
> +	i915_request_add(rq);
> +
> +	if (!err) {
> +		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
> +				      msecs_to_jiffies(timeout_ms)) < 0)
> +			err = -ETIME;
> +	}
> +
> +	i915_request_put(rq);
> +
> +out_unpin_ce:
> +	intel_context_unpin(ce);
> +out_ww:
> +	if (err == -EDEADLK) {
> +		err = i915_gem_ww_ctx_backoff(&ww);
> +		if (!err) {
> +			if (++trials < 10)
> +				goto retry;
> +			else
> +				err = EAGAIN;
> +		}
> +	}
> +	i915_gem_ww_ctx_fini(&ww);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> index 3d56ae501991..3addce861854 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> @@ -8,7 +8,10 @@
>   
>   #include <linux/types.h>
>   
> +struct i915_vma;
> +struct intel_context;
>   struct intel_gsc_uc;
> +
>   struct intel_gsc_mtl_header {
>   	u32 validity_marker;
>   #define GSC_HECI_VALIDITY_MARKER 0xA578875A
> @@ -47,7 +50,7 @@ struct intel_gsc_mtl_header {
>   	 * we distinguish the flags using OUTFLAG or INFLAG
>   	 */
>   	u32 flags;
> -#define GSC_OUTFLAG_MSG_PENDING	1
> +#define GSC_OUTFLAG_MSG_PENDING 1

Nit: this change on the define is not really needed

Daniele

>   
>   	u32 status;
>   } __packed;
> @@ -58,4 +61,24 @@ int intel_gsc_uc_heci_cmd_submit_packet(struct intel_gsc_uc *gsc,
>   void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
>   					   u8 heci_client_id, u32 message_size,
>   					   u64 host_session_id);
> +
> +struct intel_gsc_heci_non_priv_pkt {
> +	u64 addr_in;
> +	u32 size_in;
> +	u64 addr_out;
> +	u32 size_out;
> +	struct i915_vma *heci_pkt_vma;
> +	struct i915_vma *bb_vma;
> +};
> +
> +void
> +intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
> +				      u8 heci_client_id, u32 msg_size,
> +				      u64 host_session_id);
> +
> +int
> +intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
> +				     struct intel_context *ce,
> +				     struct intel_gsc_heci_non_priv_pkt *pkt,
> +				     u32 *cs, int timeout_ms);
>   #endif

