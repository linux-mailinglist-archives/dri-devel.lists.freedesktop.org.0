Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE62B493E2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBDD10E55D;
	Mon,  8 Sep 2025 15:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFQC/1VK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BDB10E559
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:42:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889RrSe031220
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CvtOsrkldNLB6e4LcCzuZPkp4XudNj6Q+1Ef7B/8biI=; b=mFQC/1VKAonkObBm
 s+Bzca1U1mbSDA2JqPXwebwhOfEt2ZZMV1Wa+GIHjbDWs6SLT3mm4eIRhI2Fm1uK
 H0kQ9VW1pJo6PlhQT2/pXfDUVE2Xvyg/khRp6eqAJfupIQVhpIOdX1/O08Jyhl5Z
 qk3Pau8BPFLxg+bFANDguNcq64wC4OEt6lejB+SrpcnhPGEwGOonuaoK6/fd7Pru
 w9DKR/W6FCIxkY6zeUB0TAitAm1IkT2jPKJNL2TYKpBDPTRi93ShX+p8fTQtUOkr
 wRdeequFf1yW9X/a5CGfT5qAmj14OtxJbqjVshrs33w/ZhqgGnyVTFkxmxbnnjpd
 LAlKjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j56eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:42:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fa4be5063so3415513a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757346175; x=1757950975;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CvtOsrkldNLB6e4LcCzuZPkp4XudNj6Q+1Ef7B/8biI=;
 b=TsqTiR5RJWDvK0ZqcDhMYwpT9sJhnBgAiKTCDrsAnOzL5h3RQn//URPGRVlT1Kv+B+
 l9jGzu0lJfQ0fvx3MpkVqhmDJ8Fu5K6Y8Stl+V74GQChVWQ1jy82yHO2kQ9uZ/B8RZma
 IOO+4nKBjI17sax668ZXD5EuD9HLwO4O7JeOGKQ06nzjVnK2/Rb1Gs5UudA43d52Uuzs
 uDj4NN11Lk4jPjUT8M/o3dPwAU52ku1YsUtYP7tM6Tn7sKTT2WcS3r5znc55q8nXG0rM
 +SLGptJO99yDrFKpCxYO4SBxtijGyh7hGpgqdP6rZM8czHRivOuzMAT+GKxxlv6O/bKa
 PYkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjhP+jybLXZPriPAtCWittxKp1gZugfjjIFMeO/8u+7fLjWeYIi8ROwPIucLEuXzGLY+/7MBmOyKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9F0dK0hPpCxiwwOEx8xlUtLNy9Fqh6OcHYGiC9+8qyrRyJJtV
 PwTKn99oQBsAjYtndAhoHYhFkHz6szInpItOx+ZUHlsxhIHftLX4gE8k7dR8asA+nZgGeMwnRi+
 jpWZLOwTFtEKkUcLcO00+hjgV28G8Y6I/KsgiumbLsrOxIfyy61ITd1VjHQLM9gIGVjLdVFE=
X-Gm-Gg: ASbGncu3S9OmySVb20ZaNLI2wWCNJdNWIEib75vQe16c9jeNiYdbS8c4Mq8TVTScGf9
 8HusVuPnZCMXoT7566XFr5XldyhtO1/ib0nqNSSfKHgwik84VROaW+WqFqoJdgOWcZ26HaVr6dl
 Nrwm29h4ieaztkb12HDTZ/RqODApLWLRpFmSuEHvdI5erQUDTCYN/lV4Bg2tfdqlt8QRNv/Piba
 BY4tC2OWUM0Utsk2FmMixm7yjJmYF9D76+NjPTlP3eRCdF2lQpEOguaz6vMQcy/WGTpZ27xbZGF
 J+bLjCtONh75St8dWz8GGnb98tBM4b0iX7ac902OzMJ9/15d89gMIOqoMtL37Q==
X-Received: by 2002:a17:902:e806:b0:24c:d6c6:c656 with SMTP id
 d9443c01a7336-2516ce60e49mr104180975ad.4.1757346175429; 
 Mon, 08 Sep 2025 08:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2qX28q5ZPTDoI+m/uyM3Cq/dpy6ZsOrLrboLn59YqS3/ebKm53vG9+ieiNPfzO3LHaOLuw==
X-Received: by 2002:a17:902:e806:b0:24c:d6c6:c656 with SMTP id
 d9443c01a7336-2516ce60e49mr104180605ad.4.1757346174893; 
 Mon, 08 Sep 2025 08:42:54 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b11833a47sm180283795ad.53.2025.09.08.08.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:42:54 -0700 (PDT)
Message-ID: <f8e66daa-8923-4926-86b8-c51f7f576180@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:12:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
 <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX48McQ7L90Afl
 Pwv6AbEbolYDj0C5QQzuWbjQa28nC6D1s5Cy+B9qEXog2F0zsboCk5BkbFBNhNvYkCP5rGCV7RU
 61uDk5Z4OeP5+7u/8zURmSpyUWMOrKAM9hJXG8iiIlKqvCTMWDMiLMkFTMm1PNTeF167vxI1Oef
 sLd4EQ8+dyiWg1qzrcssHLGnpP8zcgL8RkK65A0r/mDYWccttOauYWEmnE3/tWlgGLqh1xBObB7
 97tnvslVJHbZZzhcs/H8XzvOKm0fuI/k2o2FFmBZ6uD05wEaahqXstN9RrDQ/gQ89flHt2lt4ct
 FvgYGXTAU4Cpo74Tm+1z93CZZPuEtF/vS0OZSOCD/J4VzfuW0agNqZK8aYpI+PDQ2eYyrNAuEqS
 PY9XGF4p
X-Proofpoint-ORIG-GUID: XgymMTjSRpKDqh2QFu0WVMzWyt3u7EqD
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bef980 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hDdxQT28d3n03to_f2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: XgymMTjSRpKDqh2QFu0WVMzWyt3u7EqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On 9/2/2025 9:25 PM, Rob Clark wrote:
> On Tue, Sep 2, 2025 at 4:50 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
>> drm_gem_obj.gpuva.list, which is not initialized when the drm driver
>> does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
>> drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
>> is set:
>>
>> [    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
>> [    9.523160] Mem abort info:
>> [    9.523161]   ESR = 0x0000000096000006
>> [    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    9.523165]   SET = 0, FnV = 0
>> [    9.523166]   EA = 0, S1PTW = 0
>> [    9.523167]   FSC = 0x06: level 2 translation fault
>> [    9.523169] Data abort info:
>> [    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>> [    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
>> [    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
>> [    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
>> [    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
>> [    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
>> [    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>> [    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
>> [    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
>> [    9.763632] sp : ffff800082dab460
>> [    9.763666] Call trace:
>> [    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
>> [    9.763688]  get_vma_locked+0x2c/0x128 [msm]
>> [    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
>> [    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
>> [    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
>> [    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
>> [    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
>> [    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
>> [    9.763782]  drm_client_register+0x58/0x9c [drm]
>> [    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
>> [    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
>> [    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
>> [    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
>> [    9.763848]  msm_drm_bind+0x30/0x3c [msm]
>> [    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
>> [    9.919283]  __component_add+0xa4/0x170
>> [    9.919286]  component_add+0x14/0x20
>> [    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
>> [    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
>> [    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
>> [    9.919341]  really_probe+0xbc/0x298
>> [    9.919345]  __driver_probe_device+0x78/0x12c
>> [    9.919348]  driver_probe_device+0x40/0x160
>> [    9.919350]  __driver_attach+0x94/0x19c
>> [    9.919353]  bus_for_each_dev+0x74/0xd4
>> [    9.919355]  driver_attach+0x24/0x30
>> [    9.919358]  bus_add_driver+0xe4/0x208
>> [    9.919360]  driver_register+0x60/0x128
>> [    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
>> [    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
>> [    9.919370]  do_one_initcall+0x6c/0x1b0
>> [    9.919374]  do_init_module+0x58/0x234
>> [    9.919377]  load_module+0x19cc/0x1bd4
>> [    9.919380]  init_module_from_file+0x84/0xc4
>> [    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
>> [    9.919384]  invoke_syscall+0x48/0x110
>> [    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
>> [    9.919393]  do_el0_svc+0x20/0x2c
>> [    9.919396]  el0_svc+0x34/0xf0
>> [    9.919401]  el0t_64_sync_handler+0xa0/0xe4
>> [    9.919403]  el0t_64_sync+0x198/0x19c
>> [    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
>> [    9.919410] ---[ end trace 0000000000000000 ]---
>>
>> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf59097a01c2b2556608 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -826,6 +826,7 @@ static const struct file_operations fops = {
>>
>>  #define DRIVER_FEATURES_KMS ( \
>>                 DRIVER_GEM | \
>> +               DRIVER_GEM_GPUVA | \
> 
> Hmm, the description of DRIVER_GEM_GPUVA is that "Driver supports user
> defined GPU VA bindings for GEM objects", which isn't really true.
> Fortunately the only thing that it actually seems to control currently
> is the list head initialization.
> 
> Idk if it would be better to make the list head init unconditional, or
> just add a comment here?

But the KMS-only drm driver do use symbols related to gpuva. "struct
gpuva" for eg:. From that perspective, shouldn't we select this feature
here?

-Akhil

> 
> BR,
> -R
> 
>>                 DRIVER_ATOMIC | \
>>                 DRIVER_MODESET | \
>>                 0 )
>>
>> --
>> 2.50.1
>>

