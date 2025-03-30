Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB65A75B96
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D1D10E298;
	Sun, 30 Mar 2025 17:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e75VYa//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066910E298
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:56:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UB0FAl026803
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Lz8cPs1jv9yYaNYKFo1LAT2i
 8NFG1hmV95XiMt5jeXQ=; b=e75VYa//hrOje19C0Mz0/K39wmVEMpMO95Nzp7z7
 1F2XnyGv6DNSg5Tl9bHgbnl/hj2KvBAT7RnNTtlBmIrN16Hq4YMVXZw/5NDgldL2
 SGanrfylCQ679LHwwRgEdIkovyfJ1iErzxt7lJMsVvHMtMGck0tcjIsoMG7BfZTz
 qAM8XpNYhLdOoQXg1b/yvGH0+GJiRY12UXEHWBOOIiy7tKjt1xJu7Fgli7R39dHg
 6dFeAQxgCeRZiljucaJhme53BE3KiEL+EGL1utUFupbLSrrfP+NBXHEEpocYQ8l8
 SHkcTsPau2O4Kle+gIxmxsqNiXklZDjgNdMA3SMCAzBtmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tjkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:56:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c77aff78so113356085a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357388; x=1743962188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz8cPs1jv9yYaNYKFo1LAT2i8NFG1hmV95XiMt5jeXQ=;
 b=TZSqLZimJzHhlc+flZN2KM+iw5MJrYAvqDaOUkJo/mhJvWOAfdeeenhW93/l38azto
 HS6jAtSWUfwnntqaqPlm/KH/8Rik2uuKMv/SJe9JZ2CIwM3IykryZhdw1Xhf6R+Xq+y/
 cO7RyyH8XgqGcUJ+yFs7KZfXGBRNnSP9fPhF87stNLACckrVIoVPSnzzXc/v0iWaODPo
 xRiR/0rKND/keGOflr4L+rqUpIykoCr3hI1a1jYEIbviTkufi2EhpvhN6px0yZRplei1
 2dBkXoqdYNJh0FG8WEKTnJahfmniesPtilmRA87L3K0oFZM/YLxkH4C041rpCk75JLQn
 0R8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZkSB/N6W8XStTjkWRnSTUskakWpz0+1WyOe6p+hWIN2S1MOClbyf5i33r00zaZdm01EBZ+LCT8GY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww7I8NrmY4ps5aDOELyqjjk5bxKV/Emv24CQSKsZPGpuBeEEMN
 xAn7RhpJCJF3tCCoQs0sYSwbAy2XGuvC/iI18gEhYVu1HpdPw49x5Lf6Qm2c9Suma/XGR5UEHaP
 Z7ZrMmEeQZP8VW8dFi6BwersdFaZCZ/AV3AAG0Luuafdizbpc1hPlfYWyG/U/FkSIObo=
X-Gm-Gg: ASbGnct3Gnry9luOFlk3OXuY73kOXSa8af6seqNyMenSRq2mSly+O65L11/miJtMRwZ
 l+15B0kpS4fNjyljp0pz9s1NdE6GfN1omnEKWW/UDJHKggeLB1KP2pXyqPfa9+atY61Gh14Q5IF
 BEWgTIVJVuEQj1UTnowyORLoL6MM0TF8S/ceRLNqAOY59HQooTxFZjPcYPM/sFu+liM5QHxwvLe
 ET+iJCVbZ3jxRVd82QBxGiOdOzdzh/RozwQi880ph3TdirSFeR4mC5DHg97Z+lDZ/a6HToenwMI
 ucK+Uyy5BTZtZtyQuCYD8t5kckm7ozBZwe4yl5/yF2MeCnMAHY/Q8MztGrN48v1J9J/2itVqWRF
 vhCU=
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id
 af79cd13be357-7c690730c58mr798692385a.33.1743357388335; 
 Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV8w3BiW0koPwvLrrFAy1gyiPQeqzm5vgh0g49Qe+2/7yY+I33AnKCPyAKUW1tUcda2ovAEg==
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id
 af79cd13be357-7c690730c58mr798689985a.33.1743357388038; 
 Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2acf72dsm11498061fa.48.2025.03.30.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:56:25 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:56:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
X-Proofpoint-GUID: L8sUiSpDpP7HLMvPAdmSoFldb-cgWOR1
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e985cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: L8sUiSpDpP7HLMvPAdmSoFldb-cgWOR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125
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

On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.

Describe why, not what. Something like 'is now required to succeed,
otherwise bl->max value can end up being not set, although
drm_edp_backlight_probe_max() returned success'.

LGTM otherwise.

> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

-- 
With best wishes
Dmitry
