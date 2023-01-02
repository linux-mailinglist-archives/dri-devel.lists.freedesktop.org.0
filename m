Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92D65B293
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 14:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488EC10E335;
	Mon,  2 Jan 2023 13:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AC910E334;
 Mon,  2 Jan 2023 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672665679; x=1704201679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yi37zrE0XjjpRVZrj0JzNE35+0hwGyg6UI5f8hBXIAs=;
 b=LMJXC+YcxCGogshTGnCAExgCDZjP/lTuVPSX/hwRpXsVSNLUmaLCPuKE
 KoU4aksBR/IWTdqCeWO6GtGxMiHs9apGADvCBwTf+K31k8MiAUcY5wciR
 GOAM2IF4QOH2CTJJbKjve4C2Yq4b+obCjp1cER2lgXWfkGrMxk4NSGnV7
 VwvnlwdTRS4/LGNxmh/q5f3VDdLtZFsz6Sv/Mv2fRjSkMrVzUoylG41J0
 Jx/nrOqkN/XEDUPnzCqJOyd0ULg+ameHeL5scGds1QOSUtP9a698jEbMK
 uOOFR0XNg89ZAmOMYjLO2GOhyEpi7rbcnhioOr/tSnGKRCU37FfzTYw6p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348701426"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="348701426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 05:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="632139344"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="632139344"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Jan 2023 05:21:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 2 Jan 2023 05:21:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 2 Jan 2023 05:21:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 2 Jan 2023 05:21:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 2 Jan 2023 05:21:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwNhHrrreTXfLMBAbkFRyoWYw/xiRsUCwHY10OpZN8tEW7eya8I2bJs24Myz46bl4r2QnqjMfDygIJXvy/QMsJZBKgIZ1LiRYS0w5ALdbM962Xcn2JGAHZpxSilZWw772UVDnsVzAtlaB4tF6QVEoozDKoOMwBTlEpgdmbh4i1ct+AYAzCamHR4i14cJqHX7nrh3KfIKbAjaC4WRqWRNKgIMuHLCu/6w8b+cHzv0zOyjLswGVi2dy5HNAyAWz4Pk1C0yfGwDXuyCKxcOMa2GWwdeDRQ4UIxks4QZIlEkfzsLdIm2pIoaZx/w9duxYK13kfPtiZ3mc2gGVhP6M04hYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6reRh/Hg7Y13TZee//KkwqCv1pbAbOxkS0f1dL0ptM=;
 b=I9pF0I/uT9ch9pkEBkmDb1rVGgJNiylU0beTSWC6zjT14YPBDm6iQ4PBP/oL/6x9bdOJeoJavOHP8aUv1ciha2ggaePuxO7BdzIjBGyZ40/O5WNldUKmi2BkLYBfxsVkaaBBQeHv14ThLjlh1XOvFz9kb2E3pmcZtRgH9urRwLImDB+ESNfRhyQW1EcUYi6Ign64kcpToad113Ab9Fzhy12ZnLMXlcGOn2qBkIh7D/vXyT2YofvXlEvv6SWVsZW2Y3L+4izlYSkfs1SpgHmjbZlwbCO5Ltmt2Jfd6M5keYYGRHb8LAMYza9AhvsVuJqkc4PzPOocb4l0nGvmaCY1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 13:21:15 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::2f13:f639:2761:bb6c]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::2f13:f639:2761:bb6c%3]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 13:21:14 +0000
Message-ID: <ea3f6b18-aaff-fd54-6069-3bb497bc0f3a@intel.com>
Date: Mon, 2 Jan 2023 15:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use "%zu" to format size_t
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221230183500.20553-1-nirmoy.das@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20221230183500.20553-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: c37489a5-1878-4de8-19ec-08daecc438ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dinu3YczA08a7GV0JTShTAFZ9TnlkxRijtC9yLQsMir9D6MMuDeYCkALymgpIR/k2WInraI3aiazIeb0VO68fdJcUYjNF47MkxBAM/CVSjKZRosGy/MTq65H7574YAVFRPwEQVvdQ7/10115pbrHYzWWaRwylABATpmvomFsG/FXwPBtJ66wJRw7QH/BLMMxZyJFN/qy+UyQoNc3k1HSKtvE73gouTUhYRyX7SSfWkX5vgExsjYSURCwOvutqrEzXOlVAz2GrVCQfnI8E4K13VgYWF7WWevmNlaXeHNaNMvtcqPyTyAXaz5udWxF4loULX2CwIvTLco88kCFoTiTKHIzx5mYSXoKV2ijQ+qR2Vm7iGqEKe8pnDfDfZiC1PQhYXFJmtzbGanL4HtAWJtS9Mn/exzprkEDcvnH3GU5C+9N/mFyi6PqIhmhW1ZoFbsuPWp1IDyjPNtES4vf2Vkc9MPKY5DSkfM+mHXJ7GjS09icGO5cAMlj8tO1yhIkGqUKcakjR4f2uaS2qKb3d7SJNhgRLRyji2iI1j4YLvgo9PjLqxZIdlC50u4U/wG2KIM5jTCyr4sEqgyTTMNK35rXLdvN90SEVb6XO5Fka6HfvnppjonYX5BDqsSu5KUGpou//9A+hU13OQOaCAa0cB/yEMbUjC7FsXTHPx8GpMF97sUG7ZzQ45MuFA4oAPvskaOUyh5CnqMXZTId4LMF8TlrqNFJc15a1ObOvHP3Tyr0Bjbzx9vbKf320vNqpnI/yQYO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(5660300002)(31686004)(2906002)(4744005)(41300700001)(8676002)(4326008)(8936002)(66556008)(66946007)(66476007)(316002)(478600001)(6486002)(53546011)(2616005)(26005)(186003)(6512007)(6666004)(83380400001)(6506007)(82960400001)(38100700002)(31696002)(86362001)(36756003)(22166006)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGQ3dlFHKzJrTXNRRS9qZ2hCWDVGeUFCWmt5WHFnRVZqSkdpOGhld2cwbmpS?=
 =?utf-8?B?U3BmT0w0OUJobmZmR0EzR0xJODN1NHNJT0lNTm9TTmJSSEhyZ3RwVWhLUVQx?=
 =?utf-8?B?aWhLYUVZN0h3aDhSYWxiVDZTM3oyVXNMMEl4YkNRVENPMlJ2N2pEaWg5c3RC?=
 =?utf-8?B?dGJJcEVRUncrMGxpOC9hY213M2NscVVMdzNhMTFjRG56TGxVLzIrM21lck1L?=
 =?utf-8?B?VDVSeHdBbEtDOWtEdHowZHliTys1cmJ1YkhiaVJ5UUZXUDUrTC83T0xZZkp6?=
 =?utf-8?B?UTJJWUs2VWgwbC9MUjUvVE1aYXBCQ0I4UU5IRjlkT0h2ZjlXNVM5Y2h2Um5o?=
 =?utf-8?B?clE5eEc0R0ppUWYyaHB5K0JEc0dPMkloSVo4RlNSMW1sbEMrV2dXcjdKa3JS?=
 =?utf-8?B?c2doblZLdjlna3NxcWR3RVduUjM0SUlkcVBxbm9QS1hzL1k0Y1MzSURySVp4?=
 =?utf-8?B?Nm44UXE2SHcvRUo3R3VLZ2t1SlZQWFVQSmxMMDhPZ0tlYTFiekE5UTJyREhK?=
 =?utf-8?B?ZFRsUnp2SkJBamRQWStPamo3Z3lRUEpuWVRNWnhmNFVMYngxK3F1bldpTG5J?=
 =?utf-8?B?ZUtsdDh3NTEyajhWcGx0aE5mQlVmRHozLzZSZUsyclA1ZGtFY3VwSFRENHhW?=
 =?utf-8?B?UXpQTGpWUWg3bGVKYld4OSs2L3FoU3FHNFlMV3ljd2U1a3VjamhET0kvQndh?=
 =?utf-8?B?VzVvajFPSi94RHNQVTZqRGhLeDNRamQ2SHNFMGVRWSt2U3RRYXRkTi92UlYy?=
 =?utf-8?B?ZkZDTitydUk1NjJISG1uRnY1bUE5K1dYTkh6ajdFMHFtT1dxZm9SSmxBMzFl?=
 =?utf-8?B?OVFnaVB3cUdoMUpDZ0F2V3RscUJ6RlNuOEQyWjZFRmFDUHdZcUV2TFBvQ1Uz?=
 =?utf-8?B?dVJOL2ZMWGdYV2F5N3JmZU4wUWlZSzdkL3lERVo0cTc4MTZ1VVdMRElNM2Vq?=
 =?utf-8?B?aVZPUldXSWcwalhEWlNjdmN1RzVSZ2tTUVNjdjIwNEV6YWx0QzZUdUJ2VGti?=
 =?utf-8?B?aXNnR1Y2VlNob0dNN3FCU2UzQmRxK3YyRlV5NUpIQ2JLVnZCaWhGWnZHRU1K?=
 =?utf-8?B?UWp3WmhIYkJFaGpaLzk2RUlxQzFRS3JhTDhoSXZ4d1MxaUVmRHpWME50aSt3?=
 =?utf-8?B?Z1RyQ1VySzk2YXl6SHdpV24yN2Y3OFdLM0oyWE1wcWJIQ1MwVzhwQTBmeGZ5?=
 =?utf-8?B?a3Yvc2psV1BUbFVmMHlaYVB3aE5Ib2Y5WjBjbFNDcUFnWXlJVjZ1cFNXSDdG?=
 =?utf-8?B?TjhBR1V3TXVldm9NR1dFL0ZnQzFSOUJxMU5qckxtZWJoVlQrSkFJUHlNTjJS?=
 =?utf-8?B?bU9zUHJnZGdTdHovQkY1eHRMSHhYVUUrcm51cUVTM29BQnlaSHpxcHBMVVZa?=
 =?utf-8?B?YXZrazl5UTlwQ3hwRU1TbXl5RlQ5ZlcxVUNMU2pmdXRhWERaKzhlTjBoaUZw?=
 =?utf-8?B?ZDBJZDE0cWxYVnhwdzFaWDNzdDVIRVowTENuSk9hMVJQQlIxZ3ViS28weE1X?=
 =?utf-8?B?d1ZQaU9qSGJaYXgzeGFweStlakVsY2I0OGdBZjUzbnV5eThFQ3NDZS82ZnNV?=
 =?utf-8?B?bDhtbkh0b1psV1phTnkvZGpTWjZxNDdmeEhkMTUyQWQyZlV6RDRPd2ZGenZC?=
 =?utf-8?B?UEN5NlJyQlhlQWd1eUUzNVZiN2J4QXczT3ZsSEE4Z2JiMFlMbWprMUx3OUVM?=
 =?utf-8?B?Q01Fc0hLT2tYd3RHelBXVEZOYTQzemRjdFFWNE5jUWlXRmlhMDhEa05Ednpx?=
 =?utf-8?B?NHpFcy8xMDk4YlRGbksxZjVSL00rRVBTNWlHK1JCQ1RkdXdhZVlQYVZQQ2xE?=
 =?utf-8?B?NWExT0lKQk1wdlZUNkJ0ZEMxVXFMcEYxZE1RUUZ1S2dtUnc3MWhic1ZzamFV?=
 =?utf-8?B?VXdWWkZudXg5d3I2ZVd6L0t6L0cwcm9QMkxWU3pMUXpuWlI5NU14S2lhakFQ?=
 =?utf-8?B?SGJEYU1vNFZaN1lBT2VBTnNpenY4WkJ2dmlqQ2UySlBtUDQ3TTFmdGcwM1hP?=
 =?utf-8?B?NURwZ2cydWlEcmpCcVpDZFlYajB1Q1ljckozQVhSNE5vWEplR1g1dC8yNlpY?=
 =?utf-8?B?d2ZwZStlMDAxRlZtZ3VBSHVmVVBmUGQ2MWx1WDZWck4xVmF1YVJlWGduVnVw?=
 =?utf-8?B?T3hFMnA2bWp0NVdNcUZIamtFdDY3SFRRRTBFdy9TU3Z1MUFpTmh4bTJVZjNK?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c37489a5-1878-4de8-19ec-08daecc438ee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 13:21:14.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOHfCtMdiMbetoajR7d6xRzh6pmj3uPDwHzoAaAN4CbsO4dcIPeDKnEaUPsHa+iHI9FDgFhumwVGD/Vuto8+dgtu5uLbtsRX8461ciSsuDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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
Cc: mchehab@kernel.org, rodrigo.vivi@intel.com, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nirmoy, thanks for fixing it

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 12/30/22 8:35 PM, Nirmoy Das wrote:
> Switch to %zu for printing size_t which will
> fix compilation warning for 32-bit build.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index e767791e40e0..114443096841 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -238,7 +238,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>   			goto rebuild_st;
>   		} else {
>   			dev_warn(i915->drm.dev,
> -				 "Failed to DMA remap %lu pages\n",
> +				 "Failed to DMA remap %zu pages\n",
>   				 obj->base.size >> PAGE_SHIFT);
>   			goto err_pages;
>   		}
