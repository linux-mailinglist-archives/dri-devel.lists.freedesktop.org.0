Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14F6E65AC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8140110E7AD;
	Tue, 18 Apr 2023 13:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2117.outbound.protection.outlook.com [40.107.20.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE0910E7AD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEm3LruTNFex/C0g5wCM7Qz3rpav8DhvFeWr35d0zdXPMIJBf5zD3fmUzjTEe2C9btY8zvcRSlbbwiowxWr7clmEV+EBGFSaemcP7KJuHCb+0mxRNUnx2iBYR+co7WpL6MZzqxcZhzB+eFJmMHFiCBk04WauIowlae3ZQ7bi3LTjzPtCJWjCT5la7LjZw2lRLiLmhsbvDaWiB0rVfiUIb4VVNQaSa0lhw4bctF+BfM3TpK0X9hsXlFg4N6v06aQU9sppt3r8WEzc81UH3RHtlyx44Y9shwN94DLSuO+w6MrG8HzRSXbplQLOkwqba5+4BEqrV55geh7KJSQ9C4ZIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY8WJqNKGSW4kML86ZJerx8H6J5lUuiAj5m36V2lcSU=;
 b=Q7jqlaVijTACCQYXAKKlav3dAu31exIt/EwDydZw1rqL8nKAkY6C2bP87i7O3bgq9Q8iYQYwqU4GSC3RHcTVLQJmGIxvKvapJmSSH7b8xbc4ql3Nq5cRqplf1cCLj9Eq1TQScRi2txpuTf8yFIWlxhte+JACRmIfFzm1utZ/JFIzj/Zh+14PRgKClRIlXlLSISBbNAVM+erqr3Aqo7WVNkhC63ROjfyrfoW4S+XqaEH0/J1mernA35k01b/Gzc3LD54sW2qakjjWtbicLTRaVnCOrV0+PafhOMJYQZXjauM6WK5i122CkM5di5GPfdZ4dVfc6VIFVZtVyUzWlXxi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY8WJqNKGSW4kML86ZJerx8H6J5lUuiAj5m36V2lcSU=;
 b=ANENs6n/3UULgyorh/IpLCKXWsGCA6MH+q6RXxPN3Rs9NApVlUf0LSYW1TAlAC4A5AMgtkQ7jrmBMwLcIqg+WbI1SFvZ8HLTn43tCJVR24yeFjc1wNqBtuiGGPBku1O+oGzAylYv+HvVfLDaPqmMU1L5dz6Wvbmue8HVxj+nyxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAXPR10MB5613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:243::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.17; Tue, 18 Apr
 2023 13:16:58 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7ec3:9d2c:15ac:e1af]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7ec3:9d2c:15ac:e1af%3]) with mapi id 15.20.6319.019; Tue, 18 Apr 2023
 13:16:57 +0000
Message-ID: <cdd90ba1-e9bd-e622-d7f3-de5d762cc2c6@kontron.de>
Date: Tue, 18 Apr 2023 15:16:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 3/3] drm: bridge: samsung-dsim: Remove init quirk for
 Exynos
Content-Language: en-US, de-DE
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Frieder Schrempf <frieder@fris.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <CGME20230418104305eucas1p145a8fa1560520ebe430590abdeabb66e@eucas1p1.samsung.com>
 <20230418104256.878017-1-frieder@fris.de>
 <0c4f2703-8810-fe0f-76aa-cc6250aea74a@samsung.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <0c4f2703-8810-fe0f-76aa-cc6250aea74a@samsung.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BE1P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAXPR10MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: af4ed314-4b93-49c7-b031-08db400f2fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: br39/exmtdZ1mVtDHdsDku8oOrj0HgDrX+KREzoyP86GIpc6rEC6JrFoUOgwJURy6UP5hDIXmnWwHhnWUxnaQX1C1HAvK/tgsikrLoIrJv009D0V3EhHkI0Qc3U+QyEsl+6w8eJGWWEw0r7e8aTcZqyqFLdYHsE6O7C2zH7NPm3po54QHt+lwswYFZnrdcniTEUlUB2+7W5Al/qok9VTapBJDMJCzDs1v2CEkxP82OstBOiOswgb4AyGm9oL0wPgAaKLEOO1IEWVTm10r08hLaQyFPYurVCCwRkkBJ8f6aLCX0eGMnWu8TgaOA5/wtZCm8czJRHyoRkTqD0k1taisLB/0fYuIpzardjwQD8IiPvBUqAuYaEyc0rerSVVGpmE8WirNNBPH44b6HGUyBDSjjygY9cEbCHS//QIuj5jEsXkn2psVJhpfyvH55ylqDVn5D/WzfBIcxqJbQAtFWrKZboyqPEBLmvDrMYZf1HAoRPC0BrFhDojuEn2DKJIe/T/J3dn2UtWlPExh8w7W4LBXR7W9M8y96BbpXilkUE1MmS+2QpNee10dsqZKvAw968JuoZaa3wmTEYdNZ1PWEcdlISQwVmGPcgyYZyZ/Ly8kvv8gB4zTFC/3jlAmvcG7JITvO2g1FnIcrmza92YLmRKLcZTysVdkV1HS3e6p69GIKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(66946007)(66556008)(66476007)(4326008)(478600001)(316002)(8936002)(44832011)(110136005)(8676002)(5660300002)(54906003)(7416002)(921005)(41300700001)(38100700002)(186003)(53546011)(2616005)(6486002)(6666004)(45080400002)(6506007)(6512007)(26005)(966005)(31696002)(2906002)(36756003)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzd0THJEbEpxRHl2TU5TSlhUU3N4N2VLNHc0ZEc0SGFNdU1VKzNCRmZXWFpt?=
 =?utf-8?B?Y2Z2anpxM2dYZlROMGhQNW1CU20xZUdFWndaa1dPSlZjTFdBai8vK0hyQ0tE?=
 =?utf-8?B?ZzZuY1VONEw2Rkg4blFtUTBieXFWQ1pLSktodmY0RjFyTFkrQkZFd3licG9p?=
 =?utf-8?B?dkI2WTRTcW04bkJaSnNsK3lLanRpWUNBR3UyMVRhL1NRRUQxdzB1UWI4OUxs?=
 =?utf-8?B?SEtINEl3VmZpNGtQbHEyVERhd3d0V2E4emo4cHdJUmN0ZHQvQnJBYTFFck5t?=
 =?utf-8?B?ajMwTjQyaGlwZ3B0U0gyRE9rMTE1dlJ3aE9xQWo1bDg4bGNPQS9tNEtQaUFx?=
 =?utf-8?B?eGpnYjJuOHI4TU1kRktHRUUydHQrcjlEdEs4b0RCU05TY2dCQ0pMYzJVTXRn?=
 =?utf-8?B?Y2JBNXlhQTJDRGcreG5CeFNPYUFQK2Q2Vlp0MjFRc0J1Rm1wZ3hnRnp2OFBO?=
 =?utf-8?B?TFBQR2dycUZtc1NKQXhFc0d4MkYvejI5Si9QZ1pyNnEwdlkzTElzT1cwQUxN?=
 =?utf-8?B?ZlFsWWVkZVE1QWNSN2pYMTAzVFdibnhtZ21CRVlKYjRiME5iL0QrNkliYUtL?=
 =?utf-8?B?QnpRUldkbXhQZjhNdXhIelNiVjI2bUJNTStKQkZwWVRuSnhKeDdSOE90Q3Nn?=
 =?utf-8?B?Q0tuYnptUkF1SVMwcU1jVUpHZFJBeGU2ZjZwSlR1U1VZbjBtcGsxK0h0akxt?=
 =?utf-8?B?TGZhTlRoN0JlcEczVk5BMVk1aitoSVRGOXhnVUhUdGIvTCs3djZaWXFERWJJ?=
 =?utf-8?B?SjJKczlxcEVuUXBKNDF2bWtIVjVGa2diSXBna0hLalYycXVsZXh2akMxRUVX?=
 =?utf-8?B?bG84d2dvZ1U3djB5c0hObm50MG1sV1dmZ3NJZHd5aHhudTJ0L0JJYVE4NkQ2?=
 =?utf-8?B?empuTmpwZEk0RzdXUVozTDdCMEx3blZuUGoyVGRhZGdBSzQrQmJMNm9ENXJC?=
 =?utf-8?B?YnpMUE00cUZUZnFTVFhKMnRWMzRzdGdVNWJoRURaMjZ0VnVra0hjTGxCVGdt?=
 =?utf-8?B?eHJxd282bjBFcHlRaXg1NkI1LzBEYThTVWZxSE16V0lUd1plQUJjSWVyeTcx?=
 =?utf-8?B?ODAraW1yRHRGU05mOWcxcGdROE4zR0ZxUlVWdHdlT3dZNkIxN2pYd0ZPZXk0?=
 =?utf-8?B?NzVaK0hZVVcrWS8xWklVRy9MejRScjVGdjlrMDVFelhOMGpNMFpNZ0pQNklJ?=
 =?utf-8?B?b2Nucy9WeFNkdjRqZUVFQlBFY1cwM3NwWUM0alZ6bkE0a1BpUExZNU1CUmE4?=
 =?utf-8?B?b2dHRW5qS2FxclBUckwvV0h0YjdaTDNTRTgrTktHcHpPVDRpYys4eVBYT0pE?=
 =?utf-8?B?cTJVbnEzd3YxL1FibFB1N3ZDK3lMRGFXSFdJNkN5UHJ0QlNzNkVmd0pqTmE0?=
 =?utf-8?B?YjE2UURqeVdLMTBIT05sTkk4U1R3OTN1amtkbDRTOFdYS2F4emNoc2hpeDZ2?=
 =?utf-8?B?Z0tIZHZsNG9BbEdXTFROV2NNOFdTM2VYS3pIVDVzNVRSQTNaYVNyS3hSWDdD?=
 =?utf-8?B?ZndYcFpmRFJocU43SGpLODlpU2pDeHIyNWxUY0FFYjVrTzJvZUNRWVRrR2li?=
 =?utf-8?B?SFl1SmhHakJNMHh1bWFWWW5GRE1GVDE1RFBqZ0tpSXdoVWsyWkZEc2x3VjlC?=
 =?utf-8?B?L3d0eUwydFBQNEpDOUNBbk9XRjMraUtWV0NPWFlVNHAyWUw0eGdodzFuTkw5?=
 =?utf-8?B?bTk5NTBqSFlPK1poR3BTNEVUU0I5VjlyekNWRDJMNHQ2NE0yN3JDZ0J1Umgx?=
 =?utf-8?B?OTJldU9wd2w5TVhxRUJWM21XRFhkVVkyenhVUVo3OUc5eDFka05ZY3NOaFBV?=
 =?utf-8?B?RDFGeXQ3NDgvNDFpN1hCREV1YnAzM2JpOFd1K0lWZ2NsQVN3M0IwZStBMmp1?=
 =?utf-8?B?M2p1RW1HejhmRDdjRG5VS2VTMXFQTTRpM252dmdzVkllSGpnenF4aHdZT1JF?=
 =?utf-8?B?cVhzL25NZmYvMi95Zlp0L2h6WlBHOXVoT2t0Rzh4MlRoanRnVzlKU080SFBQ?=
 =?utf-8?B?cWtBRVpyY0tQdTRzL0hhMUE4UkM2d1BlZmlaQVBKWWJLOEFUSUV0QTJGQUps?=
 =?utf-8?B?NGhycThmWFAvdzExalJ4enRUN0swcmE0d3F1VldXSlFIREpuQk1UU2pwTzZJ?=
 =?utf-8?B?SGRwUTFMNC9VQkZNVWI5QVNhOHVZVTRQUG41M2lua0YrckpwTmlpOWV5WWsw?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ed314-4b93-49c7-b031-08db400f2fa6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:16:57.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ9LrpXXZU4ntfIuKUDjVmxteCDEu2m0o9+YMP+yftXFaybllzI/Yk8so6WATXjlX0XMuL+ctPjvpNa4SB+NgiyeOxme1gpfeVFNZav990Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5613
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.04.23 15:12, Marek Szyprowski wrote:
> On 18.04.2023 12:42, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Assuming that with the init flow fixed to meet the documentation at
>> [1] and the pre_enable_prev_first flag set in downstream bridge/panel
>> drivers which require it, we can use the default flow for Exynos as
>> already done for i.MX8M.
>>
>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>> I have no idea if my assumptions are correct and if this works at all.
>> There's a very good chance it doesn't...
> 
> Unfortunately this change breaks all Exynos boards with DSI panels. I've 
> check all 4 panels that are in mainline and none worked.

Ok, thanks for testing anyway!

As already mentioned this was rather a shot in the dark, as I didn't
even bother trying to fully understand what's going on on the Exynos side.

For now I will just remove this patch from the series in the next iteration.
