Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AB07A5A63
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8953B10E381;
	Tue, 19 Sep 2023 07:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133C10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfI/AAH6jP/qdtxhIEsF6DfP9W3QsBHywBAE2gNOAbCpoQ5MkBGa6r3RPYOupU2/3KyzfyRvve1eppBZeCrrcwsLVKMCgpxFFC4NQWohHaC68iFx6rzWpjs+sW6oFHuDFGG0qtLrLrKmvOckh1AanooQeWV+8voQTd8aL8QSWev6zwDTOSS7konxDoFyhCNl9o6AZVMkcrInyX/5h7rl9Iar25wUUMlRXHYy3xd9vI4+p+UeOW5A/QOSLXFu+4KDR2YljE/h1M3jiY+y1/laxtGhtQbjLRDuOYL7xLRBYFpSMnEfcmCp3I/v0ttO7xvwfJjF1TedPVZp1Pa8N4bp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=simwv9Z13cpvqGyvF3EecEfKZD5u4ypRhiJMDTXPUPw=;
 b=NwAH2qTz+9S3ntb7CwR+r7FnCVrELiXSoo7X13RRbWSlXt5n6xFObmPsX0xgpf107defQr/x1XCFHxUmiKf51NG7Mo9GQ9wIzyo+7niHWFiTU20U1wTbaThGNylMsRPMzbSfZ5nmRBoHaWCzFuRStGVdvC12z7oCZI2PERyDRgc8dITMQo/qGHiWAJkEnwG0AOKxNvzK3+BU+PZ9LrvjciXXHYNdzoccNuMFaHIG1my8o0kc0lgFuPHinxu2kLESvPz2CX4HNyIOWF5EgCFYZCVbC/m35qM5DCbZuA48kHOAY/X4U0+umdMxgfYAp8H11G+Uzvrfav8/KpY2QrOfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=simwv9Z13cpvqGyvF3EecEfKZD5u4ypRhiJMDTXPUPw=;
 b=K8aA0Rpa5drxITo76i9RIU9RfmuFdBJImWWaapl9vovEibIfPY7psbwkE5+osh2IWycVlKtqxbaUgcgYXByTNkJG0oXBXG5kClWL+dCp09+8agjlBUkKL+SV8/jlXm4k7YV+/9dQ7ofBJO+DTHSRtdhNuTUgqPrcTSOteHwdmcY=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DB9PR01MB7321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.13; Mon, 18 Sep
 2023 12:30:51 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077%7]) with mapi id 15.20.6813.013; Mon, 18 Sep 2023
 12:30:51 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ592r0UV0+OQAK0qc65NPyGpwxrAcCHeAgAR9mDA=
Date: Mon, 18 Sep 2023 12:30:51 +0000
Message-ID: <DU2PR01MB80345CA8F7FD429BCDF126A2F9FBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
 <20230915154841.GA3776155-robh@kernel.org>
In-Reply-To: <20230915154841.GA3776155-robh@kernel.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DB9PR01MB7321:EE_
x-ms-office365-filtering-correlation-id: 1c5fdce0-dd94-4c59-5f4e-08dbb8431844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GkPIQts+Y5UNnWEutP+RXsK83O2G2jbjX6cGxSX3HQGH63+aTe/KSU2i6FjH0kd98S0/6o1r/491JFC0wEdmXVRhTQr1s2+LsNU0okg+JdkM6yTdJp/MJRMRrKAFX+g/F6A8YiMWscbF7S3y7dYkkfhqmDIyH53X4MxsfSWefgNru4IMRebWhmTNYLHREx2bO7Z92JC1fwGBfj2BTxuGPGQdlIA+yJoOzN6B+T8UtpQP7beMXU9w2kLB6VT2+jflwn1MYeAAfDn9W+GoHvShMLatYHTGqH7+uyXZS1So/H7l30SGt0YYgLo1AIAApXBSoLJItH6rr8szAY39lbLdvtoedwHW+JefUiayowmz/bFLSjmv5Obtj7xELzl+Xx8yG4fMELWzYt4uzv6xid7HnFiBan183vt+kOEyyhFAhAEACJ2eEdKFJSvRnCx3Q9By0m+6MeKXrUk8a4OLpA6B1xXN0gLT6HlaqMNWeAiDGTVrhrEPpkL8dI8KwdS+ijOrq245TB5Pmhu0nR3ZJYoawArjSPHWfzGuWgjcJJUuMB4n7N2kjMStjXLoobc5taPmKNEXaTG2FS1HYcfmUSB6y7T4zyZGU6qqs3LEXsQ5llFAuaK2pr1gVTGtviigsWGB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199024)(1800799009)(186009)(55016003)(86362001)(33656002)(122000001)(6506007)(26005)(6916009)(2906002)(7696005)(9686003)(66556008)(66476007)(66446008)(478600001)(316002)(54906003)(64756008)(71200400001)(66946007)(76116006)(7416002)(5660300002)(38100700002)(38070700005)(4744005)(4326008)(52536014)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TH+1buKsDFoLis1ogKWdByf1RV61r3vHBdxkDZVdT9OLqhX+HWauXFOsheK7?=
 =?us-ascii?Q?Zgt4DDYeJxzjO1IWuEONhNfygYfaVoEeAvRXHcOGhH82k2hDB9CufOv/o8ta?=
 =?us-ascii?Q?R8RqkbPcgbKanFk1ukJQ7B7J+eAaZ4CgNVz/oniR0366PZPrDeAS76D1W7e+?=
 =?us-ascii?Q?DolOW3I5Dpmky8Jx0lZcKetUyATZpFV+P6F+jI58fkVVIflytrLfQZDVho8L?=
 =?us-ascii?Q?dKsZvmQXSlNEnLRkGLfhiqVBwmxq0HPiDtDzp5W0ls61dsj3HlMKK/ZkhQO1?=
 =?us-ascii?Q?Kcqv0xe/ydlsT7+JTRn4djjmURBknNGwpt9DtpbJot8eN7zNqYUK/QwGzJTi?=
 =?us-ascii?Q?ryXoBCa5FT+gXTczaOO2EPBonBACdaBDRMXeW9SaRBkuXOpDoFmS1yW35Jk4?=
 =?us-ascii?Q?+fWvsEW/k6az5e/FJ7rm3L+0dcAFn/khL0SO80+Gb5+tZug2EIR5nGV7P4PO?=
 =?us-ascii?Q?db0JuHJXyHMqajDLsZClzTkhHyRtL9tEyL4X8+M4zk3xO6sltv/+EgYwwtN7?=
 =?us-ascii?Q?NblMGeQNx7yUk1FpK2lwDpARMJfxNl3VKNXRkHx4NgiYAoq13z1glyLQX9HC?=
 =?us-ascii?Q?xjhk36CgI5u7vwP+uPNIXySXlVvl0WBNcjXtOEThGhb/3P+WqUiOE++qfEoG?=
 =?us-ascii?Q?gDsrpAHx7/2IpaC+BjagfEqeWFNA3jMR4o7BHNFEk5p41Se2Hz1VBGLLXcS2?=
 =?us-ascii?Q?ap4WhqJUm0YYdmAgSwvm1I2zldnVCI6BE6ezK+WHarDBU9IqAZHko/ZZMW5+?=
 =?us-ascii?Q?LEPSJr08SWuK5lruXIRsZ4OJSi+q22NvlAyZirvnR5Hro8rVrKj/ltRqOZrB?=
 =?us-ascii?Q?C46ll033au+tATrqNB+p2XHMySGTlBYDIhdrcctNTbJIffZfikeW2Gbp13dA?=
 =?us-ascii?Q?QFM9LEUbmvUU6mlk2L9+LMJhIy4nVi/kN2LMAQUSkdMKWmmb7TCIPNWXqFD3?=
 =?us-ascii?Q?nq2hq3cp4xaUZdKhG13WUKuyRIajhfxA9J2+bHv5Z5y8Hl0Idn6GqvaZaBbV?=
 =?us-ascii?Q?ngsG+/rcMwQx+NpBrFKhTGWPrDZr/Al3DUOlGzOT7gZej66/A6Q2FXvapvZw?=
 =?us-ascii?Q?gv29A9REygewnvCt3PdtNUYqbyZQ+SfuPBf2JktLqlKg5cGz9XDWJgK3K2fd?=
 =?us-ascii?Q?QApwtEutWPTlMgrymhBYjFRfzX88MbauRiZcZu3pGkZChBTEP+yecIS917Ub?=
 =?us-ascii?Q?OWwNaMD4lG5S7UGUnp9qWdzZWtHRal+RuPdnwp4bEuc4N2JAG7ca2DFq5OyW?=
 =?us-ascii?Q?tVslhlcUC/H2iB5AV8Ea4CgYZwrnP+QLXoEBXdUrqQAX1GgXrkuet6Va5n9e?=
 =?us-ascii?Q?XPS3YshLnvp1pXtPLa9mFxVzXiuVd2VGIw4iahl97tWqfA0iKG0IYnGiBpnQ?=
 =?us-ascii?Q?ZomIPGtn30Z6Q5t1g6QArdsRuuuHOzm4qOwlC2SGrd5vUYYzo6Zvq1N6Cp00?=
 =?us-ascii?Q?CLwuRWetEHjHxfzevas5J/wvqyQFKPA3fxdgj7je9dKtgNST0KPelCzgsSid?=
 =?us-ascii?Q?I3BNVOyolMXNkiYGw7V0qlyQ7Zipj6zjMtbndOhwtGGfpBOeFRI6FVM/bmjV?=
 =?us-ascii?Q?wiGWINwY6dOZ+ef8mAY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5fdce0-dd94-4c59-5f4e-08dbb8431844
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 12:30:51.2434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXEDU6wPZFGtmdgxjxXhGJZK4HQKdMANJF1Zb7e1E7yrKh6KFUQ780fK05juJn+zGYPMpgRJY4qLbh9+Ipb0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7321
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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

HI Rob,

...

> Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
>=20

...

> > +
> > +  mps,overvoltage-protection-microvolt:
> > +    description: Overvoltage protection (13.5V, 24V or 35.5V). If miss=
ing, the
> > +      hardware default of 35.5V is used.
>=20
> default: 35500000
>=20
> instead of prose saying the same thing.
>=20
> With that,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Ok, right, I'll fix it in my next version.

I prefer to wait a few days before sending the next version,
to wait if there are other comments on the device driver file as well.

Just a question about the procedure: in my next version, I have to add the =
sentence:

"Reviewed-by: Rob Herring <robh@kernel.org>"

in my commit or it will be added again by you?

Thanks for your help,
Flavio=20
