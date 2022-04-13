Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D74FF6F7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 14:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9310EFA4;
	Wed, 13 Apr 2022 12:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40057.outbound.protection.outlook.com [40.107.4.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7CC10EFA1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 12:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw0FnIXtfNFNQAKXqK9eso9YQf0ux0Lrh3aCymjAj0XlQ2VMCtRRW3ewH35hqcbH3Gs0uz73ntfluzgYMgGM201WZlxAakIzq7iKL0vOmJNwkMhaPbxjQYZ8yLs46LKMNXYjKqahfJa6MBbq42ANfWCpz7FbLyNiDojf6p708gs7zRnh4FMhIdLOeMp+F+bQnzHBDRiaJ3axWlvobkGWCoiHG+7II39w3l7w1cd6CzaWl4x5KES6j3Qr6o2gDpWqXX+5FNmXkL7s3OT2vE61DmI3bm4Tf0Uhs3IrDmc0ROeE6u8g7LYkGgU4+s2QISJ2nXBuyXCfo2mei8RT5QRvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yPmxtQroAmndBeIUj30xlduBu0PQHu8UuZRj7HGYLw=;
 b=Xlkud9rCXXj5hrI4W5Cqhb9mXSS+UAR6HuNq/2NVrNAVN4r2IavX5nvk8+de7Un3dCB4dMipvS88dNTG6dkfI7+oJJ71bvHu3yLZDjHF/Jp95WAeTuPV+l0gJlBZXz1/H2qzqVC/nyRq2lBWuChKdgsqOc+JlmeTl+bUiSZI+XQH3zyRMkwec/sLecL1likUTGXzXCN2ZhEZUEfvHNJBPdkuF3h1OgkZHqfXBJN/fkCwbOiUy0NTGaBwb5w/ARmHKEH/ojldbCZfso1j0o8jxGc8E2x1P2LNRWEAgCRjAzUArPJ/qFdzX0wMoXFYXE8XlDF3Ii4vAo8oza2rxNEU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yPmxtQroAmndBeIUj30xlduBu0PQHu8UuZRj7HGYLw=;
 b=h+Xot62jz+SQ4jEOP4zqkl5uiLctnO6H0QM0tgVj6GTc7Yyl4WOxfrsgSQG4ygxgfz6ZziuKqOYkLvoRm1V6iFL0Kbx9+cEGPKHP/BPQ37Hwo9kYsm+Qe2OyqDpgA0pT0/Fe0nYrkFqLiiQJCuCczKTkFTVm3irE1CNMcJIhqx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6065.eurprd04.prod.outlook.com (2603:10a6:208:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 12:39:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 12:39:57 +0000
Message-ID: <a2731b2d77f9bf2adf36f0c05cb5e3b14a5a91a9.camel@nxp.com>
Subject: Re: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 Apr 2022 20:39:41 +0800
In-Reply-To: <YlaqwoFCfusFgIIe@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-3-victor.liu@nxp.com> <YlZpnrKt9NbHZv26@matsya>
 <d77b41d911e126331138ddaca146a581d316bd09.camel@nxp.com>
 <YlaqwoFCfusFgIIe@matsya>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0060.apcprd03.prod.outlook.com
 (2603:1096:202:17::30) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3768b46-dd34-4c21-9c7b-08da1d4ab7d6
X-MS-TrafficTypeDiagnostic: AM0PR04MB6065:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB60652B5C54DF6607A706C2CD98EC9@AM0PR04MB6065.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jaiR/H6zsFmBVmHYV/dxnuYNSrALWA1DxfNWXRv9z9jJBBBalBK7KQkZ98hkiTUpvWADKaeZqH/r/fiNjofBgLamxvsIJbRPAFrlZNocdj3VZYhhW9PoqwEO95mbq8KSS/fznncjiD7LezJi7U56OcP0YWiSumBZWLQqs7IAvLADBIMLU7EmnRVwFWooFUEj5WNTmMtkVC+qrTWKEbvMeZPEr1QkbdORpG2O1Axg3gLX4wZ/7Cqhp9wLnWVP4WqQLyxpkhHc+MIsSDiJ41XXwJUei1vgDxONdO3Hb49D+U9pGbWz+voeur++2XBuVvsIu1HzjECtgPs7u74ceDpBQ80BaC8ZUJY//Ou/NddnJfNRZvaraJLnUmNtdVDedVGsMB65mzvd/ybzhayR9bhmXc/VLaHiM0lDP/UytHg9eGTJxa/m8HMUfDtj9NhHQsB3sUtIbjhJt4Rw+4A5yjFJqwvY1WPIiVhAGHdB0IbdudQvKS2TUX/4IAHXT2kxjjieNslOGb3y3EUXj78USbqZOqXiZlF9u9SnaGh/dBGr+U2u/yIVHqUWswXtDrVRAX1afiZSBIH7zksTccswMpTTPhB3pz/YW0Xbvms48KXqOYCbacHl+yYTRC30ScPWbbAL2LyZWqx6yaHCmyanvTaYLbUN7rb6X47A4d3ARR6lOQ46JMpyxcE/kSSul+iVAr1If4XH9nCQsGTf3azZ+cxtjYppc6a50/sl57N9xfA3i6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(186003)(38100700002)(38350700002)(4326008)(66946007)(66556008)(8676002)(66476007)(5660300002)(6666004)(6512007)(6506007)(36756003)(6916009)(316002)(52116002)(2616005)(83380400001)(7416002)(86362001)(2906002)(8936002)(26005)(53546011)(6486002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJkOGpxWU4yQ2hGRHpvNVZoTlNVNDhzNzdZcGVhWS9PYjdDeEVCdmg5dW5o?=
 =?utf-8?B?ZDFPYWdtY1ZxRkV0YWhBbzNrTk9Ba2wxR0pPUlgvRG1pRDVVZkg4bWNVb3Ri?=
 =?utf-8?B?MWpzMlJGNDJ1QVY0T21NVHRaV3FIOUJmUWhleklNRzZYK0VPcitmTEROM25m?=
 =?utf-8?B?R09lNFFyNmN5dU5NZ0xWUXI0bm1XUEtZZk1UK0hQM1lEM05ZZDhVbGpPSVEr?=
 =?utf-8?B?M1NiRnVWd3luNUFHOGRiRVJnaFR1MFhYaEd0K0NPUUl3WWRlNEMwUXdzSnY1?=
 =?utf-8?B?OHF2YmhUS0FYLzJOdS9GSUF1NjR4d0ZlQXBOdjdPNHpIRUp0dE1hN0VMdzBI?=
 =?utf-8?B?OFJrWDhERGJaazNVRnE0czZ4emZEUUw0NGFsYnpGeEJmTTBnblJIaWFrd2RN?=
 =?utf-8?B?Qmw4ekNrK3R2TTg3TEpyS0NvNElXa2NKOU0yWGQwamZpeG14N01OcmljN1JB?=
 =?utf-8?B?aFRmT3ZxRlMzd1Z6eUlCdmcraUUyNDNRNko1M1pEdG1veEt2eGhuL0xuQnA2?=
 =?utf-8?B?b3Via0hyVE9YdUlQS1IzTXVObGdENEE3OWM1U0I5TlNZTzlrWktSWTI5MkJr?=
 =?utf-8?B?S2RiU21XRlI5Z3hEUWx5RDRDOElkUGU3b0dmdkp6V3prL0Z2WkdaN3p0dlN2?=
 =?utf-8?B?ak5ZOUlIbFVkc3JKbUlWZTdqT1JGQzJRNEFNcmNScWpsVFBRdjNjUTZHa3Bm?=
 =?utf-8?B?c0ZaaC9rL0tVYi9VNDdaKzlJd0NjUW1Oc1kxU1VlZjJhNENLWG90NGQxMnQ4?=
 =?utf-8?B?bGdlWnhiWlRqa2w5R0VSNlZYQ0NBdGszSlh0dGZZaldWeHdIK0Z0TlRBaG1l?=
 =?utf-8?B?cXVLSUsvczlGamFrME9SMStWQUl3MmNFbkYrWnRjbDRROENzMFRpSU4zd20v?=
 =?utf-8?B?WW5ISE9JM25ydWoyRFFOME5qa3hCdHNvM1gxbFpncTI1YWJLVTRINlRCT1FN?=
 =?utf-8?B?cmhKa3ByVExCVTU2Rmk0QlozS2tJUEZtWW8reGt5enNwWFp5UHY4ZWpnQU15?=
 =?utf-8?B?cWhkbFRmdkgyS3dQazhxSmxBV0ZlOU1zZ2xYc1VIMDFtZjc5Y1ZGUVk0aWta?=
 =?utf-8?B?NHJtOHE5VGZQbUE4QWtiV3FpVTZnZ0hqeVdqblBEdTd3bUxMTTFnaGhNV0FT?=
 =?utf-8?B?Y0VjdFQrcXNsazMzVUxab1JOWlNiTCtOa3lzVGlBUTRBS0E0ZlUzUVdmWHR2?=
 =?utf-8?B?Z3JrNnFsZERhL3l4MUZSLzFyb2VuS0lVQkFGNUhwMEdsMm5pNGlVZlM1OEpX?=
 =?utf-8?B?U0oyU1IyZUswczBTNHdGTzNxdm1wNi83U2o3YktDT0tFTzBnU2x4UDhUOG1K?=
 =?utf-8?B?RmJiWkQwVU9rV3Jlc1RSNnpCRkdSWVYwSGNmbEtOekZvNERmL0lCdXhKNXVD?=
 =?utf-8?B?VmMreEsvNGdQTTR1MFRsOHNmbXZEQk40SXZEa295QmlEZWN5dzdPTjJ5Ynpm?=
 =?utf-8?B?RnpIaC9oZ1gyTlRBRVVTQXdNNHN4dEltdnRvUU9lZ3dMWU1Rc3ZDQWJhcWpv?=
 =?utf-8?B?WkdqSkF6QTl6b1J6WGdZbmJWNmsrd2tMRCs0WmNFZmZGU1UwRTZ1MTBxd0dz?=
 =?utf-8?B?aWhyVjBqSlcvenBnOWxuNStmcmoxU3RFZzMxSnNnUEtPS0I0aTM1R1cvYm1p?=
 =?utf-8?B?S2ZJVXRFRUdrSFFkMXFJWExLRlltZ3lVSXVaTXJvZ0NZMDBKVktXbk9RZWJw?=
 =?utf-8?B?SWhEMHBBaFZBejlpREU4dlg0KzlhTkV5d0xVWFRKQXQ0TUFrUkswV3RHcHB4?=
 =?utf-8?B?RkhmYUNPaTR0em84c3g4bFRlcDJkQWlUbnd1WVllRndPRDhHaHhKeEpOMmt1?=
 =?utf-8?B?RkpxUXBoQkFnNFU0WDVYZ25XbmVXTVBEQWVTVnRVUFpFeThiZ2RiS3ZzZzFV?=
 =?utf-8?B?K0ZQZEVxVXg5Q1ZJYktMVlROM3lYaUlJaER0SHpsbDNnL2syVlpuSld2MHJy?=
 =?utf-8?B?VHFHR0pWSkhYTTdneEZzVXZrdnBBRmJqQTRmenZNakxRZ0l6ODN5RzlZSXMv?=
 =?utf-8?B?Mjgybms1V2hrQ0RWR2xJSDIzeEIvVEVybnliVk1Qb24xWG9uSCs1bW1ZU1Zr?=
 =?utf-8?B?WkoxRlg0SDZyemhXaXhxZDB3OEc0Q29GWXlPdmxqQVZ2ZW0yMElXSDIrUEVM?=
 =?utf-8?B?KytacFBxSmc1T2pmQWlIVmo3Q3JpYzdwQlAwemh6QzV6K3VZV1g0Kzcya3BT?=
 =?utf-8?B?dk9GVlZYc0hPanZQQzBOUU81OVNwUjR6ZVRJdGtqQzZ2RHpRT29DajRRQ0Zx?=
 =?utf-8?B?dFlhVTJnK21IYXRlTTlwVE5ZSTNUbDM0Nmk5VzVVOU5DS0M4aHRjRUR4NUpj?=
 =?utf-8?B?eFR6TFhER1UwdUZidnJtNEZIWmlUT04zYzMrbnN2elZnRStWSkczZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3768b46-dd34-4c21-9c7b-08da1d4ab7d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 12:39:57.6676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCTTW0z1QLClJL9tbZlQmpHVjGLUA4C+Q/0RYlPPTUZTSvKOv6XYUzEyS7S43YOxwpHXMLs3gfNP5fTBG90MIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6065
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-04-13 at 16:19 +0530, Vinod Koul wrote:
> On 13-04-22, 18:04, Liu Ying wrote:
> > Hi Vinod,
> > 
> > On Wed, 2022-04-13 at 11:41 +0530, Vinod Koul wrote:
> > > On 02-04-22, 13:24, Liu Ying wrote:
> > > > This patch allows LVDS PHYs to be configured through
> > > > the generic functions and through a custom structure
> > > > added to the generic union.
> > > > 
> > > > The parameters added here are based on common LVDS PHY
> > > > implementation practices.  The set of parameters
> > > > should cover all potential users.
> > > > 
> > > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---

[...]

> > > > + */
> > > > +
> > > > +#ifndef __PHY_LVDS_H_
> > > > +#define __PHY_LVDS_H_
> > > > +
> > > > +/**
> > > > + * struct phy_configure_opts_lvds - LVDS configuration set
> > > > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data
> > > > lane
> > > > and
> > > > + *					differential clock
> > > > cycle.
> > > 
> > > What does it mean by bits per data lane and differential clock
> > > cycle?
> > 
> > Please check
> > Documentation/devicetree/bindings/display/panel/lvds.yaml.
> > lvds.yaml metions slot.  'bits_per_lane_and_dclk_cycle' means the
> > number of slots.  But, I don't find the word 'slot' in my lvds
> > relevant
> > specs which mentioned in lvds.yaml, so 'slots' is probably not a
> > generic name(lvds.yaml is for display panel).  So, I use
> > 'bits_per_lane_and_dclk_cycle' as the name tells what it means.
> 
> variable name is fine, explanation for bit per lane and differential
> clock cycle didnt help, maybe add better explanation of what this
> variable means

I may add an example diagram as below...

> 
> > 
> > > 
> > > > + * @differential_clk_rate:		Clock rate, in Hertz,
> > > > of the
> > > > LVDS
> > > > + *					differential clock.
> > > > + * @lanes:				Number of active,
> > > > consecutive,
> > > > + *					data lanes, starting
> > > > from lane
> > > > 0,
> > > > + *					used for the
> > > > transmissions.
> > > > + * @is_slave:				Boolean, true if the
> > > > phy is a slave
> > > > + *					which works together
> > > > with a
> > > > master
> > > > + *					phy to support dual
> > > > link
> > > > transmission,
> > > > + *					otherwise a regular phy
> > > > or a
> > > > master phy.

---------------------------------8<------------------------------------
+ * This is an example with 4 lanes and 7 bits per data lane and
differential
+ * clock cycle:
+ *
+ * ::
+ *               |<------------- one differential clock cycle --------
----->|
+
*                ________________                         ____________
_____
+ *      Clock                     \_______________________/
+
*                  ______  ______  ______  ______  ______  ______  ____
__
+
*      Lane0     ><_bit0_><_bit1_><_bit2_><_bit3_><_bit4_><_bit5_><_bit
6_><
+
*      Lane1     ><_bit0_><_bit1_><_bit2_><_bit3_><_bit4_><_bit5_><_bit
6_><
+
*      Lane2     ><_bit0_><_bit1_><_bit2_><_bit3_><_bit4_><_bit5_><_bit
6_><
+
*      Lane3     ><_bit0_><_bit1_><_bit2_><_bit3_><_bit4_><_bit5_><_bit
6_><
---------------------------------8<------------------------------------

What do you think?

Regards,
Liu Ying

