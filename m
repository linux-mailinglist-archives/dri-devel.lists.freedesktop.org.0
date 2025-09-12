Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20FB549E5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8DF10EBFE;
	Fri, 12 Sep 2025 10:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGkRMSDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A64910EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:32:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fC18018529
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EoZeu0gL7XFLE2oXZAdYX1fB
 kmSI6sTEmRZW+tG1M4Q=; b=aGkRMSDgGwaaJBbM0weNtqcHcsttdaCvb7pGLCje
 h41WvGyTCjM9CEnXLEGhA6kZ5F15GZd4lRFL0MvmJghIYDljoj5iOX07A6aystRO
 ZsF11XtSDDiNXaJL4/Zk3XPGbq94eQ4kwWA7hPrza3qr+fPdHHyBELrzN5WVUCxC
 JbP8GE618fEiK3OLfIoVVl6DUCY1FDEaj9IJCErQ47wUdiS4ft1ATxsZ3iqeHbXp
 5xr9eTX4t0DCsUOfV/yQsIoZ8c0nVzJxy60A8V2pDW+1kooYbH12I3A0NNM7xz7w
 2C4WI5p55cLsDOLQrvZTeSkDOi6iitmh3Wic73kli9dkmg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ak6aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:32:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-73b7a12ee87so31506056d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673152; x=1758277952;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoZeu0gL7XFLE2oXZAdYX1fBkmSI6sTEmRZW+tG1M4Q=;
 b=vOn+rGQss4yTHnAkSOFwB2/n7wvBDJ3lgiuWJDGAQPnuAJMy4GAbwjSpeNM6IoqQRL
 TiLl1iRhz39lIwLzH69wqEeXcYRIP+xNWGVXWMRuu0C7HxXbxJu5UA9f0UoCp3O8eju8
 ZE9jZorOOlxg6DH4QaMwqmZumrIOVV//Dg/B30k2I2gxpUxWCmNLlUnvsZta55ylWMXr
 d85IIlO/8cAm88OFZ4G7CDfxPkNy9j9P7MhxvjhUIumZkv/dWqi12nyCG/KCgdisG1Yv
 mKda+hor6lvmlH+YoafkrzEUFHdX4gSTadr0MWq0kDt/vH9KdVRRC7daK0R3ISqd23BQ
 lHUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURTWKMtJPpgAVu8Zb434MJnqLHYhEF/ZsnPPB///whaVANNiCqawDgP4XXsWUmm2wbxn6BOSoEpR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3qELFI6Q1SWa/mwupccO1gayc8p2rqmYBtmTZverCzbBMk+4s
 0UhOK8cHnAyZhE6fJA6nRlu14XwuAMsqroVFbjWFJwqElj8D6UNq9tsPUOeJakWhLNxeAcU2hrf
 3cnhe5kGEwWXjMC5Q3pWMJ2MyhApchzsq0LeofmApCENkZQITBcqKQLsrhgn9C6esuqJ9RwQ=
X-Gm-Gg: ASbGncuXLd5Z48w1XsU/LTdWYOLs3Q+awVVkZdRcbNRPlws0TPzYXWsWpGOgmwDyHIP
 vLuaFxipG5TikW9RRC9fNw17JEXr1gBV6f6pI0BVd4NCW9cBLrmDHCqx1oH8UbS1oa1XS1d/Mto
 EOj4OxD1mcISB+PPKBiLDm6cwcVw17JdMpjWhb4LqCsGn6fzjPbE7QsL/uriDYL6m0E6GNHkt1G
 46I6rhGAqIWFoulQYK07F0A8JQcNu+bO4mGTOItA+hrCePXJaLx0m7zv/n+14Ug7ldiqzDZnPo3
 AmXerG6yaz/VtBK5LCw5XBaViZf1OOc4bNgjjpNh+3WxirOv5QqO2MttstEguI81c7Ca0jN0Snp
 p+0Br3n2dm/LpsinP9UjKe8af5hcI0A0HA7lxdua/SvG+8BpLwgRl
X-Received: by 2002:a05:6214:230c:b0:75b:f634:4a67 with SMTP id
 6a1803df08f44-767bc026421mr29049066d6.14.1757673152241; 
 Fri, 12 Sep 2025 03:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH65A47IPcjTGPJhYbtV51wn+vb+zZhqr0yJiBbHtP4GFqDciGEAz/Luthqfq7hIknGdaf0oQ==
X-Received: by 2002:a05:6214:230c:b0:75b:f634:4a67 with SMTP id
 6a1803df08f44-767bc026421mr29048346d6.14.1757673150876; 
 Fri, 12 Sep 2025 03:32:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63c87sm1082936e87.69.2025.09.12.03.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:32:30 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:32:28 +0300
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
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
Message-ID: <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3f6c1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JLxk_RO0mVMWDHH2qmEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 4cZ4aGU6CxzqDr-TqBEBOR5MrDlzqvEz
X-Proofpoint-ORIG-GUID: 4cZ4aGU6CxzqDr-TqBEBOR5MrDlzqvEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX3fTU48bhGI4G
 MNwqyagJaaNM0RgZrHLrCJG9SD/VeMUFOQ+LYtd8TEAB1iYoGe7AdNoDwMxuWy9MOAAtHqjaYmt
 K5ySvS/g0zXgkfT5qy9cTcLe/0dr/Jjet3WzIYWVK/ppXz5iIXwrllJdN7o5FgYb4wnJwZDu+1M
 BbQlax2s06m2eEawLMp2tosyAPxHbHVfhXn4CYpfuFq+CEmVklztSPFUVpMqGr2WtzXW06bsRWj
 iU8iL4d/NhHhPPtCONu4eGpUT0dtQvmghwRKsEbLutHEBQA7ri025Vbj+BnVICxyS1ydENvgJ2X
 CvAgcIhEYVYLG30J/r+hZEReTpJBTkaTUvE1FiP54ezDei+Dp6E4j6Y84SQEqlYZ8gzpv4caayY
 5wXzM6Wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
> Introduce mutual exclusion between USB and DP PHY modes to prevent
> simultaneous activation.

Describe the problem that you are trying to solve first.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)

mutex has a very well defined use case - a sleeping lock. Please find
some ofther name.

> +{
> +	if ((is_dp && qmp->usb_init_count) ||
> +	    (!is_dp && qmp->dp_init_count)) {
> +		dev_err(qmp->dev,
> +			"PHY is configured for %s, can not enable %s\n",
> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_enable(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
With best wishes
Dmitry
