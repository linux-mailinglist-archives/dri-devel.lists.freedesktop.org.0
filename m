Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22559470310
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 15:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE70510E563;
	Fri, 10 Dec 2021 14:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918CD10E556
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 14:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEwf6nK4dCbjqCZX6r/J/GbMMsPLcdmAoJy0tGZW9J3hiHZ7etuMgXEAWqw8fA0QwM7VH7HBp4XCZTeuWMJkCnsJjDK7mwD4xpGjAsXQ/p74Y5+GkgXlY55gOeiH8CbWU8JK4mgTuuo1O5Sf7bb2ynAI/+wzdBqirD6UV3LgHWdjDlf3KSyk8I9dRticJs108WcVgv2PlVleCe+InMC88Szwbdq3RD1zGWcv8v1RhC+SCJVg5lmh3T1IIQsY1bB6U8vSBmuQuwOs+SCv0ZVK51jFzv6hfe2KSGKJJ69jTNeKnHTO+imynNqDCyzNL6KxyF3ocfDCIo9hbNeDSjss/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgppcsRyDwzhVjvOayfLgCBEEN4h3JLcBMyAkYZsmR8=;
 b=H6FdxB4T2RkFhXvd7/vUr6efyZIquQ1P3WzTkh+XcImEqgfJ+7D1FVeu8ES7a1f+T9f08GXqDdCjn76gUpd4J74n/2zTRj7wsLHQjlTQrwgGYRo1DYSfxHLQvlwBLGmCfBH+vrhE66R3EvWRe5FDW9zYRdJ5BYeDBFeJVxJk0SaBVrUIaMLZJ4VS1VQGomCzUIudDwEkPBUhw/+5v600Zn96eHLFpSQOQVfoQvaqtNV2HN5LDwJeDuGisxzjrzrdLmIrbpZcItxPyDzIe5pwEcLNasLXrc9584eZOZbpSm3Sd8OzRNxTimItOvLUhx/PjfFV9dDfMv/2eQiQgFLiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgppcsRyDwzhVjvOayfLgCBEEN4h3JLcBMyAkYZsmR8=;
 b=NOfbGbJCUmjCasEaJWInplpKRVBi1LJdsIQIvvY9x52P0Erej3DdPtu200ykzJNLPTHYd5qoJiPA6mXsB3utK/fHeESEPbldR3jzh4w/vq8KuaAW0JAKAzzN39kHqahB5uIxsdhdYcXUebLqa7MV51IwqXpMVGdCkVU8IP2rpeo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4804.jpnprd01.prod.outlook.com (2603:1096:604:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 14:44:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Fri, 10 Dec 2021
 14:44:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Topic: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Index: AQHX7CAJAEphcwzTrE2piMcyHlnd6awr0F5g
Date: Fri, 10 Dec 2021 14:44:06 +0000
Message-ID: <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ffe5af0-22fd-4884-1d21-08d9bbeb8497
x-ms-traffictypediagnostic: OSAPR01MB4804:EE_
x-microsoft-antispam-prvs: <OSAPR01MB4804EB33E59F298EA604859586719@OSAPR01MB4804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92Z/hdeeSrLLESCB10TuS8OUEyMwjwHwkDp7G6wkDcv0FL+96jxwb/KLfOHJJKveiJxFfCIhLP0Wxg3fzQhmvhvapKiFF6+WFNO6EvnRIRScPtx6UtP2yQrMd8ujH1vVHnoYrtxqBJzNXozf4UvA4w0XFK+mQ4gpFr0l2AlnVuOWO/FendVd/NTXFWIZewOyFP77HLbiIYM4GXKzLXVDT89Ri3fs34rSB6UdAQ0nQrqDgPZLGWq9P5Ie2XZjPCfqqrsjNaroyw4ASnINKL5hkSe9wj7+o1PQ8hGB0MYKRtrTHrE7WhR6SHUC2S0iQLYKA3j7Fw8Tpr2EbtjQoRi0sbrdueaY7zbRbcRvwQ1Ix4HHEXXwOWnq8VX6UeQjdXO6Y7IOtGOvYIDtpt/kZaTF8GPPCuNQ8gMYi7oPH6ID2xHhaFpVMbJ1jus7+gqjdhVOB9x9EYruKtJzFdfef13bTzI+Hw/tFm0R/btKZaDWoG/KeAHfn2oXh3F4zi6N6X6Dlm9M81g4Qwi3zqYWdwcUeac5cKG3bPj+GMABlwl9QqsUoYpTsy9Hf7pRPegJI5qEjZgtSREtzaqW/15QuP/ea8jTkvR2W67O+I2Y3G+T2nofnTODHzUvYIf7Bsg6yrhUK5jfUIUnxRIUCB5PqilBDH+59jPb3stTyQP9aqXEQwElsApdYue5ixZB47FVXRitzH/0degrx/xWW07gpxGx0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(86362001)(76116006)(8936002)(7696005)(38100700002)(7416002)(38070700005)(66946007)(64756008)(5660300002)(66476007)(66556008)(66446008)(55016003)(9686003)(122000001)(186003)(33656002)(110136005)(52536014)(26005)(8676002)(508600001)(71200400001)(6506007)(2906002)(316002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n//4+xN2dOmV5DrrsQH6b6vfwh4IoYQ/0DwZ43zN+lCaM5/SVKpYA0Rh8tzj?=
 =?us-ascii?Q?P6HjSEUAuNo3TW/TJ1ymsWalh9dnaO4pARqF4L/vDUm1begXA466yfhFXPI9?=
 =?us-ascii?Q?xCin/r8phiTZvfMzcrxLR/ETVyPQStWAjTWZF0ziXmEq2/myg8AdGAf+tFPj?=
 =?us-ascii?Q?iN8c155RW2AwjpXbxGsymTVRXLvJEgGC1lOUPC+JukhC5N/+4/xs7QWRrqm7?=
 =?us-ascii?Q?KaHAzZZcCxrp8OOFIv9GHwhDvcaJsdB9pQAc7L2WQIjmXy+gO3BgoCKzkCYg?=
 =?us-ascii?Q?otEL7k7Kn891xJqv2ECzry1AGdxjnkYkl2djHHsczyfUsgqzzyZXRG7ulvyY?=
 =?us-ascii?Q?c+rmVM/H6kbrEz7QDv3Qselg7L4dBhAemONfNPl7/+BgowgXhh0NAR76KY8z?=
 =?us-ascii?Q?ko1aSIQAWOscaRjqup0dSvi9RRUPYKradr1MqM17t6vzRP0lwC/6ewx/rdhK?=
 =?us-ascii?Q?hEijO3Z+atJ0B1S7CHCYzGEa6BP4WtviRy7AVMX0Guz9JJ6RS0G4fDbLv+DV?=
 =?us-ascii?Q?bRrVjj088gNwVlVTb6vP9kXiD5kGzD4Z3/JlppYChIPg4kAWyGRwrjJTYOZj?=
 =?us-ascii?Q?Wdms5Nm+48UV4ESd66PrPaN/DjxuN9grH7qiBw2mARMm2AOUkE1p6zVBht3K?=
 =?us-ascii?Q?DDaQQ9K07zV03Ko34DKuClgt1R5nazqnHvA+jfZsN1xD1hGe+9Wy93wL2RQf?=
 =?us-ascii?Q?OA/5g637UIFVi8ms9NtzaqTPwbbddXMkaF3xL+ZxiH+OTjYMEcfH8kOL2U7r?=
 =?us-ascii?Q?jO5Th+I7JscYeAvyJYHYOhOMdPeseZ8+hqs4TxGD0SYzmA/p0ZbNYuPHIv1C?=
 =?us-ascii?Q?8j7Ax9lMHmL0hynmqPS6KyugpubSvtjszay+Cg5laFDtJw2iEMkqudE6C2Vx?=
 =?us-ascii?Q?E3W2s2YWeM+nGqd5USEUh+ARPDOs3Tv1MxreFZI0BZm2KEv6u6k0GXpdDx7x?=
 =?us-ascii?Q?ki4lNswFuI/2ulAzTFephp9WNJ5FYuNiymrhiU8UN4Lgm+6lMFW3zU4uiIw4?=
 =?us-ascii?Q?dT6SC6B/FNqosmMWsVEvpE8peTu+W9MtFXUrVZahCLAquwkwiiUxX1yS0Fv8?=
 =?us-ascii?Q?zu9hMXclVontkh5pI0KkTuERN4JsKRdcrDF5cpYXnLnbUiDoYhoAGVUspHWy?=
 =?us-ascii?Q?No/oUdYZscTpopN9wBK7eJBUvmhswgL9SHafYHUIlSuUYlvGKG0chrOfqWht?=
 =?us-ascii?Q?utUT9+CwMxTVFEqV/KIWfsK1q74KqSAu2wm7qSIpHbl3ouemub2KZZT1aEr3?=
 =?us-ascii?Q?2xiZV8MF0yTnyKcvwlk/Um5fhMhkcLI4HsbWLYKlmEMWSEElj2oITY0LnUOJ?=
 =?us-ascii?Q?nDoYCLjUz62hib1DxRa7T93GgOB+BNs3KmVKbRd6ikM4oq1DW7hwRgdm+A1g?=
 =?us-ascii?Q?/NIx1JLlf19TIoO62dyDJdb/3ufZqEcsRCKSB4m+bS+luoz5RAipHYmt4jVL?=
 =?us-ascii?Q?Bh/LcWcFjdqzIe+yXPImJMuebS4nzUU9Kb4UyNU/CEjnLn8M/mq/hVIveszf?=
 =?us-ascii?Q?jjVmIucuJO5TD4/HKlSvKctgYBgtEQP0sguQ71URmWAcbrf9aI2fxaV9hns0?=
 =?us-ascii?Q?wZq1qVDm7y45vcg47joahf4LdAxTX/EoYxAHsTnZjI7MjMr6/oysBvWvmdNu?=
 =?us-ascii?Q?hSqtoYPvlSpOmey/eTU2raH/8F4/DWP+NrpWQUrByDcxcgQ0MsYDwvI+CRaV?=
 =?us-ascii?Q?GvMp7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffe5af0-22fd-4884-1d21-08d9bbeb8497
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 14:44:06.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqpfagtKCdjO0dvnuUPzlin/LCxhImeCDUe9yy9BJJkX/4HimaP+xlqEP3Xz7efXafe9q0Gae6vQkYmzbGHmcq9UIK7kVbXF+wsFfFK9Txg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4804
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping.

Cheers,
Biju

> Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
> support
>=20
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU=
,
> add a compatible string for it.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Moved optional clock-names and reset-names to SoC-specific conditional
> schemas.
>  * minimum number of reset for the generic GPU is set to 1.
>  * Documented number of clocks, resets, interrupts and interrupt-names in
> RZ/G2L
>    SoC-specific conditional schemas.
> v1->v2:
>  * Updated minItems for resets as 2
>  * Documented optional property reset-names
>  * Documented reset-names as required property for RZ/G2L SoC.
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 6f98dd55fb4c..63a08f3f321d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>            - amlogic,meson-g12a-mali
>            - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
> +          - renesas,r9a07g044-mali
>            - rockchip,px30-mali
>            - rockchip,rk3568-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is
> fully discoverable @@ -27,19 +28,26 @@ properties:
>      maxItems: 1
>=20
>    interrupts:
> +    minItems: 3
>      items:
>        - description: Job interrupt
>        - description: MMU interrupt
>        - description: GPU interrupt
> +      - description: Event interrupt
>=20
>    interrupt-names:
> +    minItems: 3
>      items:
>        - const: job
>        - const: mmu
>        - const: gpu
> +      - const: event
>=20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names: true
>=20
>    mali-supply: true
>=20
> @@ -52,7 +60,10 @@ properties:
>      maxItems: 3
>=20
>    resets:
> -    maxItems: 2
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names: true
>=20
>    "#cooling-cells":
>      const: 2
> @@ -94,6 +105,36 @@ allOf:
>      then:
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-mali
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 4
> +        interrupt-names:
> +          minItems: 4
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: gpu
> +            - const: bus
> +            - const: bus_ace
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          items:
> +            - const: rst
> +            - const: axi_rst
> +            - const: ace_rst
> +      required:
> +        - clock-names
> +        - power-domains
> +        - resets
> +        - reset-names
>    - if:
>        properties:
>          compatible:
> --
> 2.17.1

