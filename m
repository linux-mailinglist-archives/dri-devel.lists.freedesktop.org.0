Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB403AA87C3
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFE510E2D9;
	Sun,  4 May 2025 16:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmONVYak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C1C10E2DB
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AQuZc000379
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=LmONVYakU5On4YwI
 K/8SSCmnVuzn/lniEHJYfUvHN9yi7Hv/m5ZrRAWFUvuTzsOu4t1tAMHV3FFr6S1e
 eHWiRmzvejKhLSbegOD44sOeuYQzobaJxlzvogIsc7CDV06demUwO+vAYM0QX/xQ
 J9pynUphAJHcMgpFLqTRAbB7YiyftEV9/z1nUGmx2zzOhMvDDgg2f1YUwMIH58uL
 SVWAUjAp2g7k0R6FZxf8aEfTUFAn7aWodRxGl2eq6R02g1gik3lG85ODRG8uY2Pm
 QLBHglAkgLqI8G5j0RkEjq6zOxBsgRKXvCDFVPlX43oTtkS8pjGTaqwMsxXK1Fbb
 V1Zx8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsrpxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767e6b4596so66657151cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375232; x=1746980032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
 b=T/VlqcnXB87LbLZaHjvH+k0lpk/heqS81pgMdl8fmvBy299IYlKL+j7O+qzqNIBSSv
 fMVKBsk+QHhsEi6dukIFFvlOTX558lkRaXkSOLKlWYF5RUDxiMA5ofLM7JifmR+ZrFxl
 Zi+auBqhgSH4i1N0dLYCKPZhrMvj9P8UKEJBgltqfU5k1IGhyvRaq0ucWKvhKLp5i0r0
 sBWL+X+SZO8P/m7WJWaayfgU4b80mc1SgNRttpUlflAsNeaGBTlcjcBl22UdHFi+a3mt
 9Z4EagYXkrGYLkhuEQfzUOjdlKKsaqikiCF8AS8KXqwy8ZOSdCfMMiJzvAVGVZIYor7J
 h5cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi+VWAnZHfb4fOCZMpdVlwq1nF2Cr75ovtZqz2RXEMFwkN28+0VggkaCF3xp0sFwxbkZMGxSlb2hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXLc/mGXIsg8grToA2bY52HsMaNZ4XPjH/BiDoRMCF89vocERJ
 +qzXvfVodvjV4LXxIjjqacjsyazluJzAA5S89sUSOStLRHEBW4e27XNFHmC0km6niAo1gRFMlZs
 zbtxUyYY8xVoqXpMTHiPPS2uzVI8YaMZsD1PguaElLUQfF+PoaHzNjeVPE2VqMv0ZNrI=
X-Gm-Gg: ASbGnctX9s7bqySRE/plGtyyU3ZpJdZ7CjMdtEwf+Y/woBaPRqooDf+0kxuHDoODobq
 2MPeMOs6wIIamv+ub3QKHrQ0iUq053YC05gLLt35jWPnnvGn1RDjF0YNtqlcJI0VGvxD2PnYxfd
 XWK0VetnTlr0FDuIlWm0wHH8bTTWyTq6s4Vo//+8AeeXfOelBHaTL9fvDHxjhodO20Ejy9BnRsW
 vEhZ/v+Co8NzjUwCz8IfRyb9xaTkgqwS9+BvHblwN54XtAiS9E5heegFb0ZKA6t4jxkLijB5HuX
 SZlFwLL5juRCWukwR7BOCWMzxpbjTOdWS6EaU94FKf30c50yukk4xOcjkuL2EukjO5wrpAe6bDY
 JkgIEUaLjpuOXAjcjF9znivBV
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id
 d75a77b69052e-48dff3e0b0bmr64028271cf.6.1746375232024; 
 Sun, 04 May 2025 09:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgRrtx6olNcggB+aVm/YJLIey1orBelxtWUEM4zIRqs1O2BkE2g6RkrgIdsjcqv5AsaJvNQ==
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id
 d75a77b69052e-48dff3e0b0bmr64028011cf.6.1746375231753; 
 Sun, 04 May 2025 09:13:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:49 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:29 +0300
Message-Id: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OJIbj0Ka2dBHw2DghuKpp2T4sixDGbfV
X-Proofpoint-ORIG-GUID: OJIbj0Ka2dBHw2DghuKpp2T4sixDGbfV
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68179240 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXz0u0hWgsPsRQ
 GfFESt78WLJYl6ys3w+gisITzzfYoezI/AaKd86ESGqaBuzUjmqnnKwc6Uats8ERX5jpoTTPL3i
 NfQ7UBsJBfdJv39zqfLxNoJaVgdC5yBFifnkeCGzMGQYx2v9x2rQGOLkO5XNINw8qG51G0Q+lTm
 ktXd6fImG3zytgCMzUncZ8aAanAbqVVCLjHFK5VnNEC2p6U5wtMbaI3UVKX9g4DF0Z113SrqbWp
 XyDJI0qoUOK1+2G4ZtsvrBRFUP1aa3qZTfkM/RGyeC+ahhDOCxcBqHcMbeETGgG419d950h+4WN
 Ivi0rGoC7ABS3TfK/GR2AZKwhvZ9xWV81bqyMBzFmcU7SB3A0wGKZoAD98jCwL/OR8GZRLweSCZ
 RfIe9nDekA/X8YrQDFLq6DVy1589OLsBoARZ/IUT8aWLBkm4V2zMf/NFD0r654s1Hb3mXRlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=839 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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
