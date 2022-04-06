Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26274F6614
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E054710E03B;
	Wed,  6 Apr 2022 16:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DB410E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:55:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q19so4149918wrc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLTxnGR7/KTIrTDEayIFV/BI/DbPoVL88+VO1j10fPI=;
 b=Z7MBoyVQaoQbXieqx9qBI5GYO+2AdCuq0p9KpnbZlQWWbCS3qGiJEeFFp6bn3jER+O
 YTJeKhwvNRVcLyLmeZMe9urVW7uBNJOsZFDJfCGFgVxT9Z9Ost0Y5KjMQQNrZhXhnfGd
 oRjc8lGI+owp5FFB94h1Xk7sU1irJSkS8H5ALS+OTZQHkukOyrDfFfqYuHu/cweS74N2
 K428wdkELHXOqp9RXLZfqkgTG9WCFHyX56vWH8/H1DzcQgsfRWyvcs4HsoCliB+i/csb
 w1W3uApqQie6RrwI9JmzF1xjBETby2HrhbzroNgT0D0mliRVu38z5WQQamuCweMOTGEF
 Vgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLTxnGR7/KTIrTDEayIFV/BI/DbPoVL88+VO1j10fPI=;
 b=WfQHeOWMrPhheo4rWLmaLb1+1/pZkKhasCVPO2AjlxMsURw731IQuqXmLeneU4xsNV
 ZJEf2grkyN4CU/z4Wh3atmhS94tu2cNQqbjY4CcARMwEkHNhBpTeiGfWxyOcU7sucecD
 skC4OBdOXc1HSbok4FESMRJWEU2DSMn1LKE2Zeddw7oSNLRSUvZCSOGmX6V/WkEUUZsf
 ypEYQOLSPXv/gSKp6L6kT8ebOLPnOhrv6IWmcElHAX8UFwgxcig0BVVuWCjlGpSsGHQI
 kFT5CcdLmA/++GgfmKo84rrZCc7xydWOmM5PVuicnvOYYh5t276/1o15NKENXRNbKe35
 mTtg==
X-Gm-Message-State: AOAM533Jrbt2Zup+VQdY0nvgU0gjgarqzbeGavPBtRcTmz74/qu1BEuQ
 gJJNza5ypaVk+s8n0hYozFs=
X-Google-Smtp-Source: ABdhPJwkIAuexl3wfrlFeKQ3C80Sb6JkJaovTFTC+6nDT5lFOmwSus6YA2zf1UDBLUBgluO0yExeDA==
X-Received: by 2002:adf:e5c2:0:b0:206:116a:432a with SMTP id
 a2-20020adfe5c2000000b00206116a432amr7358435wrn.223.1649264128743; 
 Wed, 06 Apr 2022 09:55:28 -0700 (PDT)
Received: from localhost.localdomain ([217.113.241.148])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm5694484wmq.9.2022.04.06.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:55:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH 0/1] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Wed,  6 Apr 2022 18:55:13 +0200
Message-Id: <20220406165514.6106-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

This patch replaces the calls to drm_detect_hdmi_monitor() with the more
efficient drm_display_info.is_hdmi in the VC4 driver.

After applying it, vc4_encoder->hdmi_monitor could be removed in a
follow up patch. However, since it is used by some code not present in
the mainline kernel but present in the Raspberry Pi tree [1] I decided
to send only this first patch and see if the maintainers also want to
remove vc4_encoder->hdmi_monitor.

Best wishes,
José Expósito

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/gpu/drm/vc4/vc4_firmware_kms.c#L1410

José Expósito (1):
  drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi

 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

