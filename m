Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCT/MzUFq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CDF225652
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C9010EDF7;
	Fri,  6 Mar 2026 16:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlT+Jjb9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1kYwY+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA4810EDFA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrGnX080201
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=; b=HlT+Jjb9QWfBBkkR
 VaO3WTUceFibqyHYE2cGZx6cyhAVHlg0vCoorfDSiZsWmF76dvLI0TX3OUJOURR/
 5trz2GS8Ax01CXT81e+oMxTiUqx1TaUNDYqyMH4rOKgnFnNVad+ws3YEhFYqENYQ
 e8KBfYsTMhS4XucWSUDZ8C9zU3vAn2xXgPxywFZ2Fa9gw+d+RhXKqtZo0c4Qgj+r
 WMJbHe4fV2xilyoXbfp7xJtPS48mFOgzBVw2U27bKN47ec94tHPm7EupV3/8TEEp
 aRPEkzj8yyms8bdIP33qBrGVdFUasUR5tHEAsRc3Vd54CnxzrZRMKAdU4XzfpvuI
 C+9OzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71655aa11so7477877585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815664; x=1773420464;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
 b=F1kYwY+2s9BV/HYQqvbnnwIU6WdIZuU0HVkJh4F5WUiV+N6PkguoOWVIhXa09JN6Ak
 MeYduUL5NQrs6xzPbUUEeXLAaF220tqvYMbH/D7LDP9ZNOFsfoDagZTSV1IWRs/sSlBO
 R+kcTLU4V0w8tJX7+COWdiT3UZAAcbRU7CmxeMra72UhRMiWPEVsP3QUOD/6EdRkbzE4
 iJnBEEPiGtaKC4QlgQfGSqJl2BJ663AG+QeGAUBMhXWZIcClK0sMteSVfaJhSSjT+9MG
 RklN17X7Bc10F4yZF+gW/zO6Jzj4uTS8CRkuBQuEOXI0nE5b9IVhfQhwzqRe0vi9glmc
 XcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815664; x=1773420464;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
 b=Sp9Mb2jfYlRZV33UNSpWPLQvSxkUJIioPiFXsxCXOCxaVnSqzhnpySo+74Hx6o551k
 9hTRHq1AzC6obbtkaIBrricfba2cW4D/bdbrn61HNHu7W72AAI/Old3uFGJ1ni3jwtu8
 ucc9rgoHuem5k3fm1L44g50JPw6Ib/PLgLTwZUgulcoleK2UzL2LlbTJWblmo0IB0pTO
 gX/nHX/qef1vgjLBHl7m9gOhob0SnKMw8FWfJczszm2VccHFr56HizT3DyME1e31U+Kg
 HrjrkZ36f00SZyxFk9g5N3XcIX8XKIsgq792gcDw5P1Q+nkIFPSusQFw4Dw9ll3viSba
 2LSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGkZdyOmO62mv5Jqg4MxqD/9XyFwY8Jv8hd3kCbwStMo+1Y3PfbS3wlybmlOTedxWPUoI2ikNz9NQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ/YduIlLxytga5giA5YhQX7ypLWw/9wgm5QvQR9gr+Bsg7iBp
 EoBBIRtMXvno/Fkye/PupS0A8Zb5zPO/CWX3uNSZcP8eXeKxoXavJP4cJ7s5dGcUbXaW9zY7TCA
 iTiW7Ny7ABeTa0LZ6BjE8v1ypkT9LaxujOSdFemJyoCqQZqUP1IagW4SA/koDQmxdTdlz4zk=
X-Gm-Gg: ATEYQzyh6YVmBLplFDUWcT+UWhC18S8IBYCwZHnjdSwkHRbC97bN4mRjfVBLfHGE+tu
 o/rbOd9N94XwSwJUtsHsNdIoQedkmIXP8tNcIdrfo0uwj5FLT2cVoEVjOXpfP0G2/NMDYR0GTTb
 GKKxeMUqTReBKk7EhVDB6o6ZytfgGywmBTwxGuUZ7KtILRRy3+doGzZ4Vb+Bk+nYkrUQF2s18+B
 qwnh5otEtGytM+hB6d8a/meT0fFIacmU+M2PFOlM4YRd7W1b+aFFEpZBIGsB8fJw4keuqPcv983
 XmY/POuEz7izcGuKEPO+wyxEMbet4k8UJ0MGeeIIRWad9gNp9FjLkO7Kpqy/Aqf6GmgyCGaS8tp
 43iYn+cVpSULRMGcw0GCMN1WdywMDtdwikgJPl5qsoOdGSjvhR1VTrQVZ2DDfyEb7dxsU072oOZ
 OrbstaSQn52upr0s3jkAdaO03jw1E82E/U5yo=
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id
 af79cd13be357-8cd6d33640cmr332128985a.5.1772815663682; 
 Fri, 06 Mar 2026 08:47:43 -0800 (PST)
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id
 af79cd13be357-8cd6d33640cmr332125485a.5.1772815663109; 
 Fri, 06 Mar 2026 08:47:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:24 +0200
Subject: [PATCH 18/24] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-18-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2LnoPNi3lG29ZP56cipc86DccHTmRuMtPFNBgsiCAGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUP7fAZuZ7ND3U+/FN5XiQXOIgBgLaDwD1uB
 +sv993BXuyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1dP5B/48lH/bJArDUccceJfeYEiOGLwGTQVVIQOUfakt3ewOl771WXgXe8a8uKwujZhZ8kDQ93k
 FW83HP4T++VRJXLt3PkHjI5ZN09Libr64T0xwVWix6PxGrmpnFY1VJ3NrfCavuHs30Qmf09OmCC
 cmYirAMMIwZqdiymhHNHSd2yEYMhZtM2fgzGBkXe8IouLErStgIfJ6DRkx464ianFIAw+GzOOrz
 xdaQ8Wfth34N9BkIGwFCl/cOJ16INL/3KZ/lKvoyfB7AOsKRnBoe9ImOGg8duam7OhRZn3eYcSo
 fBGpn8uiCW7nQQ1yxruRWcD5L3AAr/MBoRIvJmbi1XFGYX7p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qqe9UQALbXD6-PS5fjW2PHtKwpiw2lhX
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab0530 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXwSFdPFm+gDfr
 HqBwFkMPoIfKVyHRwCi+igvRLC+BHW5e5vwt1/BCt7kvaPzt8d+zJMjvbQeB39MKnJRXBDJ8Q/S
 8tv/C6hUTjdBizGREkn77zzvpggXF3+Auv1Ese3teBLs9zVqEGazwz70POA7MsJNL2q12QX7jlA
 SyE9q1SjqTcXVQUluyDqRTTvRqBBcGboeumvqnXRfeG65VaEDfjRtYt6mkr48A0gEoRYssiTeyM
 9uJEpebN+w/UveD6nCO/CCTRGUONg5EtCdeTmMMpqLPEE7O56cuk2xu3pXEyIGkA0w1X97jFWnf
 V/3MDgHRp3J2xdwuNHCF5uVq55NAP8TtyTd2vZyybP9AWBNAwKS3tnlaEJ+1WzZqYIFHAhaQ5Ce
 kIguBsbTNswdphIjCSC9ywcGO2IhlJpM8VLZirkkSfApbOz390HQbi99+385gORcLmrqHlKahXZ
 AfEsBOej8h+c8kc/J7g==
X-Proofpoint-GUID: qqe9UQALbXD6-PS5fjW2PHtKwpiw2lhX
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
X-Rspamd-Queue-Id: 84CDF225652
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 8355ffe40f88..ddd7b15d9ff1 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -80,9 +80,7 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
  */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3

