Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E58BBEDA
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 01:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F111211206B;
	Sat,  4 May 2024 23:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2072.outbound.protection.outlook.com [40.92.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997A11206B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 23:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZpDP1wa7u0ST3+l7A+6meDtBolGsA/dSWzNUvHkoq9P8e4cfish0Q4+qBO3xDQU7QzOfqn6fd2qCVu4BxTsz7CZM1axdo4piuCM8TH/Y1v4Ru3HpqW7nS7dnJ61LbIjeEqg3xN/JMs0aTTGF7xZjSH3ychZsaAhCuq3qmUUFtQ3ZpOY9V2tXzzvUtyOBcqyDvfwYTwDyBOyhjTWSLzk465yG/0VXkay+DvnWKErsI7jh73oOyJiPmhlIrlVBejOvMJlFK6M6bK57maeQVBYjkBouiVAxJYySQExbLpIEHt15KXDXheJkEC99/ThCxdN7LSMfe9AdwNUztz0a3JOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kROrnd6fhyNDBg3ri4P2xpiWvogZjM3zfHeaW3EENck=;
 b=GDrHWywPuTH9STwy1CUG7DW/dr8b/ohZMs+N1KnSp/ayq9CDsS912qchHxUH25XmaNwzT9XSY6KAipHSwVOCIomZuvYIAgizowtEmdhbpjAA/3L5fbjmfAQx9sWsbCetRkYkX+5yJtZcixu/r4Oh7Kiyi5B4QVdFeyRlu5Cq1wsbJEEsQDegpHk2NAHfaL06zsrjKuK7xDN5baFwKeD2zoGtsSCeVJ8+mj63jVZ/87pDAWPRAGzmoMOeM5O5793Vxm35DQFr7+1xxYFDm089GnqWIlIZ5xwykKCPaq3HmtCQSovTQNwQqQE1UUFpk7RGxUGpi26aJFCK7OpOKYkxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR02MB8959.namprd02.prod.outlook.com (2603:10b6:8:bb::12) by
 PH0PR02MB7189.namprd02.prod.outlook.com (2603:10b6:510:1f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.39; Sat, 4 May 2024 23:58:54 +0000
Received: from DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75]) by DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75%6]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 23:58:54 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime
 Ripard <mripard@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Chris Morgan
 <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benni Steini <bennisteinir@gmail.com>, Marijn
 Suijten <marijn.suijten@somainline.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFT PATCH v2 18/48] drm/panel: novatek-nt36672a: Stop tracking
 prepared
Thread-Topic: [RFT PATCH v2 18/48] drm/panel: novatek-nt36672a: Stop tracking
 prepared
Thread-Index: AQHanaIO4tnGig/7xUCz4gFmkk84LrGHwpjj
Date: Sat, 4 May 2024 23:58:54 +0000
Message-ID: <DM4PR02MB89599CEDC1BAFA635C55F51FEA1E2@DM4PR02MB8959.namprd02.prod.outlook.com>
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.18.I13a06b9e6f5920659b1e5d12543b3cd9066383b8@changeid>
In-Reply-To: <20240503143327.RFT.v2.18.I13a06b9e6f5920659b1e5d12543b3cd9066383b8@changeid>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [KvozStvdcHRXwtcfvh1yXEbpamNcos6n]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB8959:EE_|PH0PR02MB7189:EE_
x-ms-office365-filtering-correlation-id: 8476643e-750a-413e-807f-08dc6c9627b4
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|102099023|440099019|3412199016|3430499023; 
x-microsoft-antispam-message-info: MHEmiFQp4l5zxR5bvXUZdUcUPAU9Znbt4a8g1UYKYyjVAwGdrLL3a0hOTRykvltnnx3rnG1yv4q8TRWoi8o6UpO5cTf5Tjf2kBhV7UOcJA+UL2YnbRr4lpuDT3nXtm/JUIKtzzyGipvlGg6Ryir2aSh4WIYfeqq1gbk/gL+gXBXC39m3NwujhIbmiaQI5U4AlYp1+E2kKbt+wvTYIrlYEy8fESPp3YX+VnEgodHOtdTu2OwdN+0e4nBcsr04BHXElejehpud1HAvo3k0v6tfS5h96cQ/swpsSbSwHDZSFy5oQD0ToSbHigOLIHiNXEIRgkh5sMad7a+aTzACYG9T58PoVfv0G8qF97kPT5vd+DshxY+vqczXcNsuMaukK86qdHFyEaCaXHZsMtHdjoXuR4Wdk2Mmpp06dUexh3QkZsL+HeEM5k8LJfFR2w3SYbrogrxMKn+Me9XjuPMdkaLMe2L1qcvDgbhmeHTvmBPpyEqohJMa8e3qcr7Dj97B/kD1CulyyrmSXI1R3PMAG7I/Y67SI9F2fFeMN+Qoybd3TlOGDtRmvZUhOCyp1G+hN8Qh
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T5ZznhmVyMV0MTNVCQRALWwN9XCtAekwTN/T2FiPKQRRewPlHcvV0gkGtoya?=
 =?us-ascii?Q?xeCTPhT158vzr4ERbdGgZJKd9dxSGzvZXg2xiEwseDrR1enrCKTOtQ/MosIX?=
 =?us-ascii?Q?bFmFkLStXwzmVUdBrWvcWtvhKHMm6mxkIX4+koFLJR6EwT1uI2ztUDfRnId3?=
 =?us-ascii?Q?Ak/ZN5T0R8q/HF6Wq9n0vrT7ES8R4fqL/6uhseyqN2vLkJE8IrvF0QHhDty5?=
 =?us-ascii?Q?1LFPnuIh0ALNYL+yk1cuihnBBFBS9p8plDyvV8sEDGaAzgWoujls6o9oV+E0?=
 =?us-ascii?Q?Gd4BEWKk6YdSdoXSqjDsv/9beCOt6j3XwtbLPfKsclPugOo0aTD9KMNqYXU+?=
 =?us-ascii?Q?EYfEBwN4JMT7m9UWxkFClRNg9Ezv/ywkmUzgbWMNXlGoq02fJTKA8+3s2Cvc?=
 =?us-ascii?Q?8+4TIEmkrFH/WjdBOyziRcABS3nW9w7nyBp0UFiHC39ost2WRM4QvvkkusUy?=
 =?us-ascii?Q?RH+FefuxP5QnFwzQBO1mzkqLaNxPyEhujl1v2iK1lhDa5RJKj6DlMEKqz9xN?=
 =?us-ascii?Q?urOVmHM1AzRelnldItpYDtFzG/J/uzI26OecQCFClyrm+2x1eq0Bd5VGcBxI?=
 =?us-ascii?Q?yl9XxPB8GkyZHqW2ErQCJyvFtTs3hBAFiQKq0oKPtsINo80OusDQjk9CJ8Qv?=
 =?us-ascii?Q?quBFcgWopJaEV4O+2Ufx4ID9MQK9aFtO2tUkaXn7uZKAcEfBF6xsy9BCGqub?=
 =?us-ascii?Q?QkD6d8gVjkMU7AhC1V6tjqGT5/Hx90UagfXX2FSSzqKUAbnpywRLvvA70MS3?=
 =?us-ascii?Q?np7uVFEhpY3Fwkvr/WZyZX6oJU9Ks4tV1AUNOQUOWEbNPyaIjYT6lqMB+UV3?=
 =?us-ascii?Q?BecK9f8y+g3KUj9dGL9MuHBtmqK5oEz/Zpb5HdQWGWiUEDC/QNhtOP9VJuu4?=
 =?us-ascii?Q?IPgLTlXN9LQ46Bojc2yO4/ZGzduH5NzEhQgpOB6q4GqWoRdW0MvihnCpJ+OZ?=
 =?us-ascii?Q?IoGx7qlD3PGu4G8WyVSz6Jid2Y3TKoRAoBmCw84nyBuQArZHH7zZvXizIX8w?=
 =?us-ascii?Q?kCGqjqWEPwQu8SilbTTj7B8SzSPnol2p5qJT5aYeLZR5IGnZR+5H+Su1FW4A?=
 =?us-ascii?Q?3qztxLNoGk/QJ2b48gSV+ydAKS/M19As8ZFEkiXdxnpBe5OFndyRDQ2UcgAr?=
 =?us-ascii?Q?eLYYXoICfh3q5tSQAicA/QRtJgDIB/+GWEkFIyBn6ST/sTO3ZSANkDKyUigv?=
 =?us-ascii?Q?5sbsYq3JJaX7BCJhbK6h8Tyd2uuReLrINsjYK34twzjZ5yqpFvkBsgSxyac?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3d941.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB8959.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8476643e-750a-413e-807f-08dc6c9627b4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2024 23:58:54.6597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7189
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

Hi Douglas Anderson,

Poco F1 is one of the main user for this panel. I tested the patch in my Po=
co F1 running postmarketOS. It works fine. Thank you. The panel itself requ=
ires other extra fixes to work properly which I intend to upstream in the u=
pcoming weeks. But your patch doesn't break anything and works as expected.=
 So.

Tested-by: Joel Selvaraj <jo@jsfamily.in>

Regards
Joel Selvaraj

________________________________________
From: Douglas Anderson <dianders@chromium.org>
Sent: 04 May 2024 03:02
To: dri-devel@lists.freedesktop.org; Maxime Ripard
Cc: Linus Walleij; Chris Morgan; Yuran Pereira; Neil Armstrong; Douglas And=
erson; Sumit Semwal; Benni Steini; Joel Selvaraj; Marijn Suijten; Daniel Ve=
tter; David Airlie; Jessica Zhang; Maarten Lankhorst; Sam Ravnborg; Thomas =
Zimmermann; linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 18/48] drm/panel: novatek-nt36672a: Stop tracking pr=
epared

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benni Steini <bennisteinir@gmail.com>
Cc: Joel Selvaraj <jo@jsfamily.in>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/d=
rm/panel/panel-novatek-nt36672a.c
index 3886372415c2..35aace79613a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -72,8 +72,6 @@ struct nt36672a_panel {
        struct regulator_bulk_data supplies[ARRAY_SIZE(nt36672a_regulator_n=
ames)];

        struct gpio_desc *reset_gpio;
-
-       bool prepared;
 };

 static inline struct nt36672a_panel *to_nt36672a_panel(struct drm_panel *p=
anel)
@@ -119,9 +117,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *p=
anel)
        struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
        int ret;

-       if (!pinfo->prepared)
-               return 0;
-
        /* send off cmds */
        ret =3D nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
                                 pinfo->desc->num_off_cmds);
@@ -147,8 +142,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *p=
anel)
        if (ret < 0)
                dev_err(panel->dev, "power_off failed ret =3D %d\n", ret);

-       pinfo->prepared =3D false;
-
        return ret;
 }

@@ -179,9 +172,6 @@ static int nt36672a_panel_prepare(struct drm_panel *pan=
el)
        struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
        int err;

-       if (pinfo->prepared)
-               return 0;
-
        err =3D nt36672a_panel_power_on(pinfo);
        if (err < 0)
                goto poweroff;
@@ -221,8 +211,6 @@ static int nt36672a_panel_prepare(struct drm_panel *pan=
el)

        msleep(120);

-       pinfo->prepared =3D true;
-
        return 0;

 poweroff:
--
2.45.0.rc1.225.g2a3ae87e7f-goog

