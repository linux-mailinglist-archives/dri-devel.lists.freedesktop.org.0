Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E81A10A1C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA1F10E375;
	Tue, 14 Jan 2025 14:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l9/Okv1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170B510E375
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:59:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4363299010dso6004875e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 06:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736866725; x=1737471525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUPAf0bwI5/UJqUcuP87OnA+Ekz7uJw7gvUO3bTZyIw=;
 b=l9/Okv1veysVhE7+G0xh1kWKVh87bbO7efLl8sGH5IsM67QsPU06f7IeVVxtuPX/wm
 hUWKV/YxtXmCVFH3TWV4CSIySwsW/QpVTPT4QERuvdyibmX+n2g3QwMX3/Zd6xXh0GR/
 MKYElfnVBvarWY24/lJxQR2oATGN/AuAMTbP5TflQayCqN+hxoOlpV72SYOMFRw98iU6
 TUqGg9/MQoq28l4ae2Ti6Mdeh+/uYCMwooCnvo3Mnao398lsbeBSm4vMjC2wMh+LtR+k
 ebsDLbmrn0KzUEO/fzTbFMy/0GopXNIKJORbG4nR/TOeRqMWUZeRNDwgGejNPu6HIuWy
 A5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736866725; x=1737471525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OUPAf0bwI5/UJqUcuP87OnA+Ekz7uJw7gvUO3bTZyIw=;
 b=a1kKzQS0WzpQV4l1hTlaijPjRTg5lQuSOmpoI46zoUDYznHDyV/hYnytP8/qGtDksE
 pJZM2/VvahWwfjZHuQ9YkgHtYkFFbKpX+TJy17HStXjnkCYB0MYv+DAjZ1K0Y8JkIcQ3
 kfAOaHInBNt+04730tI1pZGyblqclCpkkHDOIxjNYxQIKuPjcb8y1F7IwVlRrCNEJ93R
 0YABjLL3EnsPjA7Zdr5804WeJ3A6+BRCQEHBguTed/Qo3XNk9i4kd54GmoItp7Saef6R
 yzXG6x2TR+pL7tn1Y+dtcp4xyiOFgv/1cu7WEuCn8BI/39zV8xCKV60SgAoRa88OZykE
 FAvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVwEb7oNGoM9lAuiiowLNkTnyqY79rhpR/o/NctX+THmajjsf2F0v5pz5SpGh8dIzJv+aFoX/l5sQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWQ0s/SoISoYMbRTk12Y+gWfP4I9LOnbWrB+r4NbtCjvXH/6el
 8N+6ATV7mMDthKwXA/QF+5M4pd9WVLuMSewTJwMFchqZOOd/Cg8tlQdRu7BRo90=
X-Gm-Gg: ASbGnctYw4x8flLiwLFaXomW/PQbTHpH2ZMTf6Q2uia8LLpBsYhow6617LVI2K2P3iL
 fZGbobIs/i8BD7/w0lAUxhJGBR77sdn6cRDaLxVkZYvWMDMIuZYD1cZ3AexC17HbY0jf0cAEXld
 lbYwxhSp3iRiGD8tOfnRzTcIOhBPW/RugOA8RWVMwUz72tEFCvC+dGI2DqyazCSr/OKxRcKT2rU
 1zZRmn5YH/OmGeet3GYT/oKtn2JKFlHoFXQcDL9DsVZxV0sQ5n26ZwRr6YDABPMMy7SKCY=
X-Google-Smtp-Source: AGHT+IFCVllmltbFJ1Z5ggwssQ42DQXhpg/Bj7vZBOZTzIXFwE5T8xhqzU/6YPhWMGnHCpJSSYa1hg==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id
 5b1f17b1804b1-436eba35780mr78296515e9.3.1736866725561; 
 Tue, 14 Jan 2025 06:58:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm214937895e9.6.2025.01.14.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:58:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] drm/omap/dss: Use syscon_regmap_lookup_by_phandle_args
Date: Tue, 14 Jan 2025 15:58:40 +0100
Message-ID: <20250114145840.505459-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114145840.505459-1-krzysztof.kozlowski@linaro.org>
References: <20250114145840.505459-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Split of_property_present into previous patch.
2. Add tag.
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 319f0a1d23a7..692df747e2ae 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1237,20 +1237,14 @@ static int dss_video_pll_probe(struct dss_device *dss)
 		return 0;
 
 	if (of_property_present(np, "syscon-pll-ctrl")) {
-		dss->syscon_pll_ctrl = syscon_regmap_lookup_by_phandle(np,
-			"syscon-pll-ctrl");
+		dss->syscon_pll_ctrl =
+			syscon_regmap_lookup_by_phandle_args(np, "syscon-pll-ctrl",
+							     1, &dss->syscon_pll_ctrl_offset);
 		if (IS_ERR(dss->syscon_pll_ctrl)) {
 			dev_err(&pdev->dev,
 				"failed to get syscon-pll-ctrl regmap\n");
 			return PTR_ERR(dss->syscon_pll_ctrl);
 		}
-
-		if (of_property_read_u32_index(np, "syscon-pll-ctrl", 1,
-				&dss->syscon_pll_ctrl_offset)) {
-			dev_err(&pdev->dev,
-				"failed to get syscon-pll-ctrl offset\n");
-			return -EINVAL;
-		}
 	}
 
 	pll_regulator = devm_regulator_get(&pdev->dev, "vdda_video");
-- 
2.43.0

