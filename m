Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD8B610B2A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 09:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DCD10E791;
	Fri, 28 Oct 2022 07:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F7A10E78C;
 Fri, 28 Oct 2022 07:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPqFcMA5tcTJ0qJysyf5cbtGiVm6QDRafH7lIoJy+3vVfehguzTn7WX0VpWucQUYtTymrbivbkZnNdmVcjBy5sfDJuXjQ552GPyGJX4GNurDK6Xu+Yj0rpOxw4Qe9wLzYaYXYjxZttdJQ2J4fOT3nDi0mjPziETIQubySZtxjaT0rSz5+//K0fGtUEEtPosrhWWrtLqhvW/UKucqxqdIgzf9JhmAXYqq2sqgicgP1Qc4lNUUzv85QEiedFe2tXeFkdKa0QdQRvhNKR0lEVNyJDItBiSPmraz62WPucPtyVLBhAjFhRtx6RtZ8Bjlxv2k6su23UdTnj2ypLPZp73nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egPQCbKLzjcN7A8hd614nK/u0IGzk6xONpQyuPOJFrM=;
 b=JrK8WoGYJETjgJWvEKfpS86kV7lXT/HyidMjAYyK5B0PJwalch1dVPniPqLvm3Um0OyTZj8iDOInpFbrtAGdDH6llDWfQGf85ELxiC/Mkw4aEbxqk5xi+eGoUea+Ipz5ZSUmw/rDAKEHmmpbAyZwKxKPb+IrkxF8Ani15j3mqC/58mSp50EzMDJWokIIjmqtyhmYUUjlDJPEq18O63KGhXNqsDa1f0l5ZfP9r4Qq/m/DO25O/2iLT20F+ZR0y7EfKz93SYKb7M24E3FoLG2GP+0luPIsGxMDN3BcSxZpoDlE20jr+WA/UPfHKQDU8ISJ0YRWRz0x97/Rzy7KYN8BLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egPQCbKLzjcN7A8hd614nK/u0IGzk6xONpQyuPOJFrM=;
 b=Lh9o2Ms/K7YO8CEXw7qO4q9ynqKtrdzgS3LjM8sBM3tYsu+a81OSCBSjKzM12664HrQwLtyjDDP84kh41ylmDDF7ZEMNjvsLzQZcldYp/SVhHTaX0crCqfzmfkDlx9mcEr4XLwTGDo+8l3m5jXoM9iGfrP8Ryz1LVWN+sm6S12E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 07:18:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Fri, 28 Oct 2022
 07:18:44 +0000
Message-ID: <04e37ee1-53b0-97ab-d6d7-a39edfbdc2ea@amd.com>
Date: Fri, 28 Oct 2022 09:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] [next] drm/amdgpu: Replace one-element array with
 flexible-array member
Content-Language: en-US
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, Claudio Suarez <cssk@net-c.es>,
 Slark Xiao <slark_xiao@163.com>, Rongguang Wei <weirongguang@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <Y1tkWdwPUp+UdpM0@mail.google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y1tkWdwPUp+UdpM0@mail.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b92184-8cc0-437f-a39b-08dab8b4a5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/sMUdHnDrQu5EQkDryr7PxuWsJlZDdXA961aGtpi7sK2kZy3GIRInTz2gt0RQeYymUAhzqLqLGyqdPbFqbWgy24xX4FLLeGj/LC6yeXxGYjtNHCHb6sX3WYoDxncj76Uw5En1Y7wo0Qe2Q4ULqkhJplZDwTzokx/aFI6f0xaV/TdZj4lQYTPfcRtG0ljMdx5nlrTN9jfbt8SwzyH/b3/Xa6I2KfRkrJi8sYqa1ZukC4lf0P05ok9t+wQtcPX63K89lK8ORKI7kKi22js8rDJEr9qDub6+ZeBdpA7MpCqbBHqMSZZ9zOXHDimIedWI5o+BmpUYfr/jGvwGipbgndrbHb/kCt+FXOuL4RKXrrCgQm6emsHLq5s4NJtIRaZShELns8uZb3gZ8kiU8zPUQ9MsKspdLdFSQ9IRlDiP/R5VF4zXBUyjbfznBCze6hQmLNQLClD+JJv/KslV/BY6XTBJ3RmpuetXuBFhYiebMA78VR2O3SCsV4HQM1a8Zk6yW2peNrapkhuicpSREnKa89cgz2cJx/iJYRomn6U9mVzwLsDupq8pdD0ycTLsuXCVY5BsSksKwFGwdZ+LUWnA7NFVzDf3SaIf2uJvrof6eL843wXYnAm5VxoEL4T0mpGiSp8evrmxat96oXyPr5GwghJ0w4nE1n/OJklYo5zKvNxAhtCfe63k5y8bTsmjjwSuQHyumbhSOgWWKxRu7k/AS32U8z3s8XSiuVcnUQ4bgDJUW7UVxXYTMgXTx/oIP4KthdnoOAulCrAL3g9xX9gQbJdk7buzki/O4c1H2cHxJ00pC9kfY8CvP2hD5tNZPKlpi5IkhldVB91dLLRpGTwxnmiKoQPThOa28T8g5Q1ePJ0YY/jcErocUodxxy38Mrs8S4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(2906002)(6506007)(66556008)(316002)(110136005)(4326008)(6512007)(38100700002)(41300700001)(66946007)(36756003)(921005)(966005)(8676002)(6486002)(8936002)(66476007)(6666004)(2616005)(83380400001)(86362001)(7416002)(186003)(31686004)(5660300002)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVEaENrRkJIMXdxZGYxUVRpRVBnY2h0TUZCT0lmREdvZHNlaE9NaWhKSWNw?=
 =?utf-8?B?dG10dGdpQXZ2VVJsazlkUkxjVDZleEtWMVNtdkIycnE2dXczNktyZ0ZTNENs?=
 =?utf-8?B?OExOeEtYYXl4Y25zS2JsTTdKbW9tMXI2UUxIQUtGa1U5QWQ3VktVNGFhS2lG?=
 =?utf-8?B?VW90ZSt5WlJLVmFGTytyQUJXQ09mQWh3ZytadGZ4SEx3RmtWaHZKd0pTZmJE?=
 =?utf-8?B?UmhNZHNjNDJYcExYUXpKempNK3dXSVhVdEx4VjBGaFRmNEdESGcvUk14eFpv?=
 =?utf-8?B?YU5jenRpYmtPeXZ5NUtXT01ja3J0ZFJKYUo4c0RyRVBnd0tkMENRODB2Q2g4?=
 =?utf-8?B?WUhrc2ZOSzFlTTVNb3QwWVcyMEM1UXJPRmNWaVJtWFJIYUl1N0EyVDU3Yzhu?=
 =?utf-8?B?SFpHSnliUkpsVkNxcHNWWFdNK0VOa1pLYlVjSHU2NzdCd1RjUTF4NkprUENr?=
 =?utf-8?B?THY3d0wxNTJyY1BZQnF3ZmsyUktFa3c0TVYvcG1ybkg5cTVjQ3NKMXVBb3lx?=
 =?utf-8?B?by8wSysxVWpYM0dHN2FQOUJsZ1dBelRmS2xXdFBOcnBxQUx5Ujc2aFJ6TVdr?=
 =?utf-8?B?dXMrRk9mbVM0ajJzTXQ4MXVsakNTLzV0cUtlNVlpc3QvTkhkOElSZWNocldt?=
 =?utf-8?B?NkZuazVlVGNWTDI1TTQ1NGFqVk4vTGFhemQvZGJ3Y3l6ZEhGenFYdkFJRGhN?=
 =?utf-8?B?dE1VYkRlWXRNZzlpVklQL2FRR0ZkNUc3Mm1HUjlpOG8zSGtsRUM1ejlRc21U?=
 =?utf-8?B?WTdNaU9FQkNkcHJUbVpCZjdyWGNLbHlCa3JmL2FPanpaVGZTbmtMZTl1UFdZ?=
 =?utf-8?B?T24ycE5nc3g5UjRwcEs3TklFU1FIRjN3andEb3pLZm9jZzVMblFqL0Y0WUI4?=
 =?utf-8?B?QXNvbnRPVVNoRE93RFErRldGSmVVdlpLYmxnVXNuOGVBTmxuZXA2ZHY0bjcr?=
 =?utf-8?B?bW5OaHhYajdibjNuZWRZOXY0TUFkcGxZUmhHMTVYUHhwUDAzc1ByeDNQOHdm?=
 =?utf-8?B?Vyt1Vkk5SWp0NTJHak1TSFZRN2pJZHMrOHkxSVhIZ1VGdU9PdEpueVdxZHRr?=
 =?utf-8?B?ODZXeXZMWk5ZbHA4WVhoMkE3NndNSG11djAwMFZjL1ZWZkx2WDl4SFV0ZHE4?=
 =?utf-8?B?b1ViY3IvQWt1eE5IcFk2UnRWTzZkajl0c2RGa0l2TkRIYUxCUWJCckR6WGVv?=
 =?utf-8?B?enMzMnZpQWloM1JYQkcwOWFPMGhLRUNpTmNLS3psbnoxdjlidW5vL29BM0VG?=
 =?utf-8?B?WEYydTFJbW9OSVY2ZUdlN2JXbE81T3RiNlZIcjVkdnhRenlXNDUzMHhyanpx?=
 =?utf-8?B?T2ZqVytJSFFScm0xUVNQTVFYK2hKb1pTYXRVWE9acmN1M1dFd1RkaTJLKzVF?=
 =?utf-8?B?S2wvUHJPNDdQV3VNc1pnak9DT1ZaR1c5U3djUHpvQ2tyTG00VGdkK3JJTG5v?=
 =?utf-8?B?dFJyQS9kUldjOHNoUGg1cFd5THhnc3pzZG84N1ZRakFjNE81T3lPRnUyZUdP?=
 =?utf-8?B?R1gxZEJ2VGllVHVrc3VxaEhXZXFKTFUxdUgrT3RNUFFWaTBTc1RTMUtkSlhl?=
 =?utf-8?B?RTZnWGMzK2VuVTliSGFnRmFibTBRQy9lMlZhUHNYY2ZxcXhLWnRGc1N2dWxw?=
 =?utf-8?B?YzJxN05kVXlJVHZ4MndJbHZYekxReWFIZEUxM1Z5UlBFTXF3Q290Y1FTWmd2?=
 =?utf-8?B?Uy9PZ2tVcGN3cHErZ1hMeW9LdURjdzhGd2wxbkZGWlJlWDdGcGlka0d0cFli?=
 =?utf-8?B?blh1eEhURjhXbDArUnY2a1hkU0ZSTnJPR3lVdTVVQzlaSFVEbDZ6L3cxczhL?=
 =?utf-8?B?cW9VbDh2QjNlWDlsN2JyaTY5UzJ4OTgzYjVhdDVZVlJPMmFwWFBURU9OSzgw?=
 =?utf-8?B?NTNQQ3VVbzFzQkUvT3JTc0FkT2xLdVZTajZVcDE0OUxBTGxBL2ZoYjNSMVda?=
 =?utf-8?B?VXhPdnJIampINUFvN05QZElWVTRKUDR0M25NdSs0SjVtcllvVTFVbDVqREF1?=
 =?utf-8?B?SkRjQkU1UXF0eVRuMHgzMzlqeGpxRW82N0F5eGk5SWU4QzhHSGhOWXRoZmRH?=
 =?utf-8?B?Rlh4aWdXMFI0K1R6VEdKTmhOZlpYd2lFQlE1WGk2R2I4QTZNOWFnU0VUY2I5?=
 =?utf-8?B?UUVWUm9SQ0Ywa1JwRGhuSFpGbWNzcGZPQTY0TVJySFFXOFhESVo1Yi95SGkv?=
 =?utf-8?Q?1GDWwS8mDjYfbOb3tw5S70j8HJZQgmMwjFnv8wVhyiVD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b92184-8cc0-437f-a39b-08dab8b4a5f2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:18:44.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iK9kXa+bTlsSONqkfS9PzWou5oWz+vx+BLU+dJI7HQ87bzTDUWbIrdLxZ1SsgiIx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664
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
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.10.22 um 07:10 schrieb Paulo Miguel Almeida:
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> refactor the rest of the code accordingly.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/238
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

I'm not sure if that's a good idea. We had multiple attempts to refactor 
this now and it always caused a regression.

Additional to that the header in question came from our BIOS team and 
isn't following Linux styles in general.

Alex what do you think?

Regards,
Christian.

>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 10 +++++++---
>   drivers/gpu/drm/amd/include/atombios.h         |  2 +-
>   2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index 6be9ac2b9c5b..6b5abf1249db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -2079,10 +2079,14 @@ amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
>   							} else
>   								kfree(edid);
>   						}
> +
> +						record += struct_size(fake_edid_record,
> +								      ucFakeEDIDString,
> +								      fake_edid_record->ucFakeEDIDLength);
> +					} else {
> +						/* empty fake edid record must be 3 bytes long */
> +						record += sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
>   					}
> -					record += fake_edid_record->ucFakeEDIDLength ?
> -						fake_edid_record->ucFakeEDIDLength + 2 :
> -						sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
>   					break;
>   				case LCD_PANEL_RESOLUTION_RECORD_TYPE:
>   					panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 15943bc21bc5..b5b1d073f8e2 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -4107,7 +4107,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
>   {
>     UCHAR ucRecordType;
>     UCHAR ucFakeEDIDLength;       // = 128 means EDID length is 128 bytes, otherwise the EDID length = ucFakeEDIDLength*128
> -  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
> +  UCHAR ucFakeEDIDString[];     // This actually has ucFakeEdidLength elements.
>   } ATOM_FAKE_EDID_PATCH_RECORD;
>   
>   typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD

