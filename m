Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BDCBA5539
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 00:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E0310E0FA;
	Fri, 26 Sep 2025 22:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cog++oYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150710E31B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWv61016111
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MRd4LCd4GH7g/51mFAw6JfnX
 VcEmlPTkPoanPe5h3Qs=; b=Cog++oYctCGSML4DQ9CepK3CbQKraJJREoPOW7L+
 P6nlebop8i2Gg+Z7NpvB9XoecTqbAR4SNPm07NSxFoMdIxzCl7TJ+LIekC7v1bZQ
 C7Xn3fy9Aol3FlBf49Rs2fcDIGMvXtoZslAd/y2ozIHeVkrUJQQac8+lDKktKw++
 VRgw0L96p3NZ9wm67DkAwhXpMmfIFbFaymnDt2BKk1Ke1K6YJC+1oP+J5sADDrth
 dVm+1s1mNdaQ8FvyqhV9/GwKiSQQoIqsRoIHAedZWFbOTgsX980W620J7wlezL1C
 RrXFAidsptbUW0z0H2hTj3ssLTq/IiejHp3vTDA/zZjEOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tvac5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4de801c1446so18237921cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758925728; x=1759530528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRd4LCd4GH7g/51mFAw6JfnXVcEmlPTkPoanPe5h3Qs=;
 b=wN9ycGLQRP/BY920kQnY5nYDcRbWKh1MaYJS+aM5llk41+b+xw7AfFf0elV+Nlf9Bc
 ppEpvlUGqDFk4VrhDDy0s8sgP8/qTJw/663rofyHTzL9e7oUJZpIBG3h8Fqf9rDA1pxA
 x7lw1IjpnewhkvQ0wHPdssV96FIAGuszxHD7IYT8Wq15SOjMPafHMeNk0tIEeo9pW/2B
 wx8QgCM8PlANBmHf0g+XKmIgJkOWHm0B4dUCpsJ9mV3+tTl2YFyVyTOygMstzAFk9pUj
 9WzuWsggT++e1FjBk9bVDYyNFqKxcnaHzGzYrZtRnHg7SjkueJN/nAsculm0bQqzzOb4
 ieFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFAZ8YXXzAuBBGCLJidfSn5a4EAIJrfmWlKDGsBHGdU1nx3D+iZAAzQtGbZ3Yr94Q3t1vEe1ZBiJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxSRvnJ3vCo/Zl9bpD1r0UDWUg2mDuda35s5Ki6e/Z5RsC1L/m
 18cRBZlUIv1NYi1z/ecZlQH/qsGC+4o2BPRYaZI8pP3pHoOGzddhlOIROqEf6ZakpwqOSDwafQ9
 2GEG5fryxX2nnck1NaiKhYE+V66AFqtpTnfM+bT3RvIHnSqQSNaZtX5IqxOF5fIBgRwkXv8g=
X-Gm-Gg: ASbGncvPBsjNDzHpmOro/mDzEPXgQRdPmoaIfRStCCCwdLyQxug7U/zk6w21WCI2pOv
 tbhWizHhUiMQFiV9acUGFuoFovkam4mCp+vDzzj3kZ79yPStgOBWiYbPYKySOa3ZcckSbXde89O
 o3Ofx+8UBwey5/RtMTcaJ4AxjeTJmYDhEJwnfKpYKVcgrEnVJtAj7DNPlodyJQTJAW6aXqtidOL
 j+snfDba0o+evJey3wAJdm31MPhOcSvvWhhM+GXvO+iYbd56Vly5wmp6KEK/ZknIUwz3+tp9Y6y
 zbNph+wEXwKV/XIzC/AlEL+mVpi4SexX+59ZNKumAy89qKImsa2F9VE/xPeyVthj9zl+u6y4YdT
 XiHqBd36RfD3H1HbDh67GUDIFiWn+nT7E2AhjKilf8X0FcgnYyYtr
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91598391cf.59.1758925728158; 
 Fri, 26 Sep 2025 15:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECT+nuGAx7AybGioU3MTy0w4rerMEkx4bs7/aNnHMDuso1+UFEquoAeyhJO8yc6dvhGeykNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91597971cf.59.1758925727541; 
 Fri, 26 Sep 2025 15:28:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430dd5sm2149171e87.24.2025.09.26.15.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:28:45 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:28:42 +0300
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
Subject: Re: [PATCH v7 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <yuklvnhgq3q5ddeakv3pmt4iq7jaw6csccpzamxfgcdcwguy5g@t5or6bzrwwoc>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d713a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hsSiBWVQevx2fRdbtS8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sUH1AWHRxCYD1EzBANNN5Jvuu4iFxUCL
X-Proofpoint-ORIG-GUID: sUH1AWHRxCYD1EzBANNN5Jvuu4iFxUCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7VVjlLgRnfmw
 njpQos9j9XUkRbPr9a/SMylILb9SZfX4fHqd0PzBicrWunbykaNx5obdyQzkBqF+1pzZ9aa3dpA
 LpvvghawIwmajmHL+LgDIGQifupmlnp/XXNSUj/mECsJsxypgu+mK1Ptl541HcqyLDXK5slDjnV
 661FXyxQV8zjMlDK1HKCpSfDGn0Ii0pX7CFIhyxxSivW59eC/v3qO6h6g62cLJvEdgin05EFV7y
 Fhy1YJ+SFkyNGoiGLZzw+cIIojlvLlHPr97raJc80PYZ6WCXeSF6cfVf1s9/ZLhAnnrJRB2r9Ha
 2uY64+B61zl7fGuroDbW1n1X6QW2EBHnnV8O5gXAE7sZW4XVNJFkKaNA4CM9qHCDxo0PRu/Chm5
 4onK9H4io5Nex7e2+x6MMHMH605rYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
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

On Fri, Sep 26, 2025 at 03:25:48PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 413 +++++++++++++++++++++++++++++++
>  1 file changed, 413 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
