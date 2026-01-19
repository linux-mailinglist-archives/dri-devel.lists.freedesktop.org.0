Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BAD3B443
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069710E4D6;
	Mon, 19 Jan 2026 17:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAI4Cnn6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYHYWfq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D2B10E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:29:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JEoShB2305826
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cV8tJ4VOfQyC/vAFW9In7k8q
 /tdaiC6cygzFt9PKp8k=; b=nAI4Cnn6yVv8KH1rdFR8QxxU1olsVCs10/3t9RYb
 bmcgg2O00epw4icbW84P1Uaf7POFL7Nx0woymM42B5J3vQUQgKLk58hEuHSMgnFn
 ACGK3XH0F8EsJ4Ago/xj/klm8nBppuR38raClWL8dGYFznr1y4XwpQu+pQqgnc3F
 yq0/fOjIcSryZ4U9NPyvC3SfhMAtbgRXqRpPJ4oJqFyn8RH/kJNmLnkp3ArJQRJZ
 nxj57BUl5yQk6/QScfwJgHH56KzBB6416QO+dfx3xgWZ/6iCbUpGswI2IGStirJE
 P5MstEGLT1XVT4h5R7pnGy+iyNoz5GdnkxxQ81/wUZQWKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8fyh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:29:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c5311864d9so962596785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768843745; x=1769448545;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cV8tJ4VOfQyC/vAFW9In7k8q/tdaiC6cygzFt9PKp8k=;
 b=DYHYWfq5HI8w+ovJkUJ2/+CgNdAvtd6fmo/D++Kk4LBqVsxFnjOoOkjKdQIT1pgyYb
 fWPJKTzJlfGpn8ZdojSi9Xzp1uSjYRN8Mto7nDFa/4umFRKUW92N2YPpK+PGbPFgZ1Ma
 q0IY/HUc1NY3ZVmYDdxicdcPHhhHGLxgiECTIUv7JCjXZrutRmmlstMrpi+0xu/zwg1Y
 gQx4wo2Gy9aFnzkl58gK1yk/50xC3BzpgB/2j1Gjf4VODiXTNckFNnLqaaxbNffl7DKn
 SsrM3m6J4GPXPXkdYtJcOxhpKOZ+Nrvv3nXExJy0Gagiwe5CRAEuuRbl5nqW01ZZRwz0
 zbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768843745; x=1769448545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cV8tJ4VOfQyC/vAFW9In7k8q/tdaiC6cygzFt9PKp8k=;
 b=OLX5Rgg008eGMnFtXjrlPq/UxUvzl/yR5R8VnDcWpO6mUyM9dvrfsLVj22PXHkChxP
 1jF1oPcizNZXi51TGzoR6qxo9q57JT+BIzV/f5btx3wJcDWpg9mXTTj1pEh9rF1NxkOB
 sTAdYqZUNWAo836rjvRnwQIhcKDMnsSIY0+4pcsZsxhmGBc7nI85fc9VQzNM9Af4qV3z
 9tjT9R40N6mVtIhgwhISKGFav2Bz+xY6Yc80bvp8RBhPIavdDuZg1exNbi2kL37c0v92
 f2LxAwfzIG+0wkoFOtQ3gO125kp6EMd18PBHnbyUSrygjC+EuGLinlxRqR9B+k9MMA7i
 SPvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZw9LwIUuAs8Etq2Y3i2EHjro1CepbaqfPxFr8IwUGf5oFYl8+BIcRjPM8Yf485yFV+1+9gteZD7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGQXD8QfZgfuGnjTb11GS5ccA2cichLFDyHMz0QO0hRL5wDOOB
 KtYjRcj4JrsJ/nozJmYYiK/7p1SPZAEXdpKv/7clGWjlRmKD1zTO2uB3OpiDd7uDQ5+th4TjIb2
 kMZ6UVWkQTeNMUH6GMJe1G1lHwsKspxZhJHhYqzqp/uTfsQmhxC1poijen2B2ve03RqygrLU=
X-Gm-Gg: AY/fxX4EAUqduDNTtKMuNHwgntcU57N8gPJODniP1ATPKCzMcKAGx0oeHV1fJtOfSS2
 XMnWgchR4AUzYTlEd+VftF04hcWQXn5xnMV2nDfIEL1bNGgci2/mYzWWT8PEEsTDT8I7g+2ZBXr
 jltO1QPpYZJdYRphNm0fgTlqIJ0Z4F46rFuBcXPGbkKXUmVSwibpduYY695xFXREHxjPL9AUfoB
 6UqK4hWLyrY54UDev+GsIq9DZ8W6NaqHLvVbHw6ScXwvjmS+/3PfwFK62ejLyOaFD6MFIooE9Lc
 aK4AMdXRYFJ9dh8Ys/WnOH+Ddq7AD5yOfER87LftbWvmD522y0Zubj0S567mGRC99RKSvXurPiE
 O13s0Xc9h6DWUmY22tENiaNHFeJH8TC3fqttEL/qhrjQk1qnKmB9eRBlY/q3LSgE2vNim3T75tN
 VQu9p/6/2Q++dgZ3O+6Hf3n5k=
X-Received: by 2002:a05:620a:3721:b0:8a2:234a:17be with SMTP id
 af79cd13be357-8c6a66dae86mr1644385485a.7.1768843744700; 
 Mon, 19 Jan 2026 09:29:04 -0800 (PST)
X-Received: by 2002:a05:620a:3721:b0:8a2:234a:17be with SMTP id
 af79cd13be357-8c6a66dae86mr1644383285a.7.1768843744203; 
 Mon, 19 Jan 2026 09:29:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e7aec2sm33530691fa.27.2026.01.19.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 09:29:03 -0800 (PST)
Date: Mon, 19 Jan 2026 19:29:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 06/15] drm/dp_tunnel: Switch private_obj
 initialization to atomic_create_state
Message-ID: <tqfyq5ifk5vl7ohdiknwhgo52quqdx53xxkv6v3vz7asij5wd3@sossiwqgcfa3>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-6-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-6-b931abe3a5e3@redhat.com>
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e69e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vMFjUNA49-k38Vn2ozAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hdFB41_L4DSvzRirwK1yp0aGnATHjCEt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0NCBTYWx0ZWRfX2g7b2Dhlnmx+
 t5RphcNedW0euphNKs4Ei6D1S8zoaCHbYu57AyIRu+ApizSf/eu0C/d/nLbYtdQytwfiRmBlFoq
 cQ3d1kgRYr6jjPwn1TE8ygWjNs8G2zj7wc2SjHIir8BCbTaocy31uBiYGBLYZUO2ml8ohjvbNLK
 W/5VCAOZUCE5PRpSvTAVL/wc4u1uHWNILOilI4d/MKPcqAx2ppuRkUhMWWHDN5QtE6wVMBC3FCu
 VLlByGotQ1/40APoHgHPOh9T37oPnNB5CwfPNEZGMCNHSVdHa7YFwe3W6KVIHOSwPriTMhMU4I4
 PI1TbVclVLq9hoX1AtYXT3gJ/n/qvYetFY4AXk5ZPbYjW4iWbAnNulFUq0A8/zPE0n6Yw8rSE4d
 cpxmo3nA1Ta63l1i34toFERDGW0MMK1kOJf8m5MBeccV4CU6CbNRNESMWsYN3nZ/XvY7k3gg3or
 qCIoG0gzVS5nIbzBv4w==
X-Proofpoint-GUID: hdFB41_L4DSvzRirwK1yp0aGnATHjCEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190144
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

On Mon, Jan 19, 2026 at 01:50:02PM +0100, Maxime Ripard wrote:
> The DP tunnel implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_tunnel.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
