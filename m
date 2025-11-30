Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC4C9557F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 23:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67CA10E0A3;
	Sun, 30 Nov 2025 22:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7531810E0A3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 22:40:15 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BD40F3E950;
 Sun, 30 Nov 2025 23:40:12 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Nov 2025 23:40:05 +0100
Subject: [PATCH] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
X-B4-Tracking: v=1; b=H4sIAMTHLGkC/x2MQQqAMAzAvjJ6trA5BPEr4qFqp0WZYwNRxL9bP
 IaQPFA4CxfozAOZTylyRAVXGZhWigujzMpQ27pxzlssR7yRNsqCQS5MFHlHH6y3LfvR0QSapsw
 q/20/vO8HBWOsxGYAAAA=
X-Change-ID: 20251130-sony-akari-fix-panel-3f0308e3b1ac
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=19TnhCNMbtC60+QGnZHNYBiV8TZzKqAgg8nJ2vr28co=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpLMfMW9Z6FqXnOGf5ZWLaBotUpszamGpH7VV9u
 lDOMic9OvuJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaSzHzAAKCRDxYtIxx+SG
 dlJ8EACYeDPHzl3SGPvZFxKZeH200QB/gG9Ko/OTjyIuL6VoYrL+myoT3FN90SgHW4njm4LOMyG
 fWHam30fck5eoVaqPsdUSpCfAz2ZLzqtYnoTo3Quwm4wXwmJBXkGW7NzjyvPOXqjhx738hjslAQ
 PkWZ+7ZG8+Lux8Mhnd7NLORqnUNqQNm0IHk0JrR4CQE5NQup0ia52GXj/tr+TUCXFCk9jIiS/qt
 CMlCsRye4X/etJXAm7foX4NdKNg0wAdtvtaZOwqZs5FOlSPmej01sK3+DzWk7O/yvVcfI55At1x
 uREhTH+IaHE0/YKmIJpRqq0viIogalXDg+BLLwOj3Aur4+7z7gvT0V0HjzEWArKI1un14jopD++
 Y5Dk4T21QuyOHmddnYODIR32ke6wGenCjY0jjj3ByuIKFNZPTO8hmFOR3/Q6D+QrOZrI4d4gStB
 8ARPPh28A/4bJvwoxwR2jZsB4lNiwNVl+9LNN/gjGwf5wVsSHkKcUyAyiMElcWPliWY39NFcz7a
 7SChcVunr3IYx+elG10/DgT5LuAETgtZlVHuDUNtwm8lrANVRPKZMbN+3MPCg3ro0xdJbn26etK
 5OIe8tUE+8sOazyBw8tFPsWfpMZQQsVYf7fcNaCZdKemcani/aGN/DUVqMdw0htrBqG2PpDwKC6
 zRrfctqtsPfqP0w==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

The DSI host must be enabled before our prepare function can run, which
has to send its init sequence over DSI.  Without enabling the host first
the panel will not probe.

Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
index 7c989b70ab51..a14c86c60d19 100644
--- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
+++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
@@ -212,6 +212,8 @@ static int sony_td4353_jdi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251130-sony-akari-fix-panel-3f0308e3b1ac

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

