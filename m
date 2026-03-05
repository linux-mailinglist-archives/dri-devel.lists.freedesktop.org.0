Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMNmOaeTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAB213742
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994510EC30;
	Thu,  5 Mar 2026 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLaQz/PP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OeUdsJ/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6510EC2A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFpCt917271
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=; b=bLaQz/PPVqFIARsa
 0url4Jp5GX9nt9kBhR0P/RciYQ6b6kUHzbtgwMu2eGWlsIELFK44yzwJxvSjkGQV
 6DqRiaAgL8Nkuch2yDlUDdV0KVvw399gSFJVKAYvLrFNuzU7jhMfmMw/xUwrXfGk
 MB1TR/X1RDZSPUuWrhiHj4lVqrarskuqoqGEj/s01iqAk5qLi6zlJAGPgjoMPIy0
 pCj0DNiMhAVzvbkwmBpp5mMUIIknaJKrrwJO/T5R7GXqQa8KVPRjET0cZ1IjyQt9
 K4XBj23REGbt2NZrVlKckxmZO8VMd/pkw4orBG/1NJPSCTJgaJiMOF3sBZ82V0EV
 c8y3Uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380sstj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ed6c849so1471616885a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721055; x=1773325855;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
 b=OeUdsJ/pQzZJiHrkGlv5MlDyfT3E4xGN1k74Jx8LLuVjR+jL0BneQQ5PIv/R1d4Q4X
 TfPq1erXTSA8EuqEcpzG2tEaUJgT4FWtR0P4axCeGro8O8DHkzDcZLx8UrG7K4o1IWi7
 10tC+XETPjh26CfjR0XcJI95EHfVuohyVSN2E68T3vVhNbpruND/K+WyJtIK3+hUZbnb
 YqPXcbb4vs9ZTGSOzbsxP2FEmtWmTjnAmujKr9ARc6lKo9PJ7/9PMS/Wk29hxoEg1PRD
 7U28vlmwhJFz2K10O3qfkCavLOf4t+lCQlhI2O5UsNBd81VDzKgRwGFlMJE6qsJ+yTiS
 a0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721055; x=1773325855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
 b=NShOFa4TKVahfuFqs8x+SVfvxQ1UUuSAeDozkTVJRb5R/kYcgMC1UtKHyt6ltXv2aU
 Re7l82kgKFgcyZY9H8MSL4Vny7L5DYduEj/FNxl3AJ9IKAF5TVdTS8ShoDfrQoLeJSqs
 G9e+6YNFlwnlhrEQuZL0OoAYtCl4AU/6+SBsZ5ZQJVluMVjmTlewjiwcpWilX4L7ZEV1
 IuZZCEkWcbEZQEpJGlXSu9YwCwcQejj2xkHc0Ss3lYhCwz7/ztAyaLqLnGXDMWkayX55
 qtKC+Qyvp3gyimEQO9MYs8qUg76hb0/aFWYmS87g1QqsY+MWu1+wmnB3fP5BKtBnj2Sy
 C9hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGqMVG39Da6WtqTRby5kKECXKUxRBVVwH4uBU9TAZ7Ql5L38RAz03K42bkXqIOP9MiE1yhy21JQ9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuEqFf94aPxBupTVIXnwmCOicxhOjpSXuTEg8O188mU2hRMG3c
 dFAvD8sCY7YC87RIonS8DDS6Iv7QqlN97HZ+Jjs1cmhKV4FUtwIV0Z3xPoLkz7uEeIjF6L1QlM1
 Zk/u/zzifN90k744vDFiBKLNQQJkPiPzRsVTGJu65wjqEOy0eOAsgAJTv2y+r4k0vOYkFn7I=
X-Gm-Gg: ATEYQzzjeiYovy4JshD5wJDqLdYYVVJMWNxMBY6FZxwKTEz5Xur0LKGsxwbOergx65A
 UZ0rN8zNv5LupSCngaJTRAJ+QJqqPsh2NDReMmRupEUMKbuzcYTuPHtS+Q3KlW2ROP/N3d4iCdV
 b2SYKoXrDmEZ42pLGE4Ph3yl+FwLSxl70I0mMcvh0+/JDNyo/gWCYVriQAUhWEq7iymC4Oja2gd
 rqf7Ymr9SGg5mo+UyS8eok7T5F4O9jBJKdj4HB5AncMLV7VBmi38uHL9keHl0cP78EjM+Gbk2kk
 GJO34QP6m/XzzZMxOL/Sl/5nWjuDMtDj+CWxJQaXlI7I4E+J44Pz+W5zNbiqAAbc6nHNsQ0ITyd
 EA9VnQWGfBrOYzXqaGLJMf1R1diMqzDBUw/nnz9lNNd2vWK4urZhLLe16ObxjqpvlfPNKqQH6qV
 p4XtYDAsMAA8J1EQR7I68kpo3IdoGN9nXCYJ8=
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id
 af79cd13be357-8cd5af80331mr800442085a.38.1772721054709; 
 Thu, 05 Mar 2026 06:30:54 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id
 af79cd13be357-8cd5af80331mr800431485a.38.1772721054108; 
 Thu, 05 Mar 2026 06:30:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:44 +0200
Subject: [PATCH v4 2/9] drm/msm/dp: Fix the ISR_* enum values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ww/3qknDh3ls3uKJd9KJ6MipP3FzUf7GXLi0EYvbbNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYBQIJFSnt3j4DfPHw9uvVAqVMJ1BsFnH65
 hO5T1YmymiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1aUzCACzIsi/nyt1jXaDzIfkKPhx3fbpgBMO2xIw7lATpx06VVEB75xlWiF+gGci7qd8bd6ZGS2
 j8JcZeH5FdkojA9eGj2unttjK+G9HVm98Sa5hjA6NEWNPBunexiSEDi5QzY4ovQX57OXSmpFBwH
 Q976srXY4pi3iGqHLg7JQG228y+Jv9YIkxaAScuQQQvoMEzNFgr5062LUzzYYuLbcQO7kyCd3i6
 AWHujAHI+F7p4CHdzlpOqdibjjwRimGYxGtpjpkjcToujA72cP0Im28hAu11A2vP449q6GkdOhk
 H16UKqbwzRHap5jVwOKRHCs7GI5cBAs4COxU+06K9/G4KErx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9939f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MAGd2CMUOC27dMVB4gGJd_hNp2deCVdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX0TtyRMJ8g43t
 my8RMwRwCxp91eViF6MXittQ+dnvMVpBY8o2adbspKoZf26cx0D2u9uwfIjyah57UXmW0vfalgl
 wTMkIeAdh6xvU3Cmg3+f0skEsIPCBjjaQnORDFO2QdBQMHQru448sqYQNu+fWe/jAcCtg5Le1Vh
 p9E6vtWZ6Itl+MbzCm2AK1CAdifXxr/OquENvOvtRG4pnvwIjixkEdhr+c8tFb9wEY4GuEnvFxF
 Hu13SR1dqKRMIbrtyJicoGNgoJaeSIAMTN3SYNdQ+1+BHHfxifmjkGfMWNjvDrIhDddZrRxF3wh
 49mSSnmPo84gobJIYjMpNSE/r3kzTvPZF5eMNDXzsztY+kSw7kgrpkiVx9OGpLJFZvt6kKQpT1N
 8kCsuGx+aZu4El/sq/ilUgWsMH1osSTd1kR0zwHmJsCKOAF+VbN265El/GMTE+0kIgYIgSt8sSQ
 aGb9R96QTW0rWM6Pw2w==
X-Proofpoint-GUID: MAGd2CMUOC27dMVB4gGJd_hNp2deCVdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: B4CAB213742
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..5997cd28ba11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.47.3

