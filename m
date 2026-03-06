Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPWdDicFq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E309E2255B7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1610EDE8;
	Fri,  6 Mar 2026 16:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPKou1Ck";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPxSJ0QY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C0610EDE8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr2qf079849
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=; b=YPKou1CkHJyybE9A
 5jcuN9qA22CrCflNrI4lc0quCx1cLiizxT/7tr29ZfN6gkEqzgyd/RG+gOSlvk/x
 BOPTydVfGa3wK5AHZqfdUgvgjARpQ79K44TsonjH468DxZvkbX2KmWbcAA008aeH
 2pVCNH5Up/AmFDNrITTWqjrsDuWLV5X+8YV7m1SG8s0jZabKxPlmwB6ShC5w/DFs
 2dOs+L9cmGtVo5v5sFNTIlhMsDOUP89i9xUCcM3uO7wut1Xjd03IvHgCyf43ZuD3
 sEH/AG763dh7bBBInZ9LL/wpDcU16h7bVyDW+6RSHxmZsdAbxAxDaFxJ53Gq4Kf3
 +XE5lQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k6y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70ed6c849so2001419785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815650; x=1773420450;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=;
 b=gPxSJ0QYdUk8NNqLaS7ChZSCWN6Bj0W4g4Dy6Yab3xJoRT309h+du3Y1LKO+YufIvd
 u/J+y7wmtb83c9E2MMEqGsgy8QE3h9IuPUjq5j2EwaHYdHQb/3Plou2YyPedN3z81XEF
 nRPVWmyjkppEQmlNp+8/8PtKFCCZQ3cK1OFnuJr06tnWgwgcb+C3sJW/BbANXlpqZ2CI
 6dM4GeNRZ8ZOwlt8lHL8XZTPvTdCHI+Wo9wEQ4iPpY0RBVZxSt2o+XFgfNLgf9RUnW6V
 wyLEZOHcOmVonoj3HIz4dJX+MIjyJCt/WbMmT6JyvauexmtUVZ1iVSapQ6Xf2j8vh2IE
 mU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815650; x=1773420450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3wMwGrhT+6wGV+QqWZ3abUAX5y5DEnILFWoqJJJ8JfA=;
 b=amKOuL+eSSMJq6CDmpV4kgR349zl+oEAXCGsu4fvxECHtaLq/0tz2ofQIhBu7Yudqx
 dQ0QhBfuyBJ3Ut+iRiz+5R7LsPHpYu4tbivwJJuuymKakvxqTPngJfdv7P2ki6ISnioh
 u1u5sVP2aZPLf7eUrFV1PoZF+xp3OB1ap7sINKCRTqQ1u2ASiAQ/aJEVdu/kNjMpBo3b
 JQutYD0vnqxIquqo6BTNH7ZQMHRgmuuGyVgR326JCyjkE/LWQM9ia2cNPW5+59bkzNY6
 m1i9ZP2fEeAhBg/+0LzdSGb3KyQxlXOrKkO20dEWmNH7trfk7qjrHpNExtWLScqBRHQr
 4PUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcj0n5xeAMuRnFVKfDvqrr/4UsC0+l8oymlmb/OBUxmKlGWzPz0G2lP91bhq0b0vicA1Cb7rUKWg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiOBl0QgepER4KZ5r/lnu93z9wi+ETKEKJLY7vNuvdrr4Mq9DI
 IK95kXi3G8P/mvD3ciJYkPjrTF1SZrJ8RnDHiyanHL3gt6nZzoA6jaz5N59AsglXNowZ2epOOu0
 BD7Z+xfZo0oqcB4zigCEDujB/uPOwpOtA5Oj302OkQ89qSc7ptCqLHpAn0AHkO9gOSusnwxI=
X-Gm-Gg: ATEYQzyMV0Fp4U3G7WH08Ougs0oSv7W3eqCB6uWCm5yIkOPDe7JmTEkNSssivp8ijkh
 Tun5w9YzH12OKLMHdSqJfVoinW8RmjnkRZgPeV78od5z2HngSY13rIwwO6TS9hXydWdqH5z6enT
 ewLv/uswvf2rCvN2odj9iI8crg9K4stXqxiwblPIE/Trgu3+7mekfbpHOAVgGq8n0WgWyvc0Hs0
 Q5ed/Eg7sK/c1GmGog8VGvuvcxTMSit0Cv0mhox4Ncv/GhSH+BaRjUyIksK+Lzx7vPh7LaBtUXx
 HfaCJvpK1H9cpLwJqDG6UML6yDaivc+VMY2E5um06dypmtboTjohX43cjJr5mNDbahr7DlcCMX5
 3Q6HZAyYWlruGFhdwaqZIDvO+6J120UlyiDKvwjsIMoA/baATo+QsELPHiIaxb6QpIcCw0qVwpX
 HPxTGALHwKEOSvD5D1mGeP7vY+/g0qv1s2Hvs=
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id
 af79cd13be357-8cd6d340439mr333988685a.2.1772815649887; 
 Fri, 06 Mar 2026 08:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id
 af79cd13be357-8cd6d340439mr333984785a.2.1772815649299; 
 Fri, 06 Mar 2026 08:47:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:15 +0200
Subject: [PATCH 09/24] drm/msm/mdss: use new helper to set macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-9-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cNUVi8GGg8ORsbdj0ijaFrB7Eb4PIC5uP3bKn2pf2xk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNPNyiAskeVyt3JIkN4/qJnuZp3EfyQ2g39
 P7v4Dt6EumJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1XG1CACMWskmpv/iNW23lzWv1mFDidXHoBto5XIAMA9A7lhfb/9RI5NBL5RgT4LQUs95Rih5S5j
 lh3wXtUZGipqRHeGt4P/rdhwQPefTZ/UFe7Wq/IB+DGeaHDTjqiFBhukQlN+vDPUD3yqt9TyQiQ
 bvKOeAPFl6E7uh2BHKp99b2/r0kYcESKOldbx+d6E27ZQB0Y+qH7CoGABKnOAXnwJ0HyOtSOSO3
 IjfxihtojQCK/EZqI8pte2fbV85pVsgB7PXZ7X7ro7KYxKx/1EfAnv1Xl0ZbglA/mrOouZTAbGv
 mfz3wyuinPMzaKonkt+gbSZF2pIn0/b0ui1EPfwcj6zRYnnA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: W73GeoEXde8FCsXU08NCjwR8Ge97tkwx
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab0522 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXzI3DlRwgSKlr
 /77Y31rYMCYzhJXjmVuNPU7ltoVUkbBm9PVKNsXdanCdSsWTcvlq96Muml9fNdfn0Ev21ELoA2q
 ME5ck9j1YitmHS0reavROGp5MU6UNIedv3fvjzW7XWRuPIVozK1Zf4P88bD8DxGhUwmS456+g2D
 coIAThoLUWXCGr+xTt/4JkFaHmzUnJih0FWKe3Ka+skXKrOvOc21UtJxu2U29Oy9MyQKN74ZbQN
 Mm1XxaicBAqueZ3uc3l6v9CLSPDAQvwWxQuy1GoA6X5BJrSSLYzvqYpSZ5qYI48cFAXb5wDLbk4
 R5MCSRbvx91k9IRxcGsb5wOQy6OK6eXPKsvaro6a6FDfOwmSo8u/rdT/A/5F9RKmqwoXGIbWc/l
 ewBvs+q74mRgCJAY2AARqKgfkxJqxHTmW+7eo6IbbIBDJhjAuwTKIi/x4Yw9DU7+INiuHYcsrzE
 VTNVqx2hw8kfztTF3Yg==
X-Proofpoint-GUID: W73GeoEXde8FCsXU08NCjwR8Ge97tkwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: E309E2255B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 16bc9589f696..41289606407a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -186,7 +186,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -207,7 +207,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_1_0)

-- 
2.47.3

