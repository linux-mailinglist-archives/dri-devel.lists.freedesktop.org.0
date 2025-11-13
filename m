Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B3C59FE8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EE010E93B;
	Thu, 13 Nov 2025 20:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTHVYmX4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5aV5e60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440E910E20A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADGqV1D904943
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=un1sbvC4EIJ4U5h2uAEeAY
 8i8VLppsg5RBzR6nEWK7s=; b=lTHVYmX4MIZIUUx/+AS+ENIcMw86Zs4P1N8w19
 pJi/0I9ziwFEpEqoR4hBcdhL91/7ypQ7G9RORfSj8Z/pANHgY8zcCQaEkb5yNVOB
 k9qMXlMn0VuVSzxPy/UWABQsK+AbXZ7EPRaEOAtQdQglxN4iYZIBG4cnab4y3O4x
 couksKNHZSIMaejjcg4r3oRvC+a+oZ/WturNENb2SVvEy34npeXdypXpgeLHuzwE
 sUKB88PEnyAF6nHvdkmO/ViVMNyIKQkVArruoSgS7owsVBEZf+JQrD+sAIUShpSw
 8CK8az/kMVYQ3CmbXAqlF1ENcq5brr3/hSUfABysYCcGq+FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adk828p3u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b22c87f005so433686785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763066453; x=1763671253;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
 b=V5aV5e60YbHlHHaGtKGWn4tvzW9wyzsr6hIdGIlVGx1mcnerJsxJGkTjsZkvOpv0bn
 If+2lavK+/1tXHSCOw7A54uFHpZXsAZhkNoV/BkNic0W+C4pvJUkHt+fQiMLNOebpHrW
 qPHdCbDoS4Qhroud7A7n4LJFnKziSpajQgeIYlWmBUpHHNCcUpX5ryyL5LFzZKXFtgAV
 d6dLttGL16p/tAxLD2HRWqUrhGBsbx8fNNgGjnc0s+P2F1UjkbG71iS/peixG/aYsscH
 PmtO3XREq8ckQytEGy0VWyI8uIw0ARvlZGhBIfylFkYqgSytX8ePVPUpAYuVhk25rN5t
 ANGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763066453; x=1763671253;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
 b=rdKjuRRQqjF94wfXi7+WI848STzzZUZLb+XHRm8KGz/zE/+92uEJz2QMfsTA7n6gVC
 +uKmymPFdIw7WFVEaScoewxycFEStMLL0pHwMvh2suEcv+GeLZRWvyz9BDkrTZ70g7FX
 BoDjPBV9qVTxGujsyQjRHBUtJkK4WlTwEogovHYH2emiPwaDqXztsDnRHX8BD581Gk/0
 j8mogrsLaHJ7oqUOHVPGKO2ZM6PwFnNsoexXceBDGM5bvhCLScIdepkaqkyTfbtzGPvu
 v1Jm0vdGHz6v0XYEDdHvIDhEbRU09a/U0XHwTBe/ywieR7KgfdQLWlgIJSufwlVDc7JA
 WTVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk2/VL/mu08gCxkRDm/6xLnCc1kKIAGGgZ4vmguhKSx9DecMIy08kMe5BS8G6tL9TZZYPFue8YBes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyViuM2Nz/hNoOT5zNUwNUEv6ukv3j00Kn9mVm66+OTPO2c+X7
 ia1XAd+u1eyWKDiwYjuLFAO6AIJgvTaPBr5F/HzSFNOtL9M4yB/5fLSSG9tTmzLVf+lIj0tPtQx
 7BJ7qDPV3rUKwlPv6nqUk5pW/Fjk+B2uaxJtVpsU/gmgj8Q2pCPEq0AnpnRMzLaWXtdFnJLo=
X-Gm-Gg: ASbGncuCku6YQQQdbN2fi7VxlkJlKZHazEliLZYnUsNATvukhLdz4mRhK3e6ZYDNhXL
 m4SDglrTOuqXgzmQ9o6b6maLcqxFMGdIJa2REn1ytgaf6pkEKsfCifu1Wb5S2INV0r7LZpo1rUO
 r5WxS0nSo+nG82Zvct77u9QQS2MdXMNEPHpU/xeKe8eIx0QCdr4VuXvoDcOABfO8Qw+Icl3MZH/
 7ehlIF5wR9tGAHprXTKuFcvzSdbbygwM15C9LmHy3CHW73oi9myDX98+KtDBVAz28Idx7LG+myH
 e/nVQ/xKQfHpyJV+SoWj2uW+xbIiZ+rKchO46WG9APWiRNkC/d6wmtKT+t7ewoVWT79Mz+62Hmb
 y/kqxn+DSow1bUcZnvlRyjBoDMpmQd4Q9T8Oy2iaWLn0QunlSkNrQU4GBzcU72zmhI47t+e8BiV
 5f2YvXsY4735PB
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8b2c31c782bmr99106585a.74.1763066452607; 
 Thu, 13 Nov 2025 12:40:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJcep4EHFroUI4le9fG2p8XxLEpE63t3UsRzTaVzkNUFIpdtbATFPMKQRz+CrN9TDqDI3V8g==
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8b2c31c782bmr99103485a.74.1763066452109; 
 Thu, 13 Nov 2025 12:40:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040567dsm607217e87.86.2025.11.13.12.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 12:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 22:40:50 +0200
Subject: [PATCH] drm/msm/a2xx: stop over-complaining about the legacy firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-a200-warn-once-v1-1-c28bdc8e36e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFFCFmkC/x3MQQqAIBBA0avErBtwNCm6SrRQm2o2GgoVRHdPW
 r7F/w8UzsIFxuaBzKcUSbGC2gbC7uLGKEs1aKUtERl0Wim8XI6YYmC0du36QGYI3kONjsyr3P9
 wmt/3AxdqlE9gAAAA
X-Change-ID: 20251113-a200-warn-once-55f47c138cbb
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj7tl1xY75QhAePiZ/+a/AlI7VgVWoD4r4G5vQ12TvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFkJSdvuNwFeOIk5OMolNUdG/dAJrrYoH2YqeC
 q5pIr7R0weJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRZCUgAKCRCLPIo+Aiko
 1dcQB/9L+DF++n7lQF+HQ177fs6ET7FY2o9xrczoEC5Y8wtn8ZJaLVnxYRLzaSUkoJb/4pdkL10
 DZIdKuCGMiyCAlfAZYDhdeY+O0dh3J44hVCij4UliwOvFoO2ohxBqgG/CldOHC2RH4S6uspnXN/
 EK3/Jpqj++7yibambHKiBA2PsI8cOK0LMCmHvrRpeCKoJokXM0OiA4mk2TveKPxv/OfhJk9abA1
 TnXorBTXRQVDjtjjDyh2bIK6KYHOYNxCKln5Z/fIO6gSzs8WvWKAO74KWSpAI9tsOxbekdGGSjY
 u9YhibJjAHKiJRNfeUPIfeEABal9rqv4cx14z1Aml1CvsCpJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JyrIrJKTvSwLLbhnJ2IImXdRepJly-80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE2MSBTYWx0ZWRfX03Lwl189q6zF
 1fgO2/fRE8ClBh+azKVOR94EI/6UGuIjQ4sUvTHd/OSrdWrbXdhBiW1gqB+eQLq22CS0WjzaKuO
 VuVMEsZR7a9EvQAxkxxUT6FymbMoNYKzgB1VhM5a6FKZWkNge2eLAcgHfej1tH82OSw7CWdWb5i
 IRu0zoFiOWztlO4U5GmccltefF738z1bFe6OzV4Otag8yMSQxEdewOe1OGRDWKCA7GPK0kGTE/S
 TzQm1sVBhwjX8aP601fHhm+JtdCba8MhUYzyN/SDa8EloOk/Db98i03TahT+qkyY0TTnXr908ui
 CGbmIjgeN6LNq21LmyJEwjeHBX+GuXPnmruMWvsd4b2/Ki8pR4sswNMInwpw8U6jlBT2HVl92NB
 1u/5wmya8EaFTtP4DGIWcs+ElEGvOw==
X-Authority-Analysis: v=2.4 cv=Wa8BqkhX c=1 sm=1 tr=0 ts=69164255 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5wgBRnbEGa8ryjaxEzAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JyrIrJKTvSwLLbhnJ2IImXdRepJly-80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130161
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

If the rootfs have a legacy A200 firmware, currently the driver will
complain each time the hw is reinited (which can happen a lot). E.g.
with GL testsuite the hw is reinited after each test, spamming the
console.

Make sure that the message is printed only once: when we detect the
firmware that doesn't support protection.

Fixes: 302295070d3c ("drm/msm/a2xx: support loading legacy (iMX) firmware")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..963c0f669ee50d4568b521e2e8548e04d606d9ca 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -234,7 +234,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
 	 * Older firmware files, which lack protection support, have 0 instead.
 	 */
-	if (ptr[1] == 0) {
+	if (ptr[1] == 0 && !a2xx_gpu->protection_disabled) {
 		dev_warn(gpu->dev->dev,
 			 "Legacy firmware detected, disabling protection support\n");
 		a2xx_gpu->protection_disabled = true;

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251113-a200-warn-once-55f47c138cbb

Best regards,
-- 
With best wishes
Dmitry

