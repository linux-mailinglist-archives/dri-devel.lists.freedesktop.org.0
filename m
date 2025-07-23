Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B265B0F134
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F8410E7AF;
	Wed, 23 Jul 2025 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1/Q8lel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BED10E12C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9TmGQ023489
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LEy+cd4XZeFNsCcKEQ8NGnzC
 xyrPqaqP08OMrM8m9/E=; b=Y1/Q8lelxaYHM9CS8hCLfOfC/sejyZRu/Dxaw2jJ
 RSNy+cchs6J90LtctQBth+U+2BGHsnG49Skhsl2l62LDgYfp6WTbFrMVKwIyuQx2
 5MC/PLU3SIYZz8ViUCBocs3O6sIRYaIdDZO4BMtnrLqiYNHPicHtyseQCyHr/IKK
 DPgyieLj/j4Vxx70j1K57/N4+p2tp34640qRP8X9Rzfk6HgYD4QqI+pyfy0mVVz3
 W3UpLIa5/oVd72s9LENFDcgLx+NH3WOckYKMmblhNdzTPTgOzJp8ze4pl4CxwPxu
 Tcxy1aaowmU0rRAShauvgGZ1P6XFzne/iW4YS0q8yEFuKw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ubgmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5315bdd800cso1358984e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753270264; x=1753875064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEy+cd4XZeFNsCcKEQ8NGnzCxyrPqaqP08OMrM8m9/E=;
 b=R6DBKX3mSo1tw4jJZV+xREJNwgKDL3UHvOEmO4TrPFBeC3lzs8QLLH0xAUeIqcCHL7
 y3hKBTajqqSeUwPPrZ74nQOTbZ5KXDpwshJUfx0Ct/5Erran+IAFPOFCVhGVCEX86BvX
 Ih0EKIAfi23BuklQ2W6L+twzGIfBuqnXCCruSMgMuDEqTd+Yd+EQODbk+aqWB7H/X+oU
 pFxd6bmlHBBcUKgg+3oQLTlproC6IAQz55zo+XlTpDFheVG5pP6eBNB4NOdD9Pm+QegD
 xdRKzCW3rPm3F4yLYyC/wvGQ0wRAd3DMtx+fqHnne9TD0cyzhkpcy3biwUI6NKurnR+y
 Nlxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTyxC4fBOhSONGPcKVV29UVuHM7LApGJniwCqMMkhM695dKW6DwH56MoN50+gYx4+xKlpVvmNyDGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweQgUft9TY06CGAGem16t32Ao83406SmC4yQxL0n+2pZvq8mkY
 LfMyCdVzjU9uWOF4rtzgw+svyIdi5008JYGDCYtFk30LvP9HaCs1LnK6iZnSIdiLqXGis6i9YZK
 3bzkZ7cq6DkShLVffFrf3mCLXloRnVj3Q5mhRJ9pO+FQvoZeMW3TERI0oIbaavZztpCrI8Sw=
X-Gm-Gg: ASbGncssmrI2GAAI+5blS4uHwVEUMsvWgVMw4kDzGgNNSvAc0X9Ko7k2xzwezhgOpNW
 uheAUsIVKHe/8mcuXUMDGqtUCS+Rchs5+JLzdHpH+rXsFuhKq1QTNqkbnjOphkQiZ0DugeKR7Mk
 9wtYYfwXXqgeED7L7bREPZaYLuCcYmIJFS2u9XDH59sRaAQYFTmzJzTy1yZ6W7wtV3zohMgyAhb
 gCQ4ZD1LsYF0V+Nf3KzEHdwYNEVWbC9cPE/BhBa0ogFYM9sWBwQ9fJbXKxp50w9o2FYokGb6nKg
 oLY8oBBULT5FrehIhv3WlyeIaSSIEC95cZwxWTULSrOT7XfeDNeJHaieKGnQgn4iQcP8qoWnKK+
 wpFoSicYbivwJ1/3zQSP1lGMRTnb/TWDsZoxVFlRjtLmHVikeiX3u
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4fa14ff205amr839603137.2.1753270264477; 
 Wed, 23 Jul 2025 04:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElI+nLaRgSNGVDgEVXqwotYLUYVXhaufngd/MK3e1G8/fbHHtEjIQSDAJaJfnpO2XvBgiojA==
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4fa14ff205amr839574137.2.1753270263645; 
 Wed, 23 Jul 2025 04:31:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d92160sm2268566e87.162.2025.07.23.04.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:31:02 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH -resend] drm/msm: use dev_fwnode()
Message-ID: <6newddw6tnus7yhzd4d2sin7czbr5x77qdhlxwpjuulnq27jxq@vfntrc6tffit>
References: <20250723055512.1800438-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723055512.1800438-1-jirislaby@kernel.org>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880c7f9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-sS6WOwEsJUFamFQ3l4A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX935BeucbYpL7
 Vc6IndTJzmQuh0rWcW0nvoqdRhF4LfkY+y+6pyVr/rwfyt+u3IKWvbb1zMYHS3AbL8zICETjsRN
 lvS2iml82/Tr92c32sX80QQ5T41uDcpbbDFZGo7X8ShcUgOiz3jCkQfS1UAFogasbDKGBU7v64p
 ypSgm+6f9gw4JaCTcQ83wlGgBoHNW7vecq6O7IeDHLBFPeg1O04Hs7nDNyFtMg921mDzZYQJD9M
 qlStZIV2cAInQv3WYLDkN9SnON+SMS/F4rj7CFpIvrPxUPE/ANKq2fJSnh6ReiOS75fx1dBsCKy
 QVWqynre0XAARbCkSMbfXaM2/9mDhX0MqbGGI9e0R9zI+Jd5O9ySs0WvvBW5gQUFkW+/LgCty8b
 dT9TW+VxIH++y92i54ti599iUT3h+prHon3hY4YZmTkAGZKpmgY3rUN9pEIiiztLANHR9nRY
X-Proofpoint-ORIG-GUID: VduqRqwmDqM6GY0sl8yWGa7E84TXb2gS
X-Proofpoint-GUID: VduqRqwmDqM6GY0sl8yWGa7E84TXb2gS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=844 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230097
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

On Wed, Jul 23, 2025 at 07:55:12AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> 
> ---
> 
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
