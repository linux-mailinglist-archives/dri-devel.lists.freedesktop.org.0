Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE782D16DB8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 07:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9927B10E27B;
	Tue, 13 Jan 2026 06:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="irtCW/hu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7AFQ5Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2220710E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:36:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5asMj3636970
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B6Onfh0ZeWVdoiG4WKvPT0Vn
 n91OfwpSgrb+ahgty5k=; b=irtCW/hu7TKE2RYyrPnV7zA8aYC+ggQ/rosFGwTc
 GItQEDVOVJxenGv5bZ0AZ46Iy43KQI577fYwqKNEq0nYCe6u3gwy/Q2U3qYPz/Pm
 ltqHglXxeYgrLLw+N00Pk8VLat+m91ZIq/AO8eoZP/tcrdgzvhnFEsk662tWPZPz
 w32ebC1MXCvSgmnJjkn05JenQHmuKvl9IT6qjTRFtUctBVfhmO16Cq5TKL1dZvAG
 OAzZPwNamYoWxEtBphezV860OU9jHzdBHb7qr1SH02O/nbcYSg9A1EV4179AcB5t
 PmRSgUVWSLN7mhtF1PpIzx19CRl6XZebOcLF0HhimiONNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c05sx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:36:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0f4822f77so144124055ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768286184; x=1768890984;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B6Onfh0ZeWVdoiG4WKvPT0Vnn91OfwpSgrb+ahgty5k=;
 b=J7AFQ5SfWFJmVNtSnpL5YTL0m9iu5jD0I/X2ZyGsj8FfwTbmLdH25yFdwiCrZHXJId
 6y+Bxiqml91DTIUS9nWH5IAnuj92D7kCzxlixbY8IDk5v/IIMyRVRL7li2D2cb34dg9B
 YoWFdcY6AWV1Va9+NoUU5UFRZxYXfDdnGKyPo7YS0MnOR4hh8YAITbzUau/AofeIhSyr
 HcXWE0p6zE0ep12FOB46hP9AUdDRYu6WvtN+h6YRhaze3gk2jZrqQEZBPg3G/H55STw6
 S3cufZcoMnbnM96YWz15ucu38n6cunjEpfEm3DutqO63uyZ/LDOCms5xgO0o0GYD3nhi
 d3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768286184; x=1768890984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6Onfh0ZeWVdoiG4WKvPT0Vnn91OfwpSgrb+ahgty5k=;
 b=arS8NtH+BpvO3MQkE0M/nj1IHuFx2RnPOBF0YK5rKt8ToyY2p0GT7yFHUxlHa5uzxs
 0PFKg55kNOKM7u3MhgUQCZBLDVqGJvjv7nghWt9li/kSlQJbdzbt1DdWgLHTaZKqxRWp
 M+OTHxigLD2kocudBA5DfhsOe36YI1VYbqRJsojRAAdKhYDWQr6b/ieL8CouGLDXyIVj
 resXfYw97ZlLbqEvTAM/XhNDGrMgbXgOwqxDNlG8SHsvEOOT7vI2FEYOfW6Di9l0KK8M
 MCf4RTsQ71Zi+tmThigOYmRE7Q+oo3A/uEmCI4XwmzWsxib6zsN9H2aHDXBJAPXhJ8Gr
 YAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAMHcsaTMW9yS8RT4SCXWbv+ifBq+4mbh7yOV6a8oj+1kGab/VgWCNq163VA1mPTep1Ugu0whoH4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/AThbrNOeMVvPfTVQ6oGE0YFi6qfKD1jI3pmnnN0nU4Lr8wSq
 LUOIkQxhGklLy64SOqYr1R9f94tMpRLjpbz3NvjFmLVzz10YiRJn6ytYyPfTOsKLXcIf1zVtJak
 eIez8oTRwEIMNQSeTeDkw+Uoi1P/yqmdLk7qvxHEbqQi5JDlIdLMOkzcUR10fGC6mAViEckjcrQ
 05Es8=
X-Gm-Gg: AY/fxX5hrfqADl+xEK3A7nS9RSLP44tN4KZ5TZBk4uE11425hW8Cm0iTIV8RRCtfo3X
 7Xh4658myAtFEagSS/y61Q/aO0K2wRSGizprpkFvtrFUJ7HvDkj6Yd/jtUs9UHTsL/FBWM85lp5
 4j7mZYq1sRn9MlVzYfiPI9x1gP1+wd8LYiHNta+UYE6YQxO3LoQyW2dJaX2OEar1gd0Rvar0IWm
 mor10ZdJDh/buAJsn4HJ5J/BkNH5VtSEqgkvbNYSWZ/9ifYdBdakFT/65QD66virPxxZx3/dwI2
 u/lrEFS/vBwtcydo2g8/anLxUroA8iH1HRj2hdpoVxHNSJq6g3YrXor87kk7ub1AxQRE9kJF4xW
 DdQ3qU3huGzK1g408mTAmg04oGSqniYnxMUcK
X-Received: by 2002:a17:902:e552:b0:2a0:d33d:a8f0 with SMTP id
 d9443c01a7336-2a3ee4b2440mr174486125ad.50.1768286184399; 
 Mon, 12 Jan 2026 22:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHItfZsPFTEbLZbowJWgLdd3ZlvBosWUoMGGxVHDC9dbDCVCbwmem8tj+6GFFBOLnBlw37b4A==
X-Received: by 2002:a17:902:e552:b0:2a0:d33d:a8f0 with SMTP id
 d9443c01a7336-2a3ee4b2440mr174485895ad.50.1768286183850; 
 Mon, 12 Jan 2026 22:36:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a4f1sm186646175ad.8.2026.01.12.22.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 22:36:23 -0800 (PST)
Date: Tue, 13 Jan 2026 12:06:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
References: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MyBTYWx0ZWRfX50oK9pFnsugz
 /2gasPCGqfD8nyzjPqBW0JpTGb3/7nu2rRyRM7dgwryb/bcNIzdAVBVqvgJ8W3wuivpKjhBBJzP
 v/dMG0NL9kT6WjYGNk7fOl3JdFxWnoOPjBbgAZpn6Oxwt1+LAEnfwaDjo57h/HDTgbYs/gzjhgq
 gxxUe77diJhDarH1jB0UFdq7crybocV+tFvFQxRi/eLzLy07146xg9/Anq1TCLQKPEija6aVRh9
 8WLQgFRtNpI1Tebk7Zkmv6xcuywGh33MebxziJcHF6vcFlv49Rq++J2YxBDN86HDE0v6DG0Htxt
 Gdh7g5uVlklXtF8RkNsjgEAFeuD2VRFAW+8WeyN2qg6hkjQUaEkiC72ztBm0PV5qOGWyfKLVxGl
 ntLJ9FoJjjFvOQcCw3RehbdHQZXL+y2pqE6I2YFh6eiVrNOLm4SEKkuT7G4Tt0pso2nkFavn3r8
 6XdLGQ3K0CqNmW1Y2rg==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=6965e7e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=CfPS7sswJGtPsZrNj_8A:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: pXwUM7dpjf_oEop7_-6t7ZdAfK16XfXw
X-Proofpoint-ORIG-GUID: pXwUM7dpjf_oEop7_-6t7ZdAfK16XfXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130053
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

On Tue, Jan 13, 2026 at 10:38:39AM +0800, Xingjing Deng wrote:
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

I don't see the lkml mailing list as part of this patch.. please use
./scripts/get_maintainer.pl to collect all the necessary mailing list
and maintainers to be cc'd.

> 
> v2 changes:
> Add Fixes: and Cc: stable@vger.kernel.org.

Changelog should go below ---. Also include the link to the v1 in it.

> ---
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
> +			if (err) {
> +				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> +					res.start, resource_size(&res), err);
> +				goto err_free_data;
> +			}
>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha
