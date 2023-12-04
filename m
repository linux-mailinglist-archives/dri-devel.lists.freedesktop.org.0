Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC559802DA2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9600A10E2E2;
	Mon,  4 Dec 2023 08:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5FE10E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 08:54:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3334a701cbbso543787f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701680072; x=1702284872; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IsEvf1UWeFflvqJIT9N20f+Hk4m+lbh6KScDBJtlrds=;
 b=oZ2dBN4AbB0EQpAEHamelUYE2QR7x5R68MxNXUkUQulStCMr1Ujj3ievJi8VVPmD67
 LlaJucCkYvAfow7hTL167T+gNegdy3Sjm7LL7/v15Go+dbdk2/YDAunn/IrrgfaqQQhb
 RVpOACb39TotMzrG2BOCOndO6WEQneFkEZSda4vSCZ92I4OWocpFE9F4H9gWPYp4IFEd
 oFBPjFFspKy88v2A85QNWSftAWDSauh+UbpU7qKNVePRidHLMnQ36wy1SLxEbHTwI/0k
 YZSEJwugbxfhsoUGIv51xl7SCtI4JoZJcW9XG7UENbLtv28rt7f9krJh7TfLCOOc1SvV
 s5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701680072; x=1702284872;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IsEvf1UWeFflvqJIT9N20f+Hk4m+lbh6KScDBJtlrds=;
 b=G3u0wWQnG66xGlxXvKzJ0t5k/SuRaFs3NQtENpZCjyZeFcqgLmaSHMG84mZHlgZ3nT
 ZZFGzflVx8E07f9ruFRmgl4Nm03p+Q8ZhbmsPLQQ2ubqdp6H8/rrf3H/Sx+S2TaA9VNq
 atSkokWDZ9VBVCoIA9FmOsjec0PyWH3vB20y69zzxpb2Ont/FC1w0niATb6z83NPy2Q5
 mR2L3Midz86ZriuqK2MsomG/U+ISMZIVy+yiWsxVhkVgUvfDu1/0CUyJNMPYAM3OieHq
 QHAP86CqDg66A+1RbVHY5IcZJQ39VdMPTExCTEfH91fh6oHWSJgP1DRy+G4Svqixy3tM
 sDag==
X-Gm-Message-State: AOJu0YxZHy2lxovPquZMGyVOESfOOrS1E5NDaBAUL6hglzrndBDB7SmG
 icbNqz+pGy8sc0uf4U/Y66N9zA==
X-Google-Smtp-Source: AGHT+IH0r4KISOv4zNLTHDu5aAObSJfPRuwpaA2b804m+NoRAtFaT8xHRVLh9GA+fEiOEeWqWLvSZw==
X-Received: by 2002:a05:600c:4f04:b0:40b:5e21:c5e9 with SMTP id
 l4-20020a05600c4f0400b0040b5e21c5e9mr1711141wmq.183.1701680072148; 
 Mon, 04 Dec 2023 00:54:32 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67]) by smtp.gmail.com with ESMTPSA id
 fc12-20020a05600c524c00b0040b400711f5sm17963958wmb.7.2023.12.04.00.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 00:54:31 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 10:54:25 +0200
Subject: [PATCH v2] drm/panel-edp: Add SDC ATNA45AF01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-x1e80100-drm-panel-edp-v2-1-b0173484631a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMCTbWUC/4WNQQ6CMBAAv0L27Jpu1Qie/IfhUOgCTWrbbJVgC
 H+38gGPM8lkVsgsjjPcqhWEZ5ddDAX0oYJ+MmFkdLYwaKVPpBXhQlwrUgqtPDGZwB7ZJuTmbHt
 b64viDkrcmczYiQn9VPLw9r7IJDy4Zb892sKTy68on30+08/+/cyEhDw0locrka3N3btgJB6jj
 NBu2/YFNmlYctIAAAA=
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=LBmH7u4KmtRScnC6X68jFgBzF0WRRB7mXPFU47y7t2o=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbZPCJl0hiu7IjYuG+DGLBQfQJ6LEb0gshDxsg
 yGqwiFeC+aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW2TwgAKCRAbX0TJAJUV
 VgN1D/wJGfLSpDM4gKqzU66yRFsrXi92I74q6ZJnpPGuNwIil88J5USzuEBJiPoHFFrtwB5nAM7
 C6RQ+HZIOYtsYBN/cQ+Dvd2HWAxuw7JbKNpJ7OgzzVLqN9cC0jYKD9/Fq4z2a2hqqz9SelH8kWz
 PmZL5uP1Tn0Mw3aGHZbD909D5JV+LPs+hCOae/rbuRhoRJGQ5BJ7kx5Bg8KD4wF6UJ7Q4NNUyUg
 dsakX3SmxceFt2zn9LQfOxmQAMOYk91DzyXTcv0BJhBEfkRnwy3R8VvTONR43bNbPFrdKgkGx9k
 p8MBAm6I0/x45Q9VqjHYQLMI/vmce8lut/fU5lLy/aq06P0M4Se3CjT7tW3xZ6yx53tfRLk8Kdx
 RqpfOg7VNm9N3ruSTWAChfasghcQrLqabawVcnDr56FUuDcP/3BSZS3cV/REUrxe9KCTwRJv08q
 7OOccFhSGmcWKRoFIgqS+xNO8ku4lBRxWpSloGlt1fJF96ttX9RpS9Dn6OYigx4lcvcyf8DHPgi
 SvRZQBaK7GTB0nEH98k9iZ/xPur3euzkV1cHE+DeoWAArPBQcv7jpMa406grApJamSTjZixfb4o
 9GZU3l47XVz9OWWQz8KPd4LdF9oZnGA5ujLoK5lMYJWgtRyZFqMjTaBu/uoASI9I6QyF4rSkDpv
 RNLoydugxFcdltw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the SDC ATNA45AF01 panel.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- moved the panel entry in the proper place, as suggested by Doug
- Link to v1: https://lore.kernel.org/r/20231201-x1e80100-drm-panel-edp-v1-1-ef9def711d8a@linaro.org
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 825fa2a0d8a5..78565c99b54d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1983,6 +1983,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
+
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &sharp_lq140m1jw46.delay, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),

---
base-commit: 5eda217cee887e595ba2265435862d585d399769
change-id: 20231201-x1e80100-drm-panel-edp-e94dcd8250eb

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

