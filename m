Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74BD1759C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E402310E471;
	Tue, 13 Jan 2026 08:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ot7v0qX9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQSrWmY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1C810E471
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:44:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5gogc3809325
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SSfL9ICBfCSpDCOpJyuLLrl8
 7JIetzK43KEuz7rgpKw=; b=Ot7v0qX9Mxqzx5nnDbp91s/mL/6Sgtd3185usp5C
 asOUfQiwqrQ75rzKnkBU4+8G/QgPHkVPkVIvPM7wPK3JOISzBJFQHRWP7MiFqWqT
 xva+kMEC9EMB3KMtCgBaf0iiBTmn2ZUi46cVvbqY/yzTIHgnc8hsdcLDuUhsi5t/
 t/AMfEA3PS+S7aX/BNJp8yAV2bb2rXNy51z01tel+9qRcKAWDlJX3Z2etS2BmF0C
 llGMqEvbZgI97ah/tO8PJHgQveHqI5pu9m3ZO/lEAJVQvvNjwCa7fCG2oK7Bqh3J
 Gxtj7OmUs7TMzrT/ItjoxpW3qpd5+H5WRSREdYwddUYGmg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55rh41-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:44:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-81ea3358dd3so2803356b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768293840; x=1768898640;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SSfL9ICBfCSpDCOpJyuLLrl87JIetzK43KEuz7rgpKw=;
 b=UQSrWmY8zNySI0sQHPUhSlkak1OXQRb5aH7mGZ7+izObjqhBFlZ5jkh4ixpBQeS9+J
 L5KgHywDHBhSMnRRTOVZOuAkmTIyDnGnR2GrD/S+N5LWbV4CcCoKU0Di9xlf5X6oiF6W
 mWCsbEmPd/p5jzI9ftPAAV9ayU+3afYM9eV5q46mJPpK4rIPW6IVdNG+L0TtPb7/0LjX
 f1mnRQ5AcYXGPbF2mLAymtCmHxgYLS5gcoU167pW1QyASEaadRriJlxG/9TzzxrYyjrM
 eVKx3dIb6RVJXia9Vwx99phaIKz/gosjrUcLqcpqsS+NIbr+jlO+qKL/Hc01UmfuzSuy
 AR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768293840; x=1768898640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSfL9ICBfCSpDCOpJyuLLrl87JIetzK43KEuz7rgpKw=;
 b=bw+5sUMtDL8SkVsbLZRXU/XEg0uOm68XXhCgf9kruA5pazlpA8ecGxU04XuirlxLsy
 3wtJr6rAz0a96/BSudPuDD3XEThAw1HD69L/aotk0v5kaqG7oEnitnIBJBuj4hBw3TKz
 aYACOn7UX7wzy2vr0QIV4cOcFeQZ9AvILY0lMdwi37QsYCWZgfVG8eeNT6MEm/jNl7St
 9hzFEY6pLQwqUpY7ijlF1l4GuhOgA9yrwkStXQ731U/xpKr79ytLxWEAlm4tLoPNtKp/
 sKGy23CbgxBfbd7h1hEQWhFqopbfLgbpTw4PoX2NftyrQS61d5zyN5uWHfuByV1cM0FL
 kOvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdWu4f2v0aC2yyymIstt55yIGITY7uSUhHk0meeoH7HlKezMqtlfyGfIn+ReBn5oFN3/ZRphlq4IQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvbdXlc6P3kQPyFtgapib+9Z5oMB9/NyGVeOQ5iPbhVTdf8Y5N
 fwcW0VdrjQvFXZWfQMW2+pmXeMfgoWsJfsuzKw10YBvSoyT2RpE2xLAOwcLdjyNn5bxueiZr9Ye
 kP1aDn022Zi2J58pfzYB7Mqc4OHPu85xvIgVcywMWU5uqvQYB0bRw9x9iPhsgw1+TMUJWqws=
X-Gm-Gg: AY/fxX60m4ghWFjeQVxTS0lgnlrs0xsJZI3Fi42sfHYu/iRdUeTHyBfDoMNO1Zx4mgK
 R5skkH1WVDphx5Pi6kDRJXn9mXbQir5ZrLhDG2uHf5YFQXz6pOjPfEBN49aaK99zK8xPbxJj/0l
 8FFJQh0HOwAGuP9e5Rfh0a2tO888SGeBeL9d1lK1gZ8vf7PCdcnA8SszakYZWjjOq7G3UP33IWJ
 TfjrtUVSewJodERmfRs6vPQQY22esV6j4bK1zDeyG4qJUl4JQASvNFO33kiuwggSb5J9unlIrF4
 4/zM3TRQSOle2kUE8j0b3+pG8tWqlx6c9DTXdM2sDb0wVFy6zuf8CDe7UwoRg8OG8pUDxJQBzkR
 sTFcuE+UIqxcL7pcfbSvaqmcENSXdfU8FxJwr
X-Received: by 2002:a05:6a00:94fd:b0:81f:3cd5:2066 with SMTP id
 d2e1a72fcca58-81f3cd52284mr8893385b3a.12.1768293839681; 
 Tue, 13 Jan 2026 00:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwu0RiBrcms1pegxhXPtm1CZdb8qDsriD0Lx+THrWCc8/R6TXWe2R3CrhCEP8AM7UKizOE9g==
X-Received: by 2002:a05:6a00:94fd:b0:81f:3cd5:2066 with SMTP id
 d2e1a72fcca58-81f3cd52284mr8893369b3a.12.1768293839075; 
 Tue, 13 Jan 2026 00:43:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f4433488esm7974764b3a.2.2026.01.13.00.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 00:43:58 -0800 (PST)
Date: Tue, 13 Jan 2026 14:13:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
References: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
X-Proofpoint-GUID: S82Eh68GHGHwEYP1TfbA4vXnnVRMxRHg
X-Proofpoint-ORIG-GUID: S82Eh68GHGHwEYP1TfbA4vXnnVRMxRHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3MiBTYWx0ZWRfX7TQWjozpc0p9
 p5/GaXiCM3MTUBIlas5HzHwjWWWGL97X/N290IgjjKXhoDtNTmKR2fpvNvaCVeNJEmmopQuWs7m
 bBXYKTnSsKNKNY8w8BoPzq4Vh0lXddWsANHB4rwa+lTg6Uze50bhMiHZZyrzaVM/9uNvezLMxCv
 fNd1yQ6hLm4HIeKUIDGFxwe0RoYE8H0VEMRuSsz5a8XRXWEGtYMFSfBFlzHuOnaUpgyRHpobnnZ
 2PbHM0kR816RGtQ4rxPNaFHBRPlBXKWNTEmehHcejlqAcs8NgtsMKXk3mhXxxWknfU/cHbLlL1w
 1BDADdTGbSNtujIr6mtVVgV6YrwN7VYuIcRgA097IXG9hVnD6VENajQVV8aqTX9nTHxFU5o80TX
 5WDSGSo2Vqj5e4CXqBZqL8O1h3IteoYXe0l6xgnflUEDtHbkPT3ISGRhAS+ueOo8s39Dy5+iE1W
 90HbmgXosWkL/d/qW0A==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=696605d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1pY1Vn1n3XNrJD7pH_IA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130072
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

On Tue, Jan 13, 2026 at 02:54:09PM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> ---
> 
> v3:
> - Add missing linux-kernel@vger.kernel.org to cc list.
> - Standarlize changelog placement/format.
> 
> v2:
> - Add Fixes: and Cc: stable tags.
> 
> Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u

v3:
 - ...
 - ..
 - Links to v2 : https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#m84a16b6d0f58e93c1f786ea04550681b23e79df4


v2:
 - ..
 - ..
 - Link to v1: ...

You could even use b4..


>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index fb3b54e05928..cbb12db110b3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		if (!err) {
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);

Fix the alignment to previous line '(' like you did for dev_err(), I know this file lacks it,
but that does not mean we should repeat it.


> +			if (err) {
> +				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> +					res.start, resource_size(&res), err);
> +				goto err_free_data;
> +			}
>  		}

With the above change.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>  
>  	}
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha
