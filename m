Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72938541F4D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18B911206A;
	Tue,  7 Jun 2022 23:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A311206C;
 Tue,  7 Jun 2022 23:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654642965; x=1686178965;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=PfldJGRgDlmYTXd8GXNNF/RdhdL4Ft6TSNOfF7pzmP8=;
 b=HeagEi1Snvb7rKR1GEaM3tlmFA5oh1MWmvZpjiMtRNNdYWoOLu993k7W
 ctLwSsxfnnOZV1YmjUxOl5MRik1OdehEpXqtxwVyxFszewbRiMIEdo95c
 s27iBsTRC7h4VkPt1dlPxwZRdMtS31Lui7xF9PM0aUUnGPWUtYwD1rNW8
 TeI4d+CL5fxQ8X1OOX13g7vqql6W/vGZYHxnOvIHl3t+B4WXmUecg1PYR
 gmR8Tb7zAPmXAWvvQGYnmVvq4ieu9ebgrJCP0ZtokGmDOeUVVOfs4fNwK
 5pBE+letFyGlPWlZlnk26R3cDo6wHax3krrUMm8DJrSUJZ4Yfw8lE/lpM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="302120465"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
 d="scan'208,217";a="302120465"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 16:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
 d="scan'208,217";a="907302051"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2022 16:02:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 16:02:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 16:02:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 16:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0muMdNkSjcJtDyG/fRx6W13khKjB5dxoblQGMvoCtI0nTuOs/+VLE6bjccgpxo7xhxbDBx/4f34NOfc0grAqUrD3j746hAZPgefOzpnVpjY0oprd0NWaOA7032txqhBlSf9x53oWd2aoHFEVb+CFip6ACKeR8G3d2W95ZgG349/SdnPVNTcvFQYd/Dnpl1Ine5EuykkKIdyKLM+gru32yPDZ+1MMdbzgUsXB663nYqbo47D3iOQkCBJg4+ySxrbJjC47PLrWBrjKBai6X1VZwv9h6WTYLeQ7TbLgmxiPzGsvsEfzihkHTsj2yjUiXBeDoyKDRaRTNvnzO8WrMcciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRGOLj4PIRe36xsT/IIVHtm8ockG9lHYWc4DuviS54I=;
 b=CPnJRfgy0YZb4f1g6p8sFN0y/v6lBd/9Xv4zD1Vh6xaZTIV4a44/YMEMSzLMC7IJ9lePAjSkXJD3RBVHFglfAyNpKMumFDvFI4l4ysVme3eUD93C3fRb11DTDqNHvFDySFX05LbnUYGv/klKrHhb8Te7Hn2CaCYKULynvCGwMdD73CvNo8k/DD3iClbm8kWjb2djmCqEfGcZ7rsWXRRG7H2DjPJJwV3q2CO2+c4i0+/12x1Bi04lC08X1lgfJuU8vjsfcwX6bL8qiEnxT3OP2nW22VKHv39svQDlgAf8BB0w3qKBWOB30inNOM2Cy6dqHPzis9T+9R2KwqypQYZ6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5521.namprd11.prod.outlook.com (2603:10b6:610:d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 23:02:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:02:41 +0000
Content-Type: multipart/alternative;
 boundary="------------mnvacnBJiLe20emF53ojqZA0"
Message-ID: <2f66b35c-e7a1-fb48-e490-566b05f9a03b@intel.com>
Date: Tue, 7 Jun 2022 16:02:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <874k1pj4bi.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <874k1pj4bi.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:303:b5::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6cbcc2e-ff71-4bca-ae23-08da48d9d33b
X-MS-TrafficTypeDiagnostic: CH0PR11MB5521:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB55218500E05EE60EF24F89A7BDA59@CH0PR11MB5521.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvJnuMHshJnr1FQdaPdiUin80LwehI9Is4IqQ+XlR4abE3CfFBVshP+sMJT1ALal3J25WCjyAOgzX+w/4pZTsCk330zzNlsSttR9TpZ200meR6WE65NmAGnhUAELgeaty5k2ASUd+gg+Jihw3xheH/30QUgWrIkP7ZFkew6TA6Bo1zWso0oBp0QB2NmiyeLWX/tJf5WSthavF1zUVu6SxJUD0kXZHPlvFkeSDJkFpu8l8PJtLd40EAE8EnYB7mUnCqnvdyZ1scyNsnVT0vdBr8sAK+HsQ2LJTSwk29PiqzHiqGmuxkdcYZVPl7vcHgrmH7/wH8Nt7EASEEYHhq4NJkRTDbD38VaBqmSfrz9sgELg57uy7JPcgTGMJHXuP/Yrtddsrm1M8clyngiir5vTTEBHdJmlKQ0xqZQBj76M3BPsU6e2Wo6YBZrazgIxjt3LxQN1ZBcZOSfJHf/N8impCSZe1Xsds3BHDzzq97/GNhZrz7OpbPmzuyHXSh7IIvd+dtKgh8XBUIvdJ0xeUuJjAX+UBObPJDtZqqCeFxmk2FGNhoQtqWFJwcVZIEtivmPvQMjTBfPZiyc+/22HK10+sWCr/3NLJRxod6SlShK8M38B30klS5M8pH21pnswC6nCEfYCHMqY+z1Y6ojB4udcvqa4WS7YdBFlWE/dPKnKVqbBTdSPisKcC4E6Ayndspn+xq5ZNzP0rnlph/F+C2Iu3TG1ZhiCV+CnZaXUm5ujzBXfRYUADRakUGX3kdlKyKkD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(82960400001)(6666004)(2906002)(38100700002)(6506007)(33964004)(6512007)(86362001)(316002)(36756003)(83380400001)(53546011)(31696002)(66476007)(8676002)(110136005)(2616005)(6486002)(66946007)(31686004)(186003)(66556008)(5660300002)(508600001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5VZEExNUJYSmMvandrV2RLaUNNQ3llS3VPQm9KanNJK3Z4WCtna01zdm1F?=
 =?utf-8?B?TlNJTWJobXhCLzVyRG1sT3FpVG9ObzVGNEdKV2M2d293MmNTVE1TSG9PZzFz?=
 =?utf-8?B?TUFnalI3VklaOXRFbXN0MGMyck8wZDRhcUk4ZmJVMEh4ZVk1cWNDMnMrVHo4?=
 =?utf-8?B?cDNLL0pEMW5TZEhOdTg4QWhUT09wSHhjV2wyczhlSUwzTmpiTHNnaHBSczVX?=
 =?utf-8?B?QWowdTI5S01ZNWR3QU9sS1RJaDF3R2tZQnZML21yMGtreGtzMHlZRHRXRUlQ?=
 =?utf-8?B?YjlNY1llYjM2ckUyVEptdTB6bFVsYUxHSWtOb0NUc0VGaDhMbXhXanVydHor?=
 =?utf-8?B?TnFVYitpcjNVU1AzUnVONDVxU3RmaHVqY1ZFUU5ZKzBSNHpVNmVhOXMxc3hY?=
 =?utf-8?B?ZUtaQ0dpNGtBbGI4cVZFSVlFaXYrcXdLWXpaNFp5MmhnU0luNlVxamc4WGpV?=
 =?utf-8?B?bVF5Q2F1RmNQNnRZamVETVhlME13NGJjUUhPd3g1Z0tRMzlPQlZzZDhsRDJa?=
 =?utf-8?B?ckEvQm5hZjM2clpCWEVKSHU3U3FTN0FuVVBYR2F4aWZPNVRodEk1d0VISkdu?=
 =?utf-8?B?YWc2WUFqUnNWYitYWXd5clhyVzZEWVBaSEVOZW1tcU53blVqaVlkMWw0SGxD?=
 =?utf-8?B?MnJlVHMzc25uamd3U3R5a2VHVVVDMmZYc3hOcWcxK1JzQUFOankvY1dsRWQ1?=
 =?utf-8?B?dEZjWUxNN3YzV296TkFuTXJLL1drL2dkdWpaa1NVbmRyVXpGNHBvT0ducWRV?=
 =?utf-8?B?VlhzUFJtd21wUjlEVEkvallEbkEzeDJOdVYxWTNBcWJzSmtxMGJadHR0dzhK?=
 =?utf-8?B?SUd5UUpKbDVtVVl3SThxcHRTNis1UXBONUVhUDhtaWpuejl3dkRBamJDK05Y?=
 =?utf-8?B?anVIVlpFdkZ2eTEzYWRhOEZjUlZiTFo2b0hsVHlrTmoxZzVQNEl2RWJNbkxt?=
 =?utf-8?B?K1VLdXZFQStmb1J2cHovTGgvQzk4NEJoQXdVRGo0N0pSVmZQQ0Vub2cvWmVG?=
 =?utf-8?B?Y2tWNEZYSmdMOEVGYkhpSzZSRG9UaEN3RFNPZ3BwbVZIUVpsVkRUemF4eHg4?=
 =?utf-8?B?cE5XVHhmaG1FSVdmOXYvcVFLb1l6SGtSUlI2VEJ4WFFEUVBKNUpEVnpLS3Rr?=
 =?utf-8?B?WXhiV01sYUpwOUR0ZDdBalJ3MzFWM0owdklrRHBZSzljbTVSTTNRUHJZcW5w?=
 =?utf-8?B?bmtwNlcyNCsrRDZWdDV4UmMrYXJyeG1mUXp5NmFMUDRHRHVUcGl2OTB5U2Iv?=
 =?utf-8?B?WEl1NU9jb01DbU1qUVVLOTZseEhRRW4xWTlMWjhyb21FUjFSNlRSVmhOaTli?=
 =?utf-8?B?MzVYc3NCOTBuSXZkMXhGeTYwOWZJUTE1MjlpTjEyZE04ZzMxdFFEdW4wdGRj?=
 =?utf-8?B?NDBhMjdRK2tJb2xubnNveFFhSE1yc3RVNnAwZnpldDJNbXowR25oQWloOTZu?=
 =?utf-8?B?QkNyR3hscTJhOTR3N0ZobDk0ZFMwMFppbHZpTVFqMlVkb3gvbEsrNkpXQXJ3?=
 =?utf-8?B?NHdjZGhISEdsTVRrcGJ3dVpXWEcxRHI3UGdlNlFzaExEWWh0UUR5VEZ6azFY?=
 =?utf-8?B?OTdDUjZSMDgyUk5JQWYyRVNrcXR1Y0hjSmdvK1pxYmxzelJqOUpBV24zZjc0?=
 =?utf-8?B?YUl0VTVaVnZUWTA4UTlTeWlUSzJ3dEE3UVFDOHRsRzl6bkgvOXVYR0ZZWUpG?=
 =?utf-8?B?QmxQVUJwdVNWNG1UV2tuYkN2L3ZYYnY3V0dnYjBMKzJuRkZ0R3FYbkhGUzFv?=
 =?utf-8?B?T3Y2em1FdzdxazlyaEVIMXlEOUlObVcrNTFycnc3d3kzNjk5VHhhNFRUQ1BR?=
 =?utf-8?B?WGZZOGhvVThqc2paRVFRRTBCVWIwaUZxYy9adVdxSkExN3NvOGpkdktOUXN3?=
 =?utf-8?B?YlVnVzhLQWRENlEzdHl5NlRQSGkybk9hUDlBVU1aNUp2Z0R5OUpLYVNXUllF?=
 =?utf-8?B?c2xkOFZ2ODkyL1lBaFZCaUpJVzZQQU5DeE9LVlA3elpJZ0ZtY3hjdEttQms0?=
 =?utf-8?B?Lzh2Vi8vWTJ3cUdKQWt5MkZtbElML2dCQ1hMWHRFWEQxaFJqYisvbCtmd0lV?=
 =?utf-8?B?R3ZyTEZZbFdlZDFqR2FtZ0hBb0U5K2x0enZ6eENibHdrUlV0enAzQTFSMGpB?=
 =?utf-8?B?NVZyS0NRNk9wcXhQZzh3KzJUVDA2NTk1YlZ4MWE1NzF6RllJYUZqeExLV1lQ?=
 =?utf-8?B?MFQvLzJZTVE5WGJxL1lGWEpQY0F1Z2RQZjFPQzAzeEVWKzlydzdhZEt4UG5R?=
 =?utf-8?B?WG5uMjZHY2t2YUFQdlRJdzVXblovVDJ2emJ0V01jRTRET21yWkE4UGl0bjlI?=
 =?utf-8?B?Z2hkUXQ5dEF3RFVOMDMxSVhEWW15b1pmYk9KWWVsSTMrS04wckhuRnExZExw?=
 =?utf-8?Q?YAUinYrh3831S3uw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cbcc2e-ff71-4bca-ae23-08da48d9d33b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:02:41.6915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvJosdqxpMdrjifA0X+XBb75+3a8ZA+gicVEKmck19cQT8A9SLhuYXNyt4xPN+RKIvrWGXFaYbvoUXJtVFRQqrSvqHbl4VK+baBK/43B0N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5521
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------mnvacnBJiLe20emF53ojqZA0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/2022 00:59, Jani Nikula wrote:
> On Sat, 14 May 2022, Vinay Belgaumkar<vinay.belgaumkar@intel.com>  wrote:
>> SLPC min/max frequency updates require H2G calls. We are seeing
>> timeouts when GuC channel is backed up and it is unable to respond
>> in a timely fashion causing warnings and affecting CI.
>>
>> This is seen when waitboosting happens during a stress test.
>> this patch updates the waitboost path to use a non-blocking
>> H2G call instead, which returns as soon as the message is
>> successfully transmitted.
>>
>> v2: Use drm_notice to report any errors that might occur while
>> sending the waitboost H2G request (Tvrtko)
>>
>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
>>   1 file changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 1db833da42df..e5e869c96262 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>   	return data->header.global_state;
>>   }
>>   
>> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
> static const
>
>> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_set_param_nb(guc, id, value);
>> +}
>> +
>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>   {
>>   	u32 request[] = {
> Ditto here, and the whole gt/uc directory seems to have tons of these
> u32 action/request array variables on stack, with the required
> initialization, that could be in rodata.
>
> Please fix all of them.
>
> BR,
> Jani.
But the only constant is the action code. Everything else is parameters 
and will be different on each call.

You mean something like this?

    static const u32 template[] = {
         action,
    };
    u32 *request = kmalloc_array(sizeof(*request), 4);
    memcpy(request, template, sizeof(*request) * 1);
    request[1] = param0;
    request[2] = param1;
    request[3] = param2;
    ret = send(request);
    kfree(request);
    return ret;


Not seeing how that would be an improvement. It's a lot more code, a lot 
less readable, more prone to bugs due to incorrect structure sizes 
and/or params in the wrong place. The current version is easy to read 
and therefore to maintain, almost impossible to get wrong, and only puts 
a few words on the stack. I think the largest request is region of 15 
words? I'm not seeing what the problem is.

John.


>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   	 */
>>   
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> -		ret = slpc_set_param(slpc,
>> -				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -				     freq);
>> -		if (ret)
>> -			i915_probe_error(i915, "Unable to force min freq to %u: %d",
>> -					 freq, ret);
>> +		/* Non-blocking request will avoid stalls */
>> +		ret = slpc_set_param_nb(slpc,
>> +					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +					freq);
>>   	}
>>   
>>   	return ret;
>> @@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   static void slpc_boost_work(struct work_struct *work)
>>   {
>>   	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	int err;
>>   
>>   	/*
>>   	 * Raise min freq to boost. It's possible that
>> @@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
>>   	 */
>>   	mutex_lock(&slpc->lock);
>>   	if (atomic_read(&slpc->num_waiters)) {
>> -		slpc_force_min_freq(slpc, slpc->boost_freq);
>> -		slpc->num_boosts++;
>> +		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>> +		if (!err)
>> +			slpc->num_boosts++;
>> +		else
>> +			drm_notice(&i915->drm, "Failed to send waitboost request (%d)\n",
>> +				   err);
>>   	}
>>   	mutex_unlock(&slpc->lock);
>>   }

--------------mnvacnBJiLe20emF53ojqZA0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 5/16/2022 00:59, Jani Nikula wrote:<br>
    <blockquote type="cite" cite="mid:874k1pj4bi.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">On Sat, 14 May 2022, Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">SLPC min/max frequency updates require H2G calls. We are seeing
timeouts when GuC channel is backed up and it is unable to respond
in a timely fashion causing warnings and affecting CI.

This is seen when waitboosting happens during a stress test.
this patch updates the waitboost path to use a non-blocking
H2G call instead, which returns as soon as the message is
successfully transmitted.

v2: Use drm_notice to report any errors that might occur while
sending the waitboost H2G request (Tvrtko)

Signed-off-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 1db833da42df..e5e869c96262 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
 	return data-&gt;header.global_state;
 }
 
+static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
+{
+	u32 request[] = {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
static const

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
+		id,
+		value,
+	};
+	int ret;
+
+	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
+
+	return ret &gt; 0 ? -EPROTO : ret;
+}
+
+static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+
+	GEM_BUG_ON(id &gt;= SLPC_MAX_PARAM);
+
+	return guc_action_slpc_set_param_nb(guc, id, value);
+}
+
 static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
 {
 	u32 request[] = {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ditto here, and the whole gt/uc directory seems to have tons of these
u32 action/request array variables on stack, with the required
initialization, that could be in rodata.

Please fix all of them.

BR,
Jani.
</pre>
    </blockquote>
    But the only constant is the action code. Everything else is
    parameters and will be different on each call. <br>
    <br>
    You mean something like this?<br>
    <blockquote>static const u32 template[] = {<br>
      &nbsp;&nbsp;&nbsp; action,<br>
      };<br>
      u32 *request = kmalloc_array(sizeof(*request), 4);<br>
      memcpy(request, template, sizeof(*request) * 1);<br>
      request[1] = param0;<br>
      request[2] = param1;<br>
      request[3] = param2;<br>
      ret = send(request);<br>
      kfree(request);<br>
      return ret;<br>
    </blockquote>
    <br>
    Not seeing how that would be an improvement. It's a lot more code, a
    lot less readable, more prone to bugs due to incorrect structure
    sizes and/or params in the wrong place. The current version is easy
    to read and therefore to maintain, almost impossible to get wrong,
    and only puts a few words on the stack. I think the largest request
    is region of 15 words? I'm not seeing what the problem is.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:874k1pj4bi.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 	 */
 
 	with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref) {
-		ret = slpc_set_param(slpc,
-				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
-				     freq);
-		if (ret)
-			i915_probe_error(i915, &quot;Unable to force min freq to %u: %d&quot;,
-					 freq, ret);
+		/* Non-blocking request will avoid stalls */
+		ret = slpc_set_param_nb(slpc,
+					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					freq);
 	}
 
 	return ret;
@@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 static void slpc_boost_work(struct work_struct *work)
 {
 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	int err;
 
 	/*
 	 * Raise min freq to boost. It's possible that
@@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
 	 */
 	mutex_lock(&amp;slpc-&gt;lock);
 	if (atomic_read(&amp;slpc-&gt;num_waiters)) {
-		slpc_force_min_freq(slpc, slpc-&gt;boost_freq);
-		slpc-&gt;num_boosts++;
+		err = slpc_force_min_freq(slpc, slpc-&gt;boost_freq);
+		if (!err)
+			slpc-&gt;num_boosts++;
+		else
+			drm_notice(&amp;i915-&gt;drm, &quot;Failed to send waitboost request (%d)\n&quot;,
+				   err);
 	}
 	mutex_unlock(&amp;slpc-&gt;lock);
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------mnvacnBJiLe20emF53ojqZA0--
