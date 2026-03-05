Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YALxATpYqWkh5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:17:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C320F8F9
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EED10E235;
	Thu,  5 Mar 2026 10:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+P+Un8E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z725WSzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69010E23F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:17:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFovv456094
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 10:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=; b=a+P+Un8ECkESr8ly
 CflvRw6US4IorqTkLiPc+zarpjfU9UI8qHAnvrLSFbnioFXPYul8a1Dgb1qbYSlc
 OLcyJNZU9h6zxjcdAoNeAy0EjVIuQkUBax14r3G7rWY27lLTrDLfwbwrh+E8SmR2
 3ba9gdRblRo5N6HE/i9sCO5my6BaY1ahs+AqcBeVnfSSXpPhgD64ANBmZWCzSm7z
 Z6beQXB/1oe4S6vx+Eo63UBGr35bSS2gSzEFtS5r9HRwm8JqU0i0xziAeuoPTFJg
 Oj4rWs4YMEzv+psA/vpXC8BrL0z8CN8wAgBgWRzxpY+5Hw16SpPYC3gcyxZzFCnK
 9d0kBQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjuht-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 10:17:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-899f474fae1so281225846d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772705845; x=1773310645;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=;
 b=Z725WSzY5nYrCMvnq8FpobY0IXv7jdukH4eGcirg8HhNWXv+iYtFwwYbOtMluv2Ed9
 LWno0U46D7rvZQ+p91DHAoZgDktY9Ejd1m0opk++CDAHFKoXfMnEpqSN4gR7dFDUPhKZ
 8eLFR5JWvr8T43YMgJEQYR2HxH9B01U5vNnOnq5nUp+IPSyLYhe6yCS2Sh3Bw+YUlpG6
 ZhsEnELEVuDUpj8EH4MdvgieD1yg/XJ3o3pC+GeX6pbeAmdTP/dozDfhQOswrdw7W+9S
 V2UNR1FSsD6UqDk/ZN0Qus9qen9PzYH4V8ZxCYnjGQFXzy9lO4H1U25eHfLOSGKojkSh
 vfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772705845; x=1773310645;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=;
 b=cX5Wl68GPaCJBh4fyY7SsEfi2AlPSDrbPprsRXjtv55TdFQd0yn38fddXcxvSMs8uX
 JVAXSPp31nuK3OKZTQ4cQVzBMRPWrrBPGGvuCuXv8yI7Eczi27URUkX3XckjkJQCExhs
 fq0K6Yb5zzDnbeO+cnBa3CbhXJkE87aOisr08Pzzy25oYNdCjmSdt1T+avMofQlNt8Fi
 jq5oaJdrN/7uupuDeq+H2GTXNKbLcykYCjlNcRwpOBhHkASlbWnrjhR4APRmXl2esFug
 d+/i0nlMtHLOMTuQl7fbylpXppyG6Dq9nOjplTwmkGG6kNzAX3wot4W2e3crbUTPRaQq
 H6JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9QRF4uHDm0lECs1Q4FhgyvwCY49cwAO2GcbmHfRA/v7CyNYUo4NZUaYkd+84thGH/La0p1yvhCJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNVXGgWFUq5ctYKTC+27Fc8vnLGjD74a0OsvkPud+FkVApJ+t/
 tmgqOiDX3Ei3nN7uY+QyKupZE87YFf+cp+LOyhD793y8zXIePYoZbZwU51nzELG8O52Btg1IUeb
 Sm4rg0iuZoSmeY+xZ3E7CSynu+ZCspoQcuhbnH5jPRIS9zE9sc1KXwdLJ1Q9CU40/t+6R4kc=
X-Gm-Gg: ATEYQzxLtvby+elPX/HjiMmRi5SwsdmWaYUdBpyAXMn+8OFoYJLeVyu+RExXGZyH2gL
 V/cAQ24B/5tFV5wPApv1Wpji3qN4p+tOP2Gr/Om/vt+oqOOiTsR897ujGM32OGrWu13yIiCVeQq
 auNXdXLnJuYqjo7BGXmxVcCsvqpiKh1NTzS6BUYtrKvpjsIxTsh5qfl0guJ0ACsRR43Hiq+0JF4
 pRbhEMjIfuzgb8sIFLzZtgQwlNR0qGQ1QLNLh8xa63iohQQwg93wcPDJC+I0gJKMcCTveHFVdZq
 6NQsJolWE5z6kDejcevcj0o2gcKwkb2uCrxUqaR9HFKuJ+oJYc25UoJi1qWygoP45KGtCPFvYoX
 dvRcB3dm2jnztIwhgCD1MKN7sTJnPAegEb7sKpPFHEvEV+SiHmwGU2H6NVb3voJqhJGdc2qBF0U
 sKXi59cn4=
X-Received: by 2002:a05:6214:623:b0:89a:77b:837e with SMTP id
 6a1803df08f44-89a244779b0mr20540546d6.6.1772705845350; 
 Thu, 05 Mar 2026 02:17:25 -0800 (PST)
X-Received: by 2002:a05:6214:623:b0:89a:77b:837e with SMTP id
 6a1803df08f44-89a244779b0mr20540246d6.6.1772705844891; 
 Thu, 05 Mar 2026 02:17:24 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-507451cda0asm194096731cf.24.2026.03.05.02.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:17:24 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 18:17:07 +0800
Subject: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
In-Reply-To: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705829; l=1244;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tO41DjAOfQzqwZFbNKiKJu3u3O77mCrCtRYIBZJ6ZXY=;
 b=zlSVe181QTt/TFKu3KzUdOpSymLiiZyQyFbIa9D5xvvJSW+y7BQK/5zMvgHFA1dusq9HOeCAe
 lPO6wmfzSQ2BA24CSjzaVP6TSOf7rpK2iAM/J6jZgCGc1Oh7H9L+eyU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: eiClD26wNtLMuv3G0xYlhW019pYfj_h6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfXwzyO+LAmNrJ8
 ufP+XRTwVZcE077+pJxkEsX+8Og+Y4yde7IChRbxEgPXbrri9TWwsC3oIFBE2ZZTo25/o/xsp0i
 7nrC9WtfcWmNCfjSa95nE6yCNhSvGG8zlYq7o8gE/8lyxyO3cfIM6ZyEJuS0P84TkrIac8KQugo
 Ww/gO4LinR0dzIl4+edyOL5pLNPkPCUp5/scAgz3QKlGQdG+7IZtsW/dPyY4dsl4n6nb/h1odrN
 Z5Ph+fnDtoepsxXPnqMa07iMDjw/XZRZ+3aTSvN09paHFROv/OIYTcvK91Q3SLfa+f73yVMt1hR
 FtqVYBEAZZY0M3hUiVeZv0dgVpBKI8Nh20snvJSPIwkGBPZS9Y1vKZzVm6JNC4dDwePIXOGKGzp
 sJSedn1Ksemm6g4oYW/nvxppn5Uid1qxGMOv3G51xtXMDXO+M61tVo3/uNAEpLMQzLqmoScjubx
 TZdXU0JqIB7mZ9M9/Zw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a95835 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6ltB2YlUPjWEuFaGMccA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eiClD26wNtLMuv3G0xYlhW019pYfj_h6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050082
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
X-Rspamd-Queue-Id: AC5C320F8F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_mahap@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The intr_underrun and intr_vsync indices have been swapped, just simply
corrects them.

Cc: stable@vger.kernel.org
Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 6b24e9e84dec..00fd0c8cc115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -366,8 +366,8 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,

-- 
2.43.0

