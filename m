Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072BBA3F65
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0F10E36D;
	Fri, 26 Sep 2025 13:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg2wO8C+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722A010EA69
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9jh8S024023
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Nj2RnivyVd0n/WCOVEL7yqPG
 a2Dwqhx2efpqU1IBZH0=; b=hg2wO8C+R0urRtBfZxtj2aG7BOq4ov0hngmLSsaO
 X5KuzdguO8iTvI1k6mXqGMiRPYJhwB94qyXgwQWNc541Kz9d66RpEXEz0bjCYVXT
 0GO4tHcML2p8xnAtjveHkOLeCRCbY/FFYtvoNPnggr3izeH0iDy8t2Iumh6RbF7Z
 f+jLphKHo8upBAAeyGYNhpDo565cesigtjO92ZjDLPYo6Ty0WTGD8Q+uePLX0jVh
 ZWCSJmRKCMrSHOMcC+cFW8ZleEqi7inzPWqClG4zSHQZmI0YUPF87j0ciz/qN+qH
 vyYAXw2tlmrzlvWE1AbAXFTf1CEqoRPvQRhuba1yuwBANw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwgp10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7f821f8716eso55788966d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894789; x=1759499589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nj2RnivyVd0n/WCOVEL7yqPGa2Dwqhx2efpqU1IBZH0=;
 b=iKpUBh1uEwmnkWzEuA0WYJ8Wh5JfFZRXXXhT8Enev3LciEl8oS5OX4Fd4X2qYoj1OW
 MDJiawgNzooYQ8s809tcrrRa+8k5v1v2yjzhQpn3/LsphZQojPybzmlnkFdrMYnCUzxy
 OeBclvmQOTKfv95GW8WxJAvJZb4MgW1fqw5jYO3Xso/ijiNct4uEjyJ21uH5ZH9nB15a
 iemdv2zlRrtOHnFD8l/Mr3BFQypKOIyAqzF4Xqoawt7ONHGMF7rtBGvPcCl4J928FX64
 MW7gVtUYMIqtw+pLyfNWfCffWvJFmSZq3ArbCvhvBm4P2rUpF+vSJbp9C6vfo2JisuMx
 lb9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGDDqzL8Fb+YdJmm+MD0hwERQkwnrFFlmSVoeHTUo16yy9voeJekYVwXCGFoQUK81oOYqSYJc0bxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAwnrTs/PSWZwKYASD35Vh9JeVvgyVrf7zYdN7Wf+bX6OJi572
 o+z0SmaCWTQDgQZdIm92QYd5bEInd3voUba0EL2X1QIBKtyrbobasDraYMyz2Ho57S0BrWW/QFw
 sEqnOplSYC6RwCAM7p3wA0AxIb/cEPbc1nWktHry3AhPDFZskcm9FDhiZ+9jIm/kV/hZmeUw=
X-Gm-Gg: ASbGnctpViagNqrcCEIvOr5EtilTzcs4f5wUyUraEhogHRrb4QHLS6tm5XYpkMioQL+
 yFM38DHc+appGYJuC/swKsb35/i9ETjlgXOK8QqCTcnxeDrNoZf5R5CDx3mY7yUZJMUCjVH4zTm
 SHS59lBmq9roC+kMVGjO77PdmQrqzp+1LFTtGelCjBGkF25XJKBRZeU38X6pvA69ZJ31CMjbhIR
 2BvBDKwlA6IslTNkp5reEDfiu/ZNpj/btTnoEFku75gtSegZcoy5Jvv20IfqB/EIGCTxJk4Ai/i
 sRwoFy6jC948zymEV+2fkTPclyBo7OVeZGivzCEeVD0R0+3lf8uAbcyH2eidt+ARYowD79XjrsZ
 h3X5J0TUqFTlQunVKAWMmVvdz+cscf1/P1R530ZDhyiPQZL3ceUpA
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id
 d75a77b69052e-4dace86b1e7mr81075531cf.41.1758894789334; 
 Fri, 26 Sep 2025 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoJDS8aWtbyVs7IfWYIbTpQ5DxMdjd7gKuy6V247TUGZ3bJClP3qwuMmbDr8kW0U3F2DuOg==
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id
 d75a77b69052e-4dace86b1e7mr81075101cf.41.1758894788737; 
 Fri, 26 Sep 2025 06:53:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316ff55acsm1846590e87.129.2025.09.26.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:53:07 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-ORIG-GUID: SEs3yt_zSuG_T_OpQ4R9KItXGwYk8ABP
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d69ac6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=jz6_z25kcqxLI5rURXQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SEs3yt_zSuG_T_OpQ4R9KItXGwYk8ABP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX1XivgavWzpZX
 tut1DZgQS/WmT3rtaV6dNYve8D5V0mPGNTGaWy4En/TF/jjS5BMe9tRs9swNrFdoH9R/aMosBkI
 PphFL4qY23BSOk+/HXND6BKkJGajOOnakyUPVtk+umzwQSL6Ua3833dtpWvJ0QMiCfyd8Q3D7hM
 0YFi8c5rYlCoU4CVosEGJkhogq8Yf6GCJdPnxzrYfiEhvVFFQsuBsufkYSgyKRyFSr94RcaSreR
 glmkvfS4gb9ExMYYNQdno44eUawa1THcA3hxGzL9NTKsOmufNNlN6YWzvNkDKGcgWAv6CNo1M4z
 q/Bw3WJs+i2jK9QuDuVPCQEsYe/XsApfgQxG+Q2eKJnpsJQanCACq6JwP79hufEOSBSrrqibRDZ
 UqZfZ4x+o5U8onJaN7sP7BgtBJ/fZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
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

On Fri, Sep 26, 2025 at 02:29:54PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
>  1 file changed, 245 insertions(+)
> 

Squash together with the series adding mdss1. There should be exactly
three patches: fix for DP, addition of mdss1 to the lemans.dtsi,
addition of mdss1 to lemans-ride.dtsi.

-- 
With best wishes
Dmitry
