Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474464B9F8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334E910E339;
	Tue, 13 Dec 2022 16:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA1610E337;
 Tue, 13 Dec 2022 16:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Teb9jTm6ulaDDh4AU8Y2dFYz8snVhuH7VDfbUZuKAOiIrjHhGkOyo4PHYoYhsE+fBmNqWrKZeiEHEPKtNjHkYZc8nc0qds6tOcs/pkHfdRgYN+x+nCKlVxT4gY72Ja9RIrI2X1baQF1TGqWAcchoTjTBUNKEGwUYVNhzlPMkPHyDBRmFg6y2m20ShoEsiTDgduiWvz9Pwmxh4zghhxafwyH1FqlxzXUJcLFxdMgyd9A6lWiQYWUTgRh5TYWJUoxSe9IdXYoBC2uqmRYmw1VbmJpeiBAvUiFxiuA6ficD7uy6u0dstLUV6DR08ANZvp27djz2fHfDEex29z4lUSsMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys7vgt693m0FQfQJvMvpi65NbmnFD+SuUDQApPbdSv8=;
 b=hEPPemU2rsc8bavqIPfCjGUf3ibfcI4+mIr458Q/4+npasHEAg1egwYIVq7G+pQYQde8HByeb5WQmcOM6mlNsy/rtPMR8TfR8vi6SqIk4jIsbK14sCm6nZWNKKWBfLBl0o8j/1bHZERnO+X4k+e6u0hRTfXylZaGFFbHMPgl1TNLMY/Q3jsstEM1j+zg6HX7EZaUQCPJVuZ6nUgSt/LeKmxWwFspRKeP4es7bgEIqI37I1zAzFXG0l+8hewRp+a5QLqy/PzL4LxfwA7k/2iedRKslLOPJblMJwo/ke4ylihfq4aGQ5wojuZiNI9GBmstSFwVwhrkdNmLcLALdyylsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys7vgt693m0FQfQJvMvpi65NbmnFD+SuUDQApPbdSv8=;
 b=hfWv1zRsFFAsigKRhmNrIp7wW8r/9/0eUDG1pl7pJ0GRzpBUIckJ5r6alQXBZPTytKELuzqEnS7YqFFqHGYpO0AIXZkm0nd6uysgJNWf07HifywRegutK1zcWAozPyW87ETK5/b/fsChdUz6KZJKVxSCJ6Jj4mL8dt4WeOfC/V4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:41:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:41:11 +0000
Message-ID: <8613220b-7199-1ce3-9310-2403db069cb2@amd.com>
Date: Tue, 13 Dec 2022 11:41:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 04/16] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-5-harry.wentland@amd.com>
 <20221213123932.67edc8dc@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221213123932.67edc8dc@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 11242cc2-b50e-4b30-16fa-08dadd28d7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Gy1gTW5exLf9i73tMpB0FCUbrjYr8HcgzDgYNoRgR3Oi6hC+p8VWn34Fd8YXV+bmI1mnZ8/cOj2avIjpR3VAHUZqDHFUIhyK3EbnjznyxvtZmOEXKvU9RbNywzH2CPnhaX/Gfw7TkooMUqd1DC9jNnHhveSTlRA5oefE7QlPM3NYvbUH1VbUVdJVJicYTbn0NzB/NuJ9we2ezN9G1Z2nL7WDtV/kH2Bu73j66NruUGT851q2ryf/gebWcZQ7at8+aTMixgxnl3FCo4LtpsU50bMpqNiGj++kvNBjfj9Ceol4evAqI+j9teHZEvN8xJpe+1dmLoTAddopgFR5Rx2O8DSCX7gn4upYxA9favbXikcxe5BJAJX9yoCpoGlbibfCjNhKuwyXR4+P5j9PeFrii0zuErFdPhPg7oDtJGLC2w/yxYgSi6UT7iBWzVmqYwXNl8noTp453ZBDZjdo/cABzlp1Pp8cF+rIidR+eXqgarWhFUUbW6qWJUS7i/znRtebkrvUPNQVNZQ6cZ5D5qL56pOmZyjMq5zr2xJ3EYA1fk/SCEmMm/riWfhSPavcCaZTvj+VM5MzjZe8WEMIOx4tfHxVO2x9znP98NNO/3BLmidoKcXkXxIaBuRnCzGHuQKMZAxht+XLaOlNPv+Cb9zsexo6BSd7Ga6Al/QdrIz0Ir8udFzcuxMnPwuLmOf5NCso+C0HFk3Q6FGl9ZQNaIrE6Qxj2TWez6t60e6jNG3aQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38100700002)(86362001)(8936002)(478600001)(31696002)(6486002)(6666004)(66476007)(66946007)(66556008)(6916009)(4326008)(54906003)(316002)(186003)(83380400001)(6506007)(26005)(66574015)(6512007)(8676002)(2906002)(2616005)(5660300002)(31686004)(41300700001)(53546011)(66899015)(44832011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5oZEF6azBXaVYzQUhrTEppcjZ5UHRRVGM4ZWNLRk13WnJDUkdMUTlhem04?=
 =?utf-8?B?TEYreDlTSXljUWh4ZUtZeUxrVCtWaVBRWHZ3V0RObGc3MzhZbkREeklMa1Jz?=
 =?utf-8?B?Nkk2RGdNRFFXZGE4YkZKckZnLzY5ZG1LY1dmalNaK0RSM2x5QWRpaWlIVG1Z?=
 =?utf-8?B?bzZmbndRQ05GSThKS3ZvMDZTUEZQV01QaTdYZ2lzUjBCM1hsQUtPd0lOV2FJ?=
 =?utf-8?B?K0FwVU5IWERSekx5WDBCcXJDT0lNY1htR2FPN0M4NGxxSnJCRFo5QnJJbUxO?=
 =?utf-8?B?RzVvclFmaHZUVU5GZk1Jb3hRakFvYkVtR0NBdkxKUVdpaDUzZGtWZ2pvWFRh?=
 =?utf-8?B?WTlGclV5VCtNV0RVakZIZ3MrNVpFRlo3d2srVTVyTWpVR2NjMjFiQVJ3MUdy?=
 =?utf-8?B?MFV2bGNzRTJ6T2xFdkx1RzZiZ05Ta3FXM01jeVRUNlBiTTJ5amtYR3hYNUFI?=
 =?utf-8?B?RnRZNVJBL1gyaEU4Z0s1NVdUczlKVzlGV3I0NFprazlEaFFXK3hCR1lYVHdH?=
 =?utf-8?B?WFY3WGlSQ1RxYnMwcDBPckN2SGYycFhWdFBCVkFORkd6K0o5bUN4aVZzcU1B?=
 =?utf-8?B?TFhCUnBlWW91N05KTmVDUWJpWDRRMEZ2MjZIY2tPWmhaZnFsa0lReUpaOXE2?=
 =?utf-8?B?MmRYWXhra2p1V3RJMjhoVE9JQUJZOVZKWTJiZFkxRVZXaTlXRnBuRVFDTlNh?=
 =?utf-8?B?Mysxc2xsbm50VGZGZFp1YWk5Q2VsMjdRTWd1L2gzNitEamtQTXJudENDRnpl?=
 =?utf-8?B?cml1UElrd1ZCdVhoYUI0SE9TMGgzeHVjZmdMdzdRcGJiUUUwUUFnbXNXaVVQ?=
 =?utf-8?B?aEZLMmtsczQ4UDV4NW42a1lZOG9VMTBDdW01bEEwUWZSSElTeEJtVFZhS0ZO?=
 =?utf-8?B?Sml4Qi9INDdSZ1lWNWZNY2ZCZXppck4zdjZqRWF6SGk0MlZNUnF6elBWem1w?=
 =?utf-8?B?SnZqV05mTVAwOC8xdmZFcE5wRFJvcFA2ZEswVFE3M2ZvSllGVnpQYSt5R3FQ?=
 =?utf-8?B?R00vTzVYRmlFWllkVVF4Sk9EZUNsVlk5MkgvM0FkVHpVQWl3bGlwem1iRHJI?=
 =?utf-8?B?MTNvSkRvVVhFVkpsaWtGa3RkcHZ2ZzZPWTR3d3dwK093ZjN0WXA4aGxxNkM5?=
 =?utf-8?B?eWVrWERNYlBGejFaZUpPZ0VRMC9CNllVa0YyNlVlOG9DQlhWMlJzUnZlVlMy?=
 =?utf-8?B?YldGbCtYMjcxNDdWRUEwYTg5c0pDZXoxZ1dNNlJuSTZieDJwSkxxU1BZTTNF?=
 =?utf-8?B?V1RyTUgvZGxMV3I5d09kei9rS2JjMklwNng3RHhRU0wxNVVONzk0MDVXYlNy?=
 =?utf-8?B?ZkpPbnh4eVdPVjh1ekpRSjM3OWk0WnB3S3VCbks2eUNwRms2YUJCSXAycUhR?=
 =?utf-8?B?YlpjaHZYNjdZVk1KNXhXbVliWHJiK0llVkZLTnYrY3A2UVZPZXNCNS9RUnN2?=
 =?utf-8?B?ait1cFZFL3hjNkNVcm1CTk9zdjMwY2RRcmR6QmJaaGZHYmVOQzRza2RhaS85?=
 =?utf-8?B?TVZENFdENjVuWTFXd0ZYTVlkTXErbXhLb2dqcm1jTDJVVjV2bzB3emg5QjJQ?=
 =?utf-8?B?VC9kaURXendqcmZweUFmVXZOcUxlODNRa2UwR2g2ZDRzdGw3UElvQXZzTWlO?=
 =?utf-8?B?bXZZZXUzZU9MWWtKcmxiZThXcWsyWFFISFJsUlFlclFhYi9tTGUySzZmekhY?=
 =?utf-8?B?cHNkeTgrRG9SVGdQWnExZkhCYnZLTmZnVmkrUDE1blp1Tk5Hd0dCd213VXlO?=
 =?utf-8?B?TEE4NmxJazg2WEZqR1JjMmF4M2s0WUhHRmZZU3kxSVZscXV4aEpMb3Z6MnZE?=
 =?utf-8?B?UUt6VGJPSE1iT2JqL1FXdC9DWHdpb25mNjh1dkhCTG5JcmtoajJPaURsblg4?=
 =?utf-8?B?bkZoYUFWSnlDUjJCMTFXanlTcHd6ZkRFUll1RkdQOEJlVWNnODl4ZzM0VHdR?=
 =?utf-8?B?RndRVjYwZVl3c3QvNFl0cjh2K1ZJM1ZJZDUzS2JNYktBTVlxSnJRbXRpQkVh?=
 =?utf-8?B?S3p4elRHc0tOYk9pKy9UY3lnL0E4YTFLZWUrYm5CZ1o3dGJZRFRyUjhtVGE3?=
 =?utf-8?B?V1RUSnRiVnJxS2hBSCtVYjllZHNrSWtOOUJyYVgwNzNCVnk4R0h6NmdKRGhv?=
 =?utf-8?Q?pbVNyJfBa+8sQ8ckg3pOHFg/9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11242cc2-b50e-4b30-16fa-08dadd28d7d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:41:11.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSo2A7R7QBdQP4ZLjw8YnyOdCI15/tI8cB4XjEELO428B0Su3+0lZeQJvhMIlnn+XZaaxWDNFA0Fo7H9M5rIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443
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



On 12/13/22 05:39, Pekka Paalanen wrote:
> On Mon, 12 Dec 2022 13:21:25 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> This allows us to use strongly typed arguments.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>  include/drm/display/drm_dp.h |  2 +-
>>  include/drm/drm_connector.h  | 47 ++++++++++++++++++------------------
>>  2 files changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
>> index 4d0abe4c7ea9..b98697459f9c 100644
>> --- a/include/drm/display/drm_dp.h
>> +++ b/include/drm/display/drm_dp.h
>> @@ -1615,7 +1615,7 @@ enum dp_pixelformat {
>>   *
>>   * This enum is used to indicate DP VSC SDP Colorimetry formats.
>>   * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
>> - * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
>> + * DB18] and a name of enum member follows &enum drm_colorimetry definition.
>>   *
>>   * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
>>   *                          ITU-R BT.601 colorimetry format
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 62c814241828..edef65388c29 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -371,28 +371,29 @@ enum drm_privacy_screen_status {
>>   * a colorspace property which will be created and exposed to
>>   * userspace.
>>   */
>> -
>> -/* For Default case, driver will set the colorspace */
>> -#define DRM_MODE_COLORIMETRY_DEFAULT			0
>> -/* CEA 861 Normal Colorimetry options */
>> -#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
>> -#define DRM_MODE_COLORIMETRY_BT709_YCC			2
>> -/* CEA 861 Extended Colorimetry Options */
>> -#define DRM_MODE_COLORIMETRY_XVYCC_601			3
>> -#define DRM_MODE_COLORIMETRY_XVYCC_709			4
>> -#define DRM_MODE_COLORIMETRY_SYCC_601			5
>> -#define DRM_MODE_COLORIMETRY_OPYCC_601			6
>> -#define DRM_MODE_COLORIMETRY_OPRGB			7
>> -#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
>> -#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
>> -#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
>> -/* Additional Colorimetry extension added as part of CTA 861.G */
>> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
>> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
>> -/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
>> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
>> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
>> -#define DRM_MODE_COLORIMETRY_BT601_YCC			15
>> +enum drm_colorspace {
>> +	/* For Default case, driver will set the colorspace */
>> +	DRM_MODE_COLORIMETRY_DEFAULT,
>> +	/* CEA 861 Normal Colorimetry options */
>> +	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
>> +	DRM_MODE_COLORIMETRY_BT709_YCC,
>> +	/* CEA 861 Extended Colorimetry Options */
>> +	DRM_MODE_COLORIMETRY_XVYCC_601,
>> +	DRM_MODE_COLORIMETRY_XVYCC_709,
>> +	DRM_MODE_COLORIMETRY_SYCC_601,
>> +	DRM_MODE_COLORIMETRY_OPYCC_601,
>> +	DRM_MODE_COLORIMETRY_OPRGB,
>> +	DRM_MODE_COLORIMETRY_BT2020_CYCC,
>> +	DRM_MODE_COLORIMETRY_BT2020_RGB,
>> +	DRM_MODE_COLORIMETRY_BT2020_YCC,
>> +	/* Additional Colorimetry extension added as part of CTA 861.G */
>> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
>> +	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
>> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
>> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
>> +	DRM_MODE_COLORIMETRY_BT601_YCC,
>> +};
> 
> Hi,
> 
> what's the entry for "the traditional sRGB"?
> 
> It cannot be DRM_MODE_COLORIMETRY_DEFAULT, because the doc here says
> that it maps to some driver-defined entry which may be something else.
> 

If I understand this list correctly the only entry that currently covers
sRGB is DEFAULT.

Harry

> 
> Thanks,
> pq
> 
>>  
>>  /**
>>   * enum drm_bus_flags - bus_flags info for &drm_display_info
>> @@ -825,7 +826,7 @@ struct drm_connector_state {
>>  	 * colorspace change on Sink. This is most commonly used to switch
>>  	 * to wider color gamuts like BT2020.
>>  	 */
>> -	u32 colorspace;
>> +	enum drm_colorspace colorspace;
>>  
>>  	/**
>>  	 * @writeback_job: Writeback job for writeback connectors
> 

