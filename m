Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B35F169E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 01:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEEB10EDE9;
	Fri, 30 Sep 2022 23:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C2F10EDE9;
 Fri, 30 Sep 2022 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664580320; x=1696116320;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gXHl/QM4ApdEFMF58b0mlQcJogqd4uGq02nme1Dkvds=;
 b=O36iFJk8psUljM5HGl/Z4LcAhwC397Ml2aYq+GeM2bz3JpzqqH6oS7nx
 daW/8bFYGPNqdAV8tfJG6SPhJF9DrX1qyqdD5MJwarR295I687VI60ah3
 gOfitFh0xeAkPt+ygeHqjdvIN2wUR8xMA72M8VMCRchBL2X2YGngamvYT
 9oP6L0narZY9NP4z7/0NIvzjX6jCjyzt4V0efITvZkSpzbTkfI0Ko2Udn
 SvUJYxQdUxsf0Spmqk4L7fWuQal9mQRnFAn41XZtKMfFERVDllTlYILFp
 Y1NoqFeeoBPV4gCCuYY656tx9TvDqC4ibPDAfKm2f8szbxLeGpSNGgRfJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="303219841"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="303219841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 16:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="653713677"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="653713677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 30 Sep 2022 16:24:59 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 16:24:59 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 16:24:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 16:24:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 16:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW+x2FctfBVmHQZ0nLyz9bdeX2Sc9Fuwi5cO4QTHf2K87B0ReYCeF+IoLb2dQxnKMipaVB/+CTPvY8Aa7xcUioibn5/7LYjsERmgXPmwg/uokop7VDv35nxlO82JIkIj+E7nBk9TznmCSSd7l13SzVzhyHljecb+p6C7EN/e8rvBChO5P0FDPVye67G96OeOeAlJmxUENl6V27tLTF4xJnGXan+16Qy0lADxSP7MjbmdX5ykJb2WTNdSC6jKWMOun9yA8PJEkydOc/nuOvDDFh2gGzcj9zh2g3ahRvbMzylfiHglukoWczL0+oqEoZHSvZ5MZCw13ESJQV64ZsChtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRZxjX25O9qVhAWueZIxegJibtBVL4EXnM7xWmn+hlc=;
 b=C3au8bWZ06IR+vwi1rXlrjVsimPXnFLZhCS/Zvgk/7dFo+2nFPcprLQHQQPeanZad5Uxwr9+XCLS8XC+v4iIFuID+H81LlnNzYD/mIv3mna/kLZW/HArOBMar/F/zsPQN2FOiBniNNy9NbQAMVWvc2yZwanzrDXQlNyBwnfWDx32QmtW9vvVPPKO9tBw/HdcE9bFVqX5V4bMYiBF0SDH8OB939hec/zOy9GVnkpL+M2+aZ6Ttk5/3L401KCfAwyThWm6B8SsojGrJcLtCV+y4B1mvEcNSdVTdj7n/HjIIMKHSZBIbcsTFyCbY+LiIF4DKg5SnBOlXiGCYH0TY0S4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 23:24:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 23:24:56 +0000
Message-ID: <28a2896a-f240-e7b7-a127-b2782164ff58@intel.com>
Date: Fri, 30 Sep 2022 16:24:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220922221117.458087-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 186236c2-0aa2-416f-f1a4-08daa33afc39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: keqNZhe2QUXFx/kN/JGBNoEVBIL0y9rZrlOkXjVhQmoPQEffpC3F2Dsp5ay2BZtVib5VARG721PJjAS/DJIANP+9kNzeE+A5XlT3Ia6WHzTqx293wVtTwVdYutfiihelYTfJr+RH9knkLs5VPE0jU3/ig/2UokdUzDANnGbMjxp5hSBH+eKFTryncq87Wlb56TwLuFtqgymALNfmqi1sTpThzNx5jRC3UWYEIxkxVljMGGudPc4hfaf1G0YyAsSJdWmwFvJ1XBNrMOIhrcCW7M2NF62m9wagauHqSzFNXqbL9sbgHxsaYXE088saBnLikecR7p5sZfuzfcq3eA7BuO28Mi0IX5tHPc+Sv+R0VnE1pQhm/24KOshZ0pDBMg4qYNbR20FIcAU1l9qhw5TA4/OBQyUCEmNTUL7m4NsdXmLDra57yw38taj+k3AXq+R5MESCKC2sSCV7VMIQWq7e26b+tRfA5qXk/AO8gxhQXhqwxncQNvbUIbr/vzdNjXHgW3ysBchtBXxlROU3DYN8hnXhg3T3tCaNDS4KsoQpiWmB3I0NK4TBLK2hQzQk+0P743BujFXIr+gnJU8s5HpH/IjVCJrmQmzgnPsUETSw672KJU18bmFN1KaYXDnJQuaJluScXnH4Z2EUT5I2DaR8cE+MP2GAgKfVMsvxSz9vIzWZIyyQPXA4BNYtPf8OWSyoct2kSYOZeqm8ySmk/pLX4w+GaG44ll1NCg6ZMjxzqPXFXu7LMwtZYG0j6VGLpO3Fv3k9ipXV/4TB1TIAeU9IfCnalgdHsfRloO8Ku2OVozY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(8936002)(186003)(2616005)(36756003)(2906002)(41300700001)(31696002)(6666004)(107886003)(5660300002)(6512007)(86362001)(26005)(6506007)(38100700002)(53546011)(82960400001)(83380400001)(316002)(478600001)(31686004)(6486002)(450100002)(4326008)(8676002)(66556008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWYyZ3pCeTZqSHJ1L0taZVVwY3czVUF2Mkc1NGdnejJtWWl0My9ScTJrY3pn?=
 =?utf-8?B?Sk4vVzBCMHYzcWNscm1xbWRRczNDN0EwMmpTS01FcHdMZkFPbzlmUHlLVHBw?=
 =?utf-8?B?dW9oSGRISEh0VzZlSUx6NDRQVitRYmUrTnNNcmxZY2hhUzZ3eWtwREhFQ3VI?=
 =?utf-8?B?TTB2Z2NxcUIxdFc2d3R1SG1JdmJoaHpleXN5azFLUXBQMTdJVk9zNmRUdzNG?=
 =?utf-8?B?czA1SDFVQTIyV1dudjNQb3RleUZBK3orWnJvQXBlZ3NsbDQxcDhuWEhheTlv?=
 =?utf-8?B?ZVdKVzN4OFVpVmY0T3hqNjgvVGdGMEplbDUvOXFnSHBwdUtoRERhNEdvbHZm?=
 =?utf-8?B?NmQ0Z0N2bUgzS1lOcnlJUUwrY3NFYWhpTWVhVnZnTjRoNEViVzVCNDFYREJj?=
 =?utf-8?B?Q2djTVVXMG9ZTDJpUU1SWlRQZXNKc1p3RWUvTnNZaVA0Q2U0SDd1aW1FZkF6?=
 =?utf-8?B?N1M2ZCsyT3VhMy9CaEZnb1l3bkhTZVF2T3dlVnJXLzA4bU5CMTJEYzBsQTZs?=
 =?utf-8?B?ZjNDMVdBVXpzUFdPbWR2RmNVbmtSNmhPaFphZWFkY3hkNjJiT2VGM25jRFRv?=
 =?utf-8?B?YTgwK0p3YzduN0VKdlFWOHpoTjFIUE4xNnI5eTREUEFHTEd4YTlORUtuUGwx?=
 =?utf-8?B?VDJENkNFNUpmT2g3NysxcFg4MzNMY2Q4ZE9Gd1dUeHp3TkRpc2lmemFHQzlE?=
 =?utf-8?B?YzN6OUhXRUUzbkhPVmFvUEhTQXplNlFocDZhR21sR2dESm92RGt0emIvRytB?=
 =?utf-8?B?aEYwZWFrUjRrOFgzc3VYZjRjU1pXV2I0UlN0M1VFVmtJVUxDeG16bVU3RG5X?=
 =?utf-8?B?NmJNQWtYajg2UUhxVVJMbmVocFNaNmpXSDBTVDI2UDFuc0tudVZHcXFhN09r?=
 =?utf-8?B?dUEzQVRCSHhVdVFuYkxRbFg5QmxZNFJTZ21DRW5haTlUbjZuYUI0U2NyV3Vm?=
 =?utf-8?B?dStOc3Y0M00rMmx0RTlNeXE0NHZOUkwrckRBRDlHNVpZclJmTTR2OUxwL0hj?=
 =?utf-8?B?bkJDZlF3TEZZVFlqcWVsejM5NUxCTlV4MHFVMElDSWx0MEtvMHBnOWtVaTkx?=
 =?utf-8?B?aEc5eUtwaVpDNUxuMlpUOWVOVTYwdkpaQXBUU0MzcHBzenpSN1hnNW1qVE0w?=
 =?utf-8?B?ODFud2ZPaTRmeUtrUTRUOGZ6Y2hPdWx2TFZIRzJFWkxTTzRDWkRMOXdFZ3FY?=
 =?utf-8?B?Tk1MVGpwY1p4N2szOGlzeGhHaUxHLzUvOXJTTGFTQUhHZ2puWmZGNTB5WFV3?=
 =?utf-8?B?aXhtd1hhZENRa0tvVmhXQkc0cGJlZ1R2UE9oNCtmbjZTTWg0TVdQVFJuMHR0?=
 =?utf-8?B?Z2hLNlZnZndCb2ZKeW92eXJSeFl0eDBuTno5dTU2bURTMXVlQUFLdnNoNktC?=
 =?utf-8?B?TE1mUjlFdkpueGMxV0tzU0NCSkhBeEI1dEkvNHRyVVJSQlI3djgxK3ZTR2Vi?=
 =?utf-8?B?aUdLWkFVTWU1U0JFT05ic1hqb0xmaENKR3B3bzBiaWFBVTFoU2VON3pJVFdN?=
 =?utf-8?B?TUJUZDMrL0RnZTJKRkxCYnpucmNOa1pheHRCVW5sdTNWd2tlQnU2b2NITWVo?=
 =?utf-8?B?dHhnTUJsWHZ5MWxVRkpHVEtTWm1hVEtvWHlCQUVuTWtVZUFrM3hsVEdSL3VR?=
 =?utf-8?B?OFA5US9vbjlOMFFsb1VBUWxEWFJ4RFRnN0pvQjlxYnNBYjZjSEpFSEZnamUv?=
 =?utf-8?B?S3lLenJxTWQvaGVXWXdWRTVNMy9Oa3Z1bnp3cGw2SlZldzA1YkQyd01BbFR3?=
 =?utf-8?B?STVwM3VPMlBlWjM5UnZxMlVoRzBYQ1RBMXljSnlJb0xlSHErbGJmbUlWMFdK?=
 =?utf-8?B?NThGek9WSTZvYzEyV2p1Zzk0WFpaS3ZpbGZOWFhiT2paei9ONUZFekZxMTZF?=
 =?utf-8?B?Zldtekl0cnMxYmNud3lQdURMVk0reTdvZlpzbXVTZCszZlEvS2t2SHV4UFVy?=
 =?utf-8?B?cXlVSlJsbDJuanVHQkVsRkVRMlRPVDlTZk1iRTlzOGk4dEJEVUFSUDJYU0ZO?=
 =?utf-8?B?Q1pDVGxRWlVrS1ZlK3pDZDhweDNpRjNNajYvYUdva0IxTXN1Uk44RExBWmlt?=
 =?utf-8?B?MXJ0S1JXSkkvS2ZHMWdrQThBTy9zN2JuS3NsT3BZQ0hkNERodHRGVlV4ckRs?=
 =?utf-8?B?ekdibkZndjBjSExLNng2V2tkRU5OdWtPTW1sdnFvb2JUaWNycjM3ZFY3ektQ?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 186236c2-0aa2-416f-f1a4-08daa33afc39
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 23:24:56.2682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86lAN7FC8Z2juGZl6ggznXqXwiwy4r1xWXgdk+EViouJB+RrVigbvKs9nJeOo/+jIEiTQ2lYMPBcU/OhfHNLelgu+6xHmePkYe5YM9YuJy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
> Our current FW loading process is the same for all FWs:
>
> - Pin FW to GGTT at the start of the ggtt->uc_fw node
> - Load the FW
> - Unpin
>
> This worked because we didn't have a case where 2 FWs would be loaded on
> the same GGTT at the same time. On MTL, however, this can happend if both
The point being that the mapping is done using a single 'dummy' vma that 
can't be mapped to two different places at the same time? But isn't 
there a separate dummy object per uc instance. So there would be one for 
the GuC on the render GT and another for the GuC on the media GT. So 
each would be mapped separately to it's own unique address and there is 
no conflict? Or what am I missing?

> GTs are reset at the same time, so we can't pin everything in the same
> spot and we need to use separate offset. For simplicity, instead of
> calculating the exact required size, we reserve a 2MB slot for each fw.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index b91ad4aede1f..d6ca772e9f4b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -666,16 +666,33 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	return err;
>   }
>   
> +/*
> + * The reserved GGTT space is ~18 MBs. All our blobs are well below 1MB, so for
> + * safety we reserve 2MB each.
> + */
> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
>   static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>   {
> -	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct i915_ggtt *ggtt = gt->ggtt;
>   	struct drm_mm_node *node = &ggtt->uc_fw;
> +	u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
> +
> +	/*
> +	 * To keep the math simple, we use 8MB for the root tile and 8MB for
> +	 * the media one.
> +	 */
> +	BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > SZ_8M);
Doesn't this need to be >= ?

> +	if (gt->type == GT_MEDIA)
> +		offset += SZ_8M;
>   
>   	GEM_BUG_ON(!drm_mm_node_allocated(node));
>   	GEM_BUG_ON(upper_32_bits(node->start));
>   	GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
> +	GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
> +	GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
Given that the firmware blob is loaded from the disk and therefore under 
user control, is a BUG_ON appropriate? Although there doesn't look to be 
any obvious way to abort at this point. Could the size check be moved to 
where we actually load the firmware rather than where it is being mapped?

>   
> -	return lower_32_bits(node->start);
> +	return lower_32_bits(node->start + offset);
>   }
>   
>   static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> @@ -690,7 +707,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	dummy->bi.pages = obj->mm.pages;
>   
>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> -	GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
Why remove this?

John.

>   
>   	/* uc_fw->obj cache domains were not controlled across suspend */
>   	if (i915_gem_object_has_struct_page(obj))

