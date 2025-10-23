Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2859C0107C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2810E3F3;
	Thu, 23 Oct 2025 12:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="byzevInz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389EA10E3F2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N68cX5007418
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5onFcSVtjASenfWYLyuXz7Ij
 aEZN0TDQOoqBl+QFROk=; b=byzevInzK3g9LUPjzm/e9hwxr+VfC64JLQt+UMkY
 xX55uPVmpIAkfnyLrD5ytJwSUlu5RgRuycTFZvu74Uf48yOs2eDSpi9BJbSMFH12
 qvnY6/dbeNVfHyU/EBWerTP3arsUgCXFSXD8ZKc2KhqBSCQWjUPlZSW7MLhTwCR+
 VE0/ozm9cGuQRGIBMaHc1r/dbD0RL7JmUdimgR0tFltGv46vWlYAO1co8tSHGBk4
 nKh2j0qAgU1QOXxdsMfzEIb/JjMCxgyY0VVq7RuMLiKNkdhwKkgo5AZKoBO0N3SR
 +f+J817Ms+IkI3IXKatVU8VG7IlEo3tATvPHOLVnuCViow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3448d72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so26412331cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221682; x=1761826482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5onFcSVtjASenfWYLyuXz7IjaEZN0TDQOoqBl+QFROk=;
 b=UYAlDBBb0ja81cuVXjT18sWbQ2rW7Uc81hCPAv6W4lnUd/07nIJrmWY8rnL25Js1rT
 zbmmCuTuMyfGQnbvXzgPR3rz8g4Os0jkWNNGLsfoYTcN4SjNLYZkwPRmmGYDNJFcCOOW
 URY4DyDbZgB2AClPeeODg6emezhnIqA4u0jIb4e56bP8ft8OBaI203NZIT8g4JVOYCnO
 hUoKyljOQL88rxukXBEFqVj7liphC7MlDDldQcagWUWNyLnVQcSi5v22CysrKDaTdLI2
 oO6xvbJfDmh69w2g0Z18tllE480Sgzco3IRWgEjf00uDV4YWDCAO1UhbHXEcEexh5rXN
 vLpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQYeq80Qhk5S5bwg06TenydMH67yfqjftAYP6gzlH7v5Nm1Y2w/JqkfrKyg3iAHqxWDb1xmwHnUmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKpkzRXyoDUa24qoZVbXVo43FBknw8hr3ZJ9IMrMjqaWTbtml9
 8wsKJjd3MA3A1wyJizrMGvgI16ZdQgFuEC7DJ1AlthgmspJB1SJad0XRDiA/EpLSMuTRVh7e9sI
 hqeNSNJvEnuXsAecxD+kjXXsMp0hkzQzb8jW907FxvZPs8ytfqDO4QFDCgRw6/wIIZuR9mRU=
X-Gm-Gg: ASbGncvcSYvXoq+yUDQB2YM2DDKAIFx8MVh3hLp60gHMe/uGfkgjql3Jbyx72Mptn7J
 CW0w1GmAjUv7utVoUTjA4UyCbPjVvKm8nXvCh86yRoaAzsjiJuzizXJy6reUizZAvJaSXPTUByM
 n1CRChU7TjtCRY76Vs9BFrmHrIrmc9bz487bX6PJKWZy/YRK5LJrgiEKkfoMAtTKICu2ntohI2V
 ABv7w2sE3R6mhWuDU+m3GZgxX/gPbKWBQgUOt9AVjrEbTv4OV6EBQdhOnM8OLcLVsyKu8pH/zck
 G6OSXRDZ+bqHkEuRoQYbwOSrohvUJvgBtAvjWZ+YLuyEoCXfO29We3qEBtnCyCQQymX0/r1i/d7
 gNQmhoTwdnxMthlniIzVWWGwccWfiAe2r6z9yq/tpfHfUQ9PWfEMcEYKYKL8NMdqRiEjL9Phps8
 /2xy4TU77B0bFt
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id
 d75a77b69052e-4e89d393b93mr314966951cf.66.1761221681925; 
 Thu, 23 Oct 2025 05:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESzd2NTnn2inqqoUmN9EYSM5jAuMSd0Wq4bXLNw8lQEUOtptDq/50z8lDPp8MEtECsteYIdg==
X-Received: by 2002:ac8:5ac6:0:b0:4de:cb90:dbe4 with SMTP id
 d75a77b69052e-4e89d393b93mr314966411cf.66.1761221681423; 
 Thu, 23 Oct 2025 05:14:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d2c32fsm702012e87.89.2025.10.23.05.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:14:40 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: NGuVuCYhR1s1QO_9muoVAD6YGvkiDx2j
X-Proofpoint-ORIG-GUID: NGuVuCYhR1s1QO_9muoVAD6YGvkiDx2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9IVyl1UunSiU
 MOqvJtwjgQtWFiCL/w8zdRz9nqy0HYGwHTEmCcGBFCQsdv6USQHcyqwUXA0LSWJ8S1v7O/dHh/z
 xLSPFVw7XVQ9eNMhE3HeWhZp3LeFMCTiPzStbB8cF4ifZMcncfcsLaBjX7nA5EVpSgKz3VBIsqY
 O5Zv6OvtkLOqGU1CGLdFxFjbnf8YJd518QzOuzmAeNeTqKvUfSY5BMP2ykW32ekGfZYK7ogYeXa
 GZaRZezCF9MJ3DlSLhj0nnwF3gh9qTjvQw/dE/dyXW7tpIo8/3l7VcWa0CjuI4WvdiLxfVQJIKE
 FRQRP83eiY7/ck3Z7PV7cyRhFCgFRl6Exc2YanQSMfePMXRKzOvvQeRsawYoL4Tsl0EkG3oP25u
 UIhvyESgDfIqEmtpIQ/JZfoKBGdgNA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa1c33 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-jZqwlwB3PUYXKLUuVcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> index d6a37d7e0cc6..7eda16e0c1f9 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> +				    1650000, 1950000);

This should be done in the DT. Limit the voltage per the user.

> +	if (ret < 0)
> +		return ret;
> +
>  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ctx->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
