Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB773AE6651
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9E10E5AB;
	Tue, 24 Jun 2025 13:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLqI/8z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383BD10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:27:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7JH3o019632
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3u59PIoZvajI4RoVnO03xO36
 HTQDU80w+BqZTeYpQYQ=; b=TLqI/8z+FS8sniZGFDD5/2pnt1Tq33q5N7/7z2qA
 +mqr/gko6T/n7tOYGhvd0wqRfi74kpGme+ijFxp8iMXgyzkg8D3zqyEeIc9mLZuj
 bByJlwL+qr5Xx5CdQFNOQAbmVIF5rbZe8N6QkGaEtcLFm4obVdFYNZO21LY3r/85
 hEjmaa9A4fb1sSo14DENHrmoAONqdb2PWzGYRz5DkjtGMnG8xWATN2hefDk7Llqg
 aQOdBVpU5/Ad+aArYdf+lwxcFEwxqz9LAemF5NzJySWY+XPPUL3SvgxDOBMQvAOx
 5xomNEx0HRAn18+FJc1v52RIY7l0WWQaFtV8Fsy4dj/xmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmnw9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:27:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d400a4d4f2so66660185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750771645; x=1751376445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3u59PIoZvajI4RoVnO03xO36HTQDU80w+BqZTeYpQYQ=;
 b=V7foip7chrI0rDunICHwUoMTm8IY1zNG9u8vCPumNmgpGdyTBH83mwg80/FJvyg2aM
 mHEVWr1Ja9ZWs3xWqdbD/snFmF+y7TC2Pv7INAbxbMqsL0zp4roLahDcskQKnqtIoSPp
 pfD56AI7xTpBsG0D+7mq9O4ko3oFrHXT0Zuu4su3IhO1KAkVRKolv3O43SQLVdqhIHdB
 diaqi9nCJq9EOwWuOtPUwOgvThV0eXwD9h37NPmytslCLK5axoIHtHGsEPs525t836uC
 ZALDvC/Od6jX6pxXQYKJA3dFGPvBP+VOeLGzF1aCgtx8GHPIOOspH48jMLiT8JMjBglB
 NK2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV7XA0jkCvQ0VZUOCt3TQb71VnheTAK860U564lMn3TVMYwIjG5Z7OAbOjRvM90f6LOzcX6EneS1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1RLuBG2dcJqFcZ9QKxxJ3io1oyn3Cca07VVqW+ZXNt6raBZ2y
 1TmoWe/c8hCKriyMM0yf+DiQ9p+sqtVFKu7ffeE/+72bHLoma+mv3gsVwPyeuNCRszU598p09Lj
 yiXsJ8e0jcpRHZVIdGKnJb8p/ygAsSfc+J0MQGh/NbEgHvUFF3dQDdlvXKK/oh6gM26pHpck=
X-Gm-Gg: ASbGnctexOs60I9Zrs57mS+t50TdNnh44pljIsen2f3NC36btJQCw+rHQt1foSrf7n0
 LO018CQVj/j66+RiiDXjEdLv5bV5NG60vkQ8HRwp6m6uT/nZ0DRdgzk+q4Ugtc+uCjK5We8kMEp
 dhsN7DBPSVMyovjEJPBCb8EBy1yNDzoxLjaOSK9G5YN/GgvGZ9sWjl+dGC9AXGdP1eoHpCO5vcm
 FcRSbPyaLRf4DJDf1QueEj+1ZzLkhz9w6nkmagNYKQDrRIQ9jW3cGH44yiBRfqeUZkAc3P9+U9m
 EvXxKiFmIq+Dyw9MggMFBrpigfraKxjXu85Yuebr9slGoSLtUDBPYwKWU56uaGwjZMh7CUIh+CL
 pOjNbTEHgm33sZzFsGNGrbzfRuK00mhTleac=
X-Received: by 2002:a05:620a:3948:b0:7cd:2857:331c with SMTP id
 af79cd13be357-7d3f99391b4mr2099562985a.42.1750771644891; 
 Tue, 24 Jun 2025 06:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJohpmNgR/m6Bev2x4bpKCE4S9GH7jwNhU52tyVVzKiXQBuLrZ3zNs+xx5pc5YtD/I+Bl0Yg==
X-Received: by 2002:a05:620a:3948:b0:7cd:2857:331c with SMTP id
 af79cd13be357-7d3f99391b4mr2099557685a.42.1750771644210; 
 Tue, 24 Jun 2025 06:27:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41bc044sm1834507e87.107.2025.06.24.06.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 06:27:23 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:27:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: 8TEWyffyeLWgSWA_M_Gav16YQvWQ-sY0
X-Proofpoint-ORIG-GUID: 8TEWyffyeLWgSWA_M_Gav16YQvWQ-sY0
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685aa7be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FrjfeDAZNqR-H4J_opYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX/VqiTG2GjZPO
 Acucw0ivE71Ek3KzzKqnGIMjMdSBXI3V0ri5WpNTtfV2zk9JspOQ6KvuSXImUe/XCbgF4RkPh6K
 u0EJ3iCe/lhST/2Fgyill2hBfBJOmo+EgjoDnfspwNgmyL3qf9l2NaBMTrAq2+dUECmfVAKZmLc
 cRWuRl7HBKxzZxZBO8cuzDcvUXrXipQNI+ASmgwb0xQf07IWDt1qjxhul+OUWHqFmJAkjd2ZDbl
 2jp0ERH34C/81i60atpQ/gOA2g8zdtMs4WZWty3faOsBa/hiL05fwSqtcPSFrHfbslvY4TX4PJk
 Ia5JJzHvTCLE/Knxi+VdqSPnemKniqEZ5uV2dNQBym7A3F7v89KlvcCCWB8f2YYFv6ougujszlA
 AK8FrquMKyLk17ff5Cl+rukH6rwvYk4d+dxYlw8Xy1DPJobnLQNSxTjwjh6k47gprzNY29AM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240113
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

On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> During rpmsg_probe, fastrpc device nodes are created first, then
> channel specific resources are initialized, followed by
> of_platform_populate, which triggers context bank probing. This
> sequence can cause issues as applications might open the device
> node before channel resources are initialized or the session is
> available, leading to problems. For example, spin_lock is initialized
> after the device node creation, but it is used in device_open,
> potentially before initialization. Move device registration after
> channel resource initialization in fastrpc_rpmsg_probe.

You've moved device init, however there is still a possibility for the
context devices to be created, but not bound to the driver (because all
the probings are async). I think instead we should drop the extra
platform driver layer and create and set up corresponding devices
manually. For example, see how it is handled in
host1x_memory_context_list_init(). That function uses iommu-maps, but we
can use OF nodes and iommus instead.

> 
> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Patch v1: https://lore.kernel.org/all/20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com/
> Changes in v2:
>   - Moved device registration after channel resource initialization
>     to resolve the problem.
>   - Modified commit text accordingly.
> 
>  drivers/misc/fastrpc.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..f9a2ab82d823 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2326,6 +2326,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  
> +	kref_init(&data->refcount);
> +
> +	dev_set_drvdata(&rpdev->dev, data);
> +	rdev->dma_mask = &data->dma_mask;
> +	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> +	INIT_LIST_HEAD(&data->users);
> +	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> +	spin_lock_init(&data->lock);
> +	idr_init(&data->ctx_idr);
> +	data->domain_id = domain_id;
> +	data->rpdev = rpdev;
> +
> +	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> +	if (err)
> +		goto err_free_data;
> +
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
> @@ -2353,22 +2369,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		goto err_free_data;
>  	}
>  
> -	kref_init(&data->refcount);
> -
> -	dev_set_drvdata(&rpdev->dev, data);
> -	rdev->dma_mask = &data->dma_mask;
> -	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> -	INIT_LIST_HEAD(&data->users);
> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> -	spin_lock_init(&data->lock);
> -	idr_init(&data->ctx_idr);
> -	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
> -
> -	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> -	if (err)
> -		goto err_deregister_fdev;
> -
>  	return 0;
>  
>  err_deregister_fdev:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
