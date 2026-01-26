Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IVjKKNTd2mdeAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:44:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE087BD4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3C10E404;
	Mon, 26 Jan 2026 11:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iApFT25W";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwOPRUom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA50910E3FF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:44:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q5ULDp1019118
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=7JvqcK9e0H7AF3SY4MIS5r
 8jRgm7eiNjlPSCZqHodE8=; b=iApFT25WzQth5lPfwRiPg1UGcC1SH7fDdVgwUb
 fXhowxvx1+aTa1ZGHTyVBV6ZWCAUJTZ3dWTIGUiLQ7v7PIku9S1p9mfQ5ZIwUbOZ
 7hBHoZOyJ8jUc+WpHUPm8lGXxUNVapLFktBHBpYO67hRSDUVOWi81WMHmEI+GqvW
 fd9RpfYX9Nw3Rd/ZBEsSV7oL4GNjqZwhHC1ITWFbrY5E8dLdFZh8qK/JQoX8WVAx
 neW2J5eqQQfpDG1XF8rOs7/783no512V3PZ5EVl3+6oXI3vTbtGlUqjcMsI1rsnR
 jyiNaxVtN//g/Ox0ihhmGd7+Eq7DgiG4cAq3Y/x2JXWotE8A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680v9v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:44:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5f557e3890eso7877837137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769427869; x=1770032669;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7JvqcK9e0H7AF3SY4MIS5r8jRgm7eiNjlPSCZqHodE8=;
 b=EwOPRUomrbKrB1ZalHGuGyPyGP2RSKZJh5IrITYv2iq9UI2nfhCLcxqqgACXmF86By
 Bnl5odKph57+Mdw5UjWn3qLjnZ9UiqDgPjTagz8SOV/Erwc3ZUqL+KSUu4gtg+sf+XKu
 bh5U6sTrugl4k6lwQ8ev7U/EqrJ7mEbiFw/TAwqpUl+3zOg3aZ+pgDggSzi6c1aSMvcu
 e01f5nZRzXP8oGzjUGbdHdwED5QHKemsdaOToeuao8JH4nw6/DBz75uvY6d4FvTTZZYq
 ZbAQPytLIh3cOlLlq0sgUjp2frOmvje/f5HoYlamLg3nZM5F63AUTLwLQVpXYkMNpJYY
 IEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769427869; x=1770032669;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JvqcK9e0H7AF3SY4MIS5r8jRgm7eiNjlPSCZqHodE8=;
 b=FsrwSeoe0wr7uruGtp8m+o/kygj34O3xy/nbGI7NC9sXkhzGu/usYtZ1r/CudH2Y1G
 97r0wPsWkuRkfh+/YQ4QuzrP1Ccrw4rDIU/voWiDEQMU+ZnJOjtY90xQx6eZ+r0qPGv6
 gqLcejrG5plQ8YZiVmWfmxtHvHHCRDTjVoJXqz273KA9yQYL7zlweWAeb5icLXfuKNWB
 b/MTCnyGx3Lcagqt/eCHIcAttoYarfW2lQBtflA++FLbrMXgP9hXKD5jtK4s3MQq5oq+
 Cm48KaH//IBkPK4VEF29z1rxwFbPkrTNHLqYE5YDYKkujQOqrOtfrhMyLUCrVU0NTTzr
 SznQ==
X-Gm-Message-State: AOJu0YzHZhLSFhSTdG3nyPvHVJrhmOrWV9r1uWIa2fOld8pSf/vx1zhr
 U6QNTg5wswtUmIpax55AHp/GL7aUGp8s6rhn0sorjShPWe3Vqwuyu03RLpkhdKx/MK4E1AJyxRO
 gLxtYKTB13xrLOZks+LTiRFFqYV9UaD7Tpc4VXZ2sCCvtao+0iEcB1kL5H2Aq5zcax3CEeLk=
X-Gm-Gg: AZuq6aImwS0uWVCoHm6lvKSEY1J7mrZp9RWOGdpcG3+3NVkYv5GA5silsdN52iZT5ku
 oSTHfooOTvjwt8Epo+8HCoF/dto5w3FSKHnkDT9u17OwAx9+UyHz9neZJuJ+rvutTPDJ8G0fSBt
 jIpP92ByVWau8EQEU8YgixwWEpx4A6Sv4ql2CdzGIMrPf9e3cKwVDghAhNdd14dUl80TAT2YprB
 nrIgMKww44UUgKTBSa/bUCEY58CjagKa7D0TeU7VD4qsslKgcWGH28u6HoZUMgy6bxifRWm6vV/
 vfxodJyyGYU5E/+saX9T8nVs8LzPpaRv3CWbUI2YWrX/gwxdV/bmYvPC2RYDuPP0x5YZcRrVfDp
 LbRXkEDu63sfEg9yVMsKLhw2BdcD1BcT8Xb3tLVCbGL0d10WbWlOgOJxWvLF0N9FcLFistSjp4E
 6vH5lXa49bjhKqp3fU/7tmjSk=
X-Received: by 2002:a67:ea4c:0:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5f57746da4emr968516137.22.1769427868998; 
 Mon, 26 Jan 2026 03:44:28 -0800 (PST)
X-Received: by 2002:a67:ea4c:0:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5f57746da4emr968504137.22.1769427868560; 
 Mon, 26 Jan 2026 03:44:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de4918b1fsm2555472e87.49.2026.01.26.03.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 03:44:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 13:44:27 +0200
Subject: [PATCH] drm/display: bridge_connector: move audio_infoframe checks
 to OP_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-drm-fix-lt9611uxc-v1-1-04a635a8f5cf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJpTd2kC/x2MWwqAIBAArxL73YJrKNRVoo/QrRZ6oRWCdPekz
 4GZyRA5CEfoqgyBH4ly7AWorsAt4z4zii8MWmmrSFv0YcNJEq5Xa4nu5FAZZmobZUajoXRn4CL
 8z3543w9QN3LQYwAAAA==
X-Change-ID: 20260126-drm-fix-lt9611uxc-05ee19305a52
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YDubPE+WzD+Uekf1Ws2Kw2bqT1z3B1UMKLqYQYX0gZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpd1Obg4ni1//EjInDfrVbjR1NdJC1laxc/zTUB
 2ST71w9i+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXdTmwAKCRCLPIo+Aiko
 1VuOB/0X73VRJLg/CKVXbZSXriFP8rLul7mMjVgQIelJdh6GiZweXpwufdBT8J45FE+gp1aH/gj
 aS6WYIrhIZNarK1BiySd913eJlBK1ZEuk7D26d22MF0Rbc2Ik5LX5rzhgk8Np9hMKZyK+y5ZXTb
 /NP7t0uHnd+x2RjDIFPzUOsxeA0ezyri2+QqfZLJVaQihKt55KuyPK6XMb0naUBRJA+f3hUuwL9
 rHVP5cqs6+ffpQaSGBoKV8E/Z/if9qcsuUnmHDrPhZD7DPAxmFfqQRIKKvCS+EaWmhXdB4x0LoZ
 CPDeZgNyojminZSmtgGC1NOm9mi0f+/OVvw6lBvG5/1EYZSy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977539e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BcIX_E39gDakrSUOSVwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMCBTYWx0ZWRfX9QBfU7/so/Z9
 SVjBgIyPUUrtpv/UpHqbw1KSlDVhrfdbAvNUwfCI6bdk6uarNuezmQ7ac0UpRFWgYvHUFI6fuCs
 44vaejHgah/XVPdT3O4Q2zUH1AAwc1SStYlm0EU/+AurfDY8nCyKt+SG2++6HaL2Zda5f3Tl1MM
 tlqJXvOdHD6yDvMoKKmAQNIIMx372vTWb0/siW6TLrwenRQORnmJTvOY55Flt5/5hBXBMFbE82k
 SPaySmsSy3XgfpvJ8bcMRGIkIAumWZXqDIficqsVKIab3apaxuqHHM3UcEkO8/WLZ6pGEaKYIyp
 2Qt04bkMI0E8H8QytkbYMZb1XixtypsTMdFHlquHVGglrpzWWn4sEbwF0IyhXSL7wYoZVPlNFbB
 D7L4fTXaeZuutnIyDePbtAIlDf37XEIxwviMpzQ5DdEfDxYWaZMkfrO4ojjOodZnZMndiDpmRRI
 2FBx/MxnosMmxO8+C/g==
X-Proofpoint-ORIG-GUID: 3t_5llEXRUl1nU1ucKJKpQZmTWuE_1Ow
X-Proofpoint-GUID: 3t_5llEXRUl1nU1ucKJKpQZmTWuE_1Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260100
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0DFE087BD4
X-Rspamd-Action: no action

There are DRM_BRIDGE_OP_HDMI_AUDIO bridges (e.g. Lontium LT9611UXC)
which don't implement DRM_BRIDGE_OP_HDMI and don't implement
hdmi_clear_audio_infoframe / hdmi_write_audio_infoframe callbacks.

Move corresponding checks under the DRM_BRIDGE_OP_HDMI condition, making
sure that we require those callbacks only from the bridges which are
actually going to use them.

Fixes: b626b1a1c9cc ("drm/bridge: refactor HDMI InfoFrame callbacks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ba8ff113cff1..258132c6b8b5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -851,6 +851,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->funcs->hdmi_clear_hdmi_infoframe)
 				return ERR_PTR(-EINVAL);
 
+			if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO &&
+			    (!bridge->funcs->hdmi_write_audio_infoframe ||
+			     !bridge->funcs->hdmi_clear_audio_infoframe))
+				return ERR_PTR(-EINVAL);
+
 			if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME &&
 			    (!bridge->funcs->hdmi_write_hdr_drm_infoframe ||
 			     !bridge->funcs->hdmi_clear_hdr_drm_infoframe))
@@ -880,9 +885,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			    !bridge->hdmi_audio_spdif_playback)
 				return ERR_PTR(-EINVAL);
 
-			if (!bridge->funcs->hdmi_write_audio_infoframe ||
-			    !bridge->funcs->hdmi_clear_audio_infoframe ||
-			    !bridge->funcs->hdmi_audio_prepare ||
+			if (!bridge->funcs->hdmi_audio_prepare ||
 			    !bridge->funcs->hdmi_audio_shutdown)
 				return ERR_PTR(-EINVAL);
 

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-drm-fix-lt9611uxc-05ee19305a52

Best regards,
-- 
With best wishes
Dmitry

