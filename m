Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF433511CB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA696E39B;
	Thu,  1 Apr 2021 09:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E046E39B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 09:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX1xOv+Gklcsqeih7MS2cM3iotFHhn/l4YcGOXvJ1Slvw8qOOWKW7DvxYMC5/y8hJ/EHdhnhR/siBUrXWCmxtutD+eCZJPba9b/wFP21sKNYRsl4fDV+C0Ds4ZfpeB8aq+lRi7fHQXVapTH4NcdAp6DXUGXPdtmwBQ927gb8qbOVSLgfT/qdq5oDEZDN66ll4arWQ7FefbMGpD/KyOneZ29aUBWz6VweDliRsdintBx1L9LoCj+wuhoHefDVMzrgSKx92Z1WDmqraE2qkcmA8691SpPnGQeWbMy9yxSk6UYjby/qxDC2FUFqjG2bCgoLOmByzDKEvujzk6kl6+B8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0qSlcImVOAWW5ZHj8jC5v7j+6OY7VKhzrNhsKM/E+Q=;
 b=kdFQ+AY6ueek9T/jGaEZSMIGTjkqxNs9dBLmhtiJrBThTc0vZiyZlunqyqtYtq3U+Rqhz0bmXJmkFOoc+2hWO8rYOd/YrqnHENVuPrPoCEVnbrJcqO7w0Wm5gSdBMmydHW1LY1bqs69AYDog7K4cmjUQN7SrFyC4RDJrFZRFQShH5bIgVw1vok3Zy662RSWBP0DdnlS/8cxatd3g0DaBQk/bu953T2w/4iVG5HBfR6zR1m862M6hrHG3roie6AxYje46oip6I9/KkSZl8KPOV3SW3GLhFga3kWLH5rWXajuFFHrOg5keOw9y4M5gIm+TLPatGm48xdmJeAb93lDtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0qSlcImVOAWW5ZHj8jC5v7j+6OY7VKhzrNhsKM/E+Q=;
 b=fR3A7d+7SpezdYpPw1MG9V67BCldJqsPzHjYESaMaU42mg0o5nrhjU5Tkf8RNLM1fzEyorvTng1z9hab1b35Xr5gbY7/z6A8NQy1OjTzGy8yHGPpHrEaqgGNAumQGWWm/Kw+3uw2Ne8XAA+1arU5uuiu7IYSlNYvmzTWxDmBu+Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AM5PR04MB3155.eurprd04.prod.outlook.com (2603:10a6:206:4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Thu, 1 Apr
 2021 09:18:55 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::d5b8:9b56:794b:21ce]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::d5b8:9b56:794b:21ce%7]) with mapi id 15.20.3999.027; Thu, 1 Apr 2021
 09:18:55 +0000
Message-ID: <2e6b0bdd03da30446448e86eff69182e417ce43f.camel@nxp.com>
Subject: Re: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 01 Apr 2021 17:17:19 +0800
In-Reply-To: <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
 <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
 <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To AM6PR04MB3974.eurprd04.prod.outlook.com
 (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR02CA0201.apcprd02.prod.outlook.com (2603:1096:201:20::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 09:18:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0fcfcb4-435c-4f5c-03d5-08d8f4ef2c1e
X-MS-TrafficTypeDiagnostic: AM5PR04MB3155:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB3155B2C76EC8E338723D4DD0987B9@AM5PR04MB3155.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmEZvPGbRVEfym4jJeoobAELenrvbtecoYoghjpA1cb29nVCJMvuep7zJp6LX62LoUx5w09xtFN+7HdGLFoXT8DsILK5+R9H8Ua8NMyzPonvWePKVn5ew8VFaJeTV/O6YwUfX/Hs9gcWFpuTzPLuRd+pZOWveh/CxfCiCIkm/0Tl1tmslr5RLcrYmRUNZnFIouaHjbpMD3iw8UcgjEy2kQ7A9NbynKpm7IGCxRDVGvIeXLNy+x4zOySbIAV2BsdUBVuWadjzMenlLekoO5PyW2vCiX3g0sDm1lvx/jiVRffZMIgGD0GCJOuSMKeEXFryXz4Jqf1Yi1Z8sTKsBldLFnEkX40vyFOm876niwgnq97a/azlTSWKZ8YrE1KguN9FieHnimThQmjZ4NxDJUpO3iqw8/FXP56iBqKnAtIlkP8MhVq0hy4+an7KkC54VaX/rIdiLKU1QnoBMXBpBCqjo17yAq3yhkSsVtqOoUEem9poRSvSqv2CbHCz1CNGVdCTFYNG/6CHsoG5ISvxxpGk2moeayyqMO6EZNVIA4GEAyYS0jZNidKANTegvsVXARVxLa2+VJJ++Nb0CYZreGmD5+6W4xGz+WgrSS09I4tn/QwrC9orU7YwwdICfB6ihofSnCzd62pV+64izPO4XY7Ly6+K9t/Uwe8kuGgk2fsWGwegk/bnudXErUQoajrfaASR44Woquei7MrPlqzHbgu82pMg5I7mY/6XFjmVhG8Zs3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3974.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(6486002)(478600001)(66556008)(966005)(36756003)(6666004)(2616005)(186003)(8676002)(6496006)(956004)(4326008)(38100700001)(66946007)(16526019)(26005)(66476007)(86362001)(5660300002)(7416002)(83380400001)(2906002)(8936002)(52116002)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bm1CODUwTE9zV0VEaVowNzFjR3hOT3FBTExSVjROVytBUmxmamc2RXdURzZI?=
 =?utf-8?B?RWhGU0I1M2JPNnIxNnREbUZsM2gvMmJTWWYvNHVSd0ZlN2VhMTdKb094YUdo?=
 =?utf-8?B?L0xzWmptSy9lNlJyTUlrUEkrRmY2NkU0YnN4WVcxSmdzRVZaWjUxUWlYZjd6?=
 =?utf-8?B?L2lwNWtjRFJMVjdvbW5oSFdDNGJZRENDZjd4MHh5Yy9CRm1LLy8vZFN5RlNK?=
 =?utf-8?B?dGpyWExtb0hBVlVIdzlLM09Zd3hSVTIvbzFVd2ZFMGVqazVFZVJnTFJTVGVV?=
 =?utf-8?B?RDN3U3haVWtBSnZDRXhJblRjY2RFY2JZOUVNVXNGS1BzUXdXaTlwU1VBRjBm?=
 =?utf-8?B?S0Joemcwd2NsMGRpQ2pkZmZUR1ZVUlVyZVRjaUVUM25vTkZkbjY4V3Q5RmhU?=
 =?utf-8?B?bUh4dHF0S3pTbVdnV1dkWHVsQmErVEQ4K0ZkeGZRUEVLTzdvbjlHcGwzdDEz?=
 =?utf-8?B?Z1IzUTl5UnMwQzltVkJPa3hBZzJTckVIbWdCMDFwVUZ4QmpIMUVyVzN0ZklZ?=
 =?utf-8?B?b0NJbXVjd2ZDbVhjTFZKaXRRZjFTVy8yd1pYdHhVdW1UMzJZeStIQncrYnhI?=
 =?utf-8?B?bHNLNEVhSjU5dXNhRzRQdlFiSDFYSHNOU1paM1FSd2loUzdmdnFkQ2wzV0xO?=
 =?utf-8?B?ak9yRklqc2xhYVB2QWlCOFFwbFJiNlN6WHluL1pBdVlhKzZZVUg4NiszTUEy?=
 =?utf-8?B?UUlGcUoxQlh3UWNSVlI4ZWxsZFluUUxxL0MwRUxFdkRWcEI2QzNUNGc4N3RY?=
 =?utf-8?B?WGRMNmZFRG5Lc3hyVFVidC92RUFzUE85M0lDQzFUM25HM3EvcHRyOHM3SExk?=
 =?utf-8?B?dmpBZi9McC9obVNCK0dDMzhaWFZKeUNVOVFwTlZoQjZhQXBMRU95T1ZjZEFU?=
 =?utf-8?B?ZXhEcjcrRmo2dCtIaWJvOGY5b0l1K2JOVHkwWE5NQmR2dWJyNGFGREFocU1v?=
 =?utf-8?B?Y2I4ZzRNNUlPc1R5T0hsdnJGb0x1ajYyVUVYNENNSHJYWU1oSnljUXNITlZ0?=
 =?utf-8?B?a0t2L2cycXF1OVlyWUpyM1JPWXFlbUxjME0rSEZHQm0yaFV1RE9mYWdZdUNl?=
 =?utf-8?B?MUlRYmIxY3hMTEwvVVVrcXVscHEwNTRJdk9GRW5XVjdTY21NeVlDTzhlRlhw?=
 =?utf-8?B?a0M0VjVIWGpySy9WNFNwbXBzQ0J0WllVQXl6NWJ1N2FTWGlhdFpUbnZYK3h3?=
 =?utf-8?B?Zzgza2g1LytLdDd1dzNyUGFtSUl0SDh0Ly9KcWFaaEhmRjVLSzVSZjBMTGxn?=
 =?utf-8?B?Y0NQdUI4NVdIWks1RU5VUEFHYjVlMWdkV0tkZHludEhuQ2xidjBMZWxtSThG?=
 =?utf-8?B?N0ZwUndHeUQyQ3VvQU42R2VPVWhGL09IaTZENFlwazVsWE16QzFlbnUxcnQ1?=
 =?utf-8?B?QVBqVzNqaS8xUHlNU1RPMXN0Q2ZhazdoS09HWnkxdFdpc1psaWl4bDZYOGZW?=
 =?utf-8?B?R0N6TnlIR2xqR2FmSE5saXBWeVhFbWxsRm5pbjdnUE9obW0zdkxEMk5lMDRN?=
 =?utf-8?B?bktuVWlGakEycWpOeUxROW5OSVNOK3lCbWtvVll3UUw3ZjdPUTY0cVBBRlpU?=
 =?utf-8?B?eVgySW56RVRrenlKRW1CV1VMY3BGNW8rZnpGSlNsRVpXa0FnQVBqSE9GbFpD?=
 =?utf-8?B?STlMSDRPYUxYYUFCNlhJVUkvSkllTTBYU1VRU3dQM3dXNE5KdXBVUkltNlVL?=
 =?utf-8?B?NUQ2YlN5NW5CSE42TDZxcGF4WWE4VkRudFlMNkVWRVdLWmpYd3BHcDZxVHVt?=
 =?utf-8?Q?AlWJwMYZ/PyB6CieKpZs5fPZSt4cX66XBuQe2pr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fcfcb4-435c-4f5c-03d5-08d8f4ef2c1e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 09:18:55.0908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOkEFBHjwPKrw5GEV9m6UaXbCeh/sIuNck23gRzzQ8NErBXmmrGSRzay4x4atQnkKqfli8klGxvWrHzzT75Gvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3155
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, lee.jones@linaro.org,
 kishon@ti.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, vkoul@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-03-31 at 08:40 -0500, Rob Herring wrote:
> On Wed, 31 Mar 2021 14:33:18 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v6->v7:
> > * Add Rob's R-b tag.
> > 
> > v5->v6:
> > * Drop 'select' schema. (Rob)
> > 
> > v4->v5:
> > * Newly introduced in v5. (Rob)
> > 
> >  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
> >  1 file changed, 192 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/pxl2dpi: failed to match any schema with compatible: ['fsl,imx8qxp-pxl2dpi']
> Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/ldb: failed to match any schema with compatible: ['fsl,imx8qxp-ldb']
> Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/phy@56228300: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-dphy']
> 

Sorry for the errors.
But, my patch passes 'make dt_binding_check' locally upon
v5.12-rc1-dontuse at least.
My yamllint and dt-schema are up to date.

Does your bot _additionally_ check all compatibles in example?
I guess I missed something?

Regards,
Liu Ying

> See https://patchwork.ozlabs.org/patch/1460356
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
