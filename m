Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10FAEB799
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DA10E177;
	Fri, 27 Jun 2025 12:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgZk89ET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209110E177
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCDxqT028733
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=; b=UgZk89ETclhOmh89
 bODZDvPo5Ns82vOPLtHg3lhkRjHus/APr0sgQxC8yg14k5xYDTqR1LDczuq/0ENS
 19sDAW68nWf+GZ99/I/QLTS4qQqvhJbZZesHP3uu4YcQwiS6U4SWe9dNhE6stRgz
 NlFLeSu00sPRzOzIB/l7t2XiPTMfRFMQTqRH7OHdNdx9RulQDQ2oMPQRDDeTiOPC
 xlzV2o8jL5rnGFAN2AkPKf7tkn3Sv7dL4VXwmMMaKtJR21fOvpQDITppVUoepbn6
 nt3HPl0PXASvzG/NQwhhkvxoYa4p5zR+ZddugFjHs5dPSpcDdmz3lRYIIcpKMT1F
 tLydyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa503rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a5ae436badso4245981cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751027041; x=1751631841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=;
 b=UfIMsp5P1TcBxUetkzw7FreLRHB7e6MfY6bIFV1c2gvrNit7TT7gjZMk6yCbBd6Q8z
 V5ZCOYtBQXwb6ODpAxyl+6tnwIe12AmuTKCUVFm+vNs1fBSEDoGwtPhq30LVVsAPtgR6
 V0CwQMAalhSqaFH7A1cnhX9qV554ezcawtPtlFtJSJxFUMmxf+sCDT8PYXUlG6lf5oLM
 D/KB8cS/MZ7nkjNJUhQs3MxANDDFR1fxolqUSXMoPgufMy+doR9x7tBtmTc0cNGfVmfz
 EksOx/wJlEyVxqik5g9oBhAAeWCVSCz42Xh5M7MP6LqpjURvimbwWNS9h0Q6v5ya0lxj
 5dVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOrBs06D4cZlb8Fr5yVj6xNU0qBC3LObECtFeRRfclm4PCbJef3fLFOiNB8x52Z65yTsfGwzyrL9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVZSTh4QXLv7cTx2+TzlWTjp3eSXqngrrKgegHWf1m8+woiPcf
 b64HQL1eFdNVxP4yrj3sDp8nlfsoXtrrOYcAhDKwVvJ54fn0w2D80snVQWMQcr3ubQbACmkqDRP
 tSNydY8Up4U0EOKDiPkPX4IdIlIXofGDsUs8nagd9AVwc/i1AHIFI/i8V4OErFniOlnoNA+E=
X-Gm-Gg: ASbGncuSF0Npyh2YdtNS0j2hUq6aSzwyFkWnHj8vMqHoDuaBHWeG640LLOk6YtTYye7
 Zryeh2RJ8/PD36Fy1Npqn9DGkVE408h80U8NHnpoaUKl0BDPYBsH8yfgdPrMj3MeZ6/4SpgTYKj
 8IG6W8ygBwR9pSlKL+AAUiPxIzmcbazvLffUGj+BEd860p85W3H5bgbm0kZ+lzhD5S7gq5acrk5
 W8IMQYIUewffv8nsOZWpDsPQk2GNnZldjnP5bFzYItI0FIlAPKJzrYvmixK3i5EZ7e+cthKAaih
 K9bkO/HnR5LdsL7Y0VGa7RrvR0MWbSwUEKkUoFxo4+6qAQOuO9NlS7diNrSphwco6eN9rAmW5w+
 QVOM=
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id
 d75a77b69052e-4a805a7b2f3mr1098401cf.15.1751027040723; 
 Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCH66K+eZ7+yWjG8u2nzdrIuteoB2hoHigmzqTcWK9g8hs2x5qZkLnX1JOh7Tx1aoKb5mzqw==
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id
 d75a77b69052e-4a805a7b2f3mr1098021cf.15.1751027040169; 
 Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c831aaa5bsm1394459a12.43.2025.06.27.05.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:23:59 -0700 (PDT)
Message-ID: <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685e8d62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KOtGWYD313IA7KdcrOcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 3kW3uRmagBb-cMxHyaP3pNkRNOLgi4EA
X-Proofpoint-ORIG-GUID: 3kW3uRmagBb-cMxHyaP3pNkRNOLgi4EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfX9IZfGRd1d3YN
 9ZUWHrdMX+ZhGRe4cU+2jhlsauxVn4P6XOoV0BlEbvWUu0/RWUROmuT5sdwnflrVUvOVMNlB9xz
 PCWFZKY6TLBIT3Ly1o+OJbXAZf32+krxZVJdn6Ow8p+5VV8wu5hIAJd516pDwED35OK63xW/gpW
 aBO080Kyx10dKaqzG++MHfCLy2o65LnQjCDbvoMNuKaZwV4r8ACLwK3G8lMyU2aBpwU9frftmMy
 z9t8VG7hAfyfdeDLuy41XYRjfScw7faUNAXHcNv5qOkTp2/C0Z6kqKE8V88zM1I3YXntnp4woDK
 iGXICzTeysZXu1k6xVqVL5+oeJ2IdzihQZxUcP/GMrnJr20EVoAfHRsRhJ907Wv8MomCGqOkRvq
 KiiYD+g27ToNJD5KIo79rS+U9isHohdS4tZI4Z2sGp4efglGuoSdaU17+F0Cw8kyzzmXU43P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270102
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

On 6/27/25 12:33 PM, Ling Xu wrote:
> Currently, domain ids are added for each instance, which is not a scalable.

's/ a//g'

[...]

> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP*/

missing space before comment end

[...]

> index f33d914d8f46..b890f8042e86 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -18,6 +18,13 @@
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)

No need to include parentheses, as you're not interacting with any
variables

> +#define FASTRPC_DOMAIN_MAX    3

#define FASTRPC_DOMAIN_MAX CDSP_DOMAIN_ID?

What I meant in the previous revision is that you can not move
data inside the fastrpc_ioctl_capability struct, but you can
definitely add a comment like:

struct fastrpc_ioctl_capability {
        __u32 domain; /* Retired in v6.whatever, now ignored by the kernel */
        __u32 attribute_id;
        __u32 capability;   /* dsp capability */
        __u32 reserved[4];
};

Konrad
