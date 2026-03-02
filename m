Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EJjDWRfpWmx+wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:59:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBCA1D5DAB
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5619F10E481;
	Mon,  2 Mar 2026 09:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeegeD1h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLWDB0/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6C710E47F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:58:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294aZ23753080
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bE7cXBgl82noKkmwqoVuvgJNtZGtDdAz98XZIDAB39Y=; b=SeegeD1hz4lXuoZS
 V/AOdYDFg5QWXJxLOEBiqL+531OuD+euR9kOk6mSE2B2tO+zazW0aV5O1WsSN5F3
 /unorODttgAh9ABeowCDTORmAJDqU6UMYfmxaWYeLpJzt82EaS5YLdMsAZCo1M5z
 bMhIu593m6aHF0Srk6qPpu2zM2Z8NsFYTcBQfCUOjvm16NbvbgkOK5Eq75gZEkSU
 BdilVqEkD/TMRMKWSWstvU2kAtveLkfxyKCYRnu6MhpdljziHnGjO3JLhBF/1jiD
 sz3/GfdmL7v+a8P6RnY4TpOYyCZ4v7g2PDv62Uw9ZwGf6ebcyan6z/bTZTXtwlrH
 LrwveA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq86q0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:58:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb403842b6so3935802685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772445532; x=1773050332;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bE7cXBgl82noKkmwqoVuvgJNtZGtDdAz98XZIDAB39Y=;
 b=CLWDB0/qpBRCJnW8q8+sGNLb7874SDTIxMsKTUIVXNlx4bfuyFlrbhFNtK4vYzHRXW
 GyPW31S4Fu959aYDO7fGDVpY+/fs2TpVAMrMhwgCXMgVs+vVrbO8rhVfAVBg06A/HHN4
 NVJ8eOriDQYnekJLJVUvASGgnqI2MWop/YLC+18I4C1mqJD4sUVeFlOeEMJpGqzNp09S
 eCnDlmWwChqgg8WCybklThPnBQZ88Q/hgQmMyhSHf4FvsZtTFjeQw2nQfSKlD2tIWiKy
 ayEdAADhvc6mYuinrnGURVvypB3ZMcZLUh7CaeDyPFyk1CDpsHeAlyxmhfLPi/npNR8k
 dveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772445532; x=1773050332;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bE7cXBgl82noKkmwqoVuvgJNtZGtDdAz98XZIDAB39Y=;
 b=f5DEFQSbXxHoNLSMumCDdnzGplC0dQufGm/3AuFjq/K/CaP2PEXVlQl6Gxp5pkw/sa
 5Cg2Ketv8zqQSARYUO/O3LydySM+qRJEvBtadBEcmJwfXSAP+9sFQfnGF0k8unOXn2rq
 CjQUMTiAXNSbHbzN4SZ8R3Vqc6DzYJ0TVuNabbJ5awSZOvMqOcEvG08xPM2ZexR9lQ8J
 gxdwu0pw1SAy7i4SoFeh8UPj7x7Wjw+4LlKIx1L92VVtIbG+i2PQfaapYhib2mDM3XFC
 P4D9+T73lG8EZVdeWdelNcPcfiNKY6jmHvS6D89bC/5eBUuJIZi0M/PzuBJ2qEgytvJ+
 Jc0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrga7UrrPqJE40Jd4z1NqaM955j7VdVJR+kjAHTyAoEG+4wjyKeJUM1Rwp9UOgQ1itiIrFXQbuT1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeWGrBtHBWEUDfrB3fVPzUwt2LN0UOMwWUTSx+TN1hint8GUoZ
 kBeAtABAaVZK/s+lG3J7+1sNp84XmSIZTWr5kTqkN5KT/FvoqA1fejYB54B1exAak3ctRUmpCuC
 1C8U9PrNcISAEaJfcxueaJ4tB4Sf/lShrdFe6g2AXToD18+UGIFCSm5P4rvN7vebXV/Q61bxxKZ
 V3qXM=
X-Gm-Gg: ATEYQzz7bO3fgo1D/qFWcHfEzeyGMqF8EJZQ0WXs++y1GKefeCfMxgDuTA//15pOzSj
 w2mXrpzkuQM7Hgg8F/WmJoULHB/SH+Igh32F0la4UcBao7xhAzlfdERKXcC+K4YGGUGXBuKHCA0
 HkhJVJHmuzXYSzLlnMv+8CLW0+StOVxLUUePGVHuqo4jBX19uC3ml3aqT11g+y5VixASMzdHVoS
 97GzlUq7Z219vdgNbA9890ULILVhauekvA4+7udegHUlmVX3m0zDZ2X7lFMDNPoqSk85fM1HBmS
 zsyBQ58DDP4giEPIvacApuMNrQVwNyflqkAiTIFiavhaKK4yV80qoLOeMjfjWsCYm/YPbT2T8d5
 jQSJRMTMy6DEi5QJYb+L1CJYKjGdwYQ==
X-Received: by 2002:a05:620a:1aa1:b0:8c9:f9c1:5ed with SMTP id
 af79cd13be357-8cbc8f35ca7mr1466373485a.63.1772445532009; 
 Mon, 02 Mar 2026 01:58:52 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c9:f9c1:5ed with SMTP id
 af79cd13be357-8cbc8f35ca7mr1466370285a.63.1772445531458; 
 Mon, 02 Mar 2026 01:58:51 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm9523027f8f.30.2026.03.02.01.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:58:50 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 11:58:36 +0200
Subject: [PATCH v3 2/2] dt-bindings: display: msm: Fix reg ranges for DP
 example node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bgrDQddMpC0T0+XPN1eI3F9hMvfYD8c9iadBebpyucI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppV9U2PxF2Wt53jeowr46vUdHXLlHmcMIp0kxp
 HhP1C3xc4OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVfVAAKCRAbX0TJAJUV
 VpYjD/4v3IpLGU6agRGm9J84EidLO6aT0bomX6Cbei5ENeKZf96Qyko0cFIN3N31RNzqUNH5xpN
 aNZij/c5vwXkbW1R9kwBLH693dEr+CRwqSPLimYTZyS39H2PiAoFoZxIttUaHfHC7RXiqB/4d8/
 G+a5WqMb2i2DkwRzaywptUAcvvY614ZTrfp32ZWeUnuhaj4L9Zg5fad9VbKuSasz2+gFatceh6v
 uvuZdpllWZYwXEPdVenYVQs6MXLUyo6ovB4WV/Tdhaq8ZeS+Jy33LIgIX6GANECmdFH2233M127
 QsCXd/Dc/3xKTrjjgIPO8FXRHpBjHizN/OMe94PSv4kwBJT6j6MZydL9hX+pvGsQMol2QShHBdv
 8XgVi8wNvjRagcDAobEBrGelxOeXSYAypi0sFanWXEXcWvAkxG3+X3IIFQ/ZTYYFtDp7XXcHOW1
 wWwqJsVOrdNB866wl3kebMY00mvOyXyeO3Mo6V14yYzSZUELxpX2NNDLB3rPEmeT0Ade8rwzix6
 R0AhPdqWSl+F7LWXYrwui54Xi/zc0ksv/wDg5vzGDRJE/YaiOVItCHXMX31pQbxDeCAzHS6GG7E
 D4Pkf5Em11AP7V9Pb3PvdjXbPjH8oqVTYvjxOPoyjub1ErKcDgF+Fmfgei/cZK7QEWbf8D+Aec5
 kGilhb1jZiqv3WQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5Cuyt2soabwV1fyIIohxMSdkJpg9Edje
X-Proofpoint-GUID: 5Cuyt2soabwV1fyIIohxMSdkJpg9Edje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfXz+rA54FkFnnE
 MdoNkSvFkSr+PdVBVgx5nRVz0xStYqfeP/fsgHtor1hpbfkxufPWTcdpOXnm4n1C9JKIm+/203Z
 oJzzBu/z89DV+IFxIBhkBIUhfc77OWteoNGjSmTCoVyT/ac8k91W9eUjdmeMmwNsPB/H8xlG2gT
 gsRSlLWXgpI0iBvn4tAxUqC+tp8hlJ26LShNE1CSnUWRuDR1D5F3982N2wt0UOvGBxjAyigHjW6
 2rURvVg18NhcNLuB95qYOHGCcNk9NeI1qb5l+PUxh5f48j4CuFd2G/6cukhF0dxYz/mtgYCXAnI
 X1RrS1XVnHAxk34g8FbbW6BqFMT/I9q6b8d1Oe+NjekEr5f6eUpO89alSJu9DhnM/3mjjUA1cI7
 xLsH0kL1xEZRu5pdypElIOQ4OXkiHQ3haWYkbAeWgcLmV8ExzeiycfGbaAS1AduPTrQZAP668aN
 PU0mr92wX47ubG9ZEGw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a55f5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rXBtGdtt1y0TR_eNwBUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020082
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:stable@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2DBCA1D5DAB
X-Rspamd-Action: no action

Add the missing p2, p3, mst2link and mst3link register blocks to the DP
example node. This is now necessary since the DP schema has been fixed.

While at it, use actual addresses from the first controller instead of
made-up ones. This will align it with the description from SoC devicetree.

Cc: <stable@vger.kernel.org> # v6.19
Fixes: 1aee577bbc60 ("dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,glymur-mdss.yaml           | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
index 2329ed96e6cb..64dde43373ac 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -176,13 +176,17 @@ examples:
                 };
             };
 
-            displayport-controller@ae90000 {
+            displayport-controller@af54000 {
                 compatible = "qcom,glymur-dp";
-                reg = <0xae90000 0x200>,
-                      <0xae90200 0x200>,
-                      <0xae90400 0x600>,
-                      <0xae91000 0x400>,
-                      <0xae91400 0x400>;
+                reg = <0xaf54000 0x200>,
+                      <0xaf54200 0x200>,
+                      <0xaf55000 0xc00>,
+                      <0xaf56000 0x400>,
+                      <0xaf57000 0x400>,
+                      <0xaf58000 0x400>,
+                      <0xaf59000 0x400>,
+                      <0xaf5a000 0x600>,
+                      <0xaf5b000 0x600>;
 
                 interrupt-parent = <&mdss>;
                 interrupts = <12>;

-- 
2.48.1

