Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239427772E5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 10:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EFF10E15D;
	Thu, 10 Aug 2023 08:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2134.outbound.protection.outlook.com [40.107.247.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C907710E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 08:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwIpUy/xkUXk3cYSwQeSbZsjkZaL0mPVayXK6t0cWv0f7twvkB+N8Krf6VsWxMng0wFIc6HxfLl5niATDnHxgq1/hG1IXZUG9BbRDq4+7oLRCe6Lo939Gk5fstkWFlFVgAE63jZ/8+usbQwsVHuXpYA0djeK86P5TVvqlJTr+8m4GpFkzez4jIR+YBPp+mgFArfPNIHiOcyTlZ/UEMwqp9m5R7H50V2uE3VFqnxwZ/i66/xjg30vQVEOn40/0+x7jJqsJDC3qFBuEmRH91cq/C6Bj5zeFSaerflEouBU1OjPp3dEvbI85EhCfApYCWYdFRMwF0KzhBaY0shIn0l4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLeaOXS2wCsh/kscIsIYoapBAole9Nu4b1nDa0hE4Kc=;
 b=Pv+ygkDz8q0A1/ODgwYQCAC069zUsFG67CYQgxRy0CbLuv6SpIHkLWUA7y5zB/hdl4Ne7rWon7xHhDyO5/O/cOVDkWbfFRe8ASvfPR4AY0NA+SWlbcOO+baD8Ig/nsX6iQ51/klo0ipkJ9ZHEAl8ap3fBPCPGSJp/fd7bWkjF7fMuTrTDicBBRrO6jUm8fZdpUzVN+bPEmZDZ9ZWnObd/Vq8yMT88yIgDyJu6h7ID4jt7aaYhgCIlsXGZ52e6r7pBz6CqTlRdh2WCQ+muVxejTzFln4BVu/uXTx8SJ/5O/zl9H3osZQj2fyVhoNrWq2Z7Lre1NEdR9rbbOiJOjTSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLeaOXS2wCsh/kscIsIYoapBAole9Nu4b1nDa0hE4Kc=;
 b=WLdu7T02egprsozK1RKTXiyJO1rd71lWmMYe3p1UkJ03ZR37bGO2rQ+AMJBuGwueJOg2N8FgNVEYf23Nt0vFpxfAfIN3eCSqvTg0K4njy7OVqwJ5jgdAFcF2uAXGIxdcYoRAq8/8/YE+81P7Q9n8bTGNcbLkG4EG6fcEgdQOdZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by PR3PR10MB3769.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:48::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:29:55 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c3fb:2416:2628:ca95]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c3fb:2416:2628:ca95%6]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 08:29:54 +0000
Message-ID: <a2ba37f2-d498-6958-eb96-5bbfc8b2151c@prevas.dk>
Date: Thu, 10 Aug 2023 10:29:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Content-Language: en-US, da
To: Nick Desaulniers <ndesaulniers@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230731123625.3766-1-christian.koenig@amd.com>
 <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::9) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|PR3PR10MB3769:EE_
X-MS-Office365-Filtering-Correlation-Id: ff752d07-7978-4362-a3d0-08db997bf955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooldtfXJOBscPp34u8f8O37nEQzXK1SpqgXnLakOh7XiBm0Z4sAvuYMZO9nyoHufL2nj/uSbmjOB9T0mKNf0BxboBH5n0wFbzV1rS7PsmGHpSyqavDKG/0TvcNR06SLkElSTLodSgdplru+6HofupAStoBTJAKYhHBP3H6nK4juJRCSDarNGsjLaXZmiUfd67VKhV/LIGust6kbJ/QZDvwEnSTEn5GcsyRq3b0WOedJADGxUPe2zigbmlh48UGll0pXbc6VcD/Luyvs9aI0hU1eosFFdsLlRFl9ATJZTnDsieLXAsHcLikKv1Rj/VK6rdRLLWY3XWwluGXO5BBFcxxh+gInVW3KLQUSksivmnmjkTDYgGIiwy1oqlS9okv0AP0SsCNDIZ3xi8tHesH5w+JkW9LLjO8eEmZ9hnM5kC1oZIZ2lmsAu4RQo5srXKCINnH55MLQIh/gthtHj7DVMulSS4h655VH0qbnhVkL1XAAOPS447D/JIwWXtMF/1CubhSoBioKwlY0yQ7MV/tIY0Qqw8VANW9bqSR405WclJCSqvhBQQxGupN34juaWRrgx+u0fW4j2hfCtrMKjVqmjIigFE+DOosJGHzYPWP1vggvep4NTD2emmgxec7pDoLjioMR9F7Db4i6Xcfssp/wfCa8fjYanIrBoxWhZ+45hRj7bcPYL/t/9i4qb1KdAO49l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(1800799006)(186006)(451199021)(31686004)(66946007)(6506007)(66556008)(26005)(66476007)(478600001)(6666004)(110136005)(36756003)(31696002)(83380400001)(2616005)(52116002)(316002)(7416002)(41300700001)(8976002)(44832011)(6512007)(4326008)(6486002)(2906002)(8936002)(8676002)(86362001)(38100700002)(5660300002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytXZ2JSMlpuYmdodEhqZW5HcHJLdjBOdHhNUGY0OWlEczZvYStDV2g2REZ1?=
 =?utf-8?B?OXRzdkE2d09WKzdLNTJRYm1lNHc5dmtzclNmZmtPWGJtU2krdHJJa0hQR1Av?=
 =?utf-8?B?cGxBa0tNYzNjVTlZTVU2WTFwMGdXdXFuT01mUWlONWFIS1hmVENBL2pyU0t1?=
 =?utf-8?B?ZkFJU0pKOUVtOE1UekZ2SmpEOVgvSFIyWVo0YU5SRFJncC8xRXBpUE0vaDBK?=
 =?utf-8?B?NkFFa1dqRHoxYjRzVURDaFo5WGRMcnpCY1pmbDArQzRoU0NGQlZkNFJ1WHBS?=
 =?utf-8?B?WS84aW9aMVJZS0NkWXZjSEdpZmRaRTFMdGZsK0dEYURDVDh6blF4WTVJWThQ?=
 =?utf-8?B?VkRtR3hGSWpYOHQzVVNHaEIxNGpybUtnSFRLTmtoZUFTZm9jaG11Mmg5OURP?=
 =?utf-8?B?RWhqR2VTRGQ5QXhWWGZidnA2RHoxbUVFUUJHTEFtV1lzMDNnc0UyQ2djODF3?=
 =?utf-8?B?bnJGNmdRL1VUSEx0NnZmY0lkNkh6b0ozR2I4NmxDSXRBdU96emM3dW1nOVM3?=
 =?utf-8?B?cDFxZ1pPTGNEM1VCYmp5Q3hra3hRckNOQW1oN0xqRmZEL0E4VEhjeVYrQnNj?=
 =?utf-8?B?Ny9vMjJCSkhiUWlYalZ2eFN5VnJkTHRaeTV3Y3RZUkdsVjBnblNGVmUyUXl5?=
 =?utf-8?B?NXdLNWZ5REdRalBkZ0MxeHFENzlEdGl4S2RmdVl3c3N1bmZmemNrUkdXQU1Q?=
 =?utf-8?B?NTlOa1E2WkRsV2o4eTZ3MitucXZUdDJmM0lyZ2VWUjRmd0dhUFJPOTd6RmVF?=
 =?utf-8?B?VlNTMUFvaVJQemZwL3Z3eHVWMjVFTVVaUUlxMFV1dm1sVGNoczZ4YmxJbDBP?=
 =?utf-8?B?UlJzK2phL1h0ektnNnFzNVp3aW0wVVBRcXhOM085bkZDVHdFUkhoQ3lIT25s?=
 =?utf-8?B?V1JwOUJ2OUhLV3JrRlQ1U1RBZU9sQTA0NjJIM0dGWC9RQ211a0I2T3VBczBJ?=
 =?utf-8?B?dFV5MDBFU0wyaE5mTjltTzZtZzdSTUg0c3ZxOTlYckx4ZExpWjhHdERJYkJa?=
 =?utf-8?B?TkpmWTFudERmUFhVTHp6OVV3S2NFWTJOcFJaNWNoR25zaEQ1MjBhR0ovanpv?=
 =?utf-8?B?dDUwclNJTWp1Uk5wRnlRQkRlVk1Xc1ZKN05ONld5WDZYVWNxQmtLaTlnOEs2?=
 =?utf-8?B?bzZJenIzbk1RZ1F0YlUwSXAreksxSjgveHpsb2FlelEza0pFLzllMXB3YUta?=
 =?utf-8?B?MFBjTXRCaUxLSXB6eElVRzRIZ29SS1psTUNtQTlCeGZOZ3ZjL252VWFCY2lT?=
 =?utf-8?B?WEgvKzlXUVBvczUwNVE1ZmlHREZ3NXVWL296eVpjNjRETHY2c2RzaUVIZEZ1?=
 =?utf-8?B?MnBZWkdzNVhMSHBxbkEwcHJNbjlxNS9paEZhVDg2R0RNSCtxOFdYWWZqMHls?=
 =?utf-8?B?YStzdEFrYTFob3dqa3pMc1F5VGdnMTk4MmxvalhnM041RGxTcWJPNElHWHhn?=
 =?utf-8?B?bkUxRm43R1hWWGJhRit3bVAxOFlnTTVEQjFPcTZsK3E3Q2FIYTBrZUE1aERw?=
 =?utf-8?B?Yyt6dGFEM0NmNDdLZ1N4YVYrMEFZdUxEampXdlMxMXpIUE9ndEh0dnlSL0JJ?=
 =?utf-8?B?Q2V1K1BLWVUwVE5jUjZjQ0themlUUkJKajNVNy9aUXdpc0VlclZnM2FqSWpN?=
 =?utf-8?B?M0M5VW9XTUlWbHA5VnhuL1pkeEFBZytFeG5CMmdyQTFsQVFxU2dkajJiQXFO?=
 =?utf-8?B?OFczWkR5TzZaV1hUMjhxWVhsU251aWo5Ujc2RWt3bkh3Tks4TDZMR3Q0NjdS?=
 =?utf-8?B?OUk2WUVSUko5MWUxcGsvU3FuMnNxVlFFT1MySzMwMGFycVlheEwwRWNkd2Ro?=
 =?utf-8?B?cmtWekU0cXJ5M3lFUkNXc1MxM3NTUjkxMGwrWHNyTEl2ZDhNRjVFOG0xTitO?=
 =?utf-8?B?dndBMzBnUlFYcW5ZT3VxV3RjN1pUSmJYTitaUEZtV2N1eWFiMmU1YkhlcVUy?=
 =?utf-8?B?T20vc2dWYjErT2F2RWU5WjZjSzQ4dEU0b3RzSkN5QVQxMC9aTG1LY3N3anBH?=
 =?utf-8?B?LzdSbGp4SFlYMVFVU3huSnFKVkJYK0pRc0tpU0N1bjAyalBFajQwck05SGlr?=
 =?utf-8?B?Zm1QUUNvSWFxbDNoU2NnYThlcjd2TmFsclZKWHdMOGRkZFB5Y1l1TmlkMnJM?=
 =?utf-8?B?T05OUjkvbjl0M2tIWHhxUnFac3BCNmRjM216YVRnT3RkdlYvemtWMUNHaURB?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ff752d07-7978-4362-a3d0-08db997bf955
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:29:54.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctuRAegWWqQckCKyTW96Dpsfl6K4kaUYSq5TsdFd5Wo7qbnzTTOklGeyrz9kzd2a4kQIOeShK4kniUyF+pf5PAM43HLbUi0EHLjY6mnzNA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3769
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
Cc: tzimmermann@suse.de, trix@redhat.com, naresh.kamboju@linaro.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, mripard@kernel.org,
 boris.brezillon@collabora.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 22.35, Nick Desaulniers wrote:

> I suspect it's possible to change the indirect goto into a direct goto
> with some further refactoring (macros can take block statements; 

Well, with some somewhat subtle restrictions. C99, 6.10.3.11. "The
sequence of preprocessing tokens bounded by the outside-most matching
parentheses forms the list of arguments for the function-like macro. The
individual arguments within the list are separated by comma
preprocessing tokens, but comma preprocessing tokens between matching
inner parentheses do not separate arguments."

cpp doesn't care about the {} tokens when trying to figure out what
constitutes the "block" argument, so if that block contained any comma
outside a () pair, cpp would barf something like

  error: macro "foo" passed 3 arguments, but takes just 2

So while the commas inside function calls (and other macro invocations)
are fine, constructs like

  int x, y;

or

  struct s s = {.a = 3, .b = 4}

would be verboten inside that block.

One way around that is to make block a variadic argument so it just
gobbles up all preprocessor token. Or have the users pass a statement
expression instead of a block.

Rasmus

