Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9274559A6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1796EABD;
	Thu, 18 Nov 2021 11:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78036EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DieY/ZCEq0xnrl/KwjDBgbdvnAbtVu+1XWpF0TEZ91XAAK5xmT6xlBM8tSEOi550zmSyz+mmeLOeF910N0Xuq6QOSWq0a+QlNBDMOhik67ne0rikg4PUMJ8hE/BMt9NfclAyMxiXJ4B5z69KF7vbGt9Qdr2Dz5aPT7K4CdMZ5LG+9Yzta4Eu9Agxuq4x37uIpyqogTtFoEpWRrP1hiOy0FlQBUxetVw+nPxfQ3A42JM4qYSeb5j9saXgMgqZKHyfpOeh/mM4X9ytQ1a007TDLaUQ10SVsdTgQEKdBN8gR5yl/NnQWVWGL1s85NhPuQhhbje14U9kloyWzfJp8RidYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErEAgQK1z+Mv6UCtPqySqPKXW9XddF7MhDbIlfwd1VE=;
 b=W+o8sj1xUoxrDP+Mjfs1nJ3baRvmLu7WLsxLn8CefLXp9ETMUXCZzrlWkWNzmyo2VorDtINWBNq41m9GsDJDnm3Trlk/sn78+wdDePQ4Q4rZ5h7i8bwXjha76FhPSzi61GOyeZzJleZez+YczG7nM8G74Cm/F85RqrQHNRlGLqiiyjhIKy4l2iJC+NrbrfdobECGCcrsAV11fG78PjUq6QjIFkpOpMs2PA9ceHB8lEoDfwkjArh/ZsCGj4d4kjnAZVQTiVKaxXHY7NxAhJvfL6SMkdB5M6Yj7ZUxuJsStk/5sC5iec6wOZRbv22uBsHZVaAsL7EYJVMdh0iWNCaJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErEAgQK1z+Mv6UCtPqySqPKXW9XddF7MhDbIlfwd1VE=;
 b=XBS0BQq6FeG0kdaUz46Q30g/WH4VD+9hEGLQhDU7k9f2gg0pFS+TkJFW6r6eV2Sh5Job4b3CeatRv9kOiJoBZh9FjtazEDzhrYgVLUltwCSuGi2xZIXV6FqQY2qRY2Pqj2S0nzsUuivMCJmDb5WnJp1TOYG1BBplkROztIgh3CM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19)
 by DBBPR08MB4709.eurprd08.prod.outlook.com (2603:10a6:10:f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 11:08:50 +0000
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda]) by DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda%6]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 11:08:50 +0000
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Kever Yang <kever.yang@rock-chips.com>,
 Daniel Stone <daniel@fooishbar.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
 <4310886.V3yF0ifEZO@diego>
 <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
 <fba695b7-863a-c492-0209-41bc07c7baee@rock-chips.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
Message-ID: <b6ab5d5b-53fb-8c07-07c5-644f79cb3277@wolfvision.net>
Date: Thu, 18 Nov 2021 12:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fba695b7-863a-c492-0209-41bc07c7baee@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0701CA0058.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::20) To DBBPR08MB4523.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::19)
MIME-Version: 1.0
Received: from [IPv6:2a05:1141:1c9:7c00:2971:328c:3026:3149]
 (2a05:1141:1c9:7c00:2971:328c:3026:3149) by
 VI1PR0701CA0058.eurprd07.prod.outlook.com (2603:10a6:800:5f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.9 via Frontend
 Transport; Thu, 18 Nov 2021 11:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee3caa0-f15d-4787-47eb-08d9aa83cc85
X-MS-TrafficTypeDiagnostic: DBBPR08MB4709:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4709B2E962F8B96701E4F97DF29B9@DBBPR08MB4709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JEa1rQRf1Yh7Ld7sZT2ry+ukSS40dOyCRRTjEjQHLYnmcrg3RgN5OSiKCVTunYaezLFSzilcHDV4BbUdwTfmr70nG3xjfvDLPllApiAL0osde3hueO0MUX4Ikfi56FIRQtArZvpoaG+MzdwSQuetwLDjq2ymAbQ6ndkruqwTaI3OaGRDrc3QIxbnf6lzx0yw680do4Tbrfhji4/qyxbpyYjfshBVYRMhLFngAVPQm3AvzYv5ohsqveS218LNwYA2UfpqSlRtCMj2pl7mqdd/AS8r5oBgnlM2yA9Cr2Y8Nse6t5jJXQJXCeOr8M6s3BBXsAWtIptcbE+auKAmVDLtQwyi14teIRjqrvgDpoU5c7kQQlb/o0GF1FXMBjKNf5yCGzQ8q5U5yiCPCeuUniZ9Q1+HjjoXFJOsdHkq+jGvvX5QLwaO3shwsNVUlYejmFbU8NEkqHpoHErhhDAz8ejVo5CccyX01sRSnMB+fdpnWXk69SXe57HAuyASNTqOz8YGCb80m5I9O8DbpdBfkQRbbX54TiWdMqRE1NuD5kcQw4qlDgFcXsLLAfsyFXNozuxSrZ7Yj8zj3w2l2CPNT6VIv7tHNl48ba/+tH6mv3VPQbC9e8nyGbT8G/erJ4ySDKPDDz6t1iC4wRH05MWwhkIzL5jvLeCycJvs0D587vUgV7rbWif2OGNKK8e/CHuhNkGUi1tBp72+pUyU3Nq/9xo7liXQsQxEiXNxx5UcG5M3mQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4523.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(316002)(110136005)(7416002)(83380400001)(66574015)(66946007)(36756003)(86362001)(66476007)(66556008)(8936002)(44832011)(54906003)(31696002)(53546011)(4326008)(2616005)(2906002)(508600001)(5660300002)(186003)(8676002)(38100700002)(6486002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmV4MVJSR0pPVHJPOStRWjNBN0hlQVVSeWlYU2I4L05ZZkp5OHJzUFdVSXZZ?=
 =?utf-8?B?azJnY3lWblRhLzdUZkRBRHFzRmNUWkkxQnE0ZEErckFKa3ozdmhTdUd0QjAx?=
 =?utf-8?B?MmJ0MkVsVVN1N2tlUmcyWVNENTdnaDJRRGVRclExelBWSGR2Tzc5UFFpZExZ?=
 =?utf-8?B?MVRvZFJrV2swdDNIWTViNHRuYnZ1ZENXV1Vwa05GQVN6UGxwZE9RRkFKME9s?=
 =?utf-8?B?Nzl5TGh0ZDVoeUJwNXU1Q2N0S0Y0TU9EVHFJNFVqN2wwbWdRWTBMaHBUQ1RJ?=
 =?utf-8?B?TlZxSkcyd3NhYVFTS1dSZS9zM1M2Z2UyZmlVYzRldER4U01Fa3hRMmJhaVAw?=
 =?utf-8?B?clpBa2hSYUlVdUJtQStSSHd6KytrYVFuT2ppQWpoenV1OTNmUG4wN2t1bXZB?=
 =?utf-8?B?Smt3N3I3MzM5cklld2ZhVDhFSUZwQTE0WlJOQWhkOXdnK21Meko1dnBxWmZU?=
 =?utf-8?B?MUhxbWZYUHVkb2gvZEVYN2tZZGtWQXdNRjhwYVc0RlJNU2JtQ3oyd2RDRWNB?=
 =?utf-8?B?dnBSOUU0STVSN1JJZThTRVhEQVJ6NHc1ZW5XMnY1dVJqQVlDaHh4UFo2bjc2?=
 =?utf-8?B?cHJJQUFnQjZvMy9SL3FkRVZHMjFPd2h0TjR6cG8yYlV5dDA3aFN2YVUyT2Z2?=
 =?utf-8?B?TExDSGk5bXE5Q1NMOXJob0VjcnNoS2kvMXY1K0VuaEhWNjlRUHZlNmE2d09L?=
 =?utf-8?B?QUlaaWY4MlJoUGtTdWxNTkJVU0FMUWNoY1FBMStWZG5NMXFzRElaTFR6TStU?=
 =?utf-8?B?SHVmaDA2ZmdwVjlNcGpSMlNadGsrclpxWWMwdG5WTnFoOGp6UkNEMUNRZjJw?=
 =?utf-8?B?WXltUHBoYjByd3gxT2p2Q3hKWFlUOGRSVmQyNnhSUVJKeVhqVXY1SjBES2xh?=
 =?utf-8?B?QzlZOUY1ZUNUV092b2ttMjRwWGxQS1dOUmZsOGhYalBEV091UnhoeFgzNVo2?=
 =?utf-8?B?M1FMK0ZvVExySGF0RzU4MXZST0hrR2NLZlF5YUEvOWhJSXhjQlN2WWdYWkpu?=
 =?utf-8?B?SlAvU1NLM3FxNGR6b0FyRlZheDBsdjNDVDhCRTJERk9rTG1Gd2luSjViWndy?=
 =?utf-8?B?NDlCbkI1UnovRWN2dXoxTGlhcXFJYTlrd2NrbXNSM2tOS2xrQUkrM3cxTENF?=
 =?utf-8?B?S3dSRWQwVFM4OXVSMGdtL1gyK1EwMFdGS1RFRkd2bXVCUVZCR3kzM09WTVcv?=
 =?utf-8?B?Z0dPMUxSalRFbDV1Rm9KaXlDMkhOYVhnUDdJS2ZHMXphTEpJMFRMVlBFY2s4?=
 =?utf-8?B?S1pWVnFlaENoNGVESjFCSUV5WURJam11YlVvNktFem54SXdKd1hKeVh5Wkxu?=
 =?utf-8?B?NERzaVJoMk1CS0xPN2lvWHN2ZllDL1hGQzlna2tXUi9Ic0RVVXpBTW9DWEpS?=
 =?utf-8?B?UThJNloycEVPWlNpU1dUN0dBZ0VlK2RiYlc3MjV0c3NVZzN4R1FsV1hrYWFY?=
 =?utf-8?B?VW5YLzVSc1VOZjBpQWRkYzdhcit6NFo5RndONTVyQ2tWSFJDcmFGK01TOUJX?=
 =?utf-8?B?TGw4UGQwMnFFR1hUdEs2cUJ1ZVdrdVYwM3VXSGtibzAxcnF4VUE4OW5PV0ts?=
 =?utf-8?B?TU9qNVY0a2d6SnRxczZNaUgxUWpYZGtNaUxzR2YyZDFiMFkwekNnVHF1TnJG?=
 =?utf-8?B?YkVkc1NhTDVUd20yc003ZDNrSTVIdy9NUXRraFkyOUd6a1ZOTGlTU1B5TFhR?=
 =?utf-8?B?dVI1OUtsQldUUHFsVUJvcW0xYll2OVR5YStXRlVXY2x6TDlHNmlmdENIVmts?=
 =?utf-8?B?UUVWSzYyMmMyaVJVSDZjaE42RlNFTEFxWnhBRGhrVEc3TE1rVytTOGR0M0Nw?=
 =?utf-8?B?T1RrclMycVFVMWNNSFFFR0luWVdiRXphSTZhTUFSRTM4b3BSc2tRMU1sSjdE?=
 =?utf-8?B?K1dCSlpjMDRKNGRLVldFRnYydys1cDNrNWtaV1owMzVFaUN4K1E4ZVNiWTJw?=
 =?utf-8?B?YnhMTEhtdExPamJxZ1lTQUN0bVRrVlNsME1QU2VTQ245M2RMYnlTVmtqWjIv?=
 =?utf-8?B?dTBxbVhYVTdWSVVlQ3hnK1U3K01qc2FxT0FWcWs2RXpPK1p5dTAxMThObHFH?=
 =?utf-8?B?YWdOMU1MZnVRN2tPWXJ4Z2NaNVNLdUFFWkRqTWdxRi9JWWw5M0g1bTBLdU82?=
 =?utf-8?B?YWpXUS9mei9Qb0hYY0p6RnBkMkJlWjRPeVdWMmQ1ZW1BbjAzdEd3VEg0eUVU?=
 =?utf-8?B?QXd4R241ZE54MTdwWS9RMHI5SXc4elhqbE9OSjA4M1psWTIxcFRmbzJ1aGFE?=
 =?utf-8?B?VXE4amdGSmJUZE5QQnlEb3Fka2ljNWZEWnZ2akVpMmxGOEpyYW1yQ2p4VU5G?=
 =?utf-8?B?MVFmWGh0RnpyRzcxQTlVKzBrd3RuSnkyWUZWYUxNcy9ubkZaVm1JUT09?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee3caa0-f15d-4787-47eb-08d9aa83cc85
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4523.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:08:50.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2asKV8A0ELLihEEhCCIjD5K21XoPeOhvrnbeFYTPi9f6X36JuAepI0146+q6OTE1VGeekhSjk20TkAvgMD+Oy7nlBvXtzJ9QK6dtO05eWUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4709
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Geis <pgwipeout@gmail.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Kever,

On 11/18/21 11:50 AM, Kever Yang wrote:
> 
> On 2021/11/18 下午5:53, Daniel Stone wrote:
>> Hi,
>>
>> On Thu, 18 Nov 2021 at 09:26, Heiko Stübner <heiko@sntech.de> wrote:
>>> Am Donnerstag, 18. November 2021, 02:27:10 CET schrieb Kever Yang:
>>>> I don't agree with this, we do believe you have do some clean up to 
>>>> meet
>>>> the requirement
>>>>
>>>> of upstream, but all the framework and feature implement are from
>>>> Rockchip engineer,
>>>>
>>>> we have made a great effort to make everything work which block us to
>>>> upstream this driver for now.
>>> I don't fully understand what you mean here (language barrier probably),
>>> but dropping non-essential functionality in a first round is pretty 
>>> common
>>> to at least get basic functionality working for everyone. With the 
>>> special
>>> features getting added again in later patches over time. This happenened
>>> on the old vop as well.
>>>
>>> And of course, having a kernel that can "just" do normal graphics 
>>> without
>>> the additional features is still preferable over having _NO_ graphics 
>>> support
>>> at all ;-)
>>>
>>>> NAK for this series.
>>> As you might've seen from previous graphics related patches, there
>>> is a big number of people _and companies_ that seems to want/need
>>> to work with the rk3566/rk3568 with a kernel based on mainline.
>>>
>>> --> Most likely even in real products!
>> Yes, we've been trying to ship a real product based on RK356x. We
>> started by using the vendor VOP2 driver, but it is broken beyond
>> belief. The driver needs a fundamental ground-up rework, and all the
>> additional features get in the way of doing this core rework to make
>> it actually function correctly.
>>
>> So, NAK to the NAK. I would like to see the VOP2 support start simple,
>> with more features being added one by one.
>>
>>> While Rockchip did say that they want to upstream VOP2 support, there
>>> has been _NO_ movement or even information at all on this over at least
>>> the last year(!), so it's pretty understandable that developers will 
>>> do this
>>> themself at some point, because they don't want to wait anymore for
>>> something that might never happen.
>>>
>>> So a simple "NAK" without additional information is not really 
>>> helpful here.
>>>
>>> If you don't like Sascha's series, I really want to know _WHEN_ Rockchip
>>> plans on upstreaming at least basic graphis support themself.
>>>
>>> The kernel is often called a do-ocracy - the one who does the work, gets
>>> to decide. So if you really don't like Sascha's series at all, I do 
>>> expect
>>> Rockchip to step up and provide a solution themself - and in a usable
>>> timeframe.
>> Exactly what Heiko said. If you would like to upstream the driver then
>> that would be fantastic to see, but I'm afraid you do not get to
>> prevent someone else from doing the work themselves.
> 
> First of all, we never stop any one to doing there work on upstream if 
> the source code is write totally by themselves.
> 
> Second, there are also many modules are upstream by developers based on 
> Rockchip source code, please note that
> all of them have basic respect to our work, they do communicate with us 
> first.
> 
> 
> But this committer do not take any respect to our engineers and their 
> hard working:
> - He didn't contact with us;

I approached Andy Yan and you off-list on October 20, 2021 in this 
regard, as Andy mentioned on linux-rockchip in July 2021 some plans to 
bring the driver mainline. Since there was no response, we asked Sascha 
to make this happen.

> - There isn't  any information about original author in the commit message;
>      As I have known, if I use source code from another developer, I 
> need to at least add a "Signed-off-by" with original author;

As has been discussed before, this will be fixed in v2. Simple mistake, 
no harm intended.

> - This commit and mail does not even have a 'CC' to original author.
> 
> I NAK because I  think this is not part of the  open source spirit, and 
> this kind of  behavior should not be encouraged.

It is great to hear that you care about the open source spirit. IMHO 
communication is a big part thereof. If Rockchip would communicate 
better their plans to bring things mainline including a time schedule, 
it would be a lot easier for all of us.

Best regards,
Michael
