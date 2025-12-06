Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89CCA9ED9
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 03:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9910EBDE;
	Sat,  6 Dec 2025 02:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsqwB7CV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arfXGV/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250C110EBDD
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 02:31:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5L7WCv1416417
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 02:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZRtO3TYmHTQrUnXdt/8BxaRj
 1OPXEp1i7OmNj7Dvdos=; b=VsqwB7CVnCPvSGB5MuKH/57RREUQA4h8w2Nf9wou
 /G4OE78gMRQp4GXJU/GcPVLu2P+G0tfdu+WKpULAt9t178A9IiRXquuAnpFBG4QF
 9J6OhB39dDEsQTs3pqyqg4UQ5JxrIS1f2t6+VQcrfujXiVzMWB1ruEifBnogY5FO
 PM5bk4gIqwRWHVRkNsyARv8vbJiSVAS0PKc8nllhiBBfy3R3e8GvbJyOGOCp1LoB
 pH0pxUVbEcTplSHPcc5r33/GijOH68TLzssIykt0o64LNk6jYJ+pikLmBjG4w4L3
 b0adgPoheQNm4SaAfAP/ir7UBDX2bH3pw0As8StO3fuDOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av71kgk2p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 02:31:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8824f62b614so5086686d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 18:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764988274; x=1765593074;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRtO3TYmHTQrUnXdt/8BxaRj1OPXEp1i7OmNj7Dvdos=;
 b=arfXGV/dHn/rzI5YHwZjrgRic3difkqRbak0hCV/l+g7Z5DbSNhlykmmotp8NFWAdO
 doqwvhuKY2Y6+D9EwwX9jZYE7vGpOmcGLBnyaTxtYg/OY2K6AKBRt0gb9IySG4ewFiVS
 wN7ESxGFFB0YubSn5KT2Nh9vBkm9c5Uf2aaSnpvxRiDv6Ldxp0Kf9OFapJoooAhdmIKj
 agjk7CTbnXjnHgwAawLuU9lWe7yqvm158q+D9tO1Xzfz9PU448FI5TelGqRPzYuXJTKs
 FVE93ujH+ONN+MCMWfBcWwHj4SStJINhxI/O6r/NmXJcb5vbiJsGdInnoT7EZmdkw4tZ
 JHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764988274; x=1765593074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZRtO3TYmHTQrUnXdt/8BxaRj1OPXEp1i7OmNj7Dvdos=;
 b=Kg1maTSaYziQhs4ytqlWG7xN/BVsjqiqtr6wYQ91MimytNc3KMk3h1r3ytamPFdHm0
 VRY4yfBXKyLibwcuz9NH1i8PYyDTjvv5P6aGBhprFclYUtPS3ufnJY7k9qd0gjFREqIT
 NeLSPVD4B/P9J7mLqpzqTuM44mR2LDTUubZ6Svxz6eiKwCFgZOHuiBy2AQvWxah/Yxmr
 uhCPRjnvGXPMQaxoEJfpiiKH5V7BagZJCEMCyW5quoB3rEUqdjTfYHVmKsm6ZsjehfiU
 gxKL0hyHvKqiJM2AEQB0WuC+9zAItZFXzda5VvWcQ10NWAPVdYe9MqklNyyyUfaPZWgx
 TUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzXpB8nz+b7RiqbzdBqbSLknvKDvKUG0/06GYQKSJY3O29HXbD/5A0H07raK90FfnGY8A8zxeDNx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTLVEAGcowGZHp5FQrqikdWOD5oP8nvKA8bYJEJN/SMV1tBFuA
 d3i942Vp2KFJyP3umMO6IbnCqGZboOubuFjse56wgWCthVZTU7WOYFkAC5zrFgZ5joUvNcXnv7y
 jzKF0933RmDjlSxwCrvuml7m3f+YvDSazcMEpF5l9JRQXYbLlFUJixryX1lDzt7l7ENn/Cb8=
X-Gm-Gg: ASbGnct+9BCUPRBkVXH7H5vaSmzVezefIHdR11sEGAg6j3/Ke3fu9vv6mrrrQAcTR8n
 zkANOplC+HJtoHG8cNjTHY8tkG3Xp4TREmofzppd72aDc61uFiDSd8GHZsWwD8utuU41K4cETlX
 NnWAqtdWcj+x4AXnU5kcrm3tog8ATWMTVMiTMvLX+hsc2JIlR397J3YIkDFxLYOZPNLtdMHC3nF
 LaZJvVsbANj7uazB4gfrGRGZfpogRSmVn3sZDDbnF4VbRck8XD7FVuAHdpvgviSHj+91J96emPp
 asGjk7UmAT5+ZhjYKA0wVlYunql5CaU8UWuMoG0tsTP7UXkbjQ2W47w7cm96U0xt7w3Q+ox7Yu3
 vJcMDn7Wxgs/xPU2Kt1+IwDtI80v0J+w5/DK/N4DO1I4YgQw3YRF3X20u3PhkXhRonMqjTZ5ipb
 kKh66TVQYBTG6p1FlbXiRdGCw=
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id
 6a1803df08f44-8883db1bd75mr21755886d6.26.1764988274442; 
 Fri, 05 Dec 2025 18:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE04NAuZrnromDR9MbXM6eEIfNuiKMMl7Us1PS2BG+IPVypoFi0GdBxZkOLZlekK+UzNyC2TA==
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id
 6a1803df08f44-8883db1bd75mr21755486d6.26.1764988273934; 
 Fri, 05 Dec 2025 18:31:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597dfa1573asm473037e87.3.2025.12.05.18.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 18:31:13 -0800 (PST)
Date: Sat, 6 Dec 2025 04:31:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kirH-oEjQdiWZOL1X2PmGJPRITPZqVnl
X-Proofpoint-GUID: kirH-oEjQdiWZOL1X2PmGJPRITPZqVnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfX2PR/7zidY0BE
 vxT3cbPTX625YxpMU1sfav15iJrAZL0tDImxHAhtrdVJQQlzfdv2MVXruIZSya783hZX8mJXfMa
 gadp+SKw+0IC7OBuIjgIUOThoZ2LfdOzpo5+kle69dczbxF94LcnaB31iofEJOquxsUPgbavjb5
 RnUbgLe3KIMbkEcWEWhT/IZG+VJZE5NhCcw9XFVSiajSMV3cTXpDx+qWHW6WnQeblCkqRWbGimG
 zeRaAKz/FWNrRZktpsal+25qZddpo1PSyPD8Z1+oK6rwNLFCFA96oq6bwvWh+o3xnYsMODWEi8/
 YHdfcw0qgqibPB4jkC5AwkOSEE72Jl5knPC7PQz/ZOd9TrpHbrPan8uezaexe3QVCoSKmE5XyUB
 HTR/w6FdAgIvI1ofZlU2XHrvkofB4A==
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69339573 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BxukJQUEoHWD8WPs6VUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060017
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

On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA bits configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> it to 34-bit based on CDSP and OF matching on the fastrpc node.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 6a67daafeaa1..c5d2c426fcbc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
>  
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 dma_addr_bits_extended;

s/extended/cdsp/

> +	u32 dma_addr_bits_default;
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
> +	u32 dma_bits;
>  
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
> @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		return -ENOSPC;
>  	}
> +	dma_bits = cctx->soc_data->dma_addr_bits_default;
>  	sess = &cctx->session[cctx->sesscount++];
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);
>  
> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
> +
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>  		return rc;
>  	}
>  
> @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  
>  static const struct fastrpc_soc_data kaanapali_soc_data = {
>  	.sid_pos = 56,
> +	.dma_addr_bits_extended = 34,
> +	.dma_addr_bits_default = 32,
>  };
>  
>  static const struct fastrpc_soc_data default_soc_data = {
>  	.sid_pos = 32,
> +	.dma_addr_bits_extended = 32,
> +	.dma_addr_bits_default = 32,
>  };
>  
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
