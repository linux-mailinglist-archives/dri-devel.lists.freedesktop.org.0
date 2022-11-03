Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770946182D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 16:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C9510E67D;
	Thu,  3 Nov 2022 15:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCA010E67D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 15:30:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o4so3313659wrq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jTNF+TBMvTriQtS+AA9+C2dKsWuCfeavpCHVTcjD0eY=;
 b=out7CxP4vZ5XMhp9mDv7Ofatpr7fpv6fDwjoCTilq7jVigf/gyDt96koz/LT1/kL8z
 0sU0E8IpYZ1guwovwiHfWsmY/RGkWdo9Q0nQw6D++1ZG4TTQAewqH/KWERHkVVuVt2Go
 0Tmz4Ta4jr3ClB52+puwbKMbwf+BEMtcBJuT+5D6PjwHTvFfQTFrj7JqiEYd06mvVlY3
 5hmHnxZ39oGNAvJbrAv3R8b9r5xc7pln7zH1imayfH9EPrV4IYqMjdkjTEyZlBxFIXdm
 in7k8+PIcRU3EQ3Q4ubgyvX0wNX22hKkxllEhdPR3vqQUGV3d7o0UZzp9bm0b9+TEmML
 wBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTNF+TBMvTriQtS+AA9+C2dKsWuCfeavpCHVTcjD0eY=;
 b=2H8UTeUX5HN8Zqa3x3VrFj0+EkQG93dUnu92d+Au6pbraNlp0W+9nYNfM+8OHPOqkh
 UK8tGbU404PUfJLxQLyKZui78rWpGag2g+f6WQmfj2FN3JCw3QaxRey7lEJn5ShAis2p
 QWIkan3MkVzlPwwf6+8eCywhP4PzADZdJ2ZYuTY/B8ScI0pGtpeZHtwsVLqsjNOR50it
 QsmieWszlPuGitHXgsgH9zFf8XaIRNHjFo0dp4hSsx6azljtJSRec42fX7lSiney8dO/
 UIrS+T3OR9j2OUfgkaZNEFd7gPwOKN4bS1FZz+uNNaZ6YtWFBBFisONLL9BQWs0ORpHz
 Py1Q==
X-Gm-Message-State: ACrzQf0TkaDKJ/xHtrW4wdi4/7nFFZbnkUGaKD1sKSAUM/nSS4IFm4kJ
 hk5xko0Mhs2uF2A3yupvEwY=
X-Google-Smtp-Source: AMsMyM5Nyyy/q4Kn3ydmHt5dCYT4Mg7RkCP01fJ7CYK5rm31bepO9+UNSqvjytTa3KpN6DC4tX4HTA==
X-Received: by 2002:adf:d4d2:0:b0:236:594f:4a2c with SMTP id
 w18-20020adfd4d2000000b00236594f4a2cmr18912381wrk.705.1667489399525; 
 Thu, 03 Nov 2022 08:29:59 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003b4ac05a8a4sm183699wmo.27.2022.11.03.08.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 08:29:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: sti: Make array en_di static const
Date: Thu,  3 Nov 2022 15:29:58 +0000
Message-Id: <20221103152958.89865-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array en_di on the stack but instead
make it static. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index cb82622877d2..9de8cd171c25 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -641,10 +641,12 @@ static void hdmi_dbg_sta(struct seq_file *s, int val)
 static void hdmi_dbg_sw_di_cfg(struct seq_file *s, int val)
 {
 	int tmp;
-	char *const en_di[] = {"no transmission",
-			       "single transmission",
-			       "once every field",
-			       "once every frame"};
+	static const char * const en_di[] = {
+		"no transmission",
+		"single transmission",
+		"once every field",
+		"once every frame"
+	};
 
 	seq_putc(s, '\t');
 	tmp = (val & HDMI_IFRAME_CFG_DI_N(HDMI_IFRAME_MASK, 1));
-- 
2.38.1

