Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E436B21DAE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4F10E594;
	Tue, 12 Aug 2025 05:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hs0Z0FEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAFD10E594
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:57:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKHC6R008308
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vEv5nCd5JEtL1flZjqEInCbJgZ550nvvo3TiB8HuuSY=; b=hs0Z0FEhvaOvvfTg
 NV0kSogdHRCrLxvFuNZaJ5QeOl/HDsOE4tFeC5N4lZI6AIQzHS4ISDd69sjoDuCH
 YqVJ5XD8A02rTJU0bFGdeH3o54BLSTUjbFHYsIrO9AvvnNFbFjtQv084D1VPWSHW
 NYg6ef+Hz1m1ZzTz5pHupxfRcAoGAaPKVtsnE8jasguIUEw0XyJYhlquiYEguz+F
 XgOw8Eeyq/cc90pQewknEB8HOiMzEEH0JdCHaornil0Ngm9x01gW/N06mgErmc0f
 vwFGrBgedkVIo9IwvDMPy2iCuy0QsXVTTqts+mrvLp6uPwi3AUsS4PcaS4kfQ8+w
 Z7RNiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjt5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:57:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23ffd934201so40766665ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978225; x=1755583025;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEv5nCd5JEtL1flZjqEInCbJgZ550nvvo3TiB8HuuSY=;
 b=krGoUQrNdGfrQpj3Pk17ET/idqWaOF3WWGVY+CCOeUbgwMTvFbV3eW/SsHhFxjJe5D
 zTsI1mcfvfl254odGTxYL7s2ZNs6TRuDyhqf7Gi7p29b6h5t27s2rRLHGOyHJ8RFa9nA
 OjGB6IKVQuQ8qiM/TOMixKg6F065F6SzhMUVIBVxEeuvdFwMoJrFDUCUPTPWqMxkdfw+
 DRUSrRIXNEzFGblHc09I1LKmm99u9EU8cCQzdrDBec0Yb53YqsWZ7LgT+SJwY56f2id8
 4OwNUEEBq/rNNljbnjQ+3664KaSkla7uhrj3PIA5roLbpceGK/hXhHWnk9JGM3NRGoRJ
 zr9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/rTVJO/3DbxdwQvxnrSbrE9fwO68vZhmP9QsimWxtITNmtYvfNhGDGQSAPFuMWtoEE1WqcEIG48I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznUK1ZmSBxWy1/9k/68Z7Vls+lMO5F77zwMTpkOpktVWPhpz8l
 MXynzsVCmNnDmna2PHv76FoCngdlj2+CXzvXoUX+FknDbKtCh/kmCiShXdCh84SihQx7E5vmfxd
 MQXQDbRxsVTLYSLx5tss2nvHqQv7welxDwPVO2X2jZxf7/8ypfsDq8zkhQ0oFT+H21kRk4nQ=
X-Gm-Gg: ASbGncscSUmvqEhHuzdV0b+XXjrs7Pg7dKnIopHxWSWIcYsMskUCR5r8XG9Pr4uj/Tp
 oqK4awPwo/j3juvLyNlDaLTvWuXmEG4v8641Fu3CKrXhHX+Te/mZMYj7wPJjr9iSCG/EnnXrOF0
 Rwtl977U9U3WNGB3HxA2XbK+6Za/LS7R2yR472qo46kqv/5X9X5mcfVxDdXFoj+vF1pYJcW5Q5B
 KAGUerZdiDIhQhTQH9BPg01Mgc1CuYr5ly14zB3yuF9Q/VRAIK6wB5PRy1dG1CEVqFIOa/eFZVO
 89HjkuU4U0NteegZqSW0PCLz2HnbxecatQ2v9RaSXeBVBMboL/mKlNgTw7840d2Z3FJuTds=
X-Received: by 2002:a17:902:e545:b0:240:7fcf:ced7 with SMTP id
 d9443c01a7336-242c20596c4mr261796385ad.21.1754978225067; 
 Mon, 11 Aug 2025 22:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERojaneRpqNViWbpvGH1a8gBIpXR0UabwcFfFfj0BA9yVPsYry01nCaz8ljkh4PoEkyna6A==
X-Received: by 2002:a17:902:e545:b0:240:7fcf:ced7 with SMTP id
 d9443c01a7336-242c20596c4mr261796045ad.21.1754978224580; 
 Mon, 11 Aug 2025 22:57:04 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2426dec66desm207795295ad.54.2025.08.11.22.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 22:57:04 -0700 (PDT)
Message-ID: <78b335f9-7f6d-415b-bf56-5e9dc2c38f3d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:26:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX0NsMQSUYK012
 m64E2wPo8ofRtFzv4kLtZ4LygjtjKqzxivlkvH36ZSDu4zsXi151G/To5OJi3FD2g1GwxLBMHIs
 KrRec0xRQAoiRJCinxtC5nXbSf5I/Yqq5BOL5g0Ca+xF8EIn84S988i6zKP466oVLcPY/VwOu5h
 2lGtcrkM+s4LJ/ZZXf5SpH1VTlXEt3AJ1rYmGQAmWXh8h9HwPho9iW8+LCWoV1UKqJ63qQIoepD
 10ZFbeAoiUKqFpNmzvVwh091ej6wiS68UyMbPHeFEHyHNjY044cEXGAnZcegnOJES1idJNJUm3C
 OYTJT/1cpYRI88OZVOWSrnDH77aLY2t60DX52LnIvc/1hjehiZ7npcN69jBmNTT79RVG5gZ//RO
 gjtQ8B5C
X-Proofpoint-GUID: Jnr8FuOjV7dJiZD-5EOAcKCrOuqNd4TN
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ad7b2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_YpjYfwp_6jjpJQCciMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Jnr8FuOjV7dJiZD-5EOAcKCrOuqNd4TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Domain ID in the uAPI is misleading. Remove checks and log messages
> related to 'domain' field in capability structure. Update UAPI to
> mark the field as unused.
>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 14 +-------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..495ac47e7f90 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1723,7 +1723,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	uint32_t attribute_id = cap->attribute_id;
>  	uint32_t *dsp_attributes;
>  	unsigned long flags;
> -	uint32_t domain = cap->domain;
>  	int err;
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -1741,7 +1740,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>  	if (err == DSP_UNSUPPORTED_API) {
>  		dev_info(&cctx->rpdev->dev,
> -			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
> +			 "Warning: DSP capabilities not supported\n");
>  		kfree(dsp_attributes);
>  		return -EOPNOTSUPP;
>  	} else if (err) {
> @@ -1769,17 +1768,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  		return  -EFAULT;
>  
>  	cap.capability = 0;
> -	if (cap.domain >= FASTRPC_DEV_MAX) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
> -			cap.domain, err);
> -		return -ECHRNG;
> -	}
> -
> -	/* Fastrpc Capablities does not support modem domain */
> -	if (cap.domain == MDSP_DOMAIN_ID) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
> -		return -ECHRNG;
> -	}
>  
>  	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>  		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..c6e2925f47e6 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
>  };
>  
>  struct fastrpc_ioctl_capability {
> -	__u32 domain;
> +	__u32 unused; /* deprecated, ignored by the kernel */
>  	__u32 attribute_id;
>  	__u32 capability;   /* dsp capability */
>  	__u32 reserved[4];

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


