Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C263038D41F
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3E26E02B;
	Sat, 22 May 2021 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C446E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 07:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmVy/L+qjvhoSmvLOrfA0YiDNrIX7d54k+fgWH2MFeCZtIm+h3+xSt+0XD8OmTDsPEpk332lqR6J2VY1OVGBwAvB0Q8g0thQ5JC7J0Gf0G/RsAG0C1Q4mgjuDpRna97f4uXzYTmQawICu1LOofoWiVo8UG9G2rbD9x8bNfaWs3n9hgDIaWmH/Mn5W01/Aycy0a/FYp5lYj9HwVoKYw+cSA2loLGucW3mjGJjIKz/qdn/e5Q6TA8xNhHstAsq9lQ77355hxpzNDouGkX+J1A/hWElhfEVXeVdWQUPxL4tYsc7tAUZM2bJ7gFezCY5uxYioPqnRW++Ei/YdvdaN1ALDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsBilGbAtB3ENUyqbTc8LX+c88Q5i9IBfZUolRJI2I4=;
 b=XLGRHr0V6tiBixr20+HG7WyeIjNBxxEEnPbL5LggwLcu/gP9MtYlhVNJCvhArUW+AhFhtEWtuTM3Nj4WEN11mhE+TB9iKurTvnAgBi4WO+ywYMx3SgQpBJ8VZSMQR5yNyHiwTC9uaSM+N3t/rOkCIdnrYvBun+9InCVyL4TwKAWsE4cGjPqISe35aILZKduv7umaqrnukWDUk9zHJ2cSQbUhGTkg7CELlKYdcLvi1H3BkgGo9qn2CZ0IuSe3QZAlbB3MJVYnchD3Wvav1SvL5kK0IGPq3t6a4T6U+DQNusUIXmb+hUKmNy/IW5RHQ12dgOwKABwJHHomwKsgHqsRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsBilGbAtB3ENUyqbTc8LX+c88Q5i9IBfZUolRJI2I4=;
 b=DHOKo04aqxpk/au1OD8ZPVATD2VeTECQp1scJ52WqI2GdcjpKr0Y9yo4/VxvXWqsU+qJY19J6NHb8sMAKEryRaJVeFX9Oyw0CCHLouVop9wfdnZEEooFIJqdDwmLlVhyQWWu14HcvEH4/3u7dif3Q9xg5+yx62LTrqLS/TpFaLY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Sat, 22 May
 2021 07:13:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Sat, 22 May 2021
 07:13:50 +0000
Subject: Re: ttm_resource_manager::use_tt
To: Zack Rusin <zackr@vmware.com>, dri-devel <dri-devel@lists.freedesktop.org>
References: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b743342e-5151-110e-e29e-bf89a34d085a@amd.com>
Date: Sat, 22 May 2021 09:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fbb3:4c00:7f05:a878]
X-ClientProxiedBy: PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fbb3:4c00:7f05:a878]
 (2a02:908:1252:fb60:fbb3:4c00:7f05:a878) by
 PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Sat, 22 May 2021 07:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b936e479-3e81-4183-7123-08d91cf125a4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4109D0112ED8F8D8F3B8F07183289@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idcA4aS8IQMFVWEkex2QSGAJVXBIAxNkpp8+ZefmxQ8SYD5kGUJxNy6H5WM2EVNj5WmrJ2nywj6FM8LmIgh6BP9uZgq8C3z+vA4ShLpewzBfi4OoRirn5LsnTGCGQzQOLSS84vRpDrVBxGlBwX7a0TaLhgo3BYKb/nrGniH9umZVSHMgGPsLPU5+uCwl28tq94gGaNDbXbiTuqf8rZPwjOrCOR0TEqv9tqhVKxrErDjlf5Hv5th1xxY924RShCkA3pC1RiEucGmsZWoqipBe95ixlhbN1XsFPlw9gT2PE0cGp/vrj+6quEm47Jy0jhZ9rXS03SvXiNU0LMcX49xEnug/rnkyvRSMB2nmn8wCSIYYQZVYX7WOX96idihAHmjc+IpsvhBZ5QvdywQgS/kot4sQEwf9qKNWgLr9GUinpRZdSe4zBXzFjkaQCZrvGunmsuqlPUOrfPMjTwOQGNOslSjR0kIWt3/ZB5ZFJ6aKMkqx8VedSM8DL8asLkuMqKxzBjnxob7pf2yZ2AEd+5I9oLsFtgSH5qPi+17xaaQptpJSUSxoPMqivEZInjlf1Nl7DQHQeLuLx0yDVc+5mNvrFg02o/mu42wJSBkvSRDaPI4Ds26Xom4PI3Pqy0C5oady5OARm6M+P026HNPErmkXtn3YwVvC8rg43uWzAdzScenFv537Kyx2dw4AbksAdLFYjS6yzbdav7LpwQJHSYKKQMH0j6TrvvWQ2kHx4MiPcQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(2616005)(38100700002)(110136005)(36756003)(316002)(86362001)(8936002)(66556008)(66476007)(2906002)(8676002)(16526019)(52116002)(31696002)(6486002)(966005)(478600001)(5660300002)(186003)(45080400002)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z29qaVpWNy9NL2RGMklJWk9Kb1V5a0FUN3hPcFB4TWFRTkxHZHo3UXdmUk5o?=
 =?utf-8?B?aGtIeVdhdWlsbXZZVnhZZVBBWUtEUGxERTBPVURKdXBYOFdrcHp2Vk1ncnFS?=
 =?utf-8?B?cXFwTlAxRzYvTkd3SHZPOHlOTzlXVm9YUENZMng5MUJ1d3ZQMU1uUm9KdFc3?=
 =?utf-8?B?VVh2czVnM25GaVZsa1AzVWoyOVZEV0lpY1pxVU1pbVFGRXVnRkFINkc1bE1s?=
 =?utf-8?B?UFVFckcvZjZvVmt6TDBYejBmMHFCUFBLSUFnMGZaK0gyRVc2QkRoUGVSZ0kw?=
 =?utf-8?B?NDVlOTV6c3RyeEp3K2pya2tXM0szc1hZVmpNajdqRU5GbWdMbkNncEJzdEI0?=
 =?utf-8?B?Qmgxb2wyeVNqbG9JbHFTNHVoM0xmOElKem5tQzZkeW5USjNFaklnV3pYZXBN?=
 =?utf-8?B?OEV1N0xta0loRExEY0U2Y0pYMEpwR0ZiRnJmbDRtUjZxUDFDNEIyRzlacWtY?=
 =?utf-8?B?RjRGRU5RWGZRUnZNVUJNNzg1V0YvbWFJeTlFL3ZPdElyNFlnVW93WUZRcjF5?=
 =?utf-8?B?cXc5RnVmNmdTUlpMMmtMemQ2aWd4c25NSmliY2hqRE9VUEJrQWxocWZvT1Nv?=
 =?utf-8?B?L2cwNWZjVkFXZjRPcHovOFZnTG9KV3hhdGVrYnJ3ZmE1NWFqc2RJY1hiS3V6?=
 =?utf-8?B?eHVKK1RFalRMaTZScjVwcXFXaEpNbUd0dnJVbjJsTm9WOEhiQ3lzY0hwcGU3?=
 =?utf-8?B?QVpyMWFDOVhRSm5DTnV2NEQyQVNadnlvck9pN3lSR1FTLzQwWFJsYTkzcitv?=
 =?utf-8?B?TzJKRTRCZkQ1K09PYUp5Rlg5SnEwQzFkTHVkN1ZyMW42eHJrM0NYMU5CcTZC?=
 =?utf-8?B?OGFTYkUrU3VCOVZscjhXbkQxY3lmNFAzdmtka1hSRW5yWGFocUUwWlZwZE9L?=
 =?utf-8?B?V2FuVmtrQ3dNQjcvL0V4OFVXQkNnamtTb3VLM202RW54QWpJZ2I0YkJEZVVx?=
 =?utf-8?B?a29pSmo3dWp3Y3p2Yit1Vkg5V3pDUTFqUEV4eG1FRmZuN3o2WWlhYXNPR0ht?=
 =?utf-8?B?NkdDcm9sU0ZPVXVRWkZaZi9oa21tQW9NdEtudlZmTXFpTU5ScXoxMklLc05I?=
 =?utf-8?B?STFxcXlZQlVhUCtacjJvMFlkazJkTWZIZ2JYTmZyTFI0V29zallaMmhJVTRk?=
 =?utf-8?B?ZEg0b0VZWUlMWmlQZGRTQlBkd2tvZE52YitYWWJWZDY0WUwvdGpnMWI4VEda?=
 =?utf-8?B?YnNWSXdTVjgvckFIVHNFODdhQnlyN1RpNG14U2dWUisxcXpqNmltUGdJaGJG?=
 =?utf-8?B?enFoSWV0MWVHZ3B5enV1VndMdkVQeS96NC9nL2RHN3MvM0pMSy92M0FTTnRQ?=
 =?utf-8?B?WnhHQ2pXbDU3cEkxOUIyYXJvblVZZHNTOG9YcW4yL2RBd3lqM2Q5bDFVakls?=
 =?utf-8?B?aEt4ajRqR0dVQW5VZ05oLzlDcXQyNXZzYzhTVXA5eDBzSlVDQ3JjWkVBbHIr?=
 =?utf-8?B?THR5M1ZNakttQ0k3Y0UzL1dPUnc2UW1OQmJpN1ZCZk9YQTIrTFpQZURoMEUr?=
 =?utf-8?B?c01pc1hhcFpPcmlsdWdIRXl4RjJMb0hKcVY1WDY4akdJSXlYZUdXM0h4YWRP?=
 =?utf-8?B?S3dxSldDWEo2dFM5cml2ZDQxZ2E5SXE1Wko1Wm81am04R0c5M1lKZ0E5QmxM?=
 =?utf-8?B?ejd2S1JiWStZK2Vaa3pUaXhNUEE3K3lHalNCZWQ4YzZKazVkNmlrbEtJaXR5?=
 =?utf-8?B?eXlydFpHazBEYlBMR083N3Y0cGNxUExiOXhVZmttN3JsUnhEYXRNanFMYnFa?=
 =?utf-8?B?V1krdTRHOXdWSVdEV2hmMkIrM1lJZjY0WXJhV2tsOFU5ckxyUzdSamQwdkhn?=
 =?utf-8?B?WUhyZ2IwU09makNTK1U2ZEZteXdBZWdrbk9VZTVBT29Gd2Fxa1BrRGNTTUEx?=
 =?utf-8?Q?3f0tafhKekFZe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b936e479-3e81-4183-7123-08d91cf125a4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 07:13:50.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w69MRkljrQyhLmT31HHE+jh0Vb2G/El1Yeg4KpuD4sIosVtWKd+76Ho0NTCbNCCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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

Hi Zack,

IIRC that was for the VMW_PL_GMR type, wasn't it?

As far as I have seen that backend was just giving out unique numbers 
and it looked questionable that we allocated pages for that.

E.g. when you set that flag then for each allocation we also allocate a 
TTM tt structure and a corresponding page.

Regards,
Christian.

Am 21.05.21 um 20:17 schrieb Zack Rusin:
> Hi, Christian.
>
> I was just going over some old patches and I was just looking at your 
> series introducing use_tt:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F80078%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C95b3c758592d4f0c247c08d91c84b48c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637572178561737650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5uZDVUi3W1WH29%2B2nE9uFUFZjQkKJyUxc6MwEce6SQ8%3D&amp;reserved=0 
> and the change 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F382079%2F%3Fseries%3D80078%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C95b3c758592d4f0c247c08d91c84b48c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637572178561737650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5XWSt07%2FzlXDa0GH8hnwEulyCBNocB2fUJ6CLwzubbE%3D&amp;reserved=0
>
> Do you happen to remember what was the worry behind the /* TODO: This 
> is most likely not correct */ in vmwgfx_ttm_buffer.c? I'm trying to 
> figure out if we need to address it.
>
> z

