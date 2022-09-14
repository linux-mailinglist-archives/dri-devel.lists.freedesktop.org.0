Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342305B85F3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 12:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6118A10E8E4;
	Wed, 14 Sep 2022 10:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF62B10E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663150220; x=1694686220;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r7jBSEv5tYUi0TFi6XTIzxZe1kaEYBeiIWUR88Spn/o=;
 b=ItE9T2lAqE1gQM7+NFS1s57TnS8FtiamxGHg/AEUBXfeFUVr6orisV94
 FkUh81JAfjqQSVQrPAxtLo14UAVcXMNNcuK4sQInPcpa9BEOjENJ/3Jp6
 /BHmQAC2urPICDUf/xxNY/9frRng7F33HLsJkzW6SDNld7qwx7WHGXSLg
 GPNhjkvDn6fVK4qw4UO9hfb29zMLshWyZvPpY+nuVVQW0U4H1+ArmGF8Q
 k9sCleEamTemaUPhJ6NzK/7XeCbfX2gbJ64ZKUim54WPQBsuwoNAajCAk
 pmkXRGTRIRH/qif0FkKtm1gu0welqgoHVrF3GcQ/DmKxNswZjl9RzMExE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299203174"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="299203174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 03:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="612458928"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 14 Sep 2022 03:10:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 03:10:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 03:10:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 03:10:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 03:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2QsJ4Mw35yRDu9zY4Ae5ouIzpwQL2FyJwiphxeBwXHfd7+F6dbHBrSxQLI95bCI19f1o0C1dPBKL/Vpr22urGnE5KRg38VjhnCfM06wCmOrISZPcdyQIV74yj7opDEMm+dbGWPw6C3j+Z117m2MzaGwFCJoYIQAOElqznON6i1GYY9JtBQ2HxH/DXX0pxY/NPLkhr3KWUP0RWzcOAgjjQlCgdo8/c/aPvzPe9a10EDyPKc4JjLwlXF9aBtlBA+mLxJno/Y45+J7dhJMSYiCFdIcceb8V/zyMcu1xWM0WkbzqtbMsTxtg3hCZjoPMKJOjgdXs9yYk0I92L7yV4kwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ff1A750mZTj8mNybLolKs6ildrS+z38RpAzdEqembC8=;
 b=dVBmB2xjE9oTtbnkQvWn8q7MjdRzeNqJlITH11X2z561JwmaRAEVTCJy4WTUynNi9laB8t1afjWFiqFCX2/YVj7gLs/2ooAuyeH0+Qy6NNu6ushgpKUWoOG+dmpDIYx+FLJ517Uyi2fqWdd7sYcSNN6b2kTOPoYQk+eD8o5pKnomrUQGRWnnMtYpAioFUGkAJ802OYTd3Tvyqsw0Me1nu9WvZ4FLbnmnpOtg8EsO+ZFXi5A0MsTiSl9EIhkk2+fnebPDg55Yp+sw7jg3Fbq+PJvayiWrLXmuDW5kCxA1CnKGY1+9dYQ6R1f4ZGIyLjZJYKc83hpvYAoZ32/eoBcUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:10:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::e8e1:12c7:5a6f:4f86]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::e8e1:12c7:5a6f:4f86%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:10:15 +0000
Message-ID: <2ddc7bc2-55f1-40e6-89fb-87678d4c1fae@intel.com>
Date: Wed, 14 Sep 2022 15:39:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 4/4] drm/edid: Avoid multiple log lines for HFVSDB parsing
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
 <20220811054718.2115917-5-ankit.k.nautiyal@intel.com>
 <87k0674bwy.fsf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87k0674bwy.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: faf439d9-5d4e-4bee-16ef-08da963951b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHxaQzshnImiukDsEwjmJ0eaSJCbio/74XqAO0PvN8b2KOrGIp5xtMJf+5cus/mY5xhPk0BVKTuEa8N62G30KM3s7eIhM8o0Ax27Buh3mONskheS+5Nd4PeLLg6TAPGAERpWG5WRh0dlSeQciVmZTJpg3T8bGoL1FHZs8Dgh7cRdj0geysR4jWyc+Lkt+j/s9OA2Ac8OX4lunpiicxQJF/rUwjyK9/FhdYCyDdrPmXhoCLSW3JzX7fIIVq4TDfEap2riLjFCsMHWIn0ZxoX8XA1M8uT2cW9kjYwwzc3fHyDmNiwzIFf7XOX9hgTxD9JzvuvdG4b2Fg13+qp87FFgP4I1YIaKjMHR2rtfhmdyhQD28hWiuL08c/j34RtQE2HN2GVDEGUN+UiZjNfUkGZPgg9X2SMgNJpNPpwtkxlrLfVZrRvZnRtk8drjxzLsWL0T5gGWt+BEdXIdFHRihRGJas8DMH81lMgIPfKb/s/IlmfwclS5Sji/ZJALTdzzMpKPJ7+4uwJpxRkB37/LMNnd98hy9a65RSdIUdjRSnD0JZ1/cGvChVC+OVOAqB5u7ZxrUh/FppGTOv8MI/YRHo0HTETb46NcThvN10ycY4Ly9xQzUwG6gYzuO3ZRK7T7E4JjPFNIb/2mks7fklx4qGFa1A/votVNcTDaDubKeZxj1dq4Esi9PrpS9r9ocvAIPEh2BHv5uX20gWfVUpjWNt5tfoY3ikVqwpg79JZCGGp0P2czk5rS6V1yS5nvVUFEJXRvHhrIF4Sp/jHl1J1VsSN/rEHzthT5fLActDKywMKQ3K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(83380400001)(186003)(2616005)(82960400001)(38100700002)(5660300002)(8676002)(4326008)(66476007)(8936002)(2906002)(66946007)(66556008)(6486002)(26005)(478600001)(316002)(6512007)(41300700001)(6666004)(55236004)(53546011)(6506007)(31686004)(36756003)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2cvbmU4MlIvZENKZnhITFU2Rlh1RmRjNkU1VXMxakRxZ0x1a1ZRc2NxTFZX?=
 =?utf-8?B?T2lQNXVpcmpWS3pnNTAyazkwSFBLdS96QlYrbzNtaWE5RXBOb0xvM1U0dkJk?=
 =?utf-8?B?YlhXRWRrY1loNk12dWxra016c3pqTVB5c0MxckRjQnVSMkx5UjEyWTBNWVU1?=
 =?utf-8?B?WkJRbXErTTBsNWlvQ2dwcUFXZzUveGJraCt1VXlmOFFnVFVWR3FsYnB1T2x0?=
 =?utf-8?B?TXJQNjg3UlJNMjFBZkhtRU1FZ1FmTnlWRnNYdzlLQVNKbE5aSHlmbkVzSGlr?=
 =?utf-8?B?QzRZdzJyMmxPVm9LR1VqdGxDb2Vud05rcWhlRnlxSGliZFhSNGQwMVlLVnRE?=
 =?utf-8?B?ZVQzRURHalVBb0pRbE96dFRlTG1NMzdWTlFRbFl3QmNISzFXOWJhcXBvY2pl?=
 =?utf-8?B?YmVNeHEybENTajNqTFRScDNGczFkLzk1bWNiY2VkTmU0SVZocGpnNDB6VFNl?=
 =?utf-8?B?Yzl5OVdtVXpoOTRBQytONml3ajgrYzBabkJFOCtQczFGS0xSSGFKam1nRWRG?=
 =?utf-8?B?R3Nod1ZMdWdMUVZCZWV2YjhCbFBNMTdZSVZnY29rakIxdnRHWStXM2RHaW1Q?=
 =?utf-8?B?Z2pNekpiQkJ3QXUrNHIrUWFqc0NBcTVaZis1VWp2VlVNSzI4bnh2M0JQejFL?=
 =?utf-8?B?dG9meitFNDlTUTBFL25VaXFxM1QzQWYzVWcwOWYxYmdFQUJQVzJNcGdaN1Zj?=
 =?utf-8?B?ZTZSbXlSMk00ZkN2OTNMQ3cwSkt4L1Y4eWlSazkzOXl2QUZ1SzdMa1M1UEYx?=
 =?utf-8?B?UEYvdjVpRWgxdVNUVldxRElSZk1sL3paZkNKNThheHF3VXZ2d1d1eXNVWXNM?=
 =?utf-8?B?MDVkQXhFMnZXTzZZaDhYU09Dc0pzalIrVlJ1MUUrLzZkNmQzZEU5LzFSKzJE?=
 =?utf-8?B?YVkzaXNCZjdUVFZNdnJIVDEzK25lT2VDSW51eE5oTFR5ZDA0SlpRT1NGYkR6?=
 =?utf-8?B?NE9ROHM5bTBsY1dZSUVBc0l5TjVFOC9kalhhdVlyYmNJMEVmMWFTYTNNTDhq?=
 =?utf-8?B?cVpLTktnMi9DVWlTekZObjlMcmhBKytRYWJHUDk0Sm9FOE5KemYyUk5GdGpr?=
 =?utf-8?B?TlJ3ZElWcFN1TEVvaERwOU9jWDNXQUxmODdJcnF0K1VnWUc1ZjA5S2hnWThq?=
 =?utf-8?B?bmlJRnVYSkpOa2ZaSUhEWHJQS2ZJNVBQWjB5SVMvcXBQOGxEOXZ3YTlCMjY5?=
 =?utf-8?B?UkNBM21POGpTWmdPai8yb0dVWVVic05RMVhoTlFTNGZsRXRMNzdHMi9maU9n?=
 =?utf-8?B?WXFyaTNEL1VmT1BwYmlMRmV5VnlvUi93NFhrek9Ndkttc1hxaGwyMzlvYnFs?=
 =?utf-8?B?ZWFtWjZuRHJlMmw2UUd6dS9zTmxqWkRZdFZqNG5RZEZzOGNndjJ4eGZaaHNV?=
 =?utf-8?B?WVltUHducGZiR0pIaHVGd28xeFFEZFZpd2xESkxSUVlydG8vZVRIbFF0dDhL?=
 =?utf-8?B?dDQyeG1YMDgvMHF6TjZWeDQzRUwyaXg5N1FDbFFsNmhST3lTeERNeTdxTUlH?=
 =?utf-8?B?RlpQejNsRmlsZFl6TnFhQW5xOFh2SG9iMC90THBaM0s5MUNlV0NIcDhEdjBh?=
 =?utf-8?B?ck1pWFA2Sk92R2lDKzhSZjZHRnVselJ6YnVFTDdVTWxSNVpuRnRncUI4c0ZC?=
 =?utf-8?B?c2dnQlQzL1g3VlpaS1FqdVRUN2s1OHNpQnR4a09NVnFYd2F4d01TUWFJVXVL?=
 =?utf-8?B?WHJRUHNsOVpUemoxb0cxYnlXK1NKNDZSMFFJb1hNVUNlMlZ4d0RnWERSandI?=
 =?utf-8?B?emgrRWpIVGpBbGphY0VHR1ZmSVFWM2VUY2EzSUFSSVltby9tM081bE1Ed2c4?=
 =?utf-8?B?Z3NwYUVjVDhxaEt0OFNaRWtsSUJTZVhwdENERnlpU1R5MzNhanBSa2pYbGJh?=
 =?utf-8?B?bmVTYnFyYTFoTUE2aVJsZUp4enNXZitMTXlnemRiNzN5cDd6M3piZkpTVHJt?=
 =?utf-8?B?ekwxbDNROXlzMFlVZDFDQXpOdmVkODRZQUpwOVhqOXVtc1kyWXVhc2tsejVG?=
 =?utf-8?B?ZkI0Q3pFejdYcWtuNzRmcExOSHRYaGJ2Vjg4OXUxN0FvOUJrSEhPb2RCY1RG?=
 =?utf-8?B?dlU5ZEdBSXd6MHBOV2dEZmVtYVRSZmZET1o5K0F6ayt5a3BBMHlVbCtVRHdC?=
 =?utf-8?B?UnVSSnlZTlZzd0U4ekNpN1JSN0RuUGtJVUtQU0lZOG9LaDRWZGNQTzdMZ1hv?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faf439d9-5d4e-4bee-16ef-08da963951b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:10:15.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYDuhyHEItVTN4vYoaEiwCOcaDGp9RJxMEGM2mHXs9sm7N/CQsyzl/5CLhPPl3P7BBpuZV+XSZzP/eg8RCsPtSnZ5N0F4femQBTi6w0Wqd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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
Cc: uma.shankar@intel.com, maarten.lankhorst@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Jani for the review and suggestions.

I agree with the suggestions and will make changes in next version.

Please find my response inline:

On 9/13/2022 7:24 PM, Jani Nikula wrote:
> On Thu, 11 Aug 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Replace multiple log lines with a single log line at the end of
>> parsing HF-VSDB. Also use drm_dbg_kms instead of DRM_DBG_KMS, and
>> add log for DSC1.2 support.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index c9c3a9c8fa26..7a319d570297 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -5781,6 +5781,9 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   	struct drm_display_info *display = &connector->display_info;
>>   	struct drm_hdmi_info *hdmi = &display->hdmi;
>>   	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>> +	u32 max_tmds_clock = 0;
> This should be int because display->max_tmds_clock is int. Yes, it's a
> change from the current local var, but logging u32 would require %u
> instead of %d in the format string anyway, so better just use the right
> type.
Alright, makes sense.
>> +	u8 max_frl_rate = 0;
>> +	bool dsc_support = false;
>>   
>>   	display->has_hdmi_infoframe = true;
>>   
>> @@ -5800,14 +5803,13 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   	 */
>>   
>>   	if (hf_scds[5]) {
>> -		/* max clock is 5000 KHz times block value */
>> -		u32 max_tmds_clock = hf_scds[5] * 5000;
>>   		struct drm_scdc *scdc = &hdmi->scdc;
>>   
>> +		/* max clock is 5000 KHz times block value */
>> +		max_tmds_clock = hf_scds[5] * 5000;
>> +
>>   		if (max_tmds_clock > 340000) {
>>   			display->max_tmds_clock = max_tmds_clock;
>> -			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
>> -				display->max_tmds_clock);
> Hmm, the logic for what is logged gets changed.

You are right, we are now logging this always.

Should we log this only for rate > 340MHz? The logging line at last will 
require some jugglery.

>>   		}
>>   
>>   		if (scdc->supported) {
>> @@ -5820,9 +5822,6 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   	}
>>   
>>   	if (hf_scds[7]) {
>> -		u8 max_frl_rate;
>> -
>> -		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>>   		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
>>   		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>>   				     &hdmi->max_frl_rate_per_lane);
>> @@ -5830,8 +5829,14 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>>   
>>   	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>>   
>> -	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
>> +	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
>>   		drm_parse_dsc_info(hdmi_dsc, hf_scds);
>> +		dsc_support = true;
>> +	}
>> +
>> +	drm_dbg_kms(connector->dev,
>> +		    "HF-VSDB: max TMDS clock:%d Khz, HDMI2.1 support:%s, DSC1.2 support:%s\n",
> Nitpicks, %d needs int instead of u32, "kHz" not "Khz", "HDMI 2.1" and
> "DSC 1.2" with spaces, would prefer a space after ":".
Noted, Will fix this.
>
>> +		    max_tmds_clock, max_frl_rate ? "yes" : "no", dsc_support ? "yes" : "no");
> See str_yes_no().

Right, should have used str_yes_no().


Thanks & Regards,

Ankit

>
> BR,
> Jani.
>
>>   }
>>   
>>   static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
