Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45F33E688
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 03:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD8D89F07;
	Wed, 17 Mar 2021 02:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40047.outbound.protection.outlook.com [40.107.4.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032B889F07
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 02:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSySCSixwRuzuU58BbKMExp3txWY3IUx8j63lU0X0YvuHg03MM93Q7M1nY1W2wFDtl0UeLnzhLh5mno1Hrm9FYMWJchDUFRNrXhQpKNX6L9RDxIdrCg8f31vWfks5PLmkFACTSeN00y/HxbbkLxW2ph9aERkGYXwZ5PR9hzVuW51Zu4GYbVtL18kDzHSm0mkpIV60bTTOqxi7Bv2VTrHjywyP/nMGD66gufd0ihc6sak0WlMqbsk9PcX3LoXDLUUQc+bgAqQIFFlrTXiRRF67QH3agrx3uEjqZQuOKEMqnoOdUdpLEiXMdiz92Kopkj4btH6abok3AZBYJR7XWC6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qko6BML9aUA41cOi5+ZIX0FLVMjjNsMC5K+wja3IXZA=;
 b=XTGvRsxdqx80Ceseh+RiqC1EZB1mM90V5iysCDJ/AvxqXwfcd5ZQZh7BVR1+3T+SP+NngixihI+Ns1a3ekRzASqzHm3W8ICU1qVz3lAtbPL2D7kDUOwVNU8hR+/as0UIDEyneMoEUnaJcFsO7jy6uXzzDCcEMKSeHffP/wT+xmvftlVIh0U1WWNud3AEw88um5NdIGsCfBjcJB8xfw8oz7Zx2/DLLr3xlcAeSCo9k/Zgvq64YBKr2p0/W8ks/Yk8sLFGEa8ub9dbjCrLbO6x2HVFNLqwFy9Fgm8e9cxMizlsX49+iS+pYelBd8AjDOE3CN7pBZ3xQ5qLVuSrIFG+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qko6BML9aUA41cOi5+ZIX0FLVMjjNsMC5K+wja3IXZA=;
 b=O5NCfg85X8MJbAUxpKBS2uSbgsGub+uWMljJeOQ3ooCknQKa8Q75uLPLOhnuxUV/4MreqJi2tyWFxMlbeZPrg5+PLklWL+ekFNLV1AXeGSGuk9Ba0G4B54TBcu2oNLUIp+hSf5P7ZuHiQwJmbC95AGj6ceAuiFQvHRyWvBISYy0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7118.eurprd04.prod.outlook.com (2603:10a6:800:127::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 02:05:51 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 02:05:50 +0000
Message-ID: <ec2d1c4e9f68f86034ba2f9783bcaeab166a3b2e.camel@nxp.com>
Subject: Re: [PATCH v5 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 17 Mar 2021 10:04:15 +0800
In-Reply-To: <20210316223850.GA3806545@robh.at.kernel.org>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
 <20210316223850.GA3806545@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:c9::23) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR03CA0036.apcprd03.prod.outlook.com (2603:1096:203:c9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Wed, 17 Mar 2021 02:05:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cbfb6f9d-284b-44e5-e426-08d8e8e93019
X-MS-TrafficTypeDiagnostic: VI1PR04MB7118:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71181843C222E5118126221C986A9@VI1PR04MB7118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5d7wgda9wD5z+kxwYtapNOsgskN1ZXHYSjZ+Y/J/ge6XbFkGTfR/UXrbfbHSAT0KEBKnwQQFtBXb93Ex0QqN+e1eF2ObHr0rsP4TReji1cmOVbRhl8tDWfkmQtsTGM7Ga6r4Dg+AUtKuxNWIuh+ICPVkImLCfmV0/u4xjnRbSwbExKQhpO01TLNJbLFECb/0RT/12zd4zi+lKjpEj9JUdD2NzQvw0Sz+tHT7p8GrGcW3+FgA7z7sTJHPJVfT4WGJApIOZzknIAr8vJkVMr3N0kptWLpKtQSOO0g8CW76+BARpHncSYazTLRjlQlOJn2F0Oe51EImsIHi+18ybmrLPTPSiA2AtwQagW2x8hl/Lw8rRBthgqfqvYj9z3uUUJv0WhZrGCy/+5tM4sVq7vDlhJmihYt5XDQcpVHM7VkRs4uIAdj2aaNF1CT9KSruBfhIaTWJGNWTags/L/cPEGI1Hvriro1ODDZlej1vymNigHpW9Wa3RnzTyc1RAbMhYJK7QMWYpNaGOSJBWO/WM6G6c5dn/nC7Ray84dLJC7P3h066YWuh0wd/+DUtBSrVTMzMN607ymboqPoPLvTIV46KGvq+K2RZWv2KAB9hhtN4qKdFdiIByWFdVfc6rqR6ymC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39840400004)(136003)(6916009)(16526019)(26005)(45080400002)(2906002)(478600001)(8676002)(5660300002)(36756003)(966005)(66946007)(6496006)(6666004)(316002)(7416002)(186003)(52116002)(83380400001)(86362001)(4326008)(956004)(8936002)(6486002)(66556008)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVFGMFR0dU1WY1N2eGZ0REQxUTN0aXVTc3Y3NkozRUZ3SW1oYlpVbXFrbWly?=
 =?utf-8?B?SkExR3RNRitucTBCMHpsaXJTaVVkOFllNmVvQzZ4ejV2anFBeURlWGpIUTBW?=
 =?utf-8?B?V1FNT0JFak9McWpaMUlqNzdlS0Y5R1c5d2I4MGF0WHM5Q3gzTzFucFFEMTJW?=
 =?utf-8?B?bWJKenhaR2hWVkxySUlOeTR1K3pjZTlDUTN5QS9iOWRRTEp4N0RqUjFOR0gr?=
 =?utf-8?B?M25NdGNCVFdnUUM2T3BlNDMvUDQ3RjhFQmQzaVZ0emh1bUYxK0ttMGl4dmtV?=
 =?utf-8?B?OS9BdE5HK285Zkk1VjRpbkRabVNWSVN2UnlpQ2VSNTkrVU50emRZUHdVTHp0?=
 =?utf-8?B?NVNJSUNjNHNFY1RxRmM1TEFWakorbklxbVhrVUtPWkVEWmVMaEFpV05ld09x?=
 =?utf-8?B?N3BUbmI2UjdRWTBnU3RjYzExUC9meUdUTXVmVm9Nb1pYSXpMdndNRlhsYTM4?=
 =?utf-8?B?c1JVS01BTERXcWUvRW5PQjlDV0hSVzh5S01wZkMrV3pRSDZ0cnZTUHpqQ29Y?=
 =?utf-8?B?MGNKbGVycjVCelErZGQwTjR2QmVwTUs3T1J4U01LTXRxWlhmSnBhTlU0S1FD?=
 =?utf-8?B?d1VjclVwNFhaMFZBbVA1YnJBUGt2VEc3SnNpNzFTQTF2RWVpME04S1lkMWxo?=
 =?utf-8?B?eHBhSjh2L1FBRmhraU1mYXdyazdWdFdPb2dOT2t2T0ErczBxM1MvT2Z0WFMy?=
 =?utf-8?B?T0IvTmJWcXNWenRrYjVCSXk2MWJGNmVGZUgwK2FuUFAzbkxObXlPanBZYjYy?=
 =?utf-8?B?OFdoQVZvVDMvaFh2OERLOU53SlNqbjBmblJXcWkzYVlZdUF4OUpkdmNWcWZt?=
 =?utf-8?B?K24vT3k5MVFQaWFqQmVoemk4cHdmb3orZDZmY1ZTQUVxbzJzMGxWdkw1ckY1?=
 =?utf-8?B?UkVNbnJBd2lIM3Y2NHpMQzFmdS9WbFFuc2pUMGhPUzVTd1M3cklvKzdwaUNB?=
 =?utf-8?B?dXNiaStFQ2Z3LzJzS2l6ZHB1Q0N5b2pLYjRDZ3ZoUjg2OGhjczduTzlyWm0x?=
 =?utf-8?B?L1U2bzZpZE1mYitvR1ZpdDEwb3U4TE84ZFNiOU9HeDk5UzBsYmozWVVac2o3?=
 =?utf-8?B?ZGl1c1JOT2RBMEV2OVlrZ0ZRSmNWZE1OWVBOZWI4SzNjenFIT2NQU0J0L05y?=
 =?utf-8?B?SG9XNEx1dUZSTkpOOU1FMHJGV09DU251VnZwM0pzanYyTVpnVzRmeEdnRDFP?=
 =?utf-8?B?Q3pTa2hDNmNHdVNyTzVDSHllaXkzZEUxWUdhVi9yVEQ0NVJhTHFoSGppV2tr?=
 =?utf-8?B?QUZzYVg4djQyMTFNUHhOVmw0RjFxVnc4MkxzNk0rV0FpS2JMNmFwd0J6cnpX?=
 =?utf-8?B?Q3ZjZHVHQTF0SXVFMEFpdzFDUDNGK081V2FoV01zZUsrZldOcy9CZG4rTnlL?=
 =?utf-8?B?MVltS1hoNE43YnlZb1RuVFVuVDV2KytNMVVCeUx5dHQvUTZHVmY5Y0c0ditR?=
 =?utf-8?B?akg5bGhlSHFhU3ZNVW5hSitXZStDbHo3M1VheUQ4d0cyaW1UUEJXWjRjaitm?=
 =?utf-8?B?aHFFdXZFazBGckRINW54aWtTNURYOUh2U3ducUQvUWYzckp1clpNVkYvbzZB?=
 =?utf-8?B?M1AwSG93YmpMY3Y1allQbk5scElPQ0ExZVNNK0I4SEdFQ3JZOXdlb1JJQUQr?=
 =?utf-8?B?Q044WE9mVTFzTGxlWnlBQnpLbTZEWFlSM1dRYjRZZ1hHQUwrSE5zVTM4MEpD?=
 =?utf-8?B?ME9VV0tna3JSeGFxaFI1Sk1YeFBzTjVHM3V0eHVCMktDall1U2N3RHRCVUF3?=
 =?utf-8?Q?fhaRhnPCYqWCGC33HjwEFI5mqugyY28hRyPyGjx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfb6f9d-284b-44e5-e426-08d8e8e93019
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 02:05:50.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtnDZ/2XqOkmtssvtDVPMCP/kijaEu02a9fgaiabBGgDL7CSqii74IS6Knbv+00BKizqzd29a7soorpem0X2tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7118
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
 kishon@ti.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jonas@kwiboo.se, s.hauer@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 vkoul@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-16 at 16:38 -0600, Rob Herring wrote:
> On Wed, Mar 10, 2021 at 05:55:31PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4->v5:
> > * Newly introduced in v5. (Rob)
> > 
> >  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 202 +++++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > new file mode 100644
> > index 00000000..0e724d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > @@ -0,0 +1,202 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fmfd%2Ffsl%2Cimx8qxp-csr.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8ee75a0dde484a3d221608d8e8cc47f6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637515311382184508%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fkym85OLtd5cA%2FdwJkXUbiR0EwkZX4yP4INsAaCywUo%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8ee75a0dde484a3d221608d8e8cc47f6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637515311382184508%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3n2mTxsUNF480D9xQQuXj7U0noiLCUBT3zneyWPr6ck%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Control and Status Registers Module Bindings
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  As a system controller, the Freescale i.MX8qm/qxp Control and Status
> > +  Registers(CSR) module represents a set of miscellaneous registers of a
> > +  specific subsystem.  It may provide control and/or status report interfaces
> > +  to a mix of standalone hardware devices within that subsystem.  One typical
> > +  use-case is for some other nodes to acquire a reference to the syscon node
> > +  by phandle, and the other typical use-case is that the operating system
> > +  should consider all subnodes of the CSR module as separate child devices.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - fsl,imx8qxp-mipi-lvds-csr
> > +          - fsl,imx8qm-lvds-csr
> 
> You shouldn't need this, we filter out 'syscon' and 'simple-mfd'.

Will drop this in next version.  Thanks.

Liu Ying

> 
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^syscon@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,imx8qxp-mipi-lvds-csr
> > +          - fsl,imx8qm-lvds-csr
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: ipg
> > +
> > +patternProperties:
> > +  "^(ldb|phy|pxl2dpi)$":
> > +    type: object
> > +    description: The possible child devices of the CSR module.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qxp-mipi-lvds-csr
> > +    then:
> > +      required:
> > +        - pxl2dpi
> > +        - ldb
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qm-lvds-csr
> > +    then:
> > +      required:
> > +        - phy
> > +        - ldb
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    mipi_lvds_0_csr: syscon@56221000 {
> > +        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> > +        reg = <0x56221000 0x1000>;
> > +        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> > +        clock-names = "ipg";
> > +
> > +        mipi_lvds_0_pxl2dpi: pxl2dpi {
> > +            compatible = "fsl,imx8qxp-pxl2dpi";
> > +            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> > +            power-domains = <&pd IMX_SC_R_MIPI_0>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +                    reg = <0>;
> > +
> > +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> > +                        reg = <0>;
> > +                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> > +                    };
> > +
> > +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> > +                        reg = <1>;
> > +                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +                    reg = <1>;
> > +
> > +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> > +                        reg = <0>;
> > +                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> > +                    };
> > +
> > +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> > +                        reg = <1>;
> > +                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +
> > +        mipi_lvds_0_ldb: ldb {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "fsl,imx8qxp-ldb";
> > +            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > +                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > +            clock-names = "pixel", "bypass";
> > +            power-domains = <&pd IMX_SC_R_LVDS_0>;
> > +
> > +            channel@0 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <0>;
> > +                phys = <&mipi_lvds_0_phy>;
> > +                phy-names = "lvds_phy";
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> > +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +
> > +                    /* ... */
> > +                };
> > +            };
> > +
> > +            channel@1 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <1>;
> > +                phys = <&mipi_lvds_0_phy>;
> > +                phy-names = "lvds_phy";
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> > +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +
> > +                    /* ... */
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +    mipi_lvds_0_phy: phy@56228300 {
> > +        compatible = "fsl,imx8qxp-mipi-dphy";
> > +        reg = <0x56228300 0x100>;
> > +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
> > +        clock-names = "phy_ref";
> > +        #phy-cells = <0>;
> > +        fsl,syscon = <&mipi_lvds_0_csr>;
> > +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> > +    };
> > -- 
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
