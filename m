Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC78A6A28A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE4F10E38A;
	Thu, 20 Mar 2025 09:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5x807F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C80710E38A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:27:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z3RR016424
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KeHYHgSRoKLBQR4ChNEg2+DinjKOYoT9p2BUm9bLAEs=; b=h5x807F85KZGcI2T
 FEZ0TjAXf69j6bFfIU6NNTZUjv21ZQ2L/T9prIY//EHR/rvtCYhqjhTuX5n37bfE
 DMZn/HQach8XeyUvDVvF/kkF2igdsUw91pRZ5P13PAdoVCj3zZZmec/Tp5AgWVLr
 hmTOXVx/aH5wUokc5RPVWgflIJMmARFFIvxYrGkKqrs4p31gGfcnKkQyH/zRxRbk
 2G/uey3LIwRgVlt001dOnDPUCYx51MaI1fx/KZFp0vhYFY3Ina8O1K/qhCBX08xI
 +nuV/uTQbyZS865BPWfdf+5Ea6X2PCHs8ENUf6uA1HQZmgeIz21yttvBKnKirLO3
 EPKywg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t41qq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:27:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff8119b436so961202a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 02:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742462824; x=1743067624;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KeHYHgSRoKLBQR4ChNEg2+DinjKOYoT9p2BUm9bLAEs=;
 b=E23/wj3b8BdjjVWAe73gMviD/d8KNmkCPgwk/fsW+Z1/NU9wzpUhyHmqiNpIwmikfd
 OCFmZm9bLGu9zXWdc6Y5/i39fCtFBpdMbRRkhxa6VtXPW6VuAA3LQ9xZ8j0xUMlKcEhZ
 cA745yJ8NJ5mxWGRRdFWsPQb2sE/rnyZq3Pc1vXoOH4Grsve5mqR0SL+PHouMxInQ8eQ
 aKNRAS1Kd/TTyFRho+Mr4J7RUnHgTQn0UEYDM7kJqugqDPfCU2rAzsknnDVvQf/xMWc4
 49PvVfrZQrP1ff3hVM8he2FHDyAc22vYsT3E/x7+Ol0cN1VYbwlNjONGTHnbeBfjN8Yy
 hwvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMdeuq2bZOEc21HF3Y1RylzfxzOtpO1LFnjR8ko0i+U9zIbPUymeYzAMQmqARomz95km72KEAe1eA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyveB++VU9KOr3imgDcoJg4AGqgtX1jgOxMzB5yOVQLJfRxKNro
 jMURfub1YeNnmG2YOE4gtkLgiz/T5Uu+142ybx/H6Zi1RlD0vzQExovV70kmIL8pEKEku6JAX+I
 q7e4rl8vWWyYsXvsbaxGed632QnzOvLgth22aovMf6SmjJZqSdZYQUnUN7u6UKoXw2YY=
X-Gm-Gg: ASbGnctHTT7veYjZTAehcOqXGGXreP7SXOXLdeoVIGd2o/j3p1jTeYzOLgOd0ohNneR
 9uVflZaZpNPR+6d7OyaadfR9tyrV3oXIHBTzNeaqg77zPxc+9Bfi5eFObw5HOqNANaMmJi4LpGv
 8sUmS2RSMhGSHWPLR+ulbcWhy+6f9O5TwTUPCTVWRh6N2eSFcCP5gBNe6RhvS0XI7ZvB8d5PDQ9
 ECZFB3B5jNp9JXHvm3E9SwmLPTyQD0FoMvDmuKz3acSZeQVW1gx7QJNrHk3uuItd0oXYBVNUjvo
 OyYb4oPeYagRgjpKOJO7IXO2yYA/QKmnTieHgvhl
X-Received: by 2002:a17:90b:35c3:b0:2ee:863e:9ffc with SMTP id
 98e67ed59e1d1-301d52c9d71mr3683779a91.21.1742462823706; 
 Thu, 20 Mar 2025 02:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpGvrH1EWOiqoFrxiYDGBjxuwdnasSg3FLzSkenBU4hTM8xFgoe/Rl+VzdbYGqcHraNoYMgw==
X-Received: by 2002:a17:90b:35c3:b0:2ee:863e:9ffc with SMTP id
 98e67ed59e1d1-301d52c9d71mr3683748a91.21.1742462823281; 
 Thu, 20 Mar 2025 02:27:03 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf575936sm3312292a91.4.2025.03.20.02.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 02:27:02 -0700 (PDT)
Message-ID: <09a4e15b-d951-48c9-9aeb-103b6b293a97@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 14:56:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dbdf68 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=98RdHtkJ8WjIMYe7nFEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7EpHeFhzGQDqEOg9r_oCQyOfOcmrGtX4
X-Proofpoint-ORIG-GUID: 7EpHeFhzGQDqEOg9r_oCQyOfOcmrGtX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200056
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



On 3/20/2025 2:44 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..80aa554b3042 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -28,7 +28,9 @@
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
>  #define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define GDSP0_DOMAIN_ID (5)
> +#define GDSP1_DOMAIN_ID (6)
> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -107,7 +109,9 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
> +						"sdsp", "cdsp",
> +						"cdsp1", "gdsp0",
> +						"gdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		break;
>  	case CDSP_DOMAIN_ID:
>  	case CDSP1_DOMAIN_ID:
> +	case GDSP0_DOMAIN_ID:
> +	case GDSP1_DOMAIN_ID:

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Thanks,
Ekansh

>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);

