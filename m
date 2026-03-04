Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vbFtB5DEqGlaxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 00:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842552091AF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 00:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30410EAD1;
	Wed,  4 Mar 2026 23:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmZ5wYzw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBqNzH9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963B210EAD9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 23:47:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624HFrSX1456003
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 23:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dRQ8uRt4/P5Xnnec5FFe6n
 /FfmAB6R9vICbGidBFlm4=; b=NmZ5wYzwIxyOrtsZ8up/X6ZzXE6q0Brt136GTa
 1y0Fqr2l+ua/4vUaey6GoRyQrEq07cAO6SaHFVorUs4rRIEHU4UtvOEbRNzzht1c
 WjgOZNNArEDS3Ye9CB3EWTYnF3ocgwyn1HebqJ+zYvYgrClaLbYzX3r1NB40/aN6
 9mJjBs+69oII0uiB5NZ9q55vKj2TLwXBHuXJmQQ4j10o8q0V3fBnjFtYbayf+EEf
 TQ7rf2KE3gI+OHi6ToOXtaPVF8LKjJv+IxI/7P4HriyjsbbK7/3uq2vqrNo94Ytj
 6YC047SoyUMkPv1+krLW4n4R6dTdd3O5aWjcWLbIpGLrkMJw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj182g2t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 23:47:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89a1f95aea0so47881936d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 15:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772668039; x=1773272839;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dRQ8uRt4/P5Xnnec5FFe6n/FfmAB6R9vICbGidBFlm4=;
 b=KBqNzH9oajtAlxAHul4kdoCqvWJ0qfW8QdinMmd/67CW2HMDSMQApRiMQhAn104WmY
 KMj8Geqv4F0VWEQOCLEKlXFs5NeZan41x+JUWsAACnoqwia8KYX1ZYNpLNOUjLkUqu/E
 dWqIESFb5bQg8712XwhDtwdpuhIelFvgVHcKNkmnLb4AC66byvMei2TRX16FumIanAT6
 D6hYELaH4bn1Cijy4cWlT924cAHdVpigEDp61SQaeLxN6O/CeY5tdH8Dj89JUS5SZN1q
 BCTsqVnMoi1hIhW6JCVt1mnTE+3Zq9m/AsU76loKRLyUH/WtPEBQ++0NO5NJbmiEXvEB
 XycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772668039; x=1773272839;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRQ8uRt4/P5Xnnec5FFe6n/FfmAB6R9vICbGidBFlm4=;
 b=f50DrO1qnJCKP2IfMLjuhRH7eK4qpWHpxx/fVpmjwUlrNAdhD8p4CZmZHE/1uk41hA
 reG+RswlWG8Z0WMm+b45OccyP8UcjxYpCXXtQoMiW7r4Qmp0KDyGxkvUgpYzb/LBeHrw
 OJh8bkxpwYXE6T+3BK07NWv0B/CRRoqWSFWQKJHYrdo8b87chmPWAKLau6CbjQFz1djX
 uh+msgCSi9ZSZGlK5JyMWGUvyCLUhyWJtstMl+d2UMtzpN1WjegMLBKMiTqhaEvzb2pP
 zVvhzNu18+pTWe6qyW3rmJ4kGmV5DPbu18xF9BDAzggGVkCvgeHHxy1S3uoZQr4aaYuK
 dfyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr1Ta1fa4zk2lXpioJrKCZL+IdxOqtKiZcXHRCZauY/7sQIxtvbrsNoVKbD07ykMy56pO9oYhi2E8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQgHI8tKIMCyR4pKqFx/XO61rLbfDYAbR/5kLVI1UZfdlHlO66
 g8zGq1pHJpvz8FeWWWIQoANSjowtHs8KMZWDzWIgB9rzBAFbQQJS/C3180Kw09/bgPyZhvjpk+d
 nRqHHbnvUYQvtUrnfot6ZpJuvK0cLBBIK+gsng/84bbEIeHNAvvROmwNkYP+XLh94RmcTF6Xq++
 rPn9s=
X-Gm-Gg: ATEYQzwwunODs6QNHsDL8BlDhVAOAepcZpjDP3WDGQ/yg8VZ2Wb2p52jjUpu0JPQsSK
 Kvvtf1HAWHQSqji40cz8nfCZEW90wymH/G3Wth0kOaKHiSTyEJGCLAWr4nZNEH7969vj3K458CG
 Bj6OFl3W2rJCYjJJZw93s0BO442OeoRi0mIEgJM6/vlNUl7W6Ffpr77eznlTZwB7p0nBWc5Om3r
 DmwZnjMLDBLmNff9B705JgH9mtDg1TwzAR5lQXvpdMX8Jkyq9cDqSxPWZ7e0RxMBQyHtn2jftsg
 dHH6es5Do5+iA+CTtYqo9ydySXPOsQTLhxyxKpSUI0/1jtQRc9J0ETMUXyN9txlcdAZ/oMfZkFQ
 41vRV/bKlAouAZzpU4P0fvE+dAGK+8cntyTB4B03P8d7K9+i2qZk5U4oBMgq7MwMgLQeUeZzYiu
 usylJ4j6yAvkUKZlqvouXhgtikgKj/kCapBnc=
X-Received: by 2002:a05:620a:470c:b0:8c9:f9c2:118e with SMTP id
 af79cd13be357-8cd5af1bd5fmr444193485a.32.1772668038456; 
 Wed, 04 Mar 2026 15:47:18 -0800 (PST)
X-Received: by 2002:a05:620a:470c:b0:8c9:f9c2:118e with SMTP id
 af79cd13be357-8cd5af1bd5fmr444189185a.32.1772668037874; 
 Wed, 04 Mar 2026 15:47:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12d8162ccsm574403e87.77.2026.03.04.15.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 15:47:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 01:47:12 +0200
Subject: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH/EqGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3dziXN2U4kzdgoxKXUuzJAMz4+TkVPMkUyWgjoKi1LTMCrBp0bG
 1tQCPGzCUXQAAAA==
X-Change-ID: 20260305-msm-dsi-phy-96b063cce7b5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EddD0jK9xDGmaxIRtN9XorQUDW4OMYW5Z1114ll89LM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqMSBChCi8G8GUO04pbQErRlAh/8sb6jvD6jiI
 LEO6ahwb12JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaajEgQAKCRCLPIo+Aiko
 1fUAB/9ffjvy59SgM3ObKkc1S99icLVUP31lNo757yTgpK6Z0w4BfohkBt1Dht0nWd6M2pr3a6a
 k34ZnoYhn9o+nKDORGFM4IqhzBn7yw6kGXbKTnj/ook+/69HT8QIqaTqku72NC/8kHR7p2bHsDp
 gqL4GH+230D7nh4bqjhKd2u1lN/9p8qFmi40jTMjj+JDFvIv4TMkqfW6XfJWRSz5c/qhmDC8BK/
 NxBYdCFp7QkP0Nd4wnHw/Nz5UhrnUMApGAOV6gaM3cXH6RWIARkWZ/epmRmVqbBMX+vS/TyiVRe
 AfSAYvZBXNcilPlHJzzSTEawqTFPMBDqVQf/h7Uo9M0s/csq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FZh-mdHp-J_KCzEPdyEpfDopQ_Zd7Cz8
X-Proofpoint-ORIG-GUID: FZh-mdHp-J_KCzEPdyEpfDopQ_Zd7Cz8
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a8c487 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RAbU-raeAAAA:8 a=wepcCMuCHaKBKvurWtMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NSBTYWx0ZWRfXyXA2mmDdelm8
 K+wBrSg/OYyLo6huaPwdwznRJiGm6qy6CVNiIh5gVgstSh+Npc88mw16zKBjExxAMtKtZFBKz85
 ckoCCVzlDMg/HF3vO4sLIS1vy9fNMyupfOkDnMDwSuAz856zOTrQAB3XbmHREZAjwuG6edxB4Y2
 7vlUkcYq3kCKq94o1fnI56mbGTdUFG2Jk66ybesWoNybgl34LClJeU5mv0nVF3k8VXOeRL9GTkl
 0o5QuGxYn4d4OkMAzZbSLXwc/jD/wmImp8PY7VE+ahP15CsQwjPgEAkOQC39cceiI7bjRVQR4PA
 73k6kmQ4BFX4DMBJFgoCamISkyNJn24HWtNheRGd5Z/VGbsl94zCLNZKmpio55KUk2fKAg0XBDT
 pTMfBDdG8QkAUJQszLiZSZFJkHpE143O9MTyA+sEBtufQWoad7bepAM0J9JpcnWDRjnWfbqbuPs
 oG+nVBqKZRfHGfuO9lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040195
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
X-Rspamd-Queue-Id: 842552091AF
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org,quicinc.com,marek.ca];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Historically DSI PHY bindings landed to the display/msm subdir, however
they describe PHYs and as such they should be in the phy/ subdir.
Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
and move bindings for the Qualcomm DSI PHYs to the correct subdir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Merge strategy: I'd ask to merge bindings through the msm tree, reducing
the conflicts for the current kernel development cycle. Starting from
the cycle after this patch is merged, DSI PHY bindings should go through
the PHY tree.
---
 .../{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}     | 4 ++--
 .../{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}       | 4 ++--
 .../{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
index fc9abf090f0d..d98217747ad1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-10nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 10nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
index 206a9a4b3845..be31b9bac9d5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-14nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 14nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
index 93570052992a..1d135419d015 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-20nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 20nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
index 371befa9f9d2..f8fe75fa29d7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-28nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 28nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
index 9a9a6c4abf43..d45015e24639 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-7nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 7nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
index d0ce85a08b6d..849321e56b2f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-common.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI PHY Common Properties

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260305-msm-dsi-phy-96b063cce7b5

Best regards,
-- 
With best wishes
Dmitry

