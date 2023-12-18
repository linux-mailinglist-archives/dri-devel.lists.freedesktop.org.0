Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3A8179C3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29E10E36A;
	Mon, 18 Dec 2023 18:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2132.outbound.protection.outlook.com [40.107.21.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67B210E212
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:28:24 +0000 (UTC)
Received: from AS2PR10MB7346.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::21)
 by AS4PR10MB5696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 16:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qgi8F6i8FR9MBoKZIcLF3FUNQvzRenmoZ/6r8L/6Dfy7JF96vbX40DXdqBFVYLfAKF5MD7qHSo3XdoZsIFSzbdljMAj+uEujrZ/uo9xmief/50ecvyTjEPetRB3RmJwY5ws/GPxdIhAvvh4NpETZN8opBf62hOam+PzFsbSheEIdo6acbqEF+Xtu1ZfNNdBbZJtEiJmXEcAj+ZXbqxg+srHpNrA95E4gkxnSpvmyrpknXvfYciE6kwaNAwaQnUtXCTEMeOW7cJLO4L56B8lmItrSs6N3+arrS97sW1jZnU8LZfXosQHEUEGFDFjw+OOCgXPYuTNSgo4o++Cnjf5VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZHilhAs+RR4fven1/ncHaVu1/as4qyEPzXXD75JWSg=;
 b=S4sHmw/fxjrHBHnd9roXya+Ido6gt+hKLcltKkmsE/XwXU8LAYgEeT+OFtUZ5JeqEdh+Dof0NsovdaJvF+oTBof0k/OMvHFmyL94Um14eY16Rv558LN/DkrUQUx83sahsrFB2JM21EQjzdAA2LgohQVypa+CwrahU5CetWy7sHxx8nQOdmi0VXX9P0zl/FlPbKutv5VrjqBHUvZ6E7h/5PC/TKcYFets7+NMdIkzEWYgl/OFHE7H7R46yWCXRc1Ti/D5dmVmiqiXziHyvpC9cJUocAlJ2zuL3fKrrTQPl4EmDscSnz2NaL9g++p/3PqBE/E96jeB4KEm8u7rbp0kpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZHilhAs+RR4fven1/ncHaVu1/as4qyEPzXXD75JWSg=;
 b=HlbjYTUFCfu1fcTiwmlGFWB6MY+c3YKeE+T5CrUXRfIhAFWrQ9hJpYVjDIq0NDW33++FopEqr5iIVmaCwfsXcO2siK19VxfsrCX3FUMyvT6hyP09S2mDMn8jKgrRGLTkSct9aAvRSLhlMtJNQjnYzhCzRm499oCOVcqydlDpRDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7346.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 11:24:25 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 11:24:25 +0000
Message-ID: <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
Date: Mon, 18 Dec 2023 12:24:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Content-Language: en-US, de-DE
To: Michael Walle <mwalle@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tim Harvey <tharvey@gateworks.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7346:EE_|AS4PR10MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: c50733e2-8de7-4189-4c08-08dbffbbe41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9+VxAbLQhwTsZ+utkf5jM6nhXbgxhqnXCnigVFHSEatRmiLQbhFMm7Kegx8NbYpJpIKRMceFu280QLQmRMv7/+wL8w1DkPsWYZ3nE2A2s8Ajk/XFklWeVD9e0QFfLi7xibshC4956j/UQccZy8GRZBk6yfOtyCSRlYVFyy//1fjfASfpyq01F5bbGrdRdWqJMq/WLDLr+0LAd69i7jAYM63zPr39vRKcVEsfXPlapmFd40UHhhg+nISr0NeT2w85TixWvr1MjjkCCNFeeUuLkfzoDugI1HevcZkAugBeprf//Z9bQN+bxmwnEjl1+DnUn5rLu+2JtV2FJ5QJoFxNhFYc7d73nkmI1HQDdJH21XTvJPepOMogetNlH1Jm3QVV/YeS+aXoMCv09Tr9zaERgUSQ3okPn7+u+aE2FKG2Giy2HVekhI7Nz/hkR89ohNe8gtixnXGOu7xe6IRpVfJQb9lnccEowXzNwzrAY5x4uDEGd34NVVYsg/0IgYxbGym1LfshnXDh7QY1U4qJv6YUYOm6gJTdPev8B+b4UmxQ0doGf79kqGUNp1Qow1Qf+GdQG2sJmkoj3OV/KG94FCQwNp1T3PVnETiCp1SY9JnS7Z4fKVrD95jUWCiv1aKmgqT0/omDY11KPS4ZSnVfvlNqjK9Lb0100guANDyRMuSEYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(26005)(2616005)(921008)(38100700002)(36756003)(86362001)(31696002)(83380400001)(44832011)(5660300002)(6512007)(53546011)(6506007)(8676002)(4326008)(8936002)(66946007)(66556008)(110136005)(66476007)(316002)(2906002)(6486002)(41300700001)(7416002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVoWHFKVkFocTFJSjVETTM0TWM5Ykt6WVJMRXZ6MXpLNjhUZksyQ1NVTzRJ?=
 =?utf-8?B?cTN3R2NtNEd6c0JjcU9xVWhOb3lMTnJOVDhoUkVkdXNkUDE3N2FpZmx3RWdX?=
 =?utf-8?B?VUZyQnUzcTdzQmN5QTR6QURCODNUZis5cjlpOHhqZW9wUWtJTnordFBiVzNo?=
 =?utf-8?B?THRMQkRWMzh2cWROcjZsYVZZUEVzeTZtWjRoQ0UxOWJURmkvRmJ3VWNsNDJX?=
 =?utf-8?B?N3RIczNYT3FVK3A4Q2hxT2xydWxjU1BlTVZFbVI3cU53Y2xXZUJ1QTlOWTB0?=
 =?utf-8?B?WWtqZ1cvZUJOUlBvQkhkZkpiQVZKcFVnUFVNVVVQVkNPWDZhSUZ6a1dlTGcy?=
 =?utf-8?B?NkFObnplYnB0dzhRelNWQzZ4R0l0amNOZHBDeWZSYmZzQUUxQ1BLbm5xaEZG?=
 =?utf-8?B?TXA2US9HQU1xbjY2cHp4UzUzd1NpaGhRMlpjekhJRHdRL0c0aExDdVNhTktj?=
 =?utf-8?B?WXA0K2hmSUdYWWtXcFJtakw5QmlXVVR5REhjYlBkRC9jNjdwWXV0ZHgzSGdE?=
 =?utf-8?B?dkhUTjVsZmNsOWhyV3laZHJhdEVKYVV1akFmOUh4Y09QWGJDMmZFWkJxMW9F?=
 =?utf-8?B?UUJ2eEtjYmZMVUtqSUYwd2xlSE5zZzA2VGxudFhGUkRWcWRXdnFNbW1yR1hW?=
 =?utf-8?B?SEwva0dnRFVoREVQaThTMHE2VXZBTDQ0ZmUwcDk3NisxR3BMU01WQnYvU200?=
 =?utf-8?B?Z2NRNGJzeTZSUWVtYktLUzVpQ0JvYUJkM2Nza0VlRURkREpmZkhMS202T1dC?=
 =?utf-8?B?OE9YVE5UK256VWZ4aW1nTUx5MGZOZExkOU9hKzM1N2k0UlBEdHduUlRxMjVR?=
 =?utf-8?B?MnZsUGw3L09QN2R3TXltVlFyd2sxZFE5ejZTd3h0MEZEV0Z2a3NMbEprcEJx?=
 =?utf-8?B?ZStaWDRNZVVMdGdzeDdXTTczeWFzUnRmSElGNHUxUXNxSWpkY2JPUVhSRHJY?=
 =?utf-8?B?bVArUHJKTkhMZEVEMWhiNUV4Wk5nR3JjUkozMjE0VytFNWxoaHNqZ3RYUWtR?=
 =?utf-8?B?OHFib0huZ3h0ZExWQ3pFSHpta0tRQVVrN1Nqb3B3RjRmMW9JeTBOSmc0SEFz?=
 =?utf-8?B?TU5KelJraHlyRTE1TkV1TGhwR0wrUWhSS0F0SFFhbEd6MDBtY1Iwd3h1NGw5?=
 =?utf-8?B?Qis2emhpVnNNWXhyQy9vM2hXMTFpejIyN1Y4NjlJUytyQlpId29hdk52Z1pk?=
 =?utf-8?B?d0Z4S21kWjlHZit4S3E4US9ZUEsxWXlwUnFieDNyeDhBMWs1RkhxQWpiNlhT?=
 =?utf-8?B?aHRjNUdUMytiNmNDYUNsVklyZVlYMThUeVFoZ3FEaGJiVEVyYXhFdzFibmwz?=
 =?utf-8?B?L3JTd3NkcUJ1MlVGT2lyN0NQN0w2TGFsVzVnSjhNV3crZ0JvaVUxOCtLOGw0?=
 =?utf-8?B?cm9xTVl2R1IvQ0lkNjBmajlieUZoRDZjTFNKSGNlZ1R1VFM4QVZpOWdNcmg4?=
 =?utf-8?B?YWFOdTgvcFBBMGhkVThRa29qb1BkTmZVMWpQSUZrRnVyMnRkYjhkYnBEQ1pq?=
 =?utf-8?B?eElDQmhSdm15TFhBTmFGNFBRRlEvKzBOSkthUXI5bDFTN1VoTlh0Q3BuZndp?=
 =?utf-8?B?S0dyUktEYytydFhCUmdXd0hoTHdWaUlpUUlySGdSaldPOWVzQ2hCU3A1YnN2?=
 =?utf-8?B?bnpsR0FHYzdKcFkyVU1vSm1MNDhaaG9HNTYrSWZBd3J6SkU5TU9kNDE4Uyt3?=
 =?utf-8?B?SGpXaTc5eWl0TlRPUmdWcTR4bVVUbmwxTFNiMzJURUhpTEdTNFg4VnFCUnN2?=
 =?utf-8?B?ODRsOFJtUW1CUHJySklRQnI0Y2ZUNWVZRkFyQ29XRDUrWU9qZ1puaW5FUjUr?=
 =?utf-8?B?cDhnSzlLQk80R1lwUFBEUUdtYWlFUnZZM3BTSVcvYU02dTBnRmpJNGhiRlhs?=
 =?utf-8?B?aFNKSklwQmI1bnpzdFJvRjQ5aEwyNGZjMm4rL3ZsSnJMZlZycW9BZzZrUG5F?=
 =?utf-8?B?ZzBLUGxld1pqSTRzYTBqWGx4dmVPNXFYekxyOFhIVGdZTlUyakE5STdKT3l2?=
 =?utf-8?B?T04vOFJKbE9hdTM0V0cxREJmQTBhTC9acVM2Qzg2QzZPZk9rWVFZRVp0d0VN?=
 =?utf-8?B?blRMSUNHd3lqYXc1TTFPbTRndkJnajU3d253ekJWVUJyU1huMXBPei9aK3ZQ?=
 =?utf-8?B?eGU4MTVCZzlONXBzREFLR3A2VWtFenI0d0JLbmE2by9MM2QwdWtLbVF2Q1po?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50733e2-8de7-4189-4c08-08dbffbbe41e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 11:24:25.5556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50bXvKGvcDxKxdoofanUCdG6BEdanFKRrJcM3sHxONxp60f3MCU1KJ5AF6JClmiQ7tppWk/llvrHiAeOtHw71g1+VdbjtrM0rLzyMl//gpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7346
X-OriginatorOrg: kontron.de
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.12.23 10:04, Michael Walle wrote:
>> The FORCE_STOP_STATE bit is unsuitable to force the DSI link into LP-11
>> mode. It seems the bridge internally queues DSI packets and when the
>> FORCE_STOP_STATE bit is cleared, they are sent in close succession
>> without any useful timing (this also means that the DSI lanes won't go
>> into LP-11 mode). The length of this gibberish varies between 1ms and
>> 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
>> case). In our case, the bridge will fail in about 1 per 500 reboots.
>>
>> The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
>> LP-11 state during the .pre_enable phase. But as it turns out, none of
>> this is needed at all. Between samsung_dsim_init() and
>> samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.
>> The code as it was before commit 20c827683de0 ("drm: bridge:
>> samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
>> bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was correct
>> in this regard.
>>
>> This patch basically reverts both commits. It was tested on an i.MX8M
>> SoC with an SN65DSI84 bridge. The signals were probed and the DSI
>> packets were decoded during initialization and link start-up. After this
>> patch the first DSI packet on the link is a VSYNC packet and the timing
>> is correct.
>>
>> Command mode between .pre_enable and .enable was also briefly tested by
>> a quick hack. There was no DSI link partner which would have responded,
>> but it was made sure the DSI packet was send on the link. As a side
>> note, the command mode seems to just work in HS mode. I couldn't find
>> that the bridge will handle commands in LP mode.
>>
>> Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host
>> transfer")
>> Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable
>> flow to meet spec")
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>> Let me know wether this should be two commits each reverting one, but
>> both
>> commits appeared first in kernel 6.5.
> 
> Are there any news?

Inki, are you picking this up? Or if not, who will?
