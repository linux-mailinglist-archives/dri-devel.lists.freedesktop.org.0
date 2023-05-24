Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639470FC1A
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C0310E4E0;
	Wed, 24 May 2023 17:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69B510E2BA;
 Wed, 24 May 2023 17:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRhGBsp+QQ6xS+YNf5xmWIYRccCger344DQKp5JizLd4w0LiJBY2RpWuhA4XEf9Pqk+9XUfxjSp+RfYq1QzTKnv9cB29c0Hods8Le7rgRQ4vIpnjHRIhkKo3qnCph4u1XIi43qXAHoPbNdWsTWNKIvuvojfXwUKIhnkHBaeEAfZghMo7buZ7UFKvuTA1d+ykyh842rFcj27YLGrxzz+JzFy/LmgK94jwrKW0HrQztSGc5/QEeq6v7R2tw4xnuRNECa5496xxq83GymD7JTjQZXCiZ4z92YL9eEd5CFJD4+cqkkg6pagmjnl4MQXYJy7I/t1TwoMyE+jKwzCjqSQM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc9fMlf7VXXmNERmQ5MYce8uem7L6kD+5Au1Wz/KWZ4=;
 b=PFvVrc3pJvJ/4NKSvbDtL9j6vEDKHSzk5qukQGo8nGx5qa3WN9sx0Bdo+LCM//+FfkQXjclVDzwZwMUaZ7KuJRC+ZOBOZKWtfa9jihRBYynkPUv/aVW0yG/QhW//1nH8yMaydJqtwWQdkWK4aAHe+Rn2JgLk47HzsyrXC+uH2tbb6rPIfCZiUitl9ZqiYyc5CkgDMYv3Rrel9UfYHn7QNEPsPgdl/jclmTUlEmUsYtazc6KWZbA+9yjfCOwIf7Cn+8YUH7sGhDwbfhMCwlaFEyKvo1Zo+Q5dHnXo87/dk+rPFGCECBovMb6MzRpAjgVtoRAq++5CsY01VaudyaqDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc9fMlf7VXXmNERmQ5MYce8uem7L6kD+5Au1Wz/KWZ4=;
 b=3LcycjTeJ3p0TzSKS3P5vzWEPDbJHSSePECfBIHGoIv4peTHDI252OJWEH8RIOsIhvp6DHrM8JVPOv66Fz/p9q5D3kRJK9zL/KG6Eh15TctcvxmNHeZvwbYMGSJlO5KZIAV++aT+vralN6P5oS2tpbqvMGCypm/ymTaf4dqGrqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 17:00:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:00:37 +0000
Message-ID: <0b6b2a36-3b9b-c33e-a1d3-fa50f9811b9f@amd.com>
Date: Wed, 24 May 2023 13:00:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/17] drm/connector: Add enum documentation to
 drm_colorspace
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-3-harry.wentland@amd.com>
 <20230308105944.05fb9377@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230308105944.05fb9377@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e08fb14-8b56-4dcc-14e2-08db5c78656c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RCMO4QNOkG+JBHYt770EawvFO8ykXja1VKa8zBcaBTfi/x5j83REkroChJ6ekyvDX+PakPps7fB1jhPRSNK7ZcTP5obAOPLdO01h5abp/KhsOi1UDM+M6JqnLsguaTfFj3m4oS4RKaqm0Mp37o1LdOUEr6spSBi7trpGcDCAtSqBL80keoqD1YWp0hbgOS14pSTNN5eq51YXiJYwEHl6HkbSBgx269s89tE3IoovYvRz+nBex3hbCTWG/Ia/h5x1T/mJe+ogEfSmiHvb6/4a2cUDSReV9SE/XJHCG3KmNI4//V7Ud6/CRqTlil1wtPRNVzPTYHkL16gUpZ6iTh/xWLz1rEBfXa9Yx2pbFSMXQzUQxtu4It7Img7J83wsDTOYOAK79ipVJg5do3aqG9s1JUkGsmAmDp2lzWj/5BkhZuEJdMj2nyqbkFs+F4aOSVJChvCfh7ojQCSPQmx5fM0GwUUXK6IWATxtOFvFS41//I/p/yCAblmF1exTpKBd6+unmF3GD7TbeeOa0Y+YuTyQnhFxdOmh9mdbYzERNrbdPsdqsYvOiRcvIyPwegrYf5zzi+0+0W+TQOPuQYlDg1R9eLZP/TkXiAHaVlm4xR+0oyV8YF2q++tEGzVSrVKD+Z0ufpheBMyORrA6ROvvcgJKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(5660300002)(8676002)(8936002)(186003)(53546011)(66574015)(86362001)(83380400001)(36756003)(2906002)(2616005)(31696002)(44832011)(38100700002)(6512007)(6506007)(26005)(316002)(66556008)(66476007)(66946007)(4326008)(6916009)(6666004)(31686004)(54906003)(478600001)(6486002)(66899021)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2tXNFN5N2M4alRWWVZsZzZRT2g5UHpTMlMxQWNna1FPZ1hBSXc1b3Q1Wmlt?=
 =?utf-8?B?dEVWdzZtckREWERHS0pjTVlLL1NIbmY4UnlPT0k5SExHekx5eTNBdWVRYjJ4?=
 =?utf-8?B?N0w1b25xMlJVU1V2aDVtSUU0ckJLUVVkeG11SklVLzhSS2JjY2UyYk9Sc0l1?=
 =?utf-8?B?aysvT0o5YnllVkVLWjY3YXNKZVNYS0F1T1NiSTU5cDRIcDR1QkVUdlFDTEx5?=
 =?utf-8?B?Smp5alJzS3JDTkxLN2dKbXh6ZFJzRmhIS3UrTVRuc2ErL095TEhiNlJrbEFo?=
 =?utf-8?B?K1VPL2M2SXBNWnVJV2RoQ1R2SURMSXlJWkdXL2lEWDN6cXhpb1pDYWkvZ2RG?=
 =?utf-8?B?bnlHM3Bad3A2dHJRL2xRZHZqbmhhRXVlNGJWZlRoeFdYT2dmRStYRm9qUk4w?=
 =?utf-8?B?TUZFcmJKMWNoVDg1WkkwbUhqdTl3TE9BbXJRSXF5Yyt3bHRaUm9GNHJEWGNq?=
 =?utf-8?B?YlV6cFBhRzY0VTR2RTRZWHM2bUluVzAyWFB4em1ZelAvZEF5RTdpejJENlYv?=
 =?utf-8?B?ZkNXVDNHYUtHWk9NbjhtUzFycE1pZysxVnFOUGZEaEE3TTM2MjZpRXRqUGxI?=
 =?utf-8?B?aDN4Si9saStFbnQ2czVOcmRnMEh4aEJXYVB1MFNTL0F2VE1NQll1cXJjZDFV?=
 =?utf-8?B?Z3AwSGcxRFBJaldmZlhYUXpGMVFNUXI1Uk1WelpGaTdmcHNhZmRuTEFud21p?=
 =?utf-8?B?UkhHbVIycWZ4QlhZVWlOYzZOUlVsT1diWU42RFZ6Z2pnaGh5R1cwdDVjdzh5?=
 =?utf-8?B?Um9DWm1WSGhuZVlzRXU4VzZ5R2pMVC80SDl5SXA2a3YzcDdvcEI0eVZKVnRO?=
 =?utf-8?B?TnZjRjNwVWhEdUQwV0wvWFlVQjdiVTB5aGVFZmtnNDVlZFpVdHRlK3Izc1BZ?=
 =?utf-8?B?Snp6b0crNk5mY0hnV2lOdWlQTlYxMFhYd0NoRzB2Sjh6b1RVYmRDc3J0eEpH?=
 =?utf-8?B?OVhQU29Pa0xRR3NDVXVNZHkyMWtwVkdrMmtqckQ1SmptRTdidUV1Ti84Wkpm?=
 =?utf-8?B?c2tMaTJLcHBEZ2xDN1VCbGY5SlU4b0dXR3dGcHlERFlPTE9qMkVwSkd5alZv?=
 =?utf-8?B?OTd4RkllZDNnOXI2UUg3a3BHV1YvSlNJWXRGdGZ4WitwdDlJWXFxRlhwYy9y?=
 =?utf-8?B?WlNJc00xaEhXMVBhYlI4TnRTTk9ubktPL0RXaW1PU1FubHN0c2pDbEwydFJw?=
 =?utf-8?B?VGpjQkc0T3l3cGY3SGl1VWpQNitad1NYb1NoNmp0REpnaVFYZXZlSHV1Y1R3?=
 =?utf-8?B?ekhDWWxQeDd0VVFhY0VHd3g4dEZ1OGdtcitmZ0VUSzZGRGxnMWwzbXRrenRF?=
 =?utf-8?B?QVM0NFhjRGFLUFRNSkJsNm9zZzJTeHgvRC9uSkRxYlZzMkRkZ294ZWt4UFhK?=
 =?utf-8?B?LzRUYlBzM0N2VG9DYmFrMDFUdGJ6VzI1dVROOTVDM2tldzNDbmY5N0k3L0JT?=
 =?utf-8?B?M1M3NHZLZGIxZmVyeXZxNUpGb2ozMWJ6S0loMEs3NHUvN203b2ZSYllNN0JX?=
 =?utf-8?B?VjhDUEt5dm1tWmtNem4yRmVsbE5ZRTNMUURqZkNHSm1mZklqekNRSHZ0SWxu?=
 =?utf-8?B?b25PSGtVcGtvdkg4dkR0eHpVcG84K3FHc2p6VVlWQnZzalJ6eGY2TzQvWHFu?=
 =?utf-8?B?R0lMYU1qc0dmbHk4YU0yeTdnRU5Pa2d6blZRZHc2eGdwOG5lMlNsMVV0SUpH?=
 =?utf-8?B?K0toYWR6dUJQQ3lxazRnZCtWUmhnY1c3cGx6NnZ5L3BidXFYaVlRODJ2eDhz?=
 =?utf-8?B?Y0V1ZW5LaHZGU0hPYndLZDNLQzRGdkJ6V1VhRzN5RFNLMlVKUHVVTVoyNzI3?=
 =?utf-8?B?citWWUhoYTVvbG9mak52QUloSFV3RDc0enZCcU5vOXhjOGtwSzVUZVFyK3k2?=
 =?utf-8?B?YmxlRjZldFIyTDR5TVBNQ2RXNHNHSWQyY3lVMkFBV0hYRnExRkt2STZKeS9l?=
 =?utf-8?B?MWY0QVVKOElCUWRyclRTekFmSlJ1TngyU3ZqRVFwcnBSVm5Xck1MaHFoN0hS?=
 =?utf-8?B?ZXN3cHl0OVdMbUU1ZFlXS2tZTThuamJzV2c3VUN6VFZ0bnVPdGlBQitiQWVP?=
 =?utf-8?B?a3NnSmQ3WTlCUWJUbXcyYk1VTzdpWi9YbDlsV3IyemZMdmF4YkR1UWtPZHNr?=
 =?utf-8?Q?R7Zkx/eR6+OnSeBQpVFQiIboV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e08fb14-8b56-4dcc-14e2-08db5c78656c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:00:37.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW/mEzxW5wfdpHj3nUxCbI3fubjF44VsU8xCrD+E1EA6n8MjLLhri2HUvk8cmwUfG7WYBwCvFKmF1yrgGmWu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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



On 3/8/23 03:59, Pekka Paalanen wrote:
> On Tue, 7 Mar 2023 10:10:52 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> From: Joshua Ashton <joshua@froggi.es>
>>
>> To match the other enums, and add more information about these values.
>>
>> v2:
>>  - Specify where an enum entry comes from
>>  - Clarify DEFAULT and NO_DATA behavior
>>  - BT.2020 CYCC is "constant luminance"
>>  - correct type for BT.601
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Hi,
> 
> this effort is really good, but of course I still find things to
> nitpick about. If there is no answer to my questions, then I would
> prefer the documentation to spell out the unknowns and ambiguities.
> 

Finally finding time to look at this again and want to make sure I
try to address your comments as best as I can. I'm terribly at tracking
emails, so if anything was clarified already I apologize.

>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>  include/drm/drm_connector.h | 67 +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 65 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 6d6a53a6b010..bb078666dc34 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -363,13 +363,76 @@ enum drm_privacy_screen_status {
>>  	PRIVACY_SCREEN_ENABLED_LOCKED,
>>  };
>>  
>> -/*
>> - * This is a consolidated colorimetry list supported by HDMI and
>> +/**
>> + * enum drm_colorspace - color space
>> + *
>> + * This enum is a consolidated colorimetry list supported by HDMI and
>>   * DP protocol standard. The respective connectors will register
>>   * a property with the subset of this list (supported by that
>>   * respective protocol). Userspace will set the colorspace through
>>   * a colorspace property which will be created and exposed to
>>   * userspace.
>> + *
>> + * DP definitions come from the DP v2.0 spec
>> + * HDMI definitions come from the CTA-861-H spec
>> + *
>> + * @DRM_MODE_COLORIMETRY_DEFAULT:
>> + *   Driver specific behavior.
>> + *   For DP:
>> + *   	RGB encoded: sRGB (IEC 61966-2-1)
>> + *   	YCbCr encoded: ITU-R BT.601 colorimetry format
> 
> Does this mean that HDMI behavior is driver-specific while DP behavior
> is as defined?
> 

I should drop the bits that specify what this means for DP. I really
just took the 0h value for the colorimetry of the VSC SDP packet
(SDP = DP infoframe).

> Is it intentional that YCbCr encoding also uses different RGB-primaries
> than RGB-encoded signal? (BT.601 vs. BT.709/sRGB)
> 
> Or do you need to be more explicit on which parts of each spec apply
> (ColourPrimaries vs. TransferCharacteristics vs. MatrixCoefficients in
> CICP parlance)?
> 
> E.g. BT.709/sRGB ColourPrimaries with BT.601 MatrixCoefficients.
> 
>> + * @DRM_MODE_COLORIMETRY_NO_DATA:
>> + *   Driver specific behavior.
>> + *   For HDMI:
>> + * 	Sets "No Data" in infoframe
> 
> Does DEFAULT mean that something else than "No Data" may be set in the
> HDMI infoframe?
> 
> If so, since these two have the same value, where is the difference? Is
> DEFAULT purely an UAPI token, and NO_DATA used internally? Or NO_DATA
> used only when crafting actual infoframe packets?
> 
> Should NO_DATA be documented to be a strictly driver-internal value,
> and not documented with UAPI?
> 

I don't think I have an answer for you. I will remove the "For HDMI"
bit to avoid confusion.

> I am unclear if userspace is using these enum values directly, or do
> they use the string names only.
> 

Userspace is using these enum values directly.

>> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
>> + *   (HDMI)
>> + *   SMPTE ST 170M colorimetry format
> 
> Does "colorimetry format" mean that the spec is used in full, for all
> of ColourPrimaries, TransferCharacteristics and MatrixCoefficients?
> 
> If yes, good. If not, the wording misleads me.
> 
>> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
>> + *   (HDMI, DP)
>> + *   ITU-R BT.709 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
>> + *   (HDMI, DP)
>> + *   xvYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
>> + *   (HDMI, DP)
>> + *   xvYCC709 colorimetry format
> 
> Btw. xvYCC are funny because they require limited quantization range
> encoding, but use the foot- and headroom to encode out-of-nominal-range
> values in order to expand the color gamut with negative and greater
> than unity values.
> 
> Just for curiosity, is it in any way possible today to make use of that
> extended color gamut through KMS? Has it ever been possible?
> 
> I mean, the KMS color pipeline assumes full-range RGB, so I don't see
> any way to make use of xvYCC.
> 

I don't know it's possible. I wasn't the one to write the original
API for this. I think this API defines things that have never been
well understood. But since it's there I'll leave it as-is. The comments
(as requested) are trying to clarify things a bit. I think there
will be gaps if someone wants to actually implement it, even with
drivers that currently advertise support for the whole set.

>> + * @DRM_MODE_COLORIMETRY_SYCC_601:
>> + *   (HDMI, DP)
>> + *   sYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_OPYCC_601:
>> + *   (HDMI, DP)
>> + *   opYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_OPRGB:
>> + *   (HDMI, DP)
>> + *   opRGB colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> + *   (HDMI, DP)
>> + *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_RGB:
>> + *   (HDMI, DP)
>> + *   ITU-R BT.2020 R' G' B' colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_YCC:
>> + *   (HDMI, DP)
>> + *   ITU-R BT.2020 Y' C'b C'r colorimetry format
>> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>> + *   (HDMI)
>> + *   SMPTE ST 2113 P3D65 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>> + *   (HDMI)
>> + *   SMPTE ST 2113 P3DCI colorimetry format
>> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
>> + *   (DP)
>> + *   RGB wide gamut fixed point colorimetry format
>> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
>> + *   (DP)
>> + *   RGB wide gamut floating point
>> + *   (scRGB (IEC 61966-2-2)) colorimetry format
> 
> Again, there is no way to actually make use of WIDE since the KMS color
> pipeline is limited to the unit range color values, right? Or is it
> possible by setting all color pipeline KMS properties to pass-through
> and using a floating-point FB?
> 
> I suppose the FIXED vs. FLOAT has the exact same problems as BT2020_YCC
> vs. BT2020_RGB, but I would be surprised if anyone cared.
> 

Again, I think pulling the actual enum values from the HDMI infoframes and
DP SDP packets into API was a mistake.

Harry

>> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
>> + *   (DP)
>> + *   ITU-R BT.601 colorimetry format
>> + *   The DP spec does not say whether this is the 525 or the 625
>> + *   line version.
> 
> Good to note that ambiguity here. :-)
> 
> Or maybe the DP spec writer was thinking about BT.709 ColourPrimaries
> and BT.601 MatrixCoefficients...
> 
>>   */
>>  enum drm_colorspace {
>>  	/* For Default case, driver will set the colorspace */
> 
> 
> Thanks,
> pq

