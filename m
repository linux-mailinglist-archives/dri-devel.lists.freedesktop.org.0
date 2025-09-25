Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404BEBA1B4F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4F10E9BA;
	Thu, 25 Sep 2025 21:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK1uqDAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CEC10E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnUd000846
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0PwCuPQqx8Z6h5Uvt2HeerM1
 J/nGXO3zl9oVlZVDBoc=; b=XK1uqDAPXweKnTZKlUOckWMutVJlu5JD471YAHDp
 y/fSOf6S0JmkK4x28Vq0wnoZtIin7w3eltmeEw8V79yPXj0zZ7b0UMyR7J0/xPIs
 fQjpuaoc3xwBf7QH1OIbxDaVe4bz9Sb81IKVnoUsi0dLTuzD9g45JhRt8AZaloXM
 ys3kUasTUNUcFLMX2bg64XPKLt1MJjzgVbLqX5ak555SHo5h2kjRu5YzKbiNBzKn
 HOIPcrWZB10fLBBJ72iQo1I0BHrtYLsGW/rIfjHpWwxJsJ2xt6GeJkXB3tTZHqMJ
 4qEkIZXCRRNlH7ZZQ/lLUbdAUoaKEDz24C7JoM/ISZYfVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0trh2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:57:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b31bea5896so18743011cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837446; x=1759442246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PwCuPQqx8Z6h5Uvt2HeerM1J/nGXO3zl9oVlZVDBoc=;
 b=X2r3uHiUbmKwSG5JjF13hVGd1pwRsyOC2s5DLvwaqZySQUdOOi06j9bpagxvvCoYuT
 ZipQ4CRcPVj/NYxKpIshOZARvnnEVZprZ3kzVdgYEpsBU0G24UEh5/6ti2Gp+eKIajjh
 1wfU4uU84Vi6bVrSn02SOzQGcPNN6mD2LQfOpPi9KucWJFJslf6YkbZmCVIjth9pLxOa
 fKY8z3FlCh/nisjwuOZcLjuWsSVxxW8kQ0sK6rHyxFpLwC3jT2IJPisU5VRt6KY0Mr7i
 8gBKWvIgHDddwjwVXwl3cjT6OiGc7aM6JTmDDbVjMhKIydI33pXbuQh2aG3BytQ6nbKT
 cCCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3YcSHUDnmJJdrAxKICumWht5jnn/29k/BO7Ip/PAc5PxIB3EYoFhak9OR0kIQV+kcBWkD5bRY1ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzRgnI9fnk470N4xE2ADBh/7+ByjPFOs3Hezg0SWA36UUoTNgR
 Mxki3tST0nvU/z8/519ew0Fn7cDUc2j9iVNh5cCeWKOjMnZdZpoRDjnmoQI6Lh+ANlgsP3fW5Oz
 O9e6G2vC5M0MAgaGBk/VI/oNDVd4xqXMPO9Hn/tFTR9Dt851cPQK99E3CLH5dgGnDq/slt7M=
X-Gm-Gg: ASbGnctT/lqK12FZ38NdOQcJJeNAUUZ8+xVqNlS5V4EsIyyUOMOLEGpFF1B3bb+dmW6
 B4axLmvJZVq9iRfaLcPEQ7W7R0SGEYByHQmRhQqxaLsPycHnqgfgMXypDWTj+jNCvTJIK25f4NC
 JPfjB+a/0VaRa/msOFGp0c5fuc95IbAeZtqcHcdA/YFHvv1wTO/uj89rTnNlmhzYhwlvT3LyE8L
 7u7Z/J6y+TnutF0Fq+Ywcob2YnravCkSt9Z+DKAl+Q+p8zoKEuArEtyNX0NH7KyKjT1wG+IJLaW
 JpXAzcTPfV9fyM2pNOhUyw8gyJ34zSBLEVqhwHifqZOfiReCMj6ivJ5YQ37yt2nVUCCeMECvLF/
 r49vYqJIZz2FcnXiFr3UVW4xZdx/hCdwkKkIRzTi2ZgI6zpWw5TLN
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id
 d75a77b69052e-4da4d31543emr60280941cf.83.1758837446399; 
 Thu, 25 Sep 2025 14:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvHFm/VIoqIQAQiQZ6FSqSB9YMAic3boTm5yCXZXNdcpV35T3IBACEQOCvNWiglROD/o5RA==
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id
 d75a77b69052e-4da4d31543emr60280581cf.83.1758837445940; 
 Thu, 25 Sep 2025 14:57:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a316d6sm1156263e87.98.2025.09.25.14.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:57:23 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:57:20 +0300
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
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d5bac7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cNq2fIDUiLOJNmzcDXoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: a7WX4Nnm3OiC_mm5vE67JpxAolsd1tKI
X-Proofpoint-ORIG-GUID: a7WX4Nnm3OiC_mm5vE67JpxAolsd1tKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/De8dvy5J5VB
 jJNsHF+e/pyiQB+wjezNKAfpfrtl7FteldcODpjjQ9DejWWuIG8bIdmnCq/ZVPll/Eb0rB7x8h2
 hhAwOWxr7lsZtMnvG/15ZDYrUcbeak0O5zuKSVt/x2SE0WuigUgEmNojmes2qcLSNkbo5d0XFV2
 99zdjmbOMZG6zIl6XJ2a9OYtw21FFlaaYBN3RpbLUZWx8kPtuX7o+RhqzlEJtiSjkUu90l56ZSJ
 955QIt8FzBz/z6uLp+JCReeh0X9kls48rOmlScAD6A0MW7urAoacmXl6YjxFQJeZylGtArhs3KX
 edqSb0Bat++DmgyyboeSxl644m4MR/gqOtygVhQgxldNZMu8NbqdDyz8jnIu9dtSmLgLOyROxGP
 SyZiv16KlDu/Po89eMly6m5rxd+TVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
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

On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>  1 file changed, 407 insertions(+)
> +
> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),

Hmm, I just noticed. This register belongs to a _different_ space. As
such you can't have it in the COM table.

> +};
> +

-- 
With best wishes
Dmitry
