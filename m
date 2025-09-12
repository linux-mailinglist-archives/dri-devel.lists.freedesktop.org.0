Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329EB549D8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613DE10E187;
	Fri, 12 Sep 2025 10:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ez1cDXbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9870C10E187
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOBs010914
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QYQVjSVGI7fSyP5NPLcxC0Gn
 NWMprT3G/Z6o5y804gQ=; b=Ez1cDXbSvnGemg8472pZ8bhDQSW/4Ft8Q83R/893
 2LMiB8BhNhqVTzcLqTFOdPPzOGEBduIjUcmertrhXjUEwFazZ8uDN72wdBV17WVQ
 N1IP3xd4EzB6oLWkiiA0uY9D3WlGRnKQhXnOmECOHgeQFIT9qcKZ5aoBLm3xiFcK
 D+d1nyaUn8T/SNIOoVZO6Dv7YJUi2wuXu+p8yn5Ui7LmKx7tNTArTDBp0+OfU3kj
 emw5YhBiJ+Oo3Kqik7N5C5FR1Nvb/HHQFGiG2jJRmnOVbC5aTQJNh/VPpp7fJ2K5
 3WK/a16Y6uK50vMN5E1UFSsc/z6PliVOMaryGGIDqb4UDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb16m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:31:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b31bea5896so18816521cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673075; x=1758277875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYQVjSVGI7fSyP5NPLcxC0GnNWMprT3G/Z6o5y804gQ=;
 b=J0jtuROr0kczKpQSki8DLBpx0zCpSOWb5Qh41PvE1KzZHx7Zrzun/4zkSoXZIIfC00
 bmZ52dONw2ubYg3n9u5lfXQLL5Q2hpZ4RfMiZAbWy3ylGmzPNAK3A0zYtknKuj3usE8e
 wqmOLdzYSCkFxnb9WnfhVWnQikk+n8o5PwJJQgi3eTxcgkrOMFj6x5UNNBxlaup/NYF1
 yWly3mvHYmnokpw6dmbXV2ZsikhdVAGYbgRVDAJ/zVa3O8W/6ZpXJSB6KwzLTuF8fogA
 gUWqHHmSU2GJq0ql8wTCnBq8IQ6Qp9nCB2wFPp1FXBJeFL7uqkWNp9iUhNLyJzMc0GLM
 fIOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIeB46zzTmRBIUSphtMh+MyJSU0EqmsWtteXxZ43YPQJpNZTQWy3Y3dc9Sp81rhhns0wCfmOlytKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkIx+7Mb60W9S3RLKaSaD/ML3Wn5iXKohnAuEIJAHnXdvxJCGY
 RuIY+HDS8U8ySB8P2MXBj+vc7sRetG8as429fN0Xd2T8PPLT17zBafG6IQgYko/jrvcymOHFZDG
 op6K3muReoKlI1OWbZM8vwJFKpSsueHilwoA3qWHapSO8g/YL96gHr+a0GCtoKcU3J6gJVfM=
X-Gm-Gg: ASbGncvHgRx8Se9ft5JkteMH2nw0n7dCaKcnwfJ0hck19zwlitlict4oHd9oK2ZmApT
 uE2OXZZa5p7uYEF3mLD/TmK4L3jk+hRLiYtmFrP+JGoD4nAguuYMPY8oUkWBDfnsUMvaYpZvU5C
 gIyUBBL+J29sbox7cVlsW7HTEWDxwNqyBYUX5NZcaKLdq6L8kKUus5FnO1PsaJeaRQaDZouqLeP
 x0ee0ryPzQ4/xIQU2cdytkKFbBeVQbpWRgs6rC86mMSIJh/zdxxu52xS9T1iDAAXeEP9QWOltC6
 V9aXqvkUlqD0WM09yONuuOOgb457e1MTDDgB5FUPY39URszu+qpzsM43lVZiy4TqqG68Qiemly/
 FL61VKoU7lxUo44ssQQXQ100qDE3M+2KvZyuiiAGEtzU3AkHMpR5W
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr25974321cf.65.1757673074726; 
 Fri, 12 Sep 2025 03:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlmYG3GvVCPpgbJA4niCY20ubvFQsgSIGszF/TZGTRPQ9P7ipXCexaQtPdOTizRtrNWqVY8g==
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id
 d75a77b69052e-4b77d0c8726mr25973891cf.65.1757673074110; 
 Fri, 12 Sep 2025 03:31:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a3464bsm1032362e87.139.2025.09.12.03.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:31:13 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:31:11 +0300
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
Subject: Re: [PATCH v4 10/13] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX/5B1pf2I5fdS
 Az5qfTtku434hdS19ZBl9L1DP/Wx0LIHcS3ASDLIa65EwI+8zvH4+8LzjtIg6BSh94p53+QUHVw
 iUl5FkU4maF4tZBfynVO65xOQzvMvoTdVcbi6hauqgQ4groZwUTKZpmYBYrsMsAbtLv09p3/4pY
 xq8prx0RNRBgbLwpN8nJQOr4mtuCy0pT0Umi3vNo/icUtXreuVJ/QBUOn6tQ67CPUEtVF8c/gqX
 0WdvVLIBy3k6G3nQ6WlSE0RSlYnisD6Y+D9ZZnJGKW34lsd/oFTvcBSULjEYV38dmD52J8JQfY6
 V9PH4MXHD+fjnULISWfAu3I7RellF536JYM1KmFH0BMa51gRhe7nd3S4OQH2Na9xtLqauJYw4jI
 RKl/SVdP
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3f674 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tOlg4r5JIpINhLxCU78A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bfOGir1nWIkUsIYWp0Xm1aZ_6bd_cpOr
X-Proofpoint-ORIG-GUID: bfOGir1nWIkUsIYWp0Xm1aZ_6bd_cpOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 10:55:07PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 192 ++++++++++++++++++++++++++++++-
>  1 file changed, 191 insertions(+), 1 deletion(-)
> 
> @@ -1669,6 +1832,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
> +{
> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
> +
> +	if (args->args_count == 0)
> +		return qmp->usb_phy;
> +
> +	switch (args->args[0]) {
> +	case QMP_USB43DP_USB3_PHY:
> +		return qmp->usb_phy;
> +	case QMP_USB43DP_DP_PHY:
> +		return qmp->dp_phy;

return qmp->dp_phy ?: ERR_PTR(-ENODEV);

We are not expected to return NULL here (and dp_phy can be NULL).

> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static int qmp_usbc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1743,9 +1923,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(qmp->usb_phy, qmp);
>  
> +	if (qmp->dp_serdes != 0) {
> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
> +		if (IS_ERR(qmp->dp_phy)) {
> +			ret = PTR_ERR(qmp->dp_phy);
> +			dev_err(dev, "failed to create PHY: %d\n", ret);
> +			goto err_node_put;
> +		}
> +		phy_set_drvdata(qmp->dp_phy, qmp);
> +	}
> +
>  	of_node_put(np);
>  
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
