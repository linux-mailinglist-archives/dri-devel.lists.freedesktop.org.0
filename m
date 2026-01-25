Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P9BKOn+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB676803CA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3610E368;
	Sun, 25 Jan 2026 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j34VQx9m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVP1aejk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353410E365
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P3JxiF3141547
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=; b=j34VQx9mqIC+owxT
 /qrHhYXdoaLHomDTw1Hd9ylZ29X7bAjAbXW4j5kMJVIRddLGrg0MlRZ+bRGyK5c2
 adw9fGmKUFmewU65w+tz9V9A8ZUVtVHgQ1PULCYeWgPh3gbTGRM3WEcUhWDxOeTF
 bnWSN0re70P2ldtttax2QoKN78Jp1nPyI7Sj5lklzA9KJISuSjxKtop3Tc2n63Qm
 IU86Yhn98kEvlhsHXdp1XgvWEj7ZNMNa4wmEy6lrkXHZ/tIioadoAQ6L3KbL6zf6
 K6vi8ShptKAKeRFisthS66SFKkkCAJILCBh3pbuXpgMf/PjL1kk6l5jES2SK9ta2
 DvkmhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha23s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a2ef071dso1438815185a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340633; x=1769945433;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
 b=MVP1aejkrfUrbgx6riXTV2YDcLeMhTIJsB79zfRKwblVGd++amH9P/ASdG9a8Q/78P
 JJolZ19bA82WVHzgIsS4s5CPvfxG9s67NVb1DrZFQJyqwxDwL2XMspXq4wUQ9GuzR64J
 9b+f7tGhFZgti49mMYt5WsZSteE5L1VFnYZ/ZwGy7Z/jhe8mU3CKZa71myY4wBzhfNsO
 KHJVDHxrIbhL2cMR4SR5hPuS+qFvfjTFTwxGOau3zlx6NvfFEehWAUw6GQy6w9O9HbSU
 a4cFeA7vTs45LyAlDAxo/eMK9j/xlOYdsMelvKdvwY/B/AYKzEgmUjkOSv7QGdQMHj4C
 xznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340633; x=1769945433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
 b=BkHqtliEsTjZa9RCwBZFjrKELgPs8nl6vO3GlEE7AYAlIa2JUoXMBfFyWaThfk+yl0
 CWvoTalkeeGJzFAy730IYOpvmN7hqW24ku12d2PIbmWDfa08B7cxV84ecu9Ihp+vuk0r
 RKxAsPINF+oSbdzVyzlCkHTdnOxu1qZ0mFdChAeygD8hQ90ZJPJkJZMDoTx/6jlAMsdP
 lmq2m48+BeNYpeC2D0J4oCikNzOpEAkHxf9Hy00ivq2ss8mCUxoI1JcuxesIUPrBv0w2
 sR/HfocamrJq/oQxcDguocEMSeK+YMdC30usS20HRxIuhbd00ykC/Y8RbEbUA+yyL9xM
 2ahw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHba6Vu1EySkaNPBIA7kIgX0Vn+mKUE1hVM+ToNcGCPinsWgqu1tRoBO72tf3H9abL4RZ772kXhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4YogfkUiYj++vn1b4rIEIautxi0RLQtHfnmIJZ/Xk1UIeQ6ac
 AtEBJiHlcfQNKqy/IY1gP97wVO6CnYV/nN6yfVHiCUa+lkUIyAXqyg+ue5ASgw62aiIMMSfIeho
 vQWvriHqpwyz7jXf173XkaaT4gvGtrPSotnWU2/xz83xiqEO2rfBzgdlcGOiZGsCdJXVg5oA=
X-Gm-Gg: AZuq6aI82ThGOWMcY4MEkBw+QzhNqlxL0BFVhBxACf+19t/4HGN6YlykChKaC3SJbls
 mLODz4WXMatIi7BIoU+CNa0O+Ys+WR5fT8I6xdspydzm9UmVAN0UQgokKCkKp+rmIJGHl7mjfqW
 0GjUnvfZLEUT479rQMPrCnd5+T2mqct/ZZD2lzb2s4Ka8ktQS6MrjBI5n+n1TgYJSY6kMhhVRPy
 MTllJCKbWHiMjUQAxasP6W/Frxb3yq9xyj9eojyK2BTHMg2Oh7OkjTv+k1jtcm98Z7PtIPwem3M
 CgF/mXBNfpzborlff3blbsJvy55ENIVVEmQKPdqzpP8930Nq/Vgb65QnSo+ArtGFCwj+AIyA7jJ
 nWZJ9aBqs7+q391Z7xbktK8i49sKXbGf4V5UHKDhtVKCsIIG8CaJoRYkgYInJM/NM4lNKS3BRNt
 gh6R1vXcwbYtNbdBko7rBmH68=
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6f9624ad6mr138742585a.45.1769340632854; 
 Sun, 25 Jan 2026 03:30:32 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6f9624ad6mr138740885a.45.1769340632419; 
 Sun, 25 Jan 2026 03:30:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:10 +0200
Subject: [PATCH v4 8/9] media: iris: don't specify max_channels in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-8-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/GFwmt3wB/NNDPoTG7FPLYdaLK8uoEJNB/
 co2oG473LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1T/cCACIWuIaY2aDARq6LRJW0RYbNHy9b2znKquYteXapTrcyF6XjXnM4YwfgdgYrNwwn19rAP3
 yjn/8aWgAm3qaWKj/IqiIzSvGVIDY0knz8qjCiC5/twYYxcyQsPWWm9pVY48zjIS/MfW/Jm0+bU
 qz/euUYTsG7s7KbB1AxAO8GOGiEJ+m2rH2hThU+HTWEnxbpAfy9U18++i3MFMZ8Xp7LLYHtBdzz
 rOOS/fB5C3xR30r7RepYodaAcLYWiiRgbncriHF//yjmrVY9t3jJSspBkjwsMPHhFg31qZneVI3
 0hdRnSXZIw4tVBu7LGn0QHdJrIbFiBJ35V2WE0Esc3StzJVo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX8e+3ziBdqVRV
 xNpF0GF4jZ9VJKgyxrUeAg+qF7aK+YXBR+bJDVogZ/38MW99RdZFTTtdwTLHgkNeCjdatM6lbjw
 pateayd0FFZ/S7ivPM+p61z8qVDqy4OUMl9FMrfS9l0Tyqj1X97uOzI3GKqU9okNESHMnSkdknl
 4wlWX4AMNAhrDXhW7kvfYiejmiaiomYcqR9OU31bumi93U4Q2PtqDbmKngQIBitNS1oQ4PhwCsH
 bKRkt8wbLfPdRFizVQW2wHP7TpGqOiF42byA2SWkE/g2DzIInjb0U98+PpA6qI3WfdG98DdW+fD
 izEaTWJ+HdxxQIVOF6yFGepXXHAL6gmtadeGw83SmIBPhneMN2BZSeJvmxgUcc4WSE97zzn6FP3
 elPggYZHm52tpAjAt2pcQlZ2QMCUvtvzPLr1d/ThVQkQChO6t3kbKxO1H8eHhW/h83itoQ70KkK
 TIeowe3sL/es9sYiFxg==
X-Proofpoint-ORIG-GUID: hshgOfhBb1BRX1XpCSl1PcNRVaw5fkHG
X-Proofpoint-GUID: hshgOfhBb1BRX1XpCSl1PcNRVaw5fkHG
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6975fed9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CB676803CA
X-Rspamd-Action: no action

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 07c58cf3a14a..e8b5446dce76 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,7 +76,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 4e617176dee4..05b1dd11abce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -791,7 +791,6 @@ static const char * const sm8550_opp_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3

