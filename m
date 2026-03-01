Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCfSIjxLpGmQcwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:20:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51D1D02EA
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61A10E242;
	Sun,  1 Mar 2026 14:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmJQVf8t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDe954jb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6908710E2FD
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 14:20:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621AgkYn993261
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 14:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvy
 p1f6x99A=; b=lmJQVf8t3epInMvs0JwXODEc0PJ7Q9rgPuPsyz1lyqy519sGsHc
 F37n1f47WgI8RVOyT9eldXxvykIyrZK2t6nbJlTESrOXkqdrFOLT4nJWLDqgEcwK
 pVvPPdeZ/zknvO07JDDxgNpCo4HSyyV9MVgdbKfaiR8DpDnqVSNt5JCwuzPrjodk
 e2w/jeL3X/ZYLOTZE32ZF6/4xq44X7ygxvh9DO++ulaacpHw1AG1EZPywHei1aQK
 gvvPbT53EcBZx7S9ODJrn/IDQj3O67izFvM5+8y7zVst10JyEoFsh9zPpPpm8pP0
 4nmKwfXqIJ7wIEPaAVAya3gjT0bmFFsDOEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq2tx6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 14:20:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb0595def4so3854745685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 06:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772374838; x=1772979638;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvyp1f6x99A=;
 b=bDe954jbkpX8QOreKaKFTLtdcRL/b/KgwvqzX81zdD/WO1gnQAAGtKCs6FhDBH6NsI
 f9wUCfuNOhFcUHejFjd2bRKhQHHukjp4bbEeOYtzVrzFW5kHvnco0l5nkqgXU41aobNt
 ATiA8093YVi3/qVEiHJ5v/bcWdGXjHKlsHmcrLgjLQ7O6sBH33I8V7aL7Bko78whuRjM
 IOED6p1koD2nsZZpPUG1S5ohY5FQJ+Y1ZaAlf88LojITi1zupuMzuyBOK1KfwbZ7yBZK
 7LpTgGOzoBlVLKFmID99188v3sxfXmESwMCpM9axckJ6m9xaM5ULdaMTXs5PZ5eftlDS
 PGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772374838; x=1772979638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZNjOU/ofx6pajVVoNQxtDH7wrl/oOGJOvyp1f6x99A=;
 b=HQVJLd6jflNNh+KIvzBBZG1jXrT/UaQB7W2XKdCfwC0NYsZBVyde1S5QuAeEVis8m1
 2IlH5NuSQm3wAIMIIAgL5daj1I9VxkmyZ/QJD1WdYV4RxENzV7VlLdLZe9vA0DGy6XK6
 isnGprHK4IvNjgF8OSC+eTOl0m7Nm8HKRJv1rUVulz+BqT7Nga0W/BlK6QhUNjG995VF
 YmJ8s/i4lVRcGQArA+YAYn0H+YLHhkpVI87mbSxAf2fyHLBUMrmA8T6fdzbQIaptYTHq
 I0hYL7EXu9/4XGK9loos1rjLyRvowTN5XbLAElRmcD+56jLH6Iwg9l/o2YZf27lSaXPK
 9vog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvKzXt3vBOUObOSExd3VVyLp/P72bp11JGDAvy/icm7k6OqFFQttEAh5ZDEv7kCf0RHXAh/7Opvak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYlP/TTst0H0Nq4OKIKb0oowYyKU9tgZyxgveL2xVCDz7LEFZq
 VzQUwQ5W4zE++rzykTqPuIIvv0EyBwMs/O2Bb+CziFhiRBPh6a7Ue3aN2L3ErNZp63AsRwcWyXf
 gVN36NwwPENpAvMcyeaKnIiWBRdQrDWTde1S+nqQooOHI0+dr+UNsz/RbrmGnfLQdtrw8+Fw=
X-Gm-Gg: ATEYQzypacw0diSugYwdt3tqTQ1mvso5myKyEAPciB+pKi9n7Gjd5ZLSEGgbTjjuEP3
 lxHgQ6meA3kS5JE7Lzin9aGzS/X+Fti8XvqXmx39xFfoLj6b+U4TZ0CN30TPvAfMKt9sbhFCkky
 aN3oYWDGnfqwIxNFOhw4NhFs1Vbpi7wCse2QJws5U9OVi+dEv+vLmA/KZ7f0+37Y/W3rou9nk7n
 hZgbnt/4geG1BkE1PGzfyQ/uL42FiMUee7qO6+8QszuowI1dZT0zFiE9DU2rbUXV7EOBwAFg5x0
 eFpbnpPnf3VecsPWmtSAGtKma6f+qzh62gGq85aU6rWOpfPHBuy3JqdVOpGXxNtZba5XtliVUvP
 i2af7qrbSLMcrLH4g0IddBfMqtZphAiW1QWo/
X-Received: by 2002:a05:620a:7087:b0:8cb:3fca:2f9 with SMTP id
 af79cd13be357-8cbbf3523c9mr1555906685a.4.1772374837798; 
 Sun, 01 Mar 2026 06:20:37 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8cb:3fca:2f9 with SMTP id
 af79cd13be357-8cbbf3523c9mr1555903085a.4.1772374837345; 
 Sun, 01 Mar 2026 06:20:37 -0800 (PST)
Received: from quoll ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ad3daf89sm16417724f8f.20.2026.03.01.06.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 06:20:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: display/msm/gpu: Drop redundant reg-names in
 one if:then:
Date: Sun,  1 Mar 2026 15:20:34 +0100
Message-ID: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=m8yO8Aj7LBafKhDVBiQ2q7TFUyh1Un4CoiLobm9d3n8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEsxe1CbyAMOXZrQueutCa3ELwRwqM/i8/pMn
 hL1XB5zZk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRLMQAKCRDBN2bmhouD
 10jqEACYer60vYtlX1ItfPGhn/WLPqlVtkm2lZtKLNCvW2kYzgzu7/h1CdIOXbtBtRmduySJly7
 jrbBb7UvEcfk1Bbyzx4GfKOGNU684jBGJclNMX4Hdl6KJ6vb3/AW2S46SjE5yfzheasziBzekep
 IVLSZNv/tou/WZzqhgHXKwYBIDcyvkmIT+RRI0cr9fA4XgoNICDaTBKCXqe5KBV1ir0ur7qX9zf
 tYmDhHNNspu1yFL2SKQTKoqQIcP05Kp6atkscj1vY2orM1XUqIPuLZlqHtB5xvzQpoTUafsd87l
 G4GLJjAOL/ra1assLZTa7eH0Y8KuCJNCHBN/Z9WMuj2kCppuA3FtpHWZBpd86SAV8fu4SZlcUir
 t5JDViWrPmz2P1KUiMnZ9gd4XnHK5Bs5q1xljuxW1LN2mymZ9TNgPfLEYJxyCSZCvyANHfd7cUY
 NI5yCwP5Mc+bq9KRz5NhT9aSZwGOBUcUTAtxhpOdnrHBm345ul4+7mgoat49uQaFgf15slT6mIp
 6lybF02CiSBQzau9PTo83dlIyul6xJSfa1dbcozXurMmzv4CztWLwn1KHKvHr9NOatlfeT4VcEv
 5SeClO10ZGkNJV0YbUXr/kFcPQlu9grr9eL4ZVsI7DYHQluenwsjGw4UxXWNfdWIF1Gkn0LJ1jt
 eO8J0VA1M8NfH1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cy4L__ZR4CZ0xNTvFHI8VZnRt7e3EYhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMCBTYWx0ZWRfXyOsWFyKX9ak8
 Xzb8XijjlSrA44/9Z2phrSb+LF4ASBr5MDcIK+fkRxsSuv8EDRayVvni67obQAvQCC7bY+CufW+
 klhVTHnYAedHTxYjGvzJ2YeHf/DbiXa6kT1HoBTrtRik4tjPDEpM9e/Elu7/bNBnCWL7aDdJE6c
 1lKguPHDn1mB4+dHuGVX/aJ+Afcq/6/HzIo/o08y3r2MsLgvNXNCQKDd2SlIBvMJU3pSZdQG66K
 dAuR62SDdmibF1AGKyyzTFCQWwgFbl0SFhzT9nq3u7Ym/ebHYSjxPhJ58kHChtOOT8dVnwdRWX9
 lZT91W0XpmsjJeghD+WoOtnjLAjbKTCupx6c+54RETWpLiUc7yPbePxF9hrXf2jWubqzBeN32PR
 8vXX58HD5F63Xe1c+4fMojDTbLY3Tl9dl+ZIJM7dVpY/8zs2KAeoexcy55W/BlkfFFr0bjifcYN
 R5GsQnGymMGgOWrH1vw==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a44b36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MCV8vPsGP35s7PfGzH4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cy4L__ZR4CZ0xNTvFHI8VZnRt7e3EYhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010130
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2C51D1D02EA
X-Rspamd-Action: no action

Top-level reg-names defines already proper order for "reg-names" with
minItems: 1, so no need to repeat it again in one of "if:then:" cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rebase
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index ec84b64d4c00..04b2328903ca 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -440,13 +440,6 @@ allOf:
         clocks: false
         clock-names: false
 
-        reg-names:
-          minItems: 1
-          items:
-            - const: kgsl_3d0_reg_memory
-            - const: cx_mem
-            - const: cx_dbgc
-
 examples:
   - |
 
-- 
2.51.0

