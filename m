Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211D7CA41C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBB310E16D;
	Mon, 16 Oct 2023 09:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA0910E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYif76GUlfFPdbKcWjGGv99yO/olOarCig61t7/M7lc2SlTUHXBPdm0CxRhR+1SChdJBwsLsJZIbUonA++OaRgPIr0SApH1+ZUebOBmbwT+penCYTEpcNY/q1z5OCcp0FXrlGIneqR2WmKF9y4GtrBDCNN5EPcm+DhiZjlFkjKimZ+ahpLuSX+SUEJjqaTydG2QNsHzO/dWMco677DJneVNks7j0c42wzBr25O+gUXZxHNpstlxmMEctfZIOs0dlz0C++ofAxm66CED1WQbsTtZmSudSJlFoUffZkcr62HnFShz33/yhNnMuXB5kJtI95Fq5IHUTAVSRQTS0osJ7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnLNj9u9+XtB43c3AqJSUZwmPGom1TogTW5gtfZ+GUs=;
 b=ALBCHDO345rW5YW8h01G6jb5TQeLns0OUesAUi6MTxuY+ZiOL8rUDE3u6WNFQeG7T0daXMDaPSXkTfn8PNZil2Hn2qkQM3tdMLMSivn9+2TMNOsTJ6fuose8KpBTpABADKxkq4eiEoH5rapCqKUK71ZjVvilUx78sK2lFoAzzMsq5Qp5IceiTBgEmO7R3zeWddMc1gpMyFeolwKVEFbNeK56DChc8v+hPBC/cWFmmB2EidqJ6472nZm8ow0WpVqMdcZXe4XLc4XLitOxkqLKFU3P807yZUtrnUhbRsQ5YtgFvFKrRqKJ52F2AoZiJrkE7rB0svKksLnSSmM6ijtjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnLNj9u9+XtB43c3AqJSUZwmPGom1TogTW5gtfZ+GUs=;
 b=q2ZgWc0T0qV2PZpVRa6Qs6SExk/r+LcnJKXNnlMbifyWyiDrM+9WZJz+0wBNKuYKkPbBldTIJ8LDVT6yRKFtuPY1dma19j8t7PE+g1npggPbv4MVNyv6b5F9POodkIwtYZBfmN+xSep7if5Ghizoc67cVkKQqBM5XTVISv/YKj0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSYPR01MB5526.jpnprd01.prod.outlook.com
 (2603:1096:604:90::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 09:28:06 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:28:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: RE: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Topic: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Index: AQHZ202jCBNL1aKlyEaWSc1tCd8m3rBMa0yAgAAEEpA=
Date: Mon, 16 Oct 2023 09:28:06 +0000
Message-ID: <TYCPR01MB11269D92FDBF0CCC338E90BE186D7A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <169744753889.562442.4612949090009224880.b4-ty@kernel.org>
In-Reply-To: <169744753889.562442.4612949090009224880.b4-ty@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSYPR01MB5526:EE_
x-ms-office365-filtering-correlation-id: 14c8c16e-f0a6-4015-3f80-08dbce2a3435
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ldpMb4ADiTOMa9lbqba/zsY6ubfPAdkBymKvqzVHt6xwi0wsbyb9SoOYCSd2T/HGSwZ1jSqNqfFOI8wOB+sKbFryOn1PR4Px82Zqr+BILyq4zdrCtsBn+5atunHGQw8+81bHDF1IKjzX8co/gphguhmHeNSCSQlYU5a90rNvl2nDLLsv02mPt5TmBmiGbkOFLfHWYTRHTI+1t+txSOcxdjCVctYn7NqFodzC4pXfXmyVx4wua07Yqmv5+PfU3jOvcCaxvFYuScFKr1Bw4eEDpU6KkUPQnbYl46z0OjTVIgIZa0kTJmRTLRVRUYPnzHIrxnJLXJZg3tLZ7dwk9xptCZgC4wRYxYYDq//0+QHr0CaBE5kK3WeUFzZxABgXMvEB0Io8bHhb5TS+XKb9DfqdRHD01BKS+yiAydVdXG+37IPE8x8ADd0Xr/RAOzeDPhcc/NrdyOlwhK8Nk4yq6wxIJm2ynDW+jklJWo06UDfQ6ipn2TOCs0VYwFEnFt/NhmIyCENPGnba7SgVGnV5CWhqs1F4KECwYlmU7NVHjIz636nTuNXwesJwheEaT3yvtVbPEwGUpddHQIllp4t8lZrWpb5HiFpNcqg2jwReZXFFP1v9NWq807hEIpLPv0hSV3Ba
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(478600001)(110136005)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(71200400001)(86362001)(38100700002)(316002)(9686003)(26005)(7696005)(6506007)(41300700001)(33656002)(5660300002)(38070700005)(122000001)(8936002)(8676002)(52536014)(4326008)(7416002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aEei05h8fVqV00SsiFdNqHzSAwDXNhYnO5v6IE1sntNjQyNQUPGSE1xvjY?=
 =?iso-8859-1?Q?YPdTNXxfqQwVYVQzkvB8ohPmashQYd2fc82DhEcn2txbj0f/MvpO+4LQ0g?=
 =?iso-8859-1?Q?XFhuCnDSeA6E772g1OhVZ5IOu7S/epDHFUSP3AyGLjBqmhxFkM4cqft5m6?=
 =?iso-8859-1?Q?LO61xFfSR/8mn6PXEOGyKyiY+g2YcOs44h2HEm7FCHEE0nwJg3jV0q2t9i?=
 =?iso-8859-1?Q?3Mfl835ky8CF3m0rV1nrXwoWwQ3yTw6uPWXMWbr2vGRYPWQ0/BzTU/5dJM?=
 =?iso-8859-1?Q?8IPidsPQtNyJaBo7S71XL/KaiewzBScRn4BDp1EErCHXemtCFOOfNlMAx7?=
 =?iso-8859-1?Q?7eLSSeCiFX6hd6Ljopd59gKswAkLq+3gAIi/63ja/HlqMXWwqIyDgvTopt?=
 =?iso-8859-1?Q?RzOyNiQN1tdYeWOKYUsLK0Dw8WYa2D8ppzMq4VHmGRwbZarAzyOLX0ZCT7?=
 =?iso-8859-1?Q?g4OxDYC4X2cTU2KNu6aOd4aWD3S0lKlyQDjqHLz5X5UCqkAitDHV+0uRlB?=
 =?iso-8859-1?Q?drog2BqBLTEQdUV37vAxtsYTTt+OiZgzJCdm6tdfk6m8xj/W6x5bhVRhj6?=
 =?iso-8859-1?Q?JmvhNpHexgqgUt5wkJJnjFJVTca5aa3mnnpkezuse+oNUnKHhziHyOf+BO?=
 =?iso-8859-1?Q?7mAJqqleCNihicqGhgHlUG+EbH8uhEvKmNXZpU8M8NG3oYXC59AM72eN5Y?=
 =?iso-8859-1?Q?satwU4hOm1TqGsaElMkYUZ3X+AsL4o4Nugsfq80EEZPQlZYr94Qds5Bb1Z?=
 =?iso-8859-1?Q?cyvWwYXPD6cKzdeYLBP2IEjE/zBs9t35ybihmNULYyQPrqBqtabLo/n3R3?=
 =?iso-8859-1?Q?oydFvGdEiw4BSrSToX+SjGiNVncfEpEW2Ca3tdWH0l27uZU9160Xq52YBY?=
 =?iso-8859-1?Q?zVpcpXgOLSIQPo0izPI7SUuvNL2xEeyitS9fPS+sI/1fE+2j8fRC+Kb68u?=
 =?iso-8859-1?Q?2AhUqhZZkN5exIP3RAONnGQRCP7PM15EXa2/iQsGm6OgGhmjg0kPBKHkYp?=
 =?iso-8859-1?Q?Y2OQJJCJrUHs6NuzkQx+MR+JyAX4EuNzqKenyJJ8iXriuNUXcPlGTCP0WC?=
 =?iso-8859-1?Q?cEIx/ObnNXyVSv2ceZ4PLzraWARBSZ6LkGgdwviwufZJHhomLW4ix71l/i?=
 =?iso-8859-1?Q?YOQT1WI9eukuRYnVfitBfZCAQdng3LOhSOelW+8sPV9miMOZfkwVvqRGvH?=
 =?iso-8859-1?Q?UqNTAiIcaxu7tdTgmBoG3zbgBWjKxRJ0Tjzie6ndEFTs0O98o+kbKMNHZm?=
 =?iso-8859-1?Q?0RRB7Ipd+CNvRF5jYUrTjBsc5Cu7yvb/uhuPb4WV98BZ+VNw4F11wt5AiX?=
 =?iso-8859-1?Q?cBO1HwsEICQOBGu6IGSa5RmutBWAK9LkfGS+Qnb/lsJV0OOdtVtxuszsjR?=
 =?iso-8859-1?Q?zrjw+rFjAdqZXMrR7TFjAfPx57gqXTat/I8pMYD8JgHrtd4MCyAqbpcDsn?=
 =?iso-8859-1?Q?lLdSlC1O2dWPTrB2FXnB8ZmG5BCkNZ/pVh44lOkOzsg3/f3dwQ6LsSMa8q?=
 =?iso-8859-1?Q?X2/ISmoNKQWX7f7/WP++28pCnwcMU8O548DB62q5eyfnt9RtbpDkaPw3Tk?=
 =?iso-8859-1?Q?u/gL5mVwGveuYxsr898ygXvJyAxtxKCtzAmKiqsar3WC/5g2CShp8LiCmx?=
 =?iso-8859-1?Q?SnQLMCraGg2PgtezpWEKOHAA5byx5vt9xWOVIQkLhGdDu/08oWIYgIsg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c8c16e-f0a6-4015-3f80-08dbce2a3435
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:28:06.2438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zW9A2X/rbMX/7wIsJb5PdRSGoRGfsCR9aZpNlpPGNF0eVw0XG8aJYyvpoADsyZaZqnC+PTmBpTPBdlrTjBuKTANolDfBQy2f1tGr35j7kxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5526
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: Re: [PATCH v2 0/8] ADV7511 driver enhancements
>=20
> On Wed, 30 Aug 2023 15:23:50 +0100, Biju Das wrote:
> > This patch series aims to improve ADV7511 driver by adding feature
> > bits and data instead of comparing enum adv7511_type for various
> > hardware differences between ADV7511, ADV7533 and ADV7535.
> >
> > This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> > ADV7535.
> >
> > [...]
>=20
> I aplogize for the delay in merging this very neat series.
>=20
> Applied, thanks!

Thank you

Biju Das
