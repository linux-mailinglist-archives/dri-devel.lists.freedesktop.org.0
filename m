Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C263D697790
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 08:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7EB10EA3F;
	Wed, 15 Feb 2023 07:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347A10EA3F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 07:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKXLP/SExeGhe7NXSJg2XrLBv3SgjwdEC56ODV67tsOHr06agdeItMZYswKTOz3XOgFlcXXBRZFBpbNj/da9UVhqyTgScGEC/p3yFvWEcdWMukdwYqkEC7zoN81NvjhNI3dKcI76m7LEQLtGhZq+w5+BB7S0+sYTrkThQ08XEr4NqLI62RGVEP45GFjvhRczvwhiNK9naxZCDo38N/X9Wc6VnwAGRiyjGVEfNGWbfPwdNE9sBzJh6G0S7BbF6HHkK/ZssyAC7Vn7ZOcwzVd9c4+V1KEra35wRjsyvIqbvKAsU3v9O7jVw6oIcjpJBHDaLpMT761zKhApo59zDFoWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MFJ8W0jH5fCt8F4Yd+YqHbvNHRcTQGH79WtqfPf8Io=;
 b=SsuHnggoS/tY3MEsIyx+28NdjRbH6QEM7nJtBDXl3JQX3jDRYWDZ1bsOGMbxEYIgEPPE5LYj84cDJ6gYLqmHjcO+6iBxYSPAVtsKi0pFNlNtmHu0WNr5Z4RSzX+Dux61WMLbeVBmtW9oGj9AWkK487EJAv/yexeYLf1jyCIJfsA6rKm6YtLrnI/wivBHffd3kcwN+uVn5N75vMtkHBJxcq+vUzubmz/Rkw+xOFAZ1J5/pEGj5I1knFyjy4J9G2pv2Y+K5A3dX8R1bOmOyBpAe97YWNgDmS85Xgpm3BqU0SxnJHNZLqSr8u/zSk/7bvNsJtRr3L1TJ3ePuCB/EddFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MFJ8W0jH5fCt8F4Yd+YqHbvNHRcTQGH79WtqfPf8Io=;
 b=ljRJ1TpfZpyRNLLVLFLef+2EHB4HjID7UgFuV7lfFa7rcQOVwloGHao6pzQsbRni6Q4A3iAdbIuigWNAeR5YWIR8M6gqhuoEk7Du08WKm8HQTAn8dIQ+47VldcbEw+D16OoqQruPcygP22jNX9QAzgMIMM7OVwzR2ntdDijgMa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8177.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 07:50:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 07:50:22 +0000
Message-ID: <41bc30ac7af4b0ce3ff608b604fb6ea762428680.camel@nxp.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Feb 2023 15:49:56 +0800
In-Reply-To: <2551514.Lt9SDvczpP@steina-w>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-2-victor.liu@nxp.com> <2551514.Lt9SDvczpP@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3fa30d-3f45-4480-b6cf-08db0f294a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QO7KpAA5Rh1G0iPyEZ5ay7FsTcUuuIFxSvVu9vxRB/D02gvdW7YksRYBT47aQIon2ZHVDR2XybBwBva5GRROvd6SO40n6p47fd+yuh/zqKFbZVXOkTNlk6v8l80cVu2aAIT8uIwyJ2HdhaCujWrXVIC6aYLuK3yeLpaE3pNGyNVCP76j0dmnSB3ooHe88PhNjR6fMZHlEVVhwsnCbAWM1HTbXicGDkVUKLfTQn3504wJ3/VGFlmmuYR+meZJVkDwQ+VnFOhCcWDPYC/Ar+gVyFXlmfAQ+NlvE750kz/FeIXShz1S8g1Nvk7PyaSuzIAWcO4WYrNSUIJVWmtVXkXq+sDDOcKWBVkXZnzQ+f7WNSiPWSJrqOXojKd72Ptrr2Q1fGxhjEoQyC0iQ64w6NDybITMXb4SMSGdAicdoFHjWEtyp0vqU/kCsjlKAFUOLS9BXMbWGpkXLwmr9SCMc9k9TK6GSGR8LlqDer3LnAmlbjiazfTYQYlqclsPwN6ajqS/repfOxxMHhDy50RHcD1PpnCpk9mg6GCNLlJc8megb82bAiSPxtlsjl7pXVtSxBv9ASJH5k7UH5MLeq1O8wcHsq5/OmnjZiGKixPT8FLtmaM+yqutnWUBwAadt8MPqTolAS8HtBQQ/ukQuWQ9OK1GRNAYGGpMdL8Qq0uQXmghHaY2pDzK+jSsxOWxOc5nnLxyiuYRm+mvdcTfMqDwgfApgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(2616005)(86362001)(6486002)(83380400001)(966005)(478600001)(186003)(52116002)(26005)(6512007)(6666004)(6506007)(36756003)(38100700002)(38350700002)(8936002)(41300700001)(5660300002)(7416002)(316002)(4326008)(66946007)(66476007)(66556008)(8676002)(2906002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJMeEZnc2tWUjdKdUlYQ1NwQ25TaHplOEV6ak41SWQzS0ROVnRhV2RkY1cr?=
 =?utf-8?B?QzBaS2x6RzdNNlV3U1A4dUEySUtFTkR2RE1EcUZSWklNekRvRjc4dVJvVjJX?=
 =?utf-8?B?d3hPMG90NXlVNmg5a1BIbEljRFZBa1htaE5EbzBJdGx6ay8vZHhaV2NXWGV3?=
 =?utf-8?B?N3lOSFN1U2pnV1U2b3hNU0pDMzBpa3pMWm1FbE1CdTYzMGpKcG9meXYxTk9a?=
 =?utf-8?B?aDNPaWJpbkw1QnZzT05tUjJvenNVaW1WNGtnblBaMDNhNzZOUVNTaU5Dcm1n?=
 =?utf-8?B?a2pOTm8rYXYveUFtdEpSQXdvWVRaOEVuNFFKYWxyeFNKelRpaWxXcXV3bGpM?=
 =?utf-8?B?VW41V3p4TzFSUGdYdlVkSGV2R09tc1BITGZFMEFLeE04Y3ZNMlpXN216TlN1?=
 =?utf-8?B?SWVOVm5WRkR0eDdralVBUmsvUlpOVkhGWEFSeTdlUExua0JGUnR1cCtmZG5S?=
 =?utf-8?B?c21lMTNOTEp0Z0UrTmVKOGxRWXJKT1VKZnVDaFFKYlFiU0xTOElYOFU3bVdY?=
 =?utf-8?B?UDJ5bENXZWd0d21nTDUyR0RkQkZ3NXo0aElUeGc1ZTRJRjdkS293b01HWGZX?=
 =?utf-8?B?QVNCSmJjTXlPanB1eUNYNlFiYy91SlRxWHhtTjVmSWtST3poT2tjczFWYkta?=
 =?utf-8?B?WVRKcmJOLzBabHgyZDZ0WlB2QWNUTW9MREg5bFN4akhBdzZQbjhmdmZZdnhs?=
 =?utf-8?B?bVRJUnhLaGhxZFpnQklYalZvWWNmZHo3L291T0pWYnJENEtwYWZGQ3I3OXhj?=
 =?utf-8?B?UFczVldyZ0tWRU1HKzFqV25iSEV5NXQwdVV4SW5XSmw5QVdjQnYxRndRZzVl?=
 =?utf-8?B?S3kweUhqUzhsM041citpSFJZeDUrTlh1dEsyQm82Z0h6NStLSlZwbXp5TUtx?=
 =?utf-8?B?d3FaR3FLQ0Jhc0FGNkNaRHJKUWZyMTlDRlNmL2k0Q2piVlNZSi9BRDVvNnhZ?=
 =?utf-8?B?dHJaMk1yK3Q1cHJtMXk0SEZaK0o2aHRDUk9LNlozNDhYYlU5bm5QcEVCc21F?=
 =?utf-8?B?Tm5GdTJhcmJyaVp6NE5SbjBtOVdsOS84eTRwSnJFS1FmVjdvVndTM1VHcGFB?=
 =?utf-8?B?Rks4L0FhRENQaXZRT1Y1T1Q1eTV5VEI2Y0pEYUdWQmRqZHprSE14VzlzQkt0?=
 =?utf-8?B?UFp4WnNrVVZMNmZWQjJoZjg3MDZ1UGtVQkpYVExSbnFvM2hTak1lSVV6Q3Na?=
 =?utf-8?B?TFdaOE41Mm00aHBjRjZIRWxKeUIrVmRRSTBkS28ySnl0WElWZ2hPN0ZNcFJD?=
 =?utf-8?B?bW01SHdTclBYcVExRS9sWldjUTFlTU04aERlVFVIdGV0cDJsQjRNSlEzN2hw?=
 =?utf-8?B?SUFRQlMwbTBIcXAyTm8wYnM3MUMzb2VDZU9RQndRaDRCWGV6aWlSWVlRY1lO?=
 =?utf-8?B?NVNUa1I2TFc1U29NcHF0Ly85WjU0QzNvaEZnVGtuSkczdExHY0ZreTFmSGRo?=
 =?utf-8?B?UGY3dVlTa2pUODlQZDFLUHNUMlhDM3dFSXVJalRCbEEvRFRwd016cU5qb3dU?=
 =?utf-8?B?RTQyQkJPVVVxZ2puR2JCdkV0dVExSmQwbnpTSTdHWWY5amQzcjZpdzZEUzR3?=
 =?utf-8?B?elRjT21LSEhudVhqY2N0eXlKOTdwZm1nUm9Fc2pjckh4UE84WlJhY1RyUXNK?=
 =?utf-8?B?OERnL2N3REpXRXlDbk9CL1V2dDRqNy81ancvMFZhNm40UGlYc2pGMWg5d2VR?=
 =?utf-8?B?WkFoeW9hZi9JRlQ2QmRrVlRoY25MdzIxSElqV0k2aHdNdzhuWGRnbEJ2MTlL?=
 =?utf-8?B?bHBzMG5VTWpVWGE2cmJSdGNhd1RrMnlSYmJVVlFSNUg4RjJQcW5YaEpjT2Fu?=
 =?utf-8?B?OEhkSElPVm5ZRWFRRUhtWElHQnhOUnZ4TXRFeldDTmtTcFo4dU56WkFQM0tK?=
 =?utf-8?B?VU1DeXIwalptZk8reGIybE03bUkxU2gwRFRkRmJicWdwR21qeDZNbC81Nm9E?=
 =?utf-8?B?U25rVGdBQkRGWkY5M1dwNmZnTUlwdkk4amZKM3AwVXk0UHZKeEFweEFjcXRQ?=
 =?utf-8?B?cU0yOVJWU2J1cklsWWZnakhHY3VmQXk3aDF0M3g4NDlyNlhLVy9pRHBoUjBh?=
 =?utf-8?B?QWNlYUlRZUVPeTh2V29mSU1RT2gwb1A2a3psZHRVaVBMaS9BN1JvRFF0dlQ3?=
 =?utf-8?Q?+dpvTCLjTb80m+VvwIRrt8BCT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3fa30d-3f45-4480-b6cf-08db0f294a72
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 07:50:22.7663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrkvfM008B1aGUcZsqCpZALpztu7ZGqmycH6qJydIEUxaBI/Eo+Pbg/XI5IzBtURI+1AQok8kwW8Rktchm2TnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8177
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-02-15 at 08:26 +0100, Alexander Stein wrote:
> Hi Liu,

Hi Alexander,

> 
> thanks for the update.

Thanks for the review.

> 
> Am Montag, 13. Februar 2023, 09:56:07 CET schrieb Liu Ying:
> > There is one LCDIF embedded in i.MX93 SoC to connect with
> > MIPI DSI controller through LCDIF cross line pattern(controlled
> > by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> > directly or connect with a parallel display through parallel
> > display format(also controlled by mediamix blk-ctrl).  i.MX93
> > LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> > tree binding for i.MX93 LCDIF.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
> > 
> >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7
> > ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> > 75b4efd70ba8..fc11ab5fc465 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -21,6 +21,7 @@ properties:
> >            - fsl,imx28-lcdif
> >            - fsl,imx6sx-lcdif
> >            - fsl,imx8mp-lcdif
> > +          - fsl,imx93-lcdif
> >        - items:
> >            - enum:
> >                - fsl,imx6sl-lcdif
> > @@ -88,7 +89,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: fsl,imx8mp-lcdif
> > +            enum:
> > +              - fsl,imx8mp-lcdif
> > +              - fsl,imx93-lcdif
> >      then:
> >        properties:
> >          clocks:
> > @@ -107,6 +110,7 @@ allOf:
> >                enum:
> >                  - fsl,imx6sx-lcdif
> >                  - fsl,imx8mp-lcdif
> > +                - fsl,imx93-lcdif
> >      then:
> >        properties:
> >          clocks:
> > @@ -123,6 +127,7 @@ allOf:
> >                - fsl,imx8mm-lcdif
> >                - fsl,imx8mn-lcdif
> >                - fsl,imx8mp-lcdif
> > +              - fsl,imx93-lcdif
> >      then:
> >        required:
> >          - power-domains
> 
> I would have expected that fsl,imx93-lcdif supports up to 3 endpoints
> (MIPI 
> DSI, LVDS, and parallel) in a 'ports' subnode. But this binding only
> supports 
> a single 'port' sub-node. Also an example for this case might be very
> helpful.

The port node allows multiple endpoints(See graph.yaml[1]).  It's
enough to use the existing port node instead of using ports node.

For i.MX93 LCDIF, the port node will be something like this:
--------------------8<--------------------------
port {
        #address-cells = <1>;
        #size-cells = <0>;

        lcdif_to_pdfc: endpoint@0 {
                reg = <0>;
        };

        lcdif_to_ldb: endpoint@1 {
                reg = <1>;
        };

        lcdif_to_cross_line_pattern: endpoint@2 {
                reg = <2>;
        };
};
--------------------8<--------------------------

Looks like it's not necessary to add a specifc example for i.MX93
LCDIF.

[1] 
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml#L48

Regards,
Liu Ying

