Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL+LOluncGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1ED550F8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F135F10E72F;
	Wed, 21 Jan 2026 10:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4YBrQ03";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBPfZbgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6210E72F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L9ecFb3991392
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cgTKx4MA7+dif+0LvGOR400AipzpMKmAwQS8fpYwQPg=; b=J4YBrQ03wos/J3dd
 ATJ4V1DVpKNkin+X5TL3AIFE9p15vh8CwAAiv4KnbdY0R4FeGHGLqPAEK124eU0I
 OPbP2Njjx3mq9Zdo3BXj46if6WgdWJ0Y2UNzS9OLd3yEQotQRLupUJEwr8ZXkt1h
 7wRdffVnoReuPu0s5qrul6v16eVKQdzlYufhQqhVB99+Shz7hcm3AjdR0bVymk32
 ycXBiPwIgZotjNvcA1Vw3ONAI2oFRQq8llWptAAEO2nvSStH+gpkA2FgHqnyapfK
 xzEjDLqHxrRtM9zf0S2rQoDe7z+AYf9XHFOg8pqyL7CMoprOyfop5FrkM7YctvjI
 WadA1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm41qjr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c5e166fb75so171261285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768990551; x=1769595351;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cgTKx4MA7+dif+0LvGOR400AipzpMKmAwQS8fpYwQPg=;
 b=PBPfZbgQ1pAghTlqEmZgiuTp9/bhxe3cI8TJqIi3SbM0/mwUHQ5ztk2IIu7yR+DuTR
 Yr4D5IRYW8peAmE8sbTyhjbOUOPZdfDT72l3hNnwMp2HslAr0H+pVqSBfl4Kw0Kx61hU
 RpAPYlnygy50fT4XDb4VXrWbPHtFNF6iTMNdGXSCGcDfU4xH9Y0BT1jMl6b9PJCGHxbJ
 TLQ5QLUqah8+TC44Sr328trLRlsAJy5amCCE54L8o3isbBtuD3KQKupFfRhjsBNd//Nk
 sqeWVgwqDd3KB2CUl581ylnWJXGebwY7U6eBpz8amejIQbIytl0LbuNOsG+2YDBoOmKj
 n7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768990551; x=1769595351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cgTKx4MA7+dif+0LvGOR400AipzpMKmAwQS8fpYwQPg=;
 b=BqEDvp65GmUfgdahQkKecc26qrCmzU+qmybde47IF0pnvJO25hXMf0/OAG/BrKuwAC
 C+PbP/oZ1mqa9p0kgCJVKxewhvK43Ba47D2CffKXmFR+E5TPsC620nmuKqKrBDP4KZSJ
 v5VRJKfgQEH07OqKRduIbmYyGo8RGsrPVFuAJCApB/UeRXu+eBAScZOAQ3rYc1GnyGU7
 i5BxziDzAlbpd7R49jm8CF3MSO96dGWr/RT21eKkkj2zV2KcaeYtJ4sq3b0TReAZYwGT
 VnwJAPF+tB48QJyXgRi4XjAX4cKNtfJ4MJJj3Jdj0ZdN5Km8TP5M5eHrwxo2MgQS417g
 U7sA==
X-Gm-Message-State: AOJu0Yz0MInvFiCrpkNp5l0Mrv9WUD4vPu2SiMrZ6uxhrW7x8SdhJlRS
 ChdOghAelYXJYceb+Rf5+fckJFbLRBup+sUmUJmu0r6/Y7U5xKC7hT4RFkPFIdLZKPA66e84zhb
 HWS++87ECT9rTWpK426aqzUI9S7DEyyjfoOXzWX22x3LvAVoYtwRJjBJHozmLMqFt7HiF94A=
X-Gm-Gg: AZuq6aIW/5KnevTIh8M2Kcf2BmRgI1K1y13ARioO6awdD5QzCC6mkdM8yW+JYNupPrt
 7W8LbruUfM66Iwzqf01ScwwsKQC6jdi+Z6wSdrc4lIAR97xwByl/uDPbdWLxLCkk6V2A1410Gbf
 GLIP23c9ZqZB1ONpfgc1YSCZ2TkW/ObbNKsDTenHoRNKzIxNnFWsyR3wXenlQy6GGyGIUEZGFSQ
 DwumoNYPRqtBPEhSc4uUqrHMMtzqhZs7KSroVBltKEce73eWEW9Z4WRglN1WxhuEn/mgOi9UGn0
 8kouRsrGMVY2H+ZamUyqt+2k48//IsWXKmsUZoxWurwj6yhVYU2LVARAMBlU76GL/M6wRtSNRFb
 WOM35k6zxHAlGZsbh0CRNz4BApf1YjK4bvfG0tt+PIIJ2EjCnHBC1g1WGhDEOdYF7GORGvLLOIu
 d4CTIZAXjW8Jaa7X1ybbTw3cc=
X-Received: by 2002:a05:620a:4415:b0:8c5:2b23:bcce with SMTP id
 af79cd13be357-8c6a66d2248mr2329266985a.17.1768990551142; 
 Wed, 21 Jan 2026 02:15:51 -0800 (PST)
X-Received: by 2002:a05:620a:4415:b0:8c5:2b23:bcce with SMTP id
 af79cd13be357-8c6a66d2248mr2329263985a.17.1768990550619; 
 Wed, 21 Jan 2026 02:15:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:15:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:15:47 +0200
Subject: [PATCH v2 3/3] drm: bridge: anx7625: implement message sending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-anx7625-typec-v2-3-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zOlSDJjkzETZjT9w08GWmGIzoMmh2Y8jvx1PkRhsows=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdRkXfMCnUJ5mQFeOZtvWsmXjX8XdqS+3tXZ
 5dY35bP3AyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1aAkB/4zQ+hoYV7IgDRMPJrr3xpFBAPy/xWb57Wq2oOez2MEovA03mIuZQL0cbd2EjEXxWFAsPd
 AyFZetuenlv9UIGyJt5WWuINXmy0L9kRV4stFtJlnECFPx40pG7CX5gBU4OObi0T2RqWWKIVoyY
 CUi1eh36ixtztQeiXq3/vM0NAz4Pll8GxgpYyzWfAqkuDnJGgmgHc8BUja/4zGJsjCG9y1pB7uh
 5AxSR0tIiF+QNVR3f4S4qqMBzkRqvnaYl5jz9HEwCk/GZ7iy/OkwKLxF7uTwcwaCP3X/nTAIBJ1
 HpQgUKtcRqgWojDjhU8TLPHk0vQshsVnY3wSSfOzhvhwJkjb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970a758 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_5utB2yTlrchjXRSIYoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -fLGQoVr5b11sFJIOvTuQG9rpFOOjeRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX0ldYiW+rDE63
 rW80o+cLQvPtjBU2yT9SETMHJ8HLY2qW4Y/9Hb0mdCuK1ppC6j3CuBxLnRTO6vYhtVh4TdQvyYK
 Rx+I0uVUkv937jvIaUWoLvJ4dUF9b+ryKlbZj2+vMrP07rlh7s9x3hqvshmrzpSCAKAayIpIZdd
 6mRUJ+E4PCkZ425MS9yP94WtHH43rzqK9HUZNvkvP+2PeA+72D88W22pYbB0UTTHgCJaoTkp84t
 GZDOUaOIA/5a4c/SC2dl+gETmqEzSk6xa7WLCF4qB6UR6LzE2RNrvnv4R/wPUGZ4omA3pZf+EP7
 g5LQ+pPig83J3eeIitX9QRuZ7kbbtVRsr2dtc2E0jtDbn4wKk63cuiczIvfizRaTc+xT5jMy0im
 lXNoUNYqwX6HTo7mxb+Zi0h67Dlp1XSL2ZFIIW09HSJgULcyUr5kejuCqyEbAVIILctYwak/DHU
 tobQ+4OqfF6jOjLkotA==
X-Proofpoint-ORIG-GUID: -fLGQoVr5b11sFJIOvTuQG9rpFOOjeRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xji@analogixsemi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9E1ED550F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Swapping the data role requires sending the message to the other USB-C
side. Implement sending these messages through the OCM. The code is
largely based on the anx7411.c USB-C driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 68 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h | 12 ++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8dc6e3b16968..c43519097a45 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1484,6 +1484,73 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 }
 
 #if IS_REACHABLE(CONFIG_TYPEC)
+static u8 anx7625_checksum(u8 *buf, u8 len)
+{
+	u8 ret = 0;
+	u8 i;
+
+	for (i = 0; i < len; i++)
+		ret += buf[i];
+
+	return ret;
+}
+
+static int anx7625_read_msg_ctrl_status(struct anx7625_data *ctx)
+{
+	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, CMD_SEND_BUF);
+}
+
+static int anx7625_wait_msg_empty(struct anx7625_data *ctx)
+{
+	int val;
+
+	return readx_poll_timeout(anx7625_read_msg_ctrl_status, ctx,
+				  val, (val < 0) || (val == 0),
+				  2000, 2000 * 150);
+}
+
+static int anx7625_send_msg(struct anx7625_data *ctx, u8 type, u8 *buf, u8 size)
+{
+	struct fw_msg *msg = &ctx->send_msg;
+	u8 crc;
+	int ret;
+
+	size = min_t(u8, size, (u8)MAX_BUF_LEN);
+	memcpy(msg->buf, buf, size);
+	msg->msg_type = type;
+
+	/* msg len equals buffer length + msg_type */
+	msg->msg_len = size + 1;
+
+	crc = anx7625_checksum((u8 *)msg, size + HEADER_LEN);
+	msg->buf[size] = 0 - crc;
+
+	ret = anx7625_wait_msg_empty(ctx);
+	if (ret)
+		return ret;
+
+	ret = anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
+				      CMD_SEND_BUF + 1, size + HEADER_LEN,
+				      &msg->msg_type);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, CMD_SEND_BUF,
+				 msg->msg_len);
+	return ret;
+}
+
+static int anx7625_typec_dr_set(struct typec_port *port, enum typec_data_role role)
+{
+	struct anx7625_data *ctx = typec_get_drvdata(port);
+
+	if (role == ctx->typec_data_role)
+		return 0;
+
+	return anx7625_send_msg(ctx, 0x11, NULL, 0);
+}
+
+static const struct typec_operations anx7625_typec_ops = {
+	.dr_set = anx7625_typec_dr_set,
+};
+
 static void anx7625_typec_set_orientation(struct anx7625_data *ctx)
 {
 	u32 val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
@@ -1542,6 +1609,7 @@ static int anx7625_typec_register(struct anx7625_data *ctx)
 	typec_cap.orientation_aware = true;
 
 	typec_cap.driver_data = ctx;
+	typec_cap.ops = &anx7625_typec_ops;
 
 	ctx->typec_port = typec_register_port(ctx->dev, &typec_cap);
 	if (IS_ERR(ctx->typec_port))
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index a18561c213af..957d234ec07c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -67,6 +67,9 @@
 #define CC2_RA                  BIT(5)
 #define CC2_RP			(BIT(6) | BIT(7))
 
+#define CMD_SEND_BUF		0xC0
+#define CMD_RECV_BUF		0xE0
+
 /******** END of I2C Address 0x58 ********/
 
 /***************************************************************/
@@ -462,6 +465,14 @@ struct anx7625_i2c_client {
 struct typec_port;
 struct usb_role_switch;
 
+#define MAX_BUF_LEN	30
+struct fw_msg {
+	u8 msg_len;
+	u8 msg_type;
+	u8 buf[MAX_BUF_LEN];
+} __packed;
+#define HEADER_LEN		2
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
@@ -497,6 +508,7 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	struct fw_msg send_msg;
 };
 
 #endif  /* __ANX7625_H__ */

-- 
2.47.3

