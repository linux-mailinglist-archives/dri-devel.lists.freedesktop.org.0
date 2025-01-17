Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4478A14B9F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6D810E2FD;
	Fri, 17 Jan 2025 08:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vtozj+S7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C98310EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:57:47 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3003e203acaso16973011fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104205; x=1737709005; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uw0PYTWvXGZN0XXOXiRMt4CYqzLIv8o5kdoflMTCxBQ=;
 b=vtozj+S7tr8bgeIaXa/cTkj4Ym5WHBSwRtt7qprYrSJlqPLtnGY0B4YfnJNP/NCPJ3
 dgaSeytnWWJGwRVy5klkwleBJK/4pREXIKuhIyo20QGtH9dN1TUUotwTtUYX4Vws29n/
 yg1W86Q7tESu17Hga5eYvM0fUvxTYj352W/yViN4yWoZyEcxrDh+uzAxsDSrAVFUfykX
 vqYCkMtbS9rRLI/ZH4r0y9ApXF+CXFb+ofH5J/Kd6L2a0HNVr/RUd3Kpo0w7e6hljn41
 p098niBzWsObYRpFRycqra/z8Ed2LS11hi90GXGE9XAUx3oUH8SfYnnaVrPn9/wdAVMS
 N7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104205; x=1737709005;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uw0PYTWvXGZN0XXOXiRMt4CYqzLIv8o5kdoflMTCxBQ=;
 b=wp3BhyNzTNFwdX4lO2R8x7eYdFOxsi9jk6+KORywwey5zFXE9L/pdfVomk6qqXuFbG
 Pfm9aohLI6ZDk4fPUAB/9cAXuF7cAt5/TRXb0vQR114Av1BrMNPT7wVc3BDiWEjFDqwr
 o4IngyVLjkfXc3On5kwLu1pCrQ3K8krT/3aXvb7quiAYmdzDGOh16rdIYkLBpdUWo5jA
 LHjL25bF/nq5KL0Hsu3WDlmLsFVj9nma7iUSxxgstVY0zEEbjIHDO6CpOY3TlOl/2Wh5
 +dyny8yx/15x3ZITIoLwVqUZ/UB/MI7hGcvJg33Dt2uHnHF+vkET6MOQfmUp9TPYenTr
 dVQA==
X-Gm-Message-State: AOJu0Yx5zRgCJ0kW5aMyA6rudfyvX4SIqQcn9BAwfnshI1nxk3+Fst0u
 AohYKeNpJlMGYFNz+5nYBM6JwYQya6Azbi83pCFvW/M5u6Uj2HyjURoAKyzjGJaMW3b8VQATgrO
 2U1c=
X-Gm-Gg: ASbGncshnzQJZlc801j98Zz7ferpVOUkNatkOxEnJzqj5o3VeF6z/OpzkuiSAs42iEM
 sCaEOmRa2rAPSKhlaTG5tggZoEmE6T8DWGbED5K6Uah/2OOETyZ68Hhfbjdanr3GjZqoEWSzLJJ
 FQ0nEWLCUecWURNeK+81OKzXb1ScYYHsUMFCzkeshYkS+Zdct5NFn4cMNx/m4+UM0eQrJ+Vex4y
 FexH2lg7GppZzFCg6t+MhnuWqBHFO6NzTRw5yQF4gUQawiHzJ43mZg7XcSOKvBA
X-Google-Smtp-Source: AGHT+IFAk4rF5mbTcFLJ/pbll3KPD/l3xZj5+xMa71cK6maSe664yCOXJyvv/2medmkgXq3KTeOyQQ==
X-Received: by 2002:a2e:be9d:0:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-3072ca60c6amr6229501fa.2.1737104205372; 
 Fri, 17 Jan 2025 00:56:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:37 +0200
Subject: [PATCH RFC 2/7] drm/display: dp: implement new access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-2-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DNcZKhPphZjqikPskSkFBsKleO9AnJ+79jeieCaJFks=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFIXi+twbKEsS8KONvOTAmsgTtU1stn+Zwo
 wPjeaMkxciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1QrxB/4kdGoIrc9ZoWP4S+0v06FxENqP2AoN/Eo5N2Yanu3ft4rAkCW7cWFMPIeYLNbaCt7ElRp
 v46dzWBk8wXZ68gkjUGcbXJvwx3eftPA2gSgDXVe4eQjD3VJs2KoO4lWt03xxqBmTquhQktTcLK
 zAnK+JLtMatCDVWlVFqXbHtiSfMlYKobvdLKLUlR3taIyxWy9GG6bkPFIB1BWwo9ON9xGp0en+L
 MTi0kQwOq3zmU/sPZJ2wK0Bf+GQns4/e0fdZIeobmpqv1H67x52IhHiFmFNcHR9kIdGsAQnr0ha
 GJYpPeGZZSs6ffTBTP83y1g8UyJfBB/bTJ6z+GVSPvlguGWL
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

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

Implement new set of DPCD access helpers, which ignore partial access,
always return 0 or an error code. Implement existing helpers using the
new functions to ensure backwards compatibility.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 42 +++++++-------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 +++++----
 include/drm/display/drm_dp_helper.h           | 81 ++++++++++++++++++++++++++-
 include/drm/display/drm_dp_mst_helper.h       | 10 ++--
 4 files changed, 119 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 809c65dcb58983693fb335b88759a66919410114..5a693f2779284467e2d05b9d8b2c2bee0ad6c112 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -495,13 +495,13 @@ EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
 
 static inline void
 drm_dp_dump_access(const struct drm_dp_aux *aux,
-		   u8 request, uint offset, void *buffer, int ret)
+		   u8 request, uint offset, void *buffer, size_t size, int ret)
 {
 	const char *arrow = request == DP_AUX_NATIVE_READ ? "->" : "<-";
 
-	if (ret > 0)
+	if (ret == 0)
 		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
-			   aux->name, offset, arrow, ret, min(ret, 20), buffer);
+			   aux->name, offset, arrow, ret, min_t(int, size, 20), buffer);
 	else
 		drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d)\n",
 			   aux->name, offset, arrow, ret);
@@ -559,8 +559,10 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 		if (ret >= 0) {
 			native_reply = msg.reply & DP_AUX_NATIVE_REPLY_MASK;
 			if (native_reply == DP_AUX_NATIVE_REPLY_ACK) {
-				if (ret == size)
+				if (ret == size) {
+					ret = 0;
 					goto unlock;
+				}
 
 				ret = -EPROTO;
 			} else
@@ -602,9 +604,9 @@ int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
 	int ret;
 
 	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1);
-	WARN_ON(ret == 0);
+	WARN_ON(ret == -EPROTO);
 
-	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
+	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1, ret);
 
 	return ret < 0 ? ret : 0;
 }
@@ -634,21 +636,21 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
 /**
- * drm_dp_dpcd_read() - read a series of bytes from the DPCD
+ * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
  * @offset: address of the (first) register to read
  * @buffer: buffer to store the register values
  * @size: number of bytes in @buffer
  *
- * Returns the number of bytes transferred on success, or a negative error
+ * Returns zero (0) on success, or a negative error
  * code on failure. -EIO is returned if the request was NAKed by the sink or
  * if the retry count was exceeded. If not all bytes were transferred, this
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
  */
-ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
-			 void *buffer, size_t size)
+int drm_dp_dpcd_read_data(struct drm_dp_aux *aux, unsigned int offset,
+			  void *buffer, size_t size)
 {
 	int ret;
 
@@ -671,45 +673,45 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	}
 
 	if (aux->is_remote)
-		ret = drm_dp_mst_dpcd_read(aux, offset, buffer, size);
+		ret = drm_dp_mst_dpcd_read_data(aux, offset, buffer, size);
 	else
 		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
 					 buffer, size);
 
-	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, ret);
+	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, size, ret);
 	return ret;
 }
-EXPORT_SYMBOL(drm_dp_dpcd_read);
+EXPORT_SYMBOL(drm_dp_dpcd_read_data);
 
 /**
- * drm_dp_dpcd_write() - write a series of bytes to the DPCD
+ * drm_dp_dpcd_write_data() - write a series of bytes to the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
  * @offset: address of the (first) register to write
  * @buffer: buffer containing the values to write
  * @size: number of bytes in @buffer
  *
- * Returns the number of bytes transferred on success, or a negative error
+ * Returns zero (0) on success, or a negative error
  * code on failure. -EIO is returned if the request was NAKed by the sink or
  * if the retry count was exceeded. If not all bytes were transferred, this
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
  */
-ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
-			  void *buffer, size_t size)
+int drm_dp_dpcd_write_data(struct drm_dp_aux *aux, unsigned int offset,
+			   void *buffer, size_t size)
 {
 	int ret;
 
 	if (aux->is_remote)
-		ret = drm_dp_mst_dpcd_write(aux, offset, buffer, size);
+		ret = drm_dp_mst_dpcd_write_data(aux, offset, buffer, size);
 	else
 		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset,
 					 buffer, size);
 
-	drm_dp_dump_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer, ret);
+	drm_dp_dump_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer, size, ret);
 	return ret;
 }
-EXPORT_SYMBOL(drm_dp_dpcd_write);
+EXPORT_SYMBOL(drm_dp_dpcd_write_data);
 
 /**
  * drm_dp_dpcd_read_link_status() - read DPCD link status (bytes 0x202-0x207)
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f8cd094efa3c0bd6f75b52a0410b0910d8026a76..f8db5be53a33e87e94b864ba48151354e091f5aa 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2128,20 +2128,20 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 }
 
 /**
- * drm_dp_mst_dpcd_read() - read a series of bytes from the DPCD via sideband
+ * drm_dp_mst_dpcd_read_data() - read a series of bytes from the DPCD via sideband
  * @aux: Fake sideband AUX CH
  * @offset: address of the (first) register to read
  * @buffer: buffer to store the register values
  * @size: number of bytes in @buffer
  *
  * Performs the same functionality for remote devices via
- * sideband messaging as drm_dp_dpcd_read() does for local
+ * sideband messaging as drm_dp_dpcd_read_data() does for local
  * devices via actual AUX CH.
  *
- * Return: Number of bytes read, or negative error code on failure.
+ * Return: Zero (0) on success, or negative error code on failure.
  */
-ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
-			     unsigned int offset, void *buffer, size_t size)
+int drm_dp_mst_dpcd_read_data(struct drm_dp_aux *aux,
+			      unsigned int offset, void *buffer, size_t size)
 {
 	struct drm_dp_mst_port *port = container_of(aux, struct drm_dp_mst_port,
 						    aux);
@@ -2151,20 +2151,20 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
 }
 
 /**
- * drm_dp_mst_dpcd_write() - write a series of bytes to the DPCD via sideband
+ * drm_dp_mst_dpcd_write_data() - write a series of bytes to the DPCD via sideband
  * @aux: Fake sideband AUX CH
  * @offset: address of the (first) register to write
  * @buffer: buffer containing the values to write
  * @size: number of bytes in @buffer
  *
  * Performs the same functionality for remote devices via
- * sideband messaging as drm_dp_dpcd_write() does for local
+ * sideband messaging as drm_dp_dpcd_write_data() does for local
  * devices via actual AUX CH.
  *
- * Return: number of bytes written on success, negative error code on failure.
+ * Return: zero (0) on success, negative error code on failure.
  */
-ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
-			      unsigned int offset, void *buffer, size_t size)
+int drm_dp_mst_dpcd_write_data(struct drm_dp_aux *aux,
+			       unsigned int offset, void *buffer, size_t size)
 {
 	struct drm_dp_mst_port *port = container_of(aux, struct drm_dp_mst_port,
 						    aux);
@@ -3490,9 +3490,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_free;
 	}
 
-	ret = min_t(size_t, txmsg->reply.u.remote_dpcd_read_ack.num_bytes,
-		    size);
-	memcpy(bytes, txmsg->reply.u.remote_dpcd_read_ack.bytes, ret);
+	memcpy(bytes, txmsg->reply.u.remote_dpcd_read_ack.bytes, size);
+	ret = 0;
 
 fail_free:
 	kfree(txmsg);
@@ -3530,7 +3529,7 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
 			ret = -EIO;
 		else
-			ret = size;
+			ret = 0;
 	}
 
 	kfree(txmsg);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..548237a81ef0359dab1ed7df6ef0fd1e0c76e0c5 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -522,10 +522,85 @@ struct drm_dp_aux {
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
-ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
-			 void *buffer, size_t size);
-ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
+
+int drm_dp_dpcd_read_data(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size);
+int drm_dp_dpcd_write_data(struct drm_dp_aux *aux, unsigned int offset,
+			   void *buffer, size_t size);
+
+/**
+ * drm_dp_dpcd_read() - read a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to read
+ * @buffer: buffer to store the register values
+ * @size: number of bytes in @buffer
+ *
+ * Deprecated wrapper around drm_dp_dpcd_read().
+ * Returns the number of bytes transferred on success, or a negative error
+ * code on failure.
+ */
+static inline ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux,
+				       unsigned int offset,
+				       void *buffer, size_t size)
+{
+	int ret = drm_dp_dpcd_read_data(aux, offset, buffer, size);
+
+	if (ret < 0)
+		return ret;
+
+	return size;
+}
+
+/**
+ * drm_dp_dpcd_read_byte() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_read_byte(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read_data(aux, offset, valuep, 1);
+}
+
+/**
+ * drm_dp_dpcd_write_byte() - write a single byte to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to write
+ * @value: value to write to the register
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
+					 unsigned int offset, u8 value)
+{
+	return drm_dp_dpcd_write_data(aux, offset, &value, 1);
+}
+
+/**
+ * drm_dp_dpcd_write() - write a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to write
+ * @buffer: buffer containing the values to write
+ * @size: number of bytes in @buffer
+ *
+ * Deprecated wrapper around drm_dp_dpcd_write().
+ * Returns the number of bytes transferred on success, or a negative error
+ * code on failure.
+ */
+static inline ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux,
+					unsigned int offset,
+					void *buffer, size_t size)
+{
+	int ret = drm_dp_dpcd_write_data(aux, offset, buffer, size);
+
+	if (ret < 0)
+		return ret;
+
+	return size;
+}
 
 /**
  * drm_dp_dpcd_readb() - read a single byte from the DPCD
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index a80ba457a858f36ac2110a6fdd91d8a1570b58e1..d527b323a7a8c92b93280fcc8cd3025e21cdcf02 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -899,10 +899,12 @@ int __must_check
 drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 			       bool sync);
 
-ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
-			     unsigned int offset, void *buffer, size_t size);
-ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
-			      unsigned int offset, void *buffer, size_t size);
+int drm_dp_mst_dpcd_read_data(struct drm_dp_aux *aux,
+			      unsigned int offset,
+			      void *buffer, size_t size);
+int drm_dp_mst_dpcd_write_data(struct drm_dp_aux *aux,
+			       unsigned int offset,
+			       void *buffer, size_t size);
 
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port);

-- 
2.39.5

