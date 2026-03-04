Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG6bDKMsqGk2pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D51FFEE3
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1A710E9E6;
	Wed,  4 Mar 2026 12:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC99rWbC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExTCbrGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E6510E9DF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624CDsYr1421884
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=; b=BC99rWbC1RHWWTPw
 9sqSRX9ASnyzmLaaihIN6domAI3Nj2nX2pWbTUj1Xgp2vUvkIjnV1Ei1QyFJUToL
 40ZfC06McxI5vxYq7YJQUZ/VJBH/jY5klN950P+5B6L0EmqQg2AYo+jV6i6ftd6L
 X14RicKKjxfDyis3+xLvE9vTu6i+61MlM2uor77VXQa9rfsWxg7Sy9YlXHlyTsMf
 9Mc3SPsVyRZ3BE6oi67J1wuMcX4h/olTpQS+t+HE30npaiJB6BVWmXJQU1ZGBBxG
 +14UeRjU+TlavEVMFtvbsY77YIERN5SPU6T9EwZ6YRfpt0OT08H4TJ3d+JWM+5Ht
 y4z3AQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u1exk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so786785985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629150; x=1773233950;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
 b=ExTCbrGUsLKNcvmjpFUI5APc5Cu/3vi4brH1Ul8P3bZiCvyktGv3f9xTi99zfJvA0a
 CuiQHRy8azcyZv2s3Mri1Mo1G0mGUn9n0Jo90ca7ekfZFJRbF74hMLzfwoHOY1a2M/XH
 jfNQbB2fl+0YFC9Qxlmk65S8ooPQ3gihjAxXzBFbka3kgaHMEw6B6xrJL+KFOaLZLxq6
 khre4bUDlfs2Q/7QgBr8f00/aVJeo1U3RG4czyNVQvg704/LrgDBDHZeVVfBjiaXGKm+
 M+1vvAYfoaIyaNlLftrmc/N2kxKjbU/MTHhhA4F6Kgov6yd15TecS+xRj0rL1Px5FiDN
 igWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629150; x=1773233950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
 b=FWdObGSexSVvevhnytj9LtUp9xcK1xBUxRw4ETkUxnFNhNOQ8bOc4kpv7kzMa+zHkR
 DTXN3oGv4ZJnaZ7gcRAADSTLhtpr7ta6BAGyV6GBxYkXSXYdiChkB6m9OXOUziyR4rYM
 1SEnKGcbbwXt2xdYucfFSq3fySY9I+rS+fYYcMpEDxrxFL+X3Tovi1uAJorypyjG/GUI
 pl0qiPyIEkHg1LsiiFzn3knrbrKLaQqCGflHwjWxlGpzclk9iYcQQYoN2IXI+pZHPRAM
 phlfvwRNrgxusrBIwwAluc1nZfpQXNZeenh4xGGdoZnz4bxHMKmZv2z10KwKorf7aokB
 NGDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6OyT3RAkYD3UVDF5ky6SqdB/Dpm8K2euaeqxPWR0j615O5Tuv/oVMEqwKepHVQRHRk2xE/7Su2eM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLGWSjXsq62FpVeE6XV72NMt/Jo7ABW+zjG+Of7J0OxGzVH8/r
 TMb4GfENE87OF2L9SWgnpOy8q1r4pmT8sCXCfhzKi0jyBhvT5xTqJs3lFZVGFYSODbndrEFvyvJ
 +d+A6IgoOeBOD6Sz85khOkD/pH4ejOaXGTMs2eXmgZR7aIP1kGTD+9ivnGsPAb+EWI4aKORs3Y0
 D1ixg=
X-Gm-Gg: ATEYQzwH067QWVfuY5XcdW24+4GYmGfU4vX40dovsg0xfVPg0SckUkMo0kqZf9mw/yE
 7GN4XQnAowc21JXufXICFIDYd9DJKRx/76kY8IB/r0IVUPl90/NsmiT90AY3uT7El+RVLQcbr+T
 cnzvltENfihV1PJoCrJyVKp8KAtK18/DJ5ErcSc7sdI546u2BcQogA9xwgGNzDU7FBhGKt46UFw
 WRJOkDNXn1p2ZXy0kuSHGXYxISma7UZJaSCKMrGLJ2+D739rpmnZ18v6LGYqGgEhdzquRHLSYpg
 OzmO27RNpPJw/naz06ojW5LYnR32Z0GjspH1tzXRn8/iNfwUgBRa1Ej6amAzL+5AgPBL9XODPSa
 r2zADY3kBBl+aAdH4wx0RuRyOFfGWCUMzlrPZUoFQKuNN
X-Received: by 2002:a05:620a:4148:b0:8c0:dc64:bb9f with SMTP id
 af79cd13be357-8cd5aef1d04mr214755985a.18.1772629150358; 
 Wed, 04 Mar 2026 04:59:10 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8c0:dc64:bb9f with SMTP id
 af79cd13be357-8cd5aef1d04mr214750985a.18.1772629149834; 
 Wed, 04 Mar 2026 04:59:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:46 +0100
Subject: [PATCH v2 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-4-ea0579f62358@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyNFFGrgGGf3uysePnQDRdQF4jzYWZyeLrTH
 9JbAk3tSEuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjQAKCRDBN2bmhouD
 1xz2D/9LtoRsVFYMzBR5EeYzRWz8TwNykcr9V+b4cMz+iCNXX8zzYLiwFeSqMQKC8RCN+MsSrV7
 6O3GuJvu3InyyQ+VhEe5wWvvCll3IZMGnrtE+L+S55mS8P8nzNzeaiRC8NBG6WCvDzLI2Fd6ucH
 vpvoNlUUCQegDVyGJDVtk93tNWdOLxSTEkJYth/oXBEg/5rZE+BmBYas+qm/mixyrMYJcvkehU7
 JT7kCNQ1D22UK5yae2z9hPlSpgfw8CBYWDyykUUnQD/tSKROTo88rScDbf3JU8xJTlqXyJ+UQ4b
 Qu0gXmpOhSa/tZK3+fEperEosgfk3ypQUhq2mZK8KxuHbAs02Pu0rKrpua/giCIce4AVXQNM0iH
 f439PEwDsrHUYHqezqYdfZ1BH2WzfLeUzByLFIgMDaDh0lo1RuSIwPCoDMQfsqWF6HOZm8Oyoc6
 qBqXtUOCHqeF9nQbcDDsSzrFvWeV1l7uBkUl/4fm+0wRCxjRsFGPFjoQayWyoeD10ny6MNsPD++
 Ptp1E9BfPiVXRIVb57ac38KVDOTjpsnWdnHD+RIw9V4Y6sJHZ1Kkia9baGZ4SElA8ZMyN+3uzEs
 PLIicCFZRvjUq/3a36cbXYjzwA0oGtQaDmpIK14FVQz6hYcL59qAakmpMb6jwml0syEKI9wOAuG
 YuIBvZN6actXj5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2zd8Xv4fL-t7pdbDp47fB_hukOi30E3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfXyBo1a7PSIec9
 5PNiDKK/lWwNxI5Hsh6rM/lFnUF6fLIqZwIX1v1ysXsTjYPDrbmZkKuYhhf0yJ9z6nzmKI0LKIe
 PV+PIKx67jMTZCWOMHqrd126klf79b5yJRzF3E1MqOKRmKdedGSQJsqALVWu8VLJ53q3w/2YIcO
 JC5oO1iTlNGQUXA0navV76wnj39qQ4N5iaLsL6Anf6g8n5QAYQZOyyanICph8EJ9xBvMtwe/9KM
 02BB9SIIb08qZ8BSR4f9SghtO4FFM6q30jmUpVPrW8G+xXor945/AnfN1rsbTqrtajb/EKw2cmP
 7vIU0psSQjfVG2P9DFpVLFXgCf8dGD6sAn/0PkO3n9ztSoEQVtmog4KZh/MUbp3ZiS0qOagudwa
 sUeGJwuCpR0/UjrFBY6xbQZs9ITEaVuZqrUieUizdztqVuJlPfIusgYVzUXpzH4AmzvB1rduORI
 H5rnYYFHrXS3oQ/6Gww==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a82c9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GoUmjBwbbK472THZ6osA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2zd8Xv4fL-t7pdbDp47fB_hukOi30E3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
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
X-Rspamd-Queue-Id: D64D51FFEE3
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

Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
against SM8750 (v12.0) of mostly removing blocks:

 - INTF_3 paired with INTF_0 (no DP1),
 - Removed CTL4-5 blocks,
 - Removed VIG2-3 and DMA4-5,
 - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
 - Added HDMI interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index e29c4687c3a2..dccac525d202 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu

-- 
2.51.0

