Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BsZEFrdpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E295C1EFE8A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3C710E80A;
	Tue,  3 Mar 2026 13:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpdVb0GL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILvxSXJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87C10E7F8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mm2C3951834
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=; b=lpdVb0GLWZly1IzY
 63EeO8IhXtQccBfzVeXZo2T8IksXE7oJQTmDyjaurXzcn3DQmLP5OoP8DgbB3XxB
 KYjQHf9SzSuI93qu0dJYyn2YNcVUqw0uqvMcPHsMsfEzwOvQGnEKnH1GT4sLrkOf
 TrS64bizr82rVcFtk0NM1Zmq64aB4VuFgScJCEjsNeZNlAL9mgLU649uSWM3l9kh
 VHrmE30A/vPqUrpT9z0iwi5KPRXsc2rZppKws6YAQqbtgPICegt8XTwOw/9E66Bt
 8FdsDi7S+jQ9emGHVP73n+E0Wc7CDDp1HcehKFLVw7ljno0CDDO/0KFjTE1wnF/J
 4iAUzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n932t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71500f274so569494785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543317; x=1773148117;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=;
 b=ILvxSXJdwn8LVYtczhgSykbLyWSQWnif6Pxq/w2FIdvznoaTRpIiBBKGeURKVx2XJ0
 t74rJ5q7br3bjJdglFbR2NdECaZTWYfolBwpE8aCpLdTxjE5Hqv1dRthsaFIIfFSK4ek
 qXijPOPO+iIrQMuAaeMSptJZh8/0eD8/BwoeYy0CPpHhA5xhQ3bX/vrHOeoB+ALg4zie
 9xhjmXX+GevMNYh5zlnQrDZ1K4dMiEv6msyKfVYeY21txW7wi4gchtw2j2zD1xnBGDfq
 Epn+hCp1E48acxPpi37Y6KQLmpXDVxXE/ZbuLeGXg/PONTJ+bThZeJqEL1NEPjwSOrtm
 IPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543317; x=1773148117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=;
 b=BXtN2fW3RXFgoSv6DypSFiJREscqpbM7zWpD0T5Wx7urTuCey+zUYCRxN++QSk86nz
 1xtbJyRjMAh+kRvouQY2rxgF7aP3RaUJ2II14GetBUYoCUmX3j19NbCvCmU0TmiDCe0G
 03zulSUEohRd7ZW845Fl/RUOrt+xwms+z9bz/SSyuw5x0YWC2vKq7DFR4qQTPICZS/KP
 8cu6T11mQegqnNZVBkfx6Qdtw2iOj+rtY53k6uAHXt3M28bXuWphyPeh8shMjdnIGrtE
 uJXbyA9eRS3Qh7AXu6IcM2arD4o9Kc1A7fClQcFUvOckGtAh34pbC9RtQ1SQtIP2Ksvs
 1l5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnin/4mhbnAD5CddfNYI4yYCquFEbrNl62LA46bnd+cTF09l1hTeK4Vcz3rufEvJ4Zym88ydaNolg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7ohemrCoF36kXjVbUSjKtsKmgZAzZ3sRfZ1C7V1T+Plwg/t6Y
 yH1m9ZGjMZERAJxakYOXw6zGXKMkxirYX8rTNrF9eqFu+wSxdhNqTd66E9Ud3M163h+GYxfec0r
 hF9vOwHPfx/d2P2ZnzucZ4frLNHdEDreAYlCKztZzAwFTRG1WrkM7/lWEaxzTYMKFp8nE53U=
X-Gm-Gg: ATEYQzwIFtVTX9f95xWThvNktWEmewmEhK3JOQxDeFCZCh3Dz9DzvVm1pG31/sZouRQ
 vkZL/CBwNnAc+1phvdKCYxa9ndOZzj2NXEBqjwzABphfBUIuR3MzK5jDGx6X9L3/SOwZm4ubkai
 eYW7xkRhouKNZTwsLBZ7UHwCo7oYJ+5OhFZ8O9iOrc1njryxLcimh580yaXYRdQ9JNVR2JqIRKe
 BJUQNIleWJkttEG1a135TdbKkLZ8Bl8komBgvvd0Vitq3cOXhQeQpnR8RMFDQNULL8mX/h1Tj+E
 AZuUzDNvP6oad//Scb64DdUwougUcCxcUWWIcw3DjctNXwaqBG4dPgq+lLvYKWCpX7LJymyKXyR
 nrV65HNPAOzRUC1NolChtdKGfkxDVYdr9K6BpGyq6ejn8
X-Received: by 2002:a05:620a:4503:b0:8c7:a84:d0e4 with SMTP id
 af79cd13be357-8cbc8e8d4d3mr1962865585a.24.1772543316968; 
 Tue, 03 Mar 2026 05:08:36 -0800 (PST)
X-Received: by 2002:a05:620a:4503:b0:8c7:a84:d0e4 with SMTP id
 af79cd13be357-8cbc8e8d4d3mr1962858685a.24.1772543316430; 
 Tue, 03 Mar 2026 05:08:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:58 +0100
Subject: [PATCH 8/8] drm/msm/mdss: Add support for Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-8-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KTWS2/nQAIDRZvl7DcGCjzqb9vEvLIrn0vkqqdeMxEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0yEBXhsZJYHmIm0EGwPLW85L4bV9td8R0Qw
 WmYX7n12EmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdMgAKCRDBN2bmhouD
 18/sD/4vBA+Bespo+c0WRMvGbITPSlRpAMyo+GULQADhyiuqs1LjQpLBYAanFPKKaMNOUgDX61l
 ZqkC+lHgrP3xYJh+6FD2qW2WNs8CzUdguJAyJciPX5ClkP6cVCXWdbnxa1FWqwzVp+LM6ZwzPrG
 qows8KvwxcjJk5F7VsKBcD06vm2rdwiqqiOo7HV0T53KuB7F5NxDOgRbp1LeMjw+Qed4taLxiLv
 EaWves3j3a0W4vS78S2iavnAaqvifF8DzJCntUpZltzHATmE2Y9Vu0EmymmJx2R+/lBYgQOf251
 H8SkTAzFTBKtevoDciv5xf/sWNC88R/m5+G5MR7ybgx9xL1puvLn871GymVWnj7SvBJKQ8RSGzx
 XzTXz1LvhG00ojEargOfNZpPbHqYTswJYmXeB+liDzb6itc51bhTDCAKrofcwb9yWs4JMxS/Oc5
 6zt7wUsU7CNjPz+kpKbdEeH4Mt9kofSC8J7EOkxXrQJDGZ/bjLYlAHlEpEBfzyG9Amv5+5l5rqM
 qMMLBJCE+Oy91ngU0pFfBW7SPUdHsWrdPXWusXMXdUNvn4CW7CR459dI4rxa7y+AtuMEDSC8kUX
 AvrTawzjzvGmaawi49mRNpUfDedUKfGFFvY48WWuQJnozd0pHZalMhriLjBbjebXpB8JMLW5Vpl
 m0TX5cPFlk1AaXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a6dd55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fVstoq-JHv2YdypUvPQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ukLwjuvuWa8i8ca1Kgt0jKxD-LYVPxQd
X-Proofpoint-GUID: ukLwjuvuWa8i8ca1Kgt0jKxD-LYVPxQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX+Zmv2Ay9WjVW
 RG2fHChpPxrNps2goAadv+XsKKYHRujDxhtF+b77hiQUMxxguQ/PbyuuGBDkL5NURqlO3zbY078
 uPNRw2TGCSgw9zYBIs0U0iFAmaRaITINVW7mRGNQW2STouwIjoGexAzk/uPRoVo2fBKe/K2vz47
 OwX7RMbrmOt6CkokGWeyP1fXLa3s40fdrGAeRFRvOdWWVxLtkeOKwmMQpV/uT4Qf3N3yy31+6E4
 ih3eWKWzrQZJSDGNbiU1apcoEZFjgBEqo56MHXuT/JXIlYQr6IyMxo1+cMuOwch/5lavAJ0XmIQ
 DMetEPvRShXXfDIwRj3eiOLxt8HVboZftoOG6Rby4j/eVzlDQ/bIhnBTy07RKR9l1KB2+qro/OB
 MrAWzzRtT/gSyfVqOdrBouI9EIf2qBuEWT7jZBF7N9nRrOTyWJS3mLzJIA6NOJl+9/EwRglkl0Y
 Js15qS3gG8UOncqyG5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030103
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
X-Rspamd-Queue-Id: E295C1EFE8A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Add support for the Qualcomm Eliza SoC platform.

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

