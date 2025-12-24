Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A249CDBCB1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D3810E9A7;
	Wed, 24 Dec 2025 09:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQMYHzf4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ofizge0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67210E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8VswF721275
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=; b=hQMYHzf4JOv1CKdJ
 0PkY4AGsTJ/zJYleVuzwO+3xJTc5DHzo3vMv5YzCCTPDBtCDAkAMlMPT/gJ2JRb+
 QgS6VSfvBhVDI/2bZ1yN0cW5EN8xxLRxQAbIJkxo7hGfcOcy54sCEFq1EQY3KXCK
 aMrtyKRj3KztyTyMzFaqqGN/daAZumCnhDNw2hbFY7N0Qsw+YQefmv4PFDRYz/qY
 U/5ALh7zHlwXWAgLF94/uHuRXa6R/cEOyJeNW+KXeHV4IGutyduzj34Gjr4T4kbd
 yRjNafVMB4J+J4wH3XgFyrzgIB0qmfNmdGMJZKQ4/UpKqbv4i192+8yI/8g+bm+v
 aO3EWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9syq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee09211413so144349681cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568473; x=1767173273;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
 b=Ofizge0MoBU/1LmsqJty7ulZtIPIYUXufJthWecJfqwwpLRsFUXlLz0uUOO1FmavVW
 +3+6+Y/+qu462xglTKtyK3EbL2IXyDU/m9MtJ7AZMhBwm6TIC0gHP3Qgx/QhI2seSeR5
 r8aRALTYwdkLKNZukP/DObGQp7+shRGSg74Vww+1OYnlO2RsOJ36EE3KPUJj7tE8jCse
 NBEM1n0K+MQ+4KpWg7DyeGKol87rS530MpHnA8WIIDnFIEledZaTS/XbmPnjkZhE6qOA
 RjPyRTg5ksNoo5oHLq+dbvbwsQXc61ApxNS/Kb5DA4at+V8W0XKQCvY4/S6P2KPtRXH9
 lvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568473; x=1767173273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
 b=qL1mqSZB6dPWCRDRwDWUk2AsdTKGzHtKnNRCnSFDuc6ZnwnfxpTVqrV+OscIWA2j5G
 epI4xs8Wb9zeTkbqKjFjqL4XVh8ACsBDFq7XHdS1GX5oQGPFCUNZ5RwrnVUdOuKnWG7y
 Vnt4NsJlDlovo1sp1wsUMEWJ8xq1KEJ9st9XgSXBzb+tQsX8xfY30/dEkm21XlCWQgFm
 m6xhC7H9AUDt4BCeZVO4VhPdlM5vq0PMFVIpYq023vwsL1/c8eQfig8LYyxtS+eHXC5f
 vgYTyvvJ1RYyrevQ1P77aFJ/0Qe3swLNISt9udQXqlB5ipuw1f1cudt4QI/qrJQUrqDc
 OJ1Q==
X-Gm-Message-State: AOJu0YzSJLw25sffFCj8Zd2a5oSGK+aMhGlcZofHTLcc9wCyWDzMdwKi
 hxl0FJGULYJspId3oIHWxqDOB0LVcNuWqeQe8OomDiB3wpeh/Pc0hiiFlBW5z2xgwAtkEoZfxpZ
 nnvMDw1DDqlJ7rZlHLh5AjL0JJEuTdR1yy1NpUks4dIodJNJsTkkDjCrDr2iAqfJ+WjNsqFYYs2
 Jo44I=
X-Gm-Gg: AY/fxX6Nm44w+PbKl9/J5u0Cxe1kEeatCc/jKsFIrtf/4P6gbiyUP3agSI2h2EvRxsj
 hx8kC7UttK9KaBibwq3QioMJNCDYNQD/vXC9Npq5z6UIwRF1gBV5jNX8cRkQ8d5i/K9FaYfJANr
 UdB+qlj0JF+UyhUf8sl3xToyR1SUWuENP0BQSGJr9z/jKqonIxly2XMjB6alj5DxSJwoNU6YBtM
 CsQz3o/bzD3b75fGTs0Pz5msrSYxnXuQUhtNBZZMaOdl4r3SYuqQ+03V+DV+vy82aT+cfMQ1as8
 fegOlCyVEZETv8MhLjwwuWdZfLO5iIX2hEOEkwnISP46q9Kps8u7JVK/zcF84wdJDxi5CAqOHSJ
 m8zHQjzxVNWhhjXVzcQF6SyUVyqwc506Rp1ob4xB0OPhkGgAUSmvtwqS1i7A9iQT3tLrT4ro/Bg
 1XhE6A8ZnWTtYsdZndkeKqC4U=
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id
 d75a77b69052e-4f4abcf2ad4mr267189341cf.31.1766568473470; 
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWCe9o6mSqXsfmrcr72/W6OEYW5Jn/Q617I8QOXG3eK+SCpaxmHlH6oOWFFKcZXbD25f2gHQ==
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id
 d75a77b69052e-4f4abcf2ad4mr267189221cf.31.1766568473058; 
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Date: Wed, 24 Dec 2025 11:27:45 +0200
Message-ID: <176656845706.3796981.9787556236263245313.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bb21a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=WE_5KjwR_mefeVNbiCoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: n-rtRZYTXvUFtgcYl50fBuNJAvWMd9uV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX1sV7/Y/Tc822
 O6+DuvJtXUom7UwOMBIUOtiPJCYeWPGoddVEFy/0mJ+20yWtPO/lRevPGuA04/5+F89xLL7K92Y
 lqwvetlE3kcq/yUs9n84zATjSY8T91JXu2sa0iL0yh/6RjC7sh+AzL9a8mi+hTokX0BMwnieytC
 LRCA2R3ahZmycxseaNsOT46D6x1zKISNWLbmMGkqb4b/eIzOnMbf1dlfck89Am7v8nLxfhctq/P
 CNBuTIo1TDuF+8qstsEqeutSrtN1vy6XlNQfrg6cMfGzaO/TgMyN6EH7UcJw3KTI8WzZat+AuzO
 HtOznHq12RbEao2Z2T/gCXsTuGctG3g5KX4838/q0AmLR4nqL5GuKnpkCyroe0z/YsRv7GGspYP
 xLfGQJqlVK6uOcrKvo6f+giXEtNUaO9m7TQnuyc1nhmsCeeESzPTwBLB/PTjc2gH73+fgDp1m1j
 RjLIrikj2REDx6vwsIA==
X-Proofpoint-ORIG-GUID: n-rtRZYTXvUFtgcYl50fBuNJAvWMd9uV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Fri, 19 Dec 2025 10:46:19 -0800, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
> 
> [...]

Applied to msm-fixes, thanks!

[01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a50d8777159a
[02/19] drm/msm/dp: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/23bee889e33d
[03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ce26953807ee
[04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/686f6aafd39f
[05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/70e66a0c5b1b
[06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d22d53ecb15
[07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/399f4345f07a
[08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f6d754552b55
[09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7ce9dd5eca99
[10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/847c12befab4
[11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/abc287a76e1c
[12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f5a7145d0fb1
[13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6e945d518a57
[14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3091c572fefd
[15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6ccad66048a
[16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4fc510e57161
[17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/010c98df53ce
[18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd5697865258
[19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7c85da6f63b1

Best regards,
-- 
With best wishes
Dmitry


