Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE3415D52
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 13:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A16A6ED10;
	Thu, 23 Sep 2021 11:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB506ED10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632398197;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=2vKLrD5/RVYcIrw7lc7p15FS32niKDCwgYtSX9xJmrI=;
 b=rEyce8TZ5vvZOERd5TC8RhsnBi/ckqcpKvyyPMLYTvujjXcn+zd60xCIBZRhGTZy8A
 OeT2pp5TcjeheiKJejxIer+A8rKdEUYLZl3NLizPqVIwXt7ybrvjpBY4rV4WL+ZDR2iY
 OYxG3ev1k+KkYbDHOeWKm1c1/fHchvtG7ETG0HW+DYlOwSeIXa1D2JrHd8vIZuubxD+N
 KaEtslTbMMWAIhtxSwytLrZlc2dTn3tx77FlJfeCF+RU1azAnk4h914DkfiiYJvMtms5
 bo4s8f8E9prceKQ7i78tEAyjJWaheGumm7+SK/YKymx4EUM0iPMuDrJjTNmt5Ng3WBlO
 W8Gg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMUQeg=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
 with ESMTPSA id I01f74x8NBubKDq
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 23 Sep 2021 13:56:37 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
Date: Thu, 23 Sep 2021 13:56:36 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-mips <linux-mips@vger.kernel.org>,
 list@opendingux.net, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6CEB196E-231F-4548-B527-CFF83B587501@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
 <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
 <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
 <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3445.104.21)
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

> IMHO it is leaving (mature) dw-hdmi untouched and make attachment of a =
connector
> in ingenic_drm_bind() depend on some condition.

Since I don't know details of the DRM bridge/encoder/connector APIs),=20
let me reformulate the quersion for a condition specifically.

How can one find out in this code fragment from Paul's patch
if drm_brige_attach() did create a connector or not?

I.e. did call drm_connector_attach_encoder(connector, =
hdmi->bridge.encoder);
on its own?

@@ -1154,20 +1186,36 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
			bridge =3D devm_drm_panel_bridge_add_typed(dev, =
panel,
								 =
DRM_MODE_CONNECTOR_DPI);

		drm_encoder_helper_add(encoder, =
&ingenic_drm_encoder_helper_funcs);

-		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
-		if (ret)
+		ib->bridge.funcs =3D &ingenic_drm_bridge_funcs;
+		ib->next_bridge =3D bridge;
+
+		ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			dev_err(dev, "Unable to attach bridge\n");
			return ret;
+		}
+
+		connector =3D drm_bridge_connector_init(drm, encoder);
+		if (IS_ERR(connector)) {
+			dev_err(dev, "Unable to init connector\n");
+			return PTR_ERR(connector);
+		}
+
+		drm_connector_attach_encoder(connector, encoder);
	}

A problem may be that "connector" is unknown before =
drm_bridge_connector_init()
is called.

Then I think I can propose a fallback solution to drm_bridge_attach(, 0) =
if
drm_bridge_attach(, DRM_BRIDGE_ATTACH_NO_CONNECTOR) fails.=20

BR and thanks,
Nikolaus=
