Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BMsFDgFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F066A225671
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532010EE00;
	Fri,  6 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fg7sAIPR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/7+P5eZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97C010EDF6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Frkth514368
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=; b=Fg7sAIPRN9rmbSYy
 HHLD0I03VNTDzuvZQW0NZEK70cJcRcbMs5WZ105UmpGmQgmdEWJVtdUK3SV5gqdy
 Y5+witzW1N0Yt/Lux3lC7NtrzS9uiBOZftJjVnsduK57kBlD55+rlYlu2oznPKNb
 ER4I4Mo0au1Tdak9b9sHd/9SYVeQKAEG8W5aPNqy2XEBjkVOpX71FEKeewgLiq5n
 MMdGZrIBnJS9Ujg9gdPCHlArZHqLsBuUL52Kpk5PkC4xzr6jULVDiW9P0EF7VNRY
 ROeuep0aawKUcByF11dIwCeN96whWWDFvRIbRv8nwa3EBQpoAFhl7SPSf8X7As6I
 7+S10w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25uxdt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89a0013d87bso275148036d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815662; x=1773420462;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
 b=g/7+P5eZVhQuKiJqYyeuKwG3GDd5c1EQQMUfiublm2tdspbE3GbwRXT7DEwYOktlEK
 erHWVm1pk0VrzbGUkSjtcES+VKSEXThxoQEMmgLxuzFSwhmOYdZrvkv5ba0OWD/uXnbn
 ORs5ELbRhjsvJeeQ8/EVhCww6SNtPkXKPAWt7Av+YbFf/0G10G4dFAiLSEoP7CEmb5bS
 fW7QDdzQyPgqh83JI4tIGvu1T8TtMJL8PuqORTHkpRjbpofpF8gUM13BjsIgETHuaZ4o
 a/CZGTM3YoEePP1lm+I5SyAMWN87woRxU9FtfKz63fx5583dEFScowiuEnZBLSrXLJML
 bsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815662; x=1773420462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
 b=Ww1qyIVlays3RNPjoMOZE5nsULhNTsQFp25lJW2ajTF6+AnnXdMdLlwLJ3fDfWBQ85
 kiVWpWT2C1PRQfeGpTgPDqiP/WUKXmE1sMhxsH7XmjCZB/Rhl3yUgxA2yPUWv4YLzdIP
 rQ3Eh+ZJ2at30gcv0zWkz5T6RqOtIityKq/Nv8mxNAZvwuRCobaW/fjspfMV/SuJwKuV
 o2QLUpLGYOK5kJdMuV7Gy5aVUFHQWeyPkHuWrsDDQFTyljse6C4tWPlIcG61uT2YfRcd
 5xVrUXBdPqNJjLxu1bvIS2Wa7MlCMVkb3jp0nmprnHcjDpJDh3+jyvrRB73+/aqRnAcp
 j3ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVboJSpR0tDHS/MR6yYObNECwD0MwlF4YPkAah3ygLE2dGdl7vH+GGvIFXXEGlhZQu/ojjmpYQYWuI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBdh1nVNhS5VconHlEgF45IEfEDXLX1Yh0cMHTLC4s+FjFg+5d
 E7gVawbolRVItvlKXmhuV0or15iWxnHjy7VG9kp+A0cqMuFH4+NdEgxuG5OEwnJIX3+hw39Eoai
 YCrb3Mez9dk4Y9PtS90LhHWt76sNCNzWr+qzjW0xcYXhb+saL0Wa4PbIBHnKXDpeGN3OUFkc=
X-Gm-Gg: ATEYQzynI6z4PrhApXspR19WkWcwpPZ7q/fOuBcPenDb1nGhtIZ4hx2cROUHHiyk1E2
 dIHoCuXrIyDeYOfBcmQuUlYhaJUTJI26C0hp0824qzHbN9DgtYkCgFq7TEHFqLtVn6dAakLNnMU
 LmpictbIpyMUh3NIjeG75CfG2XZ8gSxUNA9S25zDRjL9wVa0dM+BS53D6HjXREJL5e2/C7V2J8r
 IrUoJ/gKfaD6y88NhAxGa6bwq7PjaA7SCvImNmCe8KX7C/5X37wwaMjnufZonXoLTZdFOwy17w5
 6iWd2q5Kg2AoN8WxvAbbc28yQYSz8W8BzEekqmBNUo4BhaM5/RwApfdK/0stSdxb0/QgRrtDSpu
 XCtlIiLtv2qetlVuM4aQdflgSTuTq/eeHngQb8Sbu4zUUfbLYi1mQ9ZaEH0iBtl3PtMqsN40Xwn
 GgtSj96cv0XhwwNNpvTKTJx0jOHW76eVYXoUw=
X-Received: by 2002:a05:620a:372a:b0:8cb:68ed:cc26 with SMTP id
 af79cd13be357-8cd6d3fae29mr342146785a.6.1772815662162; 
 Fri, 06 Mar 2026 08:47:42 -0800 (PST)
X-Received: by 2002:a05:620a:372a:b0:8cb:68ed:cc26 with SMTP id
 af79cd13be357-8cd6d3fae29mr342142585a.6.1772815661569; 
 Fri, 06 Mar 2026 08:47:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:23 +0200
Subject: [PATCH 17/24] drm/msm/dpu: adapt for UBWC 3.1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-17-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4RQ2542mdKmT7Il7PrHpeGFC5QNfj01HavCYOFO0fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUP2sCuaPevdnSUx3Y/gS/IOR3Qx+EGuqMcK
 /UBoTsYZo6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1SxJB/9DDzGSeQowiab9wf8vtsjy56GXYpuY020hSbY5xU1mSPCrN5QAtzKAM1ASP6ipmyRuqLE
 GOoVO8WVjgVmmvbnQ8IrABipILsbJbpq+5WCF6NCZ6i1ebFjwh7jA04DI2diRfPsu7FI+gCjIuA
 1MQBIKyO/waj7TjzMedkFdKcVmyFjKZj23WzlTjjAnlhMFT8QFdU3N5gZ+t0UR6WKZNeilA7F1M
 ESjWNBB9A2mDKYVwmi8VNMtuO6H+10pDwEWJZcHV7PeWx9mzg/P2wjeBips9F8HWRBeSeE2KnNz
 VBgiirurU9xOJShJBphLiyxpL/XCXb3IgaGUEpQpv0bosMij
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: n1QOcqe7GvztW8trV-sbiEVTryfMhxbr
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69ab052f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2jSDvX-ur01rGIY0dUYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX1dsg9qdG7+L1
 7vMa65GIm5t1iGkW217tdc7Qq8gJ8LnlB9+44ZQ8fkWdH/glr/2hQhfEfm38pUmInhSm2tal9G+
 HHjd/wwFE6OruoBKOSVRDoJJ10yf78CGt/Hjm0xFLzcGI97uQ24Zy4ptrye3GTQ0/22qmh4NUJE
 MHN9GqOAYV+/6fKgQj//y1j/XBXwdPRmz7cvywGG5vtMyWhBpTbzxuZFPtW5oC6xBbYxDQHLOH3
 ty5P5ItlPhx3FBWj9CRjoo5XZibQO3svAoPpc/LQMG/7qLQNdpGoNlT9xe2tGO0emb1PnVivtmp
 Jc/BhqAsKum61W3ceS3PVRCN+0KUAXYxADHdFW3vqjIMn8hyUAxm+fslMxZS/ZAeqCZYRNCM9tH
 Qa0WHGWaaF1tG6xATi4AIMO/XzB4gKlNKHHrSkF1KGz2o/tExH50CvHsg12/RMNkLQy+tY3ma2L
 1vRPXdz74Lm+WUSLkpQ==
X-Proofpoint-GUID: n1QOcqe7GvztW8trV-sbiEVTryfMhxbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
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
X-Rspamd-Queue-Id: F066A225671
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..cb06db3cb367 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -324,7 +324,8 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0 ||
+			   ctx->ubwc->ubwc_enc_version == UBWC_3_1) {
 			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);

-- 
2.47.3

