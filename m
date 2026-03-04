Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 27m1HqEsqGk+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248551FFED4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E5D10E9DC;
	Wed,  4 Mar 2026 12:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB1i0GwR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqVKVpVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D610E9E1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6246DW2K1203738
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=; b=aB1i0GwRvylOjyQH
 weLQJGwIMkb7W+fosiCXxs416UaQ48PerFCmqIMWlSBa0axDBjuwT+8386ukASPw
 ky1XI3Ndsv6UzjV0ulyjrnp4cMqeHDba19HVcJghHVPWFbNtYVWvnjE6l7KzjbM7
 eUA2b8AbqDflI/y6PDxm0DZD+/4/2eeJdRbuOT6vZd3p//AablFKguxes+AzBakB
 BtKCZaL5UXjHH5829aCitANHvFtOmDMzDYEgpJq7tt2QVZosIi4WEupMR8CCLaln
 /y72ontcJVP3rE2NqBHczV5NaffRmutbSo/9bKxC1gyPXOpqGISJkhk7AM0udNz/
 /HCQ6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1970-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c711251ac5so4203806785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629148; x=1773233948;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=;
 b=YqVKVpVibT7cHIZd71iG7k9roLvM46bacfYAGWWh92865RvBCxJ0FVcYeIvoUuGuS6
 LIKlbEAB3UhQmr45QfZW08AXVuSLAgqaS4erPSv7Dx3hgbcaQK3rU5Iwn89Go6tEK5GK
 Jz76fcbPJTa7Pzg6MekZPRDJQ3jYPbqbxugePjOKB6JU/uycV3CcSa+R0jyn7OBLrzvW
 9fzojViwZFQPrx9rWpMaXRZTqw6AXFkyQMIWbzp8O4Qra2rLJjeF835mI0WUkbH9F2IY
 vCatrdjD6ssEl2ZOu0PvVhj+6QSLxdRGVqbYqHgw6ld9hWZpZ4SriJmgMyvz6eR2fhsS
 el0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629148; x=1773233948;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=;
 b=Jgi/8wzNImW80SXQd1of/hUZVYJEy9fH4Sy8ZM2cCBbHiBBt7zbyUALy+v8YJCxi65
 n7mgdw5vpYuhZmvvEosfNtt4Nga1jVp8/0MNh5EYuqKAb/GIEKaY0dwRbzOSjwSwpnLn
 pAYtHtfkzVJfU6X/aYPnMehsZFQ6tqxgkvrFI9onBEdzDQZHfByEao7FlepP/agN22gt
 2vQwHhPWAkFoh4xI4dE63QGsRO47Qvi4brCmo4DVZl172nXTGFlH808P5ezkRWKUqAzJ
 VD1fQ0rb0UPCiYwBi9YC5eZLPoO0g+a7dwyq93Q43Isr7qIMaaQ/b7Dxd9QG6Gyifn0a
 ZTnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHys865DuWKlV0Aw+lqPMGFpR/sWH4MUMKVsXUDq5lA6tXdtOx5fJLPzeCH2C6MSDLOkSluShcd1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPwaasl1185b8Y5x+26CEFNp5PuCU3Z/LpxYznRfGZUoJSB+Al
 zleIh0no7VIkaO3PXYSg8KEqaHkduzJDEBvN35jBNCDMAq42mobP38V0YDRuyEve5R1Do19KT6l
 sF+JvqYhZpDld7FsN6Jn7HLvD/PdaPaNu8VT3uZkv9bvuqRLmsXHBQmjnfE9BPm0Bmq/P1Sdb77
 +E7ug=
X-Gm-Gg: ATEYQzyI+M8FiFUHyKBsMmhLyu2yqYzh5dUpZ8VGgc8xC/UeBoHeo7X6Gu4kqzvCjd+
 uxfnt8cZflNPr5yRPEmPfNrVYMlq+pukQIRS/x6R+NSWcSEoXwtAkmGlcAraY3DmGTjI4i7Q8Mc
 pHOjkjN2Mghy9uoTlNLNB2jvYS430VtNxlPzUB+eEjP2VkyyxpenH8xTOxJG68rS/C0a/7elW97
 0RhcwmYIs7wNJDh6jOy8p31kF9ewUW9dKa3th/69+ujeMZQLZmKTb2VKnwDMmWw2bq83eb8gxfX
 40/GibZaIZwRGQyfdizqlkFPuWTHQHMHXEWNe9G0wwAgirP6wC45dXvbYmRnJi/1WUTKTzB+8BT
 lzmzun7seZZgeWTWvj/9FOADb/HRCTAgQVFjJE+4Y3Jgm
X-Received: by 2002:a05:620a:29c5:b0:8c7:1af5:4759 with SMTP id
 af79cd13be357-8cd5aebfc4emr212740885a.4.1772629147918; 
 Wed, 04 Mar 2026 04:59:07 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8c7:1af5:4759 with SMTP id
 af79cd13be357-8cd5aebfc4emr212736085a.4.1772629147439; 
 Wed, 04 Mar 2026 04:59:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:45 +0100
Subject: [PATCH v2 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-3-ea0579f62358@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l29Ss9SJIhO4qjfujBR0enQVoRBoec2OVkwK4jqjjs4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyMxtGH4UqF3t0s5/Jx4pXDebCtGrpYwQFAf
 aaOr/FlidGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjAAKCRDBN2bmhouD
 18fLD/9XlqO4sVbDgv/pz42VJ+ny4JFHmqR+aXF4szcl351j6DFra0EbKi2qGbpyKBmalzbThZa
 4TkWyPRH//1hejiMruNUuic/e+IBuQmBRvFiU+QddlHGV+awU4NzxjvgkawUdnlQsAC1znlA+XA
 c4cU0JY+dps3xQJ2wgYcJ7qYBF/sRj1t0sXkLTjiaS/y9xLO03aB0dj5twPPioz2Ox0mmBA6630
 I/k54GFsBoIPB8BRU+YzcK8l0zqub05ciak3Jn4XnK2AqAxOvWTnCf3z7osp6tAVTC0tczqrt7B
 BYcleSdkp1HWNMH1bz0ytETN9p3KQA0dzZX/LzxEMXhTB2okPlKEStmg3SxzbXD0h5HTd3ErX5r
 FsjFjWkG//GZbrnmrpqRzww+xg8urJpLPVigmDVywB21lqcy5XcAQ0r2J5T2vHnBhB4fNiP7D+V
 Xoxi1YYfURP4nCqG3ZZ8keC6mmhm06CPzpw1WgXrg9PY1y0iRUsIjprN+QW6SKQz40TPj4yHy+O
 /0hdStKy0MgRpIaHwhT+msFpIChO1b6c4b3iLJIOxShB5R2BazEfL384WYgBIvuqPOEvjmF3Yts
 geB5YJysXDj2JaqqnGvrXjmwNhHcOvTzfA9Xqs6XWGtqu5z2a3FlIXBIjRgs5ogzuTTDT99w+Ph
 5dBnkNgPDessr9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX3FIMyGTW/4vK
 VHAJlIJylAwk1jI+PLiG2igNtCm4vW3ztG5WrK7DDTHcrWVTRXQsLQCOm6Y4ofdSjd5B9V8csXO
 ir0vqa1n/Uo2pH0woSLhjtA7E5gLxvj7TxguezT/yVaxPIkW+Z3OiejDIx331wzhSLw+zOrkQPu
 MpLPo8j3fYWcDVlBJbLLwrVXVkBGlSernTSy9qo5KQ/yHfmvrplx67/TJw3Cptv/MgdykSnfXIi
 Q4KPmg8Q8a2lcUTR2+v4Ye9Vm4Vmz9/HCallS6Krxg6JuQshhmzFr01d8cADGz8aqLU3AMkkMHJ
 Xs2JRiieSjvsxdXJ37Y9Bq7vYIGO7j08O8lLrAv/K+/nOJ/u+83C6Q6t3VR3EVrTcU9Esc7/xO8
 TCYq6SfVwYo77YnQZJdxlSsL0Hmhtv3Got5AaYVbqFoFV4CBOMnS5IDLhwGzS8x8IlfBzIA3OPF
 GuGbcKF0E/13qrFrXIA==
X-Proofpoint-GUID: IFv4UsfeMrdySY0EY5BWVc0VfxNrhhHe
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a82c9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o3bpWG-eKcXMc0DUatEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IFv4UsfeMrdySY0EY5BWVc0VfxNrhhHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
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
X-Rspamd-Queue-Id: 248551FFED4
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

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb08..49b8b6db45f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -51,6 +51,10 @@ properties:
               - qcom,qcs8300-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,eliza-dsi-ctrl
+          - const: qcom,sm8750-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible

-- 
2.51.0

