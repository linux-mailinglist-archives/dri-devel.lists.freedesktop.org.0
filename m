Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7A4E69F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AFE10E2E8;
	Thu, 24 Mar 2022 20:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8510E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:48:29 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso10538044pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GG7xcgP8KogrXkBePaXl+4bClRR1k79q93eHVgdUvSk=;
 b=D3Q8y529PwqyfS5PVX8DwsdCUg0U/LWDSxTMXKN6D0PD01vTbFT6LgGJTZgHaBVYP8
 uEZrF0KxgnmfRGCjQZ6p3UPGc1YMoV63ECt2oHJSTXejl94bw6Rzu7R+hQrIoiia4rza
 FiIfuUAlomLatVAKjESElnRw8s3fyDpN9nmCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GG7xcgP8KogrXkBePaXl+4bClRR1k79q93eHVgdUvSk=;
 b=OtT731NvTDEQjU4+99C0Cv40Ly85lA6AU6M9ltLSJ14/gjS5N+Ukw0S6mvrtRK6NqY
 wt55h6LDBLeBQZ0Ddmt7NsAn23iA1FKYFxymJVMXGgaOSj3qjyReRh7L7UcxvYvg/K+4
 /fxXxGWzl0lcQmC5KZvqf+6ywPJblsAtvNuuRVCuuj8l/Unw2AD0lr71ZihcdOnah34y
 WQQup9R7PoExvH5LdM+NbbW2wvehPtoX3VzJDuxO2zwaP4n58q2oGYzCjbZIGnlmTf3b
 7gfxJJDELfbeiZ5ZrGJYcQcWY54W49jrfFqQ41RYlxQjph46TK7ZtqRhugw05UJjzBnk
 KjEA==
X-Gm-Message-State: AOAM531ErZP8LnkY+JaiJpUW0PHgbQ79EtEpZFaqt/5UyyohMa4F5Yup
 r+9vdrCrcNHKJXGtQEBy/nOkzncE+/PnMA==
X-Google-Smtp-Source: ABdhPJy6Z5zGJlS8f1aZx1sYZGuE4IYgYVKHa+bduhmaJPIor9q/oCOZxzUIkEbIlSy52NtFmexsBQ==
X-Received: by 2002:a17:902:c40e:b0:154:80a7:95c9 with SMTP id
 k14-20020a170902c40e00b0015480a795c9mr8184844plk.28.1648154909060; 
 Thu, 24 Mar 2022 13:48:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:690f:642:3ebe:c89d])
 by smtp.gmail.com with UTF8SMTPSA id
 nn15-20020a17090b38cf00b001bfceefd8cfsm10249927pjb.48.2022.03.24.13.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:48:28 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] panel-edp: drm/panel-edp: Add AUO B133UAN01
Date: Thu, 24 Mar 2022 13:48:25 -0700
Message-Id: <20220324134819.v2.1.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
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
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the AUO B133UAN01 13.3" WUXGA panel.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- autodetect and configure the panel based on the EDID data instead of
  relying on a compatible string and hardcoded mode settings.

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index e15e62f235d8..db4eea1d7f67 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1847,6 +1847,7 @@ static const struct panel_delay delay_100_500_e200 = {
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8495, &delay_200_500_e50, "B133UAN01.0"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
-- 
2.35.1.1021.g381101b075-goog

