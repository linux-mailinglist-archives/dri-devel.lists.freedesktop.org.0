Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D2C6A1B6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3E410E4D8;
	Tue, 18 Nov 2025 14:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAJkACEg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMktCssr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD2F10E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIDvCrB623877
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rGGIgrmmsmbimgDt4vADL8
 x+TnC6/clX59aBfoICLGQ=; b=NAJkACEggwe5dI9XeAYm78ykugzPfdiFrBqtzH
 yg2dzRs73Z2SCZZc1h/e6Yyv5u8pSO31AQnVPqgovBWDmzjuc/K9F0s5hweoY1qz
 vq7dZHdoi+jFKOOuoTk2DBQzpijnI3UQy0BMYKZXrtgd27VxHl+c2Sft+drLywtr
 DknaF179k9AyEZNEa0RSrKbLh9JeVTyGAO42y4TsvhQ0wrOBmnxs6lLyZSB9NVN5
 t3aX9qPt/K+/AUqCmQNoAKsU35Frn1MDYwcECdP3YiBYJsbc6fh16/cpx/OU5CYF
 gPN6pokiLYx7GwLG4hBznX+ga5w/r16A83EOC83M7BtAIU1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfasrs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89eb8ee2a79so810496085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477504; x=1764082304;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
 b=eMktCssrN2/NtW/3MZgRhVUxkt4+D9Ht83urSZnTHKMbAZa5uzDcUUTCiEG15M4WhF
 BLt4cMZEFvimJcO5YAq+OYWnF24sgP6ZpVJnRD5TVnV4NGz5Q/XwXZEk8Pcs3KLQ/+8v
 hsj4nKcptg4cbEZqH0MomuGRIOYpiNddOfdnVlk/hdGrWALFSyIuoAUDrPuTyIh3o8PV
 Jgme2R2+F/YXC94g6/DPoab14IXoOecb9dVZS2z5CW/m35bpXJTEhNqZBwWWe0i4axMz
 HB6D+0aad2vdkz3I1sSAFHshVgcsQ81HZ/J27YCZay1WW8GTJCTq+i5FPBZiHIpTF1cC
 rGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477504; x=1764082304;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
 b=ajEPTAJ9Ud/2F1SUMvx/6kmmmaCVHDH/FKwCHb+pJ/XM00zMJS4E4w0Dlui0BWdgyN
 gv4ViRiigw5wNnc/bnDAEwzJ0xCIskql04I7zvdqk4gOhyJHFxIkk3xOWnMhc2ydtVAr
 KIZu8idDvQLBCfYKb9Sla90Qu0Gfpx2Th0e8f9w6wU/Ds/lAl/cKf53eLuXz/6TcFi4s
 Cb6EfBSNPfqe1ljxmF4spypmTWM8t4UM6DSoKJkhnsAApDMLnUbhLptUZSV+0biDbhAO
 hLqJg2AauI7nrH/L4pLUBkA9GIUUz08EYYiw2Bl7oLf40+wzI4v6TuFeOmsFoElgxyj/
 SlVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZSuntwQWeEfgVnUn6VMLxUAqGplOBBvCymaq0tYNiAV2l0rvMAWzoBYxnoTFtTxjx+ay/E/n8+Hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywtF6LgMJ2KS5bDqsCP9Ia0S4tYlI6an2rKGNOrGxk4a7MbvuP
 hBpWMz3Z0MmuyB2hV460/OmcHsmeg5WHKFJ0BqxCOXy3EG7XadpTghc22z42RU/Y8lxlEPdJ2pH
 8TXey0fgz44qBbTb7stqAkFNkwNs9LGX34DlHxFE+STZ63Rf/zGNl4eRUzhYDGqtPeEZF45UcmS
 mmD9M=
X-Gm-Gg: ASbGncvAq1U6+yOXMc9FlLDNWwWC9TDBAg/xdnEK1TY+UUzaN8Jy3Fyn+D+ML5oPjj3
 hHKnGMZWjjTPcyNeVbmzBNec0aBqPETNwmM9xL1FQnKR9qRgbtZ3turVj4Je+RpuQfGdOk0K2ff
 DQx+JvvZ5GtvNuOjqCRRADdCV8FieiBdI1WRovEJIiGmdf9KCs0gFl+JTLz27QkVuzSvbFlarXN
 xlswKRoa2hPoZ1DgXcSNe75XnnfDrcrbyA56DLhYJGodj6oageGxEKdGZBzf6rmb3WtEH3JuU98
 9kB9Tk6/fisWOw6P9zNU48HdXH9E/VsBjhBn7K+3xOQuV5HwjHfNS8Smv/9ZJTtDYyNr7Dvho4S
 yZqcJ83A6YVnlphd0+1d/fHoxfPghCOSFIFBBYin9VOtDZlM2gn/zx2Ga2NPVEFuvwpIyQyblQq
 a5nzZ9xRrXhAzE
X-Received: by 2002:a05:620a:1913:b0:8b2:7435:f5ef with SMTP id
 af79cd13be357-8b2c31af092mr1906433485a.41.1763477504098; 
 Tue, 18 Nov 2025 06:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOh89KGm2e3SAC+RYQcrRv9hFDfW7hchMk2teOMHv06MEbLSDUqdxcp8lWwug5l7F2CNaMoA==
X-Received: by 2002:a05:620a:1913:b0:8b2:7435:f5ef with SMTP id
 af79cd13be357-8b2c31af092mr1906430985a.41.1763477503650; 
 Tue, 18 Nov 2025 06:51:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:51:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Tue, 18 Nov 2025 16:51:39 +0200
Message-Id: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf8MKNxZ2ueS1HaSCLaQfJho9tD08SK2nuYM
 Op+LcCCuKGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1R4HB/9N7rlkCTDCnt3lIT7pFnquNU+9p5+FxOxvikp+OLT7qOm5e/EdfQesMJZZG+sViaWYf+c
 q+PkOarRQMH5txAJutQ5NYKYsOifKwbDEq8BooXb0QrFRyHB5u6RabCwfnOCaQ0Qy/DgyB2A05E
 MWF+ooaXZ6uqc+9v/Al2K+ecpxqagyuj7BvNchYe0OJRg+R7F34PhTeh08vwe0KXV3A/xHrnM8H
 UqtpieauuHQuAyEUAhiz51QT/y8WjoqctmOAvGKoDl6zpXtntz4CYjhXs5zL4zKYqAFGgWhvQn1
 u4C1lIyQSvfbSo3Zi/dnqhSd3SheWSM4u4mftMJhKlxPT7Az
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX2KZD5ppHu5gn
 DkdJsbki4hfHwhTahcFFBlFTQjud7/9Biu6fMkCOSWn7uG4vMMOTRtSW1FehyDCfFxxU2IQvRx7
 SwT7UtHcm54PaadEWTsuFBBLjXRnEWc1gLG8nTUP7mJMamq6IJWoWteiw6xCQya6LigcQMNVk/F
 LU3ZftoSDi8Nyh8V3738Oj7VY5mvEBNJ5Zjg9HKdnRoIR8fB6bginAAB/b22+m8OWLJ4WMqAUQ7
 PWw5b08pLVY22IMpWfd5KWk+NCDNWQ8dPBzPl+8B+4lxu6mKFCNUIwBLQ4P098blN/33Ftl83KF
 R+NODw7JyzIlCRK+TfvnJcbmMK7RXdamWaamOAd7u06jU8qI0ztFNSUNPDdDDtE1SlZsM1+pDN3
 U0s/tYYB+sK/55TtShg8DBfC3tSgWQ==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c8801 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XoDkaeHCiDYGaMSRgogA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XD4uQPV51LgJb5t4sSwb9RJF1KVwBOor
X-Proofpoint-GUID: XD4uQPV51LgJb5t4sSwb9RJF1KVwBOor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry

