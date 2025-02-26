Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D2A4593A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8279F10E896;
	Wed, 26 Feb 2025 08:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cnxzbjt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC510E873
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:44 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso7780071e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560383; x=1741165183; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HxAcg2Edh0LLCX/q03x2dqp484sdB8Gfc9kAJ/WMpN4=;
 b=cnxzbjt+sJ0H2TOf/j1//T2a0MdvxzcHDn9jVkIZ5DR2iAOAGkWTUn8UBxAzV5PoZL
 u2qGktmPTMxoG42aGPMRqf74j2WiZwk9FLoMIV11oVtxOgWcKN10H669DpXOrhUXNLgb
 Io6qPJedbSdbPrV3ARm3uaLDXHqL2exM5H1vLgWw2+B4dHnVmA/GgstV65+1j/v8ZqV1
 vxkSgeSrzn/YMbDgR8RBqg5NKrhGrHrs/3h23mujaigmjs7G0nJSeXCRAKOoLcsTy5Uq
 EeudeQTh7gyliJlIdvMjzPhZijBG0kDQNDC557O4XmkNFY9fE6enDlRFUWQkXsqI3tAA
 1ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560383; x=1741165183;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxAcg2Edh0LLCX/q03x2dqp484sdB8Gfc9kAJ/WMpN4=;
 b=qenHVNFDgmVdu5g+Qfzs+afxXabEofQ7O2tAXXhiED27VVO6tx1u/Gvz/dTvLLpuVa
 clNeESiV8ezuJK09uPYJLc5fOFqRhwumC+ts2c8sM2FP9iqJUuUeE72X0h4wVuF3YEg8
 jKXX0wgrAiRO/CIjw2TEi7KmSTKXY8nBW6ZMDb6ssEht2arqOGZCQRo3IB/md7Zenpk+
 0QM4NXxehQJclvV3R6N69PjnhiCvIXUAs6arH4RcYYXOa7TRMx5JGi2xUmK0+v9uI9o7
 B+2FOM1W8STLLxhvDclZw2PP2z21oTRevLJU4lF9+6rXdwaM7syOWkLVEoXe1GF1kT+6
 wi9Q==
X-Gm-Message-State: AOJu0Yw8aidWLMikDin2mujvNlthilfXtvxAPmVOIIsD8Nsb1xGjVPc6
 5w9XecopTNwAOXLnw9gVcyP4UlBoqx2hLt7BIathhr3uA41rEYUMbn/HQa8Qu68=
X-Gm-Gg: ASbGnctMInlJWaHW4XymJhZ95h4EwWa8fx4KYqXaHqZFACPXs3vSu9PMKSHIXhRcee0
 zoBHN4t2lrWaBYN0bF4XwbRtidb5DXYeJcyB0Vsj4zsVLxnfA18LfQKnQbhSDhXaNu6Mkl5lcAF
 a1ofKU+i7wFlgTJDuU65YnCydIBCBUSFSuIEiANp6DX5G6/b6cbQhCXBa8mWAK+OLy5YQ6j0BTE
 kq6X+a0I1M7emBw3H3/ACgjbEtncgUKsSjFCkJ/89hWzVSYwco22ycneF6hjCjJC+aLioDN+El9
 mk7yb+ciAlv8Zo3elqGOptD6XDLLZEi03w==
X-Google-Smtp-Source: AGHT+IFo+WGQZv/2HHPDxvc16/ldl7ZK79qJBQmkGWyMeSV3pDc9yvGidvBoz4ORQ7EVM5XREMFT6g==
X-Received: by 2002:a05:6512:3b06:b0:545:2e85:c152 with SMTP id
 2adb3069b0e04-54838f4c9d8mr11853120e87.34.1740560382489; 
 Wed, 26 Feb 2025 00:59:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:29 +0200
Subject: [PATCH v8 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-6-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=spKKvIsUEXwYtFbU2ADRWxlKua9ZC3kOdX8BM/6IO2g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftXifKCqVrCyjGdTISkAmAEKpl+UusHqw7J
 liRrBG3F8KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1YE5CACuM/zNqvGkIJ71dxbuQhP4b4ogbNqVS6jh+xo6Is38O6E90kX3zS3FVweT5SqnmJXy//0
 H0vvA5pf5YVLDM+M4m6bRTLA7XJs1eNrN9/Qw3kPoxKeR80jn8nPvECyVME3UvD47OgUjSI/3zQ
 O3RbWP6zs8/nLA6PoYyc9UvXBaDEl7qkO9Oxvmo/7paHsP2HBcdYaTUF22+x6UqC6njkPEk4oxB
 ngmCOCf16/J92GxV1qxo80XsECIruO037m+iIl6LdeL6vhKygL1AO+68VH4pgsD2hAvNqYQALTY
 uFPXleqUNTS28xjOs7Iu6tvODgjah7n6ZA5i7XX8F+ZNcqm5
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

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
+#define SPD_IFRAME_LINE_NUMBER 1
+#define VENSPEC_IFRAME_LINE_NUMBER 3
 
 static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 					 const u8 *buffer, size_t len)
@@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
+static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure SPD infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len < HDMI_INFOFRAME_HEADER_SIZE + HDMI_VENDOR_INFOFRAME_SIZE ||
+	    len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure HDMI infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
 static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 					   enum hdmi_infoframe_type type)
 {
@@ -176,6 +246,25 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 		break;
 
+	case HDMI_INFOFRAME_TYPE_SPD:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 	}
@@ -197,6 +286,10 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
 	case HDMI_INFOFRAME_TYPE_AUDIO:
 		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_SPD:
+		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 		return 0;

-- 
2.39.5

