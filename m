Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0DBBDA45
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1F10E308;
	Mon,  6 Oct 2025 10:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxJ6kvb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6710E3E0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:14:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960mtXl028624
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Pkk1RkRlbB41L4lHFoSJJ7UG
 9ReoAbhWG7PYzEdfnMA=; b=DxJ6kvb1IMmD7N973bpB2J7zMx9/sc9NyCaUwE5j
 iLdASxs+Fz+zAlJWpkUUwqq/fM4+2JG1FlQ4ij6hnQwbdeOlcOczRZ5Q6piwHB17
 BU4THkDH+lc6yClZbDOq7sy06II2IhTQi8tByQB/FfCenp3XAxMwt9rZ9wt/QvHr
 NCX1tgfEGzZ0MFfmto+c8LlirzLF+kQ0lbe6VrMIgDlFXpdkLJvhbB7sPJwx+Mxp
 tQFhGv8NfPkZjSn6PjjrexXUDjkG8iprQQnY7y4zGSNmeXCOtfowlsb/KQfQ0Ugv
 d3AVkhS5rjoF6gzT/0tDOFmThQSekyPq7jXEC/qyw9g6zQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpunvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:14:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de801c1446so103907721cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745663; x=1760350463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pkk1RkRlbB41L4lHFoSJJ7UG9ReoAbhWG7PYzEdfnMA=;
 b=GdmxWHngiZ7C5rRdjeQVirDBL7MIvJvVd329iFQmTDb2NOO8v4EdvhCoZ6GNQ/KhvL
 eJBZu+60MmfNWVcsBECGZm+pF++A5obyAUWShiP7/O6rrS3hZLAjvLF5fbvucHE6S3wI
 jXVi/midsMpb20SN7CgnaVVs4uVjhD+zfsZOrtT25K8mBQWz1DCeSU7VvJ1qgZPUjPCx
 qFjiarR0biBYQZBf0WnimR2H7NB0+nJK0xn4E6IBDi0ya53H+ylb5glopwm1WOtDwIwx
 Adezdbu6frv7m28+XLjVvY+YArYpSZ/wHLOxliK9/CqjbknTg96dCeFQUtJxwGz21w8O
 qP+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA0B08zaCjQGatY3nnnXl9Qq3dHDsAtStSJmw+AHyGmhqymPWXnQPzSRvYDYHOQk5btufMjk2Gx5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmJK4kC1FdZxLiBVRYlXCheOrKso9x0eXQyn5c/Y3d4jswdsJf
 MQWx2BhFQy8kenx13cwPEHwi8CSTUfGmDovNIVzcO/VPUIol9dZjK+JmF/dfCE142N0XFwT8Cb9
 OAVky2fknGO5JRIaI7HF94dNZ8zPOsI+xGoEPn77CH72ecVexi5byNWWJM9icS64UhXctVFk=
X-Gm-Gg: ASbGncsGKV5LBTMjmAfa0ZBcuGz+SWd1STN9EVp++8uW18phaED4vIgDgzSDVijeyUr
 EaAHdqbEhgKyteLODaUrusbCf+ONZYiIVvvhHMOxYa89KS7x42nxgKS68Pr6AeeygHAgmkLeJH0
 ZJziRdBN7Y+9f3TqCsNRebADrmIRFRWPln60TSsmzUAgdUKwZ0RcJxOvHUBzLECN9so5Kajitjz
 CJEuAHoGim/XCAgmKDCr/49AdbOgIGEG6b5KIjXRIO/QRRujzgWDwm4sY4VCq+6LJWuyHojZUT7
 uh87IXKpa34q3LTNo083AcnnuNlevxRwIwOU8lKEcwW1PHGVRqxEi2mbmICpSY4Tp/MOosFp59B
 magKy6WceGmePz7DpGcN8MGg2omhmpmNnDNhNheBP+jC/5Jb7/hcoNXQklA==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id
 d75a77b69052e-4e576a7bbd5mr115462301cf.31.1759745662725; 
 Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2mRS+PCS8yqh6XoTz4k2QRrzCDf3fx5rt58x+S+tnSIyPuPPK5UjHLpMhBU2vR1wjv9UXMQ==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id
 d75a77b69052e-4e576a7bbd5mr115462101cf.31.1759745662272; 
 Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e4a5sm4890540e87.93.2025.10.06.03.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:14:21 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:14:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-7-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: wLTNe2_ZvBUeNHYn6jq8lGPRHzhBD5W_
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e39680 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=OIU6w6j0321fZR4p8lUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfX5XktUzBDAfbs
 lcUqso+YIvMhZe2WZOvWoh1y2q6vb/UARL6/V+E/X5nAeh6RGGLy3P/+UZPpxx2fG8aTJIqNhjT
 /aPT62+8A1rFFQDFx2SuVt2mmRZn/1zsE3piZQAHPbA4k+oqP3wjkG1zdHLMKBt5L5uoRL8N0qB
 SC/JLhLL6dK5lsduW6+iY0SO6RJPPkSI6Y8qfSUqCdMaImWKa51KNRjTvyPEdkWQnjh9kqfBOrs
 CycpguppubGPSurblbtj5bzQLBfA2KuH8zE07quxAuynR4omKILAa1Y4U01YFE+Q3z13lXw4Cb9
 2HCt3wSK88qG1rUzgDZw6XoIpGgMK2lzGbyZZGpBxYFblY3vuIvEtEjb2pqyUO8Al3gbdJsD7iO
 wCIfXQ3w+ZAmtwbun0VNSR4w3AxLhQ==
X-Proofpoint-ORIG-GUID: wLTNe2_ZvBUeNHYn6jq8lGPRHzhBD5W_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016
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

On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> +
> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};

Does it really support only a single freq?

> +				};
> +			};
> +

-- 
With best wishes
Dmitry
