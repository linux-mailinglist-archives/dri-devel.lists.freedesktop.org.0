Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334834D479F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 14:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230510E837;
	Thu, 10 Mar 2022 13:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F5610E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiEBIgh/WjJVCzsBCzfNN33sqlITC/sy00zxzA9i/NHGg6J4ELjstSuJNF9MyY2yJp2jh19yfwIOzUilXRN9C5dSllYEeZcghQM6AKrLzfwH9FkNdJcU1D/nLRUUjL1/0WNrfZMUefgu8UFGaO3M0y1U3bxKUuJqCag/uyOIUTAGb61sQiSi0Z7OwxhQqQecA62/KPyTgKP/TaqKWcV5+LpofkrDHUf9C+2FtmqCX5hnGhw9NCbxQHq6Pu27liPWVeUlPsuhQTbq4HsugfL7Qs+gamDGXIbBzJkXd4Da+HQzHH0ws0gw6uGeOY1Rb8a7Xbu8T8fBhHHLaSwPiYG9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdOvZ4D/G67aSPufee1fKNNlPlXpXMgOUDlV2BizjSE=;
 b=VSs+OQkUyTK/WLUfyFpfOL7bUIjpyzV5x16nbxVcC5C3CEWrr0ouellYwhEovUL/kD8BBxWFnCZ+RyByto35lCZMhiVGAtjDkvf6IC8OWlXOENzGcnlGFqPzQhZ0OyVff+eDCOqK8rVKK8H30nZ/h0PcfPCOu30nggX7jNjnqnl3XPHCCETn4xMA+igStwbHGgUWR3FAe1wcnS4O6/1/Ozh3OuEFXBJm00h5DbtFGeyctCHUR6sVbaj3DQOdAby3j+VAcjjI8hl/DiBcgTGs00Y98tentgrL+VaB7ZqJzQMwHEYc3x+M1717pbK+ilSP2qcqJgeQw8jYIoDhHIyaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdOvZ4D/G67aSPufee1fKNNlPlXpXMgOUDlV2BizjSE=;
 b=o2GSJ3LL3E3yhIluRwpIdAO4UfHVbUcjLEoI4F7PVdl9GsZyrJmEFqWjdUIrun0Kkelxp/KIJIm7MgZzRBqRBfZOIU3cOyMvyDlX7t0JTieLG9wAIaZQp4IB+GN1sH/Kq1eyzgPRmEInygfcpYkMBMTp4BqT+j/z3fuiuXi2+MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by HE1PR10MB1641.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:58::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 13:03:31 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5ba:3ed1:1acd:b5b7%3]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 13:03:30 +0000
Message-ID: <ee363ef4-57c3-3c25-bfc1-79a13198872f@kontron.de>
Date: Thu, 10 Mar 2022 14:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
 <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::37) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30b9b5e-c3ae-4a08-ef82-08da02965fe8
X-MS-TrafficTypeDiagnostic: HE1PR10MB1641:EE_
X-Microsoft-Antispam-PRVS: <HE1PR10MB16411BDC2594A9293FBE8B79E90B9@HE1PR10MB1641.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3i9wVxcc8ASQ59b0A5DdHkkp2pxeneFuMei8cOqI7WtSJylNOcLwm1QiO5AG9BZMMC3IeVmlOtI3osJAbIpqB/Aus/qzc6RN8EFqdaz6/N+ZIXACHPUtfZ1pB3b1Us9AcnFIRXDv1GWQq4eXgFOfnLthdid5OREZ8rFh5x51/JsP9TgKT4Bv5jyHQM6f2mF0H15Qdsm+zeJ88HOjTgCAPqd70o2pXcAiuBREgmGrS1QzkJ2Zo8nITpmGRctEIbg1Y4iMPZm0Y976ORkbskkuKT0bpaXHaVLXa7d/TyEUrrrcWfKYARE4KK+OUBObM0Pjb7zeXD/c5VBGvNaL3Mx7zprztGauq9mAUX4KIANh/aaGQXGfr+0KDjKXTmvOftwT2LQQpPc3HBSkt5oaQKpRUNfQ9Zy8piRQDqsrkht9fXaPmL8OPowl2oKu2WOA91cY3CYriwI47OggXtUTz8qpUE60evRvFxEy/xa/tEXeyO4XclWREzkNUnCAKkRQi5KgYQoVX4qbjtTWOuhmUt7o4g6m6cg12w/xJZqxoUy5Og6fO71e9IySLE62svTkwYFJFPNK/4K0TeKHDo6uapGFfmSow7Ar4TLpeEPggz+S1lGJqgpFcqvjh7Vz5Lgqo0PdUx7XMjKLr3oIJ23rmTBE1z1/5px8As3iJ1nOQ1KO6ZgQMeOg7G8SCHaF8bXw80pEXUtZNB9+7HzSb6ip+1EnHgJ0tpOTXGAw598BG2ukaPv0C6dWMoubqPxft5WWbHOWHRo2L2jJg1qcB8Sq/IZ/YPibx7a4dCqJq7LWKWrV33/1I1BNGO70+vUDieaphYCU5KU+RVes1bCxWjurbMc04w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(54906003)(6916009)(86362001)(66946007)(316002)(66556008)(6486002)(966005)(4326008)(8676002)(31686004)(66476007)(45080400002)(5660300002)(7416002)(38100700002)(8936002)(508600001)(6506007)(36756003)(83380400001)(6512007)(44832011)(2906002)(53546011)(2616005)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNVd09aUWF4ai9HMkM5Nk14Tm1NZTcxckdKWjFRWnBSaGh0eEJyc1AyRjdW?=
 =?utf-8?B?SjBvbnBuTVlXZTBDNmx6ZkI4b3ZuNzVuNVM0cmNhRE5tRW0yZ09GdVVRTUVS?=
 =?utf-8?B?ZEJ6enM2eWw5Mm8wMlRsaHg1K24zbFlGd1h6SjkzcTk2UVA0VEgxNitJdWhT?=
 =?utf-8?B?ZUN0dHFtSUQvdzBBeFgxbU1mb2puaklEUnRGdWxZaVBTOE82ZkNYQVg5ZnBP?=
 =?utf-8?B?VldBeGF0Q0tITlRaTUVmVHJwRUpSaU80UUlWZE1rdmxkSVdRKzJsZ2pmZWsv?=
 =?utf-8?B?ZFlHQTJJSkk1NzVGOEw3eHBxNjZsU2JYUlR4UkJaMWxaZzQ1SnptaVkwQkhp?=
 =?utf-8?B?emp1b1dScTdMWEhnaFhnWlBHaDFDVzVDeFpwWjBrZmgySnNPeHpramozZDRS?=
 =?utf-8?B?QjhBMzczdy9ucEFNZjlSN00rb01wRlAybDd2OUQ3aUhSaUpTY1FWTHJpK1Rh?=
 =?utf-8?B?aGxWZTBIVWo3TUJvRnBnT1VMYnpXdFN0REp4NDhYM2lpcy9mcDduUE5rMXZs?=
 =?utf-8?B?dS9mUzY1OGI1dEhzaWJ3R0pIbStQTVpsS3NSQndZeERpd3BNVjZXMlZNaFVL?=
 =?utf-8?B?dm96RmYrUXZjYTNQU09uWlUrOUVpY0crWTdmcHp2VUFENmFpd1dndk9EbWpP?=
 =?utf-8?B?ZVFCZ2IwN3ArSjhqS2JhZEM3WFNUUkNIcVVRamJCZDlhSFZsRUpwQTFWdFRq?=
 =?utf-8?B?bGVYZVgyV01oQkwwczdaR0svVjVCWFFCVXp2UVNDb0JZeDVWK0ZwbUduZ3BK?=
 =?utf-8?B?bE9YTXpuVnU4R08wZ0w1b1hWY1VEaXVVUkFvQUp6TnJDQ0xLZjg1bXhoZitl?=
 =?utf-8?B?R2pZajVpcjR4aytScW5iR0hOUEFobFBmR2ozTEIrcU0xeGR2ZFZLYnNla1Fv?=
 =?utf-8?B?RTFqdE1WdkRpS1QrUWpmcTRYYURMdWhMT3EzYTlyNHlpT0lvdFoxeE9HSk5W?=
 =?utf-8?B?REhHUm5NRVZzbnRacytKZTFnU1ZJa2lkSmsrN0NicHo2TjVDYXhBMkZRRUov?=
 =?utf-8?B?blFwRzhlQW42KzMzOEMwV3doUGplcTBKNVMrNy9Cb1lvYUNIRDFYSTQ2Slgx?=
 =?utf-8?B?eVdkTlA3WTZSWFpzdlBRUnlWQlp1R1BTanNsb21kMXAyMDRGQkpuSEpLbm82?=
 =?utf-8?B?cHhCNm93QXpMb29iUkZlRGduOWtiOG9yYlN4NE1QaWNCSm9kWEs0a1NhUmZR?=
 =?utf-8?B?SE5XNnlCM1BYSk9UdE1Ua1BqKy9zYThxdXVyZ3RXZEM4ZHNsdTJmZnJDeVBs?=
 =?utf-8?B?ZDd3WnRMN3VkSjFUQUdxZXIxMGExbEFPTXhBUVRpdjFCY0tKWFZlc1k0cFZ0?=
 =?utf-8?B?OUM0Q0JaYW1sZlVWK0tkQ2oyZ01aRlB5R0xKZGFOZGE2Z0tOMmNDTFZvV2E2?=
 =?utf-8?B?cG1hYlhPY1lnT2c3Y1cxbjhPOTZ6a3oyQzlhV25zSzNJb2IzMS9oTEFIWGlj?=
 =?utf-8?B?ODBGYmtEbDd2WmRDR016M2V1U09PekVkRnAxMVUvWm04eVU0ZDMyejBhMlR3?=
 =?utf-8?B?M2JlV2ZEeTYrRzN6U2plVTdxbklPZ3pOOE1FV1lIUFpDcWtmUWJOYnJweEs4?=
 =?utf-8?B?dTFXV2I4aWdRVllyMUkzMVdIby8wdGoxUlA4OHZHb0p4VGQvMVFlOG9peDcz?=
 =?utf-8?B?Q1FjWDBNOG1aTGtQZ1VsNU1yb0tpbUNlVzFvNEo0bXBaQ1JYbzZnQlBVdlhU?=
 =?utf-8?B?U1RJQVlLbElYdXVkYjdrZ0ZuQWdDNkMzTmM2NVVqZVljVWEyTTUxS3lGQXJk?=
 =?utf-8?B?bkdaM0ZRWHFJRG4zc1UyRmtDTDR1eFZDU0lMK2l4MEJQM0RXWmRnSURrWFBW?=
 =?utf-8?B?c1dWcHFiaEtHeklVZ1VqM2VSMEVDR3h0S3BtdmNMRWxlbDExa0VWOFp3Njhu?=
 =?utf-8?B?RU9LTTRQN3VTM21NanMrajdnVEhscmUvMG9xT1FHRS9XbHFuMGFnK3pqQUVL?=
 =?utf-8?B?WWp2ejc1Z21Hc0w4MVNLcVgyQ2dSOEh2NWxSQkdOV3dmM2ZBNEFJM2FMQWJ6?=
 =?utf-8?B?ZUZiR1R0NkdxYnBhdEhBcFRMRk10N1hsdTZJYk1Sc0xweEdXSk9mdGJOM2Iz?=
 =?utf-8?B?Qmg1d09sWWFzMDRrSjh6SjNRRVlFdVlQdDlnU2NhS1c1TlZ1VUJuQjMyZ1JY?=
 =?utf-8?B?aWVGN0R3N0J2MnJnWERrWWVEaGY0OUZ0dC9ZcmtQbjVqU1U2UDllNCtURDhn?=
 =?utf-8?B?bmJHemU3NmlvS09uNG91M2Zsall5MWEzMEh2SmxwRFF6SFRvb01NRGNMSzZU?=
 =?utf-8?B?emZUZEg2ZU9jSG4yb2NtdWJ3b3pBPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c30b9b5e-c3ae-4a08-ef82-08da02965fe8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 13:03:30.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwP+MEjuyD7hQpmNXwKXb8wljgKwx/l8ZjgsFUeXbsFdp+H/azrxtsQwvypjtlv09lFAMz+fRuEQFcAVO+zbzfON+DRQ2Z/Q3S2d/q1y478=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1641
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Am 09.03.22 um 15:01 schrieb Jagan Teki:
> Hi Frieder,
> 
> On Wed, Mar 9, 2022 at 6:54 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Jagan,
>>
>> Am 03.03.22 um 17:36 schrieb Jagan Teki:
>>> Updated series about drm bridge conversion of exynos dsi.
>>>
>>> Previous version can be accessible, here [1].
>>>
>>> Patch 1: tc358764 panel_bridge API
>>>
>>> Patch 2: connector reset
>>>
>>> Patch 3: bridge attach in MIC
>>>
>>> Patch 4: panel_bridge API
>>>
>>> Patch 5: bridge conversion
>>>
>>> Patch 6: atomic functions
>>>
>>> [1] https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fcover%2F1839&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cc99f637dd67444dfc38208da01d55963%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637824313083236643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qF5bVwelZ35cQQygW3PvPUZkQlyFalUDsyDVjDnngiU%3D&amp;reserved=0
>>>
>>> Any inputs?
>>
>> Thanks for your efforts. I didn't follow the whole history, but I'm
>> looking forward and hope to see upstream support for the i.MX8MM DSIM in
>> the not too distant future.
>>
>> Can you give me a short update about the state of this patchset? Are
>> there still any major obstacles?
>>
>> I can't help with testing on Exynos, but if you have the matching
>> follow-up patches for i.MX8MM support somewhere around I could do some
>> tests with those on i.MX8MM.
> 
> Unfortunately, it is getting slow due to existing exynos dsi drivers.
> Idea is to push exynos and then move the bridge as per Mailing-list
> discussion. I have initial series to support i.MX8MM on linux-next [1]
> which is working on my setup. However I'm waiting for this series to
> move further to send those on the mailing list. Indeed I'm solely
> relaying on Marek testing to move further as I too don't have Exynos
> hardware to validate.

Thanks for the status update. Let's hope Marek or others with access to
the hardware can provide further testing.

And thanks for providing the git tree for i.MX8MM. I will try to do some
tests on our hardware.

Thanks
Frieder
