Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C5D289F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A49610E7D1;
	Thu, 15 Jan 2026 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLCuYDU1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZa367l/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6C410E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FIwkbm2611902
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=; b=BLCuYDU1bCPJ8K1B
 SMjj3Q8YzHy2n4T46aLyeOFZfG0o8L9ZNWFcn+33LWmxfhFL+OhjP8Y8ZKVoVf0R
 RnLczsGC6QfOqIKrTFrAyt+qOss+7Z8W8efYArf8YnrZWFmFkTjdmEsCsEqRPaq+
 bmtyiVfGbX/1pBR6TGa+dpbMwqdqTIt+3MhGJYcctMvNMnSQ4P9ksIOGn6g/wT0A
 y/NB+ezVOAF6qZQ6rxZuDZi7apd9xUNYD87iYkBocGY0C0SqLOxmKt1YnqPax0Yt
 oUVIieiZGH4ycxnEc6uU7Dzo9FDbqiTvalWY8zytE4cjlDphn/JkkpAuDgzo2Mby
 2ELtEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97n2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a5bc8c43so131003385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511158; x=1769115958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
 b=NZa367l/uXDPLmRdmUzQtMcJy/75fF5svbhNcKAMeKpMGjnsjlgznBz6jQrlD8l+rW
 JPX+SLVhZRUXTDafcuuYmIcdMdR3L9vbaG8gR8Ck9ulF+eoLNYrvGtP/WuWSB/0ZNEMp
 WuZV66pDZRtw0C1+IY5EzZ3QvPM9ZBNb8qgay0rMxIh6EIS7yBBjIximkvsWFsBY5Wcs
 CYVAKPRMAKcOMdNv+Rr04Yh9oKCLe7qFcmsF8sfVuHr9tDy6Ad8X+wfiiulys51S1Tvd
 S2v9MEPhRMCRnEuy4AnzTpPWQPAf06GN05ti7v5MQp1y1i8R+jpzKmSoMhDEQhHTcrLw
 DLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511158; x=1769115958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
 b=QvpH9ajMg3ECkavRsL9Vtkf/6fvcPYeG/TN43Yewv3e1X838XBYSANxnyLVyhg6upZ
 nmazINkcB/iKWLIiy+yAR+e41+mLQfElUEYXys7vV/91CvTDfLzWwqhr7JY7PLt6CY79
 ASbvO43900CG3JX6HjBnR/wCVb8HC7HVHZDR1SJUg48LZsq/n6rUcv+hj40X6g7wcbTy
 dF3HZKWhF8b/4yKcVgNNbuIdkonSndSWwFIT5RVpr/ORIEXfpGTCsl23RmjtMdvzarlH
 iBlTDLHUAeIW1+FPpo0xT6erFejJtiYZYXpkXU9uj8WawRCisRNlsI1zkeEkivZPYZBw
 9bXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnIS2iimCiRIm3CwUDnqNUejnrxinXQC9yky2LSVTosIXE/2BrgIXG/hc6BKSNGHv0zblI+nCkJq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygVqEhtMrdH4kquTQN3QMGq2sBQ0p75qE2uubNWZZcotJwILMJ
 qQOLe3Xc3S+yKhjdflpBAdVwJR/J9ERwGpoJxtetn8UWQKlS5UeSsPSah8xEYBLzYnccHXAUIyM
 oJbKiWU2Gw3G/mUlwW2O1Ahe4p8FG783Lm4bTgzlHFM6M954KXZyNVNbHudQFei1/BP+4kZY=
X-Gm-Gg: AY/fxX6YB/CEcMHEqThT7Fh9gm26Fn9HHYxZvHNIdXxOoAuIA40tUmJ/JdMtGniNhlW
 4mPc2vgwJrnR+cXsAy6XJxQjAt5MMmfT0Ch+ugLaq2zUC677d0sj6/C02rTeLJg2DPkU8LhDzia
 9d+AZ4+YKq5xax4dlTQnBJaYFOofTFba034s2GDLr0b5VVulT9NwVO7MrihbRDtQrgGlGJdSHp4
 zlZoEyymbRmQdO3rkIux4aRgZpHtjuN4Oub+PsNo4LjprnuLcCukRvbFFAMWkDlVoo4uev+wrw5
 6rxpBUtOQorENoSfZi30NOvj29bUKgR6mJc7JiwdVKMYcj9TWdZInMSwSRfvefyImw73YiNSOhE
 EC3IBoNed/FCTgylHqPf3d0nexxUIBiRiKabPYTJtOfz7ByNxHGRf+XtMEsCRNU3vnpFTf89O4y
 n0sGastx8RkAhoNefC7tDDuOM=
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id
 af79cd13be357-8c6a66d6b9bmr126200185a.11.1768511158434; 
 Thu, 15 Jan 2026 13:05:58 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id
 af79cd13be357-8c6a66d6b9bmr126194285a.11.1768511157859; 
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Date: Thu, 15 Jan 2026 23:05:54 +0200
Message-ID: <176851111170.3933955.16914793365873145717.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vgVjp9kzaxxceuc5isM1rlIsDSLKsr0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+VkA/qHTPOI6
 m2rtyUp1nfbG4mKR0icnLzHMw1F2nFx5lddoWG5AAkyWmSEH1iLeW/3Myb5KTLSMvdQ/vE15Cxw
 KfRwi9IiAX0CCEeFDMxzCAbyp4D9h4oMWaluAVfa7fBEJ8sVPrl3gqgoUfynqxWZ+i2pwHdXERr
 hGnrNesQ/xV3/fZbcp0bq8yfqtfNF3eBQtHhPpNAJ+6X4F83Cjws+scMifnlg/b2EC0pbO5hko5
 xf9mhAgZ3hXDN3uQy3qVmNQXRfApcIv5S6282H5KfYasiCS6iCyWQVjfEaGUB1c+DjKr6yj+0x6
 Ze/Wbq/xRzBCXIgSLKWe/3K/PTp5zKSza+UvffZwfVM8qOVFQGXGIdNwx9zbdU8m2mSwFP2ruQW
 kkWNieRGmn2TrUVsDfTawsiF8K4GZ7Oh5rHAqm2NS4QjbO9j+Mkv3wD3J4zdKxotQHlgj+gEzCz
 wcKWdHhuVT/n8cNj7ww==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=KjdWIj8vZOb5hH74MMoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vgVjp9kzaxxceuc5isM1rlIsDSLKsr0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Thu, 01 Jan 2026 10:34:38 +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/disp/dpu: add merge3d support for sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2892de3f4f98

Best regards,
-- 
With best wishes
Dmitry


