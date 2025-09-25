Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5EBA1B1C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63210E9B8;
	Thu, 25 Sep 2025 21:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBGGbHfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4510E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQ4JN014583
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WK8fdvESA/OTliyL4dPj+6x8
 FLgnKUZvKWjsZ9ztQ+M=; b=CBGGbHfO5GieknXvJF57m5MG499qdch7gyJUxhyb
 g3jbSoSR02NbwiuFNxMLf5vGv/cD/MCt/137RrgBTFeOzk7h7up3903PMNdBT8CD
 SsgSMsRHjCADg2+8xHMXpzHACtm/vVWrgnzKPkXTHjk3wrrkochuAkr1TclpQhoI
 /xhZWJrkdG2oQqHjnIlXzQ4nr33rf12853oHOOKnqeZbXbbtWC/1rdVzFMBika/K
 msY/i/pQEEafSDhvpN2D2ZjquiboQqH63dqGJ5heFR+P8NAkX3uQBWHiJrrWzJCz
 Sy+l575LGFGEh2laL7WHJYS8qwFSo5eXchAhuGnkazU4oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rggq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4cce66e91e3so48090241cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837286; x=1759442086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK8fdvESA/OTliyL4dPj+6x8FLgnKUZvKWjsZ9ztQ+M=;
 b=ZWcmbcSMYy/b+E1Dj00fd3FxZiaERz64O+2MTMDSama6OuaWUYUhfwOfpozLJm2xGI
 RH492XyAZxP2hTwFGnd10BKT5Fy4xywxoMw5+60XG/um5mn0tsuiwCXhwNGXfOBYKPO+
 XaRQPLXMxZgBmaVO1ANR3bbmCxPM9eOHvPE9NIO+oYeoyAKoyWyte3gyWB4D+954mwxU
 UjqGDYgjBfaI03bKDPCZksbFJ5xcQLQDY3YgFz84CEErawRTgXGiRzj11iMWkGTEkLQD
 WA1kbV+inmy8DK1jsTHafrCMK+pSTSbkHoo31cmeP8Lms/Zeauv1tRl1d/Mng/iYWLDb
 puWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFY4W8gDJgj15qqZMlUXW5PMm0TrcPFVZuvIBxk5h3zQcb7MBtnSFLiJM+UPcqVxV0RbRTnL0yWfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHEuHn/fAZ61lJB6qtUUUv0E4c7Jt3pOZckwn6Fn1qIiZhn7ve
 K9MZORumFUiN7VjtJF6+/zR51NKqZmvzr7ok5hnwJJeyR8tUY5JZWxyNRBIF4Hla+xVeBXdrI22
 h34Y8trO8L0XvJtSDpMJXHvUv75SeXDJBbPnaL4W6VkKZ0Bh8zFh6Xm+e6Jcspih8NkVM3ec=
X-Gm-Gg: ASbGncuW7GuwJ3NYvgxC0l/FeiuE+HhEwVIWdHLmYTvILF32SAEYcdOwLfs+oJTAyky
 4DbybcvKrJWM4Y072TfHTvJ8WVt6zBjpPLPzGcaqZhSPlCU+cEfHMP54aUuOMZdMSP0Jhkt51x2
 rxuUOCESWi+i7dXomamIF8tStlTxMWZb5NY/1iYICb0WYQGh8OwmhuBGeFS1T8JUJYy+6BV1RGi
 hPlyeGpTTwbtbKVRdNi3gJ97StWdi0GaWfqYCqnGnSBLSOnOtPQm2IVPmrfdu6b9oU/cHwhLSJn
 UHWRtUX25V73OV4p+1sm1GJzpRcwwSFSCbSlAryeABU4FXeepOPTstr7CuhbZoJWxoChwB0QRED
 tzFJ8ZObLtymM/EPImXuJQAHzAE1trgOsIwAbie7dPrvvuqhcyUuX
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id
 d75a77b69052e-4da4b8095fdmr62826071cf.40.1758837286023; 
 Thu, 25 Sep 2025 14:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIHqvgghJCvaOUOze81nukdnXAC7zdagDIbBSgvwres3Q7gPK8kP6rfKMTox4SKyvbSZXPWQ==
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id
 d75a77b69052e-4da4b8095fdmr62825681cf.40.1758837285529; 
 Thu, 25 Sep 2025 14:54:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm1117472e87.35.2025.09.25.14.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:54:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v6 06/14] phy: qcom: qmp-usbc: add DP link and vco_div
 clocks for DP PHY
Message-ID: <soor7srlw3hoqh2onmn4ki6d6mp6psmrbz4simwvvemcy4s5hr@pzabx7comvc2>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d5ba27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ig_1WL0MwRJ8oiofZPAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MadP_tVT_KILwzLXaWd8xaX_gKd8GGpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwimchxiUiS0Y
 /2mshmQ8q225QG1qc0cyXTIb173YzLwkHaoXiTsFiytjlV+iGxidp1us6Gap/twThya9x0iUBcq
 dIcwNXgIpoLay6JzEUQEjROQgvXlD5CEaixFxL93FJ8c+9ztAUurPSs8SZ1UzO2DerpHkm6IKIa
 vFUz33eMoTxjDwzrrH/SzzJtLLzwYnfm80PJV8cJYr955WsiQ48yzsYWIo96J5l8JGssfuEdIcT
 wBDmvkV1BHXrhFaa6UC5N5ENieDtsyTzVI6F8plxbVOO105DSrJuoEd2zZxtzb/KzOwsmW0md5+
 FceP/mOYb+LaESe1wZfHhcuqc1hNKIMy7o60P0fe0dvLuMdf+SLDiohAu8K00OOUq7DiJGss5vI
 RN7R+iadJskM6QYKWE0yPT6o+OhRXA==
X-Proofpoint-GUID: MadP_tVT_KILwzLXaWd8xaX_gKd8GGpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:04:52PM +0800, Xiangxu Yin wrote:
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
