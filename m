Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28786DC939
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC310E0EA;
	Mon, 10 Apr 2023 16:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DF010E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy6mFRtFkb4EaCrSslgq6Igpuh6LP1XpO4sPP1z3w3uV36fmnoNFFpdg13LsUuM6p239VBINIef/c81by8RqZgGAepiQC56MUR9o2URB14EMdRuh8dIVxCcEVC0Ii5Taj+MNjMuL9dSLCYRoHCMGH+X438e0T0hFS8VDSbHRrUer0CODqk3LZQa5hIJXpMWqzOzHrm43SNIj/K4o8YXBemCcN2UwnlRdEk7BnU4iC3KlgH9PjqCs82HRy4vXcXFqHcQQ7Yt6Sw69EKEyYxD90Uq80gyT71uqxzZzHqxFwzuFWpEk0DqyDTpsVEU6IQCZ7fU8WHiGBnE87ott0ov/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ27K0RxqNTCZAMmNxfI3AINJ66YAVSdZfiXZD0bzh4=;
 b=VomF1gUiQmBvGMgpFB2WN4E7vkrZladGM2ac8QPgQS0BfI3Rg//lXQXSY15w8oTpk/P8XBiU5fttvT98XIX0gMUS6GxfLwhUAUuzgFQ++j1TUn2Z6yZ9UvhNU8W3P2CD0DdIvgFJZlkYzXZ5lKrf9yWdJZSbwsr6Y9d1mL8mT2LlIC9jvXeUdReO5RyQlZIykbX7rlEuroWP2hGMfKckf0vn7grSoXXERb4eOq9EMFjVRgNqkeU1WF7b9PAxREo8d4g1lJr1TtvjmmUAQAotRB20K9EQd679lJTBWoYP0npRjYuiicdhitjvI52QEuUrbQeG8B66hKsWbWxQArtfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ27K0RxqNTCZAMmNxfI3AINJ66YAVSdZfiXZD0bzh4=;
 b=HJZrKRpqbpQoPRhTsW/vfGwN8zD44G7C2eHb09K17d/VsCmhDnfx9kUsGVuj/gpQmh9BjB4s2UfcY0EQgcr7hJRk98706l2ZaYrmdUuaRg7+28aHy9GlLFJXpg+Ucwu2q48r0YUc94bjjxTqVYlfSbPloyyx2SSSdK5Wsp0Fd8Y=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6251.jpnprd01.prod.outlook.com (2603:1096:402:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 16:24:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 16:24:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Thread-Topic: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Thread-Index: AQHYM8fvckkeEfT5Y0ipcPVDIHWbCa8nKXxQ
Date: Mon, 10 Apr 2023 16:24:51 +0000
Message-ID: <OS0PR01MB5922F8930C3ABC13A2A746AB86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB6251:EE_
x-ms-office365-filtering-correlation-id: 559ac06f-e236-4e2b-8823-08db39e01c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kuc62OyiveJDRktBqa2QILqtuh860ow8AVS84iI0gCRF1gS7xPKTy7YvEO4LjN7L6vzCoeHkiP3KQHMkJ15VdgNizIGt021JUnnVzns1DW8RJnkXb+7dRulSyP/Eg85eBlX46ACj290mfy7eTVJcbf3um17pjch0VQ/uALWBrIAfoozXRsT4lOaRvVn0T/O25g9WStFmgOpckhCs6JrOIbOwhLraUiJwjys2l7fN1K6wPnc5H8XXgd2+zMLd0uoNAO3N/zlAYt0WoIGYYSEpC/WtMjL2FofIOKOzQE7qAksDKsRBs4iHFf+0vEBFKA4AeS7/pfKJe+D1exlvJkCSDT06cSRZMz1Df7gsd+WVBS3GN84CDjjLNws2whovoBh17Vf6tR8F66RHO63AN8SDZrPOIn2j09AQspC0X7tOebqpg8gT1G2/B3jFYUUs5vTtBbg9dJSIIyHH1iF6+nmjRj2k0F07p5xlnjKariQe07NsDyPrAhH0ImB1gwUHYqEfqkJL3ji/fo07UzrAJJhnPRZTC+LENm9BRTJS9djgO51CZ9tUGPmBsVyPi+OY6eZcugTsWZwjBaVNn6RlILkK0YnDTjHdvX58X9xJwAjaD+UMWSxk6L7eWb/OhIpax0pHCBA8WcWgFw4gSfOrQTDXvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(7696005)(71200400001)(478600001)(86362001)(55016003)(33656002)(83380400001)(122000001)(38100700002)(38070700005)(966005)(2906002)(54906003)(110136005)(316002)(9686003)(186003)(53546011)(6506007)(26005)(66476007)(41300700001)(66446008)(8936002)(8676002)(66556008)(52536014)(64756008)(5660300002)(76116006)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YMYga8s93JKXsBdKfQ3TeyhASRxlv5142ZCheUEv8neHvwu2glTPUT7BCz?=
 =?iso-8859-1?Q?9R+94nNT4cWBnuqYdifB98peko/BlFkZP3SarMnIw8jaeQ12XEuNNun54q?=
 =?iso-8859-1?Q?vm0vyLX4CCb4dhl8VcZ846k+8PvEVAkbXbFqhMRro4YthR8l1f7EuONqtm?=
 =?iso-8859-1?Q?tmq0R34LP4ya/bN6PIRrQQ6AW38GGItKNu7o+wsPVIk2i+tukQWkyakzzI?=
 =?iso-8859-1?Q?2FL1MW202DZM033od9NvLVwRQIVP9BluZ2mJP2X2gNrOn0gnK/K4v16ayq?=
 =?iso-8859-1?Q?dMa1/4dwvoSWvO70Kx3X4207Jp7tsx7oHv4SEjjuaGQ+mKdH0uoY/l+Dfc?=
 =?iso-8859-1?Q?57lkatInItCqVQSHp+ikIcQwz4n1xRHFkrqcDgpiYDpNG0Wbc+2BDFT0Nr?=
 =?iso-8859-1?Q?zFioSnEan42ZA2ji5g2AeWt/lZu6em5ek+bKgj5/6aycHKLxy4RwuU+iZU?=
 =?iso-8859-1?Q?T1N+NxiZj9rEhENMkk0lIshsfuXOv+AtP9yuTVx8W3QBtcdGtUomJdrekz?=
 =?iso-8859-1?Q?qTSpP/+TrTNVCAoSlhDeYU3jVjWc5tx+CkHbRCLWT40fOaF49gHis/7XBh?=
 =?iso-8859-1?Q?cJ+KhjOtoUezTAhm70aD6zN7xjuhvZHqQ/k43uRF1TSj1NzolqubYgKdXt?=
 =?iso-8859-1?Q?VpYUaPvs3M1oVi9V0rKuFu61o8jollKQavpwuiGJCjfG+QFTbrRuyz3NWp?=
 =?iso-8859-1?Q?E9Ih3Th3DHDZME/6RVK6OCb9UlLR1BPRCeidnpqFSnPkH6blHDJHZJOuN/?=
 =?iso-8859-1?Q?WECyxbNHpnR5XKSsOrhqL6le+Ak0Elj9BSJrUmyW7lnSN3r65jG+WumKoR?=
 =?iso-8859-1?Q?T5AtlsudrlmH0T25/RlBPYC2vNnuEugrrfYIDA7VEZcNvxolipKVznGyD1?=
 =?iso-8859-1?Q?W7y/vxYCWAIR3Esr5Hcwo7BcJAhgl6q5T3Q0eHfWrC2QmEzOiVzn9Sllf0?=
 =?iso-8859-1?Q?HKwR3LlYZdhDdicz0Fk6JXsnmktBSO5cSXddyKIA22Qn8WgdbOAFZniAAV?=
 =?iso-8859-1?Q?MZXkgb8MXAPZ90jZyS49PZJUaLLsF1YgPtjKV4XO6jX0Nq1zZd5qQT1vXX?=
 =?iso-8859-1?Q?iDpKz9VUZ68g1pw8BjQxZzCpx0USRtTCaqdqG1aJuUb8XVAVi/VFqqBIZo?=
 =?iso-8859-1?Q?gTpp60cmMC1IXNIhy9n7uivY+9avlZgkbv37t3y8hOszo+Y+Fhk0Rhp+TH?=
 =?iso-8859-1?Q?HId9alSgdU91FCmCanW4oisqkobGx2diVMHiGMPOaDMn+oooI7xJfAKGqj?=
 =?iso-8859-1?Q?mBZ2dCe6DlR5Q5CcvON1/AFUUUN1vMqf87RSQOq8fOdzold6E29Iiwkc1T?=
 =?iso-8859-1?Q?LMhHA4knPyfr/WR+T8vZl4vnOHukjJcgKhSIjaeUssDx0WT66MiJxiyT8S?=
 =?iso-8859-1?Q?s4qWdAagx0MhnjktlXb8d9uMovxyL1PjWgkIGP7CW7SyjO8PoAKsphsRFF?=
 =?iso-8859-1?Q?OFkh0MM9xh9x5P27tgyvqV79MZEpPeLIiPhN7YSMRZYhUmqrPEpgyq/iGk?=
 =?iso-8859-1?Q?B3EusDeM5jmHzqB0Wh99PoYv0YHVO5GsUqMGhCOL1hNa9BAERaEY/bFuw7?=
 =?iso-8859-1?Q?QueGtbu3gtdQ42Yyn860WPEGjfOqsv0vKapvtgsmOjPfECqUJ5KI396H2I?=
 =?iso-8859-1?Q?1eEocftWzFWmAa7/MFXnQKKGHozTZuhT1e?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559ac06f-e236-4e2b-8823-08db39e01c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 16:24:51.3981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsYPcsv5np6bHRGyXu2UA3swZaOGK+EB9uMaXj2BvnM/QfH0JZUL+OfcbqKmz/76j2hRWrfsG2iTXirFxGAZN1vwMsWezWuaazAODbhC7sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6251
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
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?Ricardo_Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I would like to drop this patch as[1] and [2] fixes the issue

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/gpu/drm/bridge/adv7511/adv7533.c?h=3Dnext-20230406&id=3D9a0cdcd=
6649b76f0b7ceec0e55b0a718321e34d3

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/gpu/drm/bridge/adv7511/adv7533.c?h=3Dnext-20230406&id=3Dee0285e=
13455fdbce5de315bdbe91b5f198a2a06

Cheers,
Biju


> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, March 9, 2022 3:11 PM
> To: David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Rob
> Herring <robh+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Ricardo Ca=F1uelo
> <ricardo.canuelo@collabora.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Biju Das
> <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
> adi,disable-lanes-override property
>=20
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at lower
> frequencies causes display instability. On such platforms, it is better t=
o
> avoid switching lanes from 4 to 3 as it needs different set of PLL parame=
ter
> constraints to make the display stable with 3 lanes.
>=20
> This patch introduces 'adi,disable-lanes-override' property to disable la=
ne
> switching at lower frequencies.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..2dc378039d21 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -84,6 +84,11 @@ properties:
>        timings for HDMI output.
>      type: boolean
>=20
> +  adi,disable-lanes-override:
> +    description:
> +      Disables the overriding lanes at lower frequencies.
> +    type: boolean
> +
>    adi,dsi-lanes:
>      description: Number of DSI data lanes connected to the DSI host.
>      $ref: /schemas/types.yaml#/definitions/uint32
> --
> 2.17.1

