Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2C7CFD27
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85F910E4FC;
	Thu, 19 Oct 2023 14:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2082e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6F210E4FC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzo9qPamj+VI/SC/jKERhVaPhS0oqN9iRgpWtxksAwh1NtGLX9Y4BttYLPNPLfLu17HyUqZ+4zJ83NS5LtUB7TJWxJsguyYPbjCu1LJh0u7vHlOrhc4yWzXaUlXurC2IXcFffXGvshk+xHl5UW2WqMryPkdkT76x32kzU/KzIk2Lu5LNJHN/LLTsuS8fkTlpCcGduN3szUL+Tsps2Aoanm0zaYaWSKs5RAbIBywNkGSIf9htQ96tEX1DJMiB8KNL00CENIMi2g9GwALg1pFt+Z4w0ELBTcG/ovLnTKv4yxV13wOaj2VXoMiffZOfReILSKoqtL3ArTdnl1CCOBkhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y+EIp0nXZk1mFv0SDz3jwWYWJlSi4ihm0X9ovHYPfE=;
 b=mFE4JUDmL49h3ZytD5Tu7dBGJwWTp/LapIvC2Hy84PARVvChwOm06dlRJ+l0jUIdrjLrQw2UD+77Z/NgP1iMPz47qCe3Gt5gwQd1pmbe+fI4HEiB5//R0Fv/Ft3QOnSHhRp4+aNi9MFqiKisB2pIzTPH3xSXBtHupJu7GcIdjrqBukyZ+cbm4wzGme6X3EERZrhRPY8M9oxqTC4GsiAmthFptYJxvvpPZ9jzhpetf9e9yHG3tJ1e3mKsKvhxCp21wYagqJyaWdyBC6yMtuQpC4Yfd8rHZeH/v5uj/DPQN86uev0DEu902Rpc86Ykp0+SlBnxugLQvjl8QTRBts3bTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y+EIp0nXZk1mFv0SDz3jwWYWJlSi4ihm0X9ovHYPfE=;
 b=qKMpT8cs+NKJ/bEmDcJ7GH6E05/I6J23tiI/GdFGXTOU6ePuTU1+O2KtJzpucZnHwa6gBjtZ9/ZJft/gMoHIQhwQ8XqaIlIA/7JkTTECZa8OL2hRf13D2iHYlY4HvBMTccjo1edFAGZvKilJ2e6N8rARO/zMMNryJyTAReemA1GMT5pZXLk1hSwR+woRWe1ioACYO0F5k7UEU+6b8xxnbCF0TnGbvd/iapcCPpV1RelFhkKVvA9wnjgXpX1QAs45fg+gx1uH0NCwYmr65/8BOIcamJw+YaIuBJakyBHXdqMI6nVAycyK2tauUGOCMGq/Nwtk4VWatFhNiaMD6s4a2A==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CO6PR06MB7475.namprd06.prod.outlook.com (2603:10b6:303:b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 14:43:59 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Thu, 19 Oct 2023
 14:43:59 +0000
Date: Thu, 19 Oct 2023 09:43:56 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Message-ID: <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-5-macroalpha82@gmail.com>
 <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
X-TMN: [OoKevhk96AX8dEsf6OpRCmsBS4n5LRBC]
X-ClientProxiedBy: SA1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::20) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTFArLbO58mDLC6l@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CO6PR06MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eed62be-d70e-46e0-af22-08dbd0b1d401
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl6wbuAwDyplp0PSnmhuLlRZUUCK3ntapSo/LzPOBiMdUNy5aPJkWVXfwwjPWEF3vxOyHh1xV81BFZvJRAoncJ0xvcvsVJtoVW26WGnrD5b5hOHywsq71+ZvtgIDH+Z4dvTiIhqncrUCDz2HGXEOGKgbJ84t6i+/X4KeLgFAPOB59E8qbjeF0KyIUW4EJMQuti2f/3FoyWzc5Xvo96Zo0MWdq09y9/u3cI2ujShYG0uEE0Xrvh9cf+7JNGhgKm5K9tWE/l1mlFIRqGPjCjSMmGIxpqYTEDyeMZt8YAi0frEMQYly95rpsSoHME/m7WxfKJSa3je2ifM1J6j2Ps6l3q1r+I9haXPwlTIkDpa1vX+hgjP8QbOuIhL2J+xxjZnVtMrJ1xnrODxoORyWgLpXcOH7avbpFdB6eao0rjgon2LiXNKVueA5Oz9hZQ2mOXFWt6X2VQtK+MzSs7+/5AUwGc3ojyGI94jt2J3aVe+48t3yvKNFLPvtZOu5fY3uNLtfJTHW3RSEvK0ZrmLRbWejFjmQKj9hpt+dX1GmzXe/5OnPQ21a52NijyIrFpjb1tKR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wMsOr+fcYGOMaPXt6At+iKDJy57jktg78fKFCOCFwgNDLer8+arMQ1qttAvp?=
 =?us-ascii?Q?WBBuAH4DnRSn1LWMzYb0W/jYckrwVGAy1qmmWjE89xL0atcKE/CyGrRaFdTj?=
 =?us-ascii?Q?zUXqDr+wopty9DfXhNDYJzF6ONNCvtscTuXlbVP/coan+ilNUXbkfFRcwltE?=
 =?us-ascii?Q?iGs+0X1ybBkLq6nDfIjGX97jQi1eYhyxwCxyGymQBwJtJFGsNLLaelvUbAqN?=
 =?us-ascii?Q?3K8NedisvlMs4UXY4VcoFejE/CP8oxER6Ska3MiyOWIWIi1lMziOe9jPqPEM?=
 =?us-ascii?Q?ouGib9B675d52esjRTE7Z2APj/+Hh+q8u8HZE3yeyf2MDzPa6b+2XF62f0Nv?=
 =?us-ascii?Q?+zW8JAy202uDmPP3rnFFUiw9IqCuQJpLRunT4weCFZNGuanmSXnTNfVRrSrc?=
 =?us-ascii?Q?oE1/TratyySTW2JpaMdsOr3mfJPZznrX6KhoipG+bJe4C8W1PJS3cFSm6x2r?=
 =?us-ascii?Q?DNpqLPgFqODCtYUXxRbEnPr5BcY7Knessz05MRJeyxgavWrFFsHS1AUGXmrI?=
 =?us-ascii?Q?YsnEa0LZZd4/3928IY0BA6aasPsVm5Eq3KiSqKmHZ7Zgou1dVUoTMOUaeHJC?=
 =?us-ascii?Q?693Q+v7Ojp6bnCLWgFx0fPcwvyO4Ytqji20c6rgVEjojz3hKEDgSsBanGZYD?=
 =?us-ascii?Q?PPsz24sfyI/5vZJ029W7cipg26ro4mTLy/mrthLtfe4Zy0kJ5nlHlXAmWdn1?=
 =?us-ascii?Q?zo0w2pEVwxkUJ0r0EstpsKbp+aflIljMTCTQ/N3sKUoy7qwdk7MsHtKXBGZm?=
 =?us-ascii?Q?JOuup8Rz5jnFlBpcGB9LLxqsm1Xj/RLGHmZ+9jQJmDZxqttiBqu14WlOPmpW?=
 =?us-ascii?Q?7ZUePj2YeK9K3arRzO395SPFu2ZdfU2Bjq5W6FseW17NFKmBTE8HbTtbWFlG?=
 =?us-ascii?Q?udRi23hjT4XoNmr0toB0ZaRlhc/ik8nDdysrPOh+K3Scw9BqzSB6i4E7vA97?=
 =?us-ascii?Q?5Uye+7iYWUSWS44H+E1C3+xc83a5nM8pPnFjGKHUyYxh0n81BjzkSbM0DoYn?=
 =?us-ascii?Q?KOinFJ3XtDmsftP9SvVPRUPAEI5zRnFPHH7SIIG097/lZwSo8/3HPtnNg+mW?=
 =?us-ascii?Q?itPWqo1d+wXtCnaMSAy8SHr5d521+hcX/YCDDBzGD+NSeqf1BfVYQ4m8j8cl?=
 =?us-ascii?Q?IvovawCO+2/ds3HJoj8UuIys4qfdgjGjndXvRU6lTNRXvU7QD1EO55kbPilb?=
 =?us-ascii?Q?+nCq0gDwef+IUedkiEZ6327RFy8/X5YTnEKP5OpnKnzDbRKaGvqqgG5r+ZI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eed62be-d70e-46e0-af22-08dbd0b1d401
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:43:59.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR06MB7475
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2023 18:18, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > powered by the Rockchip RK3566 SoC.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > index a349bf4da6bc..a6612185a7ff 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -674,6 +674,11 @@ properties:
> >            - const: powkiddy,rgb30
> >            - const: rockchip,rk3566
> >  
> > +      - description: Powkiddy RK2023
> > +        items:
> > +          - const: powkiddy,rk2023
> 
> This cuold be just enum in previous entry :/ but I remember we talked
> about this once with Heiko.

For hardware that requires a different device tree, is that possible?
While most of the devices I've worked on for the RK3566 series are very
similar for the moment only 1 is identical (the RG353P and the RG353M)
and can use the same device tree.

Also I have one more Powkiddy device to send probably in the next week
or two, then I'll be breaking for a while from new devices. :-)

Thank you,
Chris

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> > +          - const: rockchip,rk3566
> 
> 
> 
> Best regards,
> Krzysztof
> 
