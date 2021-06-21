Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA33AEC06
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E9F6E1AA;
	Mon, 21 Jun 2021 15:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03296E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624288171; x=1626880171;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmEqSETyOox4CokfFdKvB32r6pxlkXTxZHSNtV88CFU=;
 b=GCils+zePEf+Y42zZikpsmTQ8MTonCv48y4JiPALZQdM3dcOrJF9fFImSUDXIx9c
 robVdMJD/jxpMfMYtgjlgDLNiK7WAA41/9XZtWFpZFQ9CQYcJWikaIyaZdhlBPHU
 +g1IuQmPtK9oJQsXOOLV5FLYhGWp3tPlicRlrQyKVmQ=;
X-AuditID: c39127d2-a9fbd70000001c5e-a9-60d0abab9e3e
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 35.77.07262.BABA0D06;
 Mon, 21 Jun 2021 17:09:31 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021062117093092-1007632 ;
 Mon, 21 Jun 2021 17:09:30 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Subject: [RESEND PATCH 1/3] drm/panel: Add connector_type and bus_format for
 AUO G104SN02 V2 panel
Date: Mon, 21 Jun 2021 17:09:28 +0200
Message-Id: <20210621150930.86617-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 21.06.2021 17:09:31,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 21.06.2021 17:09:31
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRoCBS3f16gsJBrd38lr0njvJZPF/20Rm
 iytf37NZdE5cwm5xedccNosVP7cyWvzcNY/Fgd1j77cFLB47Z91l95jdMZPVY/u3B6we97uP
 M3ksmXaVzePzJrkA9igum5TUnMyy1CJ9uwSujN9/JQouclQsfLeZpYFxE3sXIweHhICJxKNP
 jl2MXBxCAtsYJXYuOsoM4VxnlJh9+QhLFyMnB5uAkcSCaY1MIAkRgQmMEo0HZjOBJJgFyiXa
 l54Cs4UFkiROH3/IDGKzCKhKtE57ywSygVfARuLgmSqQsISAvMTMS9/ZQWxeAUGJkzOfsIDM
 lBC4wijx9uZ5ZogiIYnTi88yQ8zXlli28DXzBEa+WUh6ZiFJLWBkWsUolJuZnJ1alJmtV5BR
 WZKarJeSuokRGKqHJ6pf2sHYN8fjECMTB+MhRgkOZiUR3pspFxKEeFMSK6tSi/Lji0pzUosP
 MUpzsCiJ827gLQkTEkhPLEnNTk0tSC2CyTJxcEo1MHapNJmuWNYj6XQu96NzzZr1ns1XLv3Z
 zaVSduj8ldpfobc527rr37vd4FnrrXQ3Jcb12UHGid7e5Zqfrm6pEMvwV9bYEfWjck/kb1G7
 kLPesyPcPmj1fW7fVMI1r/inbJE906ab65c//fziXfPvcEsLxr6Jvb4+KTV1R6Z5b1xWPe8i
 g/DEhUosxRmJhlrMRcWJABp223xDAgAA
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AUO G104SN02 V2 is an LVDS display which supports 6 and 8 bpc PSWG.
Add the corresponding connector type and 8 bpc as default bus=5Fformat.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Hi,
I added the reviewed-by tag from Laurent Pinchart for the RESEND, hope
that is ok.
https://lore.kernel.org/dri-devel/YNChySKddg%2FJsMZv@pendragon.ideasonboard=
.com/

 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index be312b5c04dd..99edd640d700 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1137,6 +1137,8 @@ static const struct panel=5Fdesc auo=5Fg104sn02 =3D {
 		.width =3D 211,
 		.height =3D 158,
 	},
+	.bus=5Fformat =3D MEDIA=5FBUS=5FFMT=5FRGB888=5F1X7X4=5FSPWG,
+	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FLVDS,
 };
=20
 static const struct drm=5Fdisplay=5Fmode auo=5Fg121ean01=5Fmode =3D {
--=20
2.25.1

