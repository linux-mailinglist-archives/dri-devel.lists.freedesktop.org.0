Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E7B54968
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744D710EBF6;
	Fri, 12 Sep 2025 10:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="baq9JZNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE510EBF6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEtF001280
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2+yk/HK2uTnuVPRZXu78qeeV
 MxzPMF0ZBseadsxMnhI=; b=baq9JZNnbBmtFqW2UCkb8P6sbj8TO0pqY2b/7FaO
 ywtAcEEjCW0fP1NFmwJ2ZmyuM3qyL1s7Q5y1aW6oXXCven99Q9ZZBRVAqyRVkP8T
 tibnnQQDd95xH4Xsk0216wOSu2WzFbmu/25Eo9VM8WPN6bDJpYr8n6jNCi3hpOZu
 NT5IQ6UZn4hvzXoVJCDKzS0+etyoDyg2umSy5EBclcVvaq0iHHvB2EZwangsKRUf
 PHoQbZlk4F18xguE7gjsWM/w6x7HzwRRnQA01k6p1Ywzp2c1vbE3K5meUlQNsmDA
 PTjj9Zy9TGop9cvAn5o9VWYukgf7X7bcJU9cMIsb7vv4pg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h65wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5e178be7eso51079061cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757672431; x=1758277231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+yk/HK2uTnuVPRZXu78qeeVMxzPMF0ZBseadsxMnhI=;
 b=NmSGOC1MM312byXpzjMhrV/GmpilIQDlqE02pf72cMlE/2QRj94nZnU5vvCix3+PSp
 25jxmmMBZny72zf0CYPEd5xy089NkgWiwdxNIN8+Y1PMo4kktHoO/YLHEl+Vh2pJ3JZ7
 M0PoBp5hnMEBTbS2OzI4qjV2fyrTV1H2oDy8CbhU56kqjx5fNj3tWnAYGuMX329aUagL
 69WgQy3mOoonUQveRUIEp8h4WA54I/ZzVo+In1y077vbWIzaUhDICsnI5a2mzQja3HVj
 DqU0FLBa7UjsSmgea6pD7WjQO/Z6usqgddRqkZX0GPH+zBF8qT5au1uKR2Tzlw8IN00R
 LAVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlCTYCgGjkFO+wWfGBme3L1vBdRqN16LXCcImr4x80CcGgdqo69JbthCBGtRJTErG+SyizfoJDRyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy3yqsU0nIFyzntYEMwl1uKTRohCUYcGVR+zqrcJJinEFsqvMG
 akpB+2RpSdxNr2TeslWRKLvxtBJ2mFGCxC4BK5wxOnMDCqbmw9JNaWYLSeIUeodvPSlrxs68IHs
 1XG3cxW6mxf2dgrl9zn0kBquWPVZttvvk3K6VnIstbvxN9unbcSk46WL8+M+D7Wax1W6w5rw=
X-Gm-Gg: ASbGncv44g4F0NMzAmDnjznF2mOaOIxSWzDlfQYzj/KyJcvIXX5y0CMhbmtucYBR1YZ
 OXkRuT9bvCPJFkhMydwnwd5LOJnv17pic6qgdfsdYh15/CeSXDRYLLdTbiQMBTg5H5bx46bp4sb
 jGJSyYd63aCZ589gVFdv4i3D1sUzfSQ9mE2z4nWle5mK4ZP9+DsG55vSo3RXCFn0fc5NBkd0fwp
 LBN0dA+dVBdqSvIcLBV0rRet5/qOVpJd7IrX34VqaQQ+kNnDBk/04iczgKUnLUqvxCA0XQMJLWh
 vyQoQLQjR3MR1nQro5ZWJ6JScGxM2BF4rissOc31uBA0jtPIAdZ9v8SplYu82rKkyM9U18snNG3
 PEkRDtry2lQuI+6rHk97ofw441k5eEBj+StzXZECiMexaDk4seIDa
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id
 d75a77b69052e-4b77d05e8cbmr30994851cf.34.1757672431546; 
 Fri, 12 Sep 2025 03:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kKC6NUmFZEfIjk6emSV08toNNjqRGF3CD3khX2vxvSwWG/Bv/20qxW9fKMHmTyb8jBpykg==
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id
 d75a77b69052e-4b77d05e8cbmr30994371cf.34.1757672430879; 
 Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fadsm1073715e87.6.2025.09.12.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:20:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GCewJbW9HxX3NwodUWzHqYcqr7AoLbcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX5qDD1m2GvnN7
 SkUb+FK8RcXjmTo07aumyEXnZOpF1KRhCnG7ox9PH2uAPe9I6VWx0g+Egcsj+SelwP0VdYB1uNO
 2cNOlCyIwmX0mERZ3NevWwF1zjVuSUyKFWOnWCPwH8ec10LSW+iY3ySzhm6Cj06KiAbRkcuUDj7
 oKBt0R1ei2OM+PFXhH7Pg+hiXrIeDuOM9LpbclxC4IyCufrEuT0Q01/ZUJcHpIivBAQP1mWQ0z9
 OURcEFov4OTAk1of8hiVuBi0YfhvBhtZKupSKgpM0ud5NbFFCenq6V1qV3jNWJz9ioKXc0Iu7BU
 C4sk7kONuO6M1GaKEEw+K1tU5znPnFK6wfJotzuIBKqkbxDzfUMhT3N+Ho4mEuxoie0AOfoLu+i
 IlGdqMzJ
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3f3f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lnF_te-ij5czt4pA2k8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GCewJbW9HxX3NwodUWzHqYcqr7AoLbcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
> Move USB PHY-only register configuration from com_init to
> qmp_usbc_usb_power_on.

Two sets of changes. Two commits.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry
