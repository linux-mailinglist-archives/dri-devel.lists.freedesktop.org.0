Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADB11C8A7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A639B6ECD2;
	Thu, 12 Dec 2019 08:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C3B6EB8B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 20:34:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so8520960wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ay3f3rT2lIE/YLLclQUtZpfeBy9nlJ24/EEgRhfGiC0=;
 b=PF8au3HQR1eqluFaFL53LckQ0Bb8b63nBLP6nikHTHqJDuxe+HOW4KYt4zwoujaqN7
 4w2WsVnVazgnTClmMmFzNVeTUZjybaGKYCKUnNxQ6EZ3cVn6z2Wx022vhVpZWYhb20kr
 bemICY4xER1Fu4E7h5VldEUJT7GM6KwZG2sk5PmVmzk4FeKh0omelxjLQDQizS8eH+zW
 t1qdAHk2ucKD8l9QFqah8j30a5uH6fTtFMQsJIh0GCpDc2ZGPCL/xlCjMfXeVoC6b9Zx
 2BKcBDKVNAk+aPF8Ob+45EiTqTCoYM+ceBHhmlmA9aygTeTbg6j4XrsyRuX/WoU+v+sG
 XXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ay3f3rT2lIE/YLLclQUtZpfeBy9nlJ24/EEgRhfGiC0=;
 b=mmeQEwbPeysI7ULsbl5LSv+V82bDm4z4tzoxEkKZA38lACbogbGl4YH3B2o21LOZxF
 bplZnpWgX8ZbmDDpCclmbnt99UYDIpJgujVkVKqD9BnmXxS21RLbItwTNZfAZQz1g764
 bf/tGJv5CKei9aaPf9e20m9bYeeWLJywqYhmrzfEVaYzg94bSATTLgoWsAdZlfZ0kYso
 D3k31omg/MzjjtBCLMeUMBF/JfV5U4TpWal+MNrHwBw003137ocNr1lJtkQ8frmvZIc7
 EQ6gzuM+wzZTE4tySWtb+oXMB/Bby1RnmDFkDiQOxgLkzgL1bkHuolVRbrZLslqYnWz9
 mTNA==
X-Gm-Message-State: APjAAAWlHZ823XwxAyniW0wOF8nQYcVGHN9/BUakyXFdOP5PkWfTwNpw
 M4uqym4s4DCS9DmYhDtUUGl/Qk3M
X-Google-Smtp-Source: APXvYqzhm9FQTbLSQdyxkyTBzlLdW76xtMpj86Wjh0eyAQfZbUY8wn2OHCfgKaSsdbWAdCAMLy04HQ==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr1816757wml.120.1576096465412; 
 Wed, 11 Dec 2019 12:34:25 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id z6sm3661709wrw.36.2019.12.11.12.34.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 12:34:24 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH] drm: rockchip: rk3066_hdmi: set edid fifo address
Date: Wed, 11 Dec 2019 21:34:17 +0100
Message-Id: <20191211203417.19448-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nickey Yang <nickey.yang@rock-chips.com>

Fix edid reading error when edid's block > 2.

Signed-off-by: Nickey Yang <nickey.yang@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index cdb401f42..945126948 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -640,6 +640,9 @@ static int rk3066_hdmi_i2c_write(struct rk3066_hdmi *hdmi, struct i2c_msg *msgs)
 	if (msgs->addr == DDC_ADDR)
 		hdmi->i2c->ddc_addr = msgs->buf[0];
 
+	/* Set edid fifo first address. */
+	hdmi_writeb(hdmi, HDMI_EDID_FIFO_ADDR, 0x00);
+
 	/* Set edid word address 0x00/0x80. */
 	hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->ddc_addr);
 
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
