Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF29E6AA7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2910F072;
	Fri,  6 Dec 2024 09:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rcZBAASm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F5210F071
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so1923291fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478195; x=1734082995; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VnGo6ZNwboubgG4PK3zPxjFnyRb2ICdQLCcJ6lGvxCQ=;
 b=rcZBAASmatwg9f76M348+EcTSbYZaeOPRCNcWgVEfPuDGFP0Lw1InpBU18rx5IMwSF
 0FOMKdojjnA6cVidyXqJuqab6EiOo8CzGIUkwVQ1TybSKbJ/8tPKb2LmO8d3/Fm5Js5+
 7+77NIJgJ5VJvVy+7b7WBgOke9BeueQ9ZhmNRf9qeF5juzMgNSNOCOg3ZBZqCzHzM/+b
 9a/N+exj+lodJHs55sGWUS3sdPYgSREmQMlRV3TFWsOAKWrayrke6ybZcs+kk9J2wB08
 cixjq8o5l644vwGlIRoWLY65oOBblIkJXRoz/0gI+/RkkgQkM9H4brvcuEusF6PIQUVO
 ouZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478195; x=1734082995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VnGo6ZNwboubgG4PK3zPxjFnyRb2ICdQLCcJ6lGvxCQ=;
 b=C3RLdU3Bkia8K13fPrPczJY1TFytSBWwDdI8zWVgf1qRdRdbhuXepc7I6bzvMfkNCZ
 2/aoAA92U6B2hzHvgyE+AqZV6rn0DpIQRpsY9ywCPIdPruY4sRzhQSTMFV8yzG1FPy9p
 SIrOM/D2RpldK6j4MvRiXDgR8gkolu3F7svrx3B6LXopu903HmGnqVjauUe9hLIWVXrq
 stW/S3p5D84rA2TqymKtzBUYsWNbx6ZtPf4gtykhoSrlGot07h6Rpn1/CmLiFUDh6fAm
 EadPGsV0S3XnrnuYw8f5xCJszj/uf9f2ihTSXmRGHOhrUUsNurlHULWBGrQH8YeeFTx+
 8RpA==
X-Gm-Message-State: AOJu0YzWxPNTSfoVS5Cb/2j8NwyKWo1/avgAdWmZHQqJi0TCq1lY9lOD
 Ik8JM4QGrhmyp2XgHFnN88oYNaYjCCcO5X6HPb+JCFdCiwZekInRhjxo7qlW6/U=
X-Gm-Gg: ASbGncvBr+oVOnJ+Agh65hv427mQTpO49a4ohY7D5EOFD8SXPpRr274tjjiTs8woHeo
 LaI5/BMPc5yH7EKVWLTlnqLgIzUzZYk9I69MYa4PoBkExXISUBE1rmNjqhpZqiOhL9P1/2bh2Tg
 3vPSxhzFP8AbIxCd/cMxEykxrVukYnbLbxmDNzsOBEB7m80HMtdrlZhPdhoyweeNDzp0p3dkzJ6
 5KYdJn59vS/XoqHYA4Sgk1JlMgg+R8lC/JnJMQsZgatJ4rB46mJcWNFEw==
X-Google-Smtp-Source: AGHT+IHOfIBmoyEolZXZdyLfUjfRu7LK9x/y6e2NRNb0G1IfVvxWYDXdxw9kGPS8sm9OVNX+a5FRXQ==
X-Received: by 2002:a2e:bea8:0:b0:2ff:df01:2b43 with SMTP id
 38308e7fff4ca-3002f8aaef2mr6873121fa.18.1733478194869; 
 Fri, 06 Dec 2024 01:43:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:04 +0200
Subject: [PATCH v2 01/10] drm/connector: add mutex to protect ELD from
 concurrent access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-1-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3Q5pbMu5lborNDPG00HVqHDspCjjhjGT9968qr3bz9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUsctUfPifOTQ8tgTrVr4NDA9HQHo4lV6wGZ/x
 802YkRE+OKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLQAKCRCLPIo+Aiko
 1YTBB/4+LnnhEaD+gppGgLjgyd7DzGULNQMgJ2hoRulbF1tCZiqhH2JwwQgaiFxKaCK13GN72v/
 +MlHzrTYbtF24x6wcNLxIFk87u2wdjCt5dO8xqKiiFF4My86VJebVFFgPQmUXcFvMWkWUS3PByj
 f9McLONHSWPtO0XRW3DbeQ8zzl5cChJhSN8/mkvwrNqq0BkWWOEDxxROis0bi2KSFK0/SBEJ2rN
 X+RhP/l08plhS1bGyEvzzOyAMvtpjSEsEYXf5mCZGGnypfY+YKJQ1VDkpPcX3/Si3R6D3pZ0Vpw
 Wfr3vj5voa6Xeg3e/NqY4k/PPQjahgFQwpQeJMdgalo1w5Zq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The connector->eld is accessed by the .get_eld() callback. This access
can collide with the drm_edid_to_eld() updating the data at the same
time. Add drm_connector.eld_mutex to protect the data from concurrenct
access. Individual drivers are not updated (to reduce possible issues
while applying the patch), maintainers are to find a best suitable way
to lock that mutex while accessing the ELD data.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 drivers/gpu/drm/drm_edid.c      | 6 ++++++
 include/drm/drm_connector.h     | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..bbdaaf7022b62d84594a29f1b60144920903a99a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -277,6 +277,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
 	connector->edid_blob_ptr = NULL;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ffbecf5c08d58e2f54bfb76f30b930..13bc4c290b17d556d654b7cdd8c48c24a32aba9c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5605,7 +5605,9 @@ EXPORT_SYMBOL(drm_edid_get_monitor_name);
 
 static void clear_eld(struct drm_connector *connector)
 {
+	mutex_lock(&connector->eld_mutex);
 	memset(connector->eld, 0, sizeof(connector->eld));
+	mutex_unlock(&connector->eld_mutex);
 
 	connector->latency_present[0] = false;
 	connector->latency_present[1] = false;
@@ -5657,6 +5659,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!drm_edid)
 		return;
 
+	mutex_lock(&connector->eld_mutex);
+
 	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
 		    connector->base.id, connector->name,
@@ -5717,6 +5721,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
 		    connector->base.id, connector->name,
 		    drm_eld_size(eld), total_sad_count);
+
+	mutex_unlock(&connector->eld_mutex);
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f449d70f3b92a00985336c4f2237bc6..1e2b25e204cb523d61d30f5409faa059bf2b86eb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2001,8 +2001,11 @@ struct drm_connector {
 	struct drm_encoder *encoder;
 
 #define MAX_ELD_BYTES	128
-	/** @eld: EDID-like data, if present */
+	/** @eld: EDID-like data, if present, protected by @eld_mutex */
 	uint8_t eld[MAX_ELD_BYTES];
+	/** @eld_mutex: protection for concurrenct access to @eld */
+	struct mutex eld_mutex;
+
 	/** @latency_present: AV delay info from ELD, if found */
 	bool latency_present[2];
 	/**

-- 
2.39.5

