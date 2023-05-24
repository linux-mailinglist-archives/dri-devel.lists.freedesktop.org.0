Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C57A70FC1C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B25210E4CD;
	Wed, 24 May 2023 17:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543AD10E48F;
 Wed, 24 May 2023 17:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coGWBHBzWFIiP11f4KeCrix99FgSzm44V6c3/iY0VQq02mIr74sL4TnwHo88je19r2mQCy2zMcO4mZsSmzKS51jtD2qe3Sg9LKyGIniv2EYLKnrZi1PsJeGr9ydnHeAe1iHxFcK6nav1rb7ALcGjX0V7FpENlqVkMpBlz0ssZ+nU4WKV0Qxny16Cm+cnuNv/GY0s4iOjh8cjA7sBajGlyngPxSVfUwkHeqcThBnGIBdUp/wU+MGUuDlwS8HZo4rpbPOAaavaunMqQGNIBA5bpID6J9HeGSvmWX82svVeWSwMqtGfJW9YFvOSqAs92exIoX6JKXvMErxTYFcF24PhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7D9qifNQkvcmmkQi0Nzj/8r8KPm9neBC6IR2aXhLfg=;
 b=AFN2ofQqgD+JLLVdp+tKChmTM57EDDmuptnCUkDxZHI4/zYoINBFXYNy/5VRYW6lZh7WaiqI6gdEuwGCQy22wvgG2KNhUQJBVO1ovwlnmgcVMrxfm1Rrjeph1HGgqDrYmBcIun/e9qjdg0gKiM4SZ+pUjWIKfqAtWjH1C0E92ZWa+vqQdosLcKywMd3emcaxd4alHqf3wGtuEGt6QSz8ohd7ao0DtTcYZedpsFdci3fbO5MyVUHK4UIswVvi9OUGWIEvQhs3fPoqlfEaEVS8PcOI2FwqspkTc3e9cPIZ7DVsMiy33bpelYOT6nn49VgvVlWw3q/0iTnJaVhASuEQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7D9qifNQkvcmmkQi0Nzj/8r8KPm9neBC6IR2aXhLfg=;
 b=uJ4nqNl6g6zqSqOS8gQH7cJ71SDnCOFeoksclnPvMolZkraTrAqD35U/iWPfLIv1yGIyreq9CDwGDEKoH3ikg1nIEo1s0h/Dhv1xrdB6BgLvocFc3nmL5GOAOmmrU6llnCETwr5F9ewP6a7aYUK95EDlALmYqkPne4nYNtL5gls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 17:01:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:01:31 +0000
Message-ID: <116534d2-9d6b-2ba6-48b0-0e733c1862ce@amd.com>
Date: Wed, 24 May 2023 13:01:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 03/17] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-4-harry.wentland@amd.com>
 <20230308110943.4dbb6afc@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230308110943.4dbb6afc@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: cafb04da-d3a1-43af-abd0-08db5c7885c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpD6Nal1hHh9vxDRU9YJMNeb8gLXtvrGixwBicJmtHPOhK3v3RXwroNJjdBUwtB0SW1JfwB1k69TDhXCExZmna9WXTWyxRLHcMs2+qesUDVdbZ4gvMNkFrIzeg5UUegkHxBoQ8ixaLrkEpe5NBkqaofKQOqqjWLM3ul97qddGX92zYMg+k9vY7ACgF5cwfACAzZ2Z+1j0GRG7IIz2kSXaGQqkrBbQpqkBU+qYv/XTGdX50jqXmurRowNmrsMIK7JHNeFOnwwOiM68UOold2uNd41SIVqO8o4JFYUFMmyqs+pB7BKPJVMuLft5+PWFe3TrESh1TFJ473SBt+zwdnYJ8o3mGcOBs3vGlVpvzCJ8/sNkvdNxTBxjNT+/suq3H4oSZmrMTGYo6w7EsRr9TyP1FmplWbyrDNRWwZjd33zoubQtdkJh7hRfXRhRl82wPn1o5J6O4VV5sUFpNDy/K9D5dMdpxeOg0kE5EekqmF8b6VnlikuxBT23fKjyDmnBccGJ2L9aktvlTLsGIpBAK1hEjsHYah7vudmzNlciEQDWN/UcJo5iVMjXJzLvp6Je+Hk98mo/mXlTdXAg6HRo5RepZPJGdCFiaL/bMS6jK/exy0jDPUDGIJfTjHoRoondH4PXiLVHhGlFiuLTymkJJGK3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(31696002)(31686004)(6916009)(66946007)(66556008)(66476007)(4326008)(6486002)(41300700001)(6666004)(316002)(54906003)(5660300002)(8936002)(66899021)(8676002)(478600001)(86362001)(38100700002)(44832011)(26005)(6506007)(6512007)(186003)(53546011)(83380400001)(2906002)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhRTmppaVpJQmV1TWpIZlBzUkhBR3JrUGdEOG5JSTAzanMyODdvVUQ4ZTR4?=
 =?utf-8?B?cFEyT2d6M1BnSmxLaEJwSVMvOTZnUWh3NDJWN0Vra29iYURNNkRINmlPNzBL?=
 =?utf-8?B?dkhDV2VmeXd2WU0zcmloZ0VyajNZb3pPeUtxeVpRNUpJY3YrT0x2ZjhVM1NC?=
 =?utf-8?B?aW14Y0wvL0cwY3dHTWVHZmJuRkkwbWZPMS84TjVZem93dHZTUFVSc3JxN1Nw?=
 =?utf-8?B?d3dzRUJLS3hLZG1EZng2UU1LN0NQOURjeVdja0c0MUdnMnJKZGozQWJaeTlx?=
 =?utf-8?B?OGczMWcwSFBwdnZlTktFaTFHdTFBUkhzM2V4MTEyamZJRnNPWjBhVEZEWE1N?=
 =?utf-8?B?RkVScVhoZjRkV0ZsTC9sM2VoTENPa2RETTRBSldqNlpuYTE5c0hic0htWDFY?=
 =?utf-8?B?UmJ3Y2RkQnl5Qm51TEdVeERreHA4Ylhud3g4Vm9PUWRjOVNpNFRDYmQ4SkNO?=
 =?utf-8?B?WTZyd3B6M1hhR2dTSzBiZUU5aHp3dXJlZ2JKVEV2VHpEWWxKYnNwNkxIMFJE?=
 =?utf-8?B?dDZ1eGV0VkptV1NhTjhIMG8vekpNam1MNVBSVDV0RlMyR0Yvc1luQTZTdXJM?=
 =?utf-8?B?SWtNRFowTjlqcW1iWngveGhJM2duNG5VVStaQTU2VlB0MkliLzY1VXh1QzJ4?=
 =?utf-8?B?QWRIaHIvYWpjRkNOM1FtRE94L05CYWsveERXNURaUkpTVmxmQ3d0SXQxemxN?=
 =?utf-8?B?MHpXOW9hREZ4dXVtQWNkME5mUUsxWStRRnVQcHEwbXpRNExtZ2JFQU5pblg1?=
 =?utf-8?B?M3JIRm5XSXU4STN0RFFpMVpUOTVGTEViaVcvU0RYUittMVd4aGJub2NTWkY3?=
 =?utf-8?B?ZkhvV1dUZGZVRnBET2txaGU2cktnbkloTjZ5cHNqT3NvNG4vUXRCVXBRTk1p?=
 =?utf-8?B?UnhYd2x2Zm82VGxJaEJpaktVSks2cVV0V3g0VHNaRFBaZ2p5QVFXSGdjY1lK?=
 =?utf-8?B?ZEJGQ0VGRXFOWUJvVmJNS0M3K3FaNUNleDNwZGExTk0zbXd0MTVGMUMzWi9N?=
 =?utf-8?B?M0JuK3B0eXBBdkhVZDRVbmplUlFsS2wzdEhvaGJCaTVPN0VCNzd1eEgwZkNt?=
 =?utf-8?B?TWx1SVA5V0w4ejQ3U1dRRWkxRWY5Z2c4Q1JuMWJYS282dXpydDB5ekNsYitz?=
 =?utf-8?B?VG5zMm1wNVJQMThHQ1d5N21ZeExDVEJlYkgrL1lMOUZ4Q0JXdnUwNk1IV1l4?=
 =?utf-8?B?bjhjL2JxREtCbVNBMWgrc1Q0dHRtZDRFcTY3WnBQRmY0emRnQThnd3hXYWlu?=
 =?utf-8?B?TG5QemVmR1ZIRXErcU9UWUNtN3ZQOTVpc1NsMXdJVm5yaHpVdHpnQlRibUhC?=
 =?utf-8?B?SStwa3YwUUx0d0pWSGk1MEpMRC8yNGdJdXdYQnFydVZXU3lMaC8rdENGRlJB?=
 =?utf-8?B?TmszcGF6U1ZQZ2R5ZCtvMm9zazFlSFhNcmduclkvQ3QxWG4rZUtKMGVVU2hE?=
 =?utf-8?B?NmpxbjNwRFZYNmQ3WHQzRk1jU1dLaUZ6MUZLdWZFZ21udWswc0daRjR2amhI?=
 =?utf-8?B?cnJUaGpVSHFhRnZGdjNZdHhOM0pTS3ZZVGtyWEJJWldoQzZLRW5UaEZPSDVJ?=
 =?utf-8?B?cTFmbWlIV0RsU0t1OUwyVVdlQ3JNWEFpYkEwdTRoNjUvL2pjWUQ5dVl5a0dD?=
 =?utf-8?B?QjdhZjBFa00yVzFwVkFwenJObGEwL2lyd0ZUWVVXSlUxcE9aM1owMlhya2Mw?=
 =?utf-8?B?R2d3Sm8zcU80VlhIVTNIdU9pQ3MwcGJsZFZlRElUWWFkejFvZEFoYmpKd2xT?=
 =?utf-8?B?dHlGVFc2d0lNeEl2eEpLY1BJK1Zub1phTUxFUE5HOEhJaGg3NEZBTEFyeFg4?=
 =?utf-8?B?cEpJTlJONFI1eFp1TjFWeHRhcmN4TVJ6eUsxRjZEY2F0RysvS1gwSmNDOE43?=
 =?utf-8?B?eVBuNnRuNjhqc3RyOHJXMjJkaTV4MUVuMjdMaTd2RlFPZHJpR2VkNnpvM1Ax?=
 =?utf-8?B?VEw1UXVlTmFVc2Y1R2ovam9uTWlEMW5PZXpkYTJ2cnJEZFZQMDFFMWpyR1du?=
 =?utf-8?B?cGVqaEVxRy9FTFpQQk9jU0NPS3B2QXlCNzRDMHkrbXlMN1BpbzBMeUx3bUZt?=
 =?utf-8?B?T3dwbUFodGtadDdtQ0dMN2QyOHFicXVONTRsS01zbTcwVW5ERTRHeURTN2xR?=
 =?utf-8?Q?q+bU1AsDwEI52F9Oc0JU8X441?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafb04da-d3a1-43af-abd0-08db5c7885c7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:01:31.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/1n3YUtrg3zFQDFHVoOLtNCJ6qHAL2mDGABzFhRLCyqu6XxjMTchEvWjpf64k8j9JwjZ27SsRWokZKZ03hXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/8/23 04:09, Pekka Paalanen wrote:
> On Tue, 7 Mar 2023 10:10:53 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> From: Joshua Ashton <joshua@froggi.es>
>>
>> Userspace has no way of controlling or knowing the pixel encoding
>> currently, so there is no way for it to ever get the right values here.
>>
>> When we do add pixel_encoding control from userspace,we can pick the
>> right value for the colorimetry packet based on the
>> pixel_encoding + the colorspace.
>>
>> Let's deprecate these values, and have one BT.2020 colorspace entry
>> that userspace can use.
>>
>> v2:
>>  - leave CYCC alone for now; it serves a purpose
>>  - leave BT2020_RGB the new default BT2020
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_helper.c |  7 +++----
>>  drivers/gpu/drm/drm_connector.c           |  8 ++++----
>>  drivers/gpu/drm/i915/display/intel_dp.c   | 14 +++++++-------
>>  include/drm/drm_connector.h               | 15 +++++++++------
>>  4 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> index faf5e9efa7d3..05a0d03ffcda 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> @@ -97,8 +97,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>>  #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>>  #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>>  #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
>> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
>> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
>> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
>>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
>>  
>> @@ -112,8 +111,8 @@ static const u32 hdmi_colorimetry_val[] = {
>>  	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
>>  	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
>>  	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
>> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
>> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
>> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] = HDMI_COLORIMETRY_BT2020,
>> +	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
>>  };
>>  
>>  #undef C
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 61c29ce74b03..fe7eab15f727 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1031,9 +1031,9 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>>  	/* Colorimetry based on ITU-R BT.2020 */
>>  	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>>  	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>  	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
>>  	/* Added as part of Additional Colorimetry Extension in 861.G */
>>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
>> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>  	/* Colorimetry based on SMPTE RP 431-2 */
>>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>>  	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>>  	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>>  	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>>  	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
>> @@ -1068,7 +1068,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>  	/* Colorimetry based on ITU-R BT.2020 */
>>  	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>>  	/* Colorimetry based on ITU-R BT.2020 */
>> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
>> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> 
> Let's hope no-one complains about missing the old string names in UABI. :-)
> 

As discussed at the hackfest, I'll drop this patch.

Harry

> Actually, you should write in the commit message why removing old names
> is fine.
> 
>>  };
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index c9be61d2348e..be100a193bf5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1766,11 +1766,11 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>>  	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>>  		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
>>  		break;
>> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
>> -		break;
>> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
>> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
>> +	case DRM_MODE_COLORIMETRY_BT2020:
>> +		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
>> +			? DP_COLORIMETRY_BT2020_RGB
>> +			: DP_COLORIMETRY_BT2020_YCC;
>>  		break;
>>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>> @@ -3043,9 +3043,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>>  	switch (conn_state->colorspace) {
>>  	case DRM_MODE_COLORIMETRY_SYCC_601:
>>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
>> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
>> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>>  	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
>> +	case DRM_MODE_COLORIMETRY_BT2020:
>>  		return true;
>>  	default:
>>  		break;
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index bb078666dc34..3e2e1bc7aa04 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -409,12 +409,15 @@ enum drm_privacy_screen_status {
>>   * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>>   *   (HDMI, DP)
>>   *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
>> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
>> + * @DRM_MODE_COLORIMETRY_BT2020:
>>   *   (HDMI, DP)
>> - *   ITU-R BT.2020 R' G' B' colorimetry format
>> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
>> + *   ITU-R BT.2020 [R' G' B'] or
>> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
>> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
> 
> Drop the constant luminance variant from this value's doc.
> 
>> + *   colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
>>   *   (HDMI, DP)
>> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
>> + *   deprecated; same as DRM_MODE_COLORIMETRY_BT2020
>>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>>   *   (HDMI)
>>   *   SMPTE ST 2113 P3D65 colorimetry format
>> @@ -448,8 +451,8 @@ enum drm_colorspace {
>>  	DRM_MODE_COLORIMETRY_OPYCC_601		= 6,
>>  	DRM_MODE_COLORIMETRY_OPRGB		= 7,
>>  	DRM_MODE_COLORIMETRY_BT2020_CYCC	= 8,
>> -	DRM_MODE_COLORIMETRY_BT2020_RGB		= 9,
>> -	DRM_MODE_COLORIMETRY_BT2020_YCC		= 10,
>> +	DRM_MODE_COLORIMETRY_BT2020		= 9,
>> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED	= 10,
>>  	/* Additional Colorimetry extension added as part of CTA 861.G */
>>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65	= 11,
>>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER	= 12,
> 
> With the caveat noted and nitpick fixed:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq

