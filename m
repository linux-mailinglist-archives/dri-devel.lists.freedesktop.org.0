Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3491D07DB7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E5D10E810;
	Fri,  9 Jan 2026 08:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTFN+ebc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvjQza99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FAB10E817
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:38:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608MpwAM3220708
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXR
 gMeIKMe8=; b=YTFN+ebchL/FAJkmfL6/p4an5Fruo9Nwi/vxyT5ow/TMJH3iObi
 GCzcEdl6xBfszxT5qN2kcEKiPseExgopt2EXU79jYz+fOZQhzsJuTL04gocqVRt3
 CjIl8PT5fqzntdLp1ojzxHnptjG78IgXElBZgDD120pz0vnwHGAGdwL7YmidcerF
 xxZNm9o15HNaVHtkg5QCEdS/MP4NWSfSB4yuV2mOeY89VEvdMLqecAS45n4mexjt
 Eo2LapRC77qOC+RurgQtXZYGX0ulqO/k2iMoD/qhBnIZVPxMaDRvKhJIGTb/qeBw
 NABziYK/KMse6ty1lGSmZErUwFiaOT21+2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0ht7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e41884a0so625035485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 00:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767947911; x=1768552711;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
 b=gvjQza99X+yEh2mXiIJSO04fdsEahX8K0LxGdYaRKppqpuGVnqeNc+0unB0b0lOMQk
 riAINt/Ekskb6zQPZlueRZHaMTWUSylTWif0c3ZUqXEwNGEeh6+UD0MjxMj6panxDAaB
 okyeO8YHoDaYHjwwJI9FM+rhM9vHbpATFYZWhmZI4VMXQ4RUA18axLncznGGB0I92jdS
 RdL0ZO3prwzoCOqpto5oFzmVHGwN08F7s9j/6sBFZNpx4q8PrzXaqOpD/994Y+X4cbNs
 nXegm/5y4qgcDo/ibyfSgE0n0qsYXipeZ3z2GDfNAFth+7rLOWcQxSWLh829Obpz/129
 XOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947911; x=1768552711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
 b=mWKAowbwHy4mNLGWg1KfGCjyQObAe8oCHSeDGRfi6q/dL9hzOOsHyZBFWlYRxGtBa2
 LFCkV08p4vM/VQBXdUGw7lC2IF7CtwUVuQ8MkfyqXPwoRrScmzf586PMUmkitzyNP2uU
 WRl7pLNJErpN4lyc2a/7J/r2WcDlxwvrRsS5bBU5ZZFhu4WCSydr1hL5OUaC4u2+lrlH
 zkxwMQx/OuHwqbiWGu6RUkskeoDoFosnb8hPfklk27zcX9SYkf0NZ9go/dTtyVGlNuW7
 mTuQoZMO2rsplimhpFk+Ab2k/i+PrBt3wuj7S74oc1i/uU2seYA/tyxSYo1kssU4BhfJ
 bZMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOWxhWX/qj0wPBlKVVzeU5ogbwIyWp9+3+FtfsBqN9PPwnc+oXGfD7Ett3Lkv6DDZYnBMou6oVbKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzGkTy7aOJofIBlLGTqrm/z/VjLInOZfiQoSoXz8R4feLNf+cI
 /e229JKtwFON3uieLQxrjIEefx05m73AyHKlf+68vHST/Z3MDPEJJNk8fTr7jjEw9QtZ5r6dp7u
 Vh01HYu29QJnhhXrVaC4sT89rvb4ybDAyl0KdwjmWo763L0uMRsajQLOWgDD+kFg/u8e7jJ4=
X-Gm-Gg: AY/fxX7MIiPICK2WQzL5wNIiyUHJ+seIVa5+8sflCBZFeNLeevhPygybulCt93T7YOi
 N5nJ/bnxNVC0QiYaRbGwKLDFJ5+iVtZGGGr6rbREPxlirbPPVJrnuh9pDd1DdOoNbAyEZ9snWW5
 nkWuigJKq1UJ0avN2J1ISThfGNNR9rP109yqeuHpWfwuaKgXu6msHyjozc1Cm96i/oi+MVf9OSe
 iChSFLRoCQvNenwM2FLmPdIpy8kF+aLdj/CGLpLbqNlB3r2vPmM1TYRlbKGcvINIjMHlOMylQbF
 H/L8Z34wf7dv0sE6RXO8SZmKhO1GWUsBHzijBCkX1UtMFmVDCt7grX9HkokCzQjwnc0ZkRg+cHK
 g5vYNGuu9pApu8T5cFmJ/sDOQWSWDdftRLIScS9sYTxnNmT/kGj9XAsf6G4FlH1oZfOs=
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c3893f25c2mr1163409485a.44.1767947911481; 
 Fri, 09 Jan 2026 00:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmvZp6qYc6nvl7QjoP23G7Tn8tnuiGzqnKjzAsBMKfKV8jYCRV9KKhnZzaf4a45tyoLt4qww==
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c3893f25c2mr1163407685a.44.1767947911053; 
 Fri, 09 Jan 2026 00:38:31 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:38:30 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: [PATCH 0/2] drm/msm: fix mismatch between power and frequency
Date: Fri,  9 Jan 2026 16:38:06 +0800
Message-Id: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KKVL5CBr9tykw1VzqFHsEdBm_0kQ8t2Y
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960be88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dKC2B17Pv8Kfw1TXKb0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KKVL5CBr9tykw1VzqFHsEdBm_0kQ8t2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfXwPo6uVILF1MK
 CVQssjMDui6kHZ2wZu6QiCFFPmqacHO3Zabraarm9BspEkRWdgZBSmW3HFFbI5iK3zICq/l9l4o
 zN9qQQ46bhvtxpuewt7+Bbm1fZZuzdD0SeIhXf7a5HgPKsXwtDhljlWM4LJTOvA/t+ZHASUEyfD
 kgnlHZPJhqa+m9vE4I3QskoHYK4WaPDEMeu8c1Br/5MlUaUnSmXfbNancNP0DCFZVtPt1njkmWi
 TywLDGJAyjO5ZdKo2kiGsMve3poSHyCe9mfCZcMmVDc6yTZi630aQGL1ibAYSp3at2tYfr0GhjJ
 EtDrZtrT6VFyRwT0w9lY6OYMP6/acP4oxhV8kbGPMP1nnVI1fZ/XVhW4Q7CWsstWdXT7W3Mpe63
 PvK6k8kLyW+bYz8Lmv3tEhNyUNwXUi2AUKVHpWclwwlvArBREOWtExUo2sqrQrbE2n7c9TJMjxR
 lKkK+CwR0uL0QcPkXkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090060
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Yuanjie Yang (2):
  drm/msm/dpu: fix mismatch between power and frequency
  drm/msm/dpu: use max_freq replace max_core_clk_rate

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.34.1

