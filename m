Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA5B44A8E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9910E288;
	Thu,  4 Sep 2025 23:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qmme+sIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD9910E288
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:48:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IoPh6023000
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1hFrW2tCyaPS8qm9cBW3XS4K
 eJB96G/QpNSDirWrlko=; b=Qmme+sIohc8NdQu3MsiTwf41dHFazz/ksTqlhs07
 XAvg6aBe++8kBcViHxKjklyyuwVpi0vbnSsr1ZdGSPhegx/pgNOgRBRF45DQgjHv
 ytjELEWpLLoaKKSJMsWAzsPP38HO4Y+bJ9Tc8s1v9OD/SzJ+kFQV9YiA0b4z8Y3Q
 FHCqdIQ5UyrJy2ZaN3oWZ0Ygsxxss+31jZcymMiEortEsFvfEteRGtJ38syXW0Yu
 QPwqgpB13RMbrXnMN/UShR5yng6/xWgrpZrg2nXo5vjCHJs8FAcZHff1CN6/MxWr
 mqLd7A5MJ+n4CIBHA2+L3OWGQriinekWjMA0i9fW8Oh+ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esbpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:48:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3aac677e1so14852051cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757029709; x=1757634509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hFrW2tCyaPS8qm9cBW3XS4KeJB96G/QpNSDirWrlko=;
 b=VnfPUhK3YputxTvT1lUFmpjGrP4U7w9rM2CXcJcpgRVXGo5w9OQ8igzvo4DoGEGoUi
 3uZ/Ap8SiJY26N7hmkrbOdLtQH3ywRVMCJio5LBJ7QgKGOmSHIvfZWOfIjK68q5VV+1a
 qqULvfrOn0VftJ/+oKkzfnwd+fP+vp9YqXDWrTVQG824N0LiADvlgKolwjIKNxdGIBkI
 WKSF16Fi+ygoqQ6Wo4HaNTYJUMMqbvMdvU6m+HTOICYEU9gtKDTNuoPwg0jA/+GvYYbw
 dof70R75nF+xbQlV+1+hNf7+fkN5btk3i8oi7oavrTQmOZ8jcy0nZgWUFMHSH75jteds
 5v2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7J6uhIdUlCxR6Mw0IYZv+Z22WrRJAQkcY/7epSOPIMf6Fo4BL0CNy7cHfXx35CNCqzAla5wIPgY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT8HKdIHXVaNNJEL+Wgc3Jw2t4YQM2AVTfoKAzRq/sPwzZ+npm
 83n0acu6jPjQbfXuSBXw38zJ9fQ8selqlwvyK4jjFt7c4QkN+IsiyDrp1Q0MpcSQHD7IZSw+STl
 ir6aKmG8rHId+zGHA7r9s1WMfEJk5e+GUkUrDCIh/L9GoOmCn1V3dA/KH2f97ZeSpWHICPfM=
X-Gm-Gg: ASbGncsvEmXpgo3ZhZ2NYuXJZk/O73B1FN00Eqr9eb7fSYkw4MMagVt6wjr1UxUF0G1
 UxU6ZXhB0LS4UnSUxOR9P/tRcxIZLgvtGj3UDDSi86ZJ/C9x+QQJ9vyrEbmSFFUwReOoy2T+fnj
 YZurz68EBaIQEo14jsQsQADnfhqhf2aSFK5cMoS4FYf8hhrRBAJpX64UcQ7OV/lRqPMW2U41l7D
 i4TZ6u9LNblOjeRxa50g80rk5ueiZ7Otl/P5/K3XNjfVjuptbnfoC8X82sywhUxJigoFRRsTPsS
 0S3GiLjlD0nyUWRXbKeCG24gEyqa+kWizLbHWqeHDz55TJ10HRXvfriidL+ZH0kLqQIj9vKLzM3
 RsWZNqrJDwX7ALkLzlLjhSNpYno90eFpWf7vfa5qX3lOSHDaTDcuV
X-Received: by 2002:a05:6214:d89:b0:71d:9d4c:192a with SMTP id
 6a1803df08f44-71d9d4c3057mr102311246d6.36.1757029709102; 
 Thu, 04 Sep 2025 16:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGyjZe+NSX9mpYQeP9HfjJmgNoHuKa4eYSD2icUNBITBoWtqUVLeB7F2OOeEL/Zt7cpc6XQw==
X-Received: by 2002:a05:6214:d89:b0:71d:9d4c:192a with SMTP id
 6a1803df08f44-71d9d4c3057mr102310786d6.36.1757029708573; 
 Thu, 04 Sep 2025 16:48:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab5c151sm1515072e87.2.2025.09.04.16.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 16:48:26 -0700 (PDT)
Date: Fri, 5 Sep 2025 02:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Message-ID: <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
X-Proofpoint-GUID: kDa0GSOp2aWRWB3jpqMZxDDKo18bxdFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX1pqy4w8cbJ8s
 QLYC1r1eB5aN5V7F/F+CPOKw83QUlgSY7SFhPElnB1q+CcYNpXQWD20og2kPXMRzGZEai+j1fnz
 vMYc7xBL1t8nG0yjL0MvM0Z9fQGUAS9qOof3jhbvFlWStkAoQwbX7eUrHSyyV+h9baOT3IoFogG
 bFksYuAGZfWeOcscJwBMlMjU7ygRP0hpSvWXW5pR9xOZwbIyq3S8VDuQzxHyGpP9OAeser5lUMx
 mBYGrHUuyKlx+/BA9PXjvppTgUl0W6TZGJnPOV2hY2t1x28pRTpQYCY2G0NMsR9DZmoIPapyPOO
 qKu5BoN0fjO9n0+D7fgdIGee1L7eM1cEB7rY8A2qLpwIkwRT7VXvABdx302gXUXxN9DGkejpZds
 77aYnKhm
X-Proofpoint-ORIG-GUID: kDa0GSOp2aWRWB3jpqMZxDDKo18bxdFC
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba254e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=Q_aPI2XdcSPthaebfpMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> The following three patches setup platform data with the new information
> expected by the HDMI QP transmitter library, while improving the error
> handling in the probe path.
> 
> Please note the CEC helpers were affected by a resource deallocation
> issue which could crash the kernel and freeze the system under certain
> test conditions.  This has been already fixed in v6.17-rc1 via commit
> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
> unregistration").
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Cristian, I'm sorry for almost off-topic, but as you are working on this
driver: would it be possible to support HDMI (vendor-specific) and SPD
InfoFrames in the dw-hdmi-qp driver?

-- 
With best wishes
Dmitry
