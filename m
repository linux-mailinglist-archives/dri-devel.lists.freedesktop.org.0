Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44055CBF9F6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970BA10E4BB;
	Mon, 15 Dec 2025 19:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA9815ys";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHtoYRs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E05110E275
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFGj3xm1824193
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=npDpDwwknv3Nv0rm7sBmaNw+
 jfUIH3g4Ct1bpwv9dlU=; b=kA9815ysSLA1IprbX75A0yvOCKefM2aPGJuEjxQ9
 vx1/1FaEDmAtdI7azSdkuWoz+F/VtpWt/fmUSr+39yvsBC+CKECROXbK1f+stRny
 FepD3eEovM0EW0e2exMPAOMLRdUU3VgT6E3Tzng6k3L4o0eRQPP7+824fU9mzaw7
 Ufkj67uCjH2B0qBe4czDrwdguO4EIjBfnO5ld7rgbA3lL15Ce0hMrmQEQvOTk5XO
 82ZsmuZf9L3ziNElyIXoJ1WNBzMwy0nSROg9xxvDN6174Zt6vYhm8LQyDiQMS0mx
 JuGtXIh1pw8/irv2680o32vpY8xvnBPChUl9Dng50mAFdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p4f0gb1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed7591799eso85736471cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765828746; x=1766433546;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
 b=RHtoYRs+rBtlgLQfIL0U+uPplWp+g6KjcsiOtJCnHGlwB0HcY5SM52RpiPZ3gyt0Jh
 wzzDD46dccs6LSbh0DIJaAgINlRssRSyr0Gpsrnghfh8k2U9x7Rc6YAVKqMaPvABddd2
 sgwYHOHMPmOJargKumWwdcFFsmT0oc8ho+YNNjqRM65sV05SYuaMqe8rBxA2ECWIJzfG
 GaP8Xmw4K0wh3LQdQB3fS2fcIPqSHwT/YHJu05bXVKvE/bCDDYQVjpJBN+YJo2y0ltn6
 NqVuGovwWQU5fPH8zBzK7i/Qc0TTA4FH5cLe9bEj7yZVVFJW90Gz6tl3X+CUDt/xkwfc
 oTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828746; x=1766433546;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
 b=Cfkj8QYJrCdBkdOgRcEARMhmyaHker4SIgU2P9sGoyj2ZBxAMCevIa+Qt/BV5dE76W
 Udvpn0Sg9tSgF1NUBsymk1GYH2xqHG9+lUdswjPArNSCdI25JGCMjP+71RLTRgE6hHKm
 wcsuNGF/8A8Az+qMKdWrLgS5DrQqm8tSTmhKvuwArNTeJxO3h8PgLQ694rjjIRKVLdho
 AusYwayP9RvxpEzqZlM6Z+sjW+TlJzeHEy3kAtMFjkoxAOOmlSe3EkRsF+3qbTs/zfan
 I6o2Ub0et55QJ7IAzYl77UZ4UHgRmHDJ1a9IT2gdPJGneAey4N5jyLxKuXqSYYKfsZg3
 itCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm51haJSLZPuxdl9rvcu3PJbxfvli7O84IkHlzaP2PWIYFHo3rEPPpw+2lIOQIk0VUwbUJmLHlFLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz38DzHW4v6hJIHtrGgGDwszvdcUZ8kz5W0b+lT1xEhCQ4UdwrI
 KgBoy+nBxENOnmvVUfUirTzSeeyOxN2KOOyFAMu4311Pw50OAgXfY3FiX2PjbeDF5AdOL3Rk+tL
 8oyhxGdrA6hJnlETC7lREvyH6YR8u8Ppw+bO9iddCCB3VLUL5B1P9QqzOvB7q068vzcAAzTA=
X-Gm-Gg: AY/fxX49QtkVoUyOMo/jsHTTBX68rvBD/eBxkt7HcG9aPo+G+5ZTEQ/4rIhMjkFOC22
 GYgskdyumBjdMQAR7eXgjgfKuNZDRd7JbpMI7Ve3Sety9IZ2wVcoJo9lA2J19Vpn4RzDt4L+Cur
 SYhor8AyysgjPdmMAr5EvbFcaI1F82PgQ9SHBoikL5JOHBH7zRtW7q9gGRRbYPzCn8h7zvYGfYY
 2yOoB25np4xQwi0BOqMF5EVkH8SlqmH46yd0EBc5k06eV7RUxXbIhIkHYcYdDl/137fxQiAsERv
 3uo92gYLRUo6uwVEHOVZFQjNbQJe9ZpbXLILqF2s+qr8fVwcuRpRy/JDIO9OzbNjaSXT6jpqSV3
 y6uWCpnIF631yMsIDTG0rN9yCjXippGLUyKAlY2yfmE2YRMavz7QwGHKZUbq7UVcenG1A6jbd0j
 90JIg+g6JE/L9a2aAF9vx7dmo=
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id
 d75a77b69052e-4f1d059e34amr158794691cf.47.1765828745799; 
 Mon, 15 Dec 2025 11:59:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElabcDphYCb71EoECRtI8s9ld2SxQ9xgj42DnlJMaZVGMuKd3guYQKxl5DIJz3IH+agPET2Q==
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id
 d75a77b69052e-4f1d059e34amr158794451cf.47.1765828745352; 
 Mon, 15 Dec 2025 11:59:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da503absm92224e87.60.2025.12.15.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:59:04 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <muo6zpkb6esy65ug6pd74xphl6inagleogexu454arngua334l@6rcfjeqyxnnz>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: 2AePEZ4FQizoJmxdqyI3eauq3MDJ9mJZ
X-Authority-Analysis: v=2.4 cv=OK8qHCaB c=1 sm=1 tr=0 ts=6940688a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FygwiVb8ID-HIxUyOxIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2AePEZ4FQizoJmxdqyI3eauq3MDJ9mJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfXz3p+y5xpfaCo
 C9qpe5/rU/RyyaPukHfFivDR1XIvwvOM8I8MtMFOLbHiku/2rxnYsQwgd8LBf7j/wgNfcWjkx1b
 0nlaMKBPn27QjOdMMocBhWPu/2M2uD0O98br9t5HppmjVw4CnaRFxCU0k26n0D59sNMag+ZqkcE
 47KEK5+XAY+o4Zjam/C5cWkUlyo3gT7K2k68wmN5gevo9FFNhMqyWmNARPTTD6RgymoRAX6h4Ni
 yUWdG9Wbv2aRMi9lyW/9GysHjJJgUejIh4yVSuFaVTUXn+hv5IEvbhe6fCXMpOjj3wb/N8xlTkQ
 6g18XoZWElG5QqORQHvtUxhLnHWtVyxXgJ7yMV65jxILXoMHT9YWBZFCp3YfAPZJ7lPlp4oBzOQ
 AASHcYIMJeKWbWPIhcG/9gIg0SY+1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150171
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

On Mon, Dec 15, 2025 at 04:38:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce

So, it is Kaanapali or kaanapali?

> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

-- 
With best wishes
Dmitry
