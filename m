Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGmEIh8grWlcygEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 08:07:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328AD22EDDA
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 08:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3342E10E021;
	Sun,  8 Mar 2026 07:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XFTXUIjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C7B10E021
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 07:07:07 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-82985f42664so1907412b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 23:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772953626; x=1773558426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GFLfW5Q1Ig6hjSxU05JacS616Nm8ZTLRMtzhmvCENQY=;
 b=XFTXUIjcTIwYBaq1ew/Puikzt1tHcV1J+XTte+JIPfzqAV2sdqataVFdHhpJ6DAjVg
 ju2LIVBy85KOIc8k89ARR/j83lYke6dwVdYLQrdm4OAOYM75JFuch+bkZy1HfyWVANPu
 my7xtMBKOSZk2tA4bGX7zM0ynCpacqOlk7K4+f6RumfNCT2M0EnrqoQrmBeqscvPJdTv
 amNrE/334icnlW7zku8+QPF3W05MZfu53jcSbro3oXhBSlM4VgC2lI6x2cRN62gTkT8e
 XdFrK67BCisvYVAeBAeNKpXdzVJpVULqaAfoOTTAXMQEBVgk9zFhqWkXpyelxE6L29f+
 8B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772953626; x=1773558426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFLfW5Q1Ig6hjSxU05JacS616Nm8ZTLRMtzhmvCENQY=;
 b=IkR7IUT9wdaAxk3s1zpVTlY1yMakkPc2QxOKYoWaiOgivUmWlQgbfjVuIv/7Z026LN
 ZzGDLVIbPkNbECUOBiN6wWIF8zCiuWL3TwFXvnucBcrCc+t1P7V8TeDcNIF7CBmaRDzj
 xuQfHD3A3/sECNgSbrguHCBBdGA8jOms9CiGZi4tatAlg15zExkWsULLG+C+EH44zDss
 MA+8NTP+J2PfTnyd16Ofy4GTLkBbFJHtm7EqRAREPW0eKwqf3TtWYC6b0LdrpRjQbVEQ
 0Rk3uDMzb5PutLvthxX3iH+spXgdVtP/oDRKF+qfcGPzfK6nwVV/ozcwUs5Cy3MVl06+
 IAsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdNcZR1ZcQCO9fLkUgEU0/C19L1efs9d9nup+U+MFyhqTMNzrv7AYSfFztqAcbscleRaN9sLiyiag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgz7bsrgrnGOql3cKazDt5I06icn0/YyfarJNst83uYRnIzgun
 xhIFtaR98GYrzUoAu8myIA1lahBRgF9N4JgXXPryV3BC873xmJAva51B
X-Gm-Gg: ATEYQzxg1v/Hr8asyUvTHDxd/Eyf2qRb8BuCfqZmIEho5n4S/p5Dms0H6afRhmelAya
 ErlXrANaTVNWC7GdUH6C1rn3Lqv7O8mFc7fVPAMe0g8jyOhFZeDnSE1Hbg6/LM4j/UEjqprGTRx
 O+kOFGJEVTbAUZqsNtIjoiBORlR/xb8bALeFP/nqog0BThnU6udajmknHbmcdUKrOUohuDFuvFU
 ZVxM9+yk8Ey4h1NbWFP/BCRThHJrgc4TfvdRdZxksBTjyZ2j8Ty2qvnOYXRBR/EDB9PZ3YcUKf4
 ZAN/1g0GeKikw6DBSf3gh89n9s34F3sUMNYSzKi3wKLDnfMJ8VplFpcNtrOo8uQ1ubkNRM8OsJK
 iQjJQoU9qwrhGbjXLXz3nF1qLxKnBfW6zcPKYIYcmck9IVzmFV/JoGVlNZ9jABK9Io585DshCH/
 ze9C3ciWeqTEU85zAOL7ojIoQTemIU
X-Received: by 2002:a05:6a21:6f16:b0:38d:ee4a:e82f with SMTP id
 adf61e73a8af0-398590d62b0mr6919892637.63.1772953626562; 
 Sat, 07 Mar 2026 23:07:06 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e0a7156sm6048604a12.2.2026.03.07.23.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 23:07:06 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dsi: fix pclk calculation for bonded dsi
Date: Sun,  8 Mar 2026 15:06:27 +0800
Message-ID: <20260308070628.482527-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 328AD22EDDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Recently, we round up new_hdisplay once at most, for bonded dsi, we
may need twice, since they are independent links, we should round up
each half separately. This also aligns with the hdisplay we program
later in dsi_timing_setup()

Example:
	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635

if we use half display
	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
	new_full_display = 636

Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v2: add a parameter desciption to the function doc (kernel test robot)
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..06f094fc32 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,6 +569,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
  * @mode: The selected mode for the DSI output
  * @dsc: DRM DSC configuration for this DSI output
+ * @is_bonded_dsi: True if two DSI controllers are bonded
  *
  * Adjust the pclk rate by calculating a new hdisplay proportional to
  * the compression ratio such that:
@@ -584,13 +585,30 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
  *  transfer time and data overhead as a starting point of the calculations.
  */
-static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
-		const struct drm_dsc_config *dsc)
+static unsigned long
+dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
+				const struct drm_dsc_config *dsc,
+				bool is_bonded_dsi)
 {
-	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
-			dsc->bits_per_component * 3);
+	int hdisplay, new_hdisplay, new_htotal;
 
-	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
+	/*
+	 * For bonded DSI, split hdisplay across two links and round up each
+	 * half separately, passing the full hdisplay would only round up once.
+	 * This also aligns with the hdisplay we program later in
+	 * dsi_timing_setup()
+	 */
+	hdisplay = mode->hdisplay;
+	if (is_bonded_dsi)
+		hdisplay /= 2;
+
+	new_hdisplay = DIV_ROUND_UP(hdisplay * drm_dsc_get_bpp_int(dsc),
+				    dsc->bits_per_component * 3);
+
+	if (is_bonded_dsi)
+		new_hdisplay *= 2;
+
+	new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
 	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
@@ -603,12 +621,12 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
-		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
+		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc, is_bonded_dsi);
 
 	/*
 	 * For bonded DSI mode, the current DRM mode has the complete width of the
 	 * panel. Since, the complete panel is driven by two DSI controllers,
-	 * the clock rates have to be split between the two dsi controllers.
+	 * the clock rates have to be split between the two DSI controllers.
 	 * Adjust the byte and pixel clock rates for each dsi host accordingly.
 	 */
 	if (is_bonded_dsi)
-- 
2.53.0

