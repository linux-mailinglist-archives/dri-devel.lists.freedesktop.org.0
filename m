Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A135814A34
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194C10EA27;
	Fri, 15 Dec 2023 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED05A10EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgLCJFO8EoBxkr5VyB8C+3vNGHArmvv7eAgnlXHCCvysfiFSTOdlxV41YZA5mVYgaaPK8af/4IZeenH/ckYzOjauzmCfVWtdzWKtrq88QCN+qmaWcSLv/aeKfIR6CnntDlYiI/1joR5WbyYpWA14pO40Z0g5fczOyAootd0OjjbEWehyCRFF5y6YsG6M6TegQan0h6ykvshZhnihAAg86ld8r8MgnGMExDYUeilJW5rHze3nghStbzMOlyZTTz5IJot4jF5pELaZB+SvHknlW3jgCIaGs6xr0PBFGxJw9APh65K3SASpkwhjF6U+Ls2u/uJSUKXcwnPblqEVsr2Rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5KJhmX93bxJihopK4b8SHLhsw7DgdumfMQkZyFG26E=;
 b=LvppE4ESrlnkEfkl5Ur3vUqlIya6HPPVNBUHYD6v7RKa+KU14G6baE3orDeJDYmQV1ICEutWhulOKVx16rHAIkS92KwaU77hC1qwFz4zYQz8MqecvNUZ6XpQxe+Gr09fOlxIgH3T4fzqDFiahz7YaeWLRUsiXITm/ePyR1riCzLLaUxTaBXlvRorWNHOqN6ZjtsQc733aDl8KbB69MM91X03QOTTNPn4zHfOk+B10RtWuIMQyZeUWOhmbv9LXHPfMTBZTRsfnCpTmu3Hd/8e7pjizuNLebNYmEw15pOfRXKGmy3q4mUbIoxEyWtQWjhD3iRQG1G+Kd8szeQAXR1tNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5KJhmX93bxJihopK4b8SHLhsw7DgdumfMQkZyFG26E=;
 b=j70Pf6hISH6UbVEBXvAoBuLdqlUCKqg5zQpfOXhJpg6Kd4HnxMMe2mPU1ivfcOPwUPtA0HYyc5xqD6s1jLiAtyEB7UPak1ITYnxq7o25tDYAftTmwchapREbjOxMjaMpnDpKgRi0HAm6F3MpPqeEm1I5Kg4LoGPkCQtjfMhvyfI=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by GV1PR01MB8642.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:29::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 14:13:59 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 14:13:59 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1 2/2] backlight: mp3309c: Utilise temporary variable for
 struct device
Thread-Topic: [PATCH v1 2/2] backlight: mp3309c: Utilise temporary variable
 for struct device
Thread-Index: AQHaLscI9ZCApgcilkGwqE8DaiI+jrCqZCFw
Date: Fri, 15 Dec 2023 14:13:59 +0000
Message-ID: <DU2PR01MB803426437D36398F6051BB4CF993A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231214195158.1335727-3-andriy.shevchenko@linux.intel.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|GV1PR01MB8642:EE_
x-ms-office365-filtering-correlation-id: 9e9fd8b9-231e-4cce-d52d-08dbfd7814ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RxRSjKSfm2gjJSxTtqF3u+BD4Nh4TcrIFzl7I8cWJ2AYbQ6J6d0XBbTBfmZomBXSB0Qwu6LPEzh9IIGj/M3RNfLcgkkncfB49SRF9PTy86DdDtBDjLuY6TkjsnxEm+u8AjDFec0BnK9ldAFGyfnL4llpMboJuH9VdNm5zIqKJahkLTsqOLJ1zAkW58+RUrcnIE5HzAhN+vREHaYMykbck7KepcW0Qa1OvsIqEkj3+isLq0BotufLRxzTdHcVPsIwgEbRDTRwFTeAxhMxuzBPTLjfEXA1Qg0zkYjnwgDC2xfgEZePevCUys2cJJ9pJBHWMKyoNOMZ4h0qPkLljLWqCZrWCFJwHcwbs4aTZk3pupF5oafjsbg+/bpbQkgXaOrKbMtZLsPT1yYYZS0c1ji7Pbad9up/psLuVfWNq7x73mnYpN2NqrMO7TUZrRFRcSeJhaHF4F+o3mVyZgd99/6Y4JUTWC6HSr83IFvtRw+xlq2i8kD9CZ8Ptet6ej1F5fGkgmhZHbWYZ/DQq3mq5TA2P1vTcYISzgVJyfs8ys14zAjIyZOF2l08kQGVG300ckSxobJhmRfUbJwJb1IoULWXFsIm9Olq9QsKha391ga7bWSUuo2rmivMNZ0xNJJdOHEe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(9686003)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(4744005)(41300700001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PMdwePe9i0C1wvfnrBbIPcmatYv9GjLh1fN3inL3NEGNdidznb1/IMa+y9eE?=
 =?us-ascii?Q?qg08BtdEHMxMG0Ax3FDVwgMG7V3j/qPwaxOGz69bPtFIQkD3sneOoz6f4G8z?=
 =?us-ascii?Q?ScAl9+zdejTNuSbHPcO46jDcO6I7MEPsEhEy3kDbj8apoguIW4/P+jZv/ifE?=
 =?us-ascii?Q?fIadVpiA0XL74CpEdo7EnPNoQ3MamecIbqzgQY5ztKoZpXcNJwGsdBEOZGXK?=
 =?us-ascii?Q?Y3mQoRqh9TGy3qMan/NDhSpZVrw5x5iveiLmYqm4C2sEw/V/xPt4m08eYJDR?=
 =?us-ascii?Q?N9B4A6yjXoLOjgFF7cwWyunVF4WIwRYjejb5iFWU55h9PNiCGcyvDyC2M4em?=
 =?us-ascii?Q?3zXoRF+wj9kXR1FVspw7hop/pKo1W91YPRzTnjE+er9dduTURaFKudN2J4KV?=
 =?us-ascii?Q?S4ZNAc1WSw30yOnycT0PL3uXiwkYfNcpCNSI22atHva/5CQPYljXaI7qQFgW?=
 =?us-ascii?Q?AHS1m/aclsBp0AhiTkuGyCUx9zJmoOTygg1x/4bqnYbdF0moNIucHU4AjBP1?=
 =?us-ascii?Q?8HPqdX2oRGpAODUskrzSTCdIk/JPS2J3Fbv74szybEVd83Y6NGnLjgGyGtAG?=
 =?us-ascii?Q?f42KSAYUX4IFND/gRl5Dt1tbM/U6ccfXX3NqtljExzdh5AcxFfeYctLGM5M0?=
 =?us-ascii?Q?P3tsI0BweRNrLm8YcbfE3J7IhlGx4ntM1/8eqDJs4cq+lFpZ9GwX3DJKTstd?=
 =?us-ascii?Q?NKrxJ151yFj2+btLGs5q8EySuL3sy/dcEgqjEOP6EYuOy3JvX027mkNfcAhB?=
 =?us-ascii?Q?VF5BqkFqMvSKb+MFgvqYeWNn3ssmFZuso68SloSCbKFtYE4Da4jmel/SU+Rs?=
 =?us-ascii?Q?KVvn0woMwner1zF6OxqeTSt6zvEamLfPQvZpYjjFH6rDnv+lkradPcT1XLcL?=
 =?us-ascii?Q?9e8QjGxVvGAI5/23GLA0zaZ6XeIheBYlvQ65EhlRd4roxMj23QFoKva7VHuz?=
 =?us-ascii?Q?EntTTvr13RcP3wu9zZ4/cF3nR3fN3yWCMZGq01r7G8b+Y1myvt5FbTj6jEh4?=
 =?us-ascii?Q?HCv+AeBF7WJ/E/1X7Hfq7Vxjck1BO4JJHs5rTW4t7sG1oag0DAWssNkNQuQd?=
 =?us-ascii?Q?WbQDhlMbTOEwX9LaeO8tdrE8vAefdLJtXQit1taoKXESbr3re9tRD1sMqFKc?=
 =?us-ascii?Q?/DOTOIqf3Ky5DVMnphAxS6ugu2Tagz+gUSvxcetWjj3lbb3jzXAdpSFpXxg7?=
 =?us-ascii?Q?NpfE1Bnxdn1l6KBr56gcAS4ADdC4Gg8MDpPBOsncyBHKZdDCgLe4jNZmYQ7T?=
 =?us-ascii?Q?3cvBl5ubVopt2AiqpEUl5dDJd04Yv1cfQHosHsbYrZuedhbbbxZ04ltiKj61?=
 =?us-ascii?Q?Iw36z3M+st08hsGoSxBdYRXTB83ZxBYh6de9115/koS46HhLGayHL6AkRICM?=
 =?us-ascii?Q?axHRp3/PU1PmGelNmplZ/VQKuyCD3GMemC1rZ4nbkYGidpnlg0SWT8ePKELV?=
 =?us-ascii?Q?syGJddEX1xMQXKYdVte6VtJgTuJAfVKIZ2SMHNQ8fupOTO3L1jWJtAgtKgq7?=
 =?us-ascii?Q?A5cAtF4HPJL+tdS/ybixYL4uv47FnUrEUZjo2wX36YBUlTrR8maLwUGUUZoY?=
 =?us-ascii?Q?ln1NtJBZN0M5FeO5th4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9fd8b9-231e-4cce-d52d-08dbfd7814ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:13:59.1606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihjnoyqW9T02qnQNOU44VhAZ6B9ypL5KugQY4cEKNxW3g90bx11Irzr5VJiuDWiSVf4GBQ9WQ3Z9ncnHVHEr3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8642
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH v1 2/2] backlight: mp3309c: Utilise temporary variable
> for struct device
>=20
> We have a temporary variable to keep pointer to struct device.
> Utilise it where it makes sense.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/mp3309c.c | 38 +++++++++++++------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
>=20

Hi Andy,

I tested the patch in both pwm and analog-ic dimming-mode and everything is=
 ok.
Thanks for the optimizations!

Tested-by: Flavio Suligoi <f.suligoi@asem.it>
