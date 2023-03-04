Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D56AA6D4
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176B410E166;
	Sat,  4 Mar 2023 01:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7A510E166;
 Sat,  4 Mar 2023 01:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677892029; x=1709428029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eZ47M/mv5eQ5Hjcek5kmscrfkthNm0XTBQZE4XqbA+M=;
 b=NatFxz12Q6k/GIMuUBj7Jiru6fZazpAMAxpuQElyITdII3IxPxt9GNcG
 3xnqlEy74kYXoGjcJ5/a3cGaSmGVsoCzlf70MDi5PAsIu3NUaDRlw1lRX
 ncwbhUDgQKVdIalRoUYi+pZE5m+XE6DlEy7zmwZ9LLlYta0bgnOYQRHgO
 cDH/6I0A9ftd9PSZzf4XN9A6jrdeFzn+zdexJvIlTW/r3lNT3Wz/oYwX+
 WqyMcSh/N/bomvarXSMELHY5rvsT9IMYg6ixzleQPjAJ08QciMW601rRe
 LHTpSSxu920H+nlcrspS/QOXvFOVpxE3OmdoDLwemxwud9J4oROtXytwl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="397787375"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="397787375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="764610368"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="764610368"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2023 17:07:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:07:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 17:07:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 17:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF7cazBtqaBuw7M9Qp9mGAPIY8gUOtVtDbmgCuW69jyc3m8oGiQPlR5sWuul8Gs/8d1VQgVEjNq+uFxLb2Yzw0ZOjgWVwwgdHergbFiuJ1XuUsEh01lGQCZzSzJPBQfaJB41rkoX/NqUEM5bvs/2O8B1QXAbqDmOIKW3hfWFs+shARnzqGINGOUufBByarAg2E7q7j/HAQzl+mU8OP5Ua1YGX/yL/O85/CR5MEyvw4RnvP4ob9B1PBYfcUmJtVYVVC5yomC7OR941yz6RvnEN/HDaOf8CrfupT+eVdBUgDnDukn5SZgTfeAwXK0XoKtXRBIEn5Ja1cc7P4Wud9VvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exddrphilsL0endvbYFBGASmD3xDZAwhLv74mwZ/Gso=;
 b=P6A9oUWDYIxcKHXdD+zN41GvUoWLAqf+oyb5WlEnhOVfEGkhiovgEWK5obbUN2ierGjMICbg86oSZhOH7N5Cr4g0wAcRAgghFNG9zp8sXSat5ymTL9N2J+IA2D6oIxMlNT8nTRx6GfkPMUPjpoux+pjogJNFRPnJhdC+ee46uS3pjWUUVS0f4Kv3OpNtagmyzP+mvqYYVyD7mvJtJUrpaVMaaxEmoE+ZL37pC51SE7FbGxygHS7ri4UWfl+AphC2Yff10c50ResF3XFZP5OY1jqdpFE/pXKWiCAE05UsL5OATlXPnPY1YLl8xj4A2JA1tV1aylfU0HNXbFBIoMbmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22; Sat, 4 Mar 2023 01:07:05 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 01:07:05 +0000
Message-ID: <f0258ff4-2c50-5c86-b4f5-7508643d4a93@intel.com>
Date: Fri, 3 Mar 2023 17:07:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-5-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230228022150.1657843-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a541b2-a249-44eb-e702-08db1c4cc51f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h57WL2oRKx0RfMNYX13fjdEnfdiMRrf51Mmc/j9U8rGhvkjfayJDgENaiwkZNtoon/1uiW7zhURLZfp1anOrRfSOmq6wWhRNndVtmSnBNRDysEUJRiEqHc1AX9+2QpKOeSpQWYmxrD85IaRU1UZO8QSyfMV8SIBUfVl3T/kj3Ij5pnXfVVrYdVuN9zFbBNHXUwR5/mwd46iWTPqQheaiqoByl2LkiyMTnsyCQIZ3yLtr7TsEO71ZcXjwwnc/mGFrhfud6WmS+M45+Vl67PrlhcnnkUt7ukqS/5Euk+gE6URbZoA9tnIcsB9kW2/ozChIah4pybP8ntttzr/ul6F15PAXqJK2dP02FpulvqzYNWeOyBLeyaQgwy4iY6JDU4slU16wSUBkzWnYITd0Cuv/tiGU6DkZuf6ukGYit21ibZvn0en+i4GjN7RC2wu1BeiAwdohLyq57so+6B/OWg5XdA6+M+ygWoPYlBHFP2ikKSndLnBXLUkVbdPq5tz2zJQ3lrcatW90NI+boGHJtNQ3wr9G305B5MdzZd0T1RuzzyMeYrEdP8tWqLKnVWjoTKTaVNng1vBw1Hz4BL9fa6iuXO5A7ih9LcTg2CHA8Bm+Rwv7jdIbc+K+F8AnlYL7097w52lIf32kKVMV2TKN07r8XmsE4yBGAQpM46irEx/o7Y8fO3wHg0vbxYHPZBkPurHSmscbhoEPPcA31eA+tRhygSIN+ZSOwvJRkA7Mr3uw0rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199018)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(86362001)(31696002)(316002)(83380400001)(5660300002)(30864003)(8936002)(82960400001)(6486002)(36756003)(478600001)(2906002)(15650500001)(6512007)(6506007)(26005)(53546011)(186003)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhOT0JsZ2ZTYUplZHpZT0g1dmZtQU9ERFdHL2daWDNTRk1mY2xsMXdxUS9I?=
 =?utf-8?B?TlZNclNvZmh0a3BxRndWTFkzNkdMTXliN0JjRGhlWHpvOG9pZmlyZThpcFJV?=
 =?utf-8?B?UzBNUVlBbWFRRHVuL2MwNkQwTTM5TlV2RmdRQ0lMM29udTBHejVvWUtoTllP?=
 =?utf-8?B?d0hrNXBTa21UMkJXZXVZUFVFZEZ3YzRpUWF1aVQyS1phSVNMOWxWVzlPa2xk?=
 =?utf-8?B?cThPcHJjMFU4WEFZY3lJUDZpeVFTOEc2VEF6QjVwOUN2UVMyUlMwaEFpeGN2?=
 =?utf-8?B?bmJHOUUwaG9VNWRtWTh0QlQvYnFyOHdGUHlWNjFMMTJscUZ2QWNPbFA5c1hX?=
 =?utf-8?B?S210WmZjRkNBajFBc09YR1BQbG9Mek5NK2V2N0NmUkJGcFptaHk4dmx6UTgr?=
 =?utf-8?B?Q0tuMWc1YTU5cHNVUStsTjJPTDJWelRIZ1FBM0N1QnRnQ2FJaCtFbEd0d2xa?=
 =?utf-8?B?eVgrTFAvRjFXT1kyRlRYYnFHMFcwQk56SUlKTTRCT1g3N1pWZktES2l6UTFt?=
 =?utf-8?B?c0tUcUlXYUJYbUJpekpKbytCWXpFZlFUZEJEaE1QNHB1N0ptWS9HZHZ5TWhB?=
 =?utf-8?B?RmJJQjRxWis4dFg4c0xteE9nWFlpTXdsMGtKVDRwQmpBa1c2bzFIcTFFejll?=
 =?utf-8?B?Z0didmoxV3hwZXJxTkxOcU11OUR6OW92dU9wZFFjUjlyZ3dJUFN6UXVPNU0x?=
 =?utf-8?B?dUhySThaZ3ZKcHFJODgrZmV6U1UyTUNmc3orL2NNUGJkREN3REZsRmVhVWRD?=
 =?utf-8?B?SXIrbVN2UlEyZzVqWGZuWlRnWUovVXkzWkZTMUdkWXlkSWlndU1EUHhqV2c4?=
 =?utf-8?B?cHp6WmNlUXo5N29ZNFFSOWFNNVU0b0V1TWhvbHU5RVFmVDJoa1lTNHVITmJk?=
 =?utf-8?B?MWhROTlTU0hMR1I3LzVQdXhoTC9BVUd5b2ZNbm9YNlkrTUtScFh5MjFPSlpq?=
 =?utf-8?B?VHpmTGt3cUVVaE1Dd3k4dXkzeURxS1ZJc0ZteEVuS09PV3poYlhJMnZzVldH?=
 =?utf-8?B?aDFBNHdtNmswMUgvekd5NHVRZTBwRVptb1hwRjdTNG9ncUNvV25ZbmtDR1FZ?=
 =?utf-8?B?UUZybnhrUDN6MFcwczMvK0R3RjVocy9hRXk0M2pWblZzQThoNmVYUVY5ZGZQ?=
 =?utf-8?B?RGxuNGY3RVFyRC93NmdUNWVTdHhBVUFTYkFzYm9sQkU3d2Q5N09TSVpYc0U4?=
 =?utf-8?B?UlhXeG1JWkc4cnNhU3FVQ3NHWnROVS9RRTQ4anFSY0hoOVJqOWhiMjZjT1cy?=
 =?utf-8?B?OUxrOXRBTktqYVFxUHNYYkNCV1VLU2p5cWt1Qm1YTWJ1T0lIanA1WXpNUWlj?=
 =?utf-8?B?cDEramdodHlPS0hiVEsybVVGZ2QrZlJ5enVYazg0aHVsOXZrYkRDRUlWOGor?=
 =?utf-8?B?Vnp5a2c3ZlNkSjFZT2lSc2YzSm1qdXFLb3BLMm5leDgzd0poVU5hSEp6K3Q2?=
 =?utf-8?B?NVJOMDBGUXV4aUxIOWp4R0FSOWwzVUNEVmQvQnN1T3cyNDFYN29GMU1ZN2Qw?=
 =?utf-8?B?RmhnTUxIcFlGOEdKZHR1bWtQQktDbWhPeGF1QW1lbGE5bGQvMlVNTFlqZHZ2?=
 =?utf-8?B?NDZ2UTU1Z1VCL0M1YnQ1YTluRWtoR2o3SnJFbGM4UVp1eDdBdUpEREhOc2Nr?=
 =?utf-8?B?K055UEUzR3Z0NUhKdFpqdExJajM2Q2s2bURSRW9tRDRrOFlwaFZPN05oOWRk?=
 =?utf-8?B?TTlDdzJtdXlsTzRQUFg1R1dBai9rODlsNmc0SEpUc0xaQVpUcGFGMjcwdlZD?=
 =?utf-8?B?UWl3UFA0TDk4Vkp1UVhRSkFBSTBKRTAyNjZGT29nVWVKVDdESVY3Y2RIU2ZJ?=
 =?utf-8?B?b1FOVXI3cWRmelhJY3E2MkFEeldpVW9QOUlzUldhTUhvS1JEYUcyd2xFMS9G?=
 =?utf-8?B?UFlEMGZ3YUZLL2dQTURCTVZxaTVrS1A1QXlER2Q1UHU1dkxCZDArdHlRcmMw?=
 =?utf-8?B?VEhXL1FIMmszYjd1ZWRWcXhydll2enFIZ1UrODFHYktON1VaV2p3MHBpUHdP?=
 =?utf-8?B?M00xb21Zbmowa3l2M3lDRDBhbjhTV09qWEx0ZkdMMzEzYzhNMmxxUjhLdmFU?=
 =?utf-8?B?OXVBajZBVXFvbis5NkxTUmdxbmNubE9MLzVHQlh5YUl3RTQrNUlqNTB6NkY0?=
 =?utf-8?B?UXNpTlE2ZXpQeXRyS2labnJ3SEw1MTc2aWpJVm5PUnJ5cWRXZ1dPWjZUMHhK?=
 =?utf-8?Q?6kGlWMhup9Jsu8ANKVyv1FI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a541b2-a249-44eb-e702-08db1c4cc51f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 01:07:05.5226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2H32XA/enMZJyD+N6yPljLa+pO90gU0nyeTceUyHTpH2aKZXlEwewQsuXX+RuKvVtswtQxB0K1Z6Pl6aFvOE1rbBPh1yeeXIWndyMJUpk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/27/2023 6:21 PM, Alan Previn wrote:
> Add GSC engine based method for sending PXP firmware packets
> to the GSC firmware for MTL (and future) products.
>
> Use the newly added helpers to populate the GSC-CS memory
> header and send the message packet to the FW by dispatching
> the GSC_HECI_CMD_PKT instruction on the GSC engine.
>
> We use non-priveleged batches for submission to GSC engine
> which require two buffers for the request:
>       - a buffer for the HECI packet that contains PXP FW commands
>       - a batch-buffer that contains the engine instruction for
>         sending the HECI packet to the GSC firmware.
>
> Thus, add the allocation and freeing of these buffers in gsccs
> init and fini.
>
> The GSC-fw may reply to commands with a SUCCESS but with an
> additional pending-bit set in the reply packet. This bit
> means the GSC-FW is currently busy and the caller needs to
> try again with the gsc_message_handle the fw gave. The
> GSC-fw requires a non-zero host_session_handle provided
> by the caller to enable gsc_message_handle tracking.
>
> Thus, allocate the host_session_handle at init and destroy it
> at fini (the latter requiring an FYI to the gsc-firmware).
> Also ensure the send-message function allows replay of the
> gsc_message_handle.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |   4 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 239 +++++++++++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |   4 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
>   4 files changed, 251 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index ad67e3f49c20..b2523d6918c7 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -12,6 +12,10 @@
>   /* PXP-Cmd-Op definitions */
>   #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
>   
> +/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
> +#define PXP43_MAX_HECI_IN_SIZE (SZ_32K)
> +#define PXP43_MAX_HECI_OUT_SIZE (SZ_32K)
> +
>   /* PXP-Input-Packet: HUC-Authentication */
>   struct pxp43_start_huc_auth_in {
>   	struct pxp_cmd_header header;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 13693e78b57e..30aa660a975f 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -6,19 +6,226 @@
>   #include "gem/i915_gem_internal.h"
>   
>   #include "gt/intel_context.h"
> +#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
>   
>   #include "i915_drv.h"
>   #include "intel_pxp_cmd_interface_43.h"
>   #include "intel_pxp_gsccs.h"
>   #include "intel_pxp_types.h"
>   
> +static int
> +gsccs_send_message(struct intel_pxp *pxp,
> +		   void *msg_in, size_t msg_in_size,
> +		   void *msg_out, size_t msg_out_size_max,
> +		   size_t *msg_out_len,
> +		   u64 *gsc_msg_handle_retry)
> +{
> +	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct gsccs_session_resources *exec =  &pxp->gsccs_res;

in the alloc/free functions you called this object *strm_res; IMO better 
to use a consistent naming so it is clear they're the same object

> +	struct intel_gsc_mtl_header *header = exec->pkt_vaddr;
> +	struct intel_gsc_heci_non_priv_pkt pkt;
> +	bool null_pkt = !msg_in && !msg_out;
> +	size_t max_msg_size;
> +	u32 reply_size;
> +	int ret;
> +
> +	if (!exec->ce)
> +		return -ENODEV;
> +
> +	max_msg_size = PXP43_MAX_HECI_IN_SIZE - sizeof(*header);

Using the same max_msg_size for both in and out only works if 
PXP43_MAX_HECI_IN_SIZE == PXP43_MAX_HECI_OUT_SIZE. This is true now, but 
I'd add a:

BUILD_BUG_ON(PXP43_MAX_HECI_IN_SIZE  != PXP43_MAX_HECI_OUT_SIZE);

just to be safe. Potentially also a:

GEM_BUG_ON(exec->pkt_vma->size < (PXP43_MAX_HECI_IN_SIZE + 
PXP43_MAX_HECI_OUT_SIZE));

After checking that exec->pkt_vma exists.

> +
> +	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
> +		return -ENOSPC;
> +
> +	if (!exec->pkt_vma || !exec->bb_vma)
> +		return -ENOENT;
> +
> +	mutex_lock(&pxp->tee_mutex);
> +
> +	memset(header, 0, sizeof(*header));
> +	intel_gsc_uc_heci_cmd_emit_mtl_header(header, GSC_HECI_MEADDRESS_PXP,
> +					      msg_in_size + sizeof(*header),
> +					      exec->host_session_handle);
> +
> +	/* check if this is a host-session-handle cleanup call */
> +	if (null_pkt)

nit: can't you just use if (!msg_in && !msg_out) instead of a local var? 
not a blocker.

> +		header->flags |= GSC_HECI_FLAG_MSG_CLEANUP;
> +
> +	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
> +	header->gsc_message_handle = *gsc_msg_handle_retry;
> +
> +	/* NOTE: zero size packets are used for session-cleanups */
> +	if (msg_in && msg_in_size)
> +		memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
> +
> +	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
> +	pkt.size_in = header->message_size;
> +	pkt.addr_out = pkt.addr_in + PXP43_MAX_HECI_IN_SIZE;
> +	pkt.size_out = msg_out_size_max + sizeof(*header);
> +	pkt.heci_pkt_vma = exec->pkt_vma;
> +	pkt.bb_vma = exec->bb_vma;
> +
> +	ret = intel_gsc_uc_heci_cmd_submit_nonpriv(&gt->uc.gsc,
> +						   exec->ce, &pkt, exec->bb_vaddr,
> +						   GSC_REPLY_LATENCY_MS);
> +	if (ret) {
> +		drm_err(&i915->drm, "failed to send gsc PXP msg (%d)\n", ret);
> +		goto unlock;
> +	}
> +
> +	/* we keep separate location for reply, so get the response header loc first */
> +	header = exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE;
> +
> +	/* Response validity marker, status and busyness */
> +	if (header->validity_marker != GSC_HECI_VALIDITY_MARKER) {

AFAICS you're not clearing the reply header when you re-send the same 
packets after the pending bit, so this marker might be stale data. Same 
for the other fields below.

> +		drm_err(&i915->drm, "gsc PXP reply with invalid validity marker\n");
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +	if (header->status != 0) {
> +		drm_dbg(&i915->drm, "gsc PXP reply status has error = 0x%08x\n",
> +			header->status);
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +	if (header->flags & GSC_HECI_FLAG_MSG_PENDING) {
> +		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
> +		/*
> +		 * When the GSC firmware replies with pending bit, it means that the requested
> +		 * operation has begun but the completion is pending and the caller needs
> +		 * to re-request with the gsc_message_handle that was returned by the firmware.
> +		 * until the pending bit is turned off.
> +		 */
> +		*gsc_msg_handle_retry = header->gsc_message_handle;

Non blocking question: would it be worth it to copy the value to the 
header_in directly, instead of returning the value to the caller and 
copying it on resubmit? Just a thought, I see pro and cons with both 
approaches.

> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	reply_size = header->message_size - sizeof(*header);
> +	if (reply_size > msg_out_size_max) {
> +		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
> +			 reply_size, msg_out_size_max);
> +		reply_size = msg_out_size_max;
> +	} else if (reply_size != msg_out_size_max) {
> +		drm_dbg(&i915->drm, "caller unexpected PXP reply size %u (%ld)\n",
> +			reply_size, msg_out_size_max);

Are we expecting all caller to always pass the exact size? Not a 
complain, but if that's the case then maybe rename msg_out_size_max to 
msg_out_expected_size, so it's clearer. size_max sounds like any size 
smaller than it is allowed. My personal preference would be to leave 
this as a size_max and have the caller decide if the actual returned 
size matches the expectations (via msg_out_len)

> +	}
> +
> +	if (msg_out)
> +		memcpy(msg_out, exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE + sizeof(*header),
> +		       reply_size);
> +	if (msg_out_len)
> +		*msg_out_len = reply_size;
> +
> +unlock:
> +	mutex_unlock(&pxp->tee_mutex);
> +	return ret;
> +}
> +
> +static int
> +gsccs_send_message_retry_complete(struct intel_pxp *pxp,
> +				  void *msg_in, size_t msg_in_size,
> +				  void *msg_out, size_t msg_out_size_max,
> +				  size_t *msg_out_len)
> +{
> +	u64 gsc_session_retry = 0;
> +	int ret, tries = 0;
> +
> +	/*
> +	 * Keep sending request if GSC firmware was busy. Based on fw specs +
> +	 * sw overhead (and testing) we expect a worst case pending-bit delay of
> +	 * GSC_PENDING_RETRY_MAXCOUNT x GSC_PENDING_RETRY_PAUSE_MS millisecs.
> +	 */
> +	do {
> +		ret = gsccs_send_message(pxp, msg_in, msg_in_size, msg_out, msg_out_size_max,
> +					 msg_out_len, &gsc_session_retry);
> +		/* Only try again if gsc says so */
> +		if (ret != -EAGAIN)
> +			break;
> +
> +		msleep(GSC_PENDING_RETRY_PAUSE_MS);
> +	} while (++tries < GSC_PENDING_RETRY_MAXCOUNT);
> +
> +	return ret;
> +}
> +
> +static int
> +gsccs_create_buffer(struct intel_gt *gt,
> +		    const char *bufname, size_t size,
> +		    struct i915_vma **vma, void **map)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct drm_i915_gem_object *obj;
> +	int err = 0;
> +
> +	obj = i915_gem_object_create_internal(i915, size);
> +	if (IS_ERR(obj)) {
> +		drm_err(&i915->drm, "Failed to allocate gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(obj);
> +		goto out_none;
> +	}
> +
> +	*vma = i915_vma_instance(obj, gt->vm, NULL);
> +	if (IS_ERR(*vma)) {
> +		drm_err(&i915->drm, "Failed to vma-instance gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(*vma);
> +		goto out_put;
> +	}
> +
> +	/* return a virtual pointer */
> +	*map = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(i915, obj, true));
> +	if (IS_ERR(*map)) {
> +		drm_err(&i915->drm, "Failed to map gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(*map);
> +		goto out_put;
> +	}
> +
> +	/* all PXP sessions commands are treated as non-priveleged */

typo priveleged

> +	err = i915_vma_pin(*vma, 0, 0, PIN_USER);
> +	if (err) {
> +		drm_err(&i915->drm, "Failed to vma-pin gsccs backend %s.\n", bufname);
> +		goto out_unmap;
> +	}
> +
> +	return 0;
> +
> +out_unmap:
> +	i915_gem_object_unpin_map(obj);
> +out_put:
> +	i915_gem_object_put(obj);
> +out_none:
> +	*vma = NULL;
> +	*map = NULL;
> +
> +	return err;
> +}
> +

nit: maybe move gsccs_create_buffer after the cleanup/destruction 
functions? so we can group all the creation functions close together.

> +static void
> +gsccs_cleanup_fw_host_session_handle(struct intel_pxp *pxp)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	int ret;
> +
> +	ret = gsccs_send_message_retry_complete(pxp, NULL, 0, NULL, 0, NULL);
> +	if (ret)
> +		drm_dbg(&i915->drm, "Failed to send gsccs msg host-session-cleanup: ret=[%d]\n",
> +			ret);
> +}
> +
>   static void
>   gsccs_destroy_execution_resource(struct intel_pxp *pxp)
>   {
>   	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
>   
> +	if (strm_res->host_session_handle)
> +		gsccs_cleanup_fw_host_session_handle(pxp);
>   	if (strm_res->ce)
>   		intel_context_put(strm_res->ce);
> +	if (strm_res->bb_vma)
> +		i915_vma_unpin_and_release(&strm_res->bb_vma, I915_VMA_RELEASE_MAP);
> +	if (strm_res->pkt_vma)
> +		i915_vma_unpin_and_release(&strm_res->pkt_vma, I915_VMA_RELEASE_MAP);
>   
>   	memset(strm_res, 0, sizeof(*strm_res));
>   }
> @@ -30,6 +237,7 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
>   	struct gsccs_session_resources *strm_res = &pxp->gsccs_res;
>   	struct intel_engine_cs *engine = gt->engine[GSC0];
>   	struct intel_context *ce;
> +	int err = 0;
>   
>   	/*
>   	 * First, ensure the GSC engine is present.
> @@ -38,16 +246,43 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
>   	if (!engine)
>   		return -ENODEV;
>   
> +	/*
> +	 * Now, allocate, pin and map two objects, one for the heci message packet
> +	 * and another for the batch buffer we submit into GSC engine (that includes the packet).
> +	 * NOTE: GSC-CS backend is currently only supported on MTL, so we allocate shmem.
> +	 */
> +	err = gsccs_create_buffer(pxp->ctrl_gt, "Heci Packet",
> +				  PXP43_MAX_HECI_IN_SIZE + PXP43_MAX_HECI_OUT_SIZE,
> +				  &strm_res->pkt_vma, &strm_res->pkt_vaddr);
> +	if (err)
> +		return err;
> +
> +	err = gsccs_create_buffer(pxp->ctrl_gt, "Batch Buffer", PAGE_SIZE,
> +				  &strm_res->bb_vma, &strm_res->bb_vaddr);
> +	if (err)
> +		goto free_pkt;
> +
>   	/* Finally, create an intel_context to be used during the submission */
>   	ce = intel_context_create(engine);
>   	if (IS_ERR(ce)) {
>   		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
> -		return PTR_ERR(ce);
> +		err = PTR_ERR(ce);
> +		goto free_batch;
>   	}
> -
>   	strm_res->ce = ce;
>   
> +	/* initialize host-session-handle (for all i915-to-gsc-firmware PXP cmds) */
> +	get_random_bytes(&strm_res->host_session_handle, sizeof(strm_res->host_session_handle));

This does not guarantee that each host session handle is unique 
(although getting the same u64 twice is going to be extremely extremely 
unlikely). Not sure if it is a problem.

> +
>   	return 0;
> +
> +free_pkt:
> +	i915_vma_unpin_and_release(&strm_res->pkt_vma, I915_VMA_RELEASE_MAP);
> +free_batch:
> +	i915_vma_unpin_and_release(&strm_res->bb_vma, I915_VMA_RELEASE_MAP);

those gotos are the wrong way around, the pkt is allocated first and 
therefore it should be freed second

Daniele

> +	memset(strm_res, 0, sizeof(*strm_res));
> +
> +	return err;
>   }
>   
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index 354ea9a8f940..bd1c028bc80f 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -10,6 +10,10 @@
>   
>   struct intel_pxp;
>   
> +#define GSC_REPLY_LATENCY_MS 200
> +#define GSC_PENDING_RETRY_MAXCOUNT 40
> +#define GSC_PENDING_RETRY_PAUSE_MS 50
> +
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
>   int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index fdd98911968d..73392fbab7ee 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -38,6 +38,12 @@ struct intel_pxp {
>   	struct gsccs_session_resources {
>   		u64 host_session_handle; /* used by firmware to link commands to sessions */
>   		struct intel_context *ce; /* context for gsc command submission */
> +
> +		struct i915_vma *pkt_vma; /* GSC FW cmd packet vma */
> +		void *pkt_vaddr;  /* GSC FW cmd packet virt pointer */
> +
> +		struct i915_vma *bb_vma; /* HECI_PKT batch buffer vma */
> +		void *bb_vaddr; /* HECI_PKT batch buffer virt pointer */
>   	} gsccs_res;
>   
>   	/**

