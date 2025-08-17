Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FBB29339
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 15:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7451B10E12D;
	Sun, 17 Aug 2025 13:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNUVrEe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432C410E12D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:17:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57H5NUkS018764
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GiV7pSStDdWI68Vss3L8zd+L
 tIEJULlsfsxCpf7SurY=; b=gNUVrEe6TVY5VcpYoVtvKvHbWSSi5ubvqvh2MAtX
 tiYWKhFRpNAUCCHi62/QwFcA/m+8IzhC5xA/7MtbmE/PhrXCHlqlOMevfWIT4w8X
 672y7yO6bsg02Jf1CDe2GlqLbn+r1GGctvcS69zEEAJYZ2dl0NbfeTeGtSn7oMGs
 EEPW8wLH4op+SK9CfrguT2R6zvOZp+ZoUfw0qswmb2+T0HLwnXq0Tq/7oyIspt2a
 qWP9BxTuG092+9R/fNrpTTvk+U0mPpnJ6o8mdBY9MElXgUXtODgZFqXhQ/izK0k1
 u3kAPzgeCQATm3O/9geC4gzean46hEkksLJgwBlFZWDGHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxta7ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:17:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9f5bb140so114100366d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 06:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755436627; x=1756041427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GiV7pSStDdWI68Vss3L8zd+LtIEJULlsfsxCpf7SurY=;
 b=F9y6Jtt0VKlEuLvVmK2Q363Is51GsFIu8DgHfk677GQko5kGJU/ehjuvsJH3mEOIhN
 G0xSdBM7nodfQHqefPQz7jjZM2NufuHzbWV7T5eGOkSw4JiCqdV1tsvFUEnX5ZgjQV2+
 CmHKXCtlqJ+8jQXLRVUplHnYzie/vF0EXtxaJxo4AAl5TeA7G4h8y91YBHgFjg42F58x
 MiiqfRMsDuseu9dfkRlgvWxHicAc7u0kgfpB1PIk0ZSTz9X0CGyUT2oGgYWrvhIV+tBl
 RrgzGTwKWD2075IV3UAKlyUh5pOiLay9fXyZWA8I/A11i2AFqOXaeAGeZgmIurJ9RmdN
 zCVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD5zO7qJpOuGcNDxyuo36p47DIxEe8MsRYIuXoo2wLBHgfvFv7VqouFgM2+MknHIDK/TXZK28CHdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1xbuG3sI549UO3qDfhHS9RmFjPN2F+y9oaFIyG88NhKseniRH
 wJIMueglDBaqAVd2aPwzlPoxbl2My82qljybi0H3tvaYpPZXrwwQyA/JZL3JsN9AG9L14q816i7
 +4zXnRXv6G8snFRAa1rtJ/HAwKKQlBmdO8raDB+YtCmgjnUn0sxEOPZjJWx8YJfef5R5WnkE=
X-Gm-Gg: ASbGnctiUdTd/fi5YaOYAoKQgdX10Yj4dHjhRP1XpS3nlnaKlX4aNF1P5mzrUmxAPiS
 BjZXFL5i8b/DkmDcR5FtBa0IPVkM/aWCAQtGqPnKj2zgr268OOMhFU1jWJKlvjkRdejR2eKeQBf
 lBe3ZhVu/DTU4u0ANp8JcPNxWeG8qo5rWKnPkFQvTNpeDtpRC5HEJp57kvRthxBon1+QznItSI8
 avkZtLroFZ022L2oY7CBO44jSKhf8Hq+3TrUV1OG9JyPMibizxM4Bi58wwmAP6I6sCxhfAts9fy
 50dqHvPZuqOE5MNdVUWHi30kaILMPBmd5VLCK185C9055rSqki5+ssnBqrbyQo5IL/9zmdsHuHb
 vePEEhLSWO+DE4IMH6yWy1nBNTCVQanbxjZjqxfODrg+SCuddKEuF
X-Received: by 2002:a05:6214:29c6:b0:707:69ad:d84a with SMTP id
 6a1803df08f44-70ba7c47a68mr96712786d6.42.1755436627283; 
 Sun, 17 Aug 2025 06:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbl24CvUe8eJqnII5MYk282LE99iXcWaVQo/FwKTWXiUwDfVAkbciAv7+M5Vmv6cpRCKgbnw==
X-Received: by 2002:a05:6214:29c6:b0:707:69ad:d84a with SMTP id
 6a1803df08f44-70ba7c47a68mr96712416d6.42.1755436626776; 
 Sun, 17 Aug 2025 06:17:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef47351csm1223263e87.163.2025.08.17.06.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 06:17:04 -0700 (PDT)
Date: Sun, 17 Aug 2025 16:17:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 10/11] drm/hisilicon/hibmc: Adding reset
 colorbar cfg in dp init.
Message-ID: <tvpcofc67wx7tmnzew4pptejsiqtjhxwbzfo7wxgwjefu7khyp@3sy4br7qgtof>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-11-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-11-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: 0oihnyyHt3YjHYrRFv_TR6VuvCRSv5dw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX4UoKynpEedvk
 Un0tMFJhsKYDYCKy1gzIsiv9fYUvDc+qZmE/kBc4yVCORylRiGOOIkPz+Z9hiHNp2v4Rin9ByeV
 qXcsKSQW/ohzNU08NIV0EDMsDwwrg7lk18ZHXWTI+xLzWmfcmsTQWjN7w2wAd2ZZmynzmMQ2DiJ
 znLHBIQKax6TRe7h0sKo4TNXoEQlv09COSP+Ec3ww9GzpASrU6TEyLGJccZyqZ4Up7eI+rTFMoy
 K3wTDOb1LTV0yOO0rYt7x5niCU+leX5cE0+jguAOr+SrqzSGQECIcGbcDT20g3d76clN03+iw0b
 UjCOjSwzzC34cVoSB90J4eDn87kAd0puT88WMZ/IvMn96NoESN8t+qfLy3j4pAvlFCT/BWBEBhj
 QdEHz1NZ
X-Proofpoint-GUID: 0oihnyyHt3YjHYrRFv_TR6VuvCRSv5dw
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a1d654 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=9HEaCUo7PYciymiYKZUA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Wed, Aug 13, 2025 at 05:42:37PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add colorbar disable operation before reset controller, to make sure
> colorbar status is clear in the DP init, so if rmmod the driver and the
> previous colorbar configuration will not affect the next time insmod the
> driver.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - fix the commit subject, suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - fix the issue commit ID, suggested by Dmitry Baryshkov.
>   - split into 2 commits, suggested by Dmitry Baryshkov.
>   - add more comments in commit log, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
