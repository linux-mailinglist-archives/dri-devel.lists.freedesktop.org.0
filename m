Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E7B3C2A64
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947DB6E9F9;
	Fri,  9 Jul 2021 20:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10FC6E9F9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRAT1raCPmIyXbtjGU9TdvBIoypi2WWhwjeJSA7NCv81S1OQLIFTmzp++UHw/Ev2nkdLyMPP1XHFa/yDgqDPQZKm0L1lah6wpXKgjQBUfvm0y4nFIXh4rEmm4Z+GeeBoiMq75GPGlEg5YO9ZVO0Dvkfp8nueMnhtNBxh+2go8RQ3IxmF+Y0Lj1qX//8i2cXn3bu0PD0j20r+TrHKTgaPwdfG/94fVLwLgvFfi2ct/oUmXklbnnHHgtHkExYSA0hprmWjqnIt/vTGCrsBBXMjCjaIrxZ1gtnjw4zyxELlBo2vx92qUxo4saKo3E+VbuwCpHzu1E9GpwvZ1I5z0GYPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7Vp/4HQIWFfY5yoxpf+6J88sNAsuJl6x6vSs94Un8=;
 b=IHPdmVyO8PfOJGG15oy5xDkZxC7/CJPfzjlejA2nBP9WUX1kg78RsF3Ur42RAxaWDE1UJRNljYI7Ia9pMtFMQSujg8aEiTgvKQH05oufCi+iJP0GZ6LKunSwTZE62he0HmYk1jiy/KjLurN5sDLZCvJ4hW4XXoR+b/ecsErkaqJl7iwlDjOVJbMh/PTTVp+W9N6DJtrpznHpIiExLvN7lJBjhoNPBIdc4JqjbHORuQhIrqKUqcHeFiwjgd1GZ37bnTDhq6DJ3XCIEPUdlfDyiC0K5tAliv7pJFKTRfECv3fY2PVkyIp0Cbr/XwMIE3M/cLRALecLoPRm/6Ag6szEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7Vp/4HQIWFfY5yoxpf+6J88sNAsuJl6x6vSs94Un8=;
 b=L34dtQOSR+Rzaxrk3QNKDu7oGflk2ZZ3UHKMNhluVjbdYmqw5hdPNE8QyjGM6mfCE/xa9Q+EgFb8xvZEWrOD4vrBsFvE4HUNhfEIgEWW3ysc40GDhF4X9jMpv6k3s+guEsYzp+JvXqRI8ZBO2a3hKlRR9onGAQqEDrNdTktbOVk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=vmware.com; 
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6559.namprd05.prod.outlook.com (2603:10b6:208:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.12; Fri, 9 Jul
 2021 20:34:10 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c%5]) with mapi id 15.20.4331.014; Fri, 9 Jul 2021
 20:34:10 +0000
Subject: Re: [PATCH v1] fix vmwgfx compilation error due to a missing include
To: Dave Airlie <airlied@gmail.com>, Tong Zhang <ztong0001@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210709180944.2533114-1-ztong0001@gmail.com>
 <CAPM=9twS2B-bY8_AxB0mEVtr_2N3y3AyWjL2SNvOHA8tSMRSMQ@mail.gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <92f31b07-8a3b-6d01-62a6-a0ebd6c0142d@vmware.com>
Date: Fri, 9 Jul 2021 16:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAPM=9twS2B-bY8_AxB0mEVtr_2N3y3AyWjL2SNvOHA8tSMRSMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR01CA0033.prod.exchangelabs.com (2603:10b6:300:101::19)
 To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MWHPR01CA0033.prod.exchangelabs.com (2603:10b6:300:101::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 20:34:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a5e721-eaf3-4960-858d-08d94318e7fb
X-MS-TrafficTypeDiagnostic: MN2PR05MB6559:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB6559FFD2615F61C36F5A4AA5CE189@MN2PR05MB6559.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YFFvKVQIqJADDWLYk8jF5U8ozEI7sTAp8SBTF1x7vuSVne2ohdWrsqHqrwVXOLpoD+6/PND8J230HRoAc6B04Jxaxts29NeP7IjRTuxXZ/aNFB56dmTHy4O1Kn71rg5yzabxczFMaGZBJcejsajNqfcdC9KLIRJ112/97g1A1HA58FcZ5q7HW7cpxzK4mWp2+PM68VPpWLb5+ZeHviDS7DePdoj2S/6FLcwj6ULENvQ7LXNIxHQkcx/hvTEGTcullqRlJlDvXGOPyvRDHyVv3sUstqu0+w0f2UAvpCXtgz7jWTFUulgVdn5FwSbRP3k8BoYDIhN2AkHc5J5mMhpT5Ov2Hv8a72X0votR4klxF6TK1OTwOpzZXuQ72eimWKoziGOLKhMyqV+58z0L7Ux70vwxfAIXKfnp0flvR6uJ7ut81MfT6Irg9fhMAD2MYVOOKxbavIt029KZJj0tUv+bc1Z0lJQIn+sE/khT2io+HeYZzwEHTWbIi0naJezcoKgEjFsuIdCLhhc8e3eOHw+BKXQhJgkUk4jlDixmYh1+EJY+aEnuXq2Fw4VrLLGfELTiQuh4J2/UE8ifEQcBoPcQMQSHFqOwMPYV0dD44CAExTsrdmPx11CUQG/ugURpOofjTeZm4Wp4JN9IfMy5Vo9P3cLE0ph46/KMUP6/nyqP4i8u3ZdyhcipM3QvaoiKkN0/KFBZmnzxQFxAuLE4Ik86+QVpJnhn7zkay/JKs2owehQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(66946007)(8936002)(54906003)(956004)(6666004)(2616005)(31686004)(83380400001)(26005)(110136005)(2906002)(38100700002)(4744005)(53546011)(4326008)(66476007)(66556008)(478600001)(5660300002)(186003)(8676002)(86362001)(6486002)(16576012)(36756003)(316002)(31696002)(40753002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzFFazBiNE1wY2lsT1ZBSmcrajJjR0dKM0ZkbjZwUlg0ODV5MG80dVlxcGU5?=
 =?utf-8?B?Rk5YaVpnNE1wUTJqTFpIbU9HU0hLL1Z5VFlwUGszRk9lbWtyUjhlald4MXlo?=
 =?utf-8?B?eHhIY0d4Q3dZWm5ldnRxWkZLQ28yK2pNTTJOa3p0aVc1Y3l5OE5TMVVDbW5G?=
 =?utf-8?B?QVhSZHNsdFh0WnNxanV1MlpabmtDU2NGNDdCYTVjWVluNncvK1ZBRHJkWDYv?=
 =?utf-8?B?b1d1d2hHb2hFMXhXb2FwOWVWeHk0QStSWjJTck5nN05lbTl0MWFnMGNxbHIx?=
 =?utf-8?B?Z1pUVWdZUU00UTNNaGM5QVpxSjdFN1NNMTZkTmpyeEQxTmNNeldhVEtheGJQ?=
 =?utf-8?B?MDc2eDlianZyR1VNR0V3dlJFVVN1ZnRMNlY2UnZkNE9RNzdQQmNhbjZEUGla?=
 =?utf-8?B?NksybTJMZHNtR1ZGTFFrZUZ4T3J6OWNYSGwwSXhubUpYY0ZlQThXVEpVamsx?=
 =?utf-8?B?Q0h1R0lqVVc3MjhYL01YcnZWMUJrSHQxQ2ppc0VRQkM5K3IrRHNMd3VkQXlw?=
 =?utf-8?B?RkRiSUNuZmVxQXFmZmcyeGdGdHdnR1AvTHJob1lQUkNmQTVVaHl2ZUR2ekw1?=
 =?utf-8?B?MTJEUkI3Tkw0dEFURVJBRjVYNWJJRDBhYUVMdGtRSzdjT05IU1pZRTVJSU55?=
 =?utf-8?B?bVFaMWF4NW1uQksxU2crMmJmVzB2dWsrdWFkbHF4MEh1SXpVUFFXRDlpaU5y?=
 =?utf-8?B?d2hjYjk2NUtXMWJnRm1oZXAyRlEvelEzOGJCVnJTMjQzNnN1SmsySVY4K0oz?=
 =?utf-8?B?K1pSOHBNWk05dWdYZldVOUtwNU5YTlZhYU9INEgzWllFOWR5Qmp6U2dUSTQ1?=
 =?utf-8?B?b1F0bS90YldPTHNKYUk5YmVnQUFjRVdvL3JrL0E5Q1Fxa2k4YWppeGNPYUZE?=
 =?utf-8?B?d3NVYnllMXZNV2FZRmNZdmY1b0M5K2NwMnYzNzBoMlU5WW5tTW9iZ1pDQktp?=
 =?utf-8?B?VC93UGQ1c1NFMUxtL1FNMTJKS1FGS01FZ210QlROVnJMM0prcTlvVHNyLzVY?=
 =?utf-8?B?alZQVTV2SzFlM0NxemcwVXczMm8zeWRhU1J0TXdPMlc0ZkZUUGFmZTBTL1Jy?=
 =?utf-8?B?RXhGZGkwdlljcDFaNGFNWDdXQzFSNWtGelhFTXNvSkUyN3V5bWlqaFVLeTBt?=
 =?utf-8?B?WS9sZVVDWHQxeitFczdxNkJLb3BoNENOVHhJVWtvZ1lHOG9HVERtMDdrZFFm?=
 =?utf-8?B?dXRYWEtPazkrRTh5blVTUnFITDB4YlZhbHZiZytIQXBtWVFOZ1VOQVV6aWNn?=
 =?utf-8?B?ZC9qeS90eE8zdlp6Z1BEZ0JnZkhnMWlNM3FVYVVUVUQxWWI1ZVc1VUhueWlz?=
 =?utf-8?B?bFhnSGVEV0w5eVJwWE1hRzIzNW1yaWpyVXZmOVdPOENRYTFSdTUrK05YZDBl?=
 =?utf-8?B?K0syUm1iZ3RTWnFZaXJXNkczY1JkQk9lS1NhMUFMOFNQczAzTW5ITXhQWkFI?=
 =?utf-8?B?MlBUdWpNSUFmSHYyTGkvOEJtaFlzTDFTSDRPbDRsRzkvTC9xcjlWQis5cFRP?=
 =?utf-8?B?bXNlUG9kRTloWjZQdkhvTFpIVlZzSzJFNGVSUFJSQ2V4Z0hablRKRmIzQWI4?=
 =?utf-8?B?TThrQjBDbmpBQ1RGbjlUN2gwa0grb0g4ejZsNWRMaUFDVjg5WDE5ZDRXQnRx?=
 =?utf-8?B?bTFtU0xpVUVaTmlzVys3OENBK1F4aE05N09oUGRvWWhITUZiWGVxeityc0V3?=
 =?utf-8?B?T0hpTXZoTVFLR214MzU1Y0NIaXRtc0lLZlU2UElaZFNobjlBR3o4RGR5em9v?=
 =?utf-8?Q?paIzJmnhzf0874tOwh6hOChVG3gkGoyuiDmvvWe?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a5e721-eaf3-4960-858d-08d94318e7fb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 20:34:10.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KV1djc8KEjkijrp4QVsfY97bE7cqbKdScIF/vqKqHDqDmABDQaB6fLucV8nRNEy/JqMg6FkgE99O4NeD/TKzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6559
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/21 4:04 PM, Dave Airlie wrote:
> cc'ing Christian to fix this I assume it was ttm refactor?

Yes, but it's on me because after fixing it I kept forgetting to queue it up for a merge. It's now in drm-misc/drm-misc-next-fixes.

Thomas, if you could make sure your next drm-misc-next-fixes pull request includes c26d6586e97a ("drm/vmwgfx: Fix implicit declaration error") that'd be great.

z
