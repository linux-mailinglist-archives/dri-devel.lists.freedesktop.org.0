Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C34A76F8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A14210E376;
	Wed,  2 Feb 2022 17:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on2104.outbound.protection.outlook.com [40.107.24.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A2F10E200
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4mjbZVlzO6Eg0aj9r6AcfzDOtR4xLro7I/97GG1yoE5NNQezmxny3PkQD0mBXxRHjC20ZaxgxodC8ZB1du6oF36IxY4UnctmmQytgMiBoQRLrFJYZ7PH7go8HZXXAVTtS/P5SyICge8o/mK03Mt5+9JyV04A+liaWBZfPYWsrHmVgmarR31QVmc/LkvGJy7bmeH6UlGsprj7QgAvQlaNxMrlEzCZ+DrBGle8DgcIVeQw5GqNFQC5DE6FfLIaqbIKe1o3pRIostWTBTo/VE/d4JPffOjlLjxR+wAgj/EEJNGKuj5h1IO7gHV9e3nGE8PGfXvvskG+6//7OKWN4pvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGklpYzQ2puADbwdYs7gbVBC9AZqorFPzVh5+uQakjE=;
 b=QYdLB9tWcYwAOXUwWf9x6lmtCTqbHuokV3avmGQZaQrClCDsY60rIWF/Px8JGnnOzl92hnpBxq2xkGEGMrGviDylHMDDtRueULWlTfNTyEhWALBP7GJ0aD/LT5AXJC51OchdnTl8gFFc5pHRKGWSzQGw3jkqc4fTyPH9SRGQkj6lThMNax9tND4LroQ8f6pn1KAc3GNTs8w72QdUjp6Tii3rqXQhrYB7poCb89inUL2jBfiLzbU8k15I/zDpm+c7fYEQEhwWOMwzTNuGZB8zcZzPW0y0oZTuNajbMZe3G+1Y26OfOUQPTXy74ixSRo24u4Wh8aaqNLjdDhzIv00BHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGklpYzQ2puADbwdYs7gbVBC9AZqorFPzVh5+uQakjE=;
 b=MoEdikc7F+km1d16SXRUMMpoMj/IucS0ydf+tNfZdHI81sRrP/88cwUbH9m7z1sWkS2E2BIPWAQzLrarym9mVquaJ3v6k541gdd6QM/ZRBqoItNZnJYKovufZNWoWHcZ/2QbLi9CgiP7VMPSjvdprmvHvlSQtqBqGxaa+t7JwEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4a::9) by
 ZR0P278MB0650.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:39::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 2 Feb 2022 15:54:10 +0000
Received: from ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 ([fe80::51d6:e688:ee1f:70f1]) by ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 ([fe80::51d6:e688:ee1f:70f1%5]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 15:54:10 +0000
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 dri-devel@lists.freedesktop.org
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
 <5374a438-ac8b-05f4-9913-f918ed6aa8c0@toradex.com>
From: Denys Drozdov <denys.drozdov@toradex.com>
Message-ID: <65ccf910-013e-41e1-5962-032a4da7e06c@toradex.com>
Date: Wed, 2 Feb 2022 17:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5374a438-ac8b-05f4-9913-f918ed6aa8c0@toradex.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:4a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0eec760-315c-4114-3f90-08d9e6644054
X-MS-TrafficTypeDiagnostic: ZR0P278MB0650:EE_
X-Microsoft-Antispam-PRVS: <ZR0P278MB065087B3405BF2D4669EB4EAF1279@ZR0P278MB0650.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3vZ9o1izW+oleo/ioS1ulaUwVe7SUWpATqzfrzRG9LCUrkNdEcxJy7n80MgO92te9pF2YEYcgMPLNVnZMhzDCHAwrv9AORav/SBesX5aEyvO9syeKTw8EfvmUMFePzYybAgYssHUK8t2lJHv31FIZTzt3dzZSTCSSguTbohyeq9EAOmFqtb7zL+JpOQZB4nbIGhzvLoS1RNUgsd6dV7SqQZgG+NtYItxb5ZrRsn26YY2B4evpPfBolkoN2b/c0FOiwcQPMbMuPKGDJIRfKdfjlzXhR+sVYWkmP/KVF94NrxeUy1yE1Dv8Njv9SqRrNszwvvAmGFBJTbyoOBN26bF9uzzvGCK0MxcMsmy+FB8csuBQ9Ehz+U7lETxHlopDhZ9eB+4C7zroToRwynXDgAY3mjIGxlKrq7faTheuNPI5ueBBCHPYB/+52Hr5GjHo0WvDsVba3C1wfua4YNzKmMyEXOVNZBUHrSmTMrL/J8EVthlLyYdK3ocnCjNZwUxUrrvrm13YF5DJfvoTu+WJlxcMV7aeAWDZraEeW2DijAnax08fStSA6f5aPQmJUCSAC52wKOKOwkTN8nLEo8a1UNJLl3XHFV71UwtBBu+Efnu70Y/MZyIyLFD6PkhL1AYelhgsxHnCioHFuk2zS4n+jQHfbsXNABemYHmJ6quCVhb86pws8GefkbfdD/F8b2ew+tFII0/z8aLFydcKIt/+JIKYin4IupSfPRpw0CLzZIJFYej6ElgZtYypT00q62ioq5/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(186003)(26005)(2616005)(8676002)(66476007)(66556008)(8936002)(38350700002)(38100700002)(66946007)(4326008)(53546011)(31696002)(52116002)(86362001)(6512007)(6506007)(7416002)(6486002)(2906002)(36756003)(44832011)(31686004)(54906003)(316002)(5660300002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURYejY2dDZGYVJ1SFM0a1VIcWpWSHlkdCs3NmJNOXg1QTdETzR6cWJZQlN5?=
 =?utf-8?B?dWxTTUR6bEwwalk2d2Y5ekphTGQzdGJ0UlF4OFJpUi9iMnFNSDRhTWs5NVpT?=
 =?utf-8?B?RlNUY0NxcVhjQWpXK1l4WTlrQ1Z5czhsUzZFV29HWEsxMUp1N1dXSzcwNVBL?=
 =?utf-8?B?cXhuQ2ZqYlc4QXRpa0xReVBRazk5dkZ6QzlsVVhXQlRNaW8xRitmRFdJamI5?=
 =?utf-8?B?b1pPWHI3ejVDZ0hDZ1BBZVl5R1pjbkJMM25BMlBYNUdST2JTTlZ6WDIrVHVp?=
 =?utf-8?B?bkJRUXUxcHVoNElQU3JuRjRLbHlmUmhxY0RDaVRBbTdqSHhEMklhQkttUERP?=
 =?utf-8?B?SWlzd1Y0UTJXMGExR243UHE5YXBjd1lHV2pLMDg1RnlKcXI0bmgwSTQwSzJI?=
 =?utf-8?B?akwyM3BwbXJJbHN2QWNScnNxVHpaK0FZcEk1WThXNnYwSERlcXN1RnU2ZWJT?=
 =?utf-8?B?OUdPMjJiUGNwWkhVTmhOSk9ZK3J3dDFPc0ZFSEpOQndPaXp2RnZ5c1M4Zm0w?=
 =?utf-8?B?dCszblFldGt3SHo5czRjRTFuUGtQWkcwMTdWcEVZUmYwRTQ5VStrZVRwMXJU?=
 =?utf-8?B?N1VxV3h6ZXNJNHlRZGN1c2VlaWk1eUhsZnZhT0h2azIrU2VUQXJ5Q1dRVTN0?=
 =?utf-8?B?bVgwZ2Zhb1RXUHFQV2NRbXhWRVZiZStMeUxRVHdrVUx3cEp3S0p2UnNtRm5C?=
 =?utf-8?B?K3c3T1hTenVvRjNVeXY1MlYvZXRNWWR1T3oyaE9DYVU4eTFXWDFBSTdrcEZI?=
 =?utf-8?B?aE45TFV3U0ZQeG5qOWVIT2hBSXJrNkFPd1V1T3V5NHp1VEFzYkdGR2RBcjhK?=
 =?utf-8?B?QlF1SXlPTFZxUldMZkI5OUtLVEhCTTg3NUZXaHA4UEdqOUNjbWhxWUxVckZw?=
 =?utf-8?B?b25NaC9uSnJOemlvSTMwakNPWnBoekhneENiS21HVHp4ZVg3aWRYanEwSnZy?=
 =?utf-8?B?QklmU0lRVzVhU3VjTFV0dnhJMVNuLzJTSEI5d1Zta1VrVUlOTWwwVjREbU9F?=
 =?utf-8?B?aUk5QlFEU0JBNndwUUdQTjN5NkJROXBmejVoc2czWlR2c3Y0SDU5MlA4bG40?=
 =?utf-8?B?VVBLa3M3M1FRMlQ4MVVhQWhFYzhNclJ1VDZBVmtvUjZBbVdHVTdCYXRXWmpn?=
 =?utf-8?B?UE1uS2tzL2NCRUJEbmsveVNCWS9WK1ZsbTI2WFd6RGVwMFlkWElZVVJJQ0Y5?=
 =?utf-8?B?VlJtRWw4bVppUGd2Y0w5VGRFMU41RTVOaUZKc3pxRFVUcGJDcEpieVVKdU1T?=
 =?utf-8?B?UGxQVDhKa0paVk16UVBmUDcvekNSRXo1bzIzUHNGS1RJZENZTHc0WG50dXk2?=
 =?utf-8?B?MWJxYmFOL2FVeFlTTHd1VngvQWhZVUNBcEFqTTV3RjZuUy95dDJQdHhEUENL?=
 =?utf-8?B?d3pyeUM3TktjNzQ3OXZIZFpyb1ZUS1UycS8rVVdsWklxM2doUjJaTjJ3bnNU?=
 =?utf-8?B?clNkTDVMRnlhMkd1Um5xOUIwTG9wRi83NzZOclNkcWpOTlFrQ25Nak9JNmVx?=
 =?utf-8?B?cTUvM2ZsNWVxbGFYNTFxNnZrOXNSTVBZSi9CRDJ2Vy9Ha2wyMmJjREd1dWd2?=
 =?utf-8?B?Q1VLQ0ZUNy9FeWljMzNuWjJ2Rm9iZDc5RkFPZkpid24zcUtjVWxzOTFCS2k4?=
 =?utf-8?B?cnFiVkZ2Si9mcW5ldHl2dUdQV1dLSnJlNUppdThZNzM5aUZ0MVpEcmRmWkFq?=
 =?utf-8?B?SlBwRzI4QWZiMWdGZWNzSEEwTWJMWEhBd1d0aTFXckN1OGZCQTYzbnR0MktE?=
 =?utf-8?B?Zk1ycktZQ3c4Z3pGTXhUZHJuaVZ2SVYvc0ZEcFBJWS9FYkhBa1JaeEhiMXN6?=
 =?utf-8?B?SDgxODNDVUMxZGNTNjlZQXRldTdCRktKMzZyQU1BSWxjdEhtbFZxVXQ2Q21N?=
 =?utf-8?B?dGpRbFdLVWpGYTB2eDZsZGxRVmJ4ZHhEY3BlL25XTDlIQWhLeXNWUUlidmRE?=
 =?utf-8?B?M3JLOEV6NWQvMnVObGtBak5pSkhja1YzTG05Zmd2Q3NyQnNRMUN5ZEJBdXR2?=
 =?utf-8?B?M3FZTDlXWldRa2F6bXMrOTk5Mmc0bEkvcW56OVRiVHFlNnoyUWZhVEF3TmM4?=
 =?utf-8?B?WFhXZ05Oa1hWWENXUGVSY093MlpHQXBLejVlWnRwT0trMzV4Y3NUeU5ydm1s?=
 =?utf-8?B?cmhPVmc1SklmQVZoSWlDN0ltcklUdVFKMjdMdU5hMjQyTnFMVm4wOWx6SERo?=
 =?utf-8?B?U3dFamZUZkkzMjcwTSs1VGxvOWVQak1Oam8yWVZpTkJreU04dUJIYWUvN1h3?=
 =?utf-8?B?YXlEZ0htYW11cDdBOUxuWFR4WXhnPT0=?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0eec760-315c-4114-3f90-08d9e6644054
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:54:10.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU8ptdVpZ8o8xLfctx3fYV8FEC9UYn5bF9CmPhBrhcdVawZU2CD+P927+LHt0hpjqTNJuuk4koGJHvg0WEiIQuF/NA80aklWxtQSCZX8mxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0650
X-Mailman-Approved-At: Wed, 02 Feb 2022 17:41:11 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On 2/1/22 1:07 PM, Christoph Niedermaier wrote:
>> Without the data-mapping devicetree property my display won't
>> work properly. It is flickering, because the bus flags won't
>> be assigned without a defined bus format by the imx parallel
>> display driver. There was a discussion about the removal [1]
>> and an agreement that a better solution is needed, but it is
>> missing so far.
> Obviously bus format in panel-dpi is broken, so this revert
> looks necessary. The current state of panel-dpi isn't consistent
> with changes introduced in commit 4a1d0dbc8332231d1d500d7a1d13c45457262a97
>> So what would be the better approach?
> Another approach is using panel instead of panel-dpi.
>> [1]https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
>>
>> This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
> But, also you need to revert 99f155d0776fb8838e326efce056aa08e25433d0
>> Signed-off-by: Christoph Niedermaier<cniedermaier@dh-electronics.com>
> Tested-by: Denys Drozdov<denys.drozdov@toradex.com>
