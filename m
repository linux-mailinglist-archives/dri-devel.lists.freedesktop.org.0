Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79637B8AF92
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9841D10E060;
	Fri, 19 Sep 2025 18:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ocbb0xK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4A010E060
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JA8WjB003340
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1xZa8NKZpDGoqnGXensXWLoa
 +hUVxbdOY1y1b66zJ+E=; b=Ocbb0xK4Ljujs9Rpfrf+140ehslrxIZaeV5ZsHXA
 sdEMwZoFTfb1Ql+BuaLOuDI/yc//8QfcddWVzrrz6XZzs5l52mLhX6M6HOZMh/dl
 /AoK4LDROWC8q2OdtxEBsFupe2CEPy+PAG6UOj3XCgBK3t8TlA4VIxHHIe4xuPbK
 wyy/EkBWHD1qo++duSE1fcHFjLQHzgsV9sQYLrzRdsnq4W7R+rnHpU9/2mg1muZT
 TzuoUhs8Xc6phG3Ve2179+Kh+lSmOFF2hLYBUmnUEtTIWt3KAygpVBwq43chfh3Y
 XsIAAwZTWzD5NTg8AKs/WIDXuyPAiS9QOzRg2awX+Eg6iA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqh12ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:49:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-78de70c9145so36925726d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307743; x=1758912543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xZa8NKZpDGoqnGXensXWLoa+hUVxbdOY1y1b66zJ+E=;
 b=jbitekC3Nss7EANgdbdTMWO3lnJysSnA6B9rCASCFNRvx5p6b3InyZnB4vCeTvI1YL
 s3G8O13JDyK5kddu+rSUQdOnEkZjRtWz2DADQnBj9UVxoFjjCQPkDeKOBrR9AsmlQ0UW
 BUTcCrXFA0fvvZPG/FyD0aiRMmhw2dgjGMfTrYmiw+t1F1p9vm3F66KwGuYmVrG5V7W8
 SGQlBdrFUUAfNIYUGl3AmFAzaii7o9UOiPm3IhzAoEgDmXQ/kCTBN9UdxEobTghOSZsv
 SUCtZrVZUFV1DRQHknlxicI2fslu9qhvOS/Pmgky4ULOFt6E4FRR01VugMkHvJO0KKL2
 oHLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwNoTt4zgSHA18q04QXQR8Vp7UrdN8er1yjaAjphwELN2OBsHhggDWyCFbCP9Y8BBFbF6n6tya5Hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJTv8Qmwyk37un4Hv2zd2d64ujMgfSdeAN4k+3mBGCPm6HmCe8
 6iYcXU37H5pambJeud5T+DBnFRfL/BgguBzUpKcuOsSCVBF/DsAGwRjyrZ87c7BoHpXLG1ZOfXr
 0c3OXnrbT2LkcqLBnMdSHB60cT8YLo4yJCskUro7gfnsKlPZh4oyxnsXcXtlHeDwcVupMqhI=
X-Gm-Gg: ASbGncssO4EA1GxJxRARcy3gzUyF797Smp2aYfY9MSBtb9GLOJoBoYNGTE5uKHHYgF3
 jjox+T6nw4P/Fl7p1ERRKKXPW9t1EI1RFT69uqk7bnxj9CMq0+1+ODAdw1SK90an0jMIZDkPSIt
 8kGh5mLhg0/yNRkrS4/cM6W5d/tDZtIS2Fvj0MC0P+IBTSG8n2uyqzee9LEcoc7SzGIUWuyUVnM
 1eROcFYMoROTGk+bo7TZyaVpM7elVKUtARsWYnKai6n4Tp8hzfSD7KEW+7DfTXhn2A3ITB7M9nF
 LUvYR8zXi0WblcexQxa3SR/nU6MrE7ld3XqdSNdn8jH9xqAqKgAbAwGrTfOSmz+5kANTn+5ipeR
 FAQXfLok6SERgo0khw8dMben9U9iVCzE+uLIUKKHS43VzQvAMGikl
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4c073d929f7mr60166761cf.77.1758307743362; 
 Fri, 19 Sep 2025 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd704pWx6mR4liYWHfvStigqH2zSqR9FouEegfxS0MAneRfE6nX5yLKo0d8lSjuQhI5Fty2w==
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id
 d75a77b69052e-4c073d929f7mr60166031cf.77.1758307742681; 
 Fri, 19 Sep 2025 11:49:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a9e1d901sm1499917e87.135.2025.09.19.11.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:49:01 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:48:59 +0300
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
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
Message-ID: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M99Q_Qzd7PGlMN-5hu0pJmP_zo_2Fn-I
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cda5a0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ERirU_vq5G6WO8xEvsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: M99Q_Qzd7PGlMN-5hu0pJmP_zo_2Fn-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXxrIbaZUMBiiN
 lt4uIYO8/QNQb2S9MT2ZZublx7E1eC37PQ+5yaydBOt6tZIXDwD+Lz4KGMxz/nUypC/CMn0tDnE
 FCFIfuhYqD3OHglaLWWB+rJ/Fn/KJuBKeX3qkHGsLu99Pox0nna7AVC3lCY4DAwB2fajAefpzSr
 RNn4eurOFQiTTZNis+3PsEwGfvayCu2Rirx4WyfRp4nfg+BlinYPqBw2i+MqWneLY0Hio1EQSdt
 E7NhaSxokoz3sYDmrw78zXGYHTOYxVGzFpRXPppIz30lXeBFc6aCgtoNRDyzL1Dr9J+qHLl4B6q
 8eKlg8V3K25BIw5VvIzhfOwFluiTm36AiRvN1Htx8/QiNK+5UOqooFz6/DMzHK7DMRBSY0f8+PZ
 ceS4+Y25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
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

On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
> so it runs only for USB mode.


Please rewrite the commit message to start from the problem description.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
