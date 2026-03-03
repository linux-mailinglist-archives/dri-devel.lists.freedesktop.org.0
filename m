Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KZMI0DdpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C112E1EFE00
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4910E7F6;
	Tue,  3 Mar 2026 13:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7XCzeqr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqIfBGCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0010E7F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mnVg3995372
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=; b=M7XCzeqrVKDZ7ZUi
 pRjwXV+Sa6fONy6BDmsT4yghRKyn+Wm9SXJ2TlTEbaqcJulo4CIJX5CesrAoQuvn
 pEmFhs4kDWMxBoRzaA/2tSh0hcgRBe7sPmR+HB4E943xXza0SPglRDpxcW5RTa52
 NF5hskPpX/3QfkjD2c5c9hdGx7CTI5+vQgvLt9eBoRcz9TOS0VIN+vEpl3iffmI7
 kM5fmXoEbhTtozel8lVd9DMPPF+YKwo5VXg1ywYclO4nn+x5y5DG9ufUe9nKO76g
 sQoYP7wY6doywZqAOE6NNXrlZz83MfGhg/rTNlXyhZmvKmb8Lxdget+MJyqqeafH
 f7l0kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fsh9p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb5359e9d3so4160143685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543291; x=1773148091;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
 b=RqIfBGCdBQTxPaYM8fQGNgXZ+pus2smHSvFW0s52HeFg55a4CZbkZwsd7L92KVzH/P
 9pYH/FpMc7ksR1WeZtLzckdGwe0F40l0qgnLsy/XYt1ESzKPLDaDpX9y5L+DCQQk81xc
 6Vewmn2tmRmqQkTBuG49OrX7wZpHFog31D6zJkrFh+3zI2Hw5BXgkzshEQ6t5M8iS8z1
 3dys7hm7sfyopTDFBhq6C4LvT7aI2cuyCSjoWGSxyvItKfvBa7a8HrKKuFFYGXovWO0S
 d/svIJZ3ZqsbYDJP2SDAfD1VkHuPW1rXDGXF/NMF1SlIWEvzcHGA4fvhhCSDYQ5glEms
 BgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543291; x=1773148091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
 b=KJrQrDv+pbEOVT4DI89y8NhKCo7yd/REi1zkR58AXPV9HAJn/GBAX9ENfP36LLGjGF
 n+qdkDLQCn79Ixlf97I/mvCswVxwN3gCAgfNdHcanPrBZnto7bkokyDdCxosse1rX5hL
 9Lnsqt84JC5YGsFGk9TDNBmccjPfEM9/EfWlIddp3meXFowvM+MTFMbipA2DYHy00nZT
 LLhkjhGnNzlbwEbARc5UG8lOdO9cLHO7AfJ00sFHAuG7mDpS0lu1Ez+wqrE3YZ2seXiC
 +Ej+Q0+s04AOIobh3h5ktQ2Fy1GeZ8JfG2iWQCqkk9Qsuli9OTwlj9o/IIgxCUH6scUQ
 dV7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdAJ1kCk60QmwoO/phYCHnN+bBZvwU3gh1BoFnkvPrUXa2kUEpIesNIfvFVVQu03d5RQo2D/mp1Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8B/OzrAeqQuXpPpDTrjW7LVjySRYjtH8hUDhGpmITY6l683/3
 1eY6uWGTrw4mzxL7vPh/M3NhRJOGqlSSphNhSNj688T4WwJHoWrd42DocX35is9+jkUGbNYRGBb
 gpyZTCo9jv2n+b/RYrP6WW27Q95J6OrZNAUzQCeujYMefbLlhl9dEckzxJurILNE1vSvAmsQ=
X-Gm-Gg: ATEYQzwZOnqrp5AM305sgO2sXYD5cN19hGRH4IC7h/PJHqptdaag2vYfx1TMpqbmUtU
 p1vW94+v8sXw8WzpUcgIC0dHYgY2Iq/HdUZ2C2DO94TVHV3PyKc8zk1u+Xk8EtCC0ncCaGHjRln
 MmLZl2HnZJlq9Vi5HFhMsQis81/eRobNNs8xW17tWuAWe7HvbXQ4pXJwPogfL45cuJkQVYNOonS
 kolugc+lg+xj02UuUjOudYqeNEaZ9stDGFD7rQlAK2NpiBWuWbXLfXCZBcGM+SjWrMd4p+WeS0x
 En76PJcU+9hlkhRJxQWP73fEYSb51v9ZYAN/36g39TMqzfqjZvnm/eogcJZ4tWc1SWJ66d11UuI
 8iZp3u9cwFL/YPG1CF4w0dKitCFiFKnVDqN7PJ+iltuGn
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id
 af79cd13be357-8cbc8deb9bcmr1945426085a.26.1772543290646; 
 Tue, 03 Mar 2026 05:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id
 af79cd13be357-8cbc8deb9bcmr1945420685a.26.1772543290205; 
 Tue, 03 Mar 2026 05:08:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:51 +0100
Subject: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MdsedeCf4ANTTpubxrkwpqg4SHUnRXKuJ1I5Fc7YjgQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0rzejX/Cug8m6PVKm1rzybqpY6fqV2lhCb0
 3TkSGo3lVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdKwAKCRDBN2bmhouD
 1y+dD/4un7OMCcTu3QHr5l/jJdFsc1HyQAgMZv4qD1NgwZqQ9qxSLZL14G9s1UEplEoxSWu3whz
 a62IAGLKHRxJdrGhst7g9wHZVS3DlXVaJW0t0RmAG1xYQZUWrV5HwvDZY/AgTgqWtb98XuTQkyE
 tdNor973fkzRYprhHiaV6VnxZ7UJ2rZc5EZLfzMWyVQ1YfETU4eOEeaW9aRjVc4I58RWahNysLp
 OCAvbKgdSAvk5CFf2gtuUp6aB/XutUCeoDz4Vf5OeLcYYs1qT+p9VANB82cf4Jg0vLr0AvrD9VM
 Lk6MBPAO3UkzVQNUdyFUKD3j1cCP501bw389NpigPfZNU+IwPpw1Xn+XJYcKHzU6LtjtaYQSS6U
 dJ3e5oG2fRdmX456JVPRnHC+pB8zAbNfXhMaVubhN2VVakwNJ/7SVtAX2op335xrpPg4vefonsT
 TYHRNlKQdacgQG6JVqoRcp0vmn4uIOwaFCOqhO7zFgl8Y5VyMT+j9BeOf2duHQ99kq9mmlhZGlb
 LrbcpN5pueTzIe4Gy+3Dj3XQNbZDCzqZpcZPtbnK7XsNxx5TqjmfcK3cxT3uuOdqFINUS0zAcrY
 Q8/hsctpyHRK5N2igQmL7hv3YlgRTLtnHgqm5KZnWl+7cnQPydv/QB7RqcuOSIqBqL6vtVKIo6d
 nlzyC0eHfYmSKkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6dd3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X0BVKsNMwB65LJnTjtcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oH11w19jCQDviBGwGH-qtkHfXoIC1yoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX0e12JQeKm7Tk
 mCVpxSjZhBcR86m8blThlxtDZlsWjPknQsq719+DXuscla4ewksB17ZIoMTJJ2TSsg1XDgNlEJ4
 KmuLjj0a+6nVgFqGzsJfNvw17Jl237b1YhRy5GdibEhwoOzCxmQUFRydRnCpbuKaeQyedC3CYx3
 NGiIG/04Q69A/8rbyy2Vo32iwO3lSHhCTYumU/LqsTeVfJKD14HEJD6AHssqKmv7i4KmYO4PpnR
 fhwh+xyZ6SRkbbPjz2LlQu4SZOH30tRJnzNs3SvIPHIPe39QVggxpDt4S6jsef+xAReGbdXEDGG
 aDKWWmlO1sd5CWy7n8ohh4E8+Z7OZNNohEToqTJuJHGTBskWTnac9bnFeR+Hz4/y2AUxKzfwuhi
 5S/G4W23JASu3brOxuTpGCBkOZ1kH5IHovP2Zj1lgcI2x9lTg94eCrxQKfL4M1kCpXYcYWwsEeh
 LBDPWwKgtWOC6bI2ogA==
X-Proofpoint-GUID: oH11w19jCQDviBGwGH-qtkHfXoIC1yoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
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
X-Rspamd-Queue-Id: C112E1EFE00
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

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with few differences:
 - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
 - No MST (according to downstream sources).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..d06d396df4c0 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -67,6 +67,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-dp
               - qcom,sm8750-dp
           - const: qcom,sm8650-dp
 

-- 
2.51.0

