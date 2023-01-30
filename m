Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D36807A3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740C10E156;
	Mon, 30 Jan 2023 08:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE3E10E156
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 08:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQOI0IgW1x61Tgl7lVYJyiBcEh3Tyj8NWBuRKa4GwYvJ8OpZ0k8TMQ2cp6JH0l01jTx0LpzsSquEGrzAttfYnyFIURfoosbPPKHLQz9faompU89YKMdRiOmsebVOpEzo2GL4fvfLMVf/IbvBVSsMAINIbHeyr85EtNWydIHWiLPLNctkxYADBIFe4tUCk2YfMw+kJoNyQNyVji5S4b4kPT4YvZxrcLxgp3zoENfE0q57g/9NGRiIDXKI7e6K5CTeLNvNx4yDBR6rpyyQEFryg2smSgy56DZOJBNd3tNCEy9SOrwcHROxx31EYZ3N2lYIy1hi2zcMb68KTbRcgfOeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3J1zo/xGHqNYNupdCm/8NiHaBw1+9TyGMGE0ZrvQ40=;
 b=bQzNVbtNZnzwoGzSro5/aANn4RW/CEmWbV4W9ShgjPO+o41u2zNdOZpLVZb5Lg6d+6zQEcXi1yFbZ0sp9PyVTMHEmiyBQIPu85ksJ+rsbQYVA7Brs6vm/7XijnhN2nqEtqaOtSIzVohaCvndgV3zAiuJDSRq+gX+DciWt9oqykKj+bCRv3OT4fPCEaATz9sK+60KbeWd6va8DP5ZMD9qsyH6FkqxqUhT+teenTLDxYxkeo4b8QtUtVzzISguc2bZkB4byENf2EouOHbVMQq93UIC5IR2Jo0N6EWx/Vx4o9o+5dTh5xIelqRh+3oPAO9MveXfLFM0TRlkbmoyFYYlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3J1zo/xGHqNYNupdCm/8NiHaBw1+9TyGMGE0ZrvQ40=;
 b=ZKOr8mvaaDc1BoI3CXv/GMe4W5MX0EriaZ1hryWrvCI8vdex6xPLiDQUfNr/wTfkymUv+stOqQQ06UFwKSnWs7qzaINEcbEyGbuFmLZyn7OggDX8zes1MVTSfw0H1kZMiY6EmnR0jWFbqxyW7vt9jW/wCodPRoorRKXmsY4jCkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8481.eurprd04.prod.outlook.com (2603:10a6:20b:349::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 08:42:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%8]) with mapi id 15.20.6043.023; Mon, 30 Jan 2023
 08:42:13 +0000
Message-ID: <87d6f54c4695330064eda295e258a0a5c3bc48f8.camel@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
From: Liu Ying <victor.liu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <3c07b9bd-1981-2945-9efe-80afb0195de8@linaro.org>
References: <20230128034713.1530218-1-victor.liu@nxp.com>
 <20230128034713.1530218-2-victor.liu@nxp.com>
 <3c07b9bd-1981-2945-9efe-80afb0195de8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Jan 2023 16:39:05 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5164f687-e241-4446-9c11-08db029de246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xBO3ks5000azIdmkSECTeXxGY8972iQhXbnSPzZB8RvSLZpdBgqLd8h4yXCkTxAbafJbzkLoD6dh5wgsTgkg4g9kzZ0etsWj1O7ZJ91H904Djk6AL2UhfeYQAoCX/x5kYbK0q+uOsU+k97M4mak7aQ2TMJhW34qEkRq/J9kyBM9b2RVXT6sxT5IHh2woavnydxpAgC2P3sP94OkDeqjUuKN9tIn8HFn2sQkD0ZDrCHFZ/pX3HEk00rJENQxaA5D7j5tR67p1X07EFEctzaFtzxZI23qVaM+vTqsMge5dosqPhBkaVsqUbtRqYPN2vnF1soyPR24vRBZCMisfQe9HMOiGsYzuCxWMIqXDQjpX6gPZClNvpPc3L5JfRclTScgbIe8sPH11MyIdXaSYuodyb1XdPqS/tNpS9ReIuX3Mw0jqh4oWDcwVAV0LSqt955CAUEkwFAr2XLcdt19ICOuek/ARXyLNfBqVsYAdVmndCYH8BVARc/1l6mIiQzHdqgaUe7kcsX/6jc+Sm2JB3qlNEPgB4btRP2rjMwSGIouTL9KQpCpX0/2Mwflrla3HL3wEgItraBPeO3Kd7eLa23GFV89l/3e9O1NJIDyAcqx8OnSgmxxi6VHisnbvMkBiS3LJ055hLZVYJvOICQiZV3vkaprrfdI/MZzaiumUNmQWbYa+xaJXKGPO+WbC00bC0yY5t6Jqao8K5YPj0P6niazt2I6iILdIZEdi/C4RbcYcEWTwWrwYflxBf+6owycuOD99s7h5UM6zh8EfJmP81ahZhR3lD0H91xhEfGP+kSCG3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(186003)(6666004)(6506007)(26005)(6512007)(53546011)(86362001)(36756003)(38350700002)(38100700002)(2616005)(41300700001)(8936002)(2906002)(5660300002)(7416002)(6486002)(45080400002)(966005)(478600001)(4326008)(316002)(8676002)(66946007)(52116002)(66556008)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlGYVpBV0hEWDQwNE84TmpUR1JGMW5DTDJHaGpHa0toUzlIOGRJMDZCaldI?=
 =?utf-8?B?RG9lclRvOTlaazh5OTljYzJmbVFBMTdHcjE4U3FBQzB3VFY3ZjZHYWZPSnpl?=
 =?utf-8?B?c0M0a0VvN3Y0STNkL1Y2L1VJZ2lGYk1XSUtsc1hYWjZWK1Q2bU9kWHJqTUxW?=
 =?utf-8?B?elFGVnZWYWl3bVR6YzBSaHR2YXF3eGJsYnpsQXN2ZUQzZGxwaWdYdXJuMFpW?=
 =?utf-8?B?aWFzRXRGaGJONjJISWhkLzFxNFJoLytDU2lsUWpvTzluOW16NGx6cXg5RVND?=
 =?utf-8?B?eDUwQVBGekVNaTFORk9xNWVxUUFMTkpHTldhVjVEZVJYMHk5YmEvaGxodksr?=
 =?utf-8?B?YW9oNGNCY3RmQ1d6dnNISU56bTBTdDhBZmN5Vi9LZWlQekk1cGUwNkFMOC94?=
 =?utf-8?B?N1B3clorMEpvNzFhVU5HQU1PMFlGdjRmcjVBSVVSbHJhT1djUVEvQzIyNVls?=
 =?utf-8?B?NVppbDhyNXdFMk9DM0d3UFA0SkR4R29KbzhRRTdMandYMnFVeEcwaU81Kyti?=
 =?utf-8?B?dlJudi92Z3BHK1ZLUWhNSFB0a3JTcng5UDN0a1pBaTJIc2FqU2w2OUtQRVBj?=
 =?utf-8?B?eHplOUFjRExQbmhSWnpBa01IMm4xL0hOcVZQOXdWTHBhNjQ0a1VWNHFxdlJO?=
 =?utf-8?B?azh5T0N4U0RaYUx2dTBNNks4VmY3NHViV0dYUk9PNjZrSjBGSTdTZzhjOExL?=
 =?utf-8?B?dWE2NlcydWZiSnJSRkw5Nko5azZLM0VGOXFlNlllSmRVR0UzMkxxYjIrM1l0?=
 =?utf-8?B?YWRIZGQ1bDloeC9lSG56b3Fyay9BNXFsZmJXdHZONFg0K1NKMDZuby94RGlU?=
 =?utf-8?B?YmNCYXgwOU9QbWJhVWdNWm44Zk01Rk5rR0JPUm5wRHlFdTdEc1RkazRUZWtL?=
 =?utf-8?B?N1hJRTViUk1hRElYUVV1dSt1R0JUQ3hTczE0OEJHN2c3Rk8yaVVxM1NUeDFC?=
 =?utf-8?B?OTZCMCsxbzMxc0tLc0VKSXZXWUpIMnJHSVVuejNLclZPalRvd2hiTkhST3pm?=
 =?utf-8?B?TFE2NUZsbjdiazR4ZGRTaE5ONEE4SVU5Y3cvTk5pTGF4WS9KVnRhRnVrdEVp?=
 =?utf-8?B?UG96RlY4TXlkREFEK0w5UFZmSUNqNDArT0lWYmY3WVYwQ2VkN1hHM1cvc3B1?=
 =?utf-8?B?SDY1NWUrNFpyZW5Fb2NVTitqRnNFS0N5V3dnVHlZSDJzU09LNmhNV3U4RU1R?=
 =?utf-8?B?WHZlTm5ScWJvNGZPb3BWOXh0UklkMWRFWTFOR0dGMU1PT0NGN2NnNjBIdGdn?=
 =?utf-8?B?S0dsNkk2ZFg3UnJuZW45ZHR1dWphdXRhb0MweS8rWE9nZGNicmZYZVZDRTdj?=
 =?utf-8?B?UWhDN3FhMjNqLzlxMmoybHF0VTc3VVlRVHR4L2srWHovUDNlQTlxNlBHbnNC?=
 =?utf-8?B?WFkreklwZldMS2N1Nkl1TGFOY3V4OHRsSTJ6YlVIMEhyQ3RyWktYSVpYOXVU?=
 =?utf-8?B?SGk5YWpZZWMrc25yWkhYcWZFMTVwRzZLeVF2MDFDY3BxbjJ3dkF6L1dNOFNk?=
 =?utf-8?B?M202alp5TEdMZkRKYU1XTDJDcXhqMlRIVnYwWXpqQ3NKMkZrQUhsSDhDQk5p?=
 =?utf-8?B?M0dhbFBBRFVqVVB4U1FOTlZnQTBWZW1jbUxwa2hDOEhiUFdudmxDUERCdjN5?=
 =?utf-8?B?b2pWd3ZnUnE4NDl3QlFLbWhKRmVydXcrM3FnU01rZXFtYzRNT2lwQmhNTktJ?=
 =?utf-8?B?ckJiYTFQRndoN2lCUDV5V2ZDcjRtNUQxeGtqcXdzTUlKaHN4dW8yRk5SYnM0?=
 =?utf-8?B?Q3E4ZVprSjJJS1dCd3NHd2hqZ1ZSR0VldzlLa1dDdklaa3pWbFhvZnlMN2JI?=
 =?utf-8?B?UG9CSWdNam03U1JueWhYbEZ4ZXJFNUFmZmVWalBsZFhPNDRLVkJjUWlSclFm?=
 =?utf-8?B?Q3g0T0JVZEJ1OUNSTDR4S1JFc3ZEYVUzVGMxazExTjJybFNpaUJSU3QrRjVX?=
 =?utf-8?B?c0pTRVFTSWhKdmVSRDZjOU4xck5wN3hYbWNidm9EUXdwSUpXOXZMaEFzazNp?=
 =?utf-8?B?V1RHQUFPKzZTbUNwTjNMT1hlM0pEL3FXVHRCc3FrVVh0TCtram9tUDdldnM0?=
 =?utf-8?B?T05OTmFhTEVwbllxaThMQ3p3RjlyV0FnRWtDcFhXS3pkOHc4dmU4dVJoUnlW?=
 =?utf-8?Q?SgyyBZA6QEmupFhIQRB1c4Qi4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5164f687-e241-4446-9c11-08db029de246
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:42:13.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbcDpTuWVkHesh2JxYkR8k7nhHE5+Mcn83FbmaIpGa6lZOnUv48UyJps7hZoN2O/nCgGJgQtJnksJZggjFprsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8481
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, kernel@pengutronix.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-01-29 at 12:46 +0100, Krzysztof Kozlowski wrote:
> On 28/01/2023 04:47, Liu Ying wrote:
> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register
> > which
> > configures parallel display format by using the
> > "PARALLEL_DISP_FORMAT"
> > field. Add device tree bindings for the display format
> > configuration.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../display/bridge/nxp,imx93-pdfc.yaml        | 78
> > +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > pdfc.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > pdfc.yaml
> > b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > pdfc.yaml
> > new file mode 100644
> > index 000000000000..a84bfb46b01d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > pdfc.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fnxp%2Cimx93-pdfc.yaml%23&data=05%7C01%7Cvictor.liu%40nxp.com%7C7fb1b69849974435787008db01ee832c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638105896131701918%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=kkX5B45NTsmDKKzxjOiE6MaE4zkMVbMe4ILammVSwMc%3D&reserved=0
> > +$schema: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C01%7Cvictor.liu%40nxp.com%7C7fb1b69849974435787008db01ee832c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638105896131701918%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=vIVpdEjIo6H3V8T7iTbDwz4Bmn0d%2BQB4BCJNJ0OzKJw%3D&reserved=0
> > +
> > +title: NXP i.MX93 Parallel Display Format Configuration
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register
> > which
> > +  configures parallel display format by using the
> > "PARALLEL_DISP_FORMAT"
> > +  field.
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx93-pdfc
> 
> 
> Based on description, I have doubts this is a separate bridge device.
> Why this is not part of display driver/bindings?

The relevant display controller in i.MX93 SoC is LCDIF. From hardware
design PoV, the parallel display format configuration logic is not a
part of LCDIF. Instead, it's a part of i.MX93 mediamix blk-ctrl. The
blk-ctrl includes controls for miscellaneous devices with small logics,
like this parallel display format configuration, LVDS Display
Bridge(LDB, see fsl,ldb.yaml) and so on. The below pipeline describes
data flow of a parallel display LCD panel:

DRAM -> LCDIF -> parallel display format configuration -> LCD panel

So, the parallel display format configuration appears to be a separate
bridge.

> 
> We do not create usually devices for single registers, because they
> are
> not a devices. Devices are a bit more complex - have some pin
> inputs/outputs, not a register only. Of course there are exception,
> but
> this one does not look like one.

IMHO, this one is a standalone device although it is controlled by one
single register. It's input pins connect to LCDIF and output pins
connect to i.MX93 SoC's pins/pads.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> 
> Your driver tells different story:
> 
> syscon_node_to_regmap(dev->of_node->parent);
> 
> (which also points to fact this is not a separate device)

This function call gets the parent device's(mediamix blk-ctrl's)
regmap, like fsl-ldb.c does. Same to LDB, the parallel display format
configuration device is a child device of the mediamix blk-ctrl device.

Regards,
Liu Ying

> 
> Best regards,
> Krzysztof
> 

