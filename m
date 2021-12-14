Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173C474BEE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9845889B57;
	Tue, 14 Dec 2021 19:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D161989BAF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 19:31:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr4skIx5dXUiFTuJ6lLE9aeNjWEkSx2euSD5naAKhqDR0kskD/ZgtYL1KXKcR82lx63TItxQv3isheUYR1ZVuNQHWTQeNyVl1hIP1yaQNI8Hv4FZzO6dFX+6FH6Krl1RCX4jO9/jqLBUXaQ5PpuLhXtKn5j3aiZSul6MlCpCR/ie5MudIV5lphNHzuBZXQxcSMl9ewGcLCE/1j5/WVhYOIore0pY/BtqVugonPD11bUD0B0bXFf3CmWckTAf66ZNqpYtar9M5v5ODnba602HQb7+pc26NmOy2DVHZdsIhY5y9CGw7t/RXFgTEwUwLg/P8sTJNVHZF4QWdcMhB9960Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSVKYxAIBbVA+egF9KIqHYJ0fk0dmyLY8mfwqpQHVvQ=;
 b=As674Lg4ja6e5w8lEPgjFbAyYJX8jdLzCg54QSFw4zaZptfncUW3WcJz6zWo+vYtlNSsQfWCdUBJn5G0FLO1j4IKqYJt36oqKeVufTGyzVnyJly5QNp3nrWSaaSvcoUGcHuxzVEVRaZbCNeE/Xoatyi3MLUdr17K15VHPRfI3BlYdDGb+YwQACgBSjMl7bWIxQgz7T9udNLIsItOK3YWsJ3iobNJzxTT4mZDjrKhIZslWqXhV6rRWOCF7zw0DeX+/zKXXN2R/FG/XHhG4azlxgjNDRSht1rtdqBd8uzLriKkcnJouRfH4kLLdtpwD69Fl/kpjK4GWSMvdIe0iVTTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSVKYxAIBbVA+egF9KIqHYJ0fk0dmyLY8mfwqpQHVvQ=;
 b=F841xfF7DwAtxcHlKnztlq2Mpa+urVj/4+vv7rb3cm3258rHK1uSBi2pr8UlbyN6fKVpvpV+1XkVppacz5XBO1W2QpQXT5zHkm7LTeJQ/Gd5b5LkZfyCJbDTF3g3iqIOkgtyMbhxc/IYVKBdjF0uAkVGSfdAg9X26eVSVFG3VwQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4628.jpnprd01.prod.outlook.com (2603:1096:604:64::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 19:31:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 19:31:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Topic: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Index: AQHX7CAJAEphcwzTrE2piMcyHlnd6awr0F5ggAaXAoCAAAJCoA==
Date: Tue, 14 Dec 2021 19:31:38 +0000
Message-ID: <OS0PR01MB5922E9BA117D920C8F9FC28E86759@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YbjuwQYYO2begeDY@robh.at.kernel.org>
In-Reply-To: <YbjuwQYYO2begeDY@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47bd2e75-ea1d-4b7b-ad69-08d9bf385942
x-ms-traffictypediagnostic: OSAPR01MB4628:EE_
x-microsoft-antispam-prvs: <OSAPR01MB4628004470ACFC6BDB51630786759@OSAPR01MB4628.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbTDD9JDosvX6QAdE4Sf/oohtnNJEiXCKiqOKhie6mAj28uVZdntjq31DJP9uu1xi3gMfbr/Q9v5dz125cIPwCmAOH/X7MexVDCYQ7e3W8dACquHzN03/jadZ5OJc++rxjgpQb8JvV32UBM2I2Mq81NXGM5AIosgSsUl7866jZc8vzisz7UTlJtaER/grCMsDaTA0Dhp5tzW8zycYa89klEsWkjpAOg1xbdeHowwdm8sb5/ueku0Eos2M4SFB3byObpYZfA3Reu0vf5IVU6cowE/o13ziBp+SZFhTqjUajpH9eMXm0oPXIxn+IcAa0zu62q+7xjdjiMFrzh5YY4IsON0s5XymuPjTEVbrAruAJfLC6WeC0eybuBskXLtXp7pLHdAgFJ8U+GOZWkVtVHbfcRsSP/PSw0A3x3EFRPMNIFHkeDgdIIvntS3avuDZi7NaIeTUIFEj0iAzLQtsCzsSN/gnYVpLPsZcgD1SVEErmnQnEDqYxU3p1RaZdPQ0RkTknEJ+SH2tnq1wIxLvmHVGjnE62qe6d+18AVrsgnGHmTrdWd4WVAt45EdcBiyodm74q4DnKd7EkxybB2IUwNuEKHcWAuhWxF7gMfZrH0azcx+TVNMQYM0/sy/81IOTjyNisRFSkZ9ghpQGJYQWzPP5LJkTCal5SbVxxAYJflpm0JXOY37eSblVN5cPA4c0A7JOrlmDeF/X7KJoPBc14tPqTGdvn8c6rWeubkgigTyeQ/Rmfwr+iKyvSg6Fl+WbFzqJc6OL+VdKe4ACTmo+hCsPsJzpSUhS3FXg17t60aUMqE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(76116006)(66946007)(4326008)(7416002)(54906003)(33656002)(83380400001)(6506007)(55016003)(7696005)(8936002)(8676002)(6916009)(38070700005)(5660300002)(508600001)(66446008)(38100700002)(26005)(186003)(45080400002)(316002)(966005)(71200400001)(9686003)(52536014)(122000001)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oi9G7JtghZzBjHEdqGsvYN4jSOOGdL7F2hIe6kK6ZAp8mpAKsr5+6xwh1uzf?=
 =?us-ascii?Q?JZFc7dcigM/pYhcKCPrHhEvbjmreADhyKTbOI1mEnwBdwp83xc84Vq0jXKSl?=
 =?us-ascii?Q?rm4tdylypKdK0qx4tfwWFDiViRgwhj14rhVsHpmsPxuBn6nPNe9WNQwqphHk?=
 =?us-ascii?Q?qXgSpk2BakBWwMqsXt9wJuGiWfD8zdHAB6QdH5oym6NgppXL52zNN+Lq+uGq?=
 =?us-ascii?Q?KA5hJnFwHFR0pRCWIYLLH7m1FsEeM8UVvm7jxFEqdxGwiOdaEr8dK8xHL/WW?=
 =?us-ascii?Q?0MhXhKdiypJpZ+5RqwSEwtCmLdMn0feK+yxR6vV+nug18VUGDSG4JAhAqZHu?=
 =?us-ascii?Q?sdCnEsIE0OUSFdhAy5CVO1D7xLWCisdfdzCLXj9HVN2v/nN7ZTDiLAokvHP3?=
 =?us-ascii?Q?HSbzJf2QEOGSpuL2JgZpya+3v4wClocPmlwvaDFWdb8BKMmOE2GE35B88T6x?=
 =?us-ascii?Q?8jpncBwl3Bcu6qBIgnNnLr87Bu6yMhXe9sjn6N7G3VnxJg0tGNRgyUPxBHFq?=
 =?us-ascii?Q?pVFema8otwi1qzxgJv/qzcLjxBWH0iLG6Y3ep+S/u7GuF+l7uPzrDd3Ocyi8?=
 =?us-ascii?Q?1SOzUOgU9lc/iK19tG6j7ZG3T2MjMjwerQygfwd81180/AITU129uIC92hNr?=
 =?us-ascii?Q?EoLi6Tom2ouWGQPIBTTicXvvhIcGnDtP7NasbtlMSG5Pp+DRiOkyj7+X2YKh?=
 =?us-ascii?Q?coL8ZSjIhI7Q+dNpCBek1/iAWcZFh0TMTqS6rNMWwp42IYmf4QwcJNhB1Fcs?=
 =?us-ascii?Q?SQMV3NtaiEB1lmuI+Qw4hPomOTV+W4g1woOiFJT4dE/qbSkxDRWnlIf2tik8?=
 =?us-ascii?Q?/Dxqpw1BPSIjJ2ue+A4Nq5CT8UrJ/IZCHb8auixXt2SRNyEaJAre3WzPehi2?=
 =?us-ascii?Q?zTCNAPR6MDhTsA4/PwGzGl/vIJgyOWfl3eY18/PDK35QmSi3kRLFBY86Tz/F?=
 =?us-ascii?Q?OS89W4qsfz6VUGxE4vHYZpRyN/t5KQIFq3xA9UiQ/9DqtVn8dl3EjOPZGJVv?=
 =?us-ascii?Q?abeCEcAHgqih+CRxFbIgYR7YBbK0GlO4P7YGAs+wvdU9HcNc3ANyN9qgshsP?=
 =?us-ascii?Q?/5XvgpHyaAuZdsUs9CUgVhq0TyLbJJSPigRRAxZVCi/pDzqsuC8FrBu2+q9N?=
 =?us-ascii?Q?xAxsl6hr7KhTkWxOEI4pgN8JQQgK7f/II4dZeC/8k4rOfQ5Ew0849S7iqfKa?=
 =?us-ascii?Q?ZoodXIyFsRHoE+cBga4gH4HsjkijraS2Q1KI/sOlqN7ZiUIUxQI7D14KPPqj?=
 =?us-ascii?Q?jnZqIydGy0ucZWl6xoReBx61TZxiSQofDBi+e8A0/LfAyiIl5rah41VEffE1?=
 =?us-ascii?Q?QWMmSbQs6y8wsLWAtFwLyV8z2X1qQYNuAjt7jw066LMTI4fE9yOVd4oHd815?=
 =?us-ascii?Q?yhvRb9GH7LBKXWRCYQP7CJUuieSOMPymlTMmDUasRMpYW1p34zYyKAbZboC5?=
 =?us-ascii?Q?f+R/ZBh3395ABRr/WJK5F15mn7bF3IEvi3GNWfFX5hZGbxcxsuforKEtTBaU?=
 =?us-ascii?Q?JRQiwZmIla9Y/pNCd9ZzDY6hLwb2uAeMvOT3r98OPejiNi9CHKop/7TaWnFQ?=
 =?us-ascii?Q?paY6QncySnmteiEHRqwTQrGhZHkffGC8hTy08DbeNX/yBuYAMtazcIn1EQ/J?=
 =?us-ascii?Q?2viiWKIKK+z5XKOd6cNCEuC6L/LHIJVTZxnt762oo4Cv9j3xfFGwtaDjhWcv?=
 =?us-ascii?Q?EJkXbg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bd2e75-ea1d-4b7b-ad69-08d9bf385942
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 19:31:38.5146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLnbFeXGh4jQELhTGdNLntV/if0+8Ob8I2+Jmn/O9Nzsw7xhXFwAO2aihYlUnnO0Y+apTvWKD+485rvC6s7EggL9j0j7ib+boT59lIR96xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4628
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
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document
> RZ/G2L support
>=20
> On Fri, Dec 10, 2021 at 02:44:06PM +0000, Biju Das wrote:
> > Hi All,
> >
> > Gentle ping.
>=20
> 2 days later is not a gentle ping. If you want to check status, go look a=
t
> PW[1]. If it is in there, it's in my queue (only about 100 patches ATM).

Sorry. Next time will take care.

Cheers,
Biju

>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.ozlabs.org%2Fproject%2Fdevicetree-
> bindings%2Flist%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C4c=
2f7
> b12ae0c4fd541d608d9bf36f549%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C=
6
> 37751065028707898%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
u
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D1rccc5jxHMAu111IJre=
bdW
> PwTP%2BrQj8uG9iSuMO58EM%3D&amp;reserved=3D0
> >
> > Cheers,
> > Biju
> >
> > > Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document
> > > RZ/G2L support
> > >
> > > The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost
> > > Mali-G31 GPU, add a compatible string for it.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Moved optional clock-names and reset-names to SoC-specific
> > > conditional schemas.
> > >  * minimum number of reset for the generic GPU is set to 1.
> > >  * Documented number of clocks, resets, interrupts and
> > > interrupt-names in RZ/G2L
> > >    SoC-specific conditional schemas.
> > > v1->v2:
> > >  * Updated minItems for resets as 2
> > >  * Documented optional property reset-names
> > >  * Documented reset-names as required property for RZ/G2L SoC.
> > > ---
> > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 45
> ++++++++++++++++++-
> > >  1 file changed, 43 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > index 6f98dd55fb4c..63a08f3f321d 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >            - amlogic,meson-g12a-mali
> > >            - mediatek,mt8183-mali
> > >            - realtek,rtd1619-mali
> > > +          - renesas,r9a07g044-mali
> > >            - rockchip,px30-mali
> > >            - rockchip,rk3568-mali
> > >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision
> > > is fully discoverable @@ -27,19 +28,26 @@ properties:
> > >      maxItems: 1
> > >
> > >    interrupts:
> > > +    minItems: 3
> > >      items:
> > >        - description: Job interrupt
> > >        - description: MMU interrupt
> > >        - description: GPU interrupt
> > > +      - description: Event interrupt
> > >
> > >    interrupt-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: job
> > >        - const: mmu
> > >        - const: gpu
> > > +      - const: event
> > >
> > >    clocks:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  clock-names: true
> > >
> > >    mali-supply: true
> > >
> > > @@ -52,7 +60,10 @@ properties:
> > >      maxItems: 3
> > >
> > >    resets:
> > > -    maxItems: 2
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  reset-names: true
> > >
> > >    "#cooling-cells":
> > >      const: 2
> > > @@ -94,6 +105,36 @@ allOf:
> > >      then:
> > >        required:
> > >          - resets
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a07g044-mali
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 4
> > > +        interrupt-names:
> > > +          minItems: 4
> > > +        clocks:
> > > +          minItems: 3
> > > +        clock-names:
> > > +          items:
> > > +            - const: gpu
> > > +            - const: bus
> > > +            - const: bus_ace
> > > +        resets:
> > > +          minItems: 3
> > > +        reset-names:
> > > +          items:
> > > +            - const: rst
> > > +            - const: axi_rst
> > > +            - const: ace_rst
> > > +      required:
> > > +        - clock-names
> > > +        - power-domains
> > > +        - resets
> > > +        - reset-names
> > >    - if:
> > >        properties:
> > >          compatible:
> > > --
> > > 2.17.1
> >
> >
