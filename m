Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCCC55FA9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5125710E301;
	Thu, 13 Nov 2025 06:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="puyJj8V3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PreMQ+6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBDF10E301
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:51:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD11Hu63113405
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki
 +lNsih68=; b=puyJj8V3t64zL2rMenQUWUyTass2Wo0MxT+c3GlImgMb7zTrHWr
 1kzenpBC7nxzDRAadM0OziYwLhbyVIRjZlq/F/DF1953RABLJRN0Y5TZqHkKw/fZ
 sXm3Q37U9KHUwzZM86C894w10pv+xMJuVZ5vWYJDnL3h5hPMM8tOCFru6t+1T2RX
 38kyHunV8vrHEDKp0MwbTMt3nD/+s7NLc3N5vqyXI8uxddrhc7A0tCO4MxYJ84Z4
 neDoOhCZPEgcQWdp4JswHGo+ZzXegF9lPq7grDAhXHksL+yYnr7wO4vk1IXmajBa
 mo2u7iZqineMSn/SdiBbk/ygLbxj9KItJyg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4at0x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:51:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88237204cc8so2250726d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763016682; x=1763621482;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki+lNsih68=;
 b=PreMQ+6T0bCgps4WyCEMm1rIGdrWIF63q9LABOf2dhkgED6gyxKoArhpgrqURUinL2
 de0C52FxvfLGajrA2LnjJyMxYzzA7jO0FzbzgDXiSupc4xAi3rsWxuVr7oZS/LRFMNTU
 e5pnXMxmfGjlIowfn+lv11w50L3vpm6DtmEYCyUwWKt75byrjvkqC+m0dOPUe6UutHjh
 TCNOktC6UGAfMrZz5fXBn1ZSD2rMVK1l0FWl/chylRThbndd6V3xeOqrn2JeQAVgT7U4
 RpeLtSx6K1aPKOJh90j273tlHGGITK8KXvGquGX2HOPs172TdgaE942WSTHk6/Jgcy7j
 PxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763016682; x=1763621482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki+lNsih68=;
 b=ZReWPChBvkMgHxow5iWyNXjecU0e57TLFJA1zZsAdlJE0BmTJSqsblMRJK8somnkVm
 6AYJoLoOChhqdxqaFy1Q17xqDoxePTLf1JtfnIP+MrRIGMutChypvwY1maqYqwyOrxWf
 XBuXkwK6Ryr+t6b1Vn0iWTsjO4zGmTYhQ5DmkMBWikblcqXYwk+mTw+qMpvCYRfHL5Xz
 FksGVS9nDq2M1kMPbhICVj1LE3NdNmJpWvog5lwyyMDWebyJN/kgZNXOsi1D9Kk7xZXa
 EkV6UZJP/g+2gysK8cBiSIuaDFsGf5si0Cijg9+ZBwaGcZF1jRkNf45s380uHnkhtVQ5
 +Mpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0HGvmLb8bsM2AiPQc+HsSG90OjXzRgpIn0670zt1E9BpZBIXbK6uF/nxMrxLfdfcfwVc5pJP4a5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysAOEdvA45YRqnHp27dKOwfedM1RAUG90hZYLFbGezv0QJD8Tn
 JRrojHJmYa423Ut6Cx/thGOQdzA2aj4OpW1PgAmADoMAHsZVmizKRNSTzvNd/BQ+DPhhgHLetWx
 Wd7zRVnBk+UGe9taQGp4xCgoCWTSSUiQjN0XZDuygx/6/Danp2PX3Aaiw1J3IV8LgTV5cNUA=
X-Gm-Gg: ASbGncuWLjV3SzYTa4LoTpkXf4WxUtDXyo/guQO/lHp36FZ07hTWVnUPHDjBmNIODpV
 Lm60+OE87xPIen9yOtDkyZyY7VKjuy5j6XVo7NuswJpPYxKEOU1ogMKtyzxdDmGHo7UYsoH8ueh
 HY8JQCq1kXjxFtp1KZGMJqo4SjIzHEZrLAqZLBUt/J7ZSxa44FeeJvLY6rXmCfs8TUNuCJfceLa
 aLEDJXapoy6fKb4RBzOlMiCa9vqhalocNXUATP87XjVSQjqpM5UIWXXjVtNg0cV4sNj20HSRoCn
 TrxpX61RwQyLikWSd2NVxOqBz53pUK7HiNN0HtRBHy25tDCUOexoucooOaaXtUtHV0rwhx28U4b
 MUfyWvWAs2EUz/zUJkGfDQA7LvM5JZGg=
X-Received: by 2002:a05:6a21:6da6:b0:33e:84f7:94ef with SMTP id
 adf61e73a8af0-35908c8a6ffmr8002118637.11.1763016076565; 
 Wed, 12 Nov 2025 22:41:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtYraI0TKB7wHfSTVlzFGmjGWRnrZ7crCPf2287nYk+GoGEXlI8vnXbcHt76kEGplJFqjP/A==
X-Received: by 2002:a05:6a21:6da6:b0:33e:84f7:94ef with SMTP id
 adf61e73a8af0-35908c8a6ffmr8002087637.11.1763016076030; 
 Wed, 12 Nov 2025 22:41:16 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 22:41:15 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 0/3] misc: fastrpc: Add polling mode support
Date: Thu, 13 Nov 2025 12:11:08 +0530
Message-Id: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: khLQzak3sK1YITKOYhslxGJ3XBUW2vwP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NyBTYWx0ZWRfX/LqkRjyB+LUe
 c763rP0p974WbGtiy11PBD3kb3icTiti6p+bqCm/oej1cytL20pNbYvz0VEV0A9z9aNe4dM7NyE
 tMfOyZK0SLufyqbN0D3Po6NPA9sgKNRaguyu6NSB+JY28eP/gKOrM2JFxXzRZAJ5iLDMFcbODn3
 w6v7QKAdqH/TiVyBcdHHhC0YgjYDK+24d2DwuD0jyxsFcamUi6e1c/rMLd2UfugKfBmUAMHlDqi
 PQ+/nO8RCNHJKlZknQfWTr/pDf+G4aFynaJNubjojQFmDhms0F0XqA/I64xpI/V9Gbm9gVvfi3P
 SORQeI2U4gRewPQMW+Xpm2eW9GdBi5lAOQTvOpNF7A7J8JqYnYiZqGYDkCpe3+gV5xbgS6gVOxZ
 SL8yrz35KetdQlSCJT8lNw0bR3bLOw==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=69157feb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dFrkBzGdCdqBpI6tlPwA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: khLQzak3sK1YITKOYhslxGJ3XBUW2vwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130047
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

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v2]: https://lore.kernel.org/all/20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com/

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (3):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Update context ID mask for polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 163 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 150 insertions(+), 22 deletions(-)

-- 
2.34.1

