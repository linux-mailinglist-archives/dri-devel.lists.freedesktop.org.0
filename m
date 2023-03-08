Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1996B0F0E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1760010E69E;
	Wed,  8 Mar 2023 16:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647910E69D;
 Wed,  8 Mar 2023 16:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHbxL4T6qLICLKFrqFcCNQDfYVGDbKVu1pDgVZ2ODGBEv2zbgIdC/JIumG0c73TRpecG7FsgOh3yTDyUbulJm5iOjtHTcsSyzH4jvnkNnO7DccA166yGKhJYfuPvyV3H5A0S0xUfr6CNlxAvkIhaJ0p5RebEV9pmZvZjFMTCE0g9ZgMkgWlo7TcxvBMT4fX3/7v6LwCJu070MZt1pExkQ5NdN7KbkTCIsGKxMT7tNrlHh4sUurOeWPw6HcUffAn3Y0t7tAwwjXJM7pd17jgFJV5jgKwZRvvtGJaXQEyiqF9slUNKxWSObntQa/j5fP1JM7ZB/tRnFBK/W+zIj18OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxmC6WEVsSnS7XikfwEFFqmwWfP8JKOl4nSNisXjFqo=;
 b=lAK0pV1miDtbDAyQ6qd6F4gB2O6yuqIG7MI7WZQnvGxVGUhvc26oD2JZc/UGS4OKlA29aTLTaEHAWXAajjb+giVckn+bKLibsbqVa9uuIYEQEVWm3N06rAZ753T40iqZw7BQgd5oORu3EhySk++NVPAf79cdGB8urQlLAyb88UcA1Gd90Y1XyhJvKnU+DvvEPgt2BrRUvKtUUWQ2uwBTqQxCmT0RpYscDm5QHkgBiyka6H+NcusiAk5qxdI64Y61dgJYWaZ1fz9JqazUqxN4Rh2HfggeWV9UrRAUywdDPyBa5VuhxWH9vwJQ66BhenO3iN3PUsFfiJIZtYST4U7ZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxmC6WEVsSnS7XikfwEFFqmwWfP8JKOl4nSNisXjFqo=;
 b=a9mT1RzO2X3HyotfSxdtWJ+PuP8++5cY50L34MB3kEVet+zU+CnFbOmqnHq24ZSRk39zqqxYqyVdKksqeQtGAhK+WtOXg03DTGYuN6mNWLrgnebxIriaFkouMwEFJpuirckywP3aS4ZTfJmFYxe6AYxUHJb9CM8E2x1IcoIjTX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 16:42:19 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6156.023; Wed, 8 Mar 2023
 16:42:18 +0000
Message-ID: <bda15326-45d2-9a9b-f3b2-09fd3c73234a@amd.com>
Date: Wed, 8 Mar 2023 11:43:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Maxime Ripard <maxime@cerno.tech>
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
 <20230308161945.svooztnablyvm75e@houat>
 <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
 <20230308163248.u7rvtadhlre3yua5@houat>
 <CADnq5_NYnb1j9RnurMP2-TU4nAQRsPH8hsn_YXoiPZZ4woXOnQ@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_NYnb1j9RnurMP2-TU4nAQRsPH8hsn_YXoiPZZ4woXOnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::12) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|BY5PR12MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c4593d-6dc5-4a89-5db4-08db1ff414f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/o1nDmi3oevkkrf5T3iwS06T02Oyn9WUxY3lRbAk6ARu2v7eF9HqANtr1eKfqcOgjZ66WEOWUb0d9Pu+S1AmOybrQ98a3Zen1ZPjvBNnWc7GRrY+JccvMGdCvPExxqMTebhUFrQavCKf7tv+bobkq/DvqTEnJRy9LcM44y2QPcAa8CcQ8ei4l5cmL/y1QiK0a8GOeyyIhKNrgiztoEGwcclDXONM4ONxRD9e8VQZNmRDHwcNdn7me+9C4kzt+BDXiAvNGZZKHA6fQanDoTgrLlbnPyFyrt9h2FLQWKQX4Qk4KDO9V6vhn/3Jo+uY5lnfoKmrr/K+7uyXvAgEAHNM1Cqrphd3m5q+mcl834Z17M6ODVHXC9+CR43WraWtTAg0eXYvpSBu/ga40MYk1Ow45CxL/S62g3h60JZzM6F0KW2Iwvy20Kv5iJtxT/uGYVGN0lOfnZKDF743Rf3iuH+WVCeQz8HFBqjyDtXuhTQSByJVGv5uKYo0juYmidodrRKRKeDVoriLGBJOPQs3FPIbXN0sEqCL1HkpkYeSjOhB39m532lj8uieSaV723SWcxkPmYRTwEqsAUIY4f9FK0CkkmQnSKacdBecEXbiojWc7nMUF7wVkeamzZeP2XiUdKE3BjX+xmG+z4ZCJN7NUFpF82pHfbZlq1X5BH2Ajmp71Za89t9smXc/SMvpKIvt6sE1Fvgo13VerEaZKQgxBnoOrYZiUdTPURGew9vqFYBF6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(2906002)(4326008)(8676002)(186003)(66946007)(66556008)(38100700002)(66476007)(31686004)(53546011)(41300700001)(6512007)(6506007)(26005)(2616005)(86362001)(6666004)(110136005)(316002)(31696002)(54906003)(44832011)(478600001)(6486002)(83380400001)(8936002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFQeXFBSjlyV2dBVEZiRVRESVJvY3pmNTE3UUl5M1IvclVLS3Yyd0MvcGYz?=
 =?utf-8?B?bmxaajVpeThmM1Q4QnRPd0t2SC8yRjZmLzBsd1V6emZmbzk3eXNmMG5WanFn?=
 =?utf-8?B?MVdPalhldDVSWDRjb3dZL2xoNkg3NEVzTkY1Ly9FT2Nrd1pNbWxLd3RJTjZM?=
 =?utf-8?B?a1NUb0pIOTJhME5BWVVDbkFxMlNrUVJweHNtOGVTZlJ4S3dKN05UaFUrbEtx?=
 =?utf-8?B?eGVxMVkwdzBlNlQ0UEs5SitzZDB0dVQrN2M5OVhFbjBJRkdaS01ESVB5ckZa?=
 =?utf-8?B?UUtsdHRkTWtJTU9pa2U2QnZNdE1QeWNkZVEzdWtWMm9maVYwS3NjOXZOVzNz?=
 =?utf-8?B?Zi9haXlDQVlWajZYWnBNVFNCdk5nZUJiRnl4eG1oUm5ZSlNWaktxYnpXOTFy?=
 =?utf-8?B?cnRvZktEZ2VqL0hMZCtXTG84M0U3dCtOcUpzZzNkc0IxYm5vZXJOTEFoVTBT?=
 =?utf-8?B?b0NQNnpLMGVHcGZNNitCUEVQRi96b1pDUFZTOW5ub2xXRTFWeTVkR0tTOEsx?=
 =?utf-8?B?cTdXVlYvQ1hqT3AxVXZHU3Nsd1QzaGJwc1lkYzFpc2VIOWdvN3EzU1cyaWtu?=
 =?utf-8?B?dlVHbWJlYlBsL3FFMkRMSnI5WDgrUWZ0aVQ5cjA3UWpKUXFXMytnejhvMlJV?=
 =?utf-8?B?T2tEUUhqbU5lZkVSTjFZTHZwcmFGQVl5VHgzRWZDdkJrUytHcWh3b21hN200?=
 =?utf-8?B?dlMxKzR5bk04NVZHY0J0ZnR2VzhsMDU3ODNVZmMxdGJGN2FyVGhsNTBZalBp?=
 =?utf-8?B?cnJmcVV2eUNZaDlqRTJ5Y09RbEoxNTZESTdHb1Y2NXdEWWhGd2Jsc0tvOGVM?=
 =?utf-8?B?VHM4OXZjL0lqa0E5aVYwWkhCak5GWXVqSUZmcFdtWThXeDllU1JGODR3THpk?=
 =?utf-8?B?NngrbmYxQTFDNjJDN2NVaGlSdDlmajI1WTNtdVoveWZOM0xNSnB1UHlabHBh?=
 =?utf-8?B?VXJmV2VIVUtzSnh5emcwc1NpUGR5K1RBTjUzZnJSR1JRZXFjZGEyaFdhVzdX?=
 =?utf-8?B?UUJ1WFNFSXhKcVcrdVdEemFJZmxYTzlidlRFK3ZoOXNtQitMcGdsWEw1eHJ3?=
 =?utf-8?B?bjl1OXg2SHI0clk4dUF1TVBKWDNkaC9ndHFCVXNkSUZMQ3pCY2h1cFl6K1RM?=
 =?utf-8?B?N0RyNGRXY1c2NmV3djUwekJpMUdKMGs2WFR1RVNCNlFSbWJtOTJzV3VDbi9v?=
 =?utf-8?B?S01hQUZMZzhENVBlT3VIM1ZVZXJjUjl3bEcyd2Nlb1NFQ01MQ2YrTlhKZG93?=
 =?utf-8?B?aFZFcXA1TnBkYUd3TVpGS25GMlpDRlczZ05GRHdmMjRwajdrZUZqdkV5OUpV?=
 =?utf-8?B?RkpONDJQMGowNlk0U21QZVg3dlh6ck5pTks1V1UwbUtYNjN0MEI1WkFPTkR3?=
 =?utf-8?B?KytuVEM4Q0Z5aU15ZHRNOVRaUmlWV0tCeFV1dzZYWDhlWjFYeEhzTlR0SWxD?=
 =?utf-8?B?dkErSzdYQndkR0ZCeDhDeW1MNTFtNGh0VWh6Tkl6UjR6RExBTHUwSE51VDZM?=
 =?utf-8?B?QlduY0ZHcGNURWpiUmxYYVp4ZFBWZmFFZ21IalhldHNWU3hPeFNoc1F5NEFM?=
 =?utf-8?B?MHpqUy9VMzFhQW9XbGJhNGJFUllFbUlnc2pIMC8rbFFDSnZHSHp4bU1hNDR1?=
 =?utf-8?B?RHF3bDd4VTQyQVJaNW5RbnMzZzc4b0wxUUl4OGQrendBcXk2Vkx2cVE2MU5U?=
 =?utf-8?B?cUhWbWFuSXZEWFJyem9lT2xoYWxoTGtZVzdzak5VT3pFQ1l2RmtXSVE4cW82?=
 =?utf-8?B?UXN6V0FXOHh0WUQ5MFNLOUtlV0JiNzBrYU54bzEvWUU3UDhSZ2dqTFJuYVRK?=
 =?utf-8?B?a3NVY3V0bGxFbmRmQS9vMUJSZExObmtUbTRSVnFjUjRMSEtLYWI3NFVtYk8z?=
 =?utf-8?B?Rjc2RGVjOUVhZ3lEZXZjVTdOQlRWRkVFczZyTjVvN0JKZWlGempINUxmMVJi?=
 =?utf-8?B?VGJsTjE0dEFuVnpXVG9ydCtmYlNKcXRTTUpIYVMyR2lOYnJFT1U0eklkS1l4?=
 =?utf-8?B?dXhyd0g0RHR6QnhPRVA1NUNLc0JEUUZpNjIzM0l0U1pMa2VINGxKaTFTOXBt?=
 =?utf-8?B?L0lzYkYxM1VCVlFMQ0VKNzdiTWIrZEJRbmNVdXVwMmpKYTZQTVpJSU5ndTFk?=
 =?utf-8?Q?5Hhb2579t+Wzm2W0PC6yW8N6g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c4593d-6dc5-4a89-5db4-08db1ff414f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 16:42:18.8894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8DrXIIc2PqfmsQgyMixGV2AviJn2iJVqwz0Tsy3WD5PCu6vtAWCCBWnPucrq2EwWYco1C0ts+oZWggIFwVm5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhuo,
 Qingqing \(Lillian\)" <Qingqing.Zhuo@amd.com>, Emma Anholt <emma@anholt.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/23 11:39, Alex Deucher wrote:
> On Wed, Mar 8, 2023 at 11:32 AM Maxime Ripard <maxime@cerno.tech> wrote:
>>
>> On Wed, Mar 08, 2023 at 04:27:01PM +0000, Zhuo, Qingqing (Lillian) wrote:
>>> [AMD Official Use Only - General]
>>>
>>>> Hi,
>>>
>>> On Wed, Mar 08, 2023 at 11:11:22AM -0500, Hamza Mahfooz wrote:
>>>> + vc4 maintainers
>>>>
>>>> On 3/8/23 04:34, Qingqing Zhuo wrote:
>>>>> [Why]
>>>>> drivers/gpu/drm/vc4/vc4_hdmi.c: In function ‘vc4_hdmi_bind’:
>>>>> drivers/gpu/drm/vc4/vc4_hdmi.c:3448:17: error: label
>>>>> ‘err_disable_runtime_pm’ used but not defined
>>>>>
>>>>> [How]
>>>>> update err_disable_runtime_pm to err_put_runtime_pm.
>>>>>
>>>>> Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>>>> b/drivers/gpu/drm/vc4/vc4_hdmi.c index 9e145690c480..edf882360d24
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>>>> @@ -3445,7 +3445,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>>>>>             */
>>>>>            ret = pm_runtime_resume_and_get(dev);
>>>>>            if (ret)
>>>>> -         goto err_disable_runtime_pm;
>>>>> +         goto err_put_runtime_pm;
>>>>>            if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
>>>>>                 of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1"))
>>>>> &&
>>>
>>>> The current drm-misc-next branch doesn't have that context at all. What tree is this based on?
>>>
>>> This is for amd-staging-drm-next.
>>
>> I don't get it, why is there a vc4 patch in an AMD tree?
> 
> There isn't. it just happens to have an vc4 driver with this issue
> when we branched it.  Lillian, please double check drm-next or
> linux-next for non-AMD drivers

I think we can cherry pick commit 932d860f4672 ("drm/vc4: hdmi: Switch
to devm_pm_runtime_enable") to resolve the compile issue, that Lillian
is observing.

> 
> Alex

-- 
Hamza

