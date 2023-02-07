Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6168D236
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1EA10E48D;
	Tue,  7 Feb 2023 09:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2133.outbound.protection.outlook.com [40.107.20.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3BE10E0F5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 09:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K97Fk8jxXe+ZzH4CZgeGpZ9jZiHQWmPrCW5RXXN52ykwxZspkT2sUvli44eAmZ4l0eSt6jqo+y1JWQ/clct5xRCEwVOVmuff1hlRjFsP1t7MYsTbkSWoP2p7lTK1GhVK8ZRMweyFRM3i+GCKag80y53ysDn70WBi6/SL1mFLfsRgf3c/69jaSD4zRe9uYolJJW8JyJqy1l6fUOPUSeLL1ESAfkB008YxTsA2437kvfi1qeLaox8Y2KBpLKy1gahQmy3tkmGShBPNOBRRSm8lZwbqI/fL8FeFeNQhDyqFbBUtD3o76sGmLEMxFLlPupKAD/SyJ4KqT00+z9Ll+ggV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYflIpEMNX5RRGTcXFusBgyMwA1wAQ5zCps5fnTpGN4=;
 b=KOQ4twOBI3Ifd50uT2+44mejAqjQ2rm2WiFmKN/AztIafm1i4lVW25b2CX54JbqFrNKN/a0iE6rP0ZOuiOND4lC/nWeZyAAv3H+LkavWGz0qnPO2GUF56EtZlH9WrtCcNepI4jn8Arjj3VeeygsS8+IB4HZ2ppZFLZvqtvhI1oZLgNsu5vYVaRenXWbZRR8YinnjI2nolVhI+XBbQzRTP9YxOGP6QN737qUgZyChMypG0B0YgHc3c4WXBM33L0GFY9pWek4QgWAPMyO0MwixWpG9norsMqBHGdY3jDNEX+p8OINodVVgRwTec6oc2Tyec/xgo1+El7gCuZv0IUe15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYflIpEMNX5RRGTcXFusBgyMwA1wAQ5zCps5fnTpGN4=;
 b=Kd44C0hz4aJx2xH5vRVG+boJMgAU34x11/N8ympkSSvbPwLRT0AjxjFRcoLd59dWRvWbOP6Wv3wstH5NMB3Xjxca4PTR/uo4WJawdnr43ZrGz36vJ485PbtVdbYlP89UicmSAIZ1U525pKeX3IwceG0dr2HY1B4Zcsh734/Aqcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 09:09:15 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72%8]) with mapi id 15.20.6064.032; Tue, 7 Feb 2023
 09:09:15 +0000
Message-ID: <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
Date: Tue, 7 Feb 2023 10:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVYP280CA0002.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::9) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|VI1PR10MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f93d5ed-2f00-45c4-8ee8-08db08eafc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ka1YXkmZTV9QNg0VSINe+1M4Qbb3f2ahFa0WOTy5ke2y6KrMEg1aD9wL7lqRVr5bDyM+ugpdgcMxd8RR76yn7JzcYKcd+oIk8XHS7XYWW4SjwO2gFq7TGie5/P9+rwZi6PvbE0lZBwLGCRYiv+YaUDm52F1ojkznPJH0SflvwdXgeo1SttDFh+lIwJ02FYMbiuPDDkK7MQbddrIqpCFszOfC4ifQW5q7S0hMDFoEZdgA2nLa7THPjwdk/ZMjBvGi/4NLePxf+ukznqgDdvUYBFnX5fLcO1TxImF2eY6/RLPcO2db7IMt72mnFDnva3ORfPFU0irvGvy4Kh7Gg7P0Vv0vebTogFijl8IwmEJks5wYuCwbRw9FFcD9er6OvM9Sbm7g2tJB74XTWYrMN7rIzqy62uRemVHujGwspwIBuzyH+Bau72MviGCSbMMue24NR83ha4KLatjkXKWNgZjT2JHIfkQy7rYZ06v8H71MIRZ519WNiHrT/+QBcAEHt6t7sbB3ANvTA0H1iIp2E1oFx4HiTa/u4csbyQjgaDu67lG/ZoYSJHtNJR9ZrdmouODvwHIhXX6FXNn4jJMINL5d7I162bXmEX5aEXxUWo9hzP6ReewmGCsi58PP5gQaRZqJvrLmK4nk53LezWuo68PaKyVXKlAvRPhq5G3xSSiXrZ4dE1daU0SmFh8CkDAJ453iqrEYcRYlO3N0GSILpmb8lkds5HnTpcgoP+hXMHOPKxRN+ER7fnq9YjzJsU2UEuh1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39840400004)(366004)(136003)(346002)(396003)(451199018)(86362001)(36756003)(31696002)(38100700002)(38350700002)(478600001)(6486002)(110136005)(52116002)(316002)(2906002)(8976002)(66946007)(7416002)(41300700001)(5660300002)(44832011)(66556008)(4326008)(8676002)(66476007)(8936002)(26005)(186003)(6512007)(6506007)(83380400001)(6666004)(53546011)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHZGMzdIc01rYWJlaHQ0YkJLVXFNZEpVWmpCWjFYZnh5S2JsUEU5RkY0ZzZH?=
 =?utf-8?B?Rm53WUp2ZTdmMlc1eHNQU0tTTVFqMjAxQXhCbWV2Syt1THpyY280bHBiQ2x5?=
 =?utf-8?B?YnNLMW1XVng4Q1BFY21FZGozRExmM0FFaWtyVFZwRzN2VXdhMlcvalJtSkNF?=
 =?utf-8?B?dGdwZkMrM1JhSjNkeFdPVzl4V3orM0kzbkRTWmpVZEtCcXFoczhkUU9SUGZD?=
 =?utf-8?B?UnN4dnFsSE9MeWhYRkVuM0Y0Njg2TDdEZHZnK2RPakhoTXh2NHhrWmJzbjBQ?=
 =?utf-8?B?RitWSk5YNmF1T1A5dUlPOVRDNy81TkwyRWZYL3NvWFVLeTJNMGVLc0tBb1d0?=
 =?utf-8?B?aUNubE1uSTJQdjJlNnJaR0hXVWdMODVVMnBQSTN0Q1duWHBrK1Byc1dZN0dR?=
 =?utf-8?B?b002eWZhL3FSaE1QSnRWS0J2K1hWWnpTK000VDQ0dGRlUG5FV0d1TDMzYnVs?=
 =?utf-8?B?bkpiSUlKWGloV1JmL3RNYjRveWFIWHNoQit1bkZwWlI5VHlLd0h6VnE3NnJK?=
 =?utf-8?B?NTRJWllCc1ZQVEVpYW1nTGdQQ016WnR5R3dxNU96aEREYnlhQS9Ca3JoSHl0?=
 =?utf-8?B?QkcxM0ZsZ2pzcHc2V1UwUXdqNnAzY3lBdUJzZE8zd0lMR1RZRmRnSTlNOURU?=
 =?utf-8?B?VG1jc2R1VEdlaGtUZTIxMCtPOGdRZFpubFdDcmFVcisvWUF6L3JSWWZRMDZK?=
 =?utf-8?B?b29WR21NVUNMTzdtb1VPVkVGUWd5Z2RFL01WdnNwSlNISEVyc2l6aFBJYk5v?=
 =?utf-8?B?UENzQkhERmVjcmExRW9ENVc0V1VySmVrMFIvMnAzeHJGMEFBd21BNk42VDgr?=
 =?utf-8?B?NjJYZG1zQXRTT2ptdERLaVhYU0NDd2RmQ1pIK2FQSmk3Q0RqZjFjUEFlY0dJ?=
 =?utf-8?B?dUJTTlhHM1NPVythQWhkNUk0Y0l5d3AvQmljTGZtVDhMakQyMkhGTXhxc3lt?=
 =?utf-8?B?cXZKN3dnR25EOGxSb3BJUkFkWFBVRHEwWVNJOGFrZGtLZk84VFFWT0l2elBP?=
 =?utf-8?B?UkJ3c0M4L0d2TWIvdmVBaldDMW1IWTdrVzh6R2pOSFVMM2xZem5YbE5rQVE3?=
 =?utf-8?B?UHNDZmxXY01DYW1vZnMzQWhKRDJ2VGtBZ3diNjAvazMxZytEWDZhcXZIYnNK?=
 =?utf-8?B?UkNzQlJ2c2tLRHJGckRCbG5KbmpnL2w3cVVjN2FKQ3VUWng5SmEwbmR4aVJQ?=
 =?utf-8?B?ZE05YWJLUVcyZHVDOHhrYi9nR1VlTXZHN3gxakpub0J2OWtadmxYSThBOXRk?=
 =?utf-8?B?dTdkTStDejRCbUZ1TjVIVmo1eU9KZFdpSWkrNWFwSjBKc3N6VFZHbTM5cWxs?=
 =?utf-8?B?UDNGc1JTSUVKY0hrNHFlUUdJbHoxMGI5VVZ1OVZlZE5nc1M4cGRHNmtOVjJ4?=
 =?utf-8?B?MFhKRGM0RE8wR1dleTVnUWVLWFAvcmFvcDdEdzVTMXNJMloxb215ZjU4UnVa?=
 =?utf-8?B?S09qN3lwZ0pVb0pqNEZpVHN5M3ZjamljeUM2YzF0K2ZYWjAxazNqUWNGMlJr?=
 =?utf-8?B?cEczQjR2dlo0SmtsbTlRek1hN2dKaUJ6QVBBc0k5RHAzcHc3bThQdzNCODhi?=
 =?utf-8?B?R1hhVmhPVEx3MTBTTE85ZVBoM05FdUtmM0M2ZnljOUEzMEFPMDRjNGhYeFFz?=
 =?utf-8?B?VXhwYzJCTjlPK0lzK2IyUEk3VW5RQTR5R1ExRlFVdjdxUXhFSmpFTEozaTZJ?=
 =?utf-8?B?b1JjdEw2ckFkc1RMMGszTmFtSTg0SHRsK1p6L2MycXViR0wwS3pkWWNYbi95?=
 =?utf-8?B?UGErY2p3SURyc3VHQjJJeW5CUVZGVlVqOVlRQjdobElIRTF3RXE0Y2g3Vzla?=
 =?utf-8?B?d2pKTUJiNWRxcDZtS1FwRENiUzUwdUQ5OXBXeFJveXFlc0s1ZzJidlN5bzhk?=
 =?utf-8?B?ZkUzMWJkZzBqT25DVE9CRTR0aHpvbkpEeWZHSG8rWUFSeXN6UVEzb3diU0dx?=
 =?utf-8?B?WStsUmdlZUJBRFhXalhxQjBIVVpKemVUMkkxRzdiRUJZL0dzZG5UcVY1RXlq?=
 =?utf-8?B?cUptNmZFUmRTdm9qL2hDZTdYMjA4OXU1QjFGM2hyQVQ0ZkNCWnZrSVF5RDVr?=
 =?utf-8?B?c0tEOVROMVR5OE5GblNwTnJvRDZSUHRlcFhNS3hhODFvT2pqeDZDN05WZTVH?=
 =?utf-8?B?aWl6eGxvZy9KVDUveDJBcnIzeGJVd25jOXJYM00vT2dnUzNVQ3UvbWhFcU1u?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f93d5ed-2f00-45c4-8ee8-08db08eafc3e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 09:09:15.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlaqRNEj95mXaaQHyrn2/Lg79kKkk7NFH9y+ecUMZS7hUMEM+ua3qzFoOPerIs27HYxxTUh2eqU3b5qaCVGZoHOgWjwitV41dPwcv1VfGsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3535
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 09.11, Frieder Schrempf wrote:
> On 03.02.23 13:29, Rasmus Villemoes wrote:
>> On 01/02/2023 23.00, Marek Vasut wrote:
>>> On 1/30/23 13:45, Rasmus Villemoes wrote:
>>>> On 27/01/2023 12.30, Marek Vasut wrote:
>>>>> On 1/27/23 12:04, Jagan Teki wrote:
>>>>
>>>>>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>>>>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>>>>>> help to do the equivalent of
>>>>>>>
>>>>>>>     88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>>>>>     f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>>>>>
>>>>>>> for imx8mp in order to test those patches on our boards (we have two
>>>>>>> variants).
>>>>>>
>>>>>> Marek, any help here, thanks.
>>>>>
>>>>> Try attached patch.
>>>>
>>>> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
>>>> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
>>>> of errors during boot:
>>>>
>>>>    clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
>>>> media_apb to sys_pll1_266m: -22
>>>>
>>>> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
>>>> is because
>>>>
>>>>    clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
>>>> media_apb
>>>>
>>>> Further, the mipi_dsi fails to probe due to
>>>>
>>>>    /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
>>>> 'samsung,burst-clock-frequency' property
>>>>
>>>> All other .dtsi files seem to have those samsung,burst-clock-frequency
>>>> and samsung,esc-clock-frequency properties, so I suppose those should
>>>> also go into the imx8mp.dtsi and are not something that the board .dts
>>>> file should supply(?).
>>>
>>> No, that samsung,esc-clock-frequency (should be some 10-20 MHz, based on
>>> your panel/bridge) and samsung,burst-clock-frequency (that's the HS
>>> clock) should go into board DT, as those are property of the attached
>>> panel/bridge.
>>
>> OK.
>>
>> But I simply can't make that match what I see in that branch. For
>> example, there's imx8mm-icore-mx8mm-ctouch2-of10.dts and
>> imx8mm-icore-mx8mm-edimm2.2.dts which both seem to have a ti,sn65dsi84
>> bridge, neither override the values defined in imx8mm.dtsi, which are
>>
>>         samsung,burst-clock-frequency = <891000000>;
>>         samsung,esc-clock-frequency = <54000000>;
>>
>> and that 891MHz value seems to be out of range for the dsi84 bridge -
>> under Recommended Operating Conditions, the data sheet says "DSI HS
>> clock input frequency", min 40, max 500 MHz.
> 
> Please note that the value in samsung,burst-clock-frequency is double
> the clock rate of the effective DSI HS clock. I can confirm that a
> SN65DSI84 is able to work with the default settings in general. Still
> the LVDS clock is derived from the DSI clock and the sn65dsi83 driver
> calculates its PLL values expecting a DSI input clock matching the panel
> mode. So you might have to tune this value.
> 

Hm, but in my case, I don't have a DSI->LVDS bridge, but a
DSI->DisplayPort bridge (sn65dsi86), and I obviously don't and can't
know what monitor(s) will be attached at run-time.

I managed to get the whole chain lcdif -> mipi -> bridge -> dp-connector
to probe with these settings

	display_port0: connector {
		compatible = "dp-connector";
		label = "DP0";
		type = "full-size";
		dp-pwr-supply = <&reg_DP_PWR>;

		port {
			dp_connector_in: endpoint {
				remote-endpoint = <&sn65dsi86_out>;
			};
		};
       };

	eDP: bridge@2c {
		compatible = "ti,sn65dsi86";
		reg = <0x2c>;
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_eDP>;

		interrupts-extended = <&gpio3 14 IRQ_TYPE_LEVEL_HIGH>;
		enable-gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;

		vpll-supply = <&VDD_1V8>;
		vccio-supply = <&VDD_1V8>;
		vcca-supply = <&reg_1V2>;
		vcc-supply = <&reg_1V2>;

		clocks = <&clk_38_4MHz>;
		clock-names = "refclk";

		#pwm-cells = <1>;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				sn65dsi86_in_a: endpoint {
					remote-endpoint = <&mipi_dsi_out>;
				};
			};

			port@1 {
				reg = <1>;
				sn65dsi86_out: endpoint {
					remote-endpoint = <&dp_connector_in>;
				};
			};
		};
	};

&mipi_dsi {
       status = "okay";
       samsung,burst-clock-frequency = <816000000>;
       samsung,esc-clock-frequency = <60000000>;

       ports {
	       port@1 {
		       reg = <1>;

		       mipi_dsi_out: endpoint {
			       remote-endpoint = <&sn65dsi86_in_a>;
		       };
	       };
       };
};

&lcdif1 {
	status = "okay";
};

Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
that's a separate issue; when I boot with a monitor attached, its edid
is correctly read out. But I still don't get any output, and the monitor
says "no signal" - my naive attempt (which has worked fine in other
cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
some important step.

Rasmus

