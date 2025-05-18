Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD90ABAFAD
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 13:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BD010E1DE;
	Sun, 18 May 2025 11:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCX+a5hj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87DC10E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:03:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7RThF012110
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=s7Zodl8u7V43jJfdZC59QA0w
 /oqjwY/2qontwKvBiL4=; b=hCX+a5hjc+O/br/Rtar7NXcE6lzauX3Tanqi7Ej8
 xfqDh3f97ksLoAjK9hhsgyNrqQmzrAWMHBHtAnIedBNbZE29CaruKf36zioACSSO
 IwPd9G4dYK2MlEhXrOQCpW1uhabTI9cy/X+x528AU9KVQoBisCnt0Fla4xK+Zc0u
 WgqWaab0HQSerutBpXX7CNXb3KyAevkjuPtj9/t08w7wov+7odVK1z1Rhkc2byWJ
 kDYp34VrUe6D97ztcPgeQ/MCufjwF0bkTFUdy0s0HnsSHPlJJTZ/VsV7+qPqB+P5
 hSEeiSoJtFWmdvVtzIIZJsDt10VgQD+/6cLW5HLb0BsXTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsw8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:03:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8b14d49a4so28505386d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 04:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747566209; x=1748171009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7Zodl8u7V43jJfdZC59QA0w/oqjwY/2qontwKvBiL4=;
 b=ogGN/H4mlq7Rd60qF7SvJ6iCYasU+o19ymeKMOzoXjtPNrz8G08r2ZiUANhjaWJrpg
 LsAznLwDsBzGCiUlcpA4B5R2O1wQrpsBTNGOqyQHYq2OZoFMXKXXNkRoLY/HoVK9MnJW
 xnEH4LyyUBVuJEFaAGWam7c85KJCqBfoZXQX9yZbmJKrvQX+fvGQGqt5zLM+kjHZN6mo
 Zi0LJfL/RejkC0Nsnd79K/QDnG+uNm6kjAkPMPXg1x/gcYpIJDNNWgiMLWfhAOiB/8My
 CU5jcsYAQELUFj7iv9t6ykwVh10/YUF0feY/VNapUdAcGUjPLSoGAB8octgCYyqr5NxC
 Rj9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmVYN9BGkUBpBHVFuw0UhFsE1Qc2utFqOe6xXKu8TbG48V8YhhLprFpwAm3KQr7jPSdHALBalkntg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bm8bv3i7H1J/tAROaCVQ4DkG+Nhv16HPiZwYxGFRcyLOJvgy
 yBKH/TyyvkX0FEGoepIsssuAT2qufyfFoPwEDR3mIc4dhOWwUzAyxZoiOwTejwM0ydqi6Em22bQ
 NY9utbGebNBDM+FkV0kY5Itv08bBCF61OCWOPzeekTeAkaMJIAzvtdqRs6zk80evW1gJpeMWJTM
 LXtqo=
X-Gm-Gg: ASbGncvHpoSMrBLxBkT3nsupAKPijG1aAJBcL4mix1U4rUxJhJppgcx6ebCQ927/54r
 HmWIUFtPdGh5a7zZlLrSA6uujKV56wYZI9HkLzJUjTr6rDXNP3iW95WWajWE2SxoyIglu871HNC
 PKR6qyIYVfFaiAWyE6THLa/j91DdJxacz99tsukTx5z2ojikjeAgLSHRV8Ld9NvrYRc9mHclCMN
 f231mdWOC9EmToXGCBcWYA6ns8MyA1+bi6t1UUM0r2ncyWFxdaEnd39AozSbIkArJK+2sTvEtMp
 MX5W7pCcy7I2ZQB5VCaU/7Nr5gCWHmVuF30cGOCxyXjmEz7J6v1RcD2t6VP+2z8cqe/9Fhyok4s
 =
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id
 6a1803df08f44-6f8b094a1b0mr164965696d6.37.1747566208733; 
 Sun, 18 May 2025 04:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX9KX+BFsa3NUoYxEGR8XyvRdKkf0qln6ioT3s6rTaHSqkLSqf3cbumVbWxdH5ju6b5bIE3A==
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id
 6a1803df08f44-6f8b094a1b0mr164965406d6.37.1747566208311; 
 Sun, 18 May 2025 04:03:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b46d8sm14286041fa.17.2025.05.18.04.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:03:27 -0700 (PDT)
Date: Sun, 18 May 2025 14:03:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: jce46qZuCbxZkt99CDoywMVl5ic91h2K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX19WktBwQhvOH
 TO/hmBFoXdUKz979B4IySpLmwMBrC+HAOGfZvMa2+X0gLwHm2h5uBIQtj/kmyet2I2tYRH3ygjV
 2eATPKz4VsPTn0mkudhK/ocn9xQB6TjOAshoG9TVFATNHMUpkqPQ0e6X1qvamAdRUV+dvhM3xhF
 SPhlPGCEPV+wTI/dKfmXFDevDUi4PH2KXkyCLoyMQfPhvrza0udZgA3lpBmHZ+j7+Zo7AQvo/u3
 Kk5q2UWZR5m3ZmWf8sIjRSnkjvnayPCE0v+iAyKl4MNGDYyBIfqFglPaFFzZsLBKNVpoO9CF6FM
 rKyy7itS6UUYzgHQwBWv218c4/5gv4oRsZObNnRVz+XhIokd+/KH4CHwCY4nJvocoEwGJHP6QV6
 N/bO2ixtRVAqAbpUwN8a72gxvivPIwf4+ZKQ2I/ZhvVOjts33hBOxXqq28D3H3mg75IyJN1f
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829be81 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OHL9Fh2E-Su--KGKRvQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: jce46qZuCbxZkt99CDoywMVl5ic91h2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104
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

On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
> During rpmsg_probe, fastrpc device nodes are created first, then
> channel specific resources are initialized, followed by
> of_platform_populate, which triggers context bank probing. This
> sequence can cause issues as applications might open the device
> node before channel resources are initialized or the session is
> available, leading to problems. For example, spin_lock is initialized
> after the device node creation, but it is used in device_open,
> potentially before initialization. Add a check in device_open for
> rpdev and update rpdev at the end of rpmsg_probe to resources are
> available before applications allocate sessions.

Can we fix this by registering the device node after initializing
channel resources?

> 
> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..40c7fa048ba7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fdevice = miscdev_to_fdevice(filp->private_data);
>  	cctx = fdevice->cctx;
>  
> +	if (!cctx->rpdev)
> +		return -ENODEV;
> +
>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>  	if (!fl)
>  		return -ENOMEM;
> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	spin_lock_init(&data->lock);
>  	idr_init(&data->ctx_idr);
>  	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
>  
>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>  	if (err)
>  		goto populate_error;
>  
> +	data->rpdev = rpdev;
> +
>  	return 0;
>  
>  populate_error:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
