Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EADB1B237
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBCA10E64E;
	Tue,  5 Aug 2025 10:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkUY+mZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CD510E64C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:47:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757OJmG004224
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6MqyqJWNT+su2i0PV9Dq1jib
 VxeVp+m7xarMv4uNdaM=; b=UkUY+mZ/do5d/LOeZT1b2eMvT8zMlRbivn4pPtf2
 xKW49RajL0IVJr+uYEbm8YKJoiMB1JNYFQ4EeZ3r0dBt2eMq3r9r8fuj3eS+k8gK
 lizM3E10wX6NbggpEcTK5P696eHp4MmAirEPZH5ct9DdE9+8IjMaVSXePnxE7gVl
 572oFeV76r/uZKS65Lm4VMi5Xbv+oy1IkvjPDncpOKomjrhrSwXzxjGvgkAWHTJY
 gCp2U9U+5DKa3O5JjnCzGlQrcQi28ceZsHdQSIpb/rjmiwi/xIjvi7GDbzXoyKbg
 ubrNu6m6jN0O9efbc52gMHgAMpddcDDVA9oINLDznIU2Uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3t37h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 10:47:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7073cc86450so62997016d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 03:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754390815; x=1754995615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MqyqJWNT+su2i0PV9Dq1jibVxeVp+m7xarMv4uNdaM=;
 b=R/qi6atxfCcjCantaNntR40HRK/icvT+vHu9PGKAAJIiolbYMC0U/Ol0W7hhg9ljaP
 4jDN09EP7udSNnHcfDruLZy7qu1GT/bgSa3SjRX7s4lMiAIQjY7SdXd4jPXGVLZvD5gA
 yuFS49lPK/Z+Q3Wb6dAJWCm264/GjTq0LMc1nbnwnCF89i8K95847tYmKCJkvG0bI52e
 CrE+68wclBvDtWu8D3PVnYPZMR1rZ9H31Uku4qegto550PbZZsWtunTV0DlRZWg3wNc+
 pC0mW7DDctne+PcRVddNL1Y8hZAp+HNDOyU3IXKqcIfCDvfubnxT+WKQoKJAB8uq/QFl
 1xew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhDXSJxeCobL9z+cZAKP4A/oWeGvoT2eR30K09zP/DgtEdzKCI1R8BNnE1brASPZS5CIdQJruElwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIgobdk4/2+dkw03NhcMiD7V44RpJGVIo8AE0jM1RgatU3wusq
 Fn/wkVCySTt/yzcfOsCEVDYe5afSNCnuWlXZkkSY/HCTmfKe4sxHSNQ/kb6bIye9s9zGgKyXgga
 3qNfjRosJIxzfvvsNTesrWiVip4rAjg8nn5k5luNs87BNoLOcNRp0TqaTn+kwJuFRn9VSerNbiH
 9Q9qdqsvIS
X-Gm-Gg: ASbGncu0cUWyvIkxfPakGMNgH4UL/aOXnxtuhzBIcVmJX1+TMCfxkZWk1rDWUN0ikAS
 M1V/4C84ZoyoZd92AhcTOLCqMo9vXEhF6wN4uiEzWRCHgH4cY9qDJG4Xmarrtw6cFU92JwdcETo
 RiI64CnjBiLhE6yJxfVrMUZs8Xk5kYVO7G+kAMOrfu0Co9UMHyuUo4UmHU1jV3dean9TxiWB4YP
 o/hlLQp2+Y6cVaPJs8LaAUcht/xyK4r1/mB4F9m9yejF/eCj82dLP+0w9UCuSSuzcxtVGVcMoYd
 9trqBuex5kPtgoL/rk7lHog9578dX9SDmS38SMddCcl29Dz1656YPeCjUSgzXbgxMczUPL5qfMZ
 GRTjoP01TR08ZCvfm86FEUvnaaGcYvSIo5rA+IhNOLbYXW8o+qHll
X-Received: by 2002:a05:6214:762:b0:704:7b9a:8515 with SMTP id
 6a1803df08f44-70936313db4mr165964596d6.38.1754390814908; 
 Tue, 05 Aug 2025 03:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmShMkZ4kKSVeaIHraWH/PlAWlX7H2EEZv0YV6qAruKBuxlJC4H8uILodqhzr6oCtQ73Ww0w==
X-Received: by 2002:a05:6214:762:b0:704:7b9a:8515 with SMTP id
 6a1803df08f44-70936313db4mr165964346d6.38.1754390814481; 
 Tue, 05 Aug 2025 03:46:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ac71esm1875211e87.66.2025.08.05.03.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 03:46:53 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:46:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicusor Huhulea <nicusor.huhulea@siemens.com>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, cip-dev@lists.cip-project.org,
 shradhagupta@linux.microsoft.com, imre.deak@intel.com,
 jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, laurentiu.palcu@oss.nxp.com,
 cedric.hombourger@siemens.com, shrikant.bobade@siemens.com
Subject: Re: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Message-ID: <z4jxkrseavbeblgji4cnbyeohkjv4ar3mbbdvothao6abfu6nf@nqlhcegwtwzf>
References: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
X-Proofpoint-GUID: eY_HRBk0STreTuec2z2KPPcd4b8-l5tw
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=6891e126 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Lu6GMi6qvROXTdHYmRoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3OCBTYWx0ZWRfXy5kZUhSg3A4v
 9hnFv6QgjtZWvmmip4DAnXDyQ9n7hmkwxhhocC44Vh/9IQVpxAy34ae6ECd3IJbWVJb/O04AbYn
 yReTh4h+ncgtD9n+lrvAqES9I4kPdO+CKn+GVc8cnyzZHg442Yr44JZrOaRCn9SyCQA+tcZBol0
 VNeHkyY4CRn/rug2M7EMu8QKoblfU2FUv9q/hvcEhXnvDaf0smB0OsQm3IgHlxXxpsMfaKXO6DL
 uLn8CmNu6xCKuT0QQjYF/YFI1Vcd5W6D6t/Qe9jF5VKftgdbuQUEXd+Gv8tESYVbSUwg1wKk313
 WjQv/U1KfciNHrhePOgL9I0T8DdlvgpvKJ7H41SnXq3fYCZolTnio8/PCy+HqYp+4KzoUMY8ejI
 SOLvpNSpydbIJs/Gj/YOydmvZGVrtEBHYywf5YgC/lkNkdKeMMmvS0mkpv7+0bTMDqwViu+e
X-Proofpoint-ORIG-GUID: eY_HRBk0STreTuec2z2KPPcd4b8-l5tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050078
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

On Mon, Aug 04, 2025 at 11:13:59PM +0300, Nicusor Huhulea wrote:
> A regression in output polling was introduced by commit 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
> ("drm: Check output polling initialized before disabling") in the 6.1.y stable tree.
> As a result, when the i915 driver detects an HPD IRQ storm and attempts to switch
> from IRQ-based hotplug detection to polling, output polling fails to resume.
> 
> The root cause is the use of dev->mode_config.poll_running. Once poll_running is set
> (during the first connector detection) the calls to drm_kms_helper_poll_enable(), such as
> intel_hpd_irq_storm_switch_to_polling() fails to schedule output_poll_work as expected.
> Therefore, after an IRQ storm disables HPD IRQs, polling does not start, breaking hotplug detection.

Why doesn't disable path use drm_kms_helper_poll_disable() ?

> 
> The fix is to remove the dev->mode_config.poll_running in the check condition, ensuring polling
> is always scheduled as requested.
> 
> Notes:
>  Initial analysis, assumptions, device testing details, the correct fix and detailed rationale
>  were discussed here https://lore.kernel.org/stable/aI32HUzrT95nS_H9@ideak-desk/
> 

-- 
With best wishes
Dmitry
