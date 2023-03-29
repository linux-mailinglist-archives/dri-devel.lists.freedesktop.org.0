Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732816CD4F7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 10:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA610E50B;
	Wed, 29 Mar 2023 08:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBA010E50B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp2ijfhN6Z4cVgKKlAUUNZT9/mFo7Fo4/lAQkdkyUA6uj+l18OcipZ/imiRB+LH3uoyfoKyvZysw2RhhNigRl4XHpNgpDCplWHgz5ifs2UxSeJvrz8C7EnwWfijQgMQ06AGZKHIPrC/ojF9ekeEuPfXbjzw8Gm8KwSBhvhU3u8ydRq6pcq8+xY55kQPMfivAi5xa0V1GSUQAXOdyTC6OWqymPWlNmHefLx9uZngxUwSPh44Ee1yqUykWuTCFRO0OKg0aglrI57WmZC0xc5cYTgdxeWtslQsJM/WHJfk0kgavkNn338/tcHYN0oCQIptQsslulgqrTNFvYKboQd46Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Zemu+f7/a8qHG9XoopeGe6ggeyYkK4mJOudusJboqM=;
 b=brkOmRUezcGtbtshUATbNXAHbAVF8sltfewDhF867Mytvk8TJbnEzw7LLVScntcHmOkD/hzEMU+hcbcGabBj470lqnuzQhzLjAx3IYZ3wRsqRJ+KZKf5IdBXOjPRElXUi6Nk+G6HoVIlj/Ht6FXa6g3pbXmCKCfDRajZctw9DqsVXnjd83hmEJHUWum4GBQFfOPQLY96WcGP+S+poUCutxQVQhMcjgOCHhzue3Hq8VxkqT2CI+oLWWl1rWFBtxN3w783aCaOyjasCxrjPQ/G7WTiZ2NhlATwvp5KjpYNwNcopKw4hEOuPyZCpaJTnVJJlNBt7q20ajeOMMtRlKueig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Zemu+f7/a8qHG9XoopeGe6ggeyYkK4mJOudusJboqM=;
 b=MYxAb1GeAj0W3k76s9ZpemCmuBbnsD6SyRKZc/6/sNQSp7tXDfc6Ge7iZCuCv/1+CMiOZ4Fokr27NxXAEIwvKVvWw5C4keL9tUwgiSfy7gzd4xEk3l5LeUcGutwS11NJtFF8xgWzV3I2xCfr8C8j2LTYRhmVSjNpwib0PkO4fv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DU0PR08MB7437.eurprd08.prod.outlook.com (2603:10a6:10:354::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Wed, 29 Mar
 2023 08:43:09 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 08:43:09 +0000
Message-ID: <dd8c3872-4391-635d-daf4-df2e5c419c24@wolfvision.net>
Date: Wed, 29 Mar 2023 10:43:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] Add timing override to sitronix,st7789v
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0201.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::22) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|DU0PR08MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: f22de278-99d9-4b8a-ff13-08db30319fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlXYkIC2xDq49v8+Q7Kf/dScGGTrp8Ewbm9OyYrt/H4udQGuHPcU4xyqp9BHl8wBkLeamRMilMFNJKtC9QVFlkTQoulHiooajDiKtLzIIWMYO+dKwZm/sJHos1kF6WZmTpcDwufl1DA7Js++juOeDcw8YPZbEq09nCwph13JBMbiNtni3iCj/VH7tAID7sZ3nBIp/drfr5x4SUbFESQNYtm1M6vTwpnxDwYY37qLOZiVHoCCBgeIvtI558DQfqycMpV3qrtpJVtBT2tUUde2CySwTiYgRWtanvz2gUh05AlsXv2Pgk1aAv4joqCQPWL6YA5VcpJYB0pIHXhvcLJw/3NZ/5Cxig3dWrkde6PmE94B95i4lmZDKqpdyW6eRMgqNRXFpI8LjLg0Vyy4dk5gCBevjS+1lAZnfUxVXyI68HhljVxK/AYWZbEULq5NxUL9C3vffB66OsUeb0ayPPJfHkEh/KZmVFIZ3kypLy7/pCBpDSSSeAlEqQqOwzzm9Yr6U7pci27X2wYIdthdfY5RI1djmvzDi8LKh/i/qAD+j0jZ0b0ZX7rrkT5VXc603N8oJuk+P7s+ngeVfl0fNWeeaynv3KdOziYNerNvbh8Jh8J8sKBFpit+yjw45O9kTb4PO5ue72vvHDFzDnO2l6pdcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(451199021)(7416002)(36916002)(2616005)(8936002)(5660300002)(186003)(6506007)(26005)(36756003)(6512007)(2906002)(107886003)(86362001)(31696002)(44832011)(83380400001)(6486002)(4326008)(8676002)(54906003)(66556008)(66476007)(41300700001)(66946007)(478600001)(38100700002)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1A1d1NPazNFRVdPNEZIRWNRTGczMS9ZQitPNDVRQWYwamF0MXdIZEtYRnlm?=
 =?utf-8?B?aHhWdFRXc1FEalhmR2RTOTUra2UyYllIc2hVbUVLS1B1VjQ1cTkwRjA4eDRO?=
 =?utf-8?B?MTBLVkk3Qkx0d0tVV1lCdWxBQU53S2RxS2l6QnRjVHFtOFNvem5vRVJKT2NJ?=
 =?utf-8?B?K0FmaC9kVk0yUzY3VGgyTi9BVGY5ZWpuamdZUU1YbzZNb2tSU1Y5ZWpJcE5t?=
 =?utf-8?B?bEhLSFlMU3F2OXhpb3RhcldxUE1EcnNaWDl4dFlqaUJnbjEyUzlBUlBoSEw5?=
 =?utf-8?B?bXBiTEMyeGxRUS9vV2Z5ZHBkb1lVcHZBRzZoZWZvdWhjNXYzYmIzTGNKanZr?=
 =?utf-8?B?dk54Y2JGMjRXdzU1T2lWM2E4akJVYkJCSnNjYnNVdEJvcHZvVFJHdDYwb2tS?=
 =?utf-8?B?MmlKdUpDQXRJemZPMVRYdkFmVG8xUkg2YkJXeHJFL0VTcWwvZElpRzFud2pl?=
 =?utf-8?B?Ri9FMHZqczl6Q28xQ1NRNk5WQnpnQVQvWnU4bjI4MU93aWhQd0ltZUc4VkU5?=
 =?utf-8?B?Um1pVTVKZS9XUHVSOFpzdURtcWdTb09Tanl1OHNBYllwWGk4SEg3T3JaSGg3?=
 =?utf-8?B?NFl6clYxYlVBRmdGR0VBNmdoQVpGemlKRkxlalE3UHBXRWZ1OUNSOGZjTlFz?=
 =?utf-8?B?YjF4NjJUL0IzeXFqSnEvNllBbGhDbkxIZTJLc09xVjRPQjFHRDcvOEE4Qzk1?=
 =?utf-8?B?dUhRY1RGUDRDdGMxTUhCc0Y3V0NvSWJSZ1dROUN3N0pWK0NMODNsTDk3U2pP?=
 =?utf-8?B?UStlcWg0LzNpQytQbmlneEpnOGUvR2l2NVNsS1FHOVM5OHFwM0tMY0U5US9Y?=
 =?utf-8?B?d3Zsa0xPWXBVeHp6bys5UTN1RUZXV2lNa1lUZjJmUElEa2YyeHQ4anlTR2E4?=
 =?utf-8?B?Wko2a0Q4NVZZdXpIOFpOUndCTDBUTWpZdWhack1tZjhpa0FEaVJGTGxvaTQv?=
 =?utf-8?B?bjl4WnlyYnpvaDErL01vWTA4dmxPMkJzenlDcUltdjM1dnBJSDhFR1Q5OElV?=
 =?utf-8?B?SCtBQis5WnNRUityNTFhWEdweHFwNVl2WUJyRjNtdVVRejNWRW5SNmc1M2dO?=
 =?utf-8?B?Y0RVYUROOUZKUkpwbnFQOTVoQzlHV0ttd0FxOVI5UFRGWXFqYmp1bHEyNzVM?=
 =?utf-8?B?SWh2MVZpVTlxNEFXUlRFWFVvZitzamFRQ2JFR05FQWc1elpJMmZBclc5WDNM?=
 =?utf-8?B?Mk5wY3pJWG9SS3JlMTZNM1NXOHVSVE9KWmd5VTM0cDBYZ0R5NFh2ZWdOSWFK?=
 =?utf-8?B?NEtqbm0vQzJ6R0VCR2UvQzY4dm1aR0hrdVlGUXBaTG5SeTNzdjh5UUFnUnZP?=
 =?utf-8?B?MmJuU2JxZVBUdnlIR0dRLzJ4MzNyeW93ZUR1bDR1NXNKdVdmTEJKWjJYcHpj?=
 =?utf-8?B?K1JmUkFnNWpFbVJRc0U5THA4SWU4MGNTN0RFME44QTV6UnFPRmhQT3poelZw?=
 =?utf-8?B?YnFrSE8ySzZVY2FNYjUrTkZyWWRhOS9rU3d2MjdIcSs2blBrT09UWDhVTkZa?=
 =?utf-8?B?cGhlNzVsWEE2b0VQd3lsNXE0UnhYMXFFSmZpaHlyMGNOaU9OOGplZzdDcXAw?=
 =?utf-8?B?bmRESzhvUVJFTTRUcU04TTl1WHhWQ2pLL2hFV0ZQaXBEYXllSW9kTnRaZkh0?=
 =?utf-8?B?MytBVGVKeXZwa3ZqQncxVjR2R25GRktKL1R0RDR1OG1jSEVyZ0o5N3JmM2gw?=
 =?utf-8?B?djZsYmRHbEI4TXZhc1Q4MzVZUDRUR01xWHZPdlpmejNKWi95MW1mV284V2V4?=
 =?utf-8?B?VFUyeForSFh5THUzb1Z3SDkxSkdpd3ZRUVlOaUlxRUUwMjNia3ZzRjdSditQ?=
 =?utf-8?B?cC9NUG9xYzlNMTRTWFRWTXZSWHBIK0svWEF0QUlaR3pJQ0YwWWhVemNMNVFK?=
 =?utf-8?B?SjV6WW5VaG1TN3A5Y1RXcDF5eXVhQ1RMT0NBU3lnUmZMa1VXYnBtNUpEUk5E?=
 =?utf-8?B?OEExVm5aTHRIbzZ1RG5iaHVRa3kxWEtVZnN2NjFWTWNwZ2ZPKzdmYWJWRUJ2?=
 =?utf-8?B?MElJanBrTUpGellVNkVaQzUzWGpGcWFaeDJCemNPOStoY1doS0VoUUdEYS93?=
 =?utf-8?B?Rlp1dFM5SkpQM0JVdDAzdjl3U01taWRVUlBuSXFaNFJpTGY1U3BrYjlWL29G?=
 =?utf-8?B?bU5odGFuUkkrS2pVWTBtSnlCVVBxamtmbXZMd0poQm5QZDg0SStXRzNBenRN?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f22de278-99d9-4b8a-ff13-08db30319fb6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:43:09.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXGlB2s/Xsz92eJc6kQtYj9Z6PjJBLVhpgBJn01F5+lgmN1gramwqHe8eFANYdmEMFpu8jQ0/u8S1J5NFtA+W2PetxmrO1wJ3RqYbCcFmVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7437
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Besides dt-bindings, there has been no feedback on this series yet. How
to proceed?

For clarification: Besides adjusting panel parameters, we need the
panel-timing to add a partial display mode later.

Regards,
Gerald

Am 14.03.2023 um 12:56 schrieb Gerald Loacker:
> This patch set adds additional functionality to the sitronix,st7789v
> driver.
> 
> Patches 1,3 and 4 propagate useful flags to the drm subsystem.
> Patch 2 adds the orientation property.
> Patch 5 parses the device tree for a panel-timing and makes it possible to
>   override the default timing.
> Patches 6 and 7 add the new properties to the dt-bindings.
> 
> Gerald Loacker (4):
>   drm/panel: sitronix-st7789v: propagate h/v-sync polarity
>   drm/panel: sitronix-st7789v: add bus_flags to connector
>   drm/panel: sitronix-st7789v: parse device tree to override timing mode
>   dt-bindings: display: add panel-timing property to sitronix,st7789v
> 
> Michael Riesch (3):
>   drm/panel: sitronix-st7789v: propagate RGB666 format
>   drm/panel: sitronix-st7789v: add panel orientation support
>   dt-bindings: display: add rotation property to sitronix,st7789v
> 
>  .../display/panel/sitronix,st7789v.yaml       |  19 ++
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 204 +++++++++++++++---
>  2 files changed, 191 insertions(+), 32 deletions(-)
> 
