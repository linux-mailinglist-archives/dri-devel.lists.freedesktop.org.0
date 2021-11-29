Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7DB461A75
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 15:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA046EC49;
	Mon, 29 Nov 2021 14:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDC06EC48;
 Mon, 29 Nov 2021 14:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZC9JQTKn79UUpMtxmFYK/rFB4zZQBlmCy58A2IFS8LLKQCXOOfRT5MjT0BaiGDsBZWD9P197xDCxSv6TNjY9hIpPxzmDlA1pQo/8hFJfVo9ZUPqJ5PJjhPr/j+n4Wb9P3bFi75edO7ts3D6KKx2H6D8VmzZk/h/dG42bqGT50Aw6mQSJRXn4IvYrVKOKEZDg9Tkm9JSFlJmmQcCZ4Zt7c5sbEQayCYC4iMGza10gO+uv6RWw+1BoIjX/9Q15PNsqHB9UrBLVGnUct0HKQAr0v2hXdLiUAaUzKPnNXAzi/mQtb42sxbGBvEDFeH30ge9wBXqE8DdAiLVbkTHwPE0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9mqBggybBx2SySpt/bZVJSkQ5QI/d8zw0TQdVwjujM=;
 b=bxWUjHH4CaZIwJFYsgw86uT1HhyzCvLzFohjhUjaxHBNnXGTTMZdCJxvXXXUv37BdqAxCd8jEmkQQB9YFjRg5p1dvvQXOC3qLNoYwILW+x2cpgm6zTUvcr0IS5D0IfSRID37/6+mfb7aHHSlfcDSZNyUwIHm7RVu/B4SYTyez2eqv/i01js4NO2wxGs6IqEoR4+vi646fSWjc+5K5i7jY2yYNP9HdYtqIOoJxiG0xrNyIrm/2+tZ62t2HP/roGtOugZexwPuIs7IYy4NsXrkvLuyRgkYp57pphEXdiLiinK665v6EKRlokVF9UrEQxM8kzMd7Y0NXWgSRFk4uEj11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9mqBggybBx2SySpt/bZVJSkQ5QI/d8zw0TQdVwjujM=;
 b=hDbQjYi7lUq64BYaVbDGvZemMJep7v/u73c4btdMobb5q/IZPUiukzNKwd/C+GaqSITLH4S/saL4A0iNyJ+tleY4BTcBjn2dZSH72QPg3yJDOb46tR/0+sWPIMYNqWZ0kc+GkF2tCH9GZm5zTCzFavR9s6quDLZDCBb8xAnUhWY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5572.namprd12.prod.outlook.com (2603:10b6:303:197::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 29 Nov
 2021 14:56:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Mon, 29 Nov 2021
 14:56:37 +0000
Message-ID: <87b6d5b9-dc58-2e43-cbfe-162e4f9f467e@amd.com>
Date: Mon, 29 Nov 2021 09:56:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [igt-dev] [i-g-t 07/14] tests/kms_color: New negative tests for
 plane level color mgmt
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-8-bhanuprakash.modem@intel.com>
 <20211118111941.764737fb@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211118111941.764737fb@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::43) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Mon, 29 Nov 2021 14:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18a05394-4bed-47fd-cc84-08d9b348713c
X-MS-TrafficTypeDiagnostic: MW5PR12MB5572:
X-Microsoft-Antispam-PRVS: <MW5PR12MB5572CFBD7CAC2C1F69B641908C669@MW5PR12MB5572.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:225;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuFKYwpHmgHvPVW+G7aRBXUQT43K8pua337GZmxRtVgKhcHVOB8CybZo4G0J51jTJH4EjN07q8BMsre1jmPHi9lk5m/ywC9Xcc4CtseuNMR3oLEKYUx0VhFSq+4eohEZMoff8wITEjPBgFchGxP3rWLdjXLuekVF2ScrxAQieDt7SyYK2HhbBKolAY3OQloDm3funFqdaCOdTZM9SkYTNtpFIQuEaVBGOJwKK9eNpIn93fUps2drL/n/m2umqUv/MZSD2yMijsPdWIdReTI2SX8sef5R76FTJNEXCV9CVd+WQUuK1P3HrW+c4ZuAumypQA1l4rNide4WNpIKxChJ/Pge/4IGVgq/I6cr7yP87FXKGNsinqlU+xtc4xvHQiI3xbogYYyxyVHFphE11xWISRCAOq+kpjck5sFGlWfrP9fbAZLYeYfoegDk2uxLa8K3oikIfIggCm+zY80+OJv/Xgu1LXKJOvPuXG2cy4h6KYftLFd35JR3ggs8ql2x9hrhD8D8TguBEZ+DTbC/dO+IpvEV2+d0qyx8Zmib6ih3PXplB9VJXun7jF9kv6pN5JbO/i2Z1BvEsmDvPCouZxSsv2sH3fkHybP73C1y3lh8hQkH/UIWR7otahYpDJ4bSExg9+6L2wa44iJ7t9SC9AFRfKYve8Ovtm9hYyQoM6zuoHt1c5PMUj68jkV2bj0/BT+TSexuyHpssudP7JsXZZyrE6K4ANPyxulC2d3WWR4wyGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(66574015)(6486002)(83380400001)(38100700002)(31696002)(4001150100001)(186003)(53546011)(66476007)(4326008)(26005)(8936002)(5660300002)(66946007)(44832011)(2616005)(66556008)(36756003)(2906002)(16576012)(86362001)(8676002)(956004)(31686004)(316002)(6666004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThiYWJ3STNWWmZ5eG16aEM4c2xOd3BzV2FJc0huWVhjRkhraXR6bUVseDZC?=
 =?utf-8?B?WCtLYnhVbG14alFQeWNYK2QxZUZEaEdDT0l5d2x4QmowUEc2TmUxZUVSRDBs?=
 =?utf-8?B?M0VzaGlRUFlpMS9EZmJycnE2THBEdSsyc0QyK3FZeG9lL3BnNVdYYWVTK0JX?=
 =?utf-8?B?elg5c09OU0UyckR1eHBqYkpveDlUMVJVSUJKcy9xVWN3dm1XNWVQdlBTbDhM?=
 =?utf-8?B?eHIrUlRTNEMyR01mQm4waVdQRkRsQWt2OFZ3ZFFFeU1BNEtibGFsc2dDSmVK?=
 =?utf-8?B?emtxbURpMXdHYXdJZnRTM2NUbCtsanRPRHhTb2JjUDZWcHVCRm5Icm1QalFM?=
 =?utf-8?B?VXpKM1ZhNzg5QkpvMnZQYUh2UTFscEZJdjFvK2hxLzUxT2FJQUtkQWhYMkRj?=
 =?utf-8?B?eG9DMjNGWVlRZ0ZWUzBCMkN6NjB0bkdyazgrZFFyV25Uc3hsSFhHRXZnUnZF?=
 =?utf-8?B?bGtSM0JzMi9HRzhsR1VSOExLclgrcWhwcEh2WFoxUCs4WmttZ2NraUR1aU8w?=
 =?utf-8?B?aS9BTjRySzBXcTBDNWZuTWRXN3ZpN3BpZThET2tuWjN3VUhFbngyM0I2YWRN?=
 =?utf-8?B?R0FiVlNiSXdFa01tSVdqYVRIc3dlbDhaSDh6TXBZSEEzczhOZHFtUUQ1SThy?=
 =?utf-8?B?STZmWkxrM2l1NzJ6Zi9ncjhXU2lMR0p0QVIxTWRkSFNKTndsMVlOdDFlVzNZ?=
 =?utf-8?B?T09IYU1heDJzRTlLZTQzVUM3VHpQYlZ5bnJRZk9rY3RTRU5oS3M0ekFYTk9w?=
 =?utf-8?B?M0orOVN6VVJMOWlpdlE5UnVKdVJrNDJ4TVFXWW9IaG9XdkdPMEc1WXRIQkpW?=
 =?utf-8?B?V2VYTWtrNnRKOVpQNFZnZFlyOVI1YVdCeFBLbGpMbE85dTdwbFpIUHpJdzRv?=
 =?utf-8?B?VFl1cFl3anBwTEY0YVduYkE2RXNjYlE1aXZpZjgzSmRwVmNiQitpalg5cjQ0?=
 =?utf-8?B?cmd1Wjg1YUlRVUIvRWF0YUlTR1VFWnliNU5aVjJwVEw4TjltVW5BOXZIYmZh?=
 =?utf-8?B?ODR6bDUreWtPZFlOVGE2ZHZjVS9WVkpsVFlkTmxadG1zNzNhckJjTHIvdHo4?=
 =?utf-8?B?YldrdjBqUnRMUG5LNHQyNzVhdm0xNUlMdDZ4ZW9aa2lGM1U4VkZabll3aSs2?=
 =?utf-8?B?T0M5NUx3Q2dpT21ETm9WN0N4amREK1dzYmRmQVFJR3hUWHUvOFlhQnExYlR3?=
 =?utf-8?B?dTMrWGZPMnVnOUE4NmZrVmpRVDdWenU5N2U0ZDJERjRFZVFMTWVON0t1MUtI?=
 =?utf-8?B?M0Vsb0tPN2kvMStlNloyRmVLMVovaW15YjI3TStiSnBYOUFzdVJPT1pBdEhH?=
 =?utf-8?B?MVRoNU5Ebno2QWZCdU9xT3JlODRVOWlKcFdadFJsTXozWjFnUGZnVmQ2ekpY?=
 =?utf-8?B?cVJ2L094WStPenRSS3lueHMwTVJadFRJWHdvK2RDN3Z4ZWswc2ltNDlPMmF6?=
 =?utf-8?B?dVgzSk0rVHNwZDhuWUQ1eVZVS080TmcwUytZTGNSa3BVNTJyUzFVKytjckUy?=
 =?utf-8?B?OEgrczhxWDJ4MVNGblpKM3daZHRDUWM1b3o0c08wcVhqZlExQ3BsWThMSGtu?=
 =?utf-8?B?U3NkS2daaTFpZ0JuYXoyWEwxNk12V2FxL0d4SlFOaXZTWG5FZmQ4WmZSNUdw?=
 =?utf-8?B?a215NjY0Q3JIell2RTU5b2VpR0VieXVxOXNYREhESSs1NnlLaXM1d3FsY3pU?=
 =?utf-8?B?RkRYVURxL0RnMlFlMDh5ZGdoazZ3MjZoMkoxNndreSt0amUvcDBvU1pJRzUy?=
 =?utf-8?Q?GMkmkcpygUAu7cCbWRZ0/mk5d9YCE3EV4uS5muC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a05394-4bed-47fd-cc84-08d9b348713c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:56:37.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60dfw+WDekBYl5w1pyrLpyTrsBbk5L+zpYT5pQvvDpSDOz72iOjLulhD0+eZcCtkwSw/6yK29mPLmJbW0mC2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5572
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-18 04:19, Pekka Paalanen wrote:
> On Mon, 15 Nov 2021 15:17:52 +0530
> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> 
>> Negative check for:
>>  * plane gamma lut sizes
>>  * plane degamma lut sizes
>>  * plane ctm matrix sizes
>>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>  tests/kms_color.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index e14b37cb6f..d9fe417ba9 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -736,6 +736,118 @@ static void test_pipe_limited_range_ctm(data_t *data,
>>  }
>>  #endif
>>  
>> +static bool invalid_plane_gamma_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	drmModePropertyPtr gamma_mode = NULL;
>> +	uint32_t i;
>> +
>> +	igt_info("Plane invalid gamma test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
>> +
>> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
>> +
>> +	/* Iterate all supported gamma modes. */
>> +	for (i = 0; i < gamma_mode->count_enums; i++) {
>> +		segment_data_t *segment_info = NULL;
>> +		size_t lut_size = 0;
>> +
>> +		/* Ignore 'no gamma' from enum list. */
>> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
>> +			continue;
>> +
>> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
>> +
>> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
>> +				gamma_mode->enums[i].name);
>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
>> +
>> +		igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, gamma_mode->enums[i].name);
>> +		invalid_plane_lut_sizes(display, plane,
>> +					IGT_PLANE_GAMMA_LUT,
>> +					lut_size);
>> +
>> +		clear_segment_data(segment_info);
>> +
>> +		/* One enum is enough. */
>> +		break;
>> +	}
>> +
>> +	drmModeFreeProperty(gamma_mode);
>> +
>> +	return true;
>> +}
>> +
>> +static bool invalid_plane_degamma_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	drmModePropertyPtr degamma_mode = NULL;
>> +	uint32_t i;
>> +
>> +	igt_info("Plane invalid degamma test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
>> +
>> +	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
>> +
>> +	/* Iterate all supported degamma modes. */
>> +	for (i = 0; i < degamma_mode->count_enums; i++) {
>> +		segment_data_t *segment_info = NULL;
>> +		size_t lut_size = 0;
>> +
>> +		/* Ignore 'no degamma' from enum list. */
>> +		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
>> +			continue;
>> +
>> +		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
>> +
>> +		segment_info = get_segment_data(data,
>> +						degamma_mode->enums[i].value,
>> +						degamma_mode->enums[i].name);
>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count * 2;
>> +
>> +		igt_plane_set_prop_enum(plane,
>> +					IGT_PLANE_DEGAMMA_MODE,
>> +					degamma_mode->enums[i].name);
>> +		invalid_plane_lut_sizes(display, plane,
>> +					IGT_PLANE_DEGAMMA_LUT,
>> +					lut_size);
>> +
>> +		clear_segment_data(segment_info);
>> +
>> +		/* One enum is enough. */
>> +		break;
> 
> Why is one enum enough?
> 

I think it's another intellism since Uma's patches only
report one enum.

Since the API is designed to allow for multiple enums the test
should just run on all of them. It'd be a trivial change to the
test.

Harry

> The same question for the other case in this patch.
> 
> 
>> +	}
>> +
>> +	drmModeFreeProperty(degamma_mode);
>> +
>> +	return true;
>> +}
>> +
>> +static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_info("Plane invalid CTM test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
>> +	invalid_plane_lut_sizes(&data->display, plane,
>> +				IGT_PLANE_CTM,
>> +				sizeof(struct drm_color_ctm));
> 
> The code says you're trying shove a LUT into a CTM blob. I understand
> that mechanically this is test you want to do, feed a wrong sized blob,
> and in this case the contents do not matter (unlike with actual LUTs),
> but reading this code is completely misleading and does not make sense.
> It takes a while to think about what you actually want to test here,
> and then reverse-engineer the code to understand that that is what
> actually happens, too. That is too much mental burden for the reader to
> realize that this piece of code actually works.
> 
> 
> Thanks,
> pq
> 
>> +
>> +	return true;
>> +}
>> +
>>  static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
>>  {
>>  	igt_output_t *output;
>> @@ -1411,6 +1523,21 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
>>  					ctm_tests[i].iter);
>>  		}
>>  	}
>> +
>> +	igt_describe("Negative check for invalid plane gamma lut sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-gamma-lut-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_gamma_test);
>> +
>> +	igt_describe("Negative check for invalid plane degamma lut sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-degamma-lut-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_degamma_test);
>> +
>> +	igt_describe("Negative check for invalid plane ctm matrix sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
>>  }
>>  
>>  igt_main
> 

