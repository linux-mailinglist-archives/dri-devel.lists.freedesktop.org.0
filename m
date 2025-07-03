Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E1BAF82AE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF3210E8F1;
	Thu,  3 Jul 2025 21:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6slRFrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87FD10E8EF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:31:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563GQmCd002484
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 21:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qeInK+88yiPg5oGsfDRwuslx
 U4p/xFPqRciwFSrw54w=; b=C6slRFrmp486/69t38/WXUQBhyyUtn55rScxAmpB
 HVek+vhxGIUmjs32nmCJLlmzw/rE0ajM5VZizXG/6Z+HT5UU3aZ9n15U73IEu6SQ
 WvzOLB+KPoEAi8iWobgkthNld1syTGG8n0UCAq3a9rew5RttS9jpARCGi8rrmL+N
 XcKY+dkq9ns7+lZaePocugQfDtp/8yOeFgsakVFnsBNnLlOH43GTQ9uoYZlgTVcd
 8zy73G3E/GKHfod18SvP6Br7zheDKRQik62VqhhszCYfwru6fFRiaxeS4SI9GHwP
 GKJxhJUyd+R64OM6FNXN9JnlzMxjyMFfwh4JXNZedeaJgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kj1at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 21:31:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c955be751aso36364085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751578305; x=1752183105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeInK+88yiPg5oGsfDRwuslxU4p/xFPqRciwFSrw54w=;
 b=aT/L77YOAtxQQ769qZygYhigFY7ykpJqjSxLGHduURSpKtH5zCSWoNfKGMPIO8UzoT
 5DvBUmx5B5IOJ5WvGBFpo5gFzf+EEHevlCuwB2mV27WFZUnCb06oidMMrIOrLoQ/UxVH
 PTQLrAElKgEef/wr7CVzVWCXijNfCSUOXpSi1omuW/+XwiGKZjUf31Eo9QPKlcLEGkmC
 uwHtKZ4GDN0c1Lzuf/udRrmVOLkAyn1TS06HA49D79K2qQ0EVM7JaNEbcZH+A6SjR6Sg
 dboA0bVRiRxQa+JMnFGmINVVpodYbXHghhfdGjZ7yHRaMMZ1i+oC2aWtuVtDFjaR6mMP
 USfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxUdneCmKBC4B2EfE6GQQDWJmKue0NMnIxxwvCTELi5Raqw+s00bDrmq1vhZcSZG0HErhgF9hg2to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbvoPtTkjOVPYtKLPumgPxnhnKlIAFfcEdYQGwasereNlbrzFB
 7flee4nVsVw0MsZNPEjiDefGtVJhUtKGPjY3QkXl0SnvsfesucnXCGFE+jywBSbsZuGT+MlbSpl
 RKgjcrX0GCKqqTx8DJZ8hJgUw46EcqRJcZDzEcxJAlJnT1oHmZLWNWltrJmrrTfF0sZfPAP8=
X-Gm-Gg: ASbGncvVTZBJDO/jfyAC1YuY2P+feWx9Ri+wJc55Mi0vaUnT2o0GgA50OjhIx3mkT1+
 x2ZuyHJY5VxuVa8wO1heXu57B3hfvveR1JZrn4R4RuHvGjtZj2MFYQ/oFq6F34gnhXUjOGLF11w
 HOHIJvmXhIsqeEOLJGh/onL1ybrJMrRDJWEO2AbIoFirsNcza7O0s470z/05WF5ueXJ+QvdlgYU
 PztyQv8Cu1QfK3Xd1WTa1rJkxgiozDjLrD8IqEt3M+DTFTWTacCmU0fOvcZBX91/MMf4J4GcSoi
 D21uz3v+ryB7HlDMENwUh0R4LxwoDITARtEbrd/9q/y46Cqab+z1WX6y7h5D1GZ8D6q4RY0ZBO6
 tJ9g72S8cYDRVplfvvJxiz7vbBtHGFAUWnhc=
X-Received: by 2002:a05:620a:2802:b0:7d4:5802:6b64 with SMTP id
 af79cd13be357-7d5ddc74111mr124685a.38.1751578304747; 
 Thu, 03 Jul 2025 14:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFogsVeAym0njpK2tirPNqqlhSFdvntj/qga6EclWKF6A4+sZsDc1wNhJYejevo4+457cOTyw==
X-Received: by 2002:a05:620a:2802:b0:7d4:5802:6b64 with SMTP id
 af79cd13be357-7d5ddc74111mr121485a.38.1751578304266; 
 Thu, 03 Jul 2025 14:31:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494483sm74470e87.99.2025.07.03.14.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 14:31:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:31:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: hdmi-cec-helper: Fix adapter unregistration
Message-ID: <ueibew6g6shgvu3gjwlvrbh2zlaqmablud74yzkwv3zsr55jw7@ydt27epp3miq>
References: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6866f6c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=9ZfakaW_u6aXBSxZSV4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3OCBTYWx0ZWRfX+lVHCs+rbpLx
 xJVdV4oert0yG9ROy7ASuLkGOdrWH7AA9J9FC88/UGCSKpLw3f1aHABfJsBEkjvxnrIcHUykbLY
 PAO1XgNX94YAU6AbubENwPh7XGCuY3+P8aDj0OyC10aoFYnhwyoO2AjUwl8BniWJwqKllT2pWo4
 w0JZGq+X/DJAZMnfDcw2z2cIVzEqiESW6ODta8D75x8P0M1qhqgz0cTdpNX7IkblWNpdWqNTzWT
 mtCFE/hSnBPVumKun3grk4OEhaNvPVfysuldQuPMH/nSxjOdubhYK8rWcX/R0tS9W1k38WbqIGm
 Kr4vQhJgHzbtjsh4+B7FMadNr0dbW2YniVP5URxeyc+bj61u7K+18Yjh9yFlRg/KuVifyDKeqY0
 jdmA61lkWEcqavBTD5rEwk1EWGQ69tsG84XP8utvLFX4nyzCGnyQDsAT9c97OMV3bEpxpwUv
X-Proofpoint-ORIG-GUID: EQbF_Bf3zEM6WWSjot13PQJGyaHkolI7
X-Proofpoint-GUID: EQbF_Bf3zEM6WWSjot13PQJGyaHkolI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030178
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

On Thu, Jul 03, 2025 at 11:05:45PM +0300, Cristian Ciocaltea wrote:
> Attempting to reload a kernel module of an HDMI driver making use of the
> new CEC helpers revealed a resource deallocation issue, i.e. the entries
> in /dev/cec* keep growing.
> 
> Moreover, after a couple of tries the kernel crashes and the whole
> system freezes:
> 
> [   47.515950] Unable to handle kernel paging request at virtual address 0020072007200778
> [...]
> [   47.521707] Internal error: Oops: 0000000096000004 [#1]  SMP
> [...]
> [   47.537597] Call trace:
> [   47.537815]  klist_next+0x20/0x1b8 (P)
> [   47.538152]  device_reorder_to_tail+0x74/0x120
> [   47.538548]  device_reorder_to_tail+0x6c/0x120
> [   47.538944]  device_pm_move_to_tail+0x78/0xd0
> [   47.539334]  deferred_probe_work_func+0x9c/0x110
> [   47.539747]  process_one_work+0x328/0x638
> [   47.540108]  worker_thread+0x264/0x390
> [   47.540445]  kthread+0x20c/0x230
> [   47.540735]  ret_from_fork+0x10/0x20
> 
> Do a proper cleanup by calling cec_unregister_adapter() instead of
> cec_delete_adapter() in the managed release action handler.
> 
> Fixes: 8b1a8f8b2002 ("drm/display: add CEC helpers code")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
