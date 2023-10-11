Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585697C57D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 17:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A68110E928;
	Wed, 11 Oct 2023 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618910E942
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 15:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAdR+PMR26oGSq/sTSGSMsqYa3FaGuKygHVSI7flg5y4XIcfrGyZbUu7uQTOmOsP1zqeLCla+S/rRlUul0Y+KMbYrX1PbweWvWE0SSElTla2qM8PGDSRw9fCnIcUsmAkox7J6oUniwKYjXVS8hVxbGUZh+r/VlG0X/eBgqHdfOMMWNpK66eeBiHfFr6H2DgcKSs8bRjRW/ghhRiI8Rtvtmtz3Rheris7x1QkoxOQ73jPHtN2LTNxLSAWVUSojFz93CmKCm4fi0eAPni5F1QzTea9pRcvMpPYaA5J+xY6MNukt0MlW6IKCbc1BGR1oUlcuVKrj803Ri7tubeknVJj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE16vw9VgEgpOxcE8Wss6/YnAjZxnvomVuTr7YjKjo0=;
 b=JaHsJlrn7FEohE3wVtOCvhJfSTUQjM0PITDtHsbQv3qK3yzIL/+5LjGPIUd0n/JMZaRlAHOYNuCmBm+TlXZrYrQVpVI26hePkEcVJmk2uAq7h/01OtF5o7Rmb+nOQ17Ul+A5lmhaVL25JFgcOHXRVjCbWyJ0JA0zoDXTegU6CNf5WGobvNJMW/i31Te93du/zyzSYQ6c8G1P1V+HskFN3alhySru0cJzJ27JuzPwb7blM3kVfV7Mdll9L0Xecktcs7PFKgz7slbIIA3fOqj/jIAI7ZFLF8YIsa5LrrjpVwaDSAo2hJ72pw2akN1RaiMTUxw20maRBY0UxxvPOrcLkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE16vw9VgEgpOxcE8Wss6/YnAjZxnvomVuTr7YjKjo0=;
 b=ATXI7ByOc0dlvqE3H8wSxLfmoOBcDrk0UqVzFJtumjaE0baUHhdxhAENZOXxLpn7AUcsD0ntw0ewAfMpGJczAanDv7DJv6bVwryDG0nESTy2xWX7q0O1DYwky5tFJBYaSZ++WelJMkr+8XyPJjQpGkpWrCKE5gbwt+2cW7jjjoo=
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:320::8) by AS8PR01MB7303.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:256::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Wed, 11 Oct
 2023 15:13:20 +0000
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc]) by AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc%5]) with mapi id 15.20.6886.016; Wed, 11 Oct 2023
 15:13:20 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ+3Oa23Umjg05nUq8U4rLHzRJ47BDMv0AgAF+mwA=
Date: Wed, 11 Oct 2023 15:13:20 +0000
Message-ID: <AM8PR01MB8045F549C8A65A853E214D37F9CCA@AM8PR01MB8045.eurprd01.prod.exchangelabs.com>
References: <20231010121621.3009154-1-f.suligoi@asem.it>
 <20231010161512.GA944015-robh@kernel.org>
In-Reply-To: <20231010161512.GA944015-robh@kernel.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR01MB8045:EE_|AS8PR01MB7303:EE_
x-ms-office365-filtering-correlation-id: ec544215-7d60-402c-fc8a-08dbca6c9acb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hENj7V3xKhaOKzeklH7qrXpIOl64n8rnMkyz83aTmUgNqAq3Tt/tmAkfe8eBI1RZfb6yEDxQgYv++nil4T7p/blCiI+2EaZUD4jBiWjLxHmC7K/1ORonAslcWMM52arxd3QFKIgEV0kOe3/oTzHsfXHJmxq4v3tyIMHT0I8ulHubzBpXL3sa/bv+IyQpcR5ntbxkegxo/Na+TkS43Yw5eLpnU1x28GjMp90GnJ38+7jkxj0+L/Ges4MohcvCpq56QHI+sGkHEG582+fgYfroWr/8K12x9z6/wzAXDCH1AmRvNFYy0RtrFG+AC2QhsT+RQrvoWd+BeVoEgMNV2vQnTw8n5sE9hyUfa/jTQ2FovoH1r1B96Ragb04oMRhUZwcxO5c0RVwafS1nUvB0+G2oE3HkmOxLda4YjjWbmwgmcrETdnnNkbT6iRxd/Z6U/9CnivFdCl06ZO1YbV4PpywHFZV0lyJS9p1niTzIkIC5PPN2QEzcahfK71yiAz6w/tXF5MiU4XBjFMUbpZrCKhq+aDG0bjHlk5o7IAviUj1I9BP3as8n+7Zpe46vdq1rRCg7RjENzwGNEAbzZ7BadLHP9PfaOQndYqNXzuM/ZEMMs3DB/PNmWiSTIOYAIRxkQbwt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR01MB8045.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39850400004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(7696005)(26005)(71200400001)(6506007)(478600001)(4326008)(76116006)(2906002)(7416002)(8936002)(66446008)(54906003)(66556008)(66476007)(52536014)(5660300002)(66946007)(41300700001)(6916009)(64756008)(316002)(55016003)(38100700002)(38070700005)(122000001)(86362001)(33656002)(8676002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iRiHXW67oFyMDo82nFwJfcKxp1Ua4gJCB4QM4iYMqQxb6+pZPZFUWmcvOwFB?=
 =?us-ascii?Q?FnBM8o77Ay9OjRSI1wftsS7EF0KsdU3AJTqdBLk8QTCX5+2eSGtM3ksHC9r2?=
 =?us-ascii?Q?SjCnkApjE6J0r4LvuaJ1CGjStWSHHOSA59HSjlUDgdRU7hjhFXm9fLM3q9JW?=
 =?us-ascii?Q?Xa5gU7PueeM/vES5Wx7XGKbX126azVOYZpfo7PW4BHCjj2UqRsWNuIMwa/0y?=
 =?us-ascii?Q?0I41k5kSiDYfG2XmHBIAKFo6xkerYQ2g3oXdNlZdaFp3YxfZwC3wUfJ/y+TF?=
 =?us-ascii?Q?3kyXRh+Ee9wzIUid9MvbMRVnWB2OL7PKmBi22xCH4nL6V1rTeTU0YJgxTk3c?=
 =?us-ascii?Q?01wP/FkbpbJlXAB8j1lp/85v305elPlerA9cRx8GKhXOZaSEMZ5Vuy5WEVUk?=
 =?us-ascii?Q?1yBvfrPqP9MrPhz2v30I6oHmvrDTmkkugESsHPRQRtjOwPysFjCi6HR2ESB5?=
 =?us-ascii?Q?6wrUy2VKDmxFbunJHgVAxl550HCs+9USF0/ZyJhxWPBNpDyQm/s6fy4mDYbM?=
 =?us-ascii?Q?mYh2VdjU/89AuLZ2CcVA7FDMMrdnonheclTdwjNkLvuUoAv99gU5g/3WDiwL?=
 =?us-ascii?Q?mk8T4MayvAw5o+Sj4nniQH5G/h6JSOpVrzf5DnN8asXnrkowRE0cZIaZom2Y?=
 =?us-ascii?Q?G5xYJKQWKLN3qY1fV+/CZRVWVSuu5A28RcL+e9mfsopintxEQqbgUJIzAtbA?=
 =?us-ascii?Q?LaHT/VoZcA3bjbOIr024mvW8/LKuMQM4XXDqYpABYev81uiUS86U+GxxTIbn?=
 =?us-ascii?Q?MIGpEFY+b009Wr4esnRf4HWhnmn630VOj0hy5Is54Q8RTIoI/U5wXBmYQRIx?=
 =?us-ascii?Q?+ivQKIitbSsY8mynLtdfG1gBQ/wjy8kWqZnq5sygOhYzn6hBJLsHptnCoV3v?=
 =?us-ascii?Q?E24lVMkD6NXIDiDE8tTdCdmLdQCvYDahAnwoTuCLdd026wql7FZbJQW+Mc3/?=
 =?us-ascii?Q?EG6TAJU0+piyT010IQaVN6FEPojWFSBG9J5l5iAYQiT9/Ufe4uP3C0j0DBmj?=
 =?us-ascii?Q?TgVNq2vZOI7S5Ad6mVbnqSlYo7deIF1xfWBnk5Z0xdtVQEFeAPjX7jhYOFsY?=
 =?us-ascii?Q?5pH82WKkd7cStl6xHaoaI8tcIkvCH0j7y089ZvNYwUKDdA/B5gB1zhS0yHPj?=
 =?us-ascii?Q?BV8ay0cMNny//5qiKJUVtILKKOkBaMC1J+Fm/UXlc5PcqURc10C1Sw4SDhqw?=
 =?us-ascii?Q?b/L77iarxCu/WTu0Wwf9pZ0DX7T6tOcP8aar4/vVCRAgt2VF1zt3i1tdqhXG?=
 =?us-ascii?Q?DKjTrmEy62RLFM/wEw2NvypvrKWRbT2B/cCa8gSYwZ1tisohdCF1MUun5Vx3?=
 =?us-ascii?Q?meNC4h3+d+HgSQwJ/DtuhniU+V8iPKCWBh11OpacITBwMddYj3P5NBS8zikL?=
 =?us-ascii?Q?TkguwhPF2meGs/L18IVxKxLZGoPai+LAc2I25Km+L9hiwzVUF3Rs7Kl6SCel?=
 =?us-ascii?Q?7WWYr+e0X4Oj/dWRJQiWWH1pj9ONbiIXDfZEQ6v4AWodXd6aBqWx5xtI0OdD?=
 =?us-ascii?Q?xZnMBIJY3q1nb2PNKzpkhPjDgHkToDRjKwVo+sYsDoXYL80eCx5e1cUrm33q?=
 =?us-ascii?Q?dJm4Pcpw7Ywx6tzstxo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR01MB8045.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec544215-7d60-402c-fc8a-08dbca6c9acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 15:13:20.5279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZMpIb9arJe8PT9YSRVUuv4+CGg2KpEXs3f/4DdfSV7+O0KB38ejxdD3aTfzG0uVx9eajuqkECuyK/cmYz0izQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7303
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

just a question about led-backlight.yaml and pwm-backlight.yaml
common properties.

...

> > +
> > +  brightness-levels:
> > +    description:
> > +      Array of distinct brightness levels, in PWM dimming mode.
> > +      Typically these are in the range from 0 to 255, but any range st=
arting
> > +      at 0 will do.
> > +      The 0 value means a 0% duty cycle (darkest/off), while the last =
value in
> > +      the array represents a 100% duty cycle (brightest).
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> This already has a type defined. Please add it to backlight/common.yaml a=
nd
> remove from led-backlight.yaml and pwm-backlight.yaml.

As well as the brightness-levels property, also the default-brightness-leve=
l is in common
between led-backlight.yaml and pwm-backlight.yaml.
What do you think about removing it from both led-backlight.yaml and pwm-ba=
cklight.yaml, and
moving it into backlight/common.yaml?

>=20
> You say 0-255 here, but your example is 0-10. One of those seems wrong.
> Anyways, don't define constraints in prose, use a schema:
>=20
> items:
>   maximum: 10 (or 255?)
>=20
> > +
> > +  default-brightness:
> > +    description:
> > +      The default brightness (index into the levels array).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>=20
> Already has a type. You need to reference backlight/common.yaml.
>=20
> > +
> > +  mps,overvoltage-protection-microvolt:
> > +    description: Overvoltage protection (13.5V, 24V or 35.5V).
> > +    enum: [ 13500000, 24000000, 35500000 ]
> > +    default: 35500000
> > +
> > +  mps,no-sync-mode:
> > +    description: disable synchronous rectification mode
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        /* Backlight with PWM control */
> > +        backlight_pwm: backlight@17 {
> > +            compatible =3D "mps,mp3309c";
> > +            reg =3D <0x17>;
> > +            pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9=
 */
> > +            brightness-levels =3D <0 1 2 3 4 5 6 7 8 9 10>;
> > +            default-brightness =3D <8>;
> > +            mps,overvoltage-protection-microvolt =3D <24000000>;
> > +        };
> > +    };
> > --
> > 2.34.1
> >

Regards,
Flavio
