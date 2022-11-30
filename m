Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892663D9EC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BDB10E493;
	Wed, 30 Nov 2022 15:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741C210E066;
 Wed, 30 Nov 2022 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669823486; x=1701359486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l5Zm9Qf4FxAfFkkSey3FaXcYv1kv3vtyi7Op9quMcWw=;
 b=bYlpzy46WzuWufmrUA133XpZG9BAzxtok7BqW9AvOdAwUlq9Qmq5ix4/
 Nut8EfJZVaNcAGGgfu3If7yvqQdtlVWirGMMyR0HF8hnY74HLiQonsxmH
 8qMB3U8OziKevR0/60vlcqLtkoOJExjah9m6nQYDVro9Myt0696GgIRtk
 DU08r2a1hBV9YpglacTrqUy204IjfjqGd8vVJfd5tYaOd5+03kuRs6TbW
 d3975hU5u1vxjdnjxz3uVDVUPaKYxoNgySGNOJR8fLJlrOoDBwIrmemXm
 XYVKG3zMzOHp+aeAogfXj0df4DHJ1tns9B+HZkspmsTsbqWjgWhWkMEjp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313051312"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="313051312"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="638033382"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="638033382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2022 07:51:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 07:51:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 07:51:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 07:51:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXZeA7owQS+OtzKeeeeTd1uaFHQf/FxTLvTXaq7alfvlfIqAaJtdDHMvNdSzITRmeugKFi93DioSn18F8SQGNZF8UeZCKtm3evIqdadSiXyXP6Myc/Vqd7wqrhWmQKnep5gZv25Q2XHh14iNV0cj7K8gcSj0994RNKy9YsFH9eMzc2g3Yff85IKdqpUNquP8RVV6yNWqz286dXBaQYOlWmknMjNTJ1OE2orDHjYAgHB38+CzefNv0yCfam6nCbSOQuxY5c6bxqfXMRypkWFRPKNBjLfNybS0eaZ5MwCjV4rQnnuHA6WMJA+NFoJQz7VDs+dhLlgTRNEFvbh4HrB3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh3Jz09B7flkHdMFj4/GGe5/SLnS2cHc98C3qAS2Ng0=;
 b=O/mgQerRPDEuOSh+v90boHKNKZKGdkC1wVTmSRRS/p3UCE2qIND0Wu79pU1pdy8g44ccIoA+1OKkj8BUO7uStspKnM9GI++I7BsAwgDJtFk+O50Pe7mQp55tlpH60ysBDzTH+x253PZC4ijbybMnXe/nbMi2+FXfTLUey2iyk7m+8y/XbREo1WkWpdS1TwmGuHaazc7STJzjyjZIBLkoqVrs5ev0PVbfQB8Sr+pnQfgj4XZ4IeCu5QXsX1tdLZjPN+TfrgZjjHuXyr1c+L5CkxVKArWuJbhG0DuiWjwkI7Hp6+wuvjz1JaOqMTt3PpRXHjDB5grDk+HiWZE3qZ4JdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 15:51:16 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:51:16 +0000
Date: Wed, 30 Nov 2022 21:21:07 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/5] drm/i915/mtl: Hold forcewake and MCR lock over
 PPAT setup
Message-ID: <Y4d76483JRj5d4RL@bala-ubuntu>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221128233014.4000136-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d919de-af3a-40ad-c876-08dad2eab702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MiKMN/EMq0KHlnD64oaqjmdrlA+ePwOlXvp1Y5IOO4pNctEiKCdBuF73ED4o4gOcB4pItTNvdZ4s6lft/RJqQ0KvgyRJ6zWbQEJfwWEJ9QXSE9/Gbrf/fMQKxyLaMmpF4a03UbA6CJdbeian2bIE8PbujmThcpd+7PjfzXAWPpu+gII1h5E7XflhTKcrFnJOSjlzz/Emoo8E8r634oTZa2kpr6nfgT8fCSbMH/YMdwt/0nfNernEtLx0FfXI4BVutir3XiYM2VqpVZtfFsSgmAJocGyOvu/fJU08qoUNYCY3NGtfjfNTUI0Y6sLWaSwQ/4WWB2zo1IifKBcsCcQLP6SvPemEAE4rdQQouOBszl8RGUQWuzoQa5m4m0FEdBpn8z4GVaN2D8P3vI8ovpxwnX8sRs5l3A9J+3VzLMZVUbJs1ZazdT3geFXFn56Dw5850wCqnMPeZ0Vp3ZIADTWiP1U/vB9nOv+h0ZaE2X2cySeIIrRzYL+3bBvTZUKbB6jOmcHPzrGvncnFSYV8P9b2EmW+G7URzbM/zO6NqJ5kNp7exZ4B/R79gq5/juf8HTNMY1XFNukm3NA/zOMXrl6bn2BXIigQt86UkvPP45sprdgPiSE47CHQkIS3glowlRa98nX2nJj2c1kt9ak8+fFrCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(6506007)(6486002)(66946007)(6666004)(53546011)(450100002)(66476007)(41300700001)(8936002)(26005)(8676002)(9686003)(6512007)(5660300002)(186003)(82960400001)(4326008)(86362001)(2906002)(478600001)(66556008)(33716001)(83380400001)(316002)(38100700002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M01kMEFCUkgyZHplS2hubXRFeE1uU3RsV09ZTExQbnNaamIvSHk1bDYwcUdV?=
 =?utf-8?B?aG5oWlZTd2RaT3BuTUNBVEtWMENYQVRlNVpmejMzMS9jTzhwNFJuLzFNMFN3?=
 =?utf-8?B?UWdPR1FXRzNBbFFiMzhNNmlOMUdZTUhSZUpLeXltVmR1bkhuYnhSWjJTZWUz?=
 =?utf-8?B?TVd6aXNIVFM5RldhbllQMVVlUDFGN2hOeHlrRlR4ZFR0azgrbk9pM253WGNs?=
 =?utf-8?B?eFdPdEd4R1VNRnJKVEtMTi9rWldsbnpBbTVMOHgvL2ozRUxrV3QyUDZ3MTNB?=
 =?utf-8?B?MDl6Mk82aTlyT0RFOVNBWlhVcm5OT1k5elV0a1A1cXpCVU1rMjEwc1A2dUJ0?=
 =?utf-8?B?SjIzN0YvZ2J3OFVESkJoRUtsUVZPSDJBY1cyVjVmTDlNVDMxUkRTeWt5RjhO?=
 =?utf-8?B?ZUdObkdUOGNncEJ6WnRIOWFYeHVTQzh1Mk9iUGlWQlRPQlRCZm15UExXWFRn?=
 =?utf-8?B?ZW1OR00xYlNXdVZzdjVVYVRXaEJyTjg0NHpma1dHaGV6UFJoWSttUUVuM1pv?=
 =?utf-8?B?a0U5Nkt6a2o5WnA3SUdrUjRVa1VuajhHK0RMY0l4amhXYmFMT0tiT3pjWFZm?=
 =?utf-8?B?RTFoclJURyt6V1B4QXBhZVBnUlhTOHlkbWltVkRtS0RRWGxXekNQT0FFZzg4?=
 =?utf-8?B?QnR1NklzcHZTTnZhZWh2bTlhMWdTcm9KNnBTcFpPU3kvU3RkWkRpWFBRaEZG?=
 =?utf-8?B?emlVanZ0ZVU0OG8rVVpSb1F5UVpweENGU2VZejJTbmxoTXVTc05jMVR5R29F?=
 =?utf-8?B?cXYwWkxKbmUvR0MzUXRmMDFZcFpuQW9uKzlwUjNGVkxMZ1RlMEVqUlQyME5H?=
 =?utf-8?B?b2R1WnVyWHdVU0dPblZ0cVFSbUpRdjE5a0dNMXF2a3Z5WHhJWDhKRkpUekhP?=
 =?utf-8?B?WWxiVkE1MFJIOFloUW4rQXpmc1lQS1pLQ1hyWUV2cFNlVjRxazFYUk5tZnVk?=
 =?utf-8?B?TWtuOVBaZldWL3N1eFNwOHhQQk5UK0RoRFBjRFhLdi9aVmRKOVc1aUhKNmJ0?=
 =?utf-8?B?cXR4OHVVYWNtSHVCN2p3aEZqOE9IaXo1UGxmUW8vdXdZTVF2enNZeEpLRkta?=
 =?utf-8?B?SVVWNzZGeVoxUHlqWUwxeHVEaXFFSmJXTjQxWVZNSFJWUmRzVzhQc1hheGR2?=
 =?utf-8?B?QndsRjQ0R3RmMlNTd2NoVHR4SHYwc2NhU3o3S3BLWGRqbVlSckY0Q2cyZTN3?=
 =?utf-8?B?N21GcXU1ZkZxUGc3bThWNzVEYjdkbk9xRXc4blNydWtHVXIyVnlncEhqdkdG?=
 =?utf-8?B?R0RpQUpLZWh5dnNyUUZVbGtkRWR1ZHdLdWk2VjZ2TE5VTlp5T05lY0FhcERt?=
 =?utf-8?B?SHNHN2hBVlNpVjN4LzdjT0RGa0RFM1lWRklaSktYS3M2QldHZ1NuSFluVWxj?=
 =?utf-8?B?NlQ4TnBZcEp3WUk1UHVCTmN0bE0vRWJpOWxEZ3VRWGcxQkt1QzhhVU9ZNndU?=
 =?utf-8?B?QndIbTlWRE1iRHMxeVc3MDUzdE1pYW9qT3l6eHZzRi9GTHNMVkEzQ0pVcjF0?=
 =?utf-8?B?dFlPS1pMV3VFMnZtRG5BK1gvZGk4WEtVUVRpemJlYVFZdVg1MDlxWnowMjIy?=
 =?utf-8?B?VzFPVHI0ajJkMEZKVTBEMG81ellDSTNLdVNQQjdHTVFLVEpFT1NKTnBFZEsv?=
 =?utf-8?B?TDluN3ZBTTdRZnNSd1dEb01ZVml4RlBPU0ZwQkFUVnlZaTVKN3d6RWR0Szli?=
 =?utf-8?B?TlBMNGUwOWRUNGdjY0V5anFDY0dOenh2VHBQNTVIUUo1MFZHRE1wZXoweTB5?=
 =?utf-8?B?cFZKemNRREU4TnpwanYvQmZiWUJmUVNYNDdIbUFQUVFwdVB5Z3V6YWpDeVZu?=
 =?utf-8?B?aFI5S3BFdFVoMU9UTGg4NUNQTktjby9IQmtRSW13STBKa0pKTm5MMjlLT2hM?=
 =?utf-8?B?cWFpZVlNakppVEsxNUFRN0JYYis0NkRlMW5QTW83Z0g2WDl5TmRaeW13NTBr?=
 =?utf-8?B?QTF5Q0ttQVMwbERJaFRzcm12SHlhS0Z2OWo0NTIya3FHZnQvNUNRa3F3Tmdi?=
 =?utf-8?B?Z1B3enRsa2J6Yk5YUnVCa2tpd04zbThuMU5uUEs5aTdENmRKaHFEcUZXSmRL?=
 =?utf-8?B?VTd0WTZGYWh5MStIak9qWXR4LzBIeHpPeFBKRWxDNGJta1lwS0tCKzBySnhy?=
 =?utf-8?B?ZWJZVGdVcDRHNWMzeUs3TjNWRzAvMWpwV2hwaE56d3MzaDlaYk1Gamt4Q0dJ?=
 =?utf-8?Q?NwjCaFxCtZsvKDHyigDTjH8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d919de-af3a-40ad-c876-08dad2eab702
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:51:16.2658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BguT+H3EyQl78cM4VqNdeUFJoQO00lWQU9BquA+3YW/YXjGhoTdq63TQueB0vy6bx0vmFNIfGNw5Rw+3Un83Tezr15WLjjYg3Vy2yusmAwo98AaegrzwWXjTWonagTaT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.2022 15:30, Matt Roper wrote:
> PPAT setup involves a series of multicast writes.  This can be optimized
> slightly be acquiring forcewake and the steering lock just once for the
> entire sequence.
> 
> Suggested-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gtt.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 2ba3983984b9..288d9f118ee9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -482,14 +482,25 @@ static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  
>  static void xehp_setup_private_ppat(struct intel_gt *gt)
>  {
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> -	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> +	enum forcewake_domains fw;
> +	unsigned long flags;
> +
> +	fw = intel_uncore_forcewake_for_reg(gt->uncore, _MMIO(XEHP_PAT_INDEX(0).reg),
> +					    FW_REG_READ);

I am not completely aware of forcewake implementation. I am wondering if
the last parameter should be FW_REG_WRITE since it is register write
which is happening later.

Regards,
Bala

> +	intel_uncore_forcewake_get(gt->uncore, fw);
> +
> +	intel_gt_mcr_lock(gt, &flags);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> +	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> +	intel_gt_mcr_unlock(gt, flags);
> +
> +	intel_uncore_forcewake_put(gt->uncore, fw);
>  }
>  
>  static void icl_setup_private_ppat(struct intel_uncore *uncore)
> -- 
> 2.38.1
> 
