Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393BA6BF0E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55410E153;
	Fri, 21 Mar 2025 16:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YsJMU4ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300C410E153
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcUsLonTol5FqApPa/pSBQjRwe0PEM+B059BB/AZzG2avcAtwp1kI2dDlzkkdR/00DbjBWJPrMzsPGSFlkQeL/fOllpzFl8jPJ7zI3FGpdyXg+yQehPOHf5P78HlSq3DElF3+yL7ZNXd8FfDjXVDm8g7saXawd+zY6e3HXwFK0Z+VdH12BS53354ZgaQ0YySwcy4Gajm4OVveqOJxsz2yFlcGJYMdwir0eNNu++j4NngKnF664uodBYXz400IdbGOIRzNyaf+q2TGoOCaZfjgLGdNSvkWKLGyaEMBo1NTLkSfQCn58aAGBpA4dW5h5a95UUQO1y3qYbgT2Sd2ygxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E87dMDPTJM1xEsSiizBEgHczuH+q4CP/Botm79NgREI=;
 b=suZA8AN/VQpUf3Zw+s+gsjKTu3qis+3A1c7WZr+CaY8oaPyo5raNxBNWPmHam7csLP+hMbylabTTAIfixLclDrv/X05Gvd3MZkwAermIQ9NE/h9bBDV2AC0ZOAxNt1s6GR6WYrycDOwsjXSj7RWlghnrgfEaZpdWrAEpsh4yO0zmdrI7uWF87v/s5XG5EROCblzFPH1Wadma+gBqxke/h8p+A8tgHksrYFlifh7yfaBXD26nQAH8sRzNgw+Zue3MdIDauyfMRimCTSynzWCyktLrSZBvnHqt4I+z37BM/ksS2MOWXKd+AR9q15igitvlpmO2ucaAPdE2rEyhL7CAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E87dMDPTJM1xEsSiizBEgHczuH+q4CP/Botm79NgREI=;
 b=YsJMU4agbDExAwUpZe4Qr/b5T+e6B39oqaVmo4pzhfhY4WTFs+mHUaIK7qG8wU+dfZ4wqM/p5GR9iXj8YY0mhJ1iqbKLM+Xj5zSd9gGkT2sY+4RXTjQmgKhaAUgY1w64VGyvjgCEykphjcr6c8KOVQAfHKnZBE4R1ujS93t5PwY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8626.jpnprd01.prod.outlook.com (2603:1096:400:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 16:06:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:06:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 kieran.bingham <kieran.bingham@ideasonboard.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Support dmabuf import
Thread-Topic: [PATCH] drm: renesas: rz-du: Support dmabuf import
Thread-Index: AQHbmk6KbQ6Mnf1g1kyOw6Nq2xd8m7N9wRyQ
Date: Fri, 21 Mar 2025 16:06:13 +0000
Message-ID: <TY3PR01MB11346ADFF19D773D4EA9274DC86DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8626:EE_
x-ms-office365-filtering-correlation-id: 25f3c43e-1dad-45d4-0736-08dd68924da1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vqn4rcM4ERdA0D+qg2nPW/NcmmykKbxIlKcviU41jbBbU0qEDGdcoIrUIE1A?=
 =?us-ascii?Q?B+T+/o3xJKndmqXXjXqXXCxFu66FO7jGLLOuTN5eAwB/FhU61ThtsiqHzbL6?=
 =?us-ascii?Q?R/eLrEJoh4BXJsF8EM+JFcJ1B6TaCl6CUt/v6bBoipes5sq4U/TzGcMg0yzc?=
 =?us-ascii?Q?iiW41w8LOida5DKa/s9/fAiwQiO6zx3YLIc0yZFlR5nY9yubLWc0JnVVYjk/?=
 =?us-ascii?Q?74D6HqGFlNgJ/p5ZseNXrX+jont4+iVcmmQFrD0FPYoM4c+xpWbpIanN0+TL?=
 =?us-ascii?Q?JP0hKXKwyAjsz5HwSG1J8pTQ3lmkZ1d5s7oEcFJRdnWxxiMn1tYFUZymtmjk?=
 =?us-ascii?Q?63YQpzAF/GmDQbotj/FL2afZ9Yo/O21V3bpuGi73ZuZpEgrC6D7mmcN9lMVG?=
 =?us-ascii?Q?fksXBNVuJvffuL5vmIwOoaHehaouF4wtMh8E37zThlSqcytZf4iNRbajxz3M?=
 =?us-ascii?Q?6kQDko0UlcHibqNOP0+tAtgvL2Mx5xWxx3SmDEj4iwlcaWgUI3hCLE9AWmYX?=
 =?us-ascii?Q?PHhMqdDJ/WpkKmIbBNk4k/xLFC1yJmuUsLsH6HLpCDwq8vTVIkOGdMvdqPnc?=
 =?us-ascii?Q?a2mYhPMSN17vvhLM/rPBTMUZFHUjBsbaiIBHHkvhSwLo8zQJ9aRcq02Lzy4i?=
 =?us-ascii?Q?9bGCD1Wwc6ZseY8hCtFTJVf9zIibqJs+hsb78UAk52NORRsoeUPgnWHEVZW+?=
 =?us-ascii?Q?wJNKlOviSSWCU985eLr7j/NQhhebrEdO9Dpi7+BMk8Ho2hHTQNRDtri7jxON?=
 =?us-ascii?Q?gsf1Qj7mbFtFe/cg4PMhEgKM/EZu2OkIopbvyWv0kTrCSRRSKNoZySJ0J9i5?=
 =?us-ascii?Q?McH3W0Z20JFtpjckd3SaasXuTmt0GYY+g6uERFC74/462l/rXPjNX3EYQK5T?=
 =?us-ascii?Q?uHHPQZhbsNR1CgYtn4kMtRKejaxtT8fBLU/JYhxd9wiugHezr1CPIiwr8dSs?=
 =?us-ascii?Q?CNRm1nGiLny2Hpje4FbeIIlnwHXM3XmdpvI0Mdi9XEB9izi79bk4UzcSmgMJ?=
 =?us-ascii?Q?P9Z6I7BUDLPdxQ/zKaBMEmMgd890IQuqiHb0R+YJbruQHgeROIP+3+/I6w+N?=
 =?us-ascii?Q?NseVPXEQxF7ZA7VuQT09c5iqHwM5StIndiG+IH9yZct1C7y8PNx3lK6r+XYY?=
 =?us-ascii?Q?J8uj2GAO6outLQ0P9HzDWNl2imeIXa+Sbir6kmJgAcljiUjHftB1o3fx9tdy?=
 =?us-ascii?Q?orT/YWisryoPcMbJXpxHSVzeUYGmBLzhtSx+GUqMtvyADSy5WPdQyHxiwFwt?=
 =?us-ascii?Q?PedqTkKC2hM2fdTJYjfaOz2KxEkAFb9G9iFgmsBJb8Ggzn2IA4W3UpfusFWi?=
 =?us-ascii?Q?qR/kmyeYgtEFAWGgVOXHH6t1neTbLRzyV6xAwQ+Dtll/F7jtqO37XlPUmNLt?=
 =?us-ascii?Q?vpk+oarDRlyXGlW5aQfDh1AniwakFmWlltDLLlv16cF6/uqUgErPgVwfOlpH?=
 =?us-ascii?Q?qh6SreaPGukKr3+s+2+W88aWoobnMeqX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rC7N1iuKo68zWuiD8+VCtqq9YciJz/oewX0MQTkcBRa2ArJtW+I5ge9Jv/Ht?=
 =?us-ascii?Q?ZvjWZMFkR9xrMNmmp8c/CnidkT/RAoaz1Xz7IblMFvq5A5tmuxLyQJEADhQF?=
 =?us-ascii?Q?F20UkN9YW7kBeRW7Af/4wrcMiWrZqVM+XuU/n/7Moxd8LynilMGa/mK98jWd?=
 =?us-ascii?Q?jTp7LoKETZmc8uHCtl429WkEXLZq2csyKDfHuy1xDUzv4A7sAVr56fw4WuGz?=
 =?us-ascii?Q?jOMY5jfvdg+JoXGcszjzffrckf8tkuwb5BieJfRXffYD2NLa4a53aanC3jXZ?=
 =?us-ascii?Q?x3wLb+TqJdDVxFZ2f9TgviKm/pSCMlKDb7qY/UKhKMN0HE16M2YOckjLanp/?=
 =?us-ascii?Q?1EYq3tuGlhCiFsObtrzxH+FPDrLQTmgfZx7we6bypgRjgKm9cd3aZNoaRyiR?=
 =?us-ascii?Q?y0AdtpPyYLsSCOkGahuE4kendLdcSetDbTqNAIa19akBLqV1POCEmiK7KG9i?=
 =?us-ascii?Q?SJxTdJniIHdY+9kE1gVz3SjebGmdDAjK3E2f3P6SesHU7sEXBuQOVcbsc/D6?=
 =?us-ascii?Q?S4P1IMeXUWBiZo4tk0OePAiUlxlDYNOlGZimqaXVY85QGzwP95YYt4WOwxvC?=
 =?us-ascii?Q?l84itkOPDdwtRLSixXdB51irY1llodMJavp+zm0twQvBj8FW/SymbeJO2jBx?=
 =?us-ascii?Q?O55Oww7Eb7fbou5e4NDNTIPpYv30ll/Y1fra4VjX4mSfQrAqScBSOkGrpQ8l?=
 =?us-ascii?Q?EsX0nxxn0od/tSm4/x8mu1weHMYPQDnxyoNhdiZE3+86qzXvm6b6BBco4zYb?=
 =?us-ascii?Q?98qiLL9HOZNvVSK+PmmeAGTKItBkQQgXnGzMj/W/m6GVldPHTAuGlhlwL2p3?=
 =?us-ascii?Q?7cCn0+f9huhBOVAbuBxlvOh2Su4AIfX9dCZghOvPbTENhatQa9Zc4FwE0ccX?=
 =?us-ascii?Q?0wUQeqYfNntnYY5AskPF7BbVshWKWIIYNrSJzdfUO1BrCRuqLXpcOYCKfXl9?=
 =?us-ascii?Q?Nimaf5YVy0OrLW9RPgFTF7WHew8/kOKaBBu9t6GtTrNf8Ao+L8AZqzs3PIlX?=
 =?us-ascii?Q?mUTpchOecllsna045LUI5FbP3GRdgVhj8wXg6MpdWCems787w1faizAVN9c1?=
 =?us-ascii?Q?f3I5yXCAQIClTEgo/wz5njy+P1dMPjFwPeYc0RT275anv19a1t2dgUTrJATj?=
 =?us-ascii?Q?cI3zM30oFzdnWjzvHltElXSY91Ql7fomu5eFbUfgaT0dRHmZnQAECq9kqcJa?=
 =?us-ascii?Q?dCLkrebCPbuGdg2JAHVMSxiWoaADR4u63r2FynwN4QDIxwlhoULy0k3PqtoS?=
 =?us-ascii?Q?OSFR77dOJrfBIeLrjUV6gvxmxZNef0BNci4CQl10o/Pnawl4FIwPvCrwcvgq?=
 =?us-ascii?Q?e3M5cdadh5QLrZZ8jI+SdSOE/k7YOCTaphjK1NsxSfgYax2cKAFOk6GV/v7p?=
 =?us-ascii?Q?NMnEtMgqz9ov6zWfdO9lL1tq4vWrshouDM0KsoDUVZNOajCN2O7hrU5cESY7?=
 =?us-ascii?Q?cnihfMh0J/c4ixwMpjILfr7ih+D8XghVr/EGL/0LcWbHE41irU5PPa/Yk4EW?=
 =?us-ascii?Q?T6C/D/Ya4aO7qTH313XqVbr/VTMxxBKEvP+v2MUNKZYgLhf3n3Tg1GQy9s5g?=
 =?us-ascii?Q?0Cxb+iN93I7vkZfzQbG0WzWBSCeNj2O4peA8YwiOr5vuKAhqWELgvb9bqtei?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f3c43e-1dad-45d4-0736-08dd68924da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 16:06:13.2890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mE+d049+V6T0v/yczFv0oGJgVU3pI8v/M8XZiovLPDSH+b3MQ/VPACMLg35QHQoO2fISDvLEqdN/eb+WbM+jzlUn6Ac3cFfaFYXLbeok3ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8626
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,


> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Sent: 21 March 2025 10:46
> Subject: [PATCH] drm: renesas: rz-du: Support dmabuf import
>=20
> The rz-du driver uses GEM DMA helpers, but does not implement the
> drm_driver .gem_prime_import_sg_table operation. This  prevents importing=
 dmabufs. Fix it by
> implementing the missing operation using the DRM_GEM_DMA_DRIVER_OPS_WITH_=
DUMB_CREATE() helper macro.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju



> ---
> Kieran, would you be able to test this ?
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.c
> index cbd9b9841267..5e40f0c1e7b0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
>=20
>  static const struct drm_driver rzg2l_du_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.dumb_create		=3D rzg2l_du_dumb_create,
> +	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			=3D &rzg2l_du_fops,
>  	.name			=3D "rzg2l-du",
>=20
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
> --
> Regards,
>=20
> Laurent Pinchart

