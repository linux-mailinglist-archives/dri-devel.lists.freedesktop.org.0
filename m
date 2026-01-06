Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AEACF6845
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 03:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB310E1B9;
	Tue,  6 Jan 2026 02:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGrSNGrz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BawipjF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DEA10E1B9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 02:51:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060nEH42726017
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 02:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GHHGJwQBYKBT8QMPNRVU2nM+
 FeolExizmBIHcVzSd00=; b=cGrSNGrzscWbqqJKKOW8aDFYtcE3sv8B3K968WQJ
 rK535bho3ud7SOTtjp14BKGCnIT9LwxgFyADTet1fCbSaaoaFi7HPUb0R/DebSZ7
 NkQ8wi8CxGMCEu4ZPd8fX5wxiNnKxVshxE7nho5LUQGK0ahgvN7svy5GQDCKE0PL
 Yy10FuvysfL96k90p+LyjiMnFNJ7ZkbuAyIsqa0Lzk+csap5djg0DEyHPotS2aQ6
 M2/H+sVCXbYFnMdFZ2B+2PmB3747EauvFXmv/nUTjjYHX1fJGn92/gWSdi3lIpJJ
 fU+eZQbfNiKwTkoKMAffXfefMN0GHYpINKEbKtVXTirWNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9rf1n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 02:51:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0488e746so12496461cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767667882; x=1768272682;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GHHGJwQBYKBT8QMPNRVU2nM+FeolExizmBIHcVzSd00=;
 b=BawipjF1bD41YhK4JmxsGcmWlE5bVLOSmck9blNKhC4baVhUiX2edb9OINBjgR9YOn
 ouqh4nlHgHRgCyDXQrrsvPAyHQ+23csTrIN5ZVDtRG+5Uw6GvHAS98o73/GwoIo5oGGX
 mER2JVcq5SGQS+NLRaIPqGWMw24lhhRILqar5wkcxxPXQT7p+a0ZccTfmz5e8nU9hOUV
 JLlFmNjVeJgpFsmioy8OqdcY9m6ojjWA89p+Fc1xPuU2YQh62sPMadppmY10bZdFUbef
 RIJDxdP8DCr8mciB6mn+9gP/OwTC0uJlGG1mC0OfSWYC+zzZPj7unAd5lMlpuerrhDmq
 0FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767667882; x=1768272682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHHGJwQBYKBT8QMPNRVU2nM+FeolExizmBIHcVzSd00=;
 b=cZBTbcNpo6hm86W/mKPHSLeQ7GQnnLqV+DDVinXqb6aXuupFbVxVjg5djXySUKdwLy
 cFaJHX0u7khlp2ukX/Q/LHadNUk2ak1px3eaIo3GcmrnH4FinaP+G0wPFVRa4maXng6a
 SPUEK79IRjCaEjfcIgvDhKKnDDIYwDKcjfOP5bYoZV6vic3rmsiHDGvf3SAAKcWt8p1I
 mcBGCvBLmKmG0sQVtRt6YEtn6QMDfl2sUa48v2B2uClM02rRqFP1M/oFqp1oMUVsoXBZ
 5DdltJ1RB9ghn/TOYwWWleColfVRzMSdkDpTseh/vb+v6aGF5k6grRWLxVdEvjicrV8C
 xe/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs4AM4QwJrnIABKwCK1HUDQKaZlhsxSL6XlwUzcs4PznwQk01KV/7u9gEuQX0JfLARYTRQivsSFB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMvECPk/8SQNHFWMpGBWr1CSUFyw9Xj3LpdVeWMaTySIRlTig6
 RbwhZvK57AVtdaRNptgxuaxgUXivCcOYq18kEAe1whI7Gr7haDS2W54/9PWyq/ewvtez+zKkRZZ
 pG4Nw3qZygtG2bulJouMlQZL/awO9jGEB8UKD3FHNsjqJKo+1QsByVwEJRx3hUFl8+rWj9Xg=
X-Gm-Gg: AY/fxX6z3iG/1NjVAnQfEBKh5qj1ZWgyZFOTM5oLztKnp4KDUG/dij44GyErEFuRbHF
 4e7lIKk845QUTXb3VD+WP1TXZBqgDChu24G0Pk3gtX6yY5Up0cjWJ6TtMAl8zNb7z38YvuGWwb/
 8cIlF/VDBnkX6W8m8EGlDB835EgRTKgjaTn+XC7WTLrBTaPo0da6T3kGrJ7fqvoJAAKJAUniSLr
 cU0Nh88wUdL8hH4KYg0ifbif9bbiHoDOD+tFjuUE/HhWvRCe3G1ZVgDAmKNw3Pd6ywRZW6lfV6r
 ad6plbW/jCajQGPTYccCAuJcChdTigH04QtfdlcxWz3WVtaxhlJwqNeTonccGfvyI2VLPuFQnrE
 K7tg410Ep/W7T4SExRfIy8dIdmeaAtvU8tVRR/H5cDr2MvSERSsHSbk/uI6M63E+Alosbs/W0wM
 jd8M5NxoiICDIEBDkmJMe2A4Y=
X-Received: by 2002:a05:622a:15c6:b0:4ed:a8e0:13c2 with SMTP id
 d75a77b69052e-4ffa840f4bemr17259691cf.10.1767667882093; 
 Mon, 05 Jan 2026 18:51:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlAVTAlS1sCEpDNlZqWgZxacKqAI2JL4ZwLUyA/sFDbGnCpD13jiv9GuxWEVQItfeZS7KbdA==
X-Received: by 2002:a05:622a:15c6:b0:4ed:a8e0:13c2 with SMTP id
 d75a77b69052e-4ffa840f4bemr17259501cf.10.1767667881673; 
 Mon, 05 Jan 2026 18:51:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d68df9sm228572e87.72.2026.01.05.18.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:51:19 -0800 (PST)
Date: Tue, 6 Jan 2026 04:51:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ogpbOkp21QKElBHSDaojJrIf_u-7S3bj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfXxTrqWP1uUko1
 2BAulBC2UfDeZEk2jppVEdn6VFkjN7eWQvFIuDU9qGZNTkG33z4MG9QqhKO2V/CgSNkzaBvPyDg
 51wA8I3V+QG89BIMyaIQU/q0oX/p+9CYhH1dVvlguaBouXZyUaSYEKYhbxFHx4hrWCfi2urCyRb
 boey4egpvdX+Zz5ssPsH5XNzZRoxE75n3JPnte3G3FIrAd4277IcIboglTyTqlHZvtmIXAROttK
 YS+mUgOBNqIlyS+WGvS/hXNzwAVySzDg8pg+529ibgRBOfStZD9FLxnq2l8Cw6gqizw3/wSQhnl
 WW7b11jQbWzZUnXKulei+Lh73L4cUC4wbFQZoS27Dnr0u8VPjV3HwYS1ki9PwH1bm9xj4JXNwB8
 E/Fr8vOf68KYJH/PjdegpcjQl4dxPDwX2nqYdqKQgjjuK/G72vrPrJpwtczme94ocTA0BgRkHbp
 3kovIvJmnMVY7Vq98+A==
X-Proofpoint-GUID: ogpbOkp21QKElBHSDaojJrIf_u-7S3bj
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695c78aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1JIYHknd9OP_1O8iUoQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060023
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

On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> Currently, FastRPC only supports mapping buffers allocated by the
> kernel. This limits flexibility for applications that allocate memory
> in userspace using rpcmem or DMABUF and need to share it with the DSP.

Hmm, for DMABUF we need _import_ support rather than support for mapping
of userspace-allocated buffers.

> Add support for mapping and unmapping userspace-allocated buffers to
> the DSP through SMMU. This includes handling map requests for rpcmem
> and DMABUF-backed memory and providing corresponding unmap
> functionality.

For me this definitely looks like a step back. For drm/accel we are
going to have GEM-managed buffers only. Why do we need to handle
userspace-allocated buffers here?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 86 insertions(+), 11 deletions(-)
> 
> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>  	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> +				  struct fastrpc_req_mmap req,
> +				  char __user *argp)
>  {
> -	struct fastrpc_req_mmap req;
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
>  	int err;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +	if (err) {
> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +		return err;
> +	}
> +
> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +				  req.vaddrin, &raddr);
> +	if (err)
> +		goto err_invoke;
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
> +	/* update the buffer to be able to deallocate the memory on the DSP */
> +	map->raddr = (u64)raddr;

Which type are you converting? And why?

>  
> -		return -EINVAL;
> +	/* let the client know the address to use */
> +	req.vaddrout = raddr;
> +	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
> +		(void *)(unsigned long)map->raddr, map->size);
> +
> +	if (copy_to_user(argp, &req, sizeof(req))) {
> +		err = -EFAULT;
> +		goto err_copy;
>  	}
>  
> -	err = fastrpc_req_buf_alloc(fl, req, argp);
> +	return 0;
> +err_copy:
> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +err_invoke:
> +	fastrpc_map_put(map);
>  
>  	return err;
>  }
>  
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_req_mmap req;
> +	int err;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {

Side note: why are these flags not defined in the uABI header?

> +		err = fastrpc_req_buf_alloc(fl, req, argp);
> +		if (err)
> +			return err;

-- 
With best wishes
Dmitry
