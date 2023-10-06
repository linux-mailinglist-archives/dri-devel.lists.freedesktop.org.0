Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB17BB397
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9A10E4D2;
	Fri,  6 Oct 2023 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A1A10E4D2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 08:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOXepLrixg9BXEhCn9YTu5p6BsGhBM0U9u7wY1WUsrTwo0TJYF6rzDahMbyzgnuDHHuSIS1FRIWEuBt5ab2qLlPdecPMBoJBLm4uH/Kikj6gaHv45EXKCbuyQGCKQUGmcGCr93llyffjyQwIgnopmtWleBgNKbyEpRRdd/3iQZJdbNKVBaKcceMc36kvIRkVxSvZi+5H/s8oL2xrsM8b0Wep5WQ3T/XprwhTNh88T/LrYDsoFVfLSfXLkuTEMv+nm1FjMren1H/YzuXVHj2B5SUH/hiOdEnM8Z970hvBki8iyrmR9Bd89R68fpqCXt2ytduDCli4xFnqOklZ+KjrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tVCEowK77NSiKPvbYWsZOcs+Z9u3XVi4GMPQbKCJhI=;
 b=CMiCL1YN3k0SoSSETu2CA+1ytujQdZ3O9OHt5/GBZzOl/T7oNNe//yL10q5VX2hSd8Apf+oPLur95pd+SfJdPWxYJIvRdAF2ar709ZAXqZQy0x0z1/BjMo3+1bMRbp6mcLzLAMQhCxAzi4S1qUU1cbCQ2S7X5Do9V4+T2XqbPqqLs+/8C80UmPEXMpcVu8ta/VxmtoznIXJe5Nwr07QOMB7/WFpTbTJl4es/PaL8+yruv2jsHMi9qLBBrNwJjkD11XLzQIn8Doqcm+MT1AVTFQQiQl0jIsVZ1ZVUjyGO/Efm4GHhMV6Hw9hm8438+lJCAvl1dUt99gUIJ4jGCbB86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tVCEowK77NSiKPvbYWsZOcs+Z9u3XVi4GMPQbKCJhI=;
 b=RUYEb/MzPp10T13Gc5uJEiuKjTVyeURcstAE3CojasJNguA0DKqtl9idBmBFhUKx/xQ3FXQj1iQCsGIsQGVtmsf3+XsFqHhaJMnfOIMTGOCMjkBb5pvjizpaj4MPvKZevF36eR5+mXBfAgI3hioSMy6KYrU3MshagF6nvWtpfzo=
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:320::8) by PR3PR01MB7162.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:7d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29; Fri, 6 Oct
 2023 08:56:15 +0000
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc]) by AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 08:56:15 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ76uO1Fb/EPNT/k67j1TrFzld37AtE7aAgAmVcBCAAT5MAIAAXgAggAGFVUCAAW0hAIABTgZg
Date: Fri, 6 Oct 2023 08:56:15 +0000
Message-ID: <AM8PR01MB804533DE0885FFC6A46A7C97F9C9A@AM8PR01MB8045.eurprd01.prod.exchangelabs.com>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
 <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231003102138.GB69443@aspen.lan>
 <DU2PR01MB80349344FB8CB1415BFA917DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <DU2PR01MB8034F17A9C81FE198CCAC5B7F9CBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231005125824.GC4874@aspen.lan>
In-Reply-To: <20231005125824.GC4874@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR01MB8045:EE_|PR3PR01MB7162:EE_
x-ms-office365-filtering-correlation-id: 5dc2ef25-7521-4c00-8352-08dbc64a190c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qvyq/o6IfCX7/sfL5br6EZGe691OhkRhkfQpeSP/SZdZQz7rPHO0wQQrBabAAsO6QkO/C2JcDG9y8ietsjXah8LOBgea85RxmDcRAg2XYC6rbONey5jIkd+QxsxLy0JzA5vy8xCYxah5QAthywJs68BWL/HlKgYKkLkPU+7/xMozoU1hmNwSmoEsnt1/8R6QJ9kODf+bq5aQIFI8NAxIET1CcHddfCY+revikxrvqp8IKOT6uK6ANg20bFBbNINjA0FsvCYjjaoBGke7FSzDQP9QTz3yANERXDTRoQUYfpX7aS2DpRmRgDSFtd1z3HGmm7uJ8grNvABqwaFWVU2g3h7Gg7b+lizhFPQSRUQGvoYj3vlytIWbqJzi3DYls8NwUobVwz59vlRbXayrNsu0BxXayqaPjkP+U1K30X1p5a4M7eqywzlm8gQ+q8WrSpy8W7Vh50RmbubMQpZYgUVH8I0kQVXS1Hbe/TGsqfZbJkERZBBfwJrV7qxjCEDm5wVrceNSMcWPHsETxbW29nNfstEuyj/V0jJASM5KZXDT/XoxZRLenhJnrZ4oc1yBpSJYU8Q2UqsbGvwpHHF7pfFQiR2epPBC/nzBoXDA0jb5aK5KdlYTBzPgElK3ZOszeyS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR01MB8045.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39850400004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(66446008)(54906003)(66946007)(66476007)(66556008)(64756008)(316002)(6916009)(66899024)(41300700001)(9686003)(33656002)(26005)(71200400001)(6506007)(7696005)(38100700002)(478600001)(122000001)(38070700005)(86362001)(55016003)(76116006)(7416002)(2906002)(4326008)(8936002)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jGLun+9wF+XQCHgv3sy+xDHcRCT2IHGP6yBCC6EjK7HRETPpIHDz1B3TkNsd?=
 =?us-ascii?Q?zaRBoASUtDsBWieYQyrlVpzt04O7gXih2M4QRs+2A/FDRurS3cLvoTSkHtng?=
 =?us-ascii?Q?0YR0RJa8p88AGqlQisz2e6yOna58i7q0HVY1UtS30pmXY4JXFAe+CHLWa5EF?=
 =?us-ascii?Q?7De2QL9drDiwPldtshf12cB8S0YMRJEjP07UmGY+ONPlA1aG+Go3XXY0eNgE?=
 =?us-ascii?Q?jrHXYtHs9lnDIwvUnhqzyl/BHIvqyyuQQZjWZExXBchBnwDGu0s+3pNaggbU?=
 =?us-ascii?Q?fSNq7N5yF+v8bJTHId4u0HXDtcJG15RORFthdfBompZ6nQ1gHSw2VGeCOdYu?=
 =?us-ascii?Q?iaAoVFE47yxYi/NDuTf3QLsfwQ/w9eWUbfI2P4GKWyeyh2FGn/hz5NCeVJLI?=
 =?us-ascii?Q?t2UaNk3kUj8vNXpcC+2R7FUu6OXM8U/+dbK4ZUS38A2DhjBl9dwZ/hI2//jC?=
 =?us-ascii?Q?RH9aTMrhDVrE57PJiX65B+O1Ant0bN5hXklQQ4eOBESSuh03395uz+k4UxMA?=
 =?us-ascii?Q?UHbUxWmb99Cqh9N5+vZs7nt7Yz4RyL3CXVIguCJKbI2PnSmDLuCjHJdVf2yK?=
 =?us-ascii?Q?o3dmDo8TbYe8mvIIXVGRa6B7m3H4OsHVRYVMhNpmqAdmauqYy/RAcwx5nNaB?=
 =?us-ascii?Q?t7ohUsdt/syrMAv81x6R8han57Pn0PQhjNOAKjWoc8pguO3OCCiSF6dv/TfF?=
 =?us-ascii?Q?8OEflh5upMVsVfqgVky46s4n2ee5QjOJkusiAOoQ1JOT21xyds2VVorgEsNz?=
 =?us-ascii?Q?uZZ0kkKkmLuNIh2T+yNJoUEI3HTRtZI1rhEh7XJMWldcF5/Ym9v8Zi+kFOT4?=
 =?us-ascii?Q?92r8L6Rg8ut1MMCJB9QBWGsyYGHbaqFHZ30HNPbrzddeGApDKoSwOdJL1Mbi?=
 =?us-ascii?Q?psPkiYS7SaJB7bzsLCiFu2T2FkgDO3JwCujSHxND+HzOcYufFD0fj0X19rvS?=
 =?us-ascii?Q?U15Pxvw6mj2V6JXwmazBU39LaI3xkvtJfb/opLwDDM7s1yJvnFrQMDcx0oPp?=
 =?us-ascii?Q?l+FeFAzW+/BNhXx+VTXIXqHdbUxpO/v0McBVfqQor8nBZzsdn/gE9kaK00Hn?=
 =?us-ascii?Q?6mgdtMEcgaIDrmWCecASslxOgOvo/RzGb0QUGZu7rukKcoHsEmy0ipbjEz7y?=
 =?us-ascii?Q?WcHJDt8/7UdMNl87jAOp0w9Lz8Q2jcmmD2AQVqesqyrFAv6mKcMMXiSIri0v?=
 =?us-ascii?Q?VMKKB5/SUYYgWLTQpB/1tBmsO2iOkvolwXRf2ONxpZxuzKMRPMbNqoJpgHWS?=
 =?us-ascii?Q?tfF5Y1NC/sNv6uoWzWimai6kz8q59of3wdcUTEHSPCNijZlmpjuE2nC7xwSt?=
 =?us-ascii?Q?7zSn1Fn6udkTAtuoj6rra2bGmgShRRkhFpV8pjVk/fl1d1bTsgv+/60FIGJC?=
 =?us-ascii?Q?YQ6/0CdGPmsz5lJz6MLmDL/6NFkHiC3N6YRY4Cny3hJnuI7sVvlEM9SJpsqI?=
 =?us-ascii?Q?vSU+5dYYg/S08O3+qz5anKIsErtnvW4sPD6dTXM8Ungud5szILRxfdBwPF/8?=
 =?us-ascii?Q?pTo9+79CciwZKm68nMY2hXe/bcQvi5X9IpqJgOB8T0QUpcdE/KBg1W4LgyOb?=
 =?us-ascii?Q?tFB0clkwDhdh3ny0vg4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR01MB8045.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc2ef25-7521-4c00-8352-08dbc64a190c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 08:56:15.2788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nd98O/bV4pkKsT3PD643C4NwNHYaJfbBLg0heNIxUU/uv4I3EENeZVgwUey7PuZeVBEbYvP1LAM6J0T69jGv9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB7162
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

HI Daniel,

...
> > ...
> > > ...
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +  - max-brightness
> > > > > >
> > > > > > Why is this mandatory?
> > > > > >
> > > > > > There's no point in setting max-brightness when running in I2C
> > > > > > mode
> > > > > > (max- brightness should default to 31 in that case).
> > > > > >
> > > > > >
> > > > > > > +  - default-brightness
> > > > > >
> > > > > > Again. I'm not clear why this needs to be mandatory.
> > > > > >
> > > > > >
> > > > >
> > > > > Ok, you are right, I'll remove max-brightness and
> > > > > default-brightness from required properties list. I think to
> > > > > change these properties, for the pwm dimming, into a clearer:
> > > > >
> > > > > - brightness-levels (uint32)
> > > > > - default-brightness-levels (uint32).
> > > > >
> > > > > For example:
> > > > >
> > > > >   brightness-levels:
> > > > >     description:
> > > > >       Number of brightness levels. The actual brightness
> > > > >       level (PWM duty cycle) will be interpolated from 0 to this =
value.
> > > > >       0 means a  0% duty cycle (darkest/off), while the
> > > > > brightness-levels
> > > > represents
> > > > >       a 100% duty cycle (brightest).
> > > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > > >
> > > > >   default-brightness-level:
> > > > >     description:
> > > > >       The default brightness level (from 0 to brightness-levels)
> > > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > > >
> > > > > Example:
> > > > > brightness-levels =3D <10>;
> > > > > default-brightness-level =3D <6>;
> > > > >
> > > > > What do you think about this solution?
> > > >
> > > > If you want to introduce a brightness-levels property then I would
> > > > expect it to be defined with the same meaning as pwm-backlight
> > > > (it's not relevant to the bindings but ideally it would be
> > > > implemented by refactoring and reusing the code from pwm_bl.c).
> > >
> > > ok, I'll use the brightness-levels property as used in pwm-backlight
> > >
> > > >
> > > > Same with default-brightness-level although I'm not sure why one
> > > > wouldn't just use default-brightness for new bindings (doesn't
> > > > default-brightness-level simply do exactly the same thing as
> > > > default-
> > > brightness).
> > >
> > > ok for default-brightness instead of default-brightness-level
> >
> > Just a question: default-brightness-level is the index into the brightn=
ess-
> levels array.
> > But, if I use default-brightness instead of default-brightness-level,
> > should I consider default-brightness also as an index into brightness-l=
evels
> array?
>=20
> Yes.
>=20
>=20
> > Or, in this case, have the default-brightness to be equal to one of
> > the values inside the brightness-levels array?
>=20
> When there is a brightness array (and there is no interpolation) then it =
is
> indexed by brightness. The values in the array are not brightness (e.g. t=
he
> controlable value describing the output of the hardware). The values in t=
he
> table are merely the PWM duty cycle...

ok

>=20
> Main difference is, with a correct table the brightness can use an approp=
riate
> logarithmic power scale (which matches how humans perceive
> brightness) instead of the linear scale provided by the PWM duty cycle.
>=20
>=20
> Daniel.
>=20
>=20
> Brightness and "index into the brightness-levels array" should be one and=
 the
> same thing

ok, I'll use default-brightness, thanks for the explanations!

> >
> > >
> > > >
> > > >
> > > > Daniel.
> > >
> > > Thanks an best regards,
> > > Flavio
> >
> > Thanks,
> >
> > Flavio

Flavio
