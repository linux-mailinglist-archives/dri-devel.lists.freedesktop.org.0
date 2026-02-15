Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8+ydMaghkWkRfwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 02:30:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C413DDF0
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 02:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E7F10E077;
	Sun, 15 Feb 2026 01:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR5F+BD2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmcvUv5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78D210E077
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 01:30:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61EMj2Fj3148290
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 01:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=jBdjvbhgs4mo+6yDeg310o
 PdNsfQpz1VHf9JGW/dw4w=; b=FR5F+BD2sUpLdKXRMGX2BrGUWYhMwcZWbic119
 AKWmkmuIuY8JtSJ/ihtr01J2TYnji9aFEpoTQJFE9UiWxlQv7DYkbA0MCQBWPHMX
 5DWDrPwIcU98pUBASTM/eQBnPBFh6V/yAPrAVVISTX70rdLdSA7mu8TuqmVAEIJ7
 a1nTx21L1U9/ZvVE1pQCOXMKmS3TlO4AEiNxBXpkPBNo9FjOWR298UmxWitCEAa3
 sQmJUTWPkWMlAJBLWCZluuqilgQVAyFc+HXNl10D0WOU/DsC3Hp1i3L9XtWPB25g
 uE49SPeL5UcoasVppeQYiBhNKS1p7squNSPvkgVPZHdT8sXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagmy1pd7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 01:30:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb390a0c4eso1298732885a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 17:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771119007; x=1771723807;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBdjvbhgs4mo+6yDeg310oPdNsfQpz1VHf9JGW/dw4w=;
 b=bmcvUv5I7Gw5FPk2TVJIFbZEAMhbH541g5u4/bCDtrNBpS/CY5LuubJVkaHccq6iR1
 kT324oDF/3nZlbY+Y4C/RxCVjq0UGShHV2Lhs6JhIz6TK+rO/s4VQnWIK3tny5utZgzC
 LrsjgGrT2rsxSIfrhEhd/102H1VCnXdj2ZHvwaRJCLjQ+aBoDBhPSd7DAnQDCVtUmnHB
 zB9IdQ01D20pnknDUFWdFxZAD4NMj0/S/M3hUVN9Zoa1U8ig90hOpctdfrZnOsZGkgjz
 tCop2wWO1f7fDz5NJlQZgHsnbtUrjZBESvkTt05wM6nswgcRmP/rH6R/9lWcP490fkdD
 LNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771119007; x=1771723807;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBdjvbhgs4mo+6yDeg310oPdNsfQpz1VHf9JGW/dw4w=;
 b=Q5IAiglEsqR9pZYXPktY+U9RZYLbBZTQZI4PEKbPv1cQoHTtcTxmLI1uZlTquSyD1M
 W+/GLkdLn52I6u4xMdbIeHFn92d0nHREN5HT54fx/R7tPWjSh5keemX+TPHyBNtlhjBZ
 W2LZPINjFsWama6RKrG12pNts2uuTkaCrkGaE8Qz7QB9aFL7o1JMK/nXLbh/JyFNAXMu
 8G80rIca1RxfXpH8RiyHgvuKoeuYLPN+oMVW/NLDuM+Snz079AEtbyyMVCreigQcLTTY
 Nz8hynOy7cu4mNMXyOcx3zYqbzCqnRxyyFPimihXV9F57HX+Bn7wuyFEzsG6E731Uf7J
 0z/A==
X-Gm-Message-State: AOJu0YwTmUY/dnIyvHG+1K3IOOfP8AnHpr+VRXG9q5pEdKD0WF1htcdJ
 trAmbY9aELBQhhi6GP1ibbuIowl16PkPFw0kELyccQf2LStsVsrJG3GW4zlN2nYFMoEmjhubMdH
 6l4/A7j1L4XwbmxvN/cPfBoAE5TUEXezZ8Tb5XpN66ze01DrtAG4u5locWoBP1PFyPyTyJqc=
X-Gm-Gg: AZuq6aKS2V8U/LCMQbCxfaUckXVQgZmg23z+eY5I8Ynh9OxHnKTsHTjcpuLWI8vTiuw
 tk7mLLzWHJZosy0t3d5VXIahzoVElNa8Mof2qsIjtPUyX5Zwmlv9VhatmJaGwQLRHa5kl3rUETA
 DddofzaGrzyK/1QQ/bmR0TvFPK1A4pa5IMxp895kLlqnrk8QeZXjY6NzWK/7WuOzvJKRRuWHLvw
 0a+1L1dALX0vnVVhRaVCoH9FyMl/nJf9tTie0fXvXG2mkDKkZsQgsyrIfQhrTBg+J8SPq0keSqi
 EY0NXpZZc4Z3zIEAADfSBZkBamgidqR01mCwIcICBiElLdHHm0UXR5NkOZsjTKDI1hmfHPmgHpe
 t+sR458HvqTP3hbfF/pkrTOtF90RjxLlRRz2c8bipBlKgw5kPHXqfeFDcbYiBrrGicLE+CumvfT
 eph6PrRgLbgk8guNhlaCeqAF8QecrnLt3YHu4=
X-Received: by 2002:a05:620a:4690:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb4bff2bc9mr509310885a.57.1771119006895; 
 Sat, 14 Feb 2026 17:30:06 -0800 (PST)
X-Received: by 2002:a05:620a:4690:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb4bff2bc9mr509307085a.57.1771119006434; 
 Sat, 14 Feb 2026 17:30:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5ac180sm2395068e87.63.2026.02.14.17.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 17:30:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 15 Feb 2026 03:30:02 +0200
Subject: [PATCH] drm: bridge: anx7625: don't crash if Type-C port is not used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-anx-fix-no-typec-v1-1-75172a5ca88b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJkhkWkC/x2MQQqAIBAAvxJ7bkFNC/pKdCjbai8mGmGIf086D
 sNMhkiBKcLYZAj0cOTLVZBtA/Zc3EHIW2VQQvVCSYOLS7hzQnfh/XqyqHU32HUgozcFNfOBqv+
 X01zKB4cJvO1iAAAA
X-Change-ID: 20260215-anx-fix-no-typec-4437cb7e54d2
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Salendarsingh Gaud <sgaud@qti.qualcomm.com>,
 Amit Kucheria <akucheri@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zcpFJXzM+ERCFokqZkZgVUsorPV7r4ZuefKzy8bOb2k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpkSGa/QtfanSTFg7WDjVLxhE3OCzxCLwTDyUlV
 TcKDduqxzSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZEhmgAKCRCLPIo+Aiko
 1QakCACwX5szgmetBSqcuDDPlu8dttRpDjPgBNmxGRqBK2k0HHIxdT08Vqm/pmFXgvlGx12PMC5
 2WX/PpzaolVvZqtid2qN27OW1gRiejtvHlC94BI/8VDS+Co7gXRBnJk2NV8Th5yir7DPqALgJIv
 jhrlz59Y7hGo+pDby9XtRrl586qPh6N1gIdcejf53cHw75EW+dkZrqfmO0x7b0F+8ym+QRnV17Y
 S5om37X1g7LZErUqqHg2gCMMB6ulYkTyq2gdIOfdiMMX4BykPHYh2l3jBAg2xbVqN7w/LQcV2cF
 /6dztgNrIcaQrNN2x+gkaJ0w7ots5aKLdEXZsy+I9kQMVXQ1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sg2iGXCr9kLbWxxLk53uFIfgcmesRAvg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDAwOSBTYWx0ZWRfX21HATP9Tgp3v
 QcUuO0k17+LX5wmVp+DTj4jLa7iEK1MgZP5B85pG+SXTnpeIXv3LxjO3HnqrFbGqOXTsam0lZV5
 THEZwmKee/qNIsLoaroIaSUl1kDcC48BRkPYL/Bizs0C/7P6LY7Ux2AWNwMP/qejA0pTIewd3ZV
 nPWedGhU10vkCPcRozo1i4NL70wBjpWNXyU5p0QBKru9uPVGFw7Uk/heyx0eAG+r4lf9H1WYmJ5
 2Zz0yfDuA24gN2Zbk+pR6+TKLMl1r5t9CAjaZfMKJOYlet25VQrOj3DdSuwUUvMuK26OT9XOEWb
 FHbXvQ8pf6EeDoukSdBVoy22gPXj6f386XTXc7ugQtohsy0UQnUM9iFB+E+OWZqleJXWykN7FaH
 YT2CseWzMIifYeqUzT+Y3HoqBLMcyAX2bJMFXfhapTj7kM2Rw308UzV1FA7D4t8uwMB8A63dCvl
 fVg/z5km6MTaJVDTDOA==
X-Authority-Analysis: v=2.4 cv=f5xFxeyM c=1 sm=1 tr=0 ts=6991219f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=TIDTMd-Ta_KNcxKDHRgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sg2iGXCr9kLbWxxLk53uFIfgcmesRAvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150009
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
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:xji@analogixsemi.com,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:sgaud@qti.qualcomm.com,m:akucheri@qti.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,analogixsemi.com];
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
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 268C413DDF0
X-Rspamd-Action: no action

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The typec_set_*() functions do not tolerate being passed the NULL
typec_port instance. However, if CONFIG_TYPEC is enabled, but anx7625
DT node doesn't have the usb-c connector fwnode, then typec_port remains
NULL, crashing the kernel. Prevent calling typec_set_foo() functions by
checking that ctx->typec_port is not NULL in anx7625_typec_set_status().

 Call trace:
  typec_set_orientation+0x18/0x68 (P)
  anx7625_typec_set_status+0x108/0x13c
  anx7625_work_func+0x124/0x438
  process_one_work+0x214/0x648
  worker_thread+0x1b4/0x358
  kthread+0x14c/0x214
  ret_from_fork+0x10/0x20
 Code: 910003fd a90153f3 aa0003f3 2a0103f4 (f9431400)

Fixes: f81455b2d332 ("drm: bridge: anx7625: implement minimal Type-C support")
Reported-by: Salendarsingh Gaud <sgaud@qti.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
[db: dropped chunk anx7625_typec_unregister(), wrote commit message]
Cc: Amit Kucheria <akucheri@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c43519097a45..7f943b6548f3 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1567,6 +1567,9 @@ static void anx7625_typec_set_status(struct anx7625_data *ctx,
 				     unsigned int intr_status,
 				     unsigned int intr_vector)
 {
+	if (!ctx->typec_port)
+		return;
+
 	if (intr_vector & CC_STATUS)
 		anx7625_typec_set_orientation(ctx);
 	if (intr_vector & DATA_ROLE_STATUS) {

---
base-commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9
change-id: 20260215-anx-fix-no-typec-4437cb7e54d2

Best regards,
-- 
With best wishes
Dmitry

