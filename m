Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGSnDWBfpWmx+wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:58:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3F1D5D92
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689B010E47E;
	Mon,  2 Mar 2026 09:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZvTX/TF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDBWlu3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E743910E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:58:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62284Sfh2350273
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=; b=JZvTX/TFus0PFkgP
 smpqYF0pKuw4Dh9dOB82LfeLNny7gH9hwTq/dgVIR4UVpRC5LcILkwqIU7xpjSCA
 Uf3xCrFDPtC9sQn6rMP961wrgF4zFfWIwI/uuDz+RYzorsLf3ISQsgMmOSEw1gSN
 H16dKGXWfjbmLRmC7Ng6IYMbol8IFJ9uy+9pfQszUztJeeyRu11LaxZniEb/oE3V
 WefihAwI+UEaEYRNdfxKAytPMaImGywifHrU2Vb/3pIwB613StsjIyKPyB1AcF0p
 ao8RXhvua6hIxaqZDsAwvanNgTjeGMQtZkb+Nzk+P3hElWFT5gm0Mf9Nsjr5la0r
 FEao+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd5259-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb0595def4so4195298085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772445530; x=1773050330;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
 b=gDBWlu3g/lwbLzzxq/khfkDFLOKUGYSeQiiO4QE8q5ql7D/8oH2ti9Pt+Y57zn66tU
 DIoRcwh4WSczgwU96fYnDwFkMXyGEaiQWh/qhIRMlQ7A6CPj6ArxwD6Q9c5DTILNoikn
 1402tvHhMGqddn/88XaYvuqetwQ8gyv5r1spUoo0fXgkZKbRSNydu7ZrVVNuuBJcKVFb
 pNb3uomWl5IrxG+QQGiTerIXPsd+N078pq1zIvMAgb7WQj4gRmoWf6CgNCExoCJhzQ3D
 jkieFXemQQukgGUqWq/zthHCYC95XFxqB9e7naa4Lt5FJYXq+ydSfx3ARay51mQmR2fC
 kK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772445530; x=1773050330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
 b=aE87z+hYZw9HlLrrGY8RKnqZAENWw2n81SCbTk0ZH+w0NNXXXvABgvDceyJTJ25Tw4
 zxzL2g981P3950VDIZ4mhgcPMTaUJBE2XystPDWWkl9xz0B72CRBt6hGFLMwnkR0gwko
 upk0sye50mOKdpbKFD66Q8kZ5MS5Otk2WzLjZPodWmP8YgmkKhcqXneVMU92/15Hz/dx
 8tS7rU1f1tyAp5zvnUGzWE8yMoTp1u324yfrE8fD4pik11KSF6b1PtETJDRyUi2cE1in
 +qvaDMcvDY4c2FK5yE9EwIlHY3uhOdTW/1UXzdq91hf8IzsiPKb2ymRW0A0UZzPuRy7E
 Gcuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHy8nJ05k/3OEG9y96fLfO0rEBgI2Qx070C5lnjAXyo7VRn1Kk/SZTb/hkJreHwyAlqb8RRp7x5H4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4tZ1FfsWNnSfSPLf7io4K58ju84LIE7/1WEbzD9FiSydR6RSA
 xc08rGw1/T55Fr/72baPs3TyTDw5Mx8ZRybN1SN4b/mO0fyk0bCOYU0AINM2BT8wp0YSk/60I6i
 wz1ilewPa3OHFAqfeN1KqSXQg7BfgIbLNcXpOOZCQm0AT9w3kKjMv+wzCO3ghxpOITzygAc4n0u
 2krCQ=
X-Gm-Gg: ATEYQzw8TGjZJ8/YFEMK82SsjvdgNHwkfOdk23WsbPfLf7Rds8c7hRkgMmlUT5o4fo3
 Te5oXCs7Z5JMd5aQcYH431lWg6QEjnsdESNnQ9f2b/mPLbnMYya0Y4qQVgwb3Pq7G30gPsPrJ2P
 1hHTOfXh2mkR9hmHnyW9KC1JZIzyqJ8bmpwaWiMIEq2FzzkruxcNwFhL4/x+ONli7Kzwv9X/bn1
 idhQ1yyzg4gP7BbHXIUzgUdrAONRQcAq1ZPC3SBqq1rg5BPWAMhM9fx1J1Sf/2ZFBSpSmvOc2RY
 oeTy0TZVsY4zRHBrFYh6yLsutj1kqL9KaCdZjrMBHQvMzhAgjbncLj+xFM4zEVGkwrGOom/oW+Q
 tmoEqIksEfImrvlffkGcPESSB/d4gcg==
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id
 af79cd13be357-8cbbf36a89dmr1665567685a.15.1772445529931; 
 Mon, 02 Mar 2026 01:58:49 -0800 (PST)
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id
 af79cd13be357-8cbbf36a89dmr1665564385a.15.1772445529405; 
 Mon, 02 Mar 2026 01:58:49 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm9523027f8f.30.2026.03.02.01.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:58:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 11:58:35 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: msm: Fix reg ranges and
 clocks on Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ugiE5l8CcjjtV9Npwf4dBU2Z3sbwAjztE1heu0QvfRM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppV9TBAduqk1gcr0xXxNkiQDCYKg8uz16HPzEf
 wewNSqwUUyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVfUwAKCRAbX0TJAJUV
 VillD/9gXbcbldVwFesEX/WpAjC1aiqVjQ7lPDaV9iSKTn+vNs3Vu8SZ2r7tcKaP2PyQexSdrd8
 mrYVW6J3DqEPW14o7tdPhVckKxCPPt9sHOxGf+XSy8jICvBtg3XZtZQfwPI88Sjg7qttvAAqzI+
 E+FzWOlIg1L0JLD2jJq7neufzgWFhrfvu9yyoFzD8V4SxIsd1MdH6WpUYdDeiWNJkbQ51qW91hF
 6G2dvHy++UYb5wcdMC++IqeTVikEgqO/+m55R08uoFfCGtzH3MoYXCW2N6ux8yabUVtM/84RgJs
 wVGsGC9m/ZdU+ITDYRGemhEwTQ3rGgJ8cQbrESGbLy7BwRyPrDdoCeWckWLmX87iJXwY1NLXOgg
 l33eGQkr7WSuQflEU7PAmW9a8eCzLRSRZH5xUQeKd0tTiQTwdRDI1qdY/1cyROjr0XVb4gylPOt
 pDcxSup+yLlTnT/be6+IQFgeGI1pYwjv1BcBaAXA4YW5xqxwpTaP6/SSm6hlwc7ruzSLj8MCIWy
 AwG3TypK46asAnzCYPbVRProLx/iVDYM6nT3hJoOrng5fNgwNE+PzNeaKrk4D2VYHIgajls0kX3
 cPEAAj/+Fy/5yixcFL9nx4VpSmJw0/SjerRjFCZbZI+W62H86Ke1Gs2dhtAt1Hpx3vpvoMZTQoL
 cep0UDwNFCgKuqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: L6RbldBjtvvxd2wL7W3Dff9eZ3SJbGq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfX8KZk3t872ULG
 7SC6NoFEOGreNNP8DcPzLg91lp9p852eWs1f65GXusP6D57XKbNXL8ZF06tBWtEOrZWvI4DChtv
 ynQEx6S7/6tfS7SZkaqKwG4Nala2Wjjz7yoelWLM9JbANwjjgJZLa68N9pue7HJu6u475gKrxUz
 KkrF88k6PteY2KUd7hehzqTHTbJKB5FIgla1imVotoa0+LaV6Voe2DU8HnTPqsZ0IKPOvaVGh20
 kWMEf7S0lHQjSXuieYai3Ual3xH3nHuoBu4VyX9jpwwO7MmLDJEllnJ8xC65XONUataGGYBAZoD
 5VigXUUf3PnWxJeleBt6etoDCj7Kk9GhUF2CdARFcjhccMXFwmqis9HYsb+uAnLghWd5bdODcj+
 xVpqLzvHW2KP1tsxMyVQN2mh0BdV4mNVT8xlihwz5OEl//Vm9g9aLi2CXhSaiFpt4oUjNac/ana
 xkB0PNUhTUZRz0IyhlQ==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a55f5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8l7133DT9HzGPwHiDQYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: L6RbldBjtvvxd2wL7W3Dff9eZ3SJbGq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
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
X-Rspamd-Queue-Id: DDE3F1D5D92
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: <stable@vger.kernel.org> # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:

-- 
2.48.1

