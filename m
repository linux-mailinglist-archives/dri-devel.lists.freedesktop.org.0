Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D8342087
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54A6EA3D;
	Fri, 19 Mar 2021 15:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466686EA3D;
 Fri, 19 Mar 2021 15:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC12EdWLfO0tWFqroa5HfccNbnISvMUMRXfYA17vRqii57x3nHn8U6hb17TyofoRb4kO774YqC50cJ7q+AlSGRVwK9LCM2FJNbxW1FPa2uF3n0xdGXVW0xb5K7+18hMqiqNNjNy9jJl4aDpXkQgG82gpVPWbi6HqAEDUHLM9Pn1CfxDy0jdpzib630Jv1LBAoHB+e2WeZSYMfTjanJPNQCTCxK6KZqK69iv+bhpRhsHWwXW405ZLcPDcPqHYdpsdcLa0Sm+MDNPEh6lUfRWe3yG/oZi7D3jM3Egctuv491hLKCvL+qT6NfaQD15J9O7uLVyQ2HpQhUYj7cDJlFcAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxZoTS8ucEz+k8MYLFafz2eWzWycmkVvN25QVVgiV+U=;
 b=g8hBncikt4tB2ywGEwTjOy36SoNHJ50SdvuzalUqHACyXhzRgYsrG1RLckdNSNSkJwluuJMBHbWiMJJwXG7MfZjyHD66czcMaaz+ocwVXt15R5RSDciJ4raWk+cfaTrH8uTqLsXcL+a4UUToMT3FTRDiSAtqji6TBRT/oh+te5yfGGjNun8smAJd4fAV3H5nX1NIx4q5yoW1VZqQ+eYaBzRWUMmA4JeKVJyPXfkwPSiQlksEDWxS6E6n1MC/sTq4AVrVrlJ7MQCD28+lR/LHTabSLzitF7UJX6UiCGy/4znY+K2WgLspRJiE2Xof/sZIaZvBhb5lDygeXpix+KEs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxZoTS8ucEz+k8MYLFafz2eWzWycmkVvN25QVVgiV+U=;
 b=QymuUyKJKzKMjYbV+95vwr8bxooCEv1qy1bayANoW+DdC9D6wL4WKUqzwhlhSLh/sBpL7OOOxYTV99gCJWP2Cs4VppHnUWboyVyfp65qz/klTJT0TbMNGA/IRNuVZE5ujEXJNI6nJnydCrNVopg8leqYPImkcw6ybZDCDCttpIY=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 15:07:37 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 15:07:37 +0000
Subject: Re: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
To: Alex Deucher <alexdeucher@gmail.com>, Evan Benn <evanbenn@chromium.org>
References: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
 <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <54fc883a-c149-3f43-fb79-3cbff13e7b6a@amd.com>
Date: Fri, 19 Mar 2021 11:07:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::7) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Fri, 19 Mar 2021 15:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 360a7870-941e-461c-09fb-08d8eae8bb80
X-MS-TrafficTypeDiagnostic: MW3PR12MB4523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB45235800FCA7DE61B0470F688C689@MW3PR12MB4523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQX2vDAof3cRzdDIfwLWB8amTlzBcpwGGGeE+eO5hzxfBuBRxiMdEN3Dkx+bxOhLhqu2Eis1irFgOsy0NfSrFeVqENakXgvi9gupmXDTTHcxZ5WORKKzFoQlozStqI/py2QzCaIL/Y01Uw7wlTmgayFBbEXMTUZ6515rJmtxUzltgqkVRw74GnSr3Va8gwGBPzFmwGccENxstMUij4FGqA2vL+6DtyJrOgTwBpbymMTPwwNPFQ07dozVBr9Rr8XqHqVX9xP6T29Ou4a3zM3T9lumGRz/anZPEEQVDnoLjgikIU+1huI6Y1mIvC4mTb4tx79sOdniyzkzrfj8JQ03LwN7dbcT5GQgoRVLduw6NiX5bQLk+GBxrYnzE8153/IUM8ssKqjeT4Bl64x4xdul8wBxdeViVawlJARTdpwT0IJnkeFJYAzHRPkrRz4vg2whFg3Ex/HOmxmCvJyqCj5Eb9PPzkzm09S2JNwdFKnOrv5qAphYGmsOMIQGCcM4j1YC5JkKt+ji1KBMsCFMUyh2wDuLB59J7MNM5GqzvnfNzrVqP63RvxxJS3gzIZLNIp+UPaSbLeFkx1JQLJv9VTX9XDYBIKlbOu1ahz3MlAjWx9BoZFb9F+nPG79A92oSXdtiLq/L2QmLAszKd1YlyEi4eHB76WAghEPQ+1zcl7NbnGJXDwv9tAX2YKa4Fey52cnbtl5sCq1UFwH4baQp/zSQ/Jpau45t/KwRE5AO8LeLuBG2UxEyTkPI3E9ZsebG2MadKeWFh6U+shx6AMKsBH1WPUaQJ5oMRNZJIJy7eFIiX2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(16576012)(478600001)(316002)(66556008)(54906003)(2906002)(83380400001)(66476007)(38100700001)(31696002)(31686004)(8676002)(53546011)(110136005)(66946007)(966005)(26005)(8936002)(5660300002)(4326008)(6486002)(956004)(2616005)(44832011)(36756003)(86362001)(186003)(16526019)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1RTVXRMdmViOXZDRkxEQ2ZXRFhIZ1E0ZHM3R0NmRlkyV3gyREdoWEdCZytE?=
 =?utf-8?B?WkhRUkRSZGZOTVFpR3lMR0tOcHF1QkVGdlk2dFJJckFBR1UzZG1YN0g1SVRu?=
 =?utf-8?B?TmF3WE9mVThnMG9ITXc1ampZZmRiQnZJaUlqR2NDUE9PZU9pU3NIK0ZQQ21q?=
 =?utf-8?B?R3RqOHFadUtacDZBNk91Mmt0UmRZckg2TDYrL3VZeEZNSEtHRUVIWkU4aFh1?=
 =?utf-8?B?bzdtTnBpa1M3NFFGNTVvV1ZFenYrTnF3enI2cmttb3BuZ1QyK1pYTXRqUjFx?=
 =?utf-8?B?SWVuUmwwaW1aZXAzTHNYdnFseDFkWWFUZVZaZVgvcTFSeFNYQ1RYOXRoVEds?=
 =?utf-8?B?L1VqcFY5OE05cXVKaWhwaWhlYzF3TTJNQkh0YlJiVmpHMDhhK1NXeEtHYWdu?=
 =?utf-8?B?M0hLTFM5MkpDSnJ2clMzUlRaaHcwUUtSK1dxMWpkemFLVDI5azcxT3ROTHJp?=
 =?utf-8?B?ekQ5YWZIRklWYUZxZ1pQdTdvMDloTkNzR0NjRGRJV3hCbkFGemFQTzJuVjJO?=
 =?utf-8?B?ZSsvdTBRaThQUmVCRjhCU0VTdVdzMHUxWTdxYjRaT0VUU0E5cElYUFhxQWUv?=
 =?utf-8?B?cy9kbTI0WW41OTU2Mkl1ejBDenRQbXVxczBNcDJUaDQ3eFRpWmhzdG8vYmtq?=
 =?utf-8?B?RC9VUDA2aFp1T01pTnZaRlJoYWJZM0VSdDBpdW5QdmF2QnErSlRKRWF2MUtT?=
 =?utf-8?B?WkVMKzdRZi9IdWhra1ppay9DdWNJdzBLbE51UTF5c1NTMkdVeEVEbndFVlov?=
 =?utf-8?B?TkYwVmZSS3N4UXFvbFVzUUF3aFRiVEZ5Lzk5UnhWZE8xN1F5QUhDMlNua2l2?=
 =?utf-8?B?TzdsYWV1QVIxeHN1SkpLQ0gycWpYQ0lraG9LdHFaSjJzVXpwS0ZIUUtSU0Jv?=
 =?utf-8?B?dE8zM3J4MmJ4Um5VbFhqRmhBVFFUOWFPOGNtM3dzRXVKV2lJSi9NeUxkdmZm?=
 =?utf-8?B?YUxiOGEzWlNMajhoVnhUeFp3dUV4bHFVM2tJWHNPWVUxeUpyN3phVTcrM0xZ?=
 =?utf-8?B?RmpzMy9IUzRWZmtoWi9lNk5vNTdsMXhKWW5oNVJzL0RoNFlJelBCUjVjRUhx?=
 =?utf-8?B?UDRESWxwTU4xcGNEbWwyS2RrVkprSm9vSy9obGVOclkrMm1NbGtpZXVBbHJZ?=
 =?utf-8?B?cDhoL2dyaXVrTzNmNGJmUjJnRjlnVEhEdHE0SEdiSUxmczFYUkFDZ1o4c1Zy?=
 =?utf-8?B?aVFtbDNRbVJCSWVwZlQwM3lEYmtUZnYvNnJCQlZaRVM1OGt6RklKbFNQenRa?=
 =?utf-8?B?Y2pkQ1JwRGQ2RGNmMU81RkF0dUFGSzNMbDZLSkpxWGpKQm5xRDhMcmxuY1hk?=
 =?utf-8?B?U042THp2WU9ZN2p4ZytXYmNseTZ1MWdVKzYyVXRwRHVmTThqdkhybEs1M1BD?=
 =?utf-8?B?Q2xraDlNSXltWkJYbjRQbktHQWhTSmE2QjJoczhlSHlIbHRUM1h6RjZ3RzZX?=
 =?utf-8?B?WkZ5REJ0eW13bTdVeGxjZzJhSkVmSVB0T2Rldnl1d0dubEdNQlEySjRXZ2Js?=
 =?utf-8?B?Z2ZlRmY3a21KUC96VDM3WjUxWkpCRW5RZlFHZ2dlUk04UWFuK2NQZHpaM1Vv?=
 =?utf-8?B?T0lMVXFEZE1TV3NXSHVuUmpBdmY3RmhLNndFcnpJdUtHRmRBQVBaUmNrTFpu?=
 =?utf-8?B?MTFBdFMxa29uZE5PR2xKYXA0UmRHbWE1YkJpVXV1QnRKWUpFN3g5Zm81VHVl?=
 =?utf-8?B?eHUxejJWQVFJUHdMWDloL1dYNGtlQ1lxdTRCWkJta1hlUUxrZjQzeTNCZVIw?=
 =?utf-8?Q?fwkhvB/bbXkLB46+MZ7H1zsBRoAzNZdrRnDegQF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360a7870-941e-461c-09fb-08d8eae8bb80
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 15:07:37.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIkXROogONITs5UMtD1Xi8r86ESKRi/AfVufIRgl/emauLk6SRQw8UXBBU/KdhdLqjBt/iPaWfbX2GaLkKeIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Anand <amistry@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-03-19 10:22 a.m., Alex Deucher wrote:
> On Fri, Mar 19, 2021 at 3:23 AM Evan Benn <evanbenn@chromium.org> wrote:
>>
>> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
>> to ensure no display backlight will flicker at low user brightness
>> settings. However this value is quite bright, so for devices that do not
>> implement the ACPI ATIF
>> ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
>> functionality the user cannot set the brightness to a low level even if
>> the display would support such a low PWM.
>>
>> This ATIF feature is not implemented on for example AMD grunt chromebooks.
>>
>> Signed-off-by: Evan Benn <evanbenn@chromium.org>
>>
>> ---
>> I could not find a justification for the reason for the value. It has
>> caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439>>>
>> Maybe this can be either user controlled or userspace configured, but
>> preventing users from turning their backlight dim seems wrong.
> 
> My understanding is that some panels flicker if you set the min to a
> value too low.  This was a safe minimum if the platform didn't specify
> it's own safe minimum.  I think we'd just be trading one bug for
> another (flickering vs not dim enough).  Maybe a whitelist or
> blacklist would be a better solution?
> 

Yeah, this is a NACK from me as-is for the reasons Alex described.

I agree a whitelist approach might be best.

Is this fix perhaps for OLED panels? If so we could use a different 
min-value for OLED panels that don't do PWM, but use 12 for everything else.

Harry

> Alex
> 
> 
>>
>> Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377>>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 573cf17262da..0129bd69b94e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>>          return 0;
>>   }
>>
>> -#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
>> +#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
>>   #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
>>   #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
>>
>> --
>> 2.31.0.291.g576ba9dcdaf-goog
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel>> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel>> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
