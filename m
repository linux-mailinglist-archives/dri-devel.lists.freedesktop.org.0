Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC857ABBAF4
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408010E088;
	Mon, 19 May 2025 10:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I88qamZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92210E088
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:20:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9V1c4023798
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sPwyK39sDTMLD4twLBZ//j7C
 xo/mx4DMhhOo4sCd3q4=; b=I88qamZWXnoGBESmVkz8Gv+pV4Tqq7rG+rICYEGl
 YG89p+c1OPQ5I0MXSFEr87UkklLsCayZdAfVqzcTerxHC9pxBjUXKULomI1h79vf
 90vlTRauPkIUZOThhtOOZFjSfk6KeNG6CIte9pGWoSBhYAzYP/b/q/ZMAHuEj/C1
 6PxMMTg7ICfWXcPdvlWWOuCtHNGkdyZfwlQsIbeiXdJLwMfcXE3l/HFwdW9MchP8
 AiiDlwk6F1LNEQpskePsoeXeVUSYBGAV2FiWOASlBA12Hs88TCVhbx3CBRcqD/Jz
 Pkr+GKUu4848Iq5NCBIgms/mjJ+N/O2RGB7LbPqJdHu+Jg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsuy2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:20:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c8a36d8eso36478806d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747650051; x=1748254851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPwyK39sDTMLD4twLBZ//j7Cxo/mx4DMhhOo4sCd3q4=;
 b=C3MIcxLvD/bQhbTujF8SpcjpVQDdt64JR9o85h4cwVBnxDN4Ny5gP00+KwF4jcd1ef
 j+tuZP1m9KkmyhX9UYsPXBkSad0wIiS38+WhLVV0ef3Gemxl97uSYTeVmGq55qIhHhQ9
 WHS5PcU0hBvSmw8TodduNfmbj5eVOx2vcchutjHzOu/7IZI5bNnDTbwb9wyIqZItLWHl
 FUK/t+716cPksBhvFCQcUZfIgKDtBkB0t4NSiiVg5qPfI9FEGmopLKWEo5vb5RgSqdgz
 NyR03X//R7VLPqke3L+g2ww1F3kCUmgRaMtY67KWHmz8rJF+heNR9ymMhQXZS1cp8zxz
 Ogag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1tGeFToWlJ9ZmihYlV+AflyarYVr7TzN6uCtzVfLCLTmmKMv3fy1+bbjKNkJEQEvkgiKiPIsxFTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyu8QwEa6jqF8yrqHiiCXbxSJnxp1OxjwQujSN9aEHTkHvsaHW
 sHvQ9BfWr4Ji76ExVs/Ox76Jx0Qsm9QNBFfQ/IG9epsELapmkge3oJXiXv/ByWIXsypGvNvcKBZ
 B0ah/Inx2gAfjT0t5w+o56X+8wy6PisIxtnLKtFbNZ+gWgJPVd3B0ykMA3zY4q/HeK7KIqrs=
X-Gm-Gg: ASbGnctJJw8hT8KLrqbBuVZu5x1HV/IKVjafhQpxizizACBEixhAAxhbz35ranimei8
 yZdve1NMJrQfQF+dfc9fagXV0dLF2CZjCGdmxNF4+fQbryh2vv1zPeJ+XgoHf2B0n8rHYyKBprR
 R5LqXLEodO62t44zJYDt9yawegnV4mX9cJMul+kRD1ZiIVP8MZlcWL0yYrjtVZ/GhZH/yI/syEw
 aqAy/HVn49WGW6nbE8aBSws+Ktr6ZSsfUSrcASFI+IPvs5LLgObG6IMP6WacpUY8RzxVmA9p2Z2
 gFbnfqkj+jIt8TxClJ6nnFNfeGDOJiVts8zdMUbyXVuaapuxaBG0ZFeZqdULEzbWSRMjyPsVNh0
 =
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id
 6a1803df08f44-6f8b0828750mr180263976d6.6.1747650051146; 
 Mon, 19 May 2025 03:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsVvtjo6VvNc3AKQKfBDpd+J2FzF8slDNDduoHLwnkx6TF4g3NIsGp3T8wTD6DkTaBpdegXw==
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id
 6a1803df08f44-6f8b0828750mr180263416d6.6.1747650050475; 
 Mon, 19 May 2025 03:20:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-551f8493043sm94843e87.210.2025.05.19.03.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:20:49 -0700 (PDT)
Date: Mon, 19 May 2025 13:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TTTu6jIS9y_QAmNKGdupQgzMbBvvLWrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5OCBTYWx0ZWRfXzOd6Z4hbu07F
 7E8VWFBNhxkwFOWKT5UAFOuRHM0tsAoEMOiUsonfKU/bJa7sYxhIQRHc00bAK7nA4yNixbss4wL
 erB7xic4UeytP0fFXSkWIRFjYq6KEe1C0uiLn8n1x+ws+ejYmhH0rv9W8R5HtW1UWKfUdZ8WCKR
 m8VdK0HCG1hMBjDjhmKP0/Q+Q7jmDVfuPdopyCiG9Mw9Hjs+SH/FK5Uq2ktCQiSAzw4g/BnImdj
 dbDlmPhonrvieBxdomshBw6nFc25+Xi3GRGB+38SU4etRdNpGiwCdrRAQsX/ebEKKIDdaFAdg/A
 Ve+84HhKfpIzlaKiK40TrS5YhQaXZoTUdeMrcivMuCVh0igxUl701sDIk/NFfUpCWtqqRWm20vB
 A03VCGfWWOVhFK8fZeObYTmcEMFo+qEGiZh4MpKE5M7T6yhOd4/LQ7akXxnI9gt7YyXBg50N
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0604 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TTTu6jIS9y_QAmNKGdupQgzMbBvvLWrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190098
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

On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before
> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index b629e24f00bc..d54368bf8c5c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
>  
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {

Cosmetics, please drop.

> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
> -

Please keep the empty line here, it improves readability.

> +err_copy:
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> +		list_del(&buf->node);
> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> +	} else {
> +		spin_lock(&fl->lock);
> +		list_del(&buf->node);
> +		spin_unlock(&fl->lock);
> +	}

Can we store the spinlock pointer in the struct fastrpc_buf instead?

>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
