Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A307B6874
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 14:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398C310E0DA;
	Tue,  3 Oct 2023 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEE610E029
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 09:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuUKddtX5YjGCxZq5RP6eVlza+Izp7H0wDO/uHaENzD7E5TEUvtM1/qa9Jx8IITbwzSXNSMFDKLHxpyrBUslCzptKcPHW+ryj1cmrSgP48Zg+3kJxiM8pDo2iye6rRnFKjZWBwdQokjLa8ZbydiIK6A6DEgJXdxuCZq2kSXDahLJNg4x5Xp3hebpQ758Xdyki95SWc8u5aUOFoheFpzFwigvGC9n/C02U5hFr8OWUiGZFg4dHOsRVg3jJPB5dPC4EQBRVUNOy/khebOZiToqKoCq3BT0PCwnUsp0nKUbzFCCZ7l6euOlBfKY2/8a5OZ/Cw6Jfoe0fEqrXVbogUVDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4TPV1SvH5xoswYo0hNT/oATHJJfoV12pNxvCJotvsY=;
 b=f+jA1rehHt51YswNcbVrKyK5ouYRicRAMU/TZEdGauG+EfO8I6A141ofesqWdEl+7p3nHd5zh/hYBfYhBEUaBZXj9jVg3G27div4s6bedX5FalpgeSaB2ZO9sCdDOmX4aRlXQk0osFDGHCU5bgJa13bOZqrn7TpvdZMFa6qyCm1pySI+mvjaTm18JcEPxMmP1Gysy6oLz/rNpufNTTnHiysYsdEj83mdqUFoVacEL1U339poK68DXQxzfFnFldMFDZLu/41i9/xgoz1B6Vty+UyeNKqH/T7rd9X1lYk0Mm61QBoVf67cI8SCOJ1+vVAqH5JZuNMOolJoqtON/qeDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4TPV1SvH5xoswYo0hNT/oATHJJfoV12pNxvCJotvsY=;
 b=atsxCEhNg9ggubIwsWq82uJD8sILa9YVrgYLzALIFcKf/y0LoFT1N6wYA+NqkJB8G9zI6SgNTtTVqAnuBb9HqLWbi1GmdxlPi1Y36BxF5Ao/U3r0L5SczKRU7PuM7clSIAFp3Qvx2MGaIzZcBga/qOLLE+e+zuNmPJd6n/ocjko=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by VI1PR01MB6301.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:144::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 09:43:15 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 09:43:15 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ76uO1Fb/EPNT/k67j1TrFzld37AtE7aAgAmVcBA=
Date: Tue, 3 Oct 2023 09:43:15 +0000
Message-ID: <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
In-Reply-To: <20230926130113.GB4356@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|VI1PR01MB6301:EE_
x-ms-office365-filtering-correlation-id: ae921ce4-b6f5-43b5-6b8e-08dbc3f52a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nymp5wqakQRrJ4KUsF3fkMisbmYygth/TVhor0xMmjDeZsXE5rdrS+FCC3TzCp2991QwMA4CP6z63rRhx8zf24jAaRoLJmjPk18zDN59Ka69mhawxm622VifAhQqohdBHnwIdjToXxJVsAuReqhpj2t0I49pWlmIMH9K9vTiy3VFp4qX18QRSC5xwZCWAXNRuIgzdOOl7QE8g/fRuZ49Rps5+tOYtCoZ6Ol5PHVXE2AmzZQOZqU9DlmUzl/psMbXKdGYO72E/fcrvhNZG0CJWbSu7uER6ZYR9iM5tbrriRldZa18Y6ncqDB6xyGln3IrJK8EOG9oW+nHcGPH4K+iwSepYKFgdYcyhh3X4LDZarhTHy2L1fi33RX8H9YzKAIv46hQtF/9QZ1uC8kQIfrBw2X5FhWH6yAxuhDjcmtrfyYlfGIN+AopBkmjV99RAsB7nKB5IuFAhnK2g0gpMNJ6lmuUNjqxCmKXLq4TN433A/8s1C7GUhUU0djVmWzbMzPJZcaEJQmx1qvnerPg5GRXIAVvrYa+Op+IzymqKP0xm9oOf7/n6b7GEtN011VnVywMo6+smzOENBDb/A8KAsloYsAaR000CK/QXYyq5/n4PUYcXhiVfLcu4froMZSLXHZV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(39840400004)(136003)(366004)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(9686003)(7696005)(478600001)(71200400001)(316002)(41300700001)(66946007)(64756008)(76116006)(54906003)(66556008)(6916009)(66446008)(66476007)(26005)(8676002)(8936002)(52536014)(5660300002)(122000001)(7416002)(38100700002)(2906002)(38070700005)(4326008)(55016003)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S5iMIa0ehqMGwt7WQI7/W7OMXSqlgqp4IKJ7sWGPiCWUTvH9PVn9mCWE6eZ8?=
 =?us-ascii?Q?OjmOHIEQnCSAU4ZFTKEIhf41AQwfZpm/pM8AuO5waUNjxUzupMc3zkhLcTDR?=
 =?us-ascii?Q?tZuQixDjUP2sndcrLqZmMlHRhAgWlhnoEhp6bW3tZfroBlqIXJ9Q/uKn47g3?=
 =?us-ascii?Q?rkdZuB3dtxtoEob7aNzUA5nNAkAFKjk3vSmNfJVRW8Uzqo4R4pNyqtqUTMCH?=
 =?us-ascii?Q?Vx3rLvUB1OEz9yQXsWtVdwfq8b3T1RWqbwpgwL5W7eR/wErmdD0PuyebAIjR?=
 =?us-ascii?Q?phUmgCNSbTriKPeX3KZ4p67D8ZeHc/QJdaWwvSYBMxDvERP3kdDg6Ns4w+bB?=
 =?us-ascii?Q?i+IUj4KnaVikFGDTvV8jE7LR2HE99J0NTem4g7nhrYOykqwEzEaMh501KtVy?=
 =?us-ascii?Q?n+BXrzQNl4SaNbR4cMcYAA92MqGCkvppxQrR5loTn8gK61hGqjkE8D04j5sN?=
 =?us-ascii?Q?vC04gEKMI0vb67Y/mMIDmfjT0CC8P0wjUYc4kWXGkBNforh1q9nfBvmVsga6?=
 =?us-ascii?Q?jaGTYsv7Q2Q0MOCjgpJXxzg41Avn6WS7FIOAI0co5O4kd5mvevizv6aPoJZG?=
 =?us-ascii?Q?JnU7nyLE3ZJC5t1sNgz0f/czRqfZAdbaqFgC09ASGJqJrTVJyZATQwygGOrD?=
 =?us-ascii?Q?FZvIlvabsah7ftpMFKOpNiQahJIu46IaLQX61WuQzORuBM4uWqVRt3X6Rc3P?=
 =?us-ascii?Q?8ME2/mZx8m02/tWzeqwgrrS2IcpcGVaOpV+qP8mJE2L9gcTcYW5oLIfFCd4x?=
 =?us-ascii?Q?+CB4fgNkJQ2OU+ORHqkBPG+GdxUd2JYRa5EfNTMP/FJI8/BFUCNNmsyUpAXC?=
 =?us-ascii?Q?X+F4MyPlmOh6cGa7LhCbx4EOdi4s+y9CQgtQMLFirsmQuvobreria+gvJ5Oe?=
 =?us-ascii?Q?XudA+tJhNyEFPXs9ZIIusH7fmW+4FinzxzfT+kfZZrZHMkmSd22vekPUVpFD?=
 =?us-ascii?Q?CLBj/bL5Kw+JRUgMePq+7pTMlvxvM89w4kFtZrH44yWUFVXocQT9aRaA037V?=
 =?us-ascii?Q?dSPu0rAVJBA5p/wTRfgzCV2srkNWOYbp94SaZ5iVtFOvVAbFnNaqG+vH3iv/?=
 =?us-ascii?Q?Kf9YLWpxmoHhk3iEtxDLbJWQKV4m65w66C2E80Mz5Ei/jt2y1S4YWoiWZTPn?=
 =?us-ascii?Q?KsuHfjCNAgXcw/G+qecqdo9j0++lYxYaonySrZiIlY/QMkBoblj7giJYzLXd?=
 =?us-ascii?Q?WMZ2uEgQxoneYN/zv0C4jJfeXbXJwMAPiLzHlsFDppmLDqITljWUNthOSUkx?=
 =?us-ascii?Q?9EpFWGJAKI2HFtus3PaKeYv0wl5yo6G/hJBHjBUNRSj7/EobYVX7BFVQ4hw9?=
 =?us-ascii?Q?tgyDpvYjTMtfmSAslbgYdXtUKIywwuRIk522khUuVCgicLQrNwfjU2NqLtW9?=
 =?us-ascii?Q?RKDYlroMnfttvBdFZmSreyTHRVYGr+UINrdkmG5S17LFTRh5q/HuIi1LO5nL?=
 =?us-ascii?Q?Z+jKCTZ2iow4IHEN1WGEdgSEOY8TtHgWggVS2km/kn8L6wBGqcziSrw2iz5S?=
 =?us-ascii?Q?XNIFdQIRDi6A2eOfGnYhXmi7+E8CePJvPR4ZNxbj8FPipP7ohCWF9Rl7j64S?=
 =?us-ascii?Q?+0Li5IRzztLMqJ5b6RM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae921ce4-b6f5-43b5-6b8e-08dbc3f52a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 09:43:15.0853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lu/H6EQ/JAnLCA5FjtNy3BBsqIKJQsxYCnu3rxArvzCSuxnD2MXDN/2n+oqFfcfAakp2AI1G7WZLlRxgL0eLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6301
X-Mailman-Approved-At: Tue, 03 Oct 2023 12:04:48 +0000
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
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

...

> > +required:
> > +  - compatible
> > +  - reg
> > +  - max-brightness
>=20
> Why is this mandatory?
>=20
> There's no point in setting max-brightness when running in I2C mode (max-
> brightness should default to 31 in that case).
>=20
>=20
> > +  - default-brightness
>=20
> Again. I'm not clear why this needs to be mandatory.
>=20
>=20

Ok, you are right, I'll remove max-brightness and default-brightness from r=
equired properties list.
I think to change these properties, for the pwm dimming, into a clearer:

- brightness-levels (uint32)=20
- default-brightness-levels (uint32).

For example:

  brightness-levels:
    description:
      Number of brightness levels. The actual brightness
      level (PWM duty cycle) will be interpolated from 0 to this value.
      0 means a  0% duty cycle (darkest/off), while the brightness-levels r=
epresents
      a 100% duty cycle (brightest).
    $ref: /schemas/types.yaml#/definitions/uint32

  default-brightness-level:
    description:
      The default brightness level (from 0 to brightness-levels)
    $ref: /schemas/types.yaml#/definitions/uint32

Example:
brightness-levels =3D <10>;
default-brightness-level =3D <6>;

What do you think about this solution?

> Daniel.

Thanks for your help,
Flavio
