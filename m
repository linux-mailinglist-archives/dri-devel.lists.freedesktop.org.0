Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84806EAEC8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13510E222;
	Fri, 21 Apr 2023 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C60810E123;
 Fri, 21 Apr 2023 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682093376; x=1713629376;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4YzsvILi6ENQrVvI1z29Ts0b3soJ8gkkPOqo7nhvrWA=;
 b=iKI8BNeEqRW0gEV5LxbwJfwU3rQusVBM4X09S7xuomgN3xUuy9w2I97a
 3QvcwWAKgbaDnEKUtoRBrasidD2x2tV5FXeSJIPXwPJmnvk3dSk/jiEy6
 5Fb8qoSnbcJ8X5Nioszzw5yDDeI4euRj0lqO+95u2Iny84UUVLyfFFZbi
 xzgg/x6b7Es6AON/R2xFCInhM9VUddlLwgmnMibyHxJrCnYs3xMljYk0h
 9FrGFCkCjeROi6R+ETpGgJ/ptsQe9NitF8wHw+XjKuYhrPjW0iqHCX3UJ
 9+LKViwUDdxHjkNZ8AyBIc37YNDC3DOy6Ml6H910ajuD0vrDHsvTuwrMC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325626028"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="325626028"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 09:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="803779901"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="803779901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 09:09:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 09:09:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 09:09:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 09:09:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 09:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKJ6CTJKEqWxpCQzeLIdqxUIbIT1KG63KARjzfEl5nSS/0niElt4bgNLEgY7uc43c6fxWXH8aM8q4txVBBrVKI1Bv/DYgx7Cs/d/rzha0BZFUn/KrZsttcJvwp5BkV3isYfTARua92TNPBRJUgCyeEmgj/v4R3JLddpKgci3w4LH5M5mSOmo+45RqnwjsPLtWIqK7Qb3410k/I/nKKvEZfTm89GB5Amv+rDnDieTJwpHRhJarjTyMc90Bn6kLfpOAHRFVNmb7cZdajZfPHF29q3xQlFLd/Kxfr3il4vFgv6ucykGQUIegAcfKlulq93Kf3+HhVW/h4M4g+jtrVrYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tedO6a9dKeTgUlQj1be0thniaDeSANDU7YYgO8W0lUM=;
 b=HU3srmVIo8K5gxuNk1TRHnEpCb0a1dRDbfQIn8/oJUUisbMW0t+YDG4uFI7iK2kffaIo3zrN72l0vjpvFX0hkx4FYnBghLyPxUCzwLdncvc/Nim0Zw6H63vEomHZ4BH+FoibXC2cBSYAGuhXMzlvW7pXxR0VZMz6DsEIBJCkXiLFYI+HpdpKEo9JePnXssHFaJWTXio4sSFwM6zZzirUBfTxqsCTOpzFtwfwt7GqSRQIirh04DzT5Ar/bl/Uob2jbxto22wIh0t166rCqIBRIxo+BK8s+t8XRp6tBb1IA5ay0nG7ZbXdSU9yvhCK5AryGIOVJKCKN0ESpMBSN83Qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 16:09:08 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 16:09:08 +0000
Message-ID: <55d3abe1-70a5-9a4e-1bee-04cb8b9d34b7@intel.com>
Date: Fri, 21 Apr 2023 09:09:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
 <20230421053410.1836241-4-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230421053410.1836241-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: db327326-3969-4b64-bbc8-08db4282bccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da9Ey6WgJV7B+R+3APA/4zMgKFbBCig2rcn9023UQyZ+xVf+vAVLAXZQojqQjDopBYb3/nVUx+ShpRUKZEKjsmFR/XIucO1z1AzL5iPrFVIM28oMlZ4oFx1VZduU2SJ66tiyHyyLh9MdoP15V77Zoo+81mrhzV5fw9A5anYuVPOvSyq5HrYkkn7dz47tKoc7IDyNfVxdePFxjR+rW/aCwDLIie8QzPAGbTbhRo2tNXb3qLWSRFcSLkNuevnQ4ieNbjdagBPftiOJHpN4b4/400EGQD9Rfn5CoOMw3oHQqhaRMe4ET0KL2Gjq5zeZvRJihUJJZGw0ZQ2fAMzKS0cR7m5u4Z2X/0eY92KXlqf9JuCGwGIgEZwG9gg26QxCulW9pM76ZnPgI0fB+aeHWjIQur9ySusER3PCY9bHt1dCIlGI1hnVrKL61CEdWEWR+UwXUtFevWLJxlcCWxfuKbxvB8CG5MPRw4Zx5PEexrQ69H/V8aQ4oOUc/I55ZWwT3wP+IyVnnuD9yvvOXYljwcGtTr9PHLZUCESAjwpBUxH6yBT4KiG/Rb5oT0Y5k8XM4CdbZxs5BN3eo+UEljtxE+MR9OtE/iNlnJIjeY9yc6Vxqvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(186003)(38100700002)(31686004)(31696002)(107886003)(82960400001)(36756003)(478600001)(54906003)(86362001)(6512007)(26005)(2616005)(53546011)(6486002)(6506007)(4326008)(316002)(66476007)(66946007)(66556008)(41300700001)(8936002)(8676002)(966005)(83380400001)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHpGdnhJMnF3UGs3cUFxV0JUaUZYSUtqOXdNVlZKck56aWtyK3g1dUY5aVA4?=
 =?utf-8?B?RGorRERaRitLY1hzb3FVQmJPakx3L2IyN3FWcXZ1T3hwcTIwOCtTVGt1cUFj?=
 =?utf-8?B?SUg2cHk3RjhJcUZvLzE4ZEI1VjFpUHZQUnRtVUpueDF3ZG85Z0JmaENMNnY4?=
 =?utf-8?B?TVZRL3J4ZzN2bHowNzBlTHVuYXhZc3RqUnBwOTZocndJTURoQWtZODFQTm9H?=
 =?utf-8?B?YmJLTlZGVjMvbWNPK2JPUXRIM2hDWm02WEljYXpJQi9vZFlENUYvSlNkYmtw?=
 =?utf-8?B?Qi8wTUdjakhXVlBVZzhqUkFoKy9zUmFFM0RqL2ZsZThKeTB1c005UXppRGRk?=
 =?utf-8?B?dUVjMlowY2ZIMGhGUkU4SlNXV200c2FpTWo5TFVRWnZLMzhjSkluenF1NG5G?=
 =?utf-8?B?SHlOOWFMRm1FWlFISXhFNHdQS1owSlRaUXJ5bkNDaWgzSlRsbnVqMm9ydlpM?=
 =?utf-8?B?d1pLeWQzaGFhTk9adnRaS2RqNW90RUF4ZzRnelQyVzNvSzJqbXlWY2xaMnI5?=
 =?utf-8?B?bjNManBucTdYVkY4cjdyaU1IdzNET0FYcU1wQnJ5MkQ1R3NoL2o0Q2d0bEFE?=
 =?utf-8?B?YjlaeTJOMHg0YUtSUXRaWG5KZUJ2T3AyWDBWWUl3YlYrOTBCY2F3cU8xa0wy?=
 =?utf-8?B?NG1vM1RJc1dZNjNIUmZ6WGVCVVBuMTkzdzNRSS9sUnUrWVp1VjB5U0NXSlAx?=
 =?utf-8?B?Qm9LZS9qbjdETDVyb0F0Y3ZNQmtYSzRlK00rQkcvK0xYam9aV1Q0MWNTZFZ0?=
 =?utf-8?B?dXljM1o4UjI5QmdEanF0elVJZjVXQUF2UFhncFl4cUZpVlNrU2w1MW4wWnhR?=
 =?utf-8?B?YTAwYlV0OVl5YW9PNitSWVFaWTJLTFBOMEZXUzJyYVlrZUJmRW84dmRTNEEy?=
 =?utf-8?B?WmdtRDhsVm54cVhTVlRKN1VZK2F2aS9XMjN4WnB3bStRY1UydUJRclhzbG1w?=
 =?utf-8?B?dmhoL1huMUVjYXpzQ3NKbmZYZzJIdzBmMFpVbXdsVUd4RVAxWGRqRjE1dlJv?=
 =?utf-8?B?ZGlsZkljNGpIYzBoWDdOL2VBYnBuaXE2aVV2YmdBRnE5Q051alprcFh5aEFv?=
 =?utf-8?B?eVdZdy94UU52Nks0VUx0Skd2YkxtYXo4RXFyUjBUdlVDQkgxUmhUVk12Q01Q?=
 =?utf-8?B?aFk4MG9LTFFLTmZMOC93MW52SkMvMGhtSUx5ZkRUODVybkRCZjJMZkxxQzZT?=
 =?utf-8?B?SEVxRFVUWmlIcjhjR0FILzU4R1hkY2hVTnVjakxuU0RlRC8yM2haR1dId3NC?=
 =?utf-8?B?R1RvQWk5V3dQamV6cHZHbUwyK2k0cEs5bllKV0dYWnVsV3dDQ3UzTWsvSFhj?=
 =?utf-8?B?dW5PdmJEa3E0SEZmcTJSMjJQaG9EK3hBeHhEU3I3QkhFKzA0NVZZUW5FNDBH?=
 =?utf-8?B?a0N3TnpISzZIa2lQdGVYSnp3Ymk0bGduK29oazArV0V4aE12MWxFeWd5d2xm?=
 =?utf-8?B?WHAva3Q0OEJsazNuZlV2aDNCekJmd2NHV3lqWE1nck83MFd2TGRicEthbjZz?=
 =?utf-8?B?RmJoUEVkME9IMXpvVGc1NTRMeERocVV1dGJSc1Q4Vk1hUlFPUlpabXV1am8x?=
 =?utf-8?B?NE8yVlFobVc5T0thUXFkK3lqTEc4N1AxQmc2cEE1NmR2UzdBM2NzSXROdlpY?=
 =?utf-8?B?MG1jUXVkcGQ3ZEQ3NHlVQjY4dkRmM0oyVGx3TkcrQnNaVmtUZXNpeERZWnFG?=
 =?utf-8?B?Q09tRnl1ckJGNVdCOVpTZU1seit3RFFzQTY2VUpST0V6YkloclJRYTRMclRt?=
 =?utf-8?B?V29MTE9mZGpzdTRsL3k0TjZpSmwzTnh4V3pHdmUrRStRRXhCRE1teHUrRlVG?=
 =?utf-8?B?TTVlcWx2TU5TWUlVVzJBeEIwVWlBdFdzbTQ5a2JwY09SSkZ0V1R5NnBadHJp?=
 =?utf-8?B?Wkhpd01sMjE2R2diRjFKODRhQWlwOGxjN0RkazQyRGNNYXVLRkw3ODk0QlZD?=
 =?utf-8?B?QjY0a3lQaXBMTnozd09rdGZTb1h5c0Y5cXd3OE0xMm5QQnVZTUZxN1o2MzEv?=
 =?utf-8?B?cjdjMFRYb2FsSEtCRmtwdkZOcGd0WjErazRkT01naDAwOUdiUzloT3duOUg4?=
 =?utf-8?B?RTE1Uk9GeENNd3M1TThWVHRHQjJmWmFrWEc3bkxMaUk1bXNDSEdHWmlSZGpD?=
 =?utf-8?B?TlBRLytvOHU0UC9OYjAzckhLOFpnU2xYYjErcW5WYUhCcjhIUGpMOURRV1U1?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db327326-3969-4b64-bbc8-08db4282bccd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 16:09:08.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL4iVc4TLcVolm+EjB86JN61GkdIcmGJ+KtwF5QMYIbPSXhaDD/Ro+hXMCQHgXWA27a6pB96l36sHqcYRdNs90WIDyPkgDd8ZMxll+5UIdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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



On 4/20/2023 10:34 PM, Alan Previn wrote:
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

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 102 ++++++++++++++++++
>   .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  23 ++++
>   2 files changed, 125 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
> index ea0da06e2f39..579c0f5a1438 100644
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
> +	struct intel_engine_cs *engine;
> +	struct i915_gem_ww_ctx ww;
> +	struct i915_request *rq;
> +	int err, trials = 0;
> +
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
> +	err = i915_vma_move_to_active(pkt->bb_vma, rq, 0);
> +	if (err)
> +		goto out_rq;
> +	err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
> +	if (err)
> +		goto out_rq;
> +
> +	engine = rq->context->engine;
> +	if (engine->emit_init_breadcrumb) {
> +		err = engine->emit_init_breadcrumb(rq);
> +		if (err)
> +			goto out_rq;
> +	}
> +
> +	err = engine->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
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
> index 3d56ae501991..3f60cbc011c1 100644
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

