Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 73dBCBZDgGnW5QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23AC89FC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433710E111;
	Mon,  2 Feb 2026 06:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX84cSfa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx2++doy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7D310E111
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 06:24:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611LeS4c454603
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 06:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=RhPwoU6j4NpDQ98Qu5+RlO
 myVHbomubDAnF+W2Sa4q4=; b=cX84cSfapw5hT7IygfiWLi6PxAuZnBkmDs86ky
 lD8uAZAmJfThprWfeLS1TcAfW7fJ8V0Ui298/NGAhKuwXcpdQmAl48NnuuOAFKJp
 2oSpFwU6UuiEOhdF3kCIdav8FpfBSnFRqLqZVCTghU+omZuoaEiKFjXHIPNb1B7c
 N0mLNytosF20mBWYTWRm+EugfXYIkncWNWgpaY2LanxmJ9XXsnAUB/UA/p6QjkJv
 nlXZDTWrR3GicPsv0eL7qMLKmiC6oIRSXFs8l7X9QMejkg3PXi5pCd9Ust2yfToN
 GFhnJ6kzKDSkLn0z25Ru/RL6Y+XM4dViVi+2z6hpRyWFcoLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arec5m9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:24:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3545dbb7ee6so787088a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 22:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770013455; x=1770618255;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RhPwoU6j4NpDQ98Qu5+RlOmyVHbomubDAnF+W2Sa4q4=;
 b=Yx2++doygPDcI+A/kCxzVXDk5M+Sj/NxePuLKv9xxOgohZQbHC173Rr/TC5dAvhILd
 0qB193hpPWGLm5HgtQhTd0BzvuT9mEeHABd6vYwZNl3xtrY2sk4dhwKNdfH6Q0ATsb0n
 9ASxXPnN8Q3OX1TZ+R1F9gw5obX9gOnqklK4WkVJVGs+D5kooOanHVB47k7pGqVE24UI
 YqdfiFArX1c7Tvz+24ZMJcN2988Jm6+au4SR78JdSSJHAoQf8mN8oexqPPLtYsK1VwpH
 MEUnxrVz+5EoHnr4MN2s8GyPxOZuyRQ2UvpslKHfP2dEv/uuSd7+7y8GTEj9fdtzLVVd
 N9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770013455; x=1770618255;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RhPwoU6j4NpDQ98Qu5+RlOmyVHbomubDAnF+W2Sa4q4=;
 b=Qmns6BrQCV6cWVfqaeUW3M/kLONyLuA2ZumlAfbC77W28/vs68Y9qhXad2EnHeLKsh
 sJcdMv8lo+WU9Idl1+/6CB1KLlmNUbB0gBWc/l1NJllY2Rx2da081J1V7JasCIGUYg7H
 dF72n8YYDo1Ksu0cAOh9BM7kwBv4cz2zv9AN6XqcfjnMoQjwCkpSXv0VzgzSscAlM63y
 o65hKYwsJmbnj0uQmG9o85sqgtEOa23JDVgcC40LQmPgyPY3L/87UFDVKFwh27FJjoCT
 xoceIfs6a0vBA1TiPud5Xcpnr7P8OVYsNGeqEei2mCUVEaFGNl6NLrVGrZJXLoWSAhA8
 KJZw==
X-Gm-Message-State: AOJu0YwUJfFX0vpSNJimdx/IrWhr0DqjtcBuu6UHTihPmLEb57CCrKTB
 in8pGQpPvMmeCfMw04l23vsvAYHOusMYUSWB1wpCgZJNB4t42xCXq6aFE229dN6NA8hHfzQmx/A
 M5nubA7QmDhJ66cR4uIurqqS4VlryxHI7ELbmEYXCNj+YztLMdvnM0w1Ts46JQ9DwskeJgQ==
X-Gm-Gg: AZuq6aJRppx56Vhlntr9puumilUSgwKlz21egIVekH8g3Pu64wzC33LfQctWgZZizmb
 hKpsI+IWjnPvQcdK7REt01AIUUOauHqKPxtql3kmP3W6u9TSPvmGpi8s/QKU9TvIaQOvJVZsS2h
 Z4iLX2omN6vYSQNM69Yjt9+twCVQTzj8K6/KVw57QSQWOnPpweftaMzrDiCbMl0NrrQVETJGgdh
 SkZLMI5fo2uylhYvkvz4jbFM89vJOdF8ZYUPQHVMdTIdEzEygANCUpzR8LGZIsJOONw2wHNlbOD
 62T7ZeVkf9eqfvPXrVyClphvJSxUOxW4dC9ecWBxndZZRn/HTLoRDjwNhtJZEQ+a4BHEFJ2j2yB
 8990ZiTj3J72I/LnRHYHuOPA3tO67h+g018k=
X-Received: by 2002:a17:90b:28c5:b0:343:684c:f8a0 with SMTP id
 98e67ed59e1d1-3543b3ae12dmr10523054a91.23.1770013454608; 
 Sun, 01 Feb 2026 22:24:14 -0800 (PST)
X-Received: by 2002:a17:90b:28c5:b0:343:684c:f8a0 with SMTP id
 98e67ed59e1d1-3543b3ae12dmr10523022a91.23.1770013454109; 
 Sun, 01 Feb 2026 22:24:14 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f3f0872sm14308248a91.16.2026.02.01.22.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 22:24:13 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 11:54:05 +0530
Subject: [PATCH] drm/bridge: lt9611uxc: Increase EDID_NUM_BLOCKS from 2 to
 4 for extended EDID support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-extend-edid-support-v1-1-1355a21479b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAARDgGkC/z2NzWrDMBCEX8Xo3A1a2VYqn/oeJQdZu2oF8U+0c
 jCEvHuVGHoZ+Abmm4cSzolFDc1DZb4nSctcAT8aFX79/MOQqLIy2lhdA3gvPBMwJQLZ1nXJBcb
 ed/FsCT9bo+pyzRzT/rZ+Xw7OfNuqvBylmljEv+VD86++FmcRtz1AZuFyfNwNIIzISGfDFJz+W
 kROt81fwzJNpxqvx9ELw6tIZWha9ta5sbfUYjC+x06Tiz602sXYs45Gd9ghqsvz+QcXp360AQE
 AAA==
X-Change-ID: 20260202-extend-edid-support-b5a4f76d1832
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Ravi Agola <raviagol@qti.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770013449; l=5505;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=XDXVbAf8EfBUzSG0QM7cpChzXFDrxct+fuKagwOh2W4=;
 b=oSlh1JYVKzgVxj/5p+0cOMVul+GbfLHkfPOM2xs+rrhUzTRkUYBHS5SE1HYtQHTPOQOAg8BL6
 lvFfmsrEiEcCQQnMaHwQLZRPiAlnDAnC/jna/Vogy7YQQPBAtSZNN3e
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=6980430f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-aYIMrUCS7XEg8IQLSAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rHHrzbjXT_xhBZaEY3KD19p-SsfOw8S-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1MyBTYWx0ZWRfX3GBqkw0UAt99
 xWH9XI+d9RrvBM8Z8uNinrPyXW8xjY9a32c+vHqH9pXCT4VqpzebviaG9Ilm5DnGa7+Mul6t1hy
 g+p+nFzZRRBF7pXoVD1/hoNk+X+yeELe/DdKxz5RD+FkOrnKVBfFenqWbdWpqXs8TiuMfwqRnRg
 ++oIc7qLXKy9PnW3hkDqiT+8P03FkYFEdVv5sAT9okiJ2IinmC0mdTkqavSEolnHXmPeo+VXffZ
 VLfRbDxNRKUJBuU6mReDBkwtKuNDZjI/1elsGeWJKaFOb2LxadsikJsR4sN79ZSjMxmG09yR/G4
 QzlN3GHx6kLkWGkW2xPplwiI+5/TH44kva939yPam4QB29aFygN+4lMMkLPuk2qAQw0S/2hRVyr
 s63y18GlaBMYYsCk4TaPgACqSZxo5UuJ7483B9e/JsToiEEFKts+DnrY+c2Zpvkx55BM6y4iZ6X
 k0kN9zlOvskqvkBkpOg==
X-Proofpoint-ORIG-GUID: rHHrzbjXT_xhBZaEY3KD19p-SsfOw8S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020053
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:venkata.valluru@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:raviagol@qti.qualcomm.com,m:nilesh.laad@oss.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nilesh.laad@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,gmail.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nilesh.laad@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6A23AC89FC
X-Rspamd-Action: no action

From: Ravi Agola <raviagol@qti.qualcomm.com>

The lt9611uxc driver previously limited EDID reading to 2 blocks, which
restricted support for displays that provide more than two EDID blocks.
This change enables the driver to read and pass up to 4 EDID blocks from
the LT9611UXC to drm_edid calls.
As a result, the driver now supports displays with up to 4 EDID block.

Signed-off-by: Ravi Agola <raviagol@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 93 ++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4d989381904c..7fe481c7acf8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -28,7 +28,7 @@
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #define EDID_BLOCK_SIZE	128
-#define EDID_NUM_BLOCKS	2
+#define EDID_NUM_BLOCKS	4
 
 #define FW_FILE "lt9611uxc_fw.bin"
 
@@ -61,6 +61,11 @@ struct lt9611uxc {
 	/* can be accessed from different threads, so protect this with ocm_lock */
 	bool hdmi_connected;
 	uint8_t fw_version;
+
+	bool edid_available;
+	unsigned int num_edid_blocks;
+	uint8_t edid_raw[EDID_BLOCK_SIZE * EDID_NUM_BLOCKS];
+
 };
 
 #define LT9611_PAGE_CONTROL	0xff
@@ -170,8 +175,12 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	connected = lt9611uxc->hdmi_connected;
 	mutex_unlock(&lt9611uxc->ocm_lock);
 
-	if (!connected)
+	if (!connected) {
 		lt9611uxc->edid_read = false;
+		lt9611uxc->edid_available = false;
+		lt9611uxc->num_edid_blocks = 0;
+		memset(lt9611uxc->edid_raw, 0, EDID_BLOCK_SIZE * EDID_NUM_BLOCKS);
+	}
 
 	drm_bridge_hpd_notify(&lt9611uxc->bridge,
 			      connected ?
@@ -387,10 +396,32 @@ static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 			msecs_to_jiffies(500));
 }
 
+static int lt9611uxc_read_edid_block(struct lt9611uxc *lt9611uxc, unsigned int block)
+{
+	int ret;
+
+	lt9611uxc_lock(lt9611uxc);
+
+	regmap_write(lt9611uxc->regmap, 0xb00a, (block%2) * EDID_BLOCK_SIZE);
+
+	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0,
+			&lt9611uxc->edid_raw[block*EDID_BLOCK_SIZE], EDID_BLOCK_SIZE);
+	if (ret) {
+		dev_err(lt9611uxc->dev, "edid block %d read failed: %d\n", block, ret);
+		lt9611uxc_unlock(lt9611uxc);
+		return -EINVAL;
+	}
+	lt9611uxc_unlock(lt9611uxc);
+
+	return ret;
+}
+
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
 	struct lt9611uxc *lt9611uxc = data;
-	int ret;
+	int ret = 0;
+	int retry_cnt = 10;
+	int edid_ext_block;
 
 	if (len > EDID_BLOCK_SIZE)
 		return -EINVAL;
@@ -398,19 +429,59 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
 	if (block >= EDID_NUM_BLOCKS)
 		return -EINVAL;
 
-	lt9611uxc_lock(lt9611uxc);
+	/*
+	 * if edid is read once, provide same edid data till next hpd event
+	 */
+	if (lt9611uxc->edid_available && (block < lt9611uxc->num_edid_blocks))
+		memcpy(buf, &lt9611uxc->edid_raw[EDID_BLOCK_SIZE*block], EDID_BLOCK_SIZE);
+	else {
+		/*
+		 * read number of block available in edid data
+		 */
+		if (block == 0) {
+			lt9611uxc_lock(lt9611uxc);
+			ret = regmap_read(lt9611uxc->regmap, 0xb02a, &edid_ext_block);
+			if (ret)
+				dev_err(lt9611uxc->dev, "edid block read failed: %d\n", ret);
+			else
+				lt9611uxc->num_edid_blocks = edid_ext_block & 0x7;
+			lt9611uxc_unlock(lt9611uxc);
+		}
 
-	regmap_write(lt9611uxc->regmap, 0xb00b, 0x10);
+		/* read edid block */
+		ret = lt9611uxc_read_edid_block(lt9611uxc, block);
+
+		/* compare first 4 bytes of 0th and 2nd block to confirm
+		 * that 2nd edid block data is read successfully by lt9611uxc
+		 */
+		while ((block == 2) && 0 == memcmp(&lt9611uxc->edid_raw[block*EDID_BLOCK_SIZE],
+				&lt9611uxc->edid_raw[(block%2)*EDID_BLOCK_SIZE], 4)
+						&& retry_cnt-- > 0) {
+			msleep(100);
+			ret = lt9611uxc_read_edid_block(lt9611uxc, block);
+		}
 
-	regmap_write(lt9611uxc->regmap, 0xb00a, block * EDID_BLOCK_SIZE);
+		/* if more than 2 edid block are available, reset edid ready
+		 * flag once 0th and 1st edid block read is completed
+		 * so lt9611uxc read 2nd and 3rd block
+		 */
+		if (block == 1 && lt9611uxc->num_edid_blocks > 2) {
+			lt9611uxc_lock(lt9611uxc);
+			regmap_write(lt9611uxc->regmap, 0xb02a, (edid_ext_block & (~BIT(3))));
+			lt9611uxc_unlock(lt9611uxc);
+			msleep(100);
+		}
 
-	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
-	if (ret)
-		dev_err(lt9611uxc->dev, "edid read failed: %d\n", ret);
+		/* set edid available to true once all edid blocks read successfully */
+		if (block == (lt9611uxc->num_edid_blocks-1) && ret == 0)
+			lt9611uxc->edid_available = true;
 
-	lt9611uxc_unlock(lt9611uxc);
+		/* copy edid block data into buffer */
+		if (ret == 0)
+			memcpy(buf, &lt9611uxc->edid_raw[EDID_BLOCK_SIZE*block], EDID_BLOCK_SIZE);
+	}
 
-	return 0;
+	return ret;
 };
 
 static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,

---
base-commit: 3ea699b56d31c2a5140d9fac309ff5e0f2041411
change-id: 20260202-extend-edid-support-b5a4f76d1832
prerequisite-message-id: 20260202-lt9611uxc-reset-edid-v2-1-b1e1d72edc90@oss.qualcomm.com
prerequisite-patch-id: bbe63ef7dc85903a286cefd9aa09f1e2e96351b1

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

