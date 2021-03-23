Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A4345A75
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7C36E86E;
	Tue, 23 Mar 2021 09:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50070.outbound.protection.outlook.com [40.107.5.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B46E86E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hktJTqUMadgIKJb5PjKOt+N8SZtGBcLy0Bh/fttGFCLlHu1QKt/MXaG8yQGYIa+A6840AA2sVAUekSazy9VixpyojfpDDLXlgebxPPT3kHoWe+neuB+kaXIZe0WvqIpxtYrq4RuHbpCGGf7AGJjszbFjtXTjBa1D1/Ku95tbGOxYtMdbovzvf4BCofdqDgY2J7xdyTuc7BeINLOO5reVSial6RYGTzrWl6zWrk6/vADFC5113INmo6n+06bcq6QSJblc0ca12cmTZu3IIozmnFoRbDy9fzcnTelbYbDz128rkz0IJS/ZfwT7MxojupTKLM2JQy0bQugwwPoB00M6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWKMUCCoF+n6NLL3Q/A56XYnO/J9SAf6HeGe3CsAU3w=;
 b=SRf2lgUCR0iSZtKKczdKEB2I+r9ojQSlErTbO6TdAxlsJdU+Z8XrcnDsfyKpjgF8zPZKzDAj6XZzfRdrY3vo7NAHWSLCf+o5D3B6yS769EySEpLsgq7wxRInpp6LnvI0ua4oOaTgNZVARjdpTxFBjO4XETb8+a6VNIxLxMH/ZPuSVmQ/rkLsUXXYHA9n8CR5vnK/Wd8M37FM7gLyedabFgIwjy4JnBfhkD6hufkshho8mZhIho6OQ3jW+xOCJnptMZCXSBzmvTzSfC56mV7x7PFwrjKjC/ORd2UCaRMZ/vW7Tyb6qoDa2lhMNhPKP93fpzX3yrjM7XxKBg7CeZMDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWKMUCCoF+n6NLL3Q/A56XYnO/J9SAf6HeGe3CsAU3w=;
 b=Z5aq9oXxJvlTmXeEml40g2Dtszmgb7PVLaUeIH1wysdZbGGIIomAsPBKXSMZKiE3kYf6OuBmdmnbU+4+pEPX4+Vd2trsy2ue5u6aOyEkiG/h6fnCpmNs8N2+UKlrGU3jFrFyvAzFTtPsSEPYDMXDS+kwQeOhnEGyqezApY1Sf78=
Authentication-Results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5869.eurprd04.prod.outlook.com (2603:10a6:803:ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 09:11:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 09:11:37 +0000
Message-ID: <ecb5dc8a52509eed4cf7fa3e9aa235673399f083.camel@nxp.com>
Subject: Re: [PATCH v6 00/14] Add some DRM bridge drivers support for
 i.MX8qm/qxp SoCs
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Tue, 23 Mar 2021 17:09:59 +0800
In-Reply-To: <42710b2d8b474cae5d4d8a1408eaa1cd98b7c2e0.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <42710b2d8b474cae5d4d8a1408eaa1cd98b7c2e0.camel@toradex.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR02CA0198.apcprd02.prod.outlook.com (2603:1096:201:21::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 09:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 858b730f-41bc-4a2e-f138-08d8eddba933
X-MS-TrafficTypeDiagnostic: VI1PR04MB5869:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB58697F540599667C59C7978898649@VI1PR04MB5869.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BYA9yUhg1SFJ3SEWun98UAXZbt+OwpL3F1JZu5dz4LYjUNAN6G6aiW4vRmG30vCPm7CLMHpa7gExcDNnBbL+a4JDCzMDqRudN5k8EqgKSw7NIDtd/KdDVEeWpI/q+zCx1Q7L80kRTT/xE6qkJ7Y73TiaclqEmpNnsdRu8Ua4HB1mnGzkxTSZjd/4qoJ3qT76aLfsvisxk8ezEp9hBbmxkCIfVzt6k9/i/PbHx+ICWevPjb/Gogg2wkXKENTr7Gx2NI6I0bcWYmSquTIJ+XTtPeB38qeVaPrEjRKuKyFRvSyLvp0dkqOSSs1VSnWNhWOEADmp9aiAkHw5kdNnxFLIjok+sT4ZBI+uXXl244RgwQQVX0KULiV9C+XzIbTvEupNucLsqp+IUXRenSfi8X+i8rk9OKHKV5452w7AqIGDz0wTJrOmwAblqVfXMdjGjkkedo5tm31+iDq3Kxiw6ZuTdlnT6zHXbKyY8qO38Bn01O4WsQxcQzMO2LHHiBup5av5Fr9cTCobVebIxg7VWLjrbRJ7LIITNoOEY3C1Zah7H2f/JIDsO2NpdEvNTmZRhFODnRT7XdJ7rX09Y8bjWOmSB+eNdwxD0gCQZqPCTHAFur9DPEyoMbBfjd9CGsJTz0ONYO+95QwehnWmWhq8P1cjipCuqF6mIkeShO8uznrBZkLM5TAfT82oMFUVue822HEbGS7yo5tpSU3CLNeZ6nCt/XgITptvmSndgqNbbg5ttA7MLpSKOX/DuV0Mg7My85g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(5660300002)(52116002)(2906002)(45080400002)(4326008)(6666004)(966005)(478600001)(956004)(6486002)(38100700001)(186003)(6496006)(54906003)(2616005)(316002)(16526019)(7416002)(30864003)(26005)(110136005)(66556008)(36756003)(8676002)(8936002)(86362001)(66476007)(83380400001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0FyMnQ3NHMxNG03UlNOZFFIbEhvdGpCR0xZcGNqUlJZK25KSmhUcHFoajdm?=
 =?utf-8?B?L0xFQmF0N2RXOWlsbmZ2ckZPNC8vNzNEOWdSUUl2dUEyMFNCT0trTUFJUDlC?=
 =?utf-8?B?UVI5dllMcjN2bFc0U1c2RWpicmd6VlFKaXZTVXQxYUVXOWxCWVRiRUZreFJP?=
 =?utf-8?B?R1hVTmltSWFIMlRXTC9YU240bU5kRTdsWEZ5ajc4dXhTdVcySGxXOGZVWFN1?=
 =?utf-8?B?WEFyQUdIRVhvS2p5VnFsNEFRTmo0bWt1bytIQk9DR1pwWWE0UDA2S2hMbk9m?=
 =?utf-8?B?eXl2MkVYVFBFUjl5ZW1WSFhhMU94dUxTQ3JWN0ROcTA2WFgwcjFVRmh6YXpJ?=
 =?utf-8?B?U0FVb1Rkd1B4Yjl5bkJmN0ttT1ozYndvS1p4UHJkVnZndGNvei85bWRSd0xD?=
 =?utf-8?B?R1lHcFM1M1pOcENTaHJLK05zdVczd01jOXFLOFpMNlNJUktJay84VWZSc3JD?=
 =?utf-8?B?T2NwNHgydTNxZm82Y0FrUlBrK1BJOUtRUVhlOFRhWFdVb0lpcUxzblJ6UklN?=
 =?utf-8?B?NkZCeG5iUU1oeENlTGoydGw4cWFaT3ZOTCt0Z3k5N2FJd2NvMFJ3MytLSDFt?=
 =?utf-8?B?c3NuNFAvQUtVZ2FjcEhyRFNtblc4WmVCMlUrcFQwVjk3NXE4U3VDS1NiVGRq?=
 =?utf-8?B?UTVXZS8zdCsrYks0V1h6REo4OVpoSEoxN2xWbjNMczRsbzhNYnlhOTNiQnAw?=
 =?utf-8?B?S0VieGRQeWowNmkxbitiQnJGcXU1Q2VuYnVua25td1ZuSm9sYWRtaHk3U0pH?=
 =?utf-8?B?dzArNldXM01EOGUyMzU1VDBtdTlCbjhjSlk0TUpKczBwWHFaczFIV2QwZ0Uy?=
 =?utf-8?B?Rkl1L0VOeVNFMkRJSkZLK0hlNWJUTkxuS0VZTVFZZUlLNThBeXR1YXdWSjJx?=
 =?utf-8?B?OGdlWFFPUEdKb1NUK0xOUWpvdldVU2IwcEg4R2YwUHloR1pERC9jWGNSU0sw?=
 =?utf-8?B?M08xeS9nZnFMWUNvWElmWlRxcTlidkxia2FTeFloWmlhNGFRbG1VWlJ2YzZJ?=
 =?utf-8?B?d096ak5uclJWZXRBVlFLblg5Y3F6UVBsWnNMQkoyQlppY1VOSk5xV0cwNU1s?=
 =?utf-8?B?QnhNVWxYRHFmeGZzNUROcjVRT2FwdW9KYjlIdExLc05yQm9aZmtjbW1TUVZl?=
 =?utf-8?B?REpZbUJRQ1VjMnFYelUraWt5UUxWa2NRU2NBU0JXdnpMdFZLM2RkVTRwYlg2?=
 =?utf-8?B?eUtlRko2UG1ySWJsY3ZUWlpyWVg1MVl6VlM2K2dleVNBUE5GSlJLaGdSTXE5?=
 =?utf-8?B?cFN5Z2R3SXN4QnVRNFhDTk1KYlVhUEdZL3d3d21SdWt6OEtPcXRIRmhWek1w?=
 =?utf-8?B?U0JleWtnZ28vNmxxdTNMcUhpdTZjdUNwNGc3c2Fva3lQc2xGYlIxVmRaUXo3?=
 =?utf-8?B?UXJtemJtbUhNekxwQWxieVdBbVFheGovbVRHSTZJYzBabzl2ZnYybFZ0bEhF?=
 =?utf-8?B?bkkvNkNzbUQ0b1VPSXlZSFRZTDRrRldQRk9rMUx5SS80WmRiSGxpWFpVQnA0?=
 =?utf-8?B?MlFqNytSQ2VBVmU4Z0lrNFlsSjlhenFsT0VxbjJDWUYyWGRsenlxQmVQbTE3?=
 =?utf-8?B?NXliQlhQcmFIM1JlbGJsdVA5emxNQk1xQmNMbUxDTytCcXRJT3dVQzhxbHQ3?=
 =?utf-8?B?Zm1ZZXR0aERUelVMY0hBZkV1WjQ3bjNNSVZKWE03dkl5aUx6UGV5eHloR3Ns?=
 =?utf-8?B?aDRWZlpwNEszUTYvL0JLNDBQcGh0bnY4MFFnYTNqSjk4NHUvVFpwZ0NYQjdj?=
 =?utf-8?Q?a6XIo1p/bAumWKTK7DZP97fCz5+SMfGHtI96C9W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858b730f-41bc-4a2e-f138-08d8eddba933
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:11:37.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ingu2OGwfKRy1qlwzooX/VpSxIf6PsO+ITe2erLcgJhdb8tL9d5aPs06Lv5ktD+w9TAiKgt++KEr1df1sOByoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5869
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-23 at 01:03 +0000, Marcel Ziswiler wrote:
> Hi Liu
> 
> Some further discrepancy with them binding examples:
> 
> arch/arm64/boot/dts/freescale/imx8qxp.dtsi:335.9-36: Warning (reg_format): /dpu@56180000:reg: property has
> invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> arch/arm64/boot/dts/freescale/imx8qxp.dtsi:508.9-35: Warning (reg_format): /syscon@56221000:reg: property has
> invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> arch/arm64/boot/dts/freescale/imx8qxp.dtsi:601.9-34: Warning (reg_format): /phy@56228300:reg: property has
> invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> arch/arm64/boot/dts/freescale/imx8qxp.dtsi:613.9-36: Warning (reg_format): /pixel-combiner@56020000:reg:
> property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> 
> And with that I am unable to bring it up:
> 
> [    1.714498] imx8qxp-ldb 5622100000001000.syscon:ldb: [drm:ldb_init_helper] *ERROR* failed to get regmap: -12
> [    1.724441] imx8qxp-ldb: probe of 5622100000001000.syscon:ldb failed with error -12
> [    1.734983] imx8qxp-pixel-combiner 5602000000010000.pixel-combiner: invalid resource
> [    1.742830] imx8qxp-pixel-combiner: probe of 5602000000010000.pixel-combiner failed with error -22
> [    1.754040] imx8qxp-display-pixel-link dc0-pixel-link0: [drm:imx8qxp_pixel_link_bridge_probe] *ERROR* failed
> to get pixel link node alias id: -19
> [    1.769626] imx8qxp-pxl2dpi 5622100000001000.syscon:pxl2dpi: [drm:imx8qxp_pxl2dpi_bridge_probe] *ERROR*
> failed to get regmap: -12
> [    1.781397] imx8qxp-pxl2dpi: probe of 5622100000001000.syscon:pxl2dpi failed with error -12
> [    1.840547] imx8qxp-lpcg-clk 59580000.clock-controller: deferred probe timeout, ignoring dependency
> [    1.840571] imx8qxp-lpcg-clk: probe of 59580000.clock-controller failed with error -110
> 
> Any suggestions welcome. Thanks!

Please reference the patch set I shared in my last reply and see how it
goes.  Thanks.

Liu Ying

> 
> Cheers
> 
> Marcel
> 
> On Wed, 2021-03-17 at 11:42 +0800, Liu Ying wrote:
> > Hi,
> > 
> > This is the v6 series to add some DRM bridge drivers support
> > for i.MX8qm/qxp SoCs.
> > 
> > The bridges may chain one by one to form display pipes to support
> > LVDS displays.  The relevant display controller is DPU embedded in
> > i.MX8qm/qxp SoCs.
> > 
> > The DPU KMS driver can be found at:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg878542.html&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C23e9e19a27ae45007db608d8ed977152%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520581990271723%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LziYbGruJmOb70UWGvx%2BX0Fx3gsoEtubdiNBpuKcjXw%3D&amp;reserved=0
> > 
> > This series supports the following display pipes:
> > 1) i.MX8qxp:
> > prefetch eng -> DPU -> pixel combiner -> pixel link ->
> > pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)
> > 
> > 2) i.MX8qm:
> > prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)
> > 
> > 
> > This series dropped the patch 'phy: Add LVDS configuration options', as
> > suggested by Robert Foss, because it has already been sent with the following
> > series to add Mixel combo PHY found in i.MX8qxp:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg879957.html&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C23e9e19a27ae45007db608d8ed977152%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520581990271723%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lPUkWoIHjpBM5dZjFiaNjmQaQgcfIAHx%2FyRtQjZ%2B3po%3D&amp;reserved=0
> > 
> > So, this version depends on that series.
> > 
> > 
> > Patch 1/14 and 2/14 add bus formats used by pixel combiner.
> > 
> > Patch 7/14 adds dt-binding for Control and Status Registers module(a syscon
> > used by PXL2DPI and LDB), which references the PXL2DPI and LDB schemas.
> > 
> > Patch 10/14 adds a helper for LDB bridge drivers.
> > 
> > Patch 3/14 ~ 6/14, 8/14, 9/14 and 11/14 ~ 13/14 add drm bridge drivers and
> > dt-bindings support for the bridges.
> > 
> > Patch 14/14 updates MAINTAINERS.
> > 
> > 
> > I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
> > a LVDS to HDMI bridge(with a downstream drm bridge driver).
> > 
> > 
> > Welcome comments, thanks.
> > 
> > v5->v6:
> > * Fix data organizations in documentation(patch 2/14) for
> >   MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
> > * Add Laurent's R-b tags on patch 1/14 and 2/14.
> > * Drop 'select' schema from the CSR dt-binding documentation(patch 7/14). (Rob)
> > * Add Rob's R-b tag on patch 8/14.
> > 
> > v4->v5:
> > * Drop the patch 'phy: Add LVDS configuration options'. (Robert)
> > * Add Robert's R-b tags on patch 1/14, 2/14, 4/14 and 6/14.
> > * Drop the 'PC_BUF_PARA_REG' register definition from the pixel combiner bridge
> >   driver(patch 4/14). (Robert)
> > * Make a comment occupy a line in the pixel link bridge driver(patch 6/14).
> >   (Robert)
> > * Introduce a new patch(patch 7/14) to add dt-binding for Control and Status
> >   Registers module. (Rob)
> > * Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
> >   driver and i.MX8qm LDB bridge driver, instead of a module.  Correspondingly,
> >   rename 'imx8{qm, qxp}-ldb.c' to 'imx8{qm, qxp}-ldb-drv.c'. (Robert)
> > * Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
> >   (Robert)
> > * s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.
> > 
> > v3->v4:
> > * Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
> >   the PXL2DPI instance instead of using alias ID. (Rob)
> > * Add Rob's R-b tag on patch 11/14.
> > 
> > v2->v3:
> > * Drop 'fsl,syscon' DT properties from fsl,imx8qxp-ldb.yaml and
> >   fsl,imx8qxp-pxl2dpi.yaml. (Rob)
> > * Mention the CSR module controls LDB and PXL2DPI in fsl,imx8qxp-ldb.yaml and
> >   fsl,imx8qxp-pxl2dpi.yaml.
> > * Call syscon_node_to_regmap() to get regmaps from LDB bridge helper driver
> >   and PXL2DPI bridger driver instead of syscon_regmap_lookup_by_phandle().
> > * Drop two macros from pixel link bridge driver which help define functions
> >   and define them directly.
> > * Properly disable all pixel link controls to POR value by calling
> >   imx8qxp_pixel_link_disable_all_controls() from
> >   imx8qxp_pixel_link_bridge_probe().
> > * Add Rob's R-b tags on patch 4/14 and 6/14.
> > 
> > v1->v2:
> > * Rebase the series upon the latest drm-misc-next branch(5.11-rc2 based).
> > * Use graph schema in the dt-bindings of the bridges. (Laurent)
> > * Require all four pixel link output ports in fsl,imx8qxp-pixel-link.yaml.
> >   (Laurent)
> > * Side note i.MX8qm/qxp LDB official name 'pixel mapper' in fsl,imx8qxp-ldb.yaml.
> >   (Laurent)
> > * Mention pixel link is accessed via SCU firmware in fsl,imx8qxp-pixel-link.yaml.
> >   (Rob)
> > * Use enum instead of oneOf + const for the reg property of pixel combiner
> >   channels in fsl,imx8qxp-pixel-combiner.yaml. (Rob)
> > * Rewrite the function to find the next bridge in pixel link bridge driver
> >   by properly using OF APIs and dropping unnecessary DT validation. (Rob)
> > * Drop unnecessary port availability check in i.MX8qxp pixel link to DPI
> >   bridge driver.
> > * Drop unnecessary DT validation from i.MX8qxp LDB bridge driver.
> > * Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
> >   get the input remote endpoint in imx8qxp_ldb_set_di_id() of i.MX8qxp LDB
> >   bridge driver.
> > * Avoid using companion_port OF node after putting it in
> >   imx8qxp_ldb_parse_dt_companion() of i.MX8qxp LDB bridge driver.
> > * Drop unnecessary check for maximum available LDB channels from
> >   i.MX8qm LDB bridge driver.
> > * Mention i.MX8qm/qxp LDB official name 'pixel mapper' in i.MX8qm/qxp LDB
> >   bridge drivers and Kconfig help messages.
> > 
> > Liu Ying (14):
> >   media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
> >   media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
> >   dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
> >   drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
> >   dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
> >     binding
> >   drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
> >   dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module
> >     binding
> >   dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
> >   drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
> >   drm/bridge: imx: Add LDB driver helper support
> >   dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
> >     binding
> >   drm/bridge: imx: Add LDB support for i.MX8qxp
> >   drm/bridge: imx: Add LDB support for i.MX8qm
> >   MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs
> > 
> >  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++
> >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++
> >  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++
> >  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 ++++
> >  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 ++++++
> >  .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++
> >  MAINTAINERS                                        |  10 +
> >  drivers/gpu/drm/bridge/Kconfig                     |   2 +
> >  drivers/gpu/drm/bridge/Makefile                    |   1 +
> >  drivers/gpu/drm/bridge/imx/Kconfig                 |  42 ++
> >  drivers/gpu/drm/bridge/imx/Makefile                |   9 +
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        | 232 +++++++
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |  98 +++
> >  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        | 586 +++++++++++++++++
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       | 720 +++++++++++++++++++++
> >  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 448 +++++++++++++
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 427 ++++++++++++
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 485 ++++++++++++++
> >  include/uapi/linux/media-bus-format.h              |   6 +-
> >  19 files changed, 3944 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
> >  create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
