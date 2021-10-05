Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9F422F9A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 20:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84D6EC17;
	Tue,  5 Oct 2021 18:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683606EC17
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 18:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7rBTRt86CttLX/FA15nSjY8fZZKJIrXztJx2G4cIvWsiGhnj00OcU5F5gE0TNl8MTCdU4I9aMSJhlaYFDApvpBmArnJ3UjI3FjN528HXBX3bkd15WaAB9G0sLzzrYTBqHEfsbEIUFq9fOcriQzBouPJGS6XE4jzBTHD4KqkF/hydPFFJCGXSst51BSaKE7PxB/g3iEL+yWmmfVGEPPLdSi0T9olYgiXmmLFFzgKq1RvrGQAMSRYfZ29w1gh2qB6/A9a2UOE8N3+FbL9UySV6jZ6qMdAgeQ6qBrR9L1RldL8uRH794tqZw4/4gQinnnvE80kUHQLhHW3OcAW0tsJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S9RdkhbA384bK5hqx8Ir//6aBWlB1r1MOFBPEX6Y+U=;
 b=BXzbWu2sLdLvV+nHXlNq4QdV8I3sdWzvfLwmkqF3sN+ItrwJU98AXwJsh7UT/oyck6t1mgjAGwo+64CZKJ+/HdyYJWFJGkZRplnVqOLgegcY73ubuNhu+ktbesiYw9CfXV7Mt4gmQC2qvL9L5Ob7Geao3dq4X9aFnky8nvtRcpubPv0w1dEaCOaadfjzxY+1Rr75tR8jT8N7aC5E8pibqx7ecSIa/kXQv6vB9R1HZbEhMneKaJQBbkzWlW77VzgGJisQiu6uALI5p0SaGkrY3KDhKRkbgdvfNeZGF6jOjrw9C+uCb+ud95zMNCixN5NpZgldxIRqvfHyivSDTafzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S9RdkhbA384bK5hqx8Ir//6aBWlB1r1MOFBPEX6Y+U=;
 b=RkQeiv6wfENgnRXbHpSf06z0+CQ2RQseX01i9EFY1NRtU0JSbFUuAToonJ6il44raJRACDqi4u48rVHErVAy1OML0n+mBLE1dNt2g2DfdSFGjl4w5W8BtKZL1TwXZhtQhXO3H68uCh01WgUdfhwHAiQUbox52Y3nrkCp1FXa7mw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Tue, 5 Oct
 2021 18:04:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%8]) with mapi id 15.20.4587.018; Tue, 5 Oct 2021
 18:04:02 +0000
Message-ID: <ba92567c-4ef3-871e-16d9-1830e2c0e929@amd.com>
Date: Tue, 5 Oct 2021 14:03:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid: Fix
 crash with zero/invalid EDID)
Content-Language: en-US
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "oliver.sang@intel.com" <oliver.sang@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVtZstInQxXfPmsZ@intel.com>
 <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
 <CAD=FV=VvKsrB9RZKdB6vQJ-38BZEYLnuENxb1+1v-PahcdBtiQ@mail.gmail.com>
 <DM6PR12MB4912FFA74D1E7FF4599DA57EE5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM6PR12MB4912FFA74D1E7FF4599DA57EE5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Tue, 5 Oct 2021 18:04:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db7983dc-90d6-4a03-103a-08d9882a8355
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5395E0C9BC31D87EE4F34B718CAF9@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiys0Pkj+60wcToTp//BLvO2mgGe1RN1Ptk1wuk03HNJxrADvaOdRgB9Dt6ZksJpqM+E2WMdyv5bjflaURvjqn+qsJSrRKg9Ro0TvDOaFIdTMNrlQC/+CEI2Td9deqBs+V6QrsOAdcpAPvRJAVWs6YLBmSiRCYtrVxkOZgExlvi0st7Oa30DhJm2OOUBmDdwEJgds2KE6/yJcEWe9xQqY/7r4pwDFfi7y9eOSDUzfdCQTS1saF2mEsrIxTydsdqziHhB3jdthoYtXpScy67X1kmdQnJVTQtiiuRnLau59D/UvrVLjKe/nUrzYstzOV/x8cHxiShLf1y7DhQ7QaqUGU0JW8UBzaCFI5XDu516IQaldSL5YfdeB/TCc3cgUkfGwWT8EFSUp1/ny08a/ekAqV2hSY3QW+2h80XK+vJHXtQ1YUPI2jhWMEWyrWVRFhZro6nRs3wrb7veC54/VSJBdM+x9qcgKxw+A8CJQRzMLYaIfWndXzUSTzQ+Wprax79zYm5hWX8LWgt8mkH2QiqHlkkcjX14RAQnGO2pCkMtTotAGXXBJ4gb2F9ci5cAt+WoFlpaKWMDokwoUhlC7eCJZCOW81eJ2MVUX/IIXjG5zj0bHYJAFrAY0YkH1OgkDo0C2zdj//Y/g73Hg1IViTiMkY2rLi5LR6EaXm9xw9ttO1LkjdF6hyGeBrd3cj6YG48v639vx0a6wcEuSXX7wsFNcN/YOa3GWfjddjvAHo1fWu8cOnpsTQCCmioa39D2ER62
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(966005)(86362001)(6666004)(110136005)(508600001)(5660300002)(31696002)(31686004)(4326008)(26005)(83380400001)(7416002)(36756003)(8936002)(6486002)(66574015)(53546011)(2616005)(66556008)(956004)(66476007)(66946007)(16576012)(44832011)(2906002)(186003)(38100700002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxhUkZVVGVuQzFnNjN4RFZkY3J0YUlLNGFUUS9ob2hWSzB2ZG03Z0ZHdUR3?=
 =?utf-8?B?VFdXbUNWbGVvNUU3S1Q0QUxKUXRZR2xxSVFzVmxFZEJMMGljY2pFYUZ0RmxX?=
 =?utf-8?B?bnVxazdzeUN6d0pGTFdmYkVjMER6amNTSnRRM3l1UG1CMVc3aWtGQlRoeUVx?=
 =?utf-8?B?eHc2YXpNR2J3eGdLdGJmektOdTdpR1N2ZEtOeFM0WTZCY0VkOTRMSWp3emJ2?=
 =?utf-8?B?eVQzc0sxdmhrejVmbmgrOTJ2VDV2eTBiQUlPTnV3UUZMckd2YXQ1dkVRTTNx?=
 =?utf-8?B?QVBLZldpdmNhVjR3a3VLVnVmaHUydmhpQnM3bThlT2FFOS9jWU9HL0NpVHI1?=
 =?utf-8?B?RlVaT2lVSWE5bzFtdkVDNEN2bEF6c3Q5VU1ocGZLUXdNYW0zbjhRVnl1MWxl?=
 =?utf-8?B?QXMrRFJDM2hMMU53WktKZEtLK2RQb000cmV6ZE9ZSGI2VUliWVVwVXNaNFdM?=
 =?utf-8?B?TEpZOWVxemFDQ2cxa0lIZzIyMnNkV3BnRnRkRDk1djg2N1hST1dZcjNDN3dG?=
 =?utf-8?B?aUM4WUt3bW43bXVsMktNeHdMMW9yTk9CNjZiTytpK1IrTWxOV1crTGl1TXE1?=
 =?utf-8?B?dTRGK2lLVGZCM3NSNkhkQlBrbTVKSEpPTTBudTV3SU9sd1BtNVB3ZWFTdmE1?=
 =?utf-8?B?Ly8zUjVBNVZXTGQ1aS9LNTRrSFpyTVJGeVA2MGNhVERVUklmM2lOb2hEZUZh?=
 =?utf-8?B?RFFIWVAyaHBDdDNCYTZJL2hYN1FTcmdUbE1sTUozQ0QwOW43dTduUlF3bzA1?=
 =?utf-8?B?QUs2R1dwOGIvS2N2N0FxaksrT1FZOGVvczF2S0syZHJoeHFuSTFQeHpiV2ky?=
 =?utf-8?B?QmcrQkVJSUt3clZ0S0w5TWxxcUk0UDVqajV1eW5MbmVYVnlCVjgra3hoVml0?=
 =?utf-8?B?VEIwSXYrdG9iMHNYTVR1b0luQ2NBQk1EWDNLdTdsZmg4V3pHcGtlanZ5T1VJ?=
 =?utf-8?B?UDNQRUhOTEtYVHNjRFFnZS9jWi8wMlQ5Q1FNY0NzNTB4WVI1dlJrS084VnFS?=
 =?utf-8?B?dG9sQTE0MTdra3Naa25SUVhyQzVnM1ZyUHlIOHViZ0VPSU1MOFpIS0ZoRTJl?=
 =?utf-8?B?d3N4MEdYOExQa0ZxNnFEbnA0YVNvTlNBb0s5aE04REdLb3Rmd1JPQ3JzWkx0?=
 =?utf-8?B?ZmhILzFscDdJMWJ5bXhLRXozczZaY3ZsMEZESkNvaUNVVjZwS1I4d2JLTGhS?=
 =?utf-8?B?ZGd6dCtOeTYyZWNTSW9hbjhCS2o3NEMxU2xSNGU3T2pna2pVTUplSk5UQ2lZ?=
 =?utf-8?B?TUVhY1pEcVNXTUpxckt4YTNtMWlGWXpMSXg2WlFpV3gzZkdGSFZwQlQ0R1pj?=
 =?utf-8?B?NlBab2ZUUVFVMTdqOTFyQUx4UTNNTWlpLzZqRVFHZkRqbnpqaWtjRXA4dFlO?=
 =?utf-8?B?V1JPdUxCcmxRNjJ6S0FqcUdrMDd2WXZaMXZOWVlOVElKVFkrazN3dXJ1cHcv?=
 =?utf-8?B?aVg4Q2RoMjhMV1RJUjJ1M0FYZGRpZlpCUW1oNmhBTkFzUDBLbE95aWNoeXdP?=
 =?utf-8?B?ZVNFQ0Q5YVFvbzdSaElxOEZRVVd2QUJMTEdNSHVpR2U4S0JxVVJmUWtuN1NR?=
 =?utf-8?B?WnNHc2F3MmVKUktjOUNhZkZadmhHZEdoQU1tTmxlcUJrU2hNNHpUUHJlR1R5?=
 =?utf-8?B?VnpUd3R5a01SNWluUzNsbXVXbmdyUGI1UEt5L1JxTDNGaUNibGdIbGk0UkNH?=
 =?utf-8?B?S3JYN1dFNTI5MU9DSDBwdDJwUW5KRkZQTTdWQjE3UzRpZGY2d1lZcHZtenpC?=
 =?utf-8?Q?hVFBnEnCSHAhw97snADRyYxaX4ZcbsZc61S/bbq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7983dc-90d6-4a03-103a-08d9882a8355
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 18:04:02.5747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7TI3Pyf9Bq+Qa4sAW67yCjcqrIeUqwhnXXEjzzwV3o2QG1nql14/YxigKzI8+d0hf/PcqF7ACmjL3kTULx/vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
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



On 2021-10-05 11:25, Zuo, Jerry wrote:
> [AMD Official Use Only]
> 
>> -----Original Message-----
>> From: Doug Anderson <dianders@chromium.org>
>> Sent: October 5, 2021 11:14 AM
>> To: Zuo, Jerry <Jerry.Zuo@amd.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; dri-
>> devel@lists.freedesktop.org; geert@linux-m68k.org; oliver.sang@intel.com;
>> Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; Jani Nikula
>> <jani.nikula@intel.com>; Linus Walleij <linus.walleij@linaro.org>; Maarten
>> Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Sam Ravnborg <sam@ravnborg.org>; Thomas
>> Zimmermann <tzimmermann@suse.de>; linux-kernel@vger.kernel.org;
>> Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo
>> <Rodrigo.Siqueira@amd.com>; Kuogee Hsieh <khsieh@codeaurora.org>
>> Subject: Re: connector_bad_edid() is broken (was: Re: [PATCH] drm/edid:
>> Fix crash with zero/invalid EDID)
>>
>> Hi,
>>
>> On Tue, Oct 5, 2021 at 6:33 AM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
>>>
>>>> BTW I believe connector_bad_edid() itself is broken since commit
>>>> e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid
>>>> corruption test"). Before we've even allocated the memory for the
>>>> extension blocks that code now assumes edid[0x7e] is to be 100%
>>>> trusted and goes and calculates the checksum on a block based on
>>>> that. So that's likely going to be pointing somewhere beyond the
>>>> base block into memory we've not even allocated. So anyone who
>>>> wanted could craft a bogus EDID and maybe get something interesting to
>> happen.
>>>>
>>>> Would be good if someone could fix that while at it. Or just revert
>>>> the offending commit if there is no simple solution immediately in sight.
>>>>
>>>> The fact that we're parsing entirely untrustworthy crap in the
>>>> kernel always worries me. Either we need super careful review of all
>>>> relevant code, and/or we need to think about moving the parser out of
>> the kernel.
>>>> I was considering playing around with the usermode helper stuff.
>>>> IIRC there is a way to embed the userspace binary into the kernel
>>>> and just fire it up when needed. But so far it's been the usual -ENOTIME
>> for me...
>>>>
>>> [AMD Official Use Only]
>>>
>>> Hi Ville:
>>>
>>>      Yhea, it is pretty old change from two years ago, and it is no long valid
>> anymore. Please simply drop it.
>>>
>>> Regards,
>>> Jerry
>>
>> I've cut out other bits from this email and changed the subject line since I
>> think this is an issue unrelated to the one my original patch was fixing.
>>
>> I don't actually know a ton about DP compliance testing, but I attempted to
>> try to be helpful and revert commit e11f5bd8228f ("drm:
>> Add support for DP 1.4 Compliance edid corruption test"). It wasn't too hard
>> to deal with the conflicts in the revert itself, but then things didn't compile
>> because there are two places that use `real_edid_checksum` and that goes
>> away if I revert the patch.
>>
>> I've made an attempt to fix the problem by just adding a bounds check.
>> Perhaps you can see if that looks good to you:
>>
>> https://lore.
 kernel.org%2Fr%2F20211005081022.1.Ib059f9c23c2611cb5a9d760e7d0a700c1
>> 295928d%40changeid&amp;data=04%7C01%7CJerry.Zuo%40amd.com%7C90
>> b948659454400cedd308d98812c339%7C3dd8961fe4884e608e11a82d994e183d
>> %7C0%7C0%7C637690436453163864%7CUnknown%7CTWFpbGZsb3d8eyJWIj
>> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1
>> 000&amp;sdata=OtSngWlYyDc1NbNSgAeALqN3nF%2Bnw08nJ068cpAKZJk%3
>> D&amp;reserved=0
>>
>> -Doug
> 
> The patch used for DP1.4 compliance edid corruption test. Let me double check if edid corruption test could be passed without the patch.
> 

Can you try the CTS test with Doug's fix?

https://patchwork.freedesktop.org/patch/457537/

Harry

