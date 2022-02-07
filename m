Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DC4AC687
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49410E353;
	Mon,  7 Feb 2022 16:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C36410E34B;
 Mon,  7 Feb 2022 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644252929; x=1675788929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XgKVs34iRkySApUIQrBOKB8SwmDxRGFBD+alitw2eR8=;
 b=P1b3v9a5IzZwXCKynC67RXH20jzoYiway2OQzWfgKGGduDXFSVoNfcBk
 7GbdbQmJ/7sZ1wKuUXTCvRMcUNgTaPnoh4XUlMBjLulmZVLH0ar4DWSTV
 eVcfYBhcMT2DH0y/2VowVFlI0jin1r4NlVeL5gwuqQrTVhnPru253SAPI
 ZkagBUgn+3VmjcXBq7qvd1hR5VVJF3wFOl1IzEP+eB0WdYuGYwTUCj61U
 CY7GY0SozFBY/G7s/Je4DNRGTC8uAaf0bWOI9UhQ5A1+wMv9GezKdqwYW
 CeV0UR7hwnbiBboBkCKP49h1ym6VE7RFPxGH7eKQW1NyR9Z7+lN+XPLzh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309501481"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="309501481"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 08:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="621609050"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2022 08:55:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:55:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:55:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 08:55:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 08:55:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxxwZ9wbenLrWmHhHzBoDLpFC2TpaWb44Qi+Oi13H1xPB1E7n+nK+/WIt0hg7+Pf1Q/lvj43WTmLVYgELgU9ypv0CNDqPgbHGeQtDXsOr434fdfVFOBulxN1xpIsz6N5a17hewNq+MGtRw5J702QnD1lnML5+840t3ccTV1uLil4ZWYBkNgvSpqOVyU4s/uxN1ZdtOqhKStQt6RzeyJkYBhQcYcIRvv0jUrf1BMmK0Jrd7ksCaX+1iZiKIQnBZOq9Ow83HJrj7Wy7nrPXAxnGhURn/S06jhCYwaq2OP8oaUOLUCW/d/VcSdoJaaFLTFF8IrgjqzYVoB4J1xdzBNmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzBQnA881etlII3HddlKvppfRFyZULzAh0jrJ92i8KY=;
 b=jpgUkfeTkNFGiZ0yXTTh+ueRA1Sog81VPm4neM0yemrazwLVNKKhr1tfMmJff1ZGE5wgBMIc3Z3ePVKsPsbp2MMAV5NDKFkH3rAxfi9o5OAqk0KySUd0rSB1ltgUrJe/hVRwHIa3B/Yd+MiSuzQqLK+0S1S3gOmbdZaPeitDpbZKV54SDe+9mmWzshSsLuADDtTN7P7QhsgRMdGs+dY5tA+IFdpa5LcLJo3sDA/rkOZ1oEf6f3fr4RIvCyfEZ93RFwhyN1VC6X7lTV/gfYPZT+6KemAGUSjGAULmQ9yvpJENpHyoOEEwewpg1gMbYaFk7NeSHph7c6udivTcrdUOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3321.namprd11.prod.outlook.com (2603:10b6:5:8::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.11; Mon, 7 Feb 2022 16:55:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:55:23 +0000
Message-ID: <68877a17-fff0-eef6-a2f2-a9b43dbdb5dc@intel.com>
Date: Mon, 7 Feb 2022 08:55:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/guc: Allow user to override
 driver load failure without GuC
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-6-ramalingam.c@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220128185209.18077-6-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f803d2-0f17-4d41-091b-08d9ea5aa1f0
X-MS-TrafficTypeDiagnostic: DM6PR11MB3321:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB332116345FC74ADB1DE8394CF42C9@DM6PR11MB3321.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0w1H+bTJcMR+5cPtEvjgDarRPkneIvc6zT0eXbO+pZiT1r5EKXMpUSrVdnowv1uucaLKY4eKwuYKPJZoRGP5qwUpwWrfSqsxDqX7hU6Wu+omVsC1Nk4dCpXQsEZRYXUM6aG1N+W0IzSvwRUDowpz5YMrpo4RuqIvzi0RgRxmQHr+d+kJqTLKNTiYriGR0C+p7o797pzjedMsa9PIHoRagNGUIaG8t2fUHoTwh4mvC4BBqADUfUOCUDWuefAP0VoJBbWvwL1iAtS7e7zo1OW7rrr4CnG/PerfpQykvBk1RFYOqKDgmaCCBp/PtdvJH3t9CQqloS3+afWagIrmVcGesIL88xAZ8sQJlcfSGyCgwmNFknu3y3YDb/7sJnz8GamlPlTDJzY1zhi64xB/3LfpuJcLnrMZzG0J7A1qEHBKcmBRKeSocCMZhBO/lsm6x0tMzFPA88Pngtml+XbmFgevcL5c+kkCm0EbeylCg01q/xnqowVZsELWS+OkJhMWNAVCEzYPlEE/Sl4msG+RUD0RU99nbBNvPtWGRg08GwRgZliJX1s5YUvALBEQOXSrf8d7W3dUnu6bNRe+QXCYghU9fHSYgc6NpyG1BoIrf0mRw650zg1E3xdAiWKFbLQsczIOx1j5AFig4hRif8hL9P7cY50y1i40DhsqTJQA5ii66X/4OMl0FQo4bcnbfIMBqf5ofIWOmJAmEA2wctRxukhva/kDl49TKmPgm+Lo1CXNxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(31696002)(86362001)(83380400001)(107886003)(31686004)(38100700002)(36756003)(2616005)(26005)(186003)(6486002)(66946007)(53546011)(2906002)(508600001)(110136005)(54906003)(316002)(6512007)(450100002)(8936002)(8676002)(5660300002)(4326008)(6506007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Y3YUNNWm9BQ2MyaEtwaDdBZ3hPNFFMMnhvQjEyYWZyU3gxeitiYS91K1VX?=
 =?utf-8?B?MjNIU2tOUnJJMzQxR2gydld1UGlkNFMyTjRpelpYS3AyU1VUSFJ4U253SXY2?=
 =?utf-8?B?UE9YY1Y5TnpZYXJkc0diNHZWb0dEcFZQcGsxbG5waUlvNWQ4dFZsVEs2TE9I?=
 =?utf-8?B?UDFUeXZObHZTaGFOUk9RN0VqVjNES21wZk1PV2xTaXV2R2hQSXZTRzVYb1Nz?=
 =?utf-8?B?T2tGVExuQ0VYUTlSRUVpUUdHTGczQURQbkNoTkQ2Yk0xWUdPMWlUWTRlb0Ny?=
 =?utf-8?B?dXZ2TDlJZzlISmtDRVNGd1Z3ZWRnRXgxejduTGkybDJmcDJsYUtPdXpmQjdX?=
 =?utf-8?B?L3BqS21vWVlaRXF5NHJ6dkNoR0Vva09rODNISTV4NHFpNnJ1NHRtVTJTZWFK?=
 =?utf-8?B?SGdZWGNwczA5dE9DRFR5b2dlMUpRcm11UnBUQldNYjhQRzZhb0tVYnM5NUJE?=
 =?utf-8?B?bnQwUi9jdFlQVUZZRElGRG5SUWExWlo4MExBeXJqYStGMmt0eFZ3Zmg5RkJr?=
 =?utf-8?B?MzFZVmVmZkM0bzZGeEQ3c2VXei9TUDJnRTIvTStqTyt6VDhFWWZxSW1WVDRG?=
 =?utf-8?B?d2pRZDZpRzlmTlhmUHYwVG1OSDFBYVNzWjBmbDJ3dGZVV0VJSWs2T0ZNY0da?=
 =?utf-8?B?bFFFTEIwYUhtYjRCdFA1cnVKT0trZTNDMGEzVjNuNUxQci9adEtHY25JZi9x?=
 =?utf-8?B?ZU0wdWppSTFrYTlCZHRtaVIwNXJqbWNhQUFjV3J0c0l1Y2VZMEQzbVlqd2RH?=
 =?utf-8?B?VERISHZsVW5sWXhOd1M4L0dpT0lRR25CbWx3ZEVKb0hMMmI5U0w3b2JkRkdI?=
 =?utf-8?B?aGJYNE5ZbWhPUHVIMWhZOFlCb3piSFFUSGlkVm5MakYvVWRJVFBTclIreVRN?=
 =?utf-8?B?OXYrdUF6VnFINFVjWHRZR3FISWx0cEhJVEFnMGtDRUJJTDhpZWRqMlFIK1Ar?=
 =?utf-8?B?WTJTTUphVFVOeUxaVWtENkI1WXU1RXlVcEFLamFWbk5lSXZaS3RTT3ZhQkNr?=
 =?utf-8?B?Y3dkUVJxWURrUGVWNkNVVDJaZ21jMXZ6QUpPY3lhN0c2amN6YTVRSTdsazhF?=
 =?utf-8?B?TE5VQlkvNEgvVEdYckhHUzhQOUZLUkdYZGYzSjQ5RnROTHVxbnFzT04vYXRk?=
 =?utf-8?B?TnFodElVdHNYUEw2eitrNHJScUlzdEFWcFVUc01udTI0cmJoQ0xrVXFaUmd5?=
 =?utf-8?B?S0VKYkhEZExVS1FFRm9OaXFzeXdVM2VEM01rL1h1L0xsY0Y1VDJZTkFaOE5h?=
 =?utf-8?B?UEpYR0hIb0lteC81NDQ4clpxR3pVZlNpMXJld3dTNVlScXFQQ2RlTnRxbFk3?=
 =?utf-8?B?TXNsWGJ2Nkg2dCs2YUNDVlpNTTMwR0o3a3Q0cG5TYXdjbDBRV25RSmhIT1Jm?=
 =?utf-8?B?alpPbHZzV2x4bnhLYjR2aDlWN1htdXdWQ0RFODBQM3BCSUxmTjMwSzFmMjg2?=
 =?utf-8?B?YTY0NTBDTlYxZGpMUVhlcWlJTmZZSXQwSHVoeTlYbXd2Rmg0YWNYSXlhY3ZV?=
 =?utf-8?B?akxDbDloNHJ3QmpicHdMWXBKYmRxRnpjTURrV3NTU1dBY1VyNmpxK3lFZUtQ?=
 =?utf-8?B?MTNEN1VyckcwdmI2UExnWUZZTzgvSlRTSU03clBpWnN2TDRrcXZoOERMWG13?=
 =?utf-8?B?Yk5lTHkvVUxTQ1kySEdmaHFiRlRrTTlndGlNaW1PRXIrWUlNN0RSemlHVzJj?=
 =?utf-8?B?bG1Xbmdka1djaXZCNXd6eUJTcS9tKzNsczV0eFFtRGpqYzY1dHZYQlFaYzdw?=
 =?utf-8?B?ZG5NWU1qL3VpQmROa0F0T1pJeTBKR2ZXeHI5bk54Y3JrRStXRlpMWHh1QnFB?=
 =?utf-8?B?NG1LUWRrKzY5TTJnVFNNL3ppbC95aUZVaDZWUjJwRCt1ZEJjb2pWcUNKQzlK?=
 =?utf-8?B?eWQwZW9mTEZ1dGZSS0RtRExhTFhKbzd3Zmk2d2dUZGVOdTFZMUlWb1RsRi9z?=
 =?utf-8?B?emZrYTc0RzlYNjl5RGY3c2NZaWwydjFzalBreTQxZjZHTWZqZDdkNU9YSXNF?=
 =?utf-8?B?dmhIbUl6aFptaDh5d01HTEdmekx3UmdTdDZkZ3BDZTloakszUWM1MGZZRnA2?=
 =?utf-8?B?WUpqN3djVDFGVEFzdE85Y21EaldqVkVOVEpBbWgxTXpsOE5Sd3ZKa1hWRzZx?=
 =?utf-8?B?V1FEcGdQTk8yeElzRGZ5N1N0VEprcmR2WWxIOWFJNnNiSjhHSFVmZkxCMEZp?=
 =?utf-8?B?SmNwYnRaSzdkSkZTcVgyNTZINHY0Qi9NNGJPOWdQMUl1RTl6ZHZ0MXc4VzRP?=
 =?utf-8?B?WFBZZlAvWlJNMjR1dkhxMXJjc1BnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f803d2-0f17-4d41-091b-08d9ea5aa1f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:55:23.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/D36KdMV6Fs+Tt0vBVHQZxknuhfD1BVN640ru5xrS5xsKTFMaWYn247jc2KzgYPSRM6inE1VQskkHSDxYswxLNu+l1gM3NXTTcOQIe6PXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3321
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, "Harrison, John
 C" <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/28/2022 10:52 AM, Ramalingam C wrote:
> From: Stuart Summers <stuart.summers@intel.com>
>
> The driver is set currently to fail modprobe when GuC is disabled
> (enable_guc=0) after GuC has been loaded on a previous modprobe.
> For GuC deprivilege, the BIOS is setting the locked bit, so the
> driver always considers the GuC to have been loaded and thus does
> not support enable_guc=0 on these platforms.
>
> There are some debug scenarios where loading without GuC can be
> interesting. Add a new feature flag for GuC deprivilege and a mode
> (enable_guc=0x80) which can be exclusively set to skip the locked
> bit check.

This is a debug-only patch, so IMO it should definitely not be merged 
as-is, because we don't want normal users having access to this option 
as it can lead to an hard gpu hangs if misused. I'm honestly not 
convinced we want this in the tree at all, because you can still run 
without GuC submission by setting enable_guc=2; the only thing this 
patch adds is the ability to skip the GuC/HuC load entirely. If you 
think there is still value in having this ability for debug, then the 
patch should be updated to only allow the new option when one of the 
debug flags is set; I'd go with DEBUG_GEM as we have that enabled by 
default in our CI builds.

Daniele

> cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 17 +++++++++++++++--
>   drivers/gpu/drm/i915/i915_params.h    |  1 +
>   2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index da199aa6989f..a1376dbd04fe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -108,7 +108,7 @@ static void __confirm_options(struct intel_uc *uc)
>   			 "Incompatible option enable_guc=%d - %s\n",
>   			 i915->params.enable_guc, "GuC submission is N/A");
>   
> -	if (i915->params.enable_guc & ~ENABLE_GUC_MASK)
> +	if (i915->params.enable_guc & ~(ENABLE_GUC_MASK | ENABLE_GUC_DO_NOT_LOAD_GUC))
>   		drm_info(&i915->drm,
>   			 "Incompatible option enable_guc=%d - %s\n",
>   			 i915->params.enable_guc, "undocumented flag");
> @@ -416,8 +416,21 @@ static bool uc_is_wopcm_locked(struct intel_uc *uc)
>   	       (intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET) & GUC_WOPCM_OFFSET_VALID);
>   }
>   
> +static inline bool skip_lock_check(struct drm_i915_private *i915)
> +{
> +	/*
> +	 * For platforms with GuC deprivilege, if a user *really* wants
> +	 * to run without GuC, let that happen by setting enable_guc=0x80.
> +	 */
> +	return (HAS_GUC_DEPRIVILEGE(i915) &&
> +		(i915->params.enable_guc & ENABLE_GUC_DO_NOT_LOAD_GUC) &&
> +		!(i915->params.enable_guc & ~ENABLE_GUC_DO_NOT_LOAD_GUC));
> +}
> +
>   static int __uc_check_hw(struct intel_uc *uc)
>   {
> +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> +
>   	if (!intel_uc_supports_guc(uc))
>   		return 0;
>   
> @@ -426,7 +439,7 @@ static int __uc_check_hw(struct intel_uc *uc)
>   	 * before on this system after reboot, otherwise we risk GPU hangs.
>   	 * To check if GuC was loaded before we look at WOPCM registers.
>   	 */
> -	if (uc_is_wopcm_locked(uc))
> +	if (uc_is_wopcm_locked(uc) && likely(!skip_lock_check(i915)))
>   		return -EIO;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index c9d53ff910a0..8996ba2cc3a8 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -32,6 +32,7 @@ struct drm_printer;
>   
>   #define ENABLE_GUC_SUBMISSION		BIT(0)
>   #define ENABLE_GUC_LOAD_HUC		BIT(1)
> +#define ENABLE_GUC_DO_NOT_LOAD_GUC	BIT(7)
>   #define ENABLE_GUC_MASK			GENMASK(1, 0)
>   
>   /*

