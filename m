Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A2B0DBE4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7FF10E6A5;
	Tue, 22 Jul 2025 13:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuBseHBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6837910E699
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7HhrI015402
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8FxxfuLmav3rtJMFdmgEGtcB
 RN24c33Z4J181Ntj5cw=; b=OuBseHBsJciLM9V9eyKUMsshokS4fXHHtBYtObDQ
 1NdSZffq9+hHUkMoF9P/gVIzXe6oS3TMwvf0kGptLxR0m0xY6UdjXJ5+wnQfRvnd
 kwlUputlxh/BL4WFsnFcBQdD9wV+soilJFXZWTTfucdvl7J3Z/5Lh5XE3C6T/ir6
 UeuIhDVoLfHUnif9UfbNQlnOLpQuoeyZHk2CSjr7ajPFblgK3/XVybnKWGzMeZUF
 N5Xb871llrP6vGQb1l3/q68sDjsDjQKV6gKqyRHomf8IDLkqk2QYkWwkmgwe/y+B
 x4Dz4EhTl6icbUxvwiODIWTZ2KA3AvXy6u13LgoRJaVTAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2s6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:55:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7da0850c9e5so830310585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192523; x=1753797323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FxxfuLmav3rtJMFdmgEGtcBRN24c33Z4J181Ntj5cw=;
 b=xF/BWnnxruLe71MKnuO/OrSz6Ad94Z1SL8S5JXOqdSw+5eZh3TGFiY41IJ0RGn+J5G
 rFZKwxL4d0kNh/Ha2G2Gz35qxzYPmrdcI/RjusKXlv10nZ+ti0ZXTUN91KJy/Iopk2Ud
 8qRw83NCGtYgcWa2NiiH5Vh1B/6nJYUYiqvIwTW9EKUmHud5ODWbp7NOzdYnLK4PLQOu
 jolwa5RNZqsaS+CN8wZDUs2c4IfCAvY/cnc8ejnRH2DB7CTgXGy6GgsxESb85yfuT1QW
 pdE9N703kE6iNd/8rs1d6CKQudU/LM6zGpPe7EUOtMKn+R9eRw4mhhhuLICLme4aRcKf
 8uBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJTecWyFPJdNDSMRFVf6o39myoguHTFWE4ialeWk09ETxfVMxebbW9gHcJ2QsGJOMylRHthzw6aQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN7dTxdDVoUbevLJoeAV0Qa7Hqmn1qAVtp2ZAEBhKJwxCK1wyu
 ooreFvq7d6b5KHsOVtbY4eROHhAbY8w4peYAJdK5DmklbBMbBp4asRd4DvA2RzUWr8st8cV8eig
 PJnwnJMlAWtGRIQcg0QPDbUOe2Xmat8zEIhbg3JsrzxXwpNqtmNcbIOY2CbYZeU916bUenTk=
X-Gm-Gg: ASbGncsbyZunhob/POVR54L7YdzaWzQF/v4G6fl1PV4NXWgc0dsYYcL8C6vjOx7QZx2
 HTIfzQjIh6dJhlxIT2/m0M9JQyRKKP5steHdhZKu28af2qKtzJDYaWtY4eX9ruUd7TFQN5SLvjh
 HaNG75n0hr29Ud/pxUsJt/Vka1lCIz2KxqR0qtA78pSg+iGmuMmzmVVCae+HMvKgW6S46byf5Pm
 +SRWRth2vfcK2JBW//trYFOQWxVCh12r2/kTPbPRBC0mxrAdEXJOdKcXiqC1E/23tPMSy3ZR6oM
 GyZ3PSqY4oWwjcCd/uIdXhyKPOxHnsKFL9AL6UiE7cEarMZehCi3NK/dPxNsrt3AD3IHdKKcFel
 pEfDH44IaGGtx5VuTmyyAMIy0LDn0DOl5v4GUAtZjjITHnEvhMbXU
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr3564066985a.14.1753192523356; 
 Tue, 22 Jul 2025 06:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSTMlUUIcQ5GQ34bJaL5Zr/uF8zkXIHPl/bxOYdlNcBILtA/tK5Op9PqoPa06PAlpWzt9uJQ==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr3564062785a.14.1753192522837; 
 Tue, 22 Jul 2025 06:55:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31dadfbdsm1951812e87.216.2025.07.22.06.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:55:21 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:55:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
Message-ID: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f984c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dsTHFzNMvnhyJiqkEZwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNCBTYWx0ZWRfX1rQepZzeCJap
 hv38G8CaJ6Ipl1cNeAIHyedND+F97sOsN6I5Uxa+gdiDaI7awhLbtg0NIneoBPCi2FwXRfnKoZT
 lahpSOQSon+tq3Q/4oy2X6XDvx65Xs98etRzFFFT3o6muhFeUlXRtOuMN2Zux7Hk1aE5FKmQmbh
 TQrykhmTzGk2aeiQYA0RKhc0YmuYidaBzbEdOIGMqpuGIyAlhPhWvsQTnQVjLeKIwnH5IQGYPeR
 O85WvCSWhcKMMtz+00rbZjyVe7SXzds6KXgeaKRd59cRCajXn2zbG2ni8C8MBAItNsnCe3fKJmU
 ZcqCkKUC/1Zk2B0HzVLG+Nv2jbZWaRNBtGafuXLzq/Yige0hxoChtCBvujDNBhCZSJhyXk5vFm+
 M2047bm9veshXhRoN/xBpPsII8mD+HqHFfNI2bTopunidOtHAZjehfSlWKRtuanh0e7ieWTy
X-Proofpoint-ORIG-GUID: kICbdU7JiF-ofnw9J8NmjiTKdn4_Ewhl
X-Proofpoint-GUID: kICbdU7JiF-ofnw9J8NmjiTKdn4_Ewhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=687 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220114
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

On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.

Nit: GPU

I can't stop but notice that KGSL enables IFPC for a bigger set of
SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
supported on those platforms?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
