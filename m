Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD41D5ECC
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 06:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB93D6E10A;
	Sat, 16 May 2020 04:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C846E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 04:36:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b6so4387517ljj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 21:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Rs/psRUa9K+e0U7L81m0wruRrvfZrFES+uF0b2/Nbs4=;
 b=PmVkwyyJo4h/MbY/bWfnpXdEU6P/LUz3y9dFc6LbJP7yLjR1CMVau2zOK/he887ORn
 mXgM3OHR9FWjby7Jw2pR56vWCgdpzXqP5rJCwpEO3RuycPM1Q3mOer3z1Cv9bdQV8z1Z
 g+jLLomcNew+HcRq2ZrEuFr2Uq3Vd2SQTaPhA0K71il1tgkl6eyVPw/hDyabOPsoYHLN
 y9OgEmP+L08gTMrEvJ/x0s9ljpKJeDqZobgZ9K3ZKd+W2BjuoXMGEG5ZnfA/Rihv+swG
 zhKQG7WEPN1ZPYdu3tTQDPEQ6MRzeTdCs3Ym++Nu/FLfEQowhytHIXUEvjjTqdv65KHf
 VXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Rs/psRUa9K+e0U7L81m0wruRrvfZrFES+uF0b2/Nbs4=;
 b=f9aYTZ98yxSI+8krcPOiTm5spLseY9/w28Jhn5AGMP+urwGZxUOHXRRFk38jvOBZCS
 K5sBmvHuGBzWE7fb1B2ZMt38W8UCFZ0SOZrb+qlMWxCl/UYSbfjPtQvXApdo6rF01pBC
 RkcxE9fE1sEol6Vu539gnkUON67hKT6D5rDveSfYEqTl0NhJI+SDtoPt3YjUnbCf6zyQ
 7CfGXCjlFzz+9AHXvA8ROnSRiKvbiBNqzkbouiXQ6JOa/TICz7zufD8UznSugnW6qGfb
 GUbkboXkzJndNKIh3vHUrfvUfnIJPIUmADC0WRSNHYEWCiRfAt81GWVbxja86LJ/vgOT
 D1Dg==
X-Gm-Message-State: AOAM531850eAXvSgyXmjNzGRncV52OLRvPXVb7h0untPeb6ASVhDbEVf
 K/ElMwkyUJQxRJnp2JK5CeiIyCEZ
X-Google-Smtp-Source: ABdhPJzb5wdgoYZnfJYTcSOrMArboBMT4R31iAe9F09a+l/lssCNG1P9Q8uhwG/Sj5TdoAHc0pH71Q==
X-Received: by 2002:a2e:9948:: with SMTP id r8mr4334946ljj.1.1589603788605;
 Fri, 15 May 2020 21:36:28 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id l5sm2414407lfk.16.2020.05.15.21.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 21:36:28 -0700 (PDT)
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: update MAINTAINERS entry
Date: Sat, 16 May 2020 06:36:22 +0200
Message-Id: <20200516043622.6432-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 linux-graphics-maintainer@vmware.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

Maintainer switch from Thomas Hellstrom to Roland Scheidegger

Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Reviewed-by: Neha Bhende <bhenden@vmware.com>
Acked-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Roland Scheidegger <sroland@vmware.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24d0226abc8e..1e08e5bc5c8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5511,10 +5511,10 @@ F:	drivers/gpu/drm/vboxvideo/
 
 DRM DRIVER FOR VMWARE VIRTUAL GPU
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
-M:	Thomas Hellstrom <thellstrom@vmware.com>
+M:	Roland Scheidegger <sroland@vmware.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://people.freedesktop.org/~thomash/linux
+T:	git git://people.freedesktop.org/~sroland/linux
 F:	drivers/gpu/drm/vmwgfx/
 F:	include/uapi/drm/vmwgfx_drm.h
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
