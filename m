Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IaRFkjdpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7351EFE19
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A6610E7F3;
	Tue,  3 Mar 2026 13:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNe6RT5V";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heppZoeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEDF10E7F8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mgZL2613791
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=; b=NNe6RT5VLhOuvfZT
 BIIfpntJNBry1k1s3DPkKbHc5PO00sCILrxXfyZTzsOLiV3YULjo8YDKpYzWG96W
 STm0AK/xOdrW58x1yBddhfkFjZxaBfZPECavcj7Zlw2UPqO7Uiwo+tyiiW3p6Xhr
 Gse2tAJYud4HABopHkt9AV2npIOBNkhtAO8ddEA4vyvJVSrd1Z6oDVp5EbnwjoNb
 bRoMZkvvKshaXDlETxjm91GjMTEM/V4SGVaPdeTFIJbNd0LOggzyXC9WHvNNWVUN
 TYaUmwNsTAlY5twWpF8TvHv7C7RbfFpFyEW5dbEZxIPNCCTByO0VPFjcSHqyISfg
 7Gau3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf8nyh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c881d0c617so3579976085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543299; x=1773148099;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=;
 b=heppZoeYC2Yc/6pGdxz7YmzSJ0TU2gyFyVUmjzVRhTlCESATgsKzQ5a8Iubm4XFlt7
 8LbOBKBKYzAUR/kT4P4/jOvwbpWAbjo9Ff8RuaygUQHDh5Gsz9alhaZHzpx644hfr5QQ
 stlLcaLqkkKtEyfzGJNgZpmodefkg63ENludGMUiaEPEdZf+ech5j/OXq34LvKH2eqv3
 iYRgyB/IiTP/ys8VfNGlRYy952Ke6rJolrp5WTyMvIRVFDAdmoDRH562ER1b71z7+7WO
 xysj8/9qN9BTW9d7/etHp00wFYUiuxWfslzKmEtokBYgBU7G5A3U5IMda4MDO4MaOQ4s
 aQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543299; x=1773148099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=;
 b=DfhtD8xY65NLDC46kWLOeRUIHyy70xg9IYPdTgEmmiPNdpz3kboUIGWCITtGZCFy9M
 aEBKw6t4IYsC0gh8nWORt3XZMjkemDiD+naqjz4R5hiT1yISday5uIpk5GwIil26NjHU
 rNDahf/qRrfB0aKa6L9/67RFCEScbWtuW9Qb70GKaOaJboS6x/OhOYJ5P9Zpv5FviV7d
 DKS3vdaW6q2GdWY4L8svlSg2SowgnG/AUz/X3bKQ9dSksK9rYe/4X/f+vh5ROJwisynP
 xRXdHVhkHlCDYkp2h9t8RHJYCmFjUw0EYvQLK55Ds81/pzxzFFDqO8LIS2XNkBOPYlji
 aWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVouWFsErqid2PRbOPL5MZFzR5tSndsjMzftYCdOeF0pwnr28d04EcK4lGkAlPnOwVSbJOEKP57BnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnNILmyD1/XEA0NpkK6TAJb+u/HA69eDo0w+OTXE7KJFs3dnnl
 36J4vSxaGCh8gNj+o+OGFfdXhBznpELrMxFQ19dfoSPM1gzZmJOlAsC9lhoRn9Zx+dV/0WyxaP+
 j8/0hs8ZtXjjzsbDrEFLRAk3tvGpXXp0qA+1IHlfYXOE8z2je0hE5FX9pWYw6MHx54Jb3Qds=
X-Gm-Gg: ATEYQzwV8De9Vq5JbCb9IHy1IAkodJXlImMKQLhMc97/WcTnqp2ojUpolH5fnptMIW/
 WWipHKrrAzNENNmwWlqbMmjI880wXkXi96e1TKJJiMdsxVD/bKJRghVhgE7rx7WPrNv6KOGekDQ
 hngrmy/oWh9cfmHaGrxitlrCDPvefmjaoZRM1ZCU/O87pq0LjYvY8IAIRhT/49fXqYums6TQhOn
 GEMEWj6HxxqLTH9Q5ej7OugZe5XI6jhDY3cmBRbVFAwroHdYKL61GNE2/lkviYssXN5W1lCqPRs
 GGazMqr1VOoDH2OBqibRxjJXqcMyzo5oHLquPcXYvuJhP0R/FCYSj0UUbgOWhKLxm77pPVwQXsI
 pdNAURwe4SPG7G1SJX9555UfFPC8MgC9F7fsh/3ffiSfU
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8cbc8e1a5a7mr1865321685a.64.1772543298834; 
 Tue, 03 Mar 2026 05:08:18 -0800 (PST)
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8cbc8e1a5a7mr1865314785a.64.1772543298338; 
 Tue, 03 Mar 2026 05:08:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:53 +0100
Subject: [PATCH 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8F4yj9WgpcRrhlxe+LM9CP/vQbqufNYhRkj1ketDKcE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0tSbWDjI4/dlk1HRlsDCAOz5JoDtNTCTLCB
 yW6WwGdzF6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLQAKCRDBN2bmhouD
 12QHD/9BCO8SDyjv2U42Sa/8wPJ/r0hVx/bkMgsqQGHRVZnMCqqbWINvBusv+uK5VrN3oYfxTa7
 zlXbM0Cxe/Exd+RXF1ieujaTxQY83z69Tmds3LdEuL28fF20SOU/h1JZmwq8PWP2lwfFkuM6uza
 JEC9CV+9V04XjmIND3qC8Mk3f32ngvQQ+qY6BBLtAO5XMREfAAaAWGBwwa9lU2jEpAFoovLE2yg
 nhNChpaFM39/QLWX7wVaX9mJp9jO3W0FoHCTsPBAcyZPMGrzycOFGaGGKTHCmkbkyqitqGH/0hV
 X3i/sLoOytUxzDt+28r7oCGXUH/xFplJk6Q/Cdw5z8poHKaB2fHKFgGXSmEYiwD8zzubZuBa/bB
 g9Rahn7CbCKLtNeZ/dqWHY29EXie45jwgYB5eAz1P/Zd0BQaNEIA03M4sw00dyNO22s06kymzzj
 o+uPpICMpM7sLkqrLgpBR+98DCtEWNbF1Ho/u6jNEQ+LZ9UCNjNdP+PjMfwcRlHedItkPUfxtXt
 dCiMlCsfsttIP/cD4uUqXFh2O+S1fk6bqDGvs0alx/BG6YQmneyCyKNFyCcvB1/MS+scFZX+fsb
 gOCTpjhcUaKiAaGIvfT25fgBNyrDUFbRssGxDp9Oxz89/QjzsDLa4A6ob/W4BRcmVBOTsMFLJ2Z
 Wp+gKdsDXg0Tm9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX9qYfefvk1b9j
 vhzu32iVCwRajrvBWWLjj+ljM+dmkQBHAkSH8enVBnmBpsRPk/7qDdhK6+iQK924/zZbdS0oxPv
 hp83/720/CLJ3algTXaAQ3rvEQGZro8erQI1m6OxOkyLH8yYOsLk4rIa9us5XUeBmKuEcwEjEro
 bKn53eQRNKQ3H8L7bZlIDBPEu8ii9obnQrK+Q1rO60hbedRIzf0ZWbUWS/8d6QzhsF6fhzNK1gD
 ymhGjSrkGiFeoIdpIkLzZYrNTvmIW2vb6Rxb88pW9FnCaB9qmGcvlRobbtewnhW14PUkVhXA/1K
 kaPcfdKJGEsy2kUmIwVo5fMPkHS1HmoE2aLZ1bTNLGpvmzY3RbJ+ntPs0LjXbiHuNXowY4W/prC
 6N5Nmi7ipB/y2z1fNWxYHkREj0XXTwYUowIf7HHR7KSCGwaTB/OfXstPHn6JhRmVEBgZDzw5I7T
 SyTTXPCEQY2qwCkEMWA==
X-Proofpoint-ORIG-GUID: fyAv7_YNICjG5-BM3_IHTcwS6AtJT6az
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6dd43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mIdND3L9f6gUZBhNI2MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fyAv7_YNICjG5-BM3_IHTcwS6AtJT6az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
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
X-Rspamd-Queue-Id: DE7351EFE19
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

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

