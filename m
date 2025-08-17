Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A3B293E2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 17:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A5210E169;
	Sun, 17 Aug 2025 15:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOW9gNSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B02910E167
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:34:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57H6iZe1031473
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TO0/YJoNOZ0X3VO5pGcZPZKoqxbNNDXnuoQuNXNkCrw=; b=dOW9gNSAayFW0TSl
 XrP1MUnPjiW1rkD0Yujn+2wf1rWZyKKkrJ5Cl3jq/6rTHHGjGsfS8pqQqihFHakC
 epni+JCmrdWzHM5u24yLLQeFYehF7RnejHjZL5tcFy4ZbtXe1RB13HyKrDsMuxdC
 TwJlsr8jKY6iq8K7jfdgUoUi+8xqC6hMzdxmw3hKXAuQN46xR+rkmHPVpGeDVrI8
 7P4ktoz7D0U1P6jwFcllc9LtsDyodjjwLgaPQUEveRSulP20/acJG0AfWsB65qsN
 6ybSu9DNyU+gqTLaFkXwPEWs64NeHeEoJ/JWR/RZs7l9Sexftf7pjpaxQlcfh35U
 Tne2tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtac7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:34:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f57ef93so73150026d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 08:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755444871; x=1756049671;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TO0/YJoNOZ0X3VO5pGcZPZKoqxbNNDXnuoQuNXNkCrw=;
 b=McU17MKCh3RewP0Z57QbvXlAB9P1KAUUQ/Tg9w4GyA7UGsdCuA2xGuPyaMU2QO0CCw
 kla4fbtfX36/A2qg+yNY0wrpDNHaZHJX3jDlogbafB+pe8jpOf2GDm3dgYdOpoYBlV3B
 JwO6sRzeaHilvrcwiwzNgyt06eY8H8YDPYbASYqXKyEfTV+aaq3C9Gc4xKr529B0dsj+
 XhJLdHA9jlzArYNbrzgKLTdadeEQHBk+Wn48cAnuqcBCjd4iyp6FAmeA3Cd29udyUk9c
 4OlWUPa6unpsLm+RbDNsLVozer0Zka51lwIV+3qiyzLdDOoZhlecgD1d80k/iNTrtmlk
 Iovw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF2pswOcrft1NezwMkda50vi/nDIgZHPTJjws4TKF/a6nplwD5rtF2l09GBXZG2qBUuSTbU2NxS7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2mzIOxko9gp2v840jrbxAZzuksdeCzEDolwTjcA+XHnbcpSxa
 VQ8ZP6DPOSJosM1E1FLs/0luqCZ6+2r8yeFzttIeQgloz4+sNywEHSWBIUuKB4f5ird72UPkNMG
 zDGbOWDSf+hnFhz0d71aG0NuqD4LeeUrsb5wLGm09an3RA8K4MZBfYZz/+HI3OQXaYq/LzU0=
X-Gm-Gg: ASbGncvsuZL6gVAZRQ+ZOe8DqoY8Eia/1N63EuwUf0df1viUtsbToW5SSSyd+DqvRWB
 vszQjzh8pZ1YbWZ6VZ1saB5BGk3GS8DZmOj5qcOyoPnfGxuGC0pyg0EXXo6kgvpQGnvspnlo13v
 vAo1hE4GYiSBBXnl+Wo27DVTTQaIYTeKC6kEMXHPlx/QL/PN4bbdABWPvfCPSwpTt0TDOAK+03n
 hOhu6/RfHe+lctTpW2Yq4/flwKCtqJjSi3qNlEZJ7+31d6+YCAow8py6IAscL1dCcI3NTwaAjjr
 3vK2EOOFQyTt2ZlQyXipn4HdaDovqGOvejwL1WTLjT35BV+EvZJ0YeCNLlQ1k+/nZXT7ga3ra/o
 PFdUWs5ahJVHG7Nn4zRWwOQSgLFX+R9L7gA68lUzSschEnCJNV2oX
X-Received: by 2002:a05:6214:19e1:b0:709:e661:287f with SMTP id
 6a1803df08f44-70ba7be5a8bmr99692116d6.24.1755444871332; 
 Sun, 17 Aug 2025 08:34:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyZL/O5yPOrl1HoYJyd0mthD1IYRGusl1A9M4p5zCOGyzvj3Oy3RHwfMGZaaasdsp+jP+aWQ==
X-Received: by 2002:a05:6214:19e1:b0:709:e661:287f with SMTP id
 6a1803df08f44-70ba7be5a8bmr99691946d6.24.1755444870856; 
 Sun, 17 Aug 2025 08:34:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41d565sm14571571fa.1.2025.08.17.08.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 08:34:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, kong.kongxinwei@hisilicon.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Yongbang Shi <shiyongbang@huawei.com>
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, fengsheng5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250813094238.3722345-1-shiyongbang@huawei.com>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
Subject: Re: (subset) [PATCH v4 drm-dp 00/11] Fix hibmc driver bugs
Message-Id: <175544486847.2020385.3415657683583939368.b4-ty@oss.qualcomm.com>
Date: Sun, 17 Aug 2025 18:34:28 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: WhNZK4ftc-IzJzTwfcZDLJOKjgtzDCHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX1G4UYIKjNKA2
 aZet0DNT69QxTit/Qh37Y682SyoKahGFGNUmwoU5ugEmBqrW6uKqoWcqkIjuIkNGPBoR9FCfT/s
 Cewo4InZG8NRmO2WILXqttO8JfKz0lv2V+bDvn42OLjBYEEXAa3UB0HFHpKPxdnt3rYOtsXoShd
 +OCisJMCoaAVno+KFnQOZVOBEY/4FPiB2gLt9nOtbn/hO7PlSirHhZTD76yTL2zcY21XX0bYsTi
 kzSbnGxZBeafUYgYVxHJr1WU8AqjRr49nh8WhDp5PY72dyMes/Q2DG3oPsb2x9MVvIqRgz5PMGt
 oreOWhhY9Fc2qdFzQc0VtwcB3PldfbQxFvorugnDWmk13HExq3IwjN9i9CalEoiwD5wSdexQAAi
 yp0mvbNz
X-Proofpoint-GUID: WhNZK4ftc-IzJzTwfcZDLJOKjgtzDCHe
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a1f689 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=UoQGjLeWWrEyGxXzEkcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
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

On Wed, 13 Aug 2025 17:42:27 +0800, Yongbang Shi wrote:
> There are some bugfix for hibmc-drm driver.
> 

Applied to drm-misc-fixes, thanks!

[01/11] drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init failed
        commit: e5f48bfa2ae0806d5f51fb8061afc619a73599a7
[03/11] drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
        commit: 8bed4ec42a4e0dc8113172696ff076d1eb6d8bcb
[04/11] drm/hisilicon/hibmc: fix the hibmc loaded failed bug
        commit: 93a08f856fcc5aaeeecad01f71bef3088588216a
[05/11] drm/hisilicon/hibmc: fix rare monitors cannot display problem
        commit: 9f98b429ba67d430b873e06bcfb90afa22888978
[06/11] drm/hisilicon/hibmc: add dp mode valid check
        (no commit info)
[07/11] drm/hisilicon/hibmc: fix dp and vga cannot show together
        commit: 3271faf42d135bcf569c3ff6af55c21858eec212

Best regards,
-- 
With best wishes
Dmitry


