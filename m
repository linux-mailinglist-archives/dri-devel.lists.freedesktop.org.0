Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBh+GLEsqGk2pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B411FFF2A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0AC10E9E3;
	Wed,  4 Mar 2026 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArtWOjct";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C61mG7pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D31310E9DF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624C7o0r1072399
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=; b=ArtWOjctLd3zpoQF
 QZk4ci+GMltgbG2G1OxVKQZGKZ6zBBADUGvGSYEDmWv7ZzFw0u7ZzUoMfI/MOAYY
 5AocZmYfz2gWtXsCF7WJfj/mpFpyZtm9l7EysK0iwJDmdHb3caUMXSISvsyr5EpW
 p0jeB6rOY5bQ4Pf8LUHQDT4ROHJ7V2tnkSNigpvWqVwSzubfAm4L6bdq0gZ+3acX
 1Ei6+QfhbLYP5/ovrOChJrUF3cN/j1Xb65XHGOdiDLm2iT7JHECU1qbNBrprYEKT
 +KBe/GgrUFprBQ57tfivFEvIUyN+0zzwC3hU91EhXd+Hotgy1DGgNUww30W3bFC8
 6r+z9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfhqat-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb390a0c4eso4367184685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629159; x=1773233959;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
 b=C61mG7pZnNiyAeXc4tcp/goxGOiAobmqmqzrBjOti6SlhSgFNAUhDgtyzAH1zZpEJb
 66zSSbheUqeM1s7ZWi9T+IATnZnpGvaJD4QighhPgTXgqljy8iJjzNnPhuaIiYy0LDxn
 pSucbuFrdj9U8sz1fnIoUPKk3OfX8irAoKRm7sM8qM9WLCLzQFZ0uaTzGyYGcqLt5kTs
 tbxzU+WptOf5P1NwRmNPBks+1YgwZvcIWkGgu0kyF2E2NIJzqYizjqnCc6G7rj6kRG/1
 GTwbebS/sgxfEf9+KP2zoKT0ZLd82wwnF0KC4MgfR+Y2H7c2rKZTM1V2kU0fhZ6zeZSh
 PX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629159; x=1773233959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
 b=fwwUGwn5xruTo1gFueBsJVV4RKh/ksbiN1MQg/b/qvVcsksROFwiy607Kpr18s+5Sr
 YzJGLI16WbBg9xI627Fcp01oVo6mlNpheXm8v9WQoZjenbmV1lR8CBIGE7OvKMr5Mk/e
 v5ofC/bzNKpk8smAO5ZhGM6hLsppnXtdfhj3GrgXQNOjEr+Yw59mca13HgT8Yn8/ASTy
 vz1bisZsZ5CswRifjMasC/o1HwBoLWusHdXMgq6ASVYQf5Rbb1g203mU9t7iT6Cf4Zy/
 BDO40gZhLUg8zMAn3bGhAl0bdrAt7MeJTNr0QEc25kwG1unTBo2yqGKMc43CPwacJxf+
 e3BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJMrE1EAO8OUGudGAUDrTvrC4SzbnwYiYPRqezO4NOv0L1UXdsHzXqRDca568+zY25hFeLSB3Dg9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8goZPg8A5ZjTo8JXcQ9mRJs4kkstum2cJ4Ky9IzI78CSBoFin
 xeId9MiCighI/BTcXQWs58ocDO9TuGnDesPbS/NBi6bhrTyKMGCVI4g+BcSrR7Tyzu7V+SbPUS/
 RPpGvtdx4v7IHA69p5tS/K0HaxnqjSCaD4rUMa2RXhIZbPYbl3XhQd6K/CjsYkciUnCJ+f53BO6
 aKT0k=
X-Gm-Gg: ATEYQzyI3B6k5TgvfZn3ExC7fGU2BJcqgjv256VWhJNtAAvV0IktcFr74Ump/B67urV
 GqSBeFrWxIfyU+5h2P/Xht/9My4kDzvR6Vnm5xfRZO1bpJOHVxfc0W08Fc6FQNEPMz+7OnDpm4t
 ttA3Tho+aJcKl5W2lW1Qeda96v7CvNgnlf9JD8ftPdtBsNtvK9IHowv28iVQ58eY7VCnNu3v/8/
 sC0CJpBj/QPggbYoA2m1uJm4RfulE343otTkqbcqsbZRJIHrQKsvGKF7gGHluBMnx8J32rBx130
 Uv78qDvAZtSgMGqLSO50zKLPkQI908y08ALYgIc4vHjNJAcbgWlmL5zZy7PRhm/Fvim05CzIHiJ
 If1ESR1aSxsV8DzZwQalgfWRpCO3ZXEoVKDLKlDVCYoEC
X-Received: by 2002:a05:620a:4481:b0:8ca:105a:298f with SMTP id
 af79cd13be357-8cd5afa6928mr194899985a.68.1772629159508; 
 Wed, 04 Mar 2026 04:59:19 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8ca:105a:298f with SMTP id
 af79cd13be357-8cd5afa6928mr194896685a.68.1772629159102; 
 Wed, 04 Mar 2026 04:59:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:50 +0100
Subject: [PATCH v2 8/8] drm/msm/mdss: Add support for Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-8-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dV4c9N+VPGpt+iF/Qhlf6YTdOXhS50ODX2RZxCnCTzs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyRX7UgpBwNq2kXan77oXCkwScsgZ7KubZiY
 FS7KYrlwRSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagskQAKCRDBN2bmhouD
 12yJD/0dDKJsXz0uhoNClfA+5NKCeO+laTmSJy6R2FEZzGF+7MWApUp6dg7f1hPq4PaIt7iaVeM
 F2oVUlpmJ/Cto+44b6iGuvCLrVFWoCRNIxUxVCEPgK1dn6Ppsm/wFEOQT3B7NT/tRzcE0kE6pyo
 8F6fGiWG1H1RvGwlgpe4nXWWDs7aIXjISwGqQS+Edyv6LrD4Um7PaKke1KwF4kZG4VH9cbkWBRn
 FTKJ9h1TaYC2un31Xu0zLWFVcVaBUlHuUHEfLhtiDLTFRbSbzlN+ypDwVNGewxwuCp6pLBmCsmp
 Z1fbrtutCarAnoudcxETCiP4HoKs9a0Emvo88KUizke1J3WvouVoOHVX23hmwbrBPnlUZQ9heMt
 CGBK2plkZ+GpE4ZfJ3fxSsgQjl9NHivbedd0Nut68OSA0IZmVLblqv6K8dQh4t+aYBwUjxEKWkx
 mQ/o41MxnwJG805qGDIoJxsOZTLcZllm5Ioj5msCgVNfehZBFrzL3nDsRc+VZ5hzXG2NZCQLrhS
 KnWFr1t/nXeAbmfF2KvEGxNX1A3/vdv3HrEyObXi6Z7Tx8H090WCCBIvB1X6c8s4hTPyOJoHHUB
 wnKkSGHw3rQiEUFRw7Jo485AfIx/wdfke7I3zeAtqgthrZig7nsy7tP+nqeCaQsHPHxlvGCYJBk
 nMnmGbFFKa7TJtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: YwPWmfnyqrGUFIJ-HHvZXO28AaoixDVb
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a82ca8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KosifQuNy-GW_fqSRSEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX/SBnxX7aCJEx
 Oj1a0SIADRjKbBforUNL3+vmbdFm5iiMlja2VeljArkgWRioDDkGM9EIdcjB934/PeN2zKH3wfq
 PHLSgOztcapddfZ+jcjpjSQ7E/xPPmuBTlUiA1qEPR1MG9jhHSJDb1oFPc4u68rty1VE5hqfvat
 CfYW47V1fveqSvKFz9pcEjpE5tBs7iyWljfQ4wZE4uWd+553rof+HhN9M3lEMsgZfhYr5feErhO
 lYrAPDF7Zhn7jznPWfG/tXMFhIm0P5bpXAmvO9cFhLKqcow3IMB5H36SBQwIwLWqTqtuzoHQQBh
 2HERWeLbIqgrzLyGG4+fOCCuP7Or/lE0womEpaZvIncZXeOLcqRtxDh/uuLoAQSHGnYgcM9tmxJ
 LviL5cvTyem37dye0l2sztRukmPcFanz/bqqZK7IrUop/37M/p0I/iFZ9R8RMsTuCKG0fuxMF1d
 11Yi4N1MUQu/9kd1B9g==
X-Proofpoint-GUID: YwPWmfnyqrGUFIJ-HHvZXO28AaoixDVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
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
X-Rspamd-Queue-Id: A5B411FFF2A
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Add support for the Qualcomm Eliza SoC platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..a86776425f26 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -560,6 +560,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },

-- 
2.51.0

