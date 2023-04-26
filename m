Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5686EFA95
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 21:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58BC10EA00;
	Wed, 26 Apr 2023 19:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808A510EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 19:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfztEn3VbszzN+T/fwWqo/f+lNd/v6x/L8Xjk/QiVaXDqahq1DYRA1zUS7Y4TRhPI+z/Hr6WbcoRi9qnsJqeq/Z+nMoLtXM09TwjmIRAmST+WYHCK0XHRL83BbNoXOL6EhaG0XJMy/wQXpstFx4j1C/PW/sm6RF4llbdwzvtmhxCvitlRdfuiEleEhgHLETqPnU66YvFndqoFZlbKjL+ajcNE3YqGme0vp8FTU3Kq6vnEknKeT+lYBuyMgWHyXMqJPRYtlsykS028iykdv1DuaupC4nfLEOKEn4GhREo2G2q0O2zZLjOZJai9AC8KL4fSvVsUCd4PotPmk1nCQlq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QG6LAhYEEWaLhdrBSwbf+B9rIqmisV7caBrC3i2RlI=;
 b=MVKQ1OVgJtMly6AGdG92ObfeA0NZ5O7f0W6t2WITfRQv+kig8yJqcUni4izq44dJPLAuwANn3tL3I/nmDri+ifPCGCFY7yAllMkdJdVQB5CuB3S7EQS4XMGT7/ZCVc+6wSsjVpYLFmX/tPZ3+ZCxjuyTp2vckF4oGM6xypGJrd81ghf5UJty9RcWf4k9xC1fLUlKowXidXgYUq1WG3q/wETdBN0jMGrCnjJ9IYQ+bQw5LWk8dYP1vHOXlhrYPG6lqvWIWfJOKRSwfGmoc3xsnrnndifxof7rXVmV4IdVIlsExVJzlx1OUha14sL3tFNcBHBVbKnyO3p8loQp7ywySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QG6LAhYEEWaLhdrBSwbf+B9rIqmisV7caBrC3i2RlI=;
 b=nMyMMK9oborVwVpsjrAD79Q3T0T/Arx9vKp9Ze7TsKW6wjW5o20T6uK9DyO+EReD5rvzbA+G7SlOoduPMaPKu/jc2iIV8c5/1b+V9OOdVWtavdn+DkWSvXklSOWKSawhPtIn0fJAgE+V75oicbCZOWEvtk4kT4i7JE3+EPr2IVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 19:03:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 19:03:04 +0000
Message-ID: <066e88f0-366f-f9fc-e0a8-ba60d7777e28@amd.com>
Date: Wed, 26 Apr 2023 21:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: mainline build failure due to 322458c2bb1a ("drm/ttm: Reduce the
 number of used allocation orders for TTM pages")
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <ZEljCgVFnDl/C+l3@debian>
 <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHk-=winmePW-RJdPEE031U=7z92aAv5TAnTU0bR74uEZOMb3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ebec0f-f939-47f2-95f0-08db4688dd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDz0oMocJu9RfnewJJMCBCMYNQcwahZroYaHNylN0ggQY5QJOhwZYKapAov+i5EGWoohtMNqfhms/zeDsgwXWtqXlnm/fh555SYYr30njBrwajsLW5TdvQ4MNgzNsVCejjm7OHi2wfDixC0cXMx6UHdvBLTVEmuklfv3yjJOvETzNY3YSpaIoA/SwdTb9jTcnHgC9kXCVxQYOQSwxKVcf/jEw//cYsX9OeOA992GiA/4UFL6E4NOpBstwQ1V7otsaHMD9sy+QUXfPv0bPI1ijI0WhmF8mJDgkYSi2CtnkasFXqFWA/ACiIOtRa+oBllfKqcZh0zefBm+KmDlOI7134EMkQ5SuKV5VqwLkoDs9+Dm+g0vxmeuRZSb3Uu89iXgYDMNRJT9kDvMAYHoKvm7DFL9z+xXloQZ+INzPlMSnNMS/ZMwNYhmtMBZbUq/umEfG3lLbZCW+d8WTncMyEQctwLmPd7pYN+AWX/n/ZwMV9nZcAqifv8cXPaEaJRxTBzgeEl5Qo1a9R5ajhmxYHncvwBSOS+MEUaeMKRsrFFFvt55QVEGduBIifMh+x9Tjgor+vdLc2Q8DQNnFC+dDU6ouNaN1Q6aoPjW6NNeCx5EaUdBzS3g9/xaTTwZHxfxaz7VFZhLU3CnP8o/Av94oNkOlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(38100700002)(8676002)(8936002)(5660300002)(478600001)(31686004)(53546011)(6512007)(6506007)(2616005)(66946007)(83380400001)(66476007)(66556008)(4326008)(316002)(6486002)(41300700001)(2906002)(6666004)(110136005)(54906003)(86362001)(31696002)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWg0d0hRelkyM0IvWmYzbFppWXZqY1BKT2QxVFpWN0FyMWswQUx0WnNHejJ2?=
 =?utf-8?B?b09STCtxUFN2Mll0OXN6UFFleDRoZEJvTUpCRXQ5WWNsaS9UdEpqOHVZY1JU?=
 =?utf-8?B?eG02UTNhdXBvZTJPdXFqcTVkOVgvN3BHK2hJd2gxTEdkU0VDdTdEdTJuMk16?=
 =?utf-8?B?TjlYMHdpZHFIOEwvVTlBS24xS0Z0Skd6OTViMFhGS0tJcGhja0hsL0RpeG9Z?=
 =?utf-8?B?bnVBTzBnVXRsUEl3TEFqdUVhQ1ZPTURDSzFtOExaZ3Vhbit4Z0V3TTRSRi9i?=
 =?utf-8?B?Lyt2ZGdOaEFiOE5aMlJZMi9DZC9BT3p2OXJ0dStpYWlGckJJQjVGc0ZRUTNM?=
 =?utf-8?B?dEFCeEJVTjlyVmQ4TGREaWdwVVpSd1VLcXNtN1pmTC96cEt3NEJIbFVyNXBB?=
 =?utf-8?B?TkY5R0FjV0xzT0FEeEhIVkRHaG53Vk12UU01MFkzYU95aWVzb1pSTjJuUkE1?=
 =?utf-8?B?OWxTWW9uaUYxelhLM3V2Y2hoNi9UT0J3eFBSOHpjbURoMTNuZGdBbnRueEl0?=
 =?utf-8?B?ZHN2M0M2V0lVbEI2eWVFbWg4cEV4d1VIZi9tejlmb2t4RVN6V3RYNHF5TGUz?=
 =?utf-8?B?TmxvSGU0UEpONEdhMVNHbzRnUFlaUDRHVlNwNTNXZEJ2SGYzNS9qMWpXaURC?=
 =?utf-8?B?dHBLdEZzMjJlVWlXZjdjYVpEbnlDZ0hlNjlSaFpKQk9rZzgwdy9Bb2UwYWto?=
 =?utf-8?B?aXpQbFpUNWF0eDV4WTNBdVMyVFlsMjRIbU83TXM0dkFRTWdaZlVHMGRuc0dO?=
 =?utf-8?B?L2VQVVJDaTdYSWtEMDlZZUFqR09GUTVkSlhQdGVyMlNkQTVzM2NOTi85WDRx?=
 =?utf-8?B?dHFDRjVlQmlIbTlzMjJUL1doNXhUZldCTC93bytHS3Z5d3l3NFloQXRZZklV?=
 =?utf-8?B?VUhycGJWWVlIaTR6dGtsc2grNjRBM3dQc1pUNlRCbE42QzZZTWdZUTVNUkFE?=
 =?utf-8?B?SmNUVWxKSUh1RUJtS3lySDB0OExQWS9qb0FlVU4ybk1jMEtGdmRMa3BTM1hs?=
 =?utf-8?B?WFJ4eWYxU2NZc0YwUTUzNHhnN1JJTjEraVU0UkNOcnRYVm1iK2U4V3ZOVzJt?=
 =?utf-8?B?Z2ZIdEd4eXEySFVFcUdYOHRRYTM3c3RIN1JTNFkyT3lqcUREdyswbGJPVlVZ?=
 =?utf-8?B?OWh1NVNkNytlQ2dlV0lvR0xLSEJhbXlUeXM5OGxqekswUjY5UUw2d0tKZngy?=
 =?utf-8?B?bVZGbWwvSHVsL2RiZXhIVllCeXNwQ0tZanRZRUVmZUtqUUdtVmpoMExmSk1T?=
 =?utf-8?B?TVk4N1VxUHNiZDNJamhYd3ljZ0pkOWlrSzEySFQxV1NYTkM3Z0FERWhWQ3hw?=
 =?utf-8?B?K2NkODJ5dUtyNXBYUzZ5ZlVPOWF3YVJ6R055a2lrNllCQzNGeXlaMUdsWlIy?=
 =?utf-8?B?VjZNNmFPY3pDeUlrSHVXbEtZVGp5Q0VoYVNYZjJxemJyZndMVVBhSWpXcyth?=
 =?utf-8?B?MXBiczd1VG1NMUhSQm10YVZZQXAwK3JpbU8ySDF3ZitwdWFoMEZFaWhyU2Ur?=
 =?utf-8?B?Qzk1RkFWN1NRa1JtRFJrTHd0WFBUcHh6QWFxaDVSUTBSc05WSmlSS0JMMG9q?=
 =?utf-8?B?RXg5b3pYN2VHSFNacmtXRmJhTG9YbS9FMmt3Rlg4Rkp6WHRJdWpqcHh4Zkda?=
 =?utf-8?B?cWdrUUREY1ppbXJCc1NFZ245Z01NdXhQdW9JeEJVSDNHU2Y1RXJDajVUekdW?=
 =?utf-8?B?YTJ6TFR0dS82TmFMVFZJR1B1RWtDYmhuYVRsa3NIbDErUzFYWDk4d2lDSzZh?=
 =?utf-8?B?MEQvWmpOaTI2ZEhwaXhxdkZEMW1iSHdnb1ROdHRzTWg2Y1c3MnRSU00xSE9a?=
 =?utf-8?B?MGl0V1J5Wmk0eFNseUs1OE92bU12UDh4Ym5KRUlFajM5MEVWb3ludlpYYUNm?=
 =?utf-8?B?Q04zZXNUOWlRZlp0RkRvRCtwb0FqTDF2dlRMYXlVQ3l5cnppbSsxWE5RWVFC?=
 =?utf-8?B?VHozeldJNTBablh1OXhpdEp4b3BKaG85NFBsTzF5dzYyVGpGdmhZRGpKM1Jt?=
 =?utf-8?B?K211Rk9uTm00eENsREJPaWp6QWlJYVVEVHJLYlUwQWhmZG45Ly9LUDNZcWVX?=
 =?utf-8?B?YXVZRjE1eHN6MC9vREsvcFExUWNtUjhMMkg4cHQ1U3dNemZPa1R2L2dIbHFh?=
 =?utf-8?B?Q1I5UXJhVVByYTN6VHlLcHdNUklicVZCcFU3a3VWeUdtKy8rNVI3S0RHajN3?=
 =?utf-8?Q?f+j+zBk3a9dX9WTx3iDMYiAbZTBVIKyf4KL2GL+5KxTn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ebec0f-f939-47f2-95f0-08db4688dd3c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 19:03:04.6093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H//4K/ITYMSa6+pc9PK1QI1MK5X8Ec4sZa5uYSRGEE0MPSmy0dWxkAlD9IhhOG9
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.23 um 20:30 schrieb Linus Torvalds:
> On Wed, Apr 26, 2023 at 10:44 AM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>> drivers/gpu/drm/ttm/ttm_pool.c:73:29: error: variably modified 'global_write_combined' at file scope
>>     73 | static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>        |                             ^~~~~~~~~~~~~~~~~~~~~
> Ugh.

Revert of this is patch already on the way to you.

>
> This is because we have
>
>    #define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ?
> __TTM_DIM_ORDER : MAX_ORDER)
>
> which looks perfectly fine as a constant ("pick the smaller of
> MAX_ORDER and __TTM_DIM_ORDER").
>
> But:
>
>    #define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>    #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>
> which still _looks_ fine, but  on 64-bit powerpc, we then have
>
>     #define PTE_INDEX_SIZE  __pte_index_size
>
> so that __TTM_DIM_ORDER constant isn't actually a constant at all.
>
> I would suggest that the DRM code just make those fixed-size arrays
> use "MAX_ORDER", because even though it might be a bit bigger than
> necessary, that's still not a very big constant (ie typically it's
> "11", but it could be up to 64).
>
> It's a bit sad how that macro that _looks_ like a constant (and is one
> pretty much everywhere else) isn't actually constant on powerpc, but
> looking around it looks fairly unavoidable.
>
> Maybe the DRM code could try to avoid using things like PMD_SHIFT entirely?

Yeah we already try very hard to do so.

I quite often have to remind people that the CPU architecture doesn't 
affect how many bits the internal address space of a GPU has and they 
should always assume u64 for those instead of unsigned long.

But I have to agree that it's a bit unexpected that a constant 
everywhere else is not constant on this particular architecture.

Christian.


>
>                  Linus

