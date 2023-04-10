Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85946DC94E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4C10E156;
	Mon, 10 Apr 2023 16:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A2F10E13D;
 Mon, 10 Apr 2023 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681144149; x=1712680149;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ShYjMDDBR6w0lfuNAm+CBnyfuQDuJDfjKXJG8NR89uc=;
 b=mm6k0dUSjcvjnqnUOqOeJGvcaBcBtc+C45jrr2jiILuVUrGjWcYA+S4R
 pbKypankBZOpc3BwVI6QkqZ156fR19+w1BqOE8vTt/HNNagYuzL/mV9Tc
 FOa6YfEsWT/SnZKQ0eI9qpL0bSDFNMADIkAgaOHRWuSOeoxOM6UtUk4+U
 gnkoiPQArriruA7cmKiWYLw4VWolV9TIR12rFrnbAPfLWW6yB6bqwQ2td
 yzthUTkhOcqQxFIcjexZ29FnqCLfv97k+bExvXtVGim+/X20n74cCnV7W
 2uYaonEm+2PddBQe1glNKKAoIrPgoUKyW/V8kFpR0WWX0bMkni6Oj3LDL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342158773"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342158773"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638511770"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="638511770"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 09:29:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:29:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:29:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 09:29:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 09:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fosKdpW8zYfWbNKavEUKj5HJub68kiOoE2+NR6Exj37oO1QWe+qnEzqmsrCj3lZOJyLxhnOZO5MN5cT/GhxG41rMiXmwsvcSswyWfAS3jD5zflKCUav0F+zHeeILobCwfdJU7hZxRXIr5xJE8l4n3JeQzjnCjeUHBKbIEPKK9svfbHkm1j4OYhnd4Awi70p/0A+BOEJpvCVWGAuUPQT1FRfM6jH1COm21agVm3G5WN6yrl4HSnzSNuwKYYSgqSxWz9fzWfbBHvamF+wDAwPb8UeG297f3mFFeKZX1/krEQZydB75BR9eTTBdIICGmxE6oOZoDvtNEIiQUI/dB93z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/287rzg0rXJBrGTvKuqJqMxqDHxiy7vLu7LvdN7hso=;
 b=N9+F03NHMsqFH0PzNYPNzdUj1A/49T9Q2YJ0mL/G1yiC/o+U+p66CRl87nBC3VD1q2WmQKYSgerTMF++H6TqUbyrdMDaSnAEQjyeLjZefw2U2R9+OmJ0RmA3zvtXMgGzM1a/t0gff/OddY1wzCoFwQEighVwUvUGhxnVT30aBGZ2JtxBroyXtkBJUC4rsEpfwJxjng07KnLBYgxDseY4RfpbbF9o+35/kAqK2sgNZg1nF3D8Bkm3dbqkw1MM0TFqtj8fEdShFFpThercPcAefRfaQucKvBYFVHdbzoGpgE7NqU9cGXRfbH7H36cn1FKy76WRtEwUkI2E1pzOz2w8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Mon, 10 Apr
 2023 16:29:01 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6254.035; Mon, 10 Apr 2023
 16:29:01 +0000
Message-ID: <868c1fc2-1b10-9326-8fa5-1cb88d62816f@intel.com>
Date: Mon, 10 Apr 2023 09:28:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-5-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230406174419.471256-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d39044-7b34-4548-fbfe-08db39e0b0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFVNgYWwBU0szFvjYmt4xre7WLpRSeC0e0XuRxYzEtP4vleZSADqm8qwWUEE5ukQ+tS4qftpyv1QhkTLm0lG07L1ikAfJJVl8PpQsZz9vCJV1VyIaVJ+593UmOVO3husG46ShQT76+y/8aKqCYpD+vkTaEzbBjW+i/H0qnmyHpiHSJKR0iPC6FSxvWU0yx1X177tagmIFxUQpKjMTiguN5JMFjbpZJIGLnHjYwucL1u1TbHX/QDUiT1n9RH7DANDNs0yMT/rKgCZOtEkvZND6s+axc5N7R5Vd+HFlkiO91WxkWz07TyQFvRvS2/35lMX05xWiQaP13mJYnhSsZOI9MypIXSDJbybrZeouzS28gFeXyb8ircfrVkhGJoepj5Qs/16c1F/y5KsEo+iNeKUvTYEZ3pjfkllUvfTFkqnzaEKgIt+o/pPLZh/i1A3uAIQUToVgveCF5XNRarNs0Qd4rZD898JE7DIBvmJgCdu1jsyT7nvW/YtBhIJ2SIUbrTzJcdtR0nHkIvz8tqyfmvkrfUPEsQFhyBwOWYVek4nlSWu3OZqFN/NUP2vwqT7xapXTbNrr3uLjgv9uvj8Qymf+QUw5Qed6W4Pl7J3/Ckjb+lrek1hnnVOj0zXuhlwMxkcRA2IXcgck6xMhk2MauQDKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(86362001)(83380400001)(6486002)(2616005)(82960400001)(54906003)(478600001)(316002)(6512007)(6506007)(26005)(107886003)(53546011)(6666004)(186003)(36756003)(2906002)(15650500001)(4326008)(5660300002)(38100700002)(66946007)(8676002)(41300700001)(66476007)(66556008)(31696002)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3p1SXFEV0cwNjViOUYzcE96b0wxd2ptblB6YVhVWEpydVZaZWVrNlN3bTg0?=
 =?utf-8?B?QW0xcysvUG5vUExRZitFTlFsa2lzUmdwYzMzSE5JN2s2L0FpN0dkSXVXZW9v?=
 =?utf-8?B?UGpVRkNXY3JiZlZKOEZMZ2Z3amJTNGplYzMrYmxYRzZGVHhwRGlVN3FJc0Zx?=
 =?utf-8?B?VWQ4VDhYK3RLK3ZZNi8rSFgxQnNvQ01PSjFWcXh4Z1lhRXJ0dUhxUHNhZnI3?=
 =?utf-8?B?MHRGeHQyVTZ3VVNERDhQT1dwZGR5Nmh5SU9naTJ2dVFRa2FpcGZNamFtZjg4?=
 =?utf-8?B?R2pWZGlMWCs4ZUZMZnpVVVFCUUpZa0h6QmQxT0pHQjBOaklKQ3RaZ1dsV1NC?=
 =?utf-8?B?QTdFMXhuNlhsMFNyWlVaenBmdkw4WlVTdXpJUlFZakg5QlNyL3ljVlVtdG1V?=
 =?utf-8?B?Qkt1Z1cyL2g3bUF4RjdMUzRmRzhrWWdGSTJ6M0VUc0k1WWdxMllEYzdqU3NT?=
 =?utf-8?B?L1V4MDhkQUhMUmdDS200Zml4UUpQVUt2TjJkaVpaWFFhM2tybTNFcUV5SG8y?=
 =?utf-8?B?bWdwU1QxQUlIZHRIeTNZeGwzb044dE1lWlcybmlmeVBLNmp0YmxPcThnTzcw?=
 =?utf-8?B?SlhYcDZLbS9Ib1Q3ZVVYUUVGOGRWWnhKQ05WNEZ3L280SzBnTEYrcWRSSHpj?=
 =?utf-8?B?TllKRHphWTF4dE1vaHdmc2drZGM3UklRcmtPMkNtVTJFcDc1cXhSTDM5TnY4?=
 =?utf-8?B?d09TOHdyNzNaZzBqSzEvRVNKelViVjZPaVBheXJCUkNlWm1paUhpRFNza1FT?=
 =?utf-8?B?ZTNyZFdZKzRSK3VLdDNpWnVUNlpMZCsvem1BMW5hVHRCUkhrTkk1QU9VWjF6?=
 =?utf-8?B?VDNWSW9pbkR6VUQ3VmRWb2V1NktFWjcxQy9lNnN6dksrcE1mQkhEZjBuZmVy?=
 =?utf-8?B?bGRwZ3dJdWg2aVFEZGRESS90NGN5N09ES3pkMFlVaEhqOXM1aWlsTEg2dDYr?=
 =?utf-8?B?ZmZ4Rytzd2V6ci9STmt6VVU2TkNXRVg0WHozQ0ZMQlU5bEVBMHF3R3QvL0Jn?=
 =?utf-8?B?czZOSm1ZdEFZaFZjQVJQV2pFYzBiR1RrUGtraFZPL2czMUU0Q1hxeXhGdWpy?=
 =?utf-8?B?aUwvaGlFK2I3YWpsSDlHVGlhYWVZNHJXc0tyd0ZYYzA4czVHaC9MdnVkcVRP?=
 =?utf-8?B?T2lodWZLNmMyTytleXg1eTdTVnBsUjdoSWoyZFhneTF1ZVc4MkQ4aGZTMmdv?=
 =?utf-8?B?QWtxMmVhUTI0OXpRR0VPT0VpQy80UU9oS1FVbU9nQ0hBaThNVGI5TUVrWmhu?=
 =?utf-8?B?azRnTXdvbGtPdFgzNE9YdlJxK3g1SnV0eW9CSytOMStrdGdGQUIrb1o2MSt5?=
 =?utf-8?B?c2xFUGlBTjNZVTR3UVRhaHNnZmtQRWZrZHBOcVI2ZmhuckI5UDNLSlhVTWxC?=
 =?utf-8?B?cTRqRXFyMWZNempnNkhSYXBIMEJHeDN1V2FaUE1SRjNYUXJtdHhueXdDV3NV?=
 =?utf-8?B?QkFUazMxZVF6a3RYd052a0NnSzJPT2Q4b1RGLzMvbTRic0Q3aVhkc1NjMVo5?=
 =?utf-8?B?RXlLbkxZdy85dTk0amFHVXlBelZFelJjQ2ljV2YzVTBjaDM4SXhBTHBxNmRx?=
 =?utf-8?B?OUVJdHVRU01tbmZOdlVDRk1OZEFZbVkzN3o0SHBSamFWTUN1R0U5WEdpbXhs?=
 =?utf-8?B?ZWlPWGJaMXY2TTNHLy8xbm1ETk9ZOUVHNmRCakgvYXdUWW1DR0htRVBCQ3NX?=
 =?utf-8?B?aVRRbUh1d3dkS0ZydGg2UlFwdGU5Wk9aYStMcmlkOHFISGliZXpNbzI1QnZ6?=
 =?utf-8?B?WHJydGcwQkFwdEhUT2RQbkhxQWVCWSs5SnRxbndOQy82aFVuZ2h2aVJVVXdO?=
 =?utf-8?B?dGkzWU53ZjU5K21jNEpER0hBMllmRE43dFZzZUxtbUF1eWsxZkdDSU9FdjFM?=
 =?utf-8?B?MlBtdWRlOGlrZncyR1hHUTUzYy9XVEpLdEZmT2I5WW8yVXBJZXQ3Qm1SM0NZ?=
 =?utf-8?B?ZDZ5Y3RzMXphcWZqc0cyOTFBR0NDY2huQkVVd2hhV0NOTmJjSFZZOFU3V3Vl?=
 =?utf-8?B?OFNwU0Q5dGJDd0FERElpTHBTOUcrQmEyNmpZQWVvcUZuQ2FrbEZMQytRdUJD?=
 =?utf-8?B?N0REcmh0MnhpVU05Mjl2RUQ2Yjd1OXIxeThudFJuWld4MmYvTFlUS2NkWW9r?=
 =?utf-8?B?OWlaNDZuZkd4OTlmZktzYkFYVTE2WVJubXhvN0FCWllJbVpncWRLTVpzSi9q?=
 =?utf-8?Q?VoBJzYzG6DiJSPGdAFxGIWk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d39044-7b34-4548-fbfe-08db39e0b0f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 16:29:00.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9se1y0gU0iUn9ixK/z/fx4annLSaug6pJIb0cyK2e61oHyoPjcPB6ergV30YKKsfLaG9RK/Eii+SI6Wm/CJWJ0reYafpmECy0WHFs6vwQBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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
> try again with the gsc_message_handle the fw returned. Thus,
> add a wrapper to continuously retry send_message while
> replaying the gsc_message_handle. Retries need to follow the
> arch-spec count and delay until GSC-FW replies with the real
> SUCCESS or timeout after that spec'd delay.
>
> The GSC-fw requires a non-zero host_session_handle provided
> by the caller to enable gsc_message_handle tracking. Thus,
> allocate the host_session_handle at init and destroy it
> at fini (the latter requiring an FYI to the gsc-firmware).
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |   3 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 240 +++++++++++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |   4 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
>   5 files changed, 253 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> index 3addce861854..e4d6662339e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
> @@ -51,6 +51,7 @@ struct intel_gsc_mtl_header {
>   	 */
>   	u32 flags;
>   #define GSC_OUTFLAG_MSG_PENDING 1
> +#define GSC_INFLAG_MSG_CLEANUP BIT(1)

For consistency those should all be BIT() defines

>   
>   	u32 status;
>   } __packed;

<snip>

> @@ -38,18 +248,46 @@ gsccs_allocate_execution_resource(struct intel_pxp *pxp)
>   	if (!engine)
>   		return -ENODEV;
>   
> +	/*
> +	 * Now, allocate, pin and map two objects, one for the heci message packet
> +	 * and another for the batch buffer we submit into GSC engine (that includes the packet).
> +	 * NOTE: GSC-CS backend is currently only supported on MTL, so we allocate shmem.
> +	 */
> +	err = gsccs_create_buffer(pxp->ctrl_gt, "Heci Packet",
> +				  2 * PXP43_MAX_HECI_INOUT_SIZE,
> +				  &exec_res->pkt_vma, &exec_res->pkt_vaddr);
> +	if (err)
> +		return err;
> +
> +	err = gsccs_create_buffer(pxp->ctrl_gt, "Batch Buffer", PAGE_SIZE,
> +				  &exec_res->bb_vma, &exec_res->bb_vaddr);
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
>   
>   	i915_vm_put(ce->vm);
>   	ce->vm = i915_vm_get(pxp->ctrl_gt->vm);
>   	exec_res->ce = ce;
>   
> +	/* initialize host-session-handle (for all i915-to-gsc-firmware PXP cmds) */
> +	get_random_bytes(&exec_res->host_session_handle, sizeof(exec_res->host_session_handle));

Thinking back at this, maybe a possible solution to avoid randomly 
generated clashing values is to check if any of the existing exec_res 
already uses the generated value. Not a blocker because we only have 1 
exec_res for now, so no chance of clashing.

With the define fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   	return 0;
> +
> +free_batch:
> +	i915_vma_unpin_and_release(&exec_res->bb_vma, I915_VMA_RELEASE_MAP);
> +free_pkt:
> +	i915_vma_unpin_and_release(&exec_res->pkt_vma, I915_VMA_RELEASE_MAP);
> +	memset(exec_res, 0, sizeof(*exec_res));
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

