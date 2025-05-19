Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147DABBBA9
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224B10E3CE;
	Mon, 19 May 2025 10:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAbFS1rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582A10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9XoxE023467
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=BAbFS1rhNBHKavJV
 qSL8Xi0XQedgmHLHnjQrAA2mpxyN+8g7vZjXqbAyTUQVko1fCGAwMRQUMGT2x5zE
 h3QJhpKHYYVE505gslaJSZ75Yrm+Rr4o260q/lhhut4d7tjdX9K+J7SyAZc3tz+R
 9D5ludfSKKSxvQ3fOT9tNFAVJYvh4cLu+ElW95pVo5WAZtBuzWjSVFbL5g+IyvXi
 IEYaBr6jkSYf/aWoKx79L0tJjpJ4YINTa0xxqrqilhYmdBksto4j7a/Qi2xHuSiF
 SeiMFoCkzONe6ic+gM0S1MJwNQ6DIUBm2lSZc65ynOUYQlPFQdzuBA+YxNU828Xd
 QUiUXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c2yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so29248846d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652338; x=1748257138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
 b=wwIFud0g+5S3AYy+R2UYcAqs+QzEhYI0CUxIJrjCRJY9Ib9ao2z0uW5imy6mTwWNPd
 wQNnYl+6GCmpuEgWiw4LeJIZwdlodcZo5wd19gWOXaAL0RAQjT0oaA92t1Np4m16AYO/
 imcGjDJq3dPASC35LbImFnJupF8S2EvROwBakZ8TRbUcurl/xHf5Pb2llJcatV4AZEhw
 bf5Owsyn5tO9iTeIsK2CqdeBZkeSBBukoeDjjI9/VrK9LEWXwlKdrTZXg+vRYsQXj7yV
 WdLPnKteMavA4iz0sAzc6ptiFo5b64UDTBPNBEeqMzitTHszNdhWsGw/3CpJzbXU7eF7
 DIgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VNt5oTacg2aYJnRFDyCSsd5wvRTzuk1jkFjhTTyPqqxObz9OJCPFTJ3E1Oec55kfU1766iMziyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFgLzLJpP6ZqeNc9iIHpMx2ql6A0hzC3zFgLpKRLXOXkW9U3Y5
 3jvQVz7kVY7Rvp6DyTzvuMf5EMGrT9DVTqXNgEJf2RmtrlFVhuparITVbUx0JuH4s6rLFcDZvUp
 A/wISLYEpRCL30kduFx9UQb1pLaKFp2dew2X042zjMKaheaheGQvK0CCUtRH/HEjzGnflVMQ=
X-Gm-Gg: ASbGncuejpFpQNZefdDwijvAlx8U2eSa9T8DLH+jYYyJWwAMg3bYQu19nULYfc2eibZ
 4u2THtROtb0Xg17l9SRX1inUfBnzOkZt/l4aWXAmbEoCSQ9d2eOUUQfPDU4KVZ8MqNwlIB98GYr
 hq5KERk8kx6QGx64nCCMVDvZjJQiUn541zQxl/ijVLlN8pJWVQuKfV7asq7SKOUena/hXVn0C6D
 x+lJT1+XOJHqaR+rO0zMdo4nYMomx5kVwzO3ZNGxw6JCiVFJMeqF5iVoygDgJLVck/Ckam7nwOr
 hSdnP2Sw0EqqXiiRGQPV4cI005orRLPzcCI9Wyb1z5JHZju0sZp6Zdafdl86o+rgRSw6wi6OF4A
 M1A//oMHGzR1ZArIxwGiwZ6S8
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id
 6a1803df08f44-6f8b08c007amr242240466d6.25.1747652337405; 
 Mon, 19 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5bupC0i5Ur09/y0jWLEVLMby3ucut88EMhL3xZ/vKxRnjyojUQBjAnzwYO5Ao3ovyMv0MKQ==
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id
 6a1803df08f44-6f8b08c007amr242240186d6.25.1747652336691; 
 Mon, 19 May 2025 03:58:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Mon, 19 May 2025 13:58:39 +0300
Message-Id: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0ef2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: lnfx0yUBeIY5nUdiPaA8ee6Hr6Tiwznr
X-Proofpoint-GUID: lnfx0yUBeIY5nUdiPaA8ee6Hr6Tiwznr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX5KaT1yvNFIWh
 8yPhTndkmlnhLIOQhtuH+QStp4a9gWoW3IjRYpf62/KOow1N5CumAbIWEsF5821ZHCr2Hebh4uj
 gA3cH54Z9dI1CkFaExw12JRBHgQkIKx502nSMtpUkU6zOj1Deg4D/OrtwaZ1DER0KBSZKx79QcS
 /p+V10MJX9OkgqWTwbzecsrdaepo6OXzQuqOVwi1chqVaR1TKn8tTiwrGjLCd+r+amboHQnHnBW
 W0SJlt/6XDk+QKrNjOX3UkiaY5VUYDl5ny0qXNVU48mWrWpzRgt3gnKcq3LN4KfhYQP6+HAd+DY
 mUHCsvlbTDwITZGWekmnlkmMCMdmRKBoqtDewKegt/CvI0FS0ERtKrDCp8Dd3RwiX1cqpsMNXuX
 ScaQyQSXtFMkTzmhzw5+DuUYyu3hz/L4tvd6Uect3yoC11X6Gep53Bddmwf36fvFR0AUjTQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=861 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Fri, 07 Mar 2025 08:24:48 +0200, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ef595c04e843
[2/8] drm/msm/dpu: program master INTF value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a013b60cf44
[3/8] drm/msm/dpu: pass master interface to CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/696707d3d22c
[4/8] drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df99bdfcb2d5
[5/8] drm/msm/dpu: don't select single flush for active CTL blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e93eee524bb7
[6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c1824a7992da
[7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2649952f66e
[8/8] drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fb28a8a984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
