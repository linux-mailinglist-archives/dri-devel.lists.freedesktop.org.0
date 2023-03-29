Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80F6CD752
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 12:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A0A10E171;
	Wed, 29 Mar 2023 10:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A7E10E171
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1fWtb9g573lEuecAScAhalz9julKz3PZhD8MJyAIlCcyqxGat+kSr7mYdVZQh04XaDBIAGJjDz0OwEj0YQuPutlsBsq7jhFILMyzkXyaYbBfimjOdHyDj8HWCoAVQ1+5gr2/tLXKq5FGOlIucqk3ys+v2WyudMq3WLseichsvIiT9GlR7RzprlrbVyu4gVomEUx+E0xMAGoLqwlv6VukDzQL577v+6a6R7aTDxRbc4/BUmg1+3VpK5EhkaBiktH6soi2iBeYdNSsCBiRGK9jx1hnAKwqN+DddpqGJNh+aNCDQwZB9PKL+i4OOH1NvsuJ6VDOGDtFYaC2LXDJaBKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp/bCG9xm4RF47OTdoWyFGudWge75Pgk2qC0U7Tbs/U=;
 b=hjUM77EugJBaz2lMh8X9N9D/3A2r8XzKzRjrC7ueNiep4nowEtpOgluceq8DltFqDLCwE00CnA7+5Pt6Fm5SqouAKrKlyC8D995Wz3HBT5XfsMvefjhclJWB+fCPdKb8du3AYJzowkggnW1t9scMyrjJcdu4HGNWq4arRMSoyerWj0gNBWiCkLlOtMfzedTMb0t4401nNglwj1wuJnSvJ9YoQ9r1bjM+hYKhCwt2M1813tTKhxTBvLOSMIFAh9Jz9rpZpgNahzzcjJ9nl3+Ik/VcfAfaXUo0IZml6JGcwx5sF4W+YX91OSps9j53EF8MzqvLSECEhzXjIP7FMAKwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vp/bCG9xm4RF47OTdoWyFGudWge75Pgk2qC0U7Tbs/U=;
 b=IdQbqB8GQ9gog6rtMrCUgiezZfAL8GPYMzb3yBer4Gl2kbss0GeeL4l5z7h34/H2/LpkX/UJ6AWPoRNtzbtcMJiNBshc304MP0pF1zVwGpCYlhk6roBwhnvP3kzGzx1WkFGALJNioL/lNmS22Ez+hdGYVx2dGredaGUhI5YPEQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9651.eurprd08.prod.outlook.com (2603:10a6:102:31b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:08:53 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:08:53 +0000
Message-ID: <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
Date: Wed, 29 Mar 2023 12:08:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
To: Maxime Ripard <maxime@cerno.tech>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20230329091636.mu6ml3gvw5mvkhm4@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::48) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aa7471-7e3b-4251-23a8-08db303d99cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiU9aPwfOWijZvgRLyUxwRXLig3j5qqa/GFjkDAPaoE6paZVEAsIh7RP9rT1zy9sDN0x7GzeRrrvrumHk211a0AJwLdI2FSyrc98/VHwf8Q6g4qnsqSv+6OvN0cJhfLCZ0HL15spyb0AqrMnUBvIosHFFU34Yzib2xZLiU4HhUYlrFkVbk2ZAXHmHiC1UwWN4JXjosC1uAMSQFMt1BezYTtiiwEy+hPF7f0It8bddKA67WkARRG/LBA1tV2GgKgiVeKfzf1vAK54ZGYC+dnmMxMdvRujtz5Qkq1ZU2Wd16DFgD+W0CSbDXBe5YqFnoeovlS/hJHPxl/EMk2R9WSxBO486U3beDLO6prssOqbrt6kyU7iG7EGddCSMunJfCtXjOom6PJeeJtiWET7NJgNzfzAfi8JBY2VXjjWqNypW7AceUvVQIUfeLvr9MhURviQ7aWTluA7DwsCYn1i2jHtOttOXxFs+qMxeemLmtrGybrAJFAwwCfTSsdJ3sQKQwk1GY1hc8VzvWP6haice1bLTqMuLFwCLwno7P1bUtElpDgM7cMx9S1B2G9iIupzudVR4abgbUPD2ksM7lAXyWwoxXWtGaHZ+7uamHxho2sUNoGlfNX1Q7oqhmdBjA4US2UrFChu54zwgKm+13+1NPXvnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199021)(478600001)(54906003)(36916002)(86362001)(2616005)(26005)(6512007)(31686004)(53546011)(6506007)(316002)(38100700002)(31696002)(6486002)(66899021)(66946007)(6916009)(4326008)(66476007)(186003)(66556008)(7416002)(83380400001)(41300700001)(8936002)(8676002)(2906002)(5660300002)(36756003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFRURHNNU29Lc2gyZGdFM2Q5K3pUNjRMV1pFZlpiMHMzbVJQQ0FqV2JIM0ls?=
 =?utf-8?B?YU5BMnhjVFBtWnJEZFdrZXg2KzZjSkp4aUV4SjhNaC80WU9Zc0w2MWgvZW1D?=
 =?utf-8?B?cGp2YndVbm1kMFVRY0FiMll4cElVN1l3UFplcWp2WUFsWDRwN1ZCNFdqR29J?=
 =?utf-8?B?b2FMYzhvMUVlMUF1V2VKUU9vcHVjcFliNVNMdHl1SzhkTVpKNzc2bWJFeVd1?=
 =?utf-8?B?NGM5MDNkaS95VGpCTlNPMWVoQnhvTEhocVkxRGVhYmx0MzNEN214ZEc3Sm5M?=
 =?utf-8?B?L0laNjVuM0l6cXlaWnp3RkhoSGNNOFAvbE5tQXphWm5jbkxtcWR0OWFOd3FB?=
 =?utf-8?B?ZDgrWXdBa2M4bGlRdUpBbkdRUVNuamNRMEJFUDNtRlVtMElJMWY0aE9md0RR?=
 =?utf-8?B?L3NCelZrRWswWVVHeVNlWmhvRHFEbDdTdlZxd2toelNRbFR5SkV6bkQ4R0hq?=
 =?utf-8?B?OXp1TTBYRWlSN1laanVCNFh6WlBZMVMrZklleHYwMzBwWVltcFNQRCtINlNW?=
 =?utf-8?B?Q1NKcDE0YlhDRm9FYnpwbUxIdXhYbFJ5Y3dnd29FY3ZHdFNCNzBmWUp2Tzcy?=
 =?utf-8?B?NXR3UTlMVWtXRTFBWGd0K3pLc283L2VnQmNKWXZqMTNac1lGa0JqN1B3ZzZZ?=
 =?utf-8?B?OGl6clRiWVd5aDhBZmVtSGNuaG9Od0sxSnk5Q0luTVJnR0ZqWXI4SmVET0d3?=
 =?utf-8?B?MVZRV240cG1FanhFRzJVL3F4QURma25TZTBCQnpDTkE5S1JwejBlWWFBR09m?=
 =?utf-8?B?c3hyWVl3WHFHdElDOUtpcW9oR0xvMkUxVXJrQUlLYnM1cElLWXdleVZZbTN0?=
 =?utf-8?B?NHJuaDJIK1QzVkdjclVVb1k1Ykd3RGdwQjljMWxtci9MRWVKS3NzVE9MOFF5?=
 =?utf-8?B?YURRaDJHZWRLQW5zOWNzV1NSWlBNTTZEQlhob2ZVS1ZUcGYwQzNqbTJ4SW9u?=
 =?utf-8?B?dVhSTW1hUzRlWWovNW0yRktOVkp2WEhHSk4ydUUzU01VQ2hjQlB3RzNsVzVl?=
 =?utf-8?B?Z2J4ZTFFaFJzZ0J4ak4vdW16djBkbnJuY0REMml4ZUhVV2JBTk0wR1BnY2Vq?=
 =?utf-8?B?cHAxMWZnQ1JJSWdyamhLdUNyT1RUeTMzSUNRVElNMWxwb2lHNytvNmFaQXpy?=
 =?utf-8?B?ckh5YTY1MkpwN001UmJmKy9YS2JEb1B3aDFwTDVsbmx5STl0YkV4NUw0dmx5?=
 =?utf-8?B?bFZmSVIzNkZ0REJ0UTdRU1ZZbi9QSEdVWmhXWmlIdFdnYjZEQWRpV0tLS0xi?=
 =?utf-8?B?K0NkZXBKcW5jaTQwOWNvN2NVT0k3WTkwdm82bU54NUVRVThyM05vdFlHWEVL?=
 =?utf-8?B?MkgrZk9Vc2RVZkdsTmI1bEFuNDA5TzhveFRERy9yZmxzQUcycGN5NTMvYzR4?=
 =?utf-8?B?Tlk0SllPMHBhOTJKVjhrTERMeS9NcmxRTVZJUGhmZ0pBUkRmOUozK2RqRjcz?=
 =?utf-8?B?ZDFUcmVIclMzR1orVEZoZUFDUEovQXBwTTU2UEphUG5KS0NlOTJMVWlJZS9Q?=
 =?utf-8?B?WG4rWElEbjNYeTNIM0hhV3JKdnJSZkJmbDlIejJOckFiL2JwbVNWYXpYaWx6?=
 =?utf-8?B?emM1c1kxOU1VME5kNGZUbWNvVXdmcVlxazdTSmNMaWpqTVZwckJuQmdpaEJs?=
 =?utf-8?B?bUk4a3pncWhwcmNIVzB3dWVCcGVvUUx3dWFJeUZQc3RTMUlmVm5zUnhab21J?=
 =?utf-8?B?K3FMNENrOVdQWDNITm9xcFlSanNDWUhuS2QzQkN5U0xZcFVseSsvNE15Mlpy?=
 =?utf-8?B?RkQ1aVlYM25tYlZKNDVEbjNRNWR3Nms4SURwaXU5cTE3YmxUNHRyc1F1eE5I?=
 =?utf-8?B?LzRURlYzU01rT0ZSTUQ5SjJqZ3AzR2NGMkZMbkVDalRScDUyMGlFNzViYVhl?=
 =?utf-8?B?UzVxdmdGbnU3Y1E1N2tmTWgybDNpbVpvRlBOcVdmckFpdEtTd244RDc5aFZX?=
 =?utf-8?B?ZzBReml0WWg5RUR1QUVzVWYzbFpDYVZuRVBPUVZnMTRyRFZ4V2orVG40WjNM?=
 =?utf-8?B?QzBVQ3ZWWDR4K1YveHczR0c1eXB3UGxmRnZFeVlqS3NGYVZrbFRDbHFOM0Js?=
 =?utf-8?B?aWl6SEsxR3hrT2ZsYi9LTXBNZFlzSTBCdGdnMkZyY1E3dFpIaEl0bHRldkNX?=
 =?utf-8?B?R0gzVGRteDhSS21QZFN2NERkRm5aVS9URmRZelVPT0dSa1VGY0dJRmNKWGl3?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aa7471-7e3b-4251-23a8-08db303d99cd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:08:53.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMCTc5/cyzw9HBLGzmFStNyHcwUQvbCAo4DShgmwsPKusWHZ1/yk/p0iul8gMAr0dazfrkTTOw+rPugl1Fc5qRXSHdmfcZ2qPjZh4q1wAl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9651
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 3/29/23 11:16, Maxime Ripard wrote:
> On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
>> Hi Rob,
>>
>> On 3/16/23 22:57, Rob Herring wrote:
>>> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
>>>> The sitronix-st7789v driver now considers the panel-timing property.
>>>
>>> I read the patch for that and still don't know 'why'. Commit messages 
>>> should answer why.
>>>
>>>> Add the property to the documentation.
>>>
>>> We generally don't put timings in DT for panels. Why is this one 
>>> special?
>>
>> For now, having the timings in the device tree allows for setting the
>> hsync/vsync/de polarity.
>>
>> As a next step, we aim to implement the partial mode feature of this
>> panel. It is possible to use only a certain region of the panel, which
>> is helpful e.g., when a part of the panel is occluded and should not be
>> considered by DRM. We thought that this could be specified as timing in DT.
>>
>> (The hactive and vactive properties serve as dimensions of this certain
>> region, of course. We still need to specify somehow the position of the
>> region. Maybe with additional properties hactive-start and vactive-start?)
>>
>> What do you think about that?
> 
> I don't see why we would need the device tree to support that. What you
> described is essentially what overscan is for HDMI/analog output, and we
> already have everything to deal with overscan properly in KMS.

Thanks for your response, but I am afraid I don't quite follow.

How are we supposed to expose control over the hsync/vsync/data enable
polarity? I only know that the display controller and the panel need to
agree on a setting that works for both. What is the canonical way to do
this?

A different question is the partial mode, for which (IIUC) you suggest
the overscan feature. As I have never heard of this before, it would be
very nice if you could point me to some examples. Where would the
effective resolution be set in this case?

We thought that this should enter the device tree as in our case the
display is partially occluded due to hardware constraints. For the user
there is only one reasonable configuration.

Alternatively, we could follow a different approach and handle a
separate compatible in the panel driver. Would this be acceptable for
mainline inclusion?

Best regards,
Michael
