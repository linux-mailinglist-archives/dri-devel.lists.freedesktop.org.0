Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783011DF59
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249F6E2BD;
	Fri, 13 Dec 2019 08:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B927F6ECF2;
 Thu, 12 Dec 2019 10:04:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b137so892968pga.6;
 Thu, 12 Dec 2019 02:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U83CIcKE/SRi+DvpZ5ExDXp0Aib42JfoWBjJw1CdoY=;
 b=vCnXBu3dpOEsSlMFDA3zopAhw0OK6/iX56Ggf6RICdFnChUXqTdPp0GZCB4crBjViQ
 xKQ9GC1t7Y8tKnAO98HbiNn5bf6rIOwJ0l1LHdlcyb8ONbACAdWkLsC+ghq+Dj2jGZwd
 BkP0a4P8kPPU4krEASG4catRFWcTU08fwZNL9Bjgzf6Vj7Ub5TByUy/bQdHpZaVjkaKe
 sMMfF0UTefMT4+1PyL7u82VY+8jnow6fl4iuqM8eLhAGQT/XsGort5OHykOiQ/PyEGcD
 yOsJAT3lImH6GdddbI3mefW2LVJtpbTTxw+UMf0PKYBI3tvo85StBCS8/gMchZ4gSlqt
 Mp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U83CIcKE/SRi+DvpZ5ExDXp0Aib42JfoWBjJw1CdoY=;
 b=aRoAPGmsSF/sFIqrLUamVVYmDbT5cC3TWI5ekVchbi8ajf9sEWgqjL0aUrYaad4d1A
 SEJTvtgwS9wNyYhVk2i5wBWS2pSZhipt3vfCXcrtGMHiKEVbVU1GmoYD3FjNim5KnWsS
 H+Z9VfD2/nQrXtJ01RoZRdJ7qqa7KEFwvFsVcsmGPtcYG2liOmv3TCyMbPJi0DwpEF8E
 FrjkWAhBupS+ycLNY7gl/h7vpxKiaKTDT8tCwGdunMwWZaKrfGtFsfwjV2fHi3jJ9NkS
 hIYkEzqnGHgZMnkjHyWCDmKsMzDuqG7vE5FzgtQZWZIAwQ080uX8gxI9qNHSyDm9EgV2
 VmBQ==
X-Gm-Message-State: APjAAAUezCTq+DbyR3Fch68yPgF4lbjn6an9+TEvoEK5hm4HBKT1+Adq
 7xUpNC1SPYhqFl8c64lgXF4=
X-Google-Smtp-Source: APXvYqwJREwsRCqyKBWa0CL0bcmG/1cRF3jdvXmB1l6ty6DnFhtsoMoX233t/vjQlv3gcKFWcqzSpg==
X-Received: by 2002:a62:7590:: with SMTP id q138mr8630797pfc.241.1576145048455; 
 Thu, 12 Dec 2019 02:04:08 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id g19sm6375868pfh.134.2019.12.12.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 02:04:07 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] drm/nouveau/dispnv50: add missed nv50_outp_release in
 nv50_msto_disable
Date: Thu, 12 Dec 2019 18:03:56 +0800
Message-Id: <20191212100356.11309-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nv50_msto_disable() does not call nv50_outp_release() to match
nv50_outp_acquire() like other disable().
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Fix the subject prefix.

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 549486f1d937..84e1417355cc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -862,8 +862,10 @@ nv50_msto_disable(struct drm_encoder *encoder)
 
 	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
 	mstm->modified = true;
-	if (!--mstm->links)
+	if (!--mstm->links) {
 		mstm->disabled = true;
+		nv50_outp_release(mstm->outp);
+	}
 	msto->disabled = true;
 }
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
