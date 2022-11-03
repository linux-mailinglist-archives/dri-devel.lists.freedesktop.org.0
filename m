Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88210617939
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604F710E25A;
	Thu,  3 Nov 2022 08:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA010E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 08:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/7COWVc5Pq3aGlEU4zY6zZ7z19C1JSzBuW6hz96wPu2edFXEbrnEX05BNHqg23qd/7ggP5LquVtjKP8oed5H+RXwJO/sWNsohh36FjL05PGrqJ4TgNtU4d+09Kb0uxDj/xpX0V1mCs1mikhy4AStd6VNSJQkpTOGSyn2goMwlfUJcN0gLaP0kKVX5ChSZMXm6XQXnSwnOU817P5TgXLnkBO4aKbgzZRLwLcVRrG7Gs8pQhqSwG6DJl4Iqc3Wwf0p28yOoGCWcbXcNd0meX1nstkrTAa2dhuQ0yi4ap0mTu26gfOHMjmr8rWNygz3HSZIvonnSb4RRLc+NEPtZDXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00S+rmC3Ib/nNyAgpiVv8I5GaMxKlyiYFkPskAxVhIQ=;
 b=W0bsk3phYTxYyLbmHkvWbjbIqmIUVxPeeT15hblE1FIAnlbZHF5jT5XVycnQzYSEJoaEzELQ9qp84zRrHRuvjUdXcxVJ60ARTMBNcsZE413zVj+AsOm14t0g5fnA4GxPvJIUcBvVz3FmGk1B48dr/DTBsP2VmaqXwCZY5iPhD5gzaqHDYxm/o/CkAWZneB54IbvqT+GCdseqvryda/AegR9EKvWE0xV4hiztyzamhCPaa/OEN23YMK3T35JEdM2gyFhrKN6GP7eCISFgudknlrUFBntktu935IezC4CNYnv97p9bWSf+S4Xqw0YIcwpoIFvCK7L4va80YVdAOmzU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00S+rmC3Ib/nNyAgpiVv8I5GaMxKlyiYFkPskAxVhIQ=;
 b=hxiO7DUNpAWjlzr0jj3yUjmZV1wZUrQ2gT//3ntyfoTzImGIX5H3M/s74HOt26ph1bzq/SCZqxQU566571FAQOME59VWVIWfU1S6uk775zR+0uU7xWwXWjBVNGYPbW/3hymRWRQzQ1Era7kTBtekKFKjwruZvuFKtjWf8gxhQ4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9241.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 3 Nov
 2022 08:57:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5769.019; Thu, 3 Nov 2022
 08:57:05 +0000
Message-ID: <c3a81ae305118feac887e30a2c796803763f067f.camel@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
From: Liu Ying <victor.liu@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 03 Nov 2022 16:56:27 +0800
In-Reply-To: <20221101140404.pwsxecee3rmot7st@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
 <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
 <45837065-f231-8c72-4818-d943133d66a5@denx.de>
 <57059f620dc6dbd63ef289a82c8dae685d048242.camel@nxp.com>
 <20221101140404.pwsxecee3rmot7st@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0646bc6d-5b5d-4111-0f82-08dabd796119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MoJxMoQtLzZ4Bogh/C6Aga99sS2YXfeoaHCHwfHsuXWNabo55nelwEGUN1DEoW1HsfcRbI+ruIeOW8Sp5U3CH0ArkXxvpQG/5xaPU0/hRgIyIGObq/kMR0RZHkMZer2Nw2FOBz55B1q+Xsmdg+wxR8bdP9EpL7vY1HvczrIdWG/bsxlliCVQJkZrQK8U04z1l/nlcVn1RcshAIt7N89TcoH7mmTtPa5PNq46SlYlGmajwgv/aR4z28c0+EGnw3mGfIpf+bnSqFZPh9Ov6kwxa+r5dItgLFMWAg5uojNf9zvjgCY48cpvFn4bzqYUqm0vHhkG29L2Yhy4tgdxmiu6zVnPAhYi7yU1djLpezTzcMtR9vbB8wQoMrKVvqBX9UIockRtv9yhEVUK+LL4s/4/DXTFZkMA8UV6pzte4vRE6YJHENYfu6QPiB/iciU+7ausgNCxPfRytWBXTVIl52/Sf1A4apniG9qmfmLwZQAKjCoA2PHug75XYyNMui95qt6rs0u1o7IfaYYO/qKKbb9wuhbcB8gll+y6HhdALxXrLqPCP0QPC/07CMvZoa9+Uactau2fXaSAyNhSrInJbVUiEBKkBw6NySlsnI3+BpZElWs1TiWUNb5v6K1ys6fmD6pc7ccsReNEwLX+Smoh50nr+y7HEXsD//Iuj4ibtHwYL1RDLOylRt7372yxh2rnviASHQ/9jLd8r5FGNRqxszMua0c0a9Ibzn7AsEqxDWBv4ZFmDpVdr/U/1jrf/WmRIxklg/sWiXAqUSJ0HTbdgAoUykhCROwIAUpb7AeNG3pmcz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(83380400001)(186003)(38100700002)(2906002)(316002)(54906003)(4001150100001)(6506007)(66476007)(66946007)(86362001)(4326008)(26005)(41300700001)(6512007)(38350700002)(66556008)(8676002)(478600001)(53546011)(2616005)(8936002)(6916009)(5660300002)(52116002)(6486002)(36756003)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1Q0azBvbkg3T01hTHJTSnAwaGpyTEpMbURZNEN4K2FSbFMvVStEcUVaK2pu?=
 =?utf-8?B?eGV0ejRSMVZiSWpVNmcwNFBSY1JsS2xtMzBmYSt5U1JQcWt0Syt1R2hjU0RW?=
 =?utf-8?B?dWFPaDFKV01OdFgxWWhxNjlYcnpIeG5nOFJORlREOEtpOVpnNldxczJGUU5J?=
 =?utf-8?B?UHZwaVBSOFpXTnhjUDZsNHZiQ1hIQi96YXRpckt3dlBHc0dMVGFmY3NkOEFO?=
 =?utf-8?B?NnlLcVFVS0tSY3crNUY3dUp4Tktleis4bGcxZFZEOGk0QkdEUHBQb1o0Zk42?=
 =?utf-8?B?STNzUElWTXJTSXZFWmk3eVBmQWZDMnJlZkhuTS8yV01jY1czUnBObmIzM2Qy?=
 =?utf-8?B?aFhmTFZwZEFzK3dPOFI3WnZUTWNhOU5JYWFyMWxPVzV4eEZHdVRqOUsvU2RV?=
 =?utf-8?B?Y0lMdURkR1d6NFpoTjNDM0NZNGZwc2YvejVGMC9WU3RKVnJkd0dVR2YrUTlS?=
 =?utf-8?B?UW9Sd3RZejhnN2o3TGlCUVR2MUJVanBaaFJHVWVoeXd5MkQvMVVQWG9XTEdY?=
 =?utf-8?B?N0hRNUN5cXpqbFVYeVRXVTRvVGhoOVNVQjhONXB4VUtrMDVST1dEZ2JySVdh?=
 =?utf-8?B?bWovYzR5Vk1sR01vRGVrR1RqLzgvek9yRGRzNkFYakZxM1lxRlRkZ1hWWVhz?=
 =?utf-8?B?Q2pBa0lmN29nNmJPNTZ1bFVWNDdZNnhYRWEvdERoRCtRL251QUt2VkVLNTNL?=
 =?utf-8?B?WTBPYUVqcWxEdG9xTlA1TEtFU1NiTVdnWnhob0VSRCthbDJ0N2FSQ01mYjJi?=
 =?utf-8?B?UysybzVNVjRyUGZiVUsrYmxjcUNGcC9iTzhxZ1JiVGVzWGg0UWVoS0xFeWN2?=
 =?utf-8?B?aFRjRzlZaFdRZmw2STVLZFFab2llY1JhK0pjaXFNb3hya21wQVV5UWhxeDRW?=
 =?utf-8?B?d0YrWkN3TXhNMXVpNFlHbHVlbFFBRDUyam45UGxBdnRmZFFrRENFUzYreWoy?=
 =?utf-8?B?VVh6a1FXaHdVdjlCTWNxZlU2RFdOU1VLTkp3YnlranNDdU9JOGVKSEdsaHZN?=
 =?utf-8?B?Tm1XQTVza1hqU1JMemF2QzhVZkk3UjFkZzJBc2xhYS92U1hQaWo2WVlaYWZ4?=
 =?utf-8?B?SDFCa3o0SWpYN1JWd0ZvRDNXM0JYc0xSR21sd1lRK2hKTnRFMnRjdlBSajAx?=
 =?utf-8?B?LzA5OXRPTTdjVi9pbjJjeDkwUlBWY1Jyam5QVEh4Vld1UGttSlFlcmVvNkhU?=
 =?utf-8?B?aHJ2SnJzRzlZZ2dvc21yb1pQaWZJUTlwYTg2RHU5aTcrWHpZOWdYd1BXVkZL?=
 =?utf-8?B?enN4OFZzNlZIQ0ZvckNpYWszcUo4eUVzaGdGcFY5U25haDQxbXNZeE5ia2NU?=
 =?utf-8?B?Y1F0RENkWTNOdWtlb282RWtrRHlNZUFSbWpDREtlQWVqam1LMDJkQ293SUFx?=
 =?utf-8?B?L0o4VGMxZzdCeW91YmI2bmI5a1M2K2psR3dNQ0hSL1hzdUNEVm9NTWJmeFI0?=
 =?utf-8?B?UmdwazZKNllnNHBvYitXUVd3czlwdW5laFgzWEgxT0o5RFZhaDRLckRueGdM?=
 =?utf-8?B?UDY5dVpGN1ZBZDlJK0Z6WWp1Z3c3MFVoWFkvRFN3NWRkeWsyYk00WjVGOURC?=
 =?utf-8?B?bW1JR2NmSlRhcWEra0JrTTgrM3pMN0lVTWU3dWNVZjNBdzVQWlZTZmY4ZnVa?=
 =?utf-8?B?OG04QnBRVUk2U09BbFRhVXFXcWJOandFbjd2UUNhT1FZMmZEM3RhK2VydytL?=
 =?utf-8?B?NzFXb1NCVnFKT1FQKzhQcW8zeU1NZ0tOTVFWV2hpVklVRCt4SS9xalJ6Z0pW?=
 =?utf-8?B?M0c1Z2FVdUxoMEhxQ2ZyRmg0SFF0b09VR2N6cEcwajNWOGxwdzVqTmh6Wk5v?=
 =?utf-8?B?Sk91SWh6SFN1OHZEN1hFWW5md0k5am1UMEg1eXlMY2FmL3Y1T0cvK01QeG0v?=
 =?utf-8?B?MXIwV0pOZURSUzhiSDhiSW1DQWdESkFhQ21aK1dPSU1Ed01oS3ZNRU05bkwv?=
 =?utf-8?B?bks2NlJGN2VaL0I4WWp4ang2R0JYaGZoL1ZDVEwybHJXOEs2WWpmWks2cXo3?=
 =?utf-8?B?QTdqd1p2VzlxeFlmYnpmK2c0QUtqVExtVTFldFJCeGU3MXN1Wm5EYTVlckdm?=
 =?utf-8?B?R1kvVy9qa3BOSnI0ODNjZ0ZCaXdoWkF6VE1NMjdkbTJrOE9ZRThlbUFGMkp6?=
 =?utf-8?Q?9tAmn8dNsg1vv3U+QVfRmaHGH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0646bc6d-5b5d-4111-0f82-08dabd796119
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 08:57:05.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxuBlfYj0bXC4P1xmcgYhN9fpcbrbwhvQpN5HAaqYtjdhI51LsnXKy8OUNvrvd3wevHS4MUnCMXVlZn87kYxkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9241
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-11-01 at 15:04 +0100, Marco Felsch wrote:
> Hi Marek, Liu,

Hi,

> 
> On 22-10-28, Liu Ying wrote:
> > On Fri, 2022-10-28 at 02:03 +0200, Marek Vasut wrote:
> > > On 10/27/22 19:47, Marco Felsch wrote:
> > > > On 22-10-27, Liu Ying wrote:
> > > > > On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
> > > > > > On 10/27/22 07:45, Liu Ying wrote:
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > > index a5302006c02cd..aee7babb5fa5c 100644
> > > > > > > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > > @@ -341,6 +341,18 @@ static void
> > > > > > > > lcdif_enable_controller(struct
> > > > > > > > lcdif_drm_private *lcdif)
> > > > > > > >    	reg = readl(lcdif->base +
> > > > > > > > LCDC_V8_CTRLDESCL0_5);
> > > > > > > >    	reg |= CTRLDESCL0_5_EN;
> > > > > > > >    	writel(reg, lcdif->base +
> > > > > > > > LCDC_V8_CTRLDESCL0_5);
> > > > > > > > +
> > > > > > > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3
> > > > > > > > . */
> > > > > > > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 *
> > > > > > > > PANIC0_THRES_RANGE
> > > > > > > > / 3) |
> > > > > > > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
> > > > > > > > PANIC0_THRES_RANGE / 3),
> > > > > > > 
> > > > > > > Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in
> > > > > > > lcdif_regs.h?
> > > > > > > 
> > > > > > > Downstream kernel uses the below threshold values:
> > > > > > > a) i.MX8mp EVK board with LPDDR4
> > > > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > > > driver
> > > > > > > 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> > > > > > > 
> > > > > > > b) i.MX8mp EVK board with DDR4
> > > > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > > > driver
> > > > > > > 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> > > > > > > 
> > > > > > > Jian told me that LCDIF3 needs different sets of
> > > > > > > threshold
> > > > > > > values
> > > > > > > for
> > > > > > > different types of DDR to avoid 4k HDMI display issues
> > > > > > > and
> > > > > > > the
> > > > > > > threshold values impact overall DDR/bus utilization(?),
> > > > > > > so
> > > > > > > downstream
> > > > > > > kernel chooses to get optional threshold value properties
> > > > > > > from
> > > > > > > LCDIF DT
> > > > > > > node.
> > > > > > > 
> > > > > > > Instead of always using 1/3 and 2/3, maybe there are
> > > > > > > three
> > > > > > > options:
> > > > > > > 1) Same to downstream kernel, take 1/3 and 2/3 as default
> > > > > > > values
> > > > > > > and
> > > > > > > get optional threshold values from DT properties - no
> > > > > > > additional
> > > > > > > properties are acceptable in the existing DT binding doc?
> > > > > > > 2) Check pixel clock rate, and if it is greater than a
> > > > > > > certain
> > > > > > > value,
> > > > > > > use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> > > > > > > 3) Always use 2/3 and 3/3.
> > > > > > 
> > > > > > Why 2/3 and 3/3 instead of 1/3 and 2/3 ?
> > > > > 
> > > > > 2/3 and 3/3 trigger panic signal more easily than 1/3 and
> > > > > 2/3.
> > > > > 
> > > > > > 
> > > > > > Seems like 1/3 and 2/3 provides enough FIFO margin for
> > > > > > every
> > > > > > scenario.
> > > > > 
> > > > > I didn't tune the threshold values.  What I was told is that
> > > > > some
> > > > > usecases suffer from the FIFO underflows with 1/3 and
> > > > > 2/3.  And,
> > > > > it
> > > > > appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3
> > > > > and
> > > > > 3/3 in
> > > > > those usecases.  That's why downstream kernel chooses to use
> > > > > 1/2
> > > > > and
> > > > > 3/4 or 2/3 and 3/3.
> > > > 
> > > > Hi Liu Marek,
> > > > 
> > > > I thought that: If the PANIC is enabled and the pre-configured
> > > > panic-priority is high enough, nothing should interrupt the
> > > > LCDIF
> > > > in
> > > > panic mode since it has the highest prio? So why does it the
> > > > downstream
> > > > kernel configure it differently for different use-cases?
> > > > 
> > > > Also IMHO the threshold should be taken wisely to not enter
> > > > panic
> > > > mode
> > > > to early to not block others from the bus e.g. the GPU.
> > > 
> > > As far as I understand the PANIC0_THRES, both thresholds are
> > > really 
> > > watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL.
> > > Under 
> > > normal conditions, the FIFO is filled above 1/3. When the FIFO
> > > fill 
> > > drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO
> > > can
> > > be 
> > > refilled faster. When the FIFO fill raises above HIGH=2/3, the
> > > "PANIC" 
> > > signal is deasserted so the FIFO refills at normal rate again.
> 
> This matches exactly my picture of the hardware.
> 
> > > It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind
> > > of
> > > good 
> > > balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep
> > > the 
> > > "PANIC" signal asserted much longer, which could indeed block
> > > others 
> > > from the bus.
> 
> Also I understood the thresholds in such a way, that the FIFO
> watermark
> must be higher but there is no place left when it is set to 3/3. In
> such
> case this means that the PANIC will never left once it was entered.
> 
> > > It also seems to me that tuning these thresholds might be related
> > > to 
> > > some special use-case of the SoC, and it is most likely not just
> > > the 
> > > LCDIF thresholds which have been adjusted in such case, I would
> > > expect 
> > > the NOC and GPV NIC priorities to be adjusted at that point too.
> 
> As far as I understood, the PANIC signal triggers the NOC to use the
> PANIC signal priorities instead of the normal ones. I found a patch
> laying in our downstream [1] repo which configures the threshold. 

The patch sets/clears the bits of the LCDIF_NOC_HURRY field.

> This
> raises the question which PANIC prio do you use? Do you have a patch
> for
> this? If I remember correctly some TF-A's like the NXP downstream one
> configure this but the upstream TF-A don't. Which TF-A do you use?

AFAIK, upstream TF-A also has code to control the LCDIF_NOC_HURRY
field, but i.MX8m power domain driver in upstream kernel doesn't use
TF-A so the control logic in TF-A doesn't take effect.

I'm assuming the LCDIF_NOC_HURRY field has to be somehow configured so
that the thresholds set in LCDIF would avoid LCDIF from FIFO underrun.

Maybe, you may send your patch[1] out for review?

Regards,
Liu Ying

[...] 

> 
> [1]
> 8<-------------------------------------------------------------------
> --
> From b964a83b45c2e2610b8240fbcac776df075c88e2 Mon Sep 17 00:00:00
> 2001
> From: Marco Felsch <m.felsch@pengutronix.de>
> Date: Fri, 22 Jul 2022 11:08:19 +0200
> Subject: [PATCH] soc: imx: imx8mp-blk-ctrl: set the LCDIF hurry
> priority
> 
> Status: WIP, needs clarification with NXP first.
> 
> Set the LCDIF hurry priority to highest possible value so FIFO
> underruns
> can be avoided. The hurry priority will be set by the BLKCTL hw as
> soon
> as the LCDIF panic signal is active and set back to 'normal' priority
> after the panic signal is released.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/soc/imx/imx8mp-blk-ctrl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/imx/imx8mp-blk-ctrl.c
> b/drivers/soc/imx/imx8mp-blk-ctrl.c
> index 9852714eb2a4..14e744772a01 100644
> --- a/drivers/soc/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/soc/imx/imx8mp-blk-ctrl.c
> @@ -201,6 +201,9 @@ static const struct imx8mp_blk_ctrl_data
> imx8mp_hsio_blk_ctl_dev_data = {
>  #define HDMI_RTX_CLK_CTL3	0x70
>  #define HDMI_RTX_CLK_CTL4	0x80
>  #define HDMI_TX_CONTROL0	0x200
> +#define HDMI_LCDIF_NOC_HURRY_PRIO_MASK	GENMASK(14, 12)
> +#define HDMI_LCDIF_NOC_HURRY_PRIO(p)	\
> +	(((p) << 12) & HDMI_LCDIF_NOC_HURRY_PRIO_MASK)
>  
>  static void imx8mp_hdmi_blk_ctrl_power_on(struct imx8mp_blk_ctrl
> *bc,
>  					  struct imx8mp_blk_ctrl_domain
> *domain)
> @@ -217,6 +220,8 @@ static void imx8mp_hdmi_blk_ctrl_power_on(struct
> imx8mp_blk_ctrl *bc,
>  		regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1,
> BIT(11));
>  		regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0,
>  				BIT(4) | BIT(5) | BIT(6));
> +		regmap_set_bits(bc->regmap, HDMI_TX_CONTROL0,
> +				HDMI_LCDIF_NOC_HURRY_PRIO(7));
>  		break;
>  	case IMX8MP_HDMIBLK_PD_PAI:
>  		regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1,
> BIT(17));
> @@ -273,6 +278,12 @@ static void
> imx8mp_hdmi_blk_ctrl_power_off(struct imx8mp_blk_ctrl *bc,
>  		regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0,
>  				  BIT(16) | BIT(17) | BIT(18) |
>  				  BIT(19) | BIT(20));
> +		/*
> +		 * Set priority to highest level case of LCDIF panic to
> avoid
> +		 * FIFO underruns.
> +		 */
> +		regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0,
> +				  HDMI_LCDIF_NOC_HURRY_PRIO(7));
>  		break;
>  	case IMX8MP_HDMIBLK_PD_PAI:
>  		regmap_clear_bits(bc->regmap, HDMI_RTX_RESET_CTL0,
> BIT(18));

