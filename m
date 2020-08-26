Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C082528E2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49389A5E;
	Wed, 26 Aug 2020 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410109.outbound.protection.outlook.com [40.107.141.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE1F6EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5gyUhC3pC3pnKmMQsonjLbwxw6x8Eob5j8+wjk7z/nqeKD/Qv1Dwznmbq/v1T2zQ/PH0ZUem8BOR4e+jUST5Szx+7PmAxEIEM0RxUv9OyqJbp1sb6w8O+d2aDgzO24578RTE7LkhVQt/wCyGJzmdI3jeGVdbNe3Tjd4zWDjgvDRIgEpkgsPVKqrM4umIfbyG5HmtJDEOx4vuxsp6DWPuodTHIOijopQVtKNDr/Dqzqbakqx8UNEpJIkBh/rkKWrW5QMqsi+/hONmUTjKVTD1AbX7MitSXQBAX9mPwxFLqz2otQo7rNggEZGtUjkHa4nCE6IRG8K0RB8M0M9kiQ6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvkAmPcijhIlxIlmaTUVh/j2xltJNDNyDiMLhSSt6zM=;
 b=UJeINnWt7E7IhKnEkagayT90evNyICgdaY5aeSygXW6gDF7RxWzf78v+eBsseyDxzJZrjf3d3UvFpoT9xzR5AH3KdXt7wGyIuvmygvEm+l2LfrTOeAYLhItmDTnbVfdetPt//Qk2hCCYK8WCFG1QgCzqi9NzM2AeESGoITSE8PTKAZ95q2tfyG83WPsO/CqKiuruziqyprvVLRoc4J/jGTXnjTbfbgx98M0Hou9sHDCVKKrRaMTXuH8K/t8fnvrSwpQlGJnx/9Y0+H2IRM1oUgwEKRLFJ/jYXvhQbtznfEeonTmlNLyFpeFo6VP34UqQ7METEX+Dwu1xNr/+0Ydi7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvkAmPcijhIlxIlmaTUVh/j2xltJNDNyDiMLhSSt6zM=;
 b=qyh/NyGgz9fDBkhwmZvLsmJuvG5fyBKM+P1FaDh7x9AnxhS4jpONgQ6EAaJjbOVYHcqSb+vl2M8ED+GKE8pVihvSsKx53zHXIgj3q/NdCvydQxUQltSNMIfXdJ3ZrxdMDqjhHiNeQeCdrL0YzagGQEkxp8fC6AdlcGuJb741oIE=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYXPR01MB1774.jpnprd01.prod.outlook.com
 (2603:1096:403:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 26 Aug
 2020 06:58:51 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3305.026; Wed, 26 Aug 2020
 06:58:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec: Document
 vcc-supply property
Thread-Topic: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Thread-Index: AQHWbyoRJ5YsTeOuoUOFPAjubrX+m6lH96UAgACHhvA=
Date: Wed, 26 Aug 2020 06:58:50 +0000
Message-ID: <TYBPR01MB5309756E7E19EF34562FAB5E86540@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
 <20200824230458.GA3489164@bogus>
In-Reply-To: <20200824230458.GA3489164@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [109.154.85.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43cd9966-65ff-42c8-b2c3-08d8498d7d13
x-ms-traffictypediagnostic: TYXPR01MB1774:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1774D8040FFE05705D98D4CD86540@TYXPR01MB1774.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZZJvEMqMpOZn1MwbsUgVb7vXmo+5J7NxozBypCR7eTgCzBTgSiDFw0+F5f/A9Af2QU2rWJth3lmOozbQ0xn6UblZgSZHSectKWjO8ZiBW8GrbU8sKnpg0VUXZlfB3HbY1ra64vKEl94T/+wkOBEvZN4v4iWJE0kZNKdgtTjH0AlKzik6pk5MhIkOzxv0Ou2+YkPqpFG5hc7tO7KLVPRocL2T/JUgy7aTYqnq4TNlTn6CxaHG3KCyO8sYliwdsTHO+jRcMvtSFMueoDvLWgQeO3bQRLEzlnaMpigjlNpyQkY3cIr0Cf6YcLWOAdccLYlmcJJXrsAIp78gesmOm0m0pdynUbIusD3XbiU/BSvm3ORD/7R7DJDEjmoeaq4DrKBuT3+QSMA6HPNRAAPR1TxkQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYBPR01MB5309.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(6506007)(86362001)(4326008)(66556008)(26005)(66946007)(66446008)(64756008)(5660300002)(2906002)(66476007)(76116006)(71200400001)(8936002)(55016002)(316002)(7696005)(33656002)(7416002)(9686003)(54906003)(8676002)(110136005)(186003)(52536014)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aIBq/B9gm3ErzsmQL5zCWVKUDfCIqT4S/1BGeHCtT2o/dVsZTyxMt49eJw27bWizkSxZi8XpCZJkN/bDXPPIpQnQEWp35j0tOfKZ5ZxXiXE7ypnI5qMBlyDd0XOkWXZIQ1zMuAzK1q7otXWF1/iJJDnX+BhNowyxDT+7QnDuZ+PfrllQcE+yRfWYDO95GldrhmBWMY6oM2euNUxLDSuGRS/U4KFOuFH8rg4oyISJvno/Dm8mFFDiC9KXQ3k6MewtrINnZF8pImnQkLitZjb+ssUolzRmpOzsaupfzPIFe6s4g93snFgsn44i9uawwFfZ6oF4+e8azVfycppO+qCCSqtJj1HdnuGKy6dtj2pAhkQnGuQJ4Hk6IPnnQ+WwcApQ7VwQm6Ro0PpNoKtEZXKtHw+fOq74NwkSxh4RMb22kPHdDceP96le8D2pem5AAeT1VAPR9Bdh3HJijHh83qqU32ZIMD3xPjCvb+cZhEOSc9NFn8A61RucBKhwdhFx1P1YuuWwSMn3rh6WAp5kSRg0BdLFFKhv9gija0353ZSzEqiCpzWNunsQ2I2CJTZ7Cab6Q8nNp6yunkL+Pgqbeaeolw1wwXB5TxvsS2PrJVVQhIjXw7X8NoTdEP08TOOXaNcq2Ks9yc5AjfowDnNDpIqq2A==
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cd9966-65ff-42c8-b2c3-08d8498d7d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 06:58:50.9349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEoeP67DWHxSc9b5d2ncIrgloUseQV/14VwhDcyv/B8esZoszVmuq8gp+2QgC1caF4SAqTleagwRb5tEqwJtMw1mhRSLI1I31rOtus5+G+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1774
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
> Document vcc-supply property
>
> On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > Document optional vcc-supply property that may be used as VCC source.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 68951d56ebba..3248be31eceb 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-
> codec.yaml
> > @@ -79,6 +79,9 @@ properties:
> >        The GPIO used to control the power down line of this device.
> >      maxItems: 1
> >
> > +  vcc-supply:
> > +    maxItems: 1
>
> Probably should be 'power-supply' to align with the 'simple' panels.
> That's also to signify there's only 1 supply. Using 'vcc' would encourage
> adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll NAK because at
> that point it's not a simple bridge with no configuration (it's arguably already
> there).

Yes, I am ok with 'power-supply', since LVDS CODEC driver is  generic and also to align with terminology used in generic 'simple' panels.

In our case this Receiver converts LVDS signals to RGB signals and fed this signal to simple panel.
On the receiver part, We need to supply  power to TTL output,  PLL and LVDS input. It all derived from the single power source.

Laurent, Please share you opinion on this.

Cheers,
Biju




Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
