Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBD93A16EE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681D6E41D;
	Wed,  9 Jun 2021 14:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427956E4E3;
 Wed,  9 Jun 2021 14:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrrFdLsVgqJ+L58cTrGpyRdu+Sz8gy9VHj8nDxrmzwi7FQohXD+xgAIEuCis5sSUOawyJpiAgKSYP1DoWhGIdYQ//5GlxKxHziSbgAqbMzrBxm2c5dHXANMkNje6pP9zJyrDuCQq8R+Yw43RxdJSGyADd/EiDqyKCuDl0phUxwG4+9KgMOy7GmHNz6nAaxhBzdpWVAHoQNpvW5v96OTZswCFaJt6PzLEtgA1HjlQYNFnSepVvis5crPCBjPcE3trZ9H55BTbwz1MzmFgPJYlxlPS2MZv2jb1vU7u5iB8PPtH8xWduuCErw0E8uF0iNpzHr8NStExqlYlqgOL6q1SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opJFhbYtoNjag0wqv6IWmVtTMd0e2q8+Z1Fa63lqZhE=;
 b=G8uXye9S9P33xaybYGVEufppFHbFAhgf1K4lvgs0dkoGXjVShMEHQvOqY8NLoh5a5iPJw7HZqHbdzi1JPstnzQzGWJqgnaKtheOpnrfXANb8BITMl8jJXG4CPr0HW54a23Y+AJbah10ptGFyTTXRc0Gi4ycmDZFhI8SWnLlD1vgKxgcNYBMcH0xEgH/gSOArFWpv4rguR24585UEeJgHX11banAnLRWlgQrpV4o+SeHmMrcfx9sGHcpAPmwDmYFWcQ5RhUjpg9v3X/npweAu6oISZTBsAhXNa4WDzy44Tu6zAFHfpHEg46DUdzS55zRGTz1v6YBHppDVMqL0ta0Kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opJFhbYtoNjag0wqv6IWmVtTMd0e2q8+Z1Fa63lqZhE=;
 b=Rdy2eHJlk/iLbPTSogXGJ1R7rsyrMj3tM7vukIGipoBW28+G0cSJBkAudlW9zB0jKAn1iOnPfGrwOttiX5retAG0a13LuLolEV6JiVjRCGSI5R2GUw2CiQulUi0oPrmg4plfWAmXMsoWmDrxYVB5HHLguxqlAQ4IV50gjYyoLxo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 14:17:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 14:17:59 +0000
Subject: Re: Trouble with TTM patches w/nouveau in linux-next
To: Mikko Perttunen <cyndis@kapsi.fi>
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
Date: Wed, 9 Jun 2021 16:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 PR3P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 9 Jun 2021 14:17:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de66b01c-5bd0-4587-1152-08d92b51625a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49329150FCE9CD1D58DDF9AF83369@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjOK1xGJIfAHM0NuE4/ieLtpcC1C0QYbrL2D04cUGmmMewGC0//nk4kgYnt4Zg/soT8tP9XMWi15bukzVm+wAdqvhFyxg+zcPZS4WOtEt9wq/mAfmIppTtfFOkj27NpVIQ5GDCI/UKr63ar0GzwvFaGTPVEl3qE17mX6RP6mXMdV/SvA+++WH1XkhCZ4a+OoGW0PEvYSHcXUa95+6yU806HYMXdeirrEcoTTqiCw+AajLsCRnDsEUAbOk1BFvl+4MpY5LZyiykp5ZU5ONuNhip+TufRx6HaoO8M8tffJ4ZuBIBMoobVHA41Yyv1O17qaN9IWwQ84VsxZe5WKDQpzYm7OtDDp+RZa55VQb/lJxy67p8Y0MbnbBn3Ngn7aVCXcx8a3tZUlk99MSz94jvfBgMn6+xWHznxuy977QMl4bbT2v1B1BxauuVrScjm91Q1F9ggyk9dWqF5KWlmJKRXpEHpHDJmcWGunJwrY++R3ViAsFlF5k5l3ognjH0tPVVeB2Oaisya51brmKpkvqwMajPGrFSLHApBbLEpyoMPITBhkrh2fKi5BI/5/HFALZQTCAsU7GwVr5PMwohXq+nsfLdmZXiTviyA8XbZedxaJp/XtAfkjq+f/Cg0OBY+sX3porp+EhYysVAj/XqQkv10RJFI8WHKCFpLHricKi9MlaemHi7fxxBdk4Dh9KwD+ais3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(31686004)(8676002)(2906002)(66556008)(6486002)(54906003)(186003)(16526019)(5660300002)(36756003)(4326008)(2616005)(38100700002)(316002)(478600001)(83380400001)(31696002)(8936002)(66476007)(6666004)(6916009)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXM2cmZVVXN0UU56ckQ2Ym1ROU51VnkweHlsMHhUL2QrK1JIUW1QMk5halN5?=
 =?utf-8?B?c05GeUlPQ1NFSGNucG04L0hmcnI5em9sQ3g4ekErVDhJT3lsVnFMMVFValpJ?=
 =?utf-8?B?dDM2ejNrcjkwNjVtRTJOOTdqYjdXMnI3OElhazM0TXhTM01YNEN0WCtxcnhq?=
 =?utf-8?B?ZDRpcldDelhIbUIvSlJ5OUJEUXRVZUo0bEF2OXVzd2NBcE5nQUxuYVl1bjJR?=
 =?utf-8?B?bXJDQndGbWRVc1JhbEFnbEcvSDBERmwyY0VHaCsxeHMyejVnNUI1MThBRkVm?=
 =?utf-8?B?YTlhM1h1MDFTcUlrWVNKU0MzajNaUWhwZFhDT2syK3BKRHd6QWlzWHlIbzMz?=
 =?utf-8?B?cUZlNmxPNUlia3hNeHZWQ1lFVDhZdGFMc2l4RzIrRjB1anN2RzAvZjVsVWxK?=
 =?utf-8?B?SXRsZUNDQm4wN2xvVGdCWFdIV2cydTZJVEJtelFVZkVKOUF3MmlKN0RyTXpm?=
 =?utf-8?B?NjBtdC9WZjU1V1pTVUNZejQveDZFM0lDOFpyeFF2U1FRQ0gzdXZVTFArbjJr?=
 =?utf-8?B?RExPNzBFNVVrM0xLc0YzUmxVa29lZWN0NTFFNURrL1hWMzNDb1VLT0VXTmZL?=
 =?utf-8?B?eHAxT3MrMlRFTWg0UkJ4azBwcm8xOGdyczhscDI5RTM4YzlCR2FlKytITmx5?=
 =?utf-8?B?VTdNbTkrT0RzYjFtZGhJc3p1cWh0c252eU9nbHVkbmJBempuTUFIYW9rM1o3?=
 =?utf-8?B?QmxpV1BCV0ZrdFFYdDBWY3lONFNqK0ZLdjNVYjJGS2c0VzVWNndUMXhaeUUy?=
 =?utf-8?B?VEJFRUQzK3JPZHkxZksvY3hXMWh4aVZlNGlOdzllY0dLZEV5azVxNm1CNXll?=
 =?utf-8?B?aWI5Q2hLRFVIOUhWNEpjaEozWXY0TmwrWVRkdSs0RXpwdWpyVnduZ2JSa2Zi?=
 =?utf-8?B?QU5jUzEzSFI3NHYzVnBsZWs3S284NlZwRHp5b2JmTkk3SXRlVFo4WlpYMzc2?=
 =?utf-8?B?R2dhNUR2VC8zUFh0d1lmcU84ZUs5Vi9IYTRpWjhpZlBnYU8yR0h2NVBCSTlN?=
 =?utf-8?B?TmZucHRjeHlZSVZiOE5aK2FMRDV0TjB5NkQzb3dJL2owVkNoa0J1a0k5c0dY?=
 =?utf-8?B?Z2tmazNTYXVCQk9EbGdKWnUwK0tDK1JydFVicEg2VE9qZ3hieC9aWlg5blpH?=
 =?utf-8?B?elVFdHBWMk1IdmU2bDZXYXIwbGhSd3RLTFYvYlBVa3NEOUhybnVaQU5PYjQ3?=
 =?utf-8?B?RTNnMUV0a0ZkcjdnVi85cnROWlN6bVE0M1FDQlJ4Yy9EdHlLWnlFdUFyQ3Bu?=
 =?utf-8?B?TllPaWpQRDEySG0zcHp6ZEViaHpWY3RZU2RNcnJXeFNJMjM5MkNtbFArTm1z?=
 =?utf-8?B?RzZFRzRGZ0E4R0lSLzJKV1ZUY29ubVM0QmZGdnVWb3RuM21nVFZTUUdDMEdn?=
 =?utf-8?B?NDNmdlJRNURjZXpJbUorNFN4K1FzNTdsck9CUVIyRzlRZWkzckRQNXJVN3Vh?=
 =?utf-8?B?anVXMndPOTBlSXFBV3o3UWN4djNEM2xJeVlwdERFR3lPdC9TTUpxTzdrMnRZ?=
 =?utf-8?B?M2FQaWlVelk3ellLTE5uZUZWTWRsNEV5eXI5VGFXRXFTWFZyQ1BtVDlrUVZH?=
 =?utf-8?B?UlZQS2lNc1lTYmI3a1pqRFFFdXhBZXdUVXhzeGVCR3JmZDhCT0ttVXFSa2hh?=
 =?utf-8?B?RlFyOFB0dEc4aFZrandUTGM0c2Y5ZUVvWlpLOEdGK3NlanJ0U3JCZ3V2VTQ4?=
 =?utf-8?B?R1FlVzY5UDF5TE9rVXhiMEQzd0FTbVFYSDdhWXpNNHVKczM4STYwSVNUK29w?=
 =?utf-8?B?UzkyN0lXcDBvbkU5eFRNNzBWb0k2SmxETkgwZE9reWpQbFZKRVgrb0hYK0E5?=
 =?utf-8?B?NjdLNlp0UG9PVU5vU2hMYUUvVFZIY0h1alZBYTNOZHI2K0hxSmF0ZUdOTm90?=
 =?utf-8?Q?we5jmjHY0Zn2E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de66b01c-5bd0-4587-1152-08d92b51625a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 14:17:59.4229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAgDE63dlyXzQp2AhrxpDnqDuVFVlJ44F7KLr6RsTH776cY+kST5bClwi6Q03ChC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: linux-tegra <linux-tegra@vger.kernel.org>, nouveau@lists.freedesktop.org,
 ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikko,

strange sounds like Nouveau was somehow also using the GEM workaround 
for VMWGFX as well.

But -12 means -ENOMEM which doesn't fits into the picture.

I will try with a G710, but if that doesn't yields anything I need some 
more input from you.

Thanks for the report,
Christian.


Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
> Hi,
>
> I'm observing nouveau not initializing recently on linux-next on my 
> Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is 
> failing when initializing the sync subsystem:
>
> [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync 
> subsystem, -28
>
> I have been bisecting and I have found two patches that affect this. 
> Firstly, things first break on
>
> d02117f8efaa drm/ttm: remove special handling for non GEM drivers
>
> starting to return error code -12. Then, at
>
> d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
>
> the error code changes to the above -28.
>
> If I checkout one commit prior to d79025c7f5e3 and revert 
> d02117f8efaa, things work again. There are a bunch of other TTM 
> commits between this and HEAD, so reverting these on top of HEAD 
> doesn't work. However, I checked that both yesterday's and today's 
> nexts are also broken.
>
> Thank you,
> Mikko
>

