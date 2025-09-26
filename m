Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FADBA3F77
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2610EA6A;
	Fri, 26 Sep 2025 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6lo/YR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54EB10EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vcap028812
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Yi4YzfqCRhtpYtMSpi4c2pxv
 l7JbhY/mvPEjH/nHU/A=; b=Q6lo/YR9Xww7cyAqG2tiisx9896ylw2lmlhsi1kw
 ohTR9fLm5V8++Jwg6DlKftwyxU8ebwyPmtw3soLo+vY4/F9ttxvcrhDtHQNxZ2zY
 nbsGvln+/gULtI4PVzp+1z1xvWszL4ArwaJhGIUSWfkhjZAvyEloNWQ0bXyvoF1F
 p1+byedn7jC34PreGn9bOlTEB7B6jNgKG1/D7nuBuhNbwUxKtz00Qp/5gplFufs5
 z8aApQK0vHd7+PtPeKCTAKwjEX4rXbLvb4Yl3sIlnJuMdLNJQPnTowtr5VoJxVEa
 bKXXNrTASPK+FmJZNFw9VXEY7nQ5LNP0umsD/SUtD6VNcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db323185-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4de23c3b40aso12406931cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894835; x=1759499635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yi4YzfqCRhtpYtMSpi4c2pxvl7JbhY/mvPEjH/nHU/A=;
 b=L4vzxbf0rKmBw9NmthLOG3mgrMwV8iR0hoEZlJD4w4D1uY+QUCT+eqy+zuyfBwWz4M
 DHC8A8RJtyXEbX3KjjKjpVsMLvtUmguah4yx2L+kBhyOi/2Mr22NIQc474yrFEC+eU/g
 ViFJvAzLQDggAQ9QxOuaWZa4WpVrsS+wQRkRa15VjdbMWE0LYL0IJrsBjMklMuR6U5eO
 yiGW0V4DCbT6enew/3dnEULpk3SoluzpuhN8oprA7h2lK3SHFIFYMPiBzXQHiisvHeYu
 sIqrI/ItTTMxJ0TXpMyU31/wjN4TjR503Oeo4NgMMKaXY5mHYSfSYOUFawzCH11jaOUo
 +5pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbFsO0LKqk2CU18z9H2JPzThoDecZhTXt+AZ6ArZxX6QsSm7azldifZ8fX6Mdtz4vQ/vCpm7chHMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2l4VpvaCSP/YFcdxFJXBbUPIFHSznpR3bZbuUOVTO/bH42KMh
 v/HkF7NoQV/M5SOhSYMdyv74P8CP14l2T31SZ/fmUMiwwJkHnpsQQEHYmmEV29i00ymYQiGDFVU
 GmpokAoJ6vSlA7tt5xikIGv1+f56Ogz0Ub9YeqTCnPNxLAyMM+hMV5X3k8/U7zHOw/e5UD8A=
X-Gm-Gg: ASbGncux4mvblkYMuvVxQaBYpl6dCjshJtQckALUOQDbiNpJhqwZWd7n/3o2fSffuU8
 ajmbWbQy1Q+xwWhTTGMT1ScoBVACr/d4dpU8bk3VVDNGFmpDRKGyL9stP0L8cB4G6Y7ThEUL2OA
 o7niBV9t+fyeC/5thYfmtaUu+7myTnrQgEhBVEJrCo8i0/sSLgWwiuZCWGRCzVNlFGG4CZlgzWS
 G1mfJAazoYFn0OgJeKePYQzbwyf9o9g9wTh8rBnu+HC9fZho7PJF9CLpVPhxTwUwccJAa7dOIA7
 CrvZYhwHIlGafh8ZMIx3iYj/9KBpA0TCpwpwY+2CNVdnyqvLaK60SAW7z8erP6buvPdk1NEsfJt
 9ADNe8u3sj1UPhByqmb2Oa+wBHvUSwXJCqBFO2uuJsoPB+Q2n2reu
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id
 d75a77b69052e-4da4b1406e7mr95494471cf.47.1758894834812; 
 Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOQIkyN74txiM9v6NI3108EID0DXdgO7j0P2wRzxlXTBsHtrmHH2UgL3y0BBRZ8yy0boNzTA==
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id
 d75a77b69052e-4da4b1406e7mr95493941cf.47.1758894834250; 
 Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583173d1c08sm1814560e87.147.2025.09.26.06.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:53:53 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:51 +0300
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d69af4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=bQGRJ9mVl6_deHTFyO4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bk0h6eHn4e3Qum9K46624Szwv9-nmwT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX5Aqg58qk9CXx
 gKpdOpQrDtpwGj12JIyHKPKJmUQnagbRhieVqxizqgFUsXH6cVEFl50MIQUnCBlUb0ZDAJyksOC
 uLU/jFXPxBZJs+a0JI3Un9f4LdU/OzGO1wZ0oJJ54jgROMoWOZlyLY41cQR7sSrh7am2zCMo/UH
 QjXLZBa6uDItIsUxbJOvCyeY6CbVvXtsp5RqwfsdsxiBGl16fBfHOePDAQbK+Tnfua1dsU2Tl7e
 +pyxdUQ2dXxHXSciDMGvsg93EyIAcvSxu5DROknBmkLLwuXgtzNF/1V2msYef9Ff9zyltki7wGn
 FRzJ7XhGqh8FxGO7eMR4hWIUZEMOllq00MmkDjvl8dAipBlxYSkD3BOkXeQgBYGRRYghSFWNC2V
 KYFavjUjPawGvf93WrUtaEsYKj5fOA==
X-Proofpoint-GUID: bk0h6eHn4e3Qum9K46624Szwv9-nmwT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This change enables display1 clock controller.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index c69aa2f41ce2..d4436bc473ba 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&dispcc1 {
> +	status = "okay";

I think this one should be enabled by default. Unless Konrad or Bjorn
disagrees, please fix lemans.dtsi.

> +};
> +
>  &i2c11 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
