Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71C682129
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 01:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C9110E307;
	Tue, 31 Jan 2023 00:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721410E307
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3yhp3wrAtgLyyG22056/CAgSJ8UNP7EIk5t2rEIezF0GtH4ReEQV5Owtp3RLhg0h9FlhRC1GFW9qbfxjs0pfcbLMDzXFnp0fZaFEKV4duYO9NGxgsyWcVsdhZoq2Arr6mcnyULfNtkeLlhB6GuUFy4l7oviUvJODzHtUHFPtV+0CVRPAM1kVtGA1ONrhpfOcSjTQy4DtXITFuDS7e7FTgGUedwQI/jlMBWPqoWilCaNFcBurwc55ec/dRcjNsWHKx8zE94AjP4uTMkTekk7gSGivt5MI9ay3KHbi5VLlNPGfXR/+mP4r0Ohp16ZqN+Wm9jh0+Y8jD5Ka98KznFp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXo0FhvgGfrvUGV4+CSo13zq1gRlG4q/+PMR+vMhZp0=;
 b=KJK/YtprCt2L6ZMI0DR4EF7wUj1S4yYEqd3hLn+o50G51CamxywcRfomUU9uaTS561ufnwqc/6xZ4Lw8CSfMg7l9vKDGLbV/rXPPcJWyBe4HpDUQtOLaz2agnQvp0RMPIq9i4Oc3d+5XUqs3jMZgxCEx8O51DlC6zc5YRy6Cjg0EVUNfKEJuC8n0hPhqKkIlXQFMxqr3FK+DBv5Hqh/HMEsR/2J14rNc7t70ksECp8FEk2YeP6GOX9RPiZHKpfsfWrI+pc1ANAwPbT8vAo0kNLqwBzYnISP5ky9nohoc3ux8C29lJDxPG9GdjKEABaR57RH9bEGKJsVPCqwO57qXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXo0FhvgGfrvUGV4+CSo13zq1gRlG4q/+PMR+vMhZp0=;
 b=gt0kVDoSqw7UkSphWFtfPftMa39olMpzAlBKPAoA+z9OxlNIkkdraku/AHsnOH0QigkZ2cZzJSJhRN/mLG5T7fFC9twh1HHHprnIU5NkPaFHddNd2leYUP93wMmu3zp/wrfxiQsCvbsnkIKiuYRwmJ+DlvWTRIcT1l7Fi63iIvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Tue, 31 Jan
 2023 00:58:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 00:58:04 +0000
Message-ID: <4681d86b5061e8176da2637970d681fa365d24f8.camel@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 31 Jan 2023 08:57:31 +0800
In-Reply-To: <20230130213904.GA3569183-robh@kernel.org>
References: <20230128034713.1530218-1-victor.liu@nxp.com>
 <20230128034713.1530218-2-victor.liu@nxp.com>
 <3c07b9bd-1981-2945-9efe-80afb0195de8@linaro.org>
 <87d6f54c4695330064eda295e258a0a5c3bc48f8.camel@nxp.com>
 <20230130213904.GA3569183-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df09f58-5d40-490e-d64b-08db032634e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQjcF23baWbT9h/VqglWY/YxZJ41eY/RPQcny+cAa7rSDm9hQp6PKRKUX4CZiFrWDxQXURI5fOf8UGgK1U21NgDCsL1VCc/XJhq+XJsK+Ba0wzI+eQ1acB+K6aNui97nn+f28/l8RHnVQzW82QsgTkntQIO2MAWm/0AEObUny7QE+e8EE527wAWNhYbQ8hXbKuTiMEkkLFakDtzfm0LbWd/3zVdDnDaaD9ubssN0NyHRSjfkc7jNCe32zleNn70/utvXCMOz2jWSWNtt4TOaSwx4Y8mfCElGlFZ5AXsWha45EMvuexjy4/C+oG8Qasc7DlsnnJXkJEkKjUROVAHs3A7/M1KVrJ03hvT4nbTOk5bU0oENgjjhBc9RL9RqlTYVH6HZqREsF+oaXScB69llTU6XCt5fUmpjw0kFnHO+28x9qT7yCG4quL6bn8IrcH5pV8g7VKw7HgeW5SrGxu4vP8i9hcsa5O9XaMgd0JW43rYyoeDEh6wAlO98D4niJpNWvJOA2P4hmL1tbxYWh+iLS+LyTZFamWYrw9Z2l6362/ZakA9Oyf9hW0224645OwFdpEB23tS6q3Op6G11qZnx7lUb954AGbN/EJ2P5KxObxskPQMlrMrK2crobU2KvajxjhH971BFISNdymiQK1eJECHWq84SKvnAJRr2p+CY5EOLPZ206aGerw++wijWxe9iK0dBj/q6o6g/oHfI2dPqj7CKrHRfWXIObOCGs/M6HoDGcDkbxmFzW4w5P/w2erXCENju02chxazwVQQU6o0gUyZee/Rnza2cbvyVgjPcRWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(966005)(6512007)(6666004)(316002)(53546011)(186003)(26005)(8676002)(6486002)(478600001)(6506007)(66946007)(52116002)(45080400002)(2616005)(4326008)(38100700002)(86362001)(38350700002)(66556008)(5660300002)(2906002)(6916009)(36756003)(8936002)(66476007)(41300700001)(7416002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFg2SUppek56WElDbkIwZGMzNTdvS1pub3pzbWZyWDdUbG5IenFLT3RIVHN2?=
 =?utf-8?B?OWlXajV4YTFzK2xhNGJ1ajZFV29mM1NBQnJja2hDZWhGVnk2c3hlUnpEaUla?=
 =?utf-8?B?anlIbU1uczF3ZjgvQzd0Ym9GVlNPeUNxMlIrcW00ZjFTMFNPOVROM1VIUWJu?=
 =?utf-8?B?VDRvaHh4ZHR4WkdxQ1IwQ0xoeGlkK0pkSDB3ek1TVERxSlhJeGY0aHg1WUxj?=
 =?utf-8?B?T3B0Q0p2VzNNblhISVpQSjZOTmRlWWhzdTMzYkNoRHRTNGNpM1c0dTgxaE9p?=
 =?utf-8?B?dmtZTUF2QWtSZUVjSGk0dmhWc085c3plR1RtbURFOUdxV3g2em9wa1dGK0NC?=
 =?utf-8?B?TUdEbHcwd1RmZTVxb0VFRnQ1U2V6NkJnUTNsRnZjcHJmek1PN0hBQXlvVElZ?=
 =?utf-8?B?SFh6ekQwemNvbnVsL21YMWtsUStjUmU0M1lUV3pjZVVaRzJHUE5mcDgvaFVC?=
 =?utf-8?B?eC9DNW1IdmJUU1lHNUNoQUMvK200U0JzWjRqNCt4WkxoandlYWo3Q2dJb2oz?=
 =?utf-8?B?WjRIei9KeUxCallRWTFmdURDS0FlUDVqSklDRStvb0NiOXZIRjJnN08zcGw1?=
 =?utf-8?B?ekx0bFFvZ3dIYzVOaW9ZY2o4RXEzOThpSEFvZitaYUxuMWJ4ZzJJcG5XWHFr?=
 =?utf-8?B?T0dKLzdZMDFnT1ppdVlPTWdWMmM2K2ZaQmpINkNjZkFkK0pQNmlNSHR0TmR5?=
 =?utf-8?B?amYwZ1ZDdmZrUUFTdjNMMkJkclA4Z3F5Yk1hcFcyZmxSVG5QcmQ5K3BKcklu?=
 =?utf-8?B?eFJDa2NYMEI1Y2dwdlhFNHcydW02VXV2K2UzTENIdzlHZjFoRGNLMFpBOE96?=
 =?utf-8?B?aks3aWQ0cnBqaUVPSlI0ZE9qcFVxTGxwV1VxelhSV1EvMWxNVnFMc2ZNaGlN?=
 =?utf-8?B?ODBYUWd6QnQ0Vmo2Z1AyZjZMM1A0RmtRVFoxMXBzYmhLNE4wdzc2b01RcWxm?=
 =?utf-8?B?eGw2ZFloR1pqUnUvQ3JMd1U4aTVqeFNuQno0N2FOSHVZYUZndU03OXY5NmpC?=
 =?utf-8?B?TGtMbFBvLzI4L2FHdE1NNjYwL3k1L3dlNHc0UXdZVlUwZ2hMZGxUUVhqSTVv?=
 =?utf-8?B?MEFzekhoSFNPM2J5T3hEVFNrS0xlTkthRjFpdzluZnkrUWJtck1FQnQ4cFR0?=
 =?utf-8?B?UzhSTVBVT3Y5RTNGd3M5RFpWS2UvaFRjaW5EcGhHbVJaYWRFMWRvTkt2cERW?=
 =?utf-8?B?MGlRNXdpU3VyOE1HK1ZlLzM1M0FkQlg4MzVRRCt6ZGkwSkMxd240UWdHNzNy?=
 =?utf-8?B?MTZTVWtka2wrbTRxTDJTWWpadVJjclNoL1RDUDVoSmM5M2x4T0FuSEtTRDNL?=
 =?utf-8?B?UXVRbmhkNytzZS9tWFpHYjl6T0ZVSzlZVmQyNCtGbU9xOEdKMm5icGd0VytR?=
 =?utf-8?B?L3BlUk5rak9vU3YrZWNmTnFxSTBVM3VTQXhGWlV5bjNFcitxVEpNWGQvY1Mw?=
 =?utf-8?B?US9VOVY2ajNhaVVOSUFoZ2pMamN5d3kyRHd1U0RwRWxvSjlrTzFYZ1h5NjFz?=
 =?utf-8?B?SEpWZ0krQ1lRaDZqZExsdmRGeFBmQUptUmkvRkJ3WTFiaW9vM3UxaUhKOXdG?=
 =?utf-8?B?ZXhDWWduWElWc1JveE50N2Y1R1hVczdibnYvNmpyVG5XSDZlNkhFcUFldDZO?=
 =?utf-8?B?Q2Y3bnVDTzRKRjJtWmk5akM5ZzdhVnpaYm9DeFAreGt3dldVN0pVWnE2YzQ5?=
 =?utf-8?B?K3ZmSUVmcGdSRUlQV0Q2WVNTYjNpbFdwYUhpM3Zja0hLWEhFeDkyNzZYZ1Rh?=
 =?utf-8?B?Nll1MUJBbW9lazlpb3cwMVBIWG1jbnY2SUJrUWU3MnhWcTZuMTJsWDVDWjVU?=
 =?utf-8?B?S1p2aWV5NUExWmxNZUZHVzNiaU5BSVpGcFhVQi82bU10ZXcrRllWWERCNURJ?=
 =?utf-8?B?bnlFT3U2YzZ2VXBzNDVBZmxaSUgwdno5TGJWcTBUYUxZczI2NUIrOUpNQ0ht?=
 =?utf-8?B?N05wclRqamJQcTFiajJpNkJOcGJ0TzU3TkZZTkJQUExGQlp0MldEYlNyNlVJ?=
 =?utf-8?B?bjFRS25QMm9wS2d2TzgxaTJjcnhuZ0NIT0xGMUlhaHRRODhVVkdNVU1OdVBu?=
 =?utf-8?B?WjFBSWV3NTQ5anZvVnNkQk9zME5NeXErcnBPbmJRcU9uMDlXcjNPNUYvVTFT?=
 =?utf-8?Q?eYJFN1QPikpjWyFrq2znoaaGE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df09f58-5d40-490e-d64b-08db032634e7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 00:58:04.1506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82SETDtQcReY5/Pi2dfTZWTf62z/GukbQPjaaVs7GIYgCQ4Q45NFssq53OURQiMWEBIKS6RdPN8LAcUoSXlsDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robert.foss@linaro.org,
 andrzej.hajda@intel.com, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-01-30 at 15:39 -0600, Rob Herring wrote:
> On Mon, Jan 30, 2023 at 04:39:05PM +0800, Liu Ying wrote:
> > On Sun, 2023-01-29 at 12:46 +0100, Krzysztof Kozlowski wrote:
> > > On 28/01/2023 04:47, Liu Ying wrote:
> > > > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register
> > > > which
> > > > configures parallel display format by using the
> > > > "PARALLEL_DISP_FORMAT"
> > > > field. Add device tree bindings for the display format
> > > > configuration.
> > > > 
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > >  .../display/bridge/nxp,imx93-pdfc.yaml        | 78
> > > > +++++++++++++++++++
> > > >  1 file changed, 78 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > > > pdfc.yaml
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > > > pdfc.yaml
> > > > b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > > > pdfc.yaml
> > > > new file mode 100644
> > > > index 000000000000..a84bfb46b01d
> > > > --- /dev/null
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-
> > > > pdfc.yaml
> > > > @@ -0,0 +1,78 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: 
> > > > 
https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fnxp%2Cimx93-pdfc.yaml%23&data=05%7C01%7Cvictor.liu%40nxp.com%7C3e8db7ce3170451bc0e208db030a6ad0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638107115502467822%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=c%2BQ%2Bhpov6L9b905ozKPrkWiTzaRD3ZFsEh0urw5evsQ%3D&reserved=0
> > > > +$schema: 
> > > > 
https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C01%7Cvictor.liu%40nxp.com%7C3e8db7ce3170451bc0e208db030a6ad0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638107115502467822%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=SkPZLJIR9uoqk4mRqSsfu963S%2Baa7xXmyCqzR36LJ30%3D&reserved=0
> > > > +
> > > > +title: NXP i.MX93 Parallel Display Format Configuration
> > > > +
> > > > +maintainers:
> > > > +  - Liu Ying <victor.liu@nxp.com>
> > > > +
> > > > +description: |
> > > > +  The i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX
> > > > register
> > > > which
> > > > +  configures parallel display format by using the
> > > > "PARALLEL_DISP_FORMAT"
> > > > +  field.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nxp,imx93-pdfc
> > > 
> > > 
> > > Based on description, I have doubts this is a separate bridge
> > > device.
> > > Why this is not part of display driver/bindings?
> > 
> > The relevant display controller in i.MX93 SoC is LCDIF. From
> > hardware
> > design PoV, the parallel display format configuration logic is not
> > a
> > part of LCDIF. Instead, it's a part of i.MX93 mediamix blk-ctrl.
> > The
> > blk-ctrl includes controls for miscellaneous devices with small
> > logics,
> > like this parallel display format configuration, LVDS Display
> > Bridge(LDB, see fsl,ldb.yaml) and so on. The below pipeline
> > describes
> > data flow of a parallel display LCD panel:
> > 
> > DRAM -> LCDIF -> parallel display format configuration -> LCD panel
> > 
> > So, the parallel display format configuration appears to be a
> > separate
> > bridge.
> > 
> > > 
> > > We do not create usually devices for single registers, because
> > > they
> > > are
> > > not a devices. Devices are a bit more complex - have some pin
> > > inputs/outputs, not a register only. Of course there are
> > > exception,
> > > but
> > > this one does not look like one.
> > 
> > IMHO, this one is a standalone device although it is controlled by
> > one
> > single register. It's input pins connect to LCDIF and output pins
> > connect to i.MX93 SoC's pins/pads.
> 
> Fair enough. It needs to be defined as part of the mediamix blkctrl 
> schema though.

Do you mean that we can keep this schema and need to allow child
devices in fsl,imx93-media-blk-ctrl.yaml?

Cc'ing Peng.

Peng, it appears that you are listed in the maintainers of fsl,imx93-
media-blk-ctrl.yaml. I think it needs to be extended to allow child
devices. Do you consider to do that?

Regards,
Liu Ying

> 
> Rob

