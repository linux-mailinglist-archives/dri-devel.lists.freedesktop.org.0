Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574067E9FF2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 16:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE2010E3A4;
	Mon, 13 Nov 2023 15:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959C10E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 15:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA/VJl88DZwKdm3pCAGKxOX7rOZ4A/9OApxAbJWax2VHHKP02rRE28n5mao1UlLI+HBf18jde8FQIr4KWPJJF+/VBE4cGaEkQlhfFyGaFjw1N9mVUkO48brRg+M/RdNp3Ycwj+Njit0OnN8t4V4/rypc03T58BCbUymHUT8tIOgwpDRSWzKuvHqHs9KSYoKFIkSUtNd6qFrUmX8MnyT77N5Q5zvrKJvKihCaGdjGlt8zr+4zOTWAc10xosfxkXKhYPDR4z+VkWF/UgUqkvH90Bq7JnRRrLD3SHjJTcxck/0VcAcwKbhrbV7uvAw7/KuUxMvJm6dLEEHrF9ByQF81/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0MlfuBB+MLJBiDVU4CI1A1crr2MlgxFkKLV3V1dQGM=;
 b=kUu6lLyMEbbiTRzrrNgRcdR2rxpUbGIy3kH15Zb5BWY6wYv2ixDI8k0wpwNS7N+oS07iCUSfyyqKQyO+G8lRTsdVXmLg/JQpAMK1TIvO2nj0R/CAPztCskDR00FzrGO7I2hb6pICDb6Yh1bVKCPfLRF6BDqBss6QWT6fl59Hz1ZwoftcHbNTFCjf6xxk4RfRjV7w0FUUwIuvFadcpaa11T2wxSHwWPoMvYj/LBrvBbyGYV8BAWCGz9kw51rY8BwkkS85v/xB78WyrOK1NhUqm9UICefekofYh/6/QFUCKcCa99Jt4QBGPXppDaxmTtIBMTleQDDx2LobnjzgrY39uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0MlfuBB+MLJBiDVU4CI1A1crr2MlgxFkKLV3V1dQGM=;
 b=nrriZxODIY7GzblLr+veQRRhwayEwJhjWsg4SKtbAqIMHWEdw6KGwz0SRXiZls19f3Jf44HWw25picGtYkD7eTSgL+YZy354radjZNIjqAlq64yUspq8GVQdvPEGfq0PRVajGJksFvgDjB8uVmwKxf8dzxLsY2lZF8OKMsBLaww=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DB8PR01MB6344.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:147::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:28:39 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::d8ae:6d5c:e58a:4bde]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::d8ae:6d5c:e58a:4bde%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:28:39 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v2 1/1] dt-bindings: backlight: mp3309c: remove two
 required properties
Thread-Topic: [PATCH v2 1/1] dt-bindings: backlight: mp3309c: remove two
 required properties
Thread-Index: AQHaB1sRp952fwBA70CoTkMuqVZuwLB4cOKAgAAMPwA=
Date: Mon, 13 Nov 2023 15:28:38 +0000
Message-ID: <DU2PR01MB80344560F5D4E94B47146D8BF9B3A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231025155057.886823-1-f.suligoi@asem.it>
 <20231025155057.886823-2-f.suligoi@asem.it>
 <20231113144343.GA264383@aspen.lan>
In-Reply-To: <20231113144343.GA264383@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DB8PR01MB6344:EE_
x-ms-office365-filtering-correlation-id: 1746df58-ed7e-47b9-d9b2-08dbe45d35d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2di5klkXn1OI+l+ejLQAzoFA2ND8Ov8L02Zo+dRwrJtYtDmD+EV7mUqhpA+6EhyHmlbAZmaKYlQmnsTVsg9V0GWmS+sVBrQqyx0cPP8eQnkoCMl9qQRVaAdvhUnpnTJk+AMvXVCWsw//Rejm7kMElL/6erYUV2k0cZkLsy1maI66pjRgulzrlmRmE2Pz+MkaZWFGankWOcKhqGDTnEJDipCD96BRFj38jbJaqvZYGxFh1A4bEof2xrqIP5Q0VP4MyQbhtYzCS329NI3mnvjATVAQADU95f/srE7wGPYTP2BMA6kSQ+fVkMJFKsI3ElsJ+gZh5ph8lVHz7T/4gHEaZV6Z02DNzU+vczKSMUVu0GnnkDibyeaAfHRW4IUnC3Tlc8OuLAANzPkNzybDMWh2EwcafNiinFnVqrJo000+OM4/Ni6uRV67h7Ad9rsQ7FTAvQD9RdAxqNwKsNoOs/EU5Ew5b/MKMXMC7MTLaT5gFLEpAewxqi7vtlitmQ5JysldjrVH8Z51k8Atmym5jdghkFPi0XE9xfCdIb/3JUOlMe+p06/S6zaB3z7tG6pOfoohuSMLjg/C4TfxyHTKd5ZI0ER++2HEEXZcYYiZON29ahtndrGGyFrJxp8S9pXo+ye9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(396003)(39850400004)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(6506007)(7696005)(71200400001)(9686003)(5660300002)(8676002)(52536014)(8936002)(7416002)(41300700001)(4326008)(4744005)(2906002)(478600001)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(66946007)(76116006)(66556008)(122000001)(86362001)(33656002)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SsGD1FuAsN1t6LTxVjb1BHHFMqCjjVu2dfSgoWInerpP8tOD1BhFdKD9Wb20?=
 =?us-ascii?Q?UQDf4qw/u1I/lkGrAlNaDJFfswQtN0Rev/Ua3jDcw0W/lfo5Oy7n1nyDZige?=
 =?us-ascii?Q?kcPxCqQtdKi8J9/xRuItvGHDZqoKQ4UECLpYVzJ9D8nRXPDTUcedEXd2Hthw?=
 =?us-ascii?Q?CTGFOqQ5pubxnlZ9KWoLVbFrOyUysebHFUMKCPi0lY9h/S3ZzBqHOmYIAEbb?=
 =?us-ascii?Q?TYwzAfeCCRqtjsogJ+jhxRYOExUdsWAnnxu1oi1tXpy5eIfURUjUbt7tRQab?=
 =?us-ascii?Q?N2+1RodsrlA+CFrezph0hHbmQZ2olUkPj62efhXHvtAvUUtBQ7WsgVP3XT6W?=
 =?us-ascii?Q?8Sn1cWvrwUbkWv7/e8p+gTffb3/eV4wb21sde4RaS/VivhEH42E0PYyIu+BU?=
 =?us-ascii?Q?R7ltuuc3EX1307A5DGGbwXXT/BehHvc9Snf9h4o9byj+TozvM545OEG7NBqH?=
 =?us-ascii?Q?KKpKlO332h44uuD87Mj0DN/DKqX2xtLV1TTH471t0mXHSoaUPTWuaiM7AoLb?=
 =?us-ascii?Q?h5hdUrq4rS1lmYPRIDCdjc+qK9NO9xlVbimLw1zN+prqyZhIZyNtdZgJNYac?=
 =?us-ascii?Q?Rstet84D9Sye7KyyoqllK5u2slDuYOJxeUiM+TCz/bZ+uevfiQGG5J+sllWd?=
 =?us-ascii?Q?1AzdWX0w5+JLxWn1pYvtCN0lw4OcD5l6t30NAioybygTa5pbObnO3UdNgLEz?=
 =?us-ascii?Q?Yaku1TMJDFL6znF6uTv7b+ep1gqacwLbwB0sVuWqk1a++D8yvafK2XTcTXcZ?=
 =?us-ascii?Q?YKMgFZWrsbwPx3oOZepzVv97dIuQg4D4hURZt0AWbXr9bLy6sNznVnFDZibP?=
 =?us-ascii?Q?8gf3kssnd2cCB1RF8ngZzQ53RiYMoNFkLLXBNG6zUjZoF7KlD5BNK0q73Xpx?=
 =?us-ascii?Q?4KeCys4gbP65GYGc0WW4OLkyWrk+YGW6VWvwW85pEwvO0kv6y4YSAM0nnXVo?=
 =?us-ascii?Q?chMmzgLIIsavBNMLS1tc4MX0UbDqy8BcvKP4E1YC234J1rcU7FJ5YjEwUXGA?=
 =?us-ascii?Q?JLJLmInyXDuUk4UISAACl5024u0ok4lcqP7xjC75EC1vk63dn0nirPJe41Fs?=
 =?us-ascii?Q?ySEA9w+G23QCB/0vc2+EkfUH2xdI17GspOseP5jM0nO9bTFi6Lm6DKM8KBpk?=
 =?us-ascii?Q?IpMnj0+tslbZYh3s5yJGrU46IJpMyidHunn/AGDFw28pC+35H1GdyhwDUz2Q?=
 =?us-ascii?Q?K2FvMBdP2lfF3nyNIH8AL/O2AO7mWvABibJENJkZH2r/0oZyWbqzZwF+K5JW?=
 =?us-ascii?Q?jipstqYWkVDxqh7atPNMXSLYiOwEBMjBcqmbkU8JQ87Ow5nT100IBIIjmG70?=
 =?us-ascii?Q?3BdlYYUdKOGoktmreH0Q4Y6Ppz2/StAaMJe9Aq9IwVMJ4VT7LiyQMGYHx0nx?=
 =?us-ascii?Q?i1AprZks8Yg52n13oZe8or/x7HjSGUdHCAfdFVPF2/e34oWO5wTo9i25C15A?=
 =?us-ascii?Q?5ykB+e7Ov7yMXt1DPcl3Ude5ZKKJSSFUPETPmu7Cxd4Cx8Cug66R4Rqgy+ng?=
 =?us-ascii?Q?KKduOa/hSXJk6AYNanZ7tu+FlNTQBZWtD/a7Q3hK61lfE/awCpm4spFrNKqw?=
 =?us-ascii?Q?UJ32XMOYL/s42SNy/os=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1746df58-ed7e-47b9-d9b2-08dbe45d35d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 15:28:38.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1J4hb4bozbT7IbrROU+fwILtw9ity8/6v9RcVphdkxNKgz2Q6j7MZPCUv5/6Umk5VJzaCJHDCbw8Zv1hkfwfzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6344
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

> On Wed, Oct 25, 2023 at 05:50:57PM +0200, Flavio Suligoi wrote:
> > NOTE: there are no compatibility problems with the previous version,
> >       since the device driver has not yet been included in any kernel.
> >       Only this dt-binding yaml file is already included in the
> >       "for-backlight-next" branch of the "backlight" kernel repository.
> >       No developer may have used it.
>=20
> I'm afraid I got confused by the fragmented MP3309C patches from all the
> different patchsets.
>=20
> Please can you rebase whatever is left on v6.7-rc1 and send a single patc=
hset
> with all pending changes as a single patch set.
>=20

No problem, I'll do it!

>=20
> Thanks
>=20
> Daniel.

Regards,
Flavio
