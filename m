Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE0EBC4E05
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB01C10E380;
	Wed,  8 Oct 2025 12:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBd04cJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF81F10E396
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:40:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890nrB010197
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 12:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=; b=hBd04cJgCs6FMEwT
 SLJv6hQIebpXckG7rSWR5WFqC0HAU3YzOqpBfUqFEbgMvU3Xc06MuQzjHrLsqdwt
 h8Ne8CmeNfpDQcCFgxPdgr9088KLmQcUJ6WknNvlJeMX/WPbctqMXCS4uJPYAI55
 2sta4654l/LibwERamb75M6AUI26ZJgtDStfAFLJF52818MNZxQIpzcnGlK0ye7T
 4UDigkvXMMEymCQfW8bOWuyTcJ0nExA3Vj3Q2l1d74UpiSK5uBihcP/VVfRrfmRD
 gq4Ky1onVbv6UtGwEYtK9uFvTQzRF24dfgGA+07skz++WYq/NeKviK0zVWpgy3Es
 QNDw5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junuah1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 12:40:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7abea94d621so17294446d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 05:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759927241; x=1760532041;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=;
 b=Qj0bmXOFsj1KhclvvP2bApXgNG8YzRj93okA9dNjUMPLdfvJXxCx4gs5tGNkO1ZCwx
 yZAKw3sAbW4w9IusbHub+D80LPwgheQT4hkwKC41bePu1+bRej3N77KTdWHtUrAap/J5
 V5N9iX0WewNsF7IWOg0BQf4kPaopJoSCl/1SZMGWdzQU4Y9Eh+gW6oQMk72cdyLjDEvd
 L7Wvt/zNCl4oIBsGtly1NpWhFlxyCXMhwT+vqsbrhxjk3bMMYw6CKWrhEahloS009Zq/
 RVDH68EvqWnhDHHVpYVrZgua4fPVnAxmRJHs2x0mQ21+/qCNOhMqnPxYTGHZhGTKD8Rc
 7ldA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU896OByYuB1Rgv9SOw7Q628PJ+LX0d1PekXrDBCHGywh/Mkk4jWXXUwcZdyQ+tPKQPJYCAvVkzoug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnGBujiK9QZG9Ny/W6LwAmpQFY+n3HQ3naY63PtGHBbS1doYZU
 x3cq02NBKfU2oTyFUjp0uXjaCgvdlNrgLkQjLGFQzZMEwuUDRza4j64qnxwHHw+AsSe4t3cNiBz
 MeVoov+THY+F+28k6BUkNtYyoPtQk3R/eRoY/CbF4M02MbiEDZL5qmK8WFzruCzOndgYYfmI=
X-Gm-Gg: ASbGncv5DNHEgii5n/QYq5T5sFDaAVov1yiCuY7uiAeKsI8NNKftIt7pMxSPEw9FMBe
 17sS4POozxfD63WcmSo5xSL44489hCvwyiB3pM18tDXLh2ZKBFNvIqiJRm6Li6AWmCLnlzf+QJj
 ZAhpRD3gC5kZCkXJl0+YS9Wt2Hlq5EH28ct2C95Cz1HXkypS8OJIS70mHY3plmbk8x38oZwvoU9
 THW4DpON+fiRuc8Kr9qqyNMCjUxBqvCCY3A+apG/7mnI2pmdvY70Mi9f1+WB6UwEHBfCpQSD53e
 TMs1DdURUZB927PMtEJwgwQwvYuhxhgkwf3Zaqs4IEpCPoW+PTgIofSTCiw9l7h5q4dQmirWmCB
 IU7jwqvkrSGQoIGGim3jUuGbZev0=
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-87b2ef94002mr25131406d6.7.1759927240942; 
 Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3QYIdes0zzXDXLbtN1GZArLUcJtOk9G7EMYv269Ezp7bFtd3e0tnh7OnfT4Sdj7S94CaghQ==
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-87b2ef94002mr25130856d6.7.1759927240350; 
 Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6378810112bsm14570055a12.26.2025.10.08.05.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:40:39 -0700 (PDT)
Message-ID: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i7wR4LddIdV-v5Anjs_rkG_4ew0njUlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX4JOHrgY8ctTk
 ixXf/vM/1GX5i94f6otaAkrYZhAcCkRGDFkdHHhcconWkbbQBEGCBC4+tOx7hW3HcDPmQ5I85L6
 ul+BthogJwkNfKbi5kTvyUBoJGzdRLRnnNP++35MIjAvmuqxMG8RvRoVUdVknlGpL9yIMpiLUeG
 3zn/vgKlS//9bh7AeauNCR/sfpX1Y55k2c4HJyM0vXX52M2+vYVgC5Uz76Fi87CqxUYTHKCpcxz
 g5HPmCWaJcVIAD8zmp+hs2sVesAlqZci3bjoPFrcoRLBKLFuoZIBJZjF8Jz+X9HMBMpWI7iNVFF
 pR3qllFfhTGONe+HM18Md5OUrsnybGAcsDb1ppAK4nBp+lSXReRl4OwFHA6t8r9xj28PauQ7tZy
 JvgHUhxatVpJn7kdgb0t94PYb4y2sQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e65bc9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=5YqVK4ek60l4VI_saP8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: i7wR4LddIdV-v5Anjs_rkG_4ew0njUlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0: displayport-controller@22154000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x22154000 0x0 0x104>,

sz = 0x200

> +				      <0x0 0x22154200 0x0 0x0c0>,

sz = 0x200

> +				      <0x0 0x22155000 0x0 0x770>,

sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> +				      <0x0 0x22157000 0x0 0x09c>,
> +				      <0x0 0x22158000 0x0 0x09c>,
> +				      <0x0 0x22159000 0x0 0x09c>,

sz = 0x400 for all 0x9c

> +				      <0x0 0x2215a000 0x0 0x23c>,
> +				      <0x0 0x2215b000 0x0 0x23c>;

0x23c -> 0x600

[...]


> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

0x2216_2000 and _3000 don't exist, there's no MST2/3

sizes should be changed similarly 

[...]

>  		dispcc1: clock-controller@22100000 {
> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>,

You need to remove the same amount of zeroes that you added

Konrad

>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
