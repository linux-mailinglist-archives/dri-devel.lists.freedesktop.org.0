Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E2800B86
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 14:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0328210E863;
	Fri,  1 Dec 2023 13:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB7289798
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 13:13:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332fd78fa9dso1519448f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 05:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701436404; x=1702041204; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bnGsvicGZc72MghsLvLQ88ck4/4r2jZIgUAyLD1bRfU=;
 b=SAsv8LJDFgmUVpeE7+ob+Kl1a9imCUwvmQE8qWt5UklfpJPRsi8z+tPdeJyJrahLXV
 dazsFpGci8Jjt59+bxewhKHH2xPB72X6anH0O3t5lkOY7ZRn51vTfLsiqUiij0SwO5OB
 VCJc6TDb48q75Rd16JhOtujufkW4JiqAtmSM3fGlrZS1XRk0KZiiYlI2tXlkMvM0TI6q
 l7wgyNeL1qmA3IgiJuHfActtTkDGdUtBw2wIKnAQcbiJLnQQ2Ov20E3vKT65BjgduRfk
 JqgnVsF//SW1bbeAtvbW+XoX7bbU4GHgIf8Rc9GAZZCiwurY8rWleaU59za+rOW6Nt5v
 L4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701436404; x=1702041204;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bnGsvicGZc72MghsLvLQ88ck4/4r2jZIgUAyLD1bRfU=;
 b=Hy1SAJnYQsLkci3GEcy/c55qNE5GEBd/LDNLfWAcmN9hs49d1UnfRLyQbHgtwQwB4u
 /VpOtn9BXxCWd7ZxlESJsA2DRbhQtGcvD5xm33jzEH7tmihfl9D9qxXFLxqB2Y7WlIew
 RMKXDzBflMNl8tDuqdznCEy86SJxFBeDtsZYzEK7bpBcSQkBPOJmP2ewSNvHnWnbAsuf
 D8pV2JAMVh507UlWHGg+d8GkAVvNiVAuR8Fi0SyY5kYY125jcFAGxNdaDTtWJhpa1CXm
 dxhXcwe8xMr1hqiMPVlQnVEWUMJPx0SZ0uUYOcmDM84T/7esUe6U5AXXZ3mW1bj1BUJS
 2Z5Q==
X-Gm-Message-State: AOJu0YzqstyfxDYIWfED8sCWMeMzS0PrpWNwgGuPy1ZC0swM8myCVihv
 xmgAjbOl/4j2F37ShBCSOlL0Hg==
X-Google-Smtp-Source: AGHT+IFgpB/zaa+hPymuzYotAdMvmq7wzEGxAZLM2pkIi4GEXLudxb6GUoWbgsIMqsulIThnbt1BIA==
X-Received: by 2002:adf:fe07:0:b0:32d:ad4a:bced with SMTP id
 n7-20020adffe07000000b0032dad4abcedmr465248wrr.23.1701436404142; 
 Fri, 01 Dec 2023 05:13:24 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0040b3867a297sm5333550wmq.36.2023.12.01.05.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 05:13:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 01 Dec 2023 15:13:12 +0200
Subject: [PATCH] drm/panel-edp: Add SDC ATNA45AF01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-x1e80100-drm-panel-edp-v1-1-ef9def711d8a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOjbaWUC/x2NzQrCMBAGX6Xs2YVNVKi+injIz6ddiDEkKIXSd
 3fxOAPDbDTQFYOu00YdXx36rgbuMFFaQn2CNRuTF390XhyvDrM4Ec79xS1UFEZujMsppzz7syC
 SxTEMcOyhpsXy+inFZOt46Pq/3e77/gOuNsj+fQAAAA==
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Fu2shfYoG0HO7jjuIrpFa+x1f8tH/a5L8jGuumIndac=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBladvxfyRIJw8WA17MbH9nTInGECkTMZHdlFr1V
 oyR1lRJGfSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZWnb8QAKCRAbX0TJAJUV
 VlOnEAC/9TdLPYnWFfzUt4V0p9vmqMMQ/5kdCOqcqhcdjt1YpFlqX1nEtbDvY9h8rC7J2P9TmRv
 KBNXD+9XKvum2sCVn0npc0k7QKalSakoznoC+igCDgV15HMYiHQMuFoUgC/1v9ccIFeONybGlYO
 q0r9Wx/MtnzRux03S8MK7XFXeItqeQy73NFWQOJxGTyYmdFUJ/N/76DvicHOKhh9mVgxKxx8Nu5
 jY7gmg8hfa/inYCEHsSEc3rojkvnW3jjj8UPo1o+xoEZ8k6kuj1pnBVgcC4B701MJnGJzy5o/Rz
 tSnIXl5QznotQDNa3hmai1DcPa779EFYm2gXwYEk+FI9IM7NH0FBhZi6CY/u7cXTWdTHVEEmnqH
 ZKRAq/ouXaP9kHNSn28qzfyGdcmAFEpYaY09pWIj/W+TUuGJ1EXoxy2SflGFEFNZ5ZrPNDXqF+Q
 UEzZKhjYwJlM2bzwAywfT3mtCEl89kQEPUeWXm4HvMfXl7NcgRIqHXB8nTr5AAWDGrUzKcSGxEM
 r4zpOU7TWWYHoqh3PHAHShGy4sp/VLpZNOZQ6nq5DZbpVM5xXxJpfRp6elrcoZ16GyRpOQMLkZC
 kbJQF/eHsdWb54wbF6tawz2j49lkylFAqKGHXNcCq94Rq9b8eiN5Ixggq2JKECPJz7f0JSGVxax
 Q79YHLs+vrPQdGA==
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
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 825fa2a0d8a5..467a42eddbe9 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1988,6 +1988,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
 
 	{ /* sentinal */ }
 };

---
base-commit: 5eda217cee887e595ba2265435862d585d399769
change-id: 20231201-x1e80100-drm-panel-edp-e94dcd8250eb

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

