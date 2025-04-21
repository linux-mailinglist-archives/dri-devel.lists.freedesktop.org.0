Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA5A94CEE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 09:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FEA10E210;
	Mon, 21 Apr 2025 07:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="j1xXU1TQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2D10E210
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 06:50:00 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250421064953epoutp034a0261d905cf5e5acc17430a5dddc2b3~4QrM5fvFz1397813978epoutp03K
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 06:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250421064953epoutp034a0261d905cf5e5acc17430a5dddc2b3~4QrM5fvFz1397813978epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1745218193;
 bh=6E/7VFpyvsMUlIQaY+I45HAEDDr2hRhsdBc9fxsVaO4=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=j1xXU1TQIKMbjNg+hAr84gXkb7ydpPW1Rw77624q50UUGDriA/iNrfBATUKdWx6sO
 E555tSzi0MRk4xrceohbvUF1FsOVnY5RSEjjEJVYZ+wLLURksHlQUucLFy1nTRrkME
 kPGzGZefz/pcnZH8b/G3Fgd1HXCfSkaQ8NZThgnE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250421064952epcas5p3f0f1267aea243c0043c1618cb44a381a~4QrMWK6Gm2773527735epcas5p3r;
 Mon, 21 Apr 2025 06:49:52 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4ZgwwJ3cVBz3hhTP; Mon, 21 Apr
 2025 06:49:52 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: Re: [PATCH] drm/edid: fixed the bug that hdr metadata was not
 cleared
From: =?UTF-8?B?5p2O6aOe5aif?= <feijuan.li@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, =?UTF-8?B?5p2O6aOe5aif?=
 <feijuan.li@samsung.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: =?UTF-8?B?5ZSQ57qi6aOe?= <hongfei.tang@samsung.com>,
 =?UTF-8?B?5Lil5piO6LS1?= <minggui.yan@samsung.com>, =?UTF-8?B?546L55Cq55Cz?=
 <qilin.wang@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <87cydbp5gs.fsf@intel.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250421064952epcms5p50fcd97121f3b977d561e41b858e3ae21@epcms5p5>
Date: Mon, 21 Apr 2025 15:49:52 +0900
X-CMS-MailID: 20250421064952epcms5p50fcd97121f3b977d561e41b858e3ae21
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388
References: <87cydbp5gs.fsf@intel.com>
 <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
 <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p5>
X-Mailman-Approved-At: Mon, 21 Apr 2025 07:24:10 +0000
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
Reply-To: feijuan.li@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=46rom 7da04ef9ba0c201e7817a21f8c4a1bf88973c8b9 Mon Sep 17 00:00:00 2001
From: =22feijuan.li=22 <feijuan.li=40samsung.com>
Date: Fri, 18 Apr 2025 14:56:49 +0000
Subject: =5BPATCH=5D drm/edid: fixed the bug that hdr metadata was not rese=
t

When DP connected to a device with HDR capability,
the hdr structure was filled.Then connected to another
sink device without hdr capability, but the hdr info
still exist.

Signed-off-by: feijuan.li <feijuan.li=40samsung.com>
---
 drivers/gpu/drm/drm_edid.c =7C 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..cd0e4148f6b0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
=40=40 -6576,6 +6576,11 =40=40 static void drm_update_mso(struct drm_connec=
tor *connector,
 	displayid_iter_end(&iter);
 =7D
=20
+static void drm_reset_hdr_sink_metadata(struct drm_connector *connector)
+=7B
+	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metad=
ata));
+=7D
+
 /* A connector has no EDID information, so we've got no EDID to compute qu=
irks from. Reset
  * all of the values which would have been set from EDID
  */
=40=40 -6651,6 +6656,7 =40=40 static void update_display_info(struct drm_co=
nnector *connector,
 	struct drm_display_info *info =3D &connector->display_info;
 	const struct edid *edid;
=20
+	drm_reset_hdr_sink_metadata(connector);
 	drm_reset_display_info(connector);
 	clear_eld(connector);
=20
--=20
2.25.1


I changed the patch, not to avoid other functions.pls check.

BR=7E
feijuan

=C2=A0=0D=0A---------=20Original=20Message=20---------=0D=0ASender=20:=20Ja=
ni=20Nikula=20<jani.nikula=40linux.intel.com>=0D=0ADate=20:=202025-04-17=20=
17:17=20(GMT+9)=0D=0ATitle=20:=20Re:=20=5BPATCH=5D=20drm/edid:=20fixed=20th=
e=20bug=20that=20hdr=20metadata=20was=20not=20cleared=0D=0A=C2=A0=0D=0AOn=
=20Wed,=2016=20Apr=202025,=20=E6=9D=8E=E9=A3=9E=E5=A8=9F=20<feijuan.li=40sa=
msung.com>=20wrote:=0D=0A>=20From=20a34a1e2dd7aacd45f18775564fce12b03ae4009=
c=20Mon=20Sep=2017=2000:00:00=202001=0D=0A>=20From:=20=22feijuan.li=22=20<f=
eijuan.li=40samsung.com>=0D=0A>=20Date:=20Wed,=2016=20Apr=202025=2011:07:39=
=20+0000=0D=0A>=20Subject:=20=5BPATCH=5D=20drm/edid:=20fixed=20the=20bug=20=
that=20hdr=20metadata=20was=20not=20cleared=0D=0A>=0D=0A>=20When=20DP=20con=
nected=20to=20a=20device=20with=20HDR=20capability,=0D=0A>=20the=20hdr=20st=
ructure=20was=20filled.Then=20connected=20to=20another=0D=0A>=20sink=20devi=
ce=20without=20hdr=20capability,=20but=20the=20hdr=20info=0D=0A>=20still=20=
exist.=0D=0A>=0D=0A>=20Signed-off-by:=20feijuan.li=20<feijuan.li=40samsung.=
com>=0D=0A>=20---=0D=0A>=C2=A0=20drivers/gpu/drm/drm_edid.c=201=20+=0D=0A>=
=C2=A0=201=20file=20changed,=201=20insertion(+)=0D=0A>=0D=0A>=20diff=20--gi=
t=20a/drivers/gpu/drm/drm_edid.c=20b/drivers/gpu/drm/drm_edid.c=0D=0A>=20in=
dex=2013bc4c290b17..5cf5d30321b6=20100644=0D=0A>=20---=20a/drivers/gpu/drm/=
drm_edid.c=0D=0A>=20+++=20b/drivers/gpu/drm/drm_edid.c=0D=0A>=20=40=40=20-5=
607,6=20+5607,7=20=40=40=20static=20void=20clear_eld(struct=20drm_connector=
=20*connector)=0D=0A>=C2=A0=20=7B=0D=0A>=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=
=20=C2=A0mutex_lock(&connector->eld_mutex);=0D=0A>=C2=A0=20=C2=A0=20=C2=A0=
=20=C2=A0=20=C2=A0memset(connector->eld,=200,=20sizeof(connector->eld));=0D=
=0A>=20+=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0memset(&connector->hdr_sink_met=
adata,=200,=20sizeof(connector->hdr_sink_metadata));=0D=0A=0D=0Ahdr_sink_me=
tadata=20is=20not=20related=20to=20ELD,=20and=20should=20not=20be=20cleared=
=0D=0Awithin=20clear_eld().=0D=0A=0D=0AI=20think=20this=20should=20be=20cle=
ared=20in=20drm_reset_display_info(),=20and=0D=0Along-term=20fields=20like=
=20this=20should=20be=20moved=20within=20display=20info.=0D=0A=0D=0ABR,=0D=
=0AJani.=0D=0A=0D=0A>=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0mutex_unlock=
(&connector->eld_mutex);=0D=0A>=C2=A0=0D=0A>=C2=A0=20=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0connector->latency_present=5B0=5D=20=3D=20false;=0D=0A=0D=0A--=
=0D=0AJani=20Nikula,=20Intel
