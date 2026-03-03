Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILTEG1TdpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C825C1EFE5E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4F110E7D0;
	Tue,  3 Mar 2026 13:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkjnB4sR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anOKweMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465C410E7FB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239moWi2614205
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=; b=PkjnB4sRyh0U6jD+
 ySRH7n8BSFrKW9Qe9lRzHswaZxJol0aFfaJ/pYTma73PerqdPHgFa4X2HujSlmAY
 yUluBb5XLwB1sCbwuL4U+nFX3g/O831u34fGnghJp4oyrDiRTrlHNWe2+0nWdqeE
 g6WOa0vWBmzoMSFs7dJztYCyDAuzih5YR+JUwXSozyKURlAw9Jv2ERTl9a7HKBKx
 DFOU4e6joiUvF+MyZB78ygxaOyXZMdWLlqdrI8FNWcuvC8ZW2qrnEq3MSzhfekHJ
 6DKe9UD369Hnq2LvXULNoqn8TlO8jcbXFJpbmXaNyJZNrGE3c59BIkBAn0ttDhap
 bQZNUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf8p0n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so4534087685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543311; x=1773148111;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=;
 b=anOKweMPl8Le7ba0G+owXzvZXJJSlEMXZ/TjFKhiNP8P2gAP3l72F93a+c79le0lGa
 iDYoH/nQw+eW0jkKFy5ncffFmoob5rhazVvsPKcMmJF09gTJf9n+9pFykDoqXs9TrJpB
 jdqrJEAgNuH5XyBYB9qkvVg69iQPuVzbhdLzBVo4QkmLOmAKMzs1I6JGfJXeVx0jRXT/
 4dWILwP5tbYs/bxfTFBwcugc4P7prJ5O41Kjp4wkZn2GK2MFuMqbbW3lOUjo4hlcjbV+
 6vvzj2asYHrVTbIM5SYYo5Qup0r6zOv2JPtfbNn4jj74L0L9DUQNjbhWDvoK6RLjS5W5
 xIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543311; x=1773148111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=;
 b=TBJkfyTcufCYm/DFTA2xyBqnHBjV448qmh1AvLVccgj3xuSONEh8SJSuor2AeAAqDQ
 oh8yuLdTyG7UVrQzmxRVQADy2dvk7nANO/03WbFrxvIZw9q5ytwprf6ax6PM4WUMBsby
 aFCFNA26GRCo5LKasWZrvEsULM5f2hwtati2eUq8hM76GbWhJYC+SOIMh3WBcBRPotNn
 fDMor/+xzdmofzeQVnVhUzGtOGqyLz8eFt4V2/2qs8UpLL3OkfW4dVwu+uKhbASWnf9n
 0gQmvxCuojdz2qLRNbRgJjvxB9ZrqBhV378UIBcPBeuKE+TV0iUs2Rn8Bcyhxy4gGUVS
 Oa9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE2L2ZHnC87uUj+6BxZV4BuHFuOr1Z57Fel68eElaIKsFFpyOClEvKJVp1D+qEiqc4yU1HpQUCgg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn5uU9k4zjTRosBa0iGnlFupi46DQ52IQZf8QZxuHTPSdn8h+6
 v0xraqtjLqGwllVsuFbVU3pNYaftW1l7728WmghvjhWp4nx34G+24PAI27HgedzgpXt1F9xOIi3
 al1/ox0UeAypGOX0kWaDp/42tio57Recqde7/++yt4auv71JrJcj4P7PLsLpcpfY9U8oNxxI=
X-Gm-Gg: ATEYQzypFKD5+7uNfgYszyZ1o4a1R6bO2lId2hzXcC0Oc146oU+LvBNkCgWsfzpXAH9
 0teO6pFTRS7gaeONEchXLD82YdtMho2v+x/k4zY4CIOduC7uB+jzi8GVegBvc+1mrYB+8kkITUo
 ++BcEfVNi0HQQEVXT4Wyp18VHqAL7rQSPEtiGnYeEF1yBbk9Dh5Rn1Vsz6xKfiFBGc2xzJ6dovN
 Wy9jt3BuMRFPDKYOq84fW6+rOg8FySylMGptYiY2mo1ezJzuS7BE0dfbSI+DEjKUNHwFEgFfEvV
 D+jPpe0YvWuJQnHi9EcrbLJYcOd8psW2ppFyV41EA3Sj63FrIfB5lTLx62pWVh9TovgeO+nzfXf
 O8bRau21e8LgvJF9vActlcEglj2HcyLHAh1BxqkhrfAmt
X-Received: by 2002:a05:620a:d89:b0:8cb:1e3c:96fa with SMTP id
 af79cd13be357-8cd50917db1mr199825885a.11.1772543310724; 
 Tue, 03 Mar 2026 05:08:30 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:1e3c:96fa with SMTP id
 af79cd13be357-8cd50917db1mr199820685a.11.1772543310151; 
 Tue, 03 Mar 2026 05:08:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:56 +0100
Subject: [PATCH 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=967;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a04VvScGPy8agTNS+26kjliVeVh+QgZ02tt89F9pBKQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0w+e8kZdLFm81TaK0gDpWNMnyVUTIVLqqmU
 MgAlA+Tix6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdMAAKCRDBN2bmhouD
 14jYD/9Ud50BEEesW23DcIVppmrbC2UIVuyhv3fn+5VFk17pVfPJUlqg35n9lsHfx8epiy0N+Yn
 8DLCRPmVECNELwwS6VCOq5UpBc/kxDNbOsOLfX4iLAAGSVC+fxkqgvfPvNf5ZOO7OSSi8FAf4Xm
 oUCQlR6R5VTeLV8xbmvlbKAEHnXFVzJ6ZdWj0yEZtXusPkEkLHJmbUl0Bdl3hFJWnKmfsB2PMi8
 HrHe2VkCjl8gnOeamsdPj6uSJDhtS0oyer3eBiQd1TfnuWz0QiOXwWw0z5SFaiEoW13Kwwbnpwl
 vwjNpL8/asijrsHMoE7SVuHw04lhqE9SOBjhUufG2QMzq60o7XG1Mr4lwff8k8D46dm4px2KeyN
 lwOIRDwE1XXgmGjBGUN11UgowDnrWjLuG0zeWVh352BB8V1e0sh1oGU4PTYP9GQJrKLIG6PqABW
 b1NeqdKwM99aZ82q8f0jnSxXwLpOw9LwyfaHtFqbte7uPpuFXUVdYQ84gX/XVvtqokcPV33B40T
 pgNx6Xrgv97RazD/zGFWK9f7DhHaZ/yn4ACwS7XrOi/eHd+0Z7DJSgHw4oCrokBIW3CTV0472uh
 P0hIq/81N9T2hH7teud1T4DHxbhRwJRPzyjJg1IvUo87dQit0zhM8pZK/M34kie+wVZ1DfiSXGr
 axU5Hwa7IXYZ0pw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfXybHWOJ6/H6uf
 uKbOahe5fnP47B6UcqwNYYq3kD70J1ru8/g8GrF/XyBgmISUmqC5Qie23pjaN0oUkuEwE0Ar5fj
 jvFUf5LqAOp0wCYXeJuEBf4IVsLIn2Hfao3LOaqp+jE6tj9WxP/EbciUre/cxLGhloIrnHGjgcd
 i6VdUAwV1Qcs6KMYX+UjtRgJbkz1yP44F3bqz7aY9lmKk4uMK69FDrA9nt3NE014DXHhIIZqpD7
 W/E11pUTRHDYvEg2XJbNHYjulD/GkIqVnkqtOVG29HQd3P5D1F6W8VmJ5DIVnP0HzbX9ifODYzw
 XiJ5d06D4ifPgdLbcEFnlayeCaAW3QYe7GS9T1nmDwpL4IxwGsAQ/lbCMr9Bshe8WblC83mNW4U
 Nqe/Ssq1QOIq1r8XDvgnQIOIPvTWsmXcgw2EabeZ3nQu+Hv9r3F9F9PkfklEV3004QtxHBSPXky
 TGQxMADraGF/eX0vjcw==
X-Proofpoint-ORIG-GUID: b8mSe2HdVMxcyH7Ln2AbNpgUgjrrK3Sq
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6dd4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vC3vRzACQ60yIF8bxv8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: b8mSe2HdVMxcyH7Ln2AbNpgUgjrrK3Sq
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
X-Rspamd-Queue-Id: C825C1EFE5E
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

Add entry to OF table for matching the Eliza SoC, using same
configuration as SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..3f32622aedda 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -245,6 +245,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &sm8550_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0

