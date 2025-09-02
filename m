Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA7B402BD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3F210E6E6;
	Tue,  2 Sep 2025 13:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWrpJedp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A5710E6E6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:23:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BL37j013393
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lD73ebiFfjAcSdwGcgODwG3ayziIi/umNKznbuOBrsc=; b=nWrpJedp4Xio8Y5X
 iVy5kIuCc+bYttZiZRD9qHjiE536+9bbUZg6wOzoxLhEFI0EDQ+5R5glgJ7cs6sX
 SWe4xSHLhhZR03C3tYnocEvok+qb+f1v4FhOLTuoi1MPG68pBSrLHgezLxg9e/pj
 4/5Z25e6eybZ+nX/JAPj6PDPOqxYnv50UzqQCVLijqbha0IRbL5QhDbSmhfnsWof
 zkmaNAAkb8ZWnlJEwxsHBH+OlVCE+eLZHQrt5Yi0YnOh2kS1ategYuxk0dOEPpDC
 f1JCjhueCvhpRtoujzSRIksPTg34ODBl5enCbBIr3CepDVWJvc4k9HMI87NXphIH
 IXfvkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fft15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:23:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e87069063aso1713680485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819380; x=1757424180;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lD73ebiFfjAcSdwGcgODwG3ayziIi/umNKznbuOBrsc=;
 b=RbCseglTHJaSLrrKWypON81me7AbY16wp4u4DkDK1CkpDpj+bnCKL4biGVk6kfYC1H
 K4b0jTwVIo16pb2pX7DbtbPipOngpLPo7FPyTd+hbKx/TzIjUNn6keW8qBEZG1+8aMUI
 9LxyrQy1fQXhFwcc2hQN9yZW4F6M8RQQTdr9uA6EgbFPZP0trtsC9RlextSsUx+g8bM2
 zOyj55ONZct8Ew5k9sYL4s+oLwOooK4wp3v84F9XYgir6zmnoqcIr92Fp2OsqPEOiDaz
 LKnX9dWO9T389LLwa1i3m5IoWaU/2cJE77oB+QCCiLtOTjkXzuYh9xH14MisMkCnDet0
 U8Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWia0iOch2UbVS8Y/8aEStwCIR/Qq61mgzGJeDcYhf4w+Y0wmg2kWZUKyQpUcXhijyFJVgnnoLdq+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8hxLu2yXpy+2t5KFIjxKtOW49CCj+hH9ZtumocdocDJTZVrGt
 7lnasTGG85wYAnygE8KSmeTBT+2TCJkcsRN+6pYYaw/kqmnvLl6o9jUl/Bb/NHX/zgRK6+OBu0T
 cEKN0PTGdZRMOcNUQzdNb0IQs34NXBnaKk/f0cYFpRUSGsMGX34KCA4thzj6WJc+ENB17rKm3Qn
 m4nq4=
X-Gm-Gg: ASbGncvPzvay7NXxddniY9Dnzaplpr7u0KrwBe+mLmtBAfpAVqpqKqW5Y4FqrlpjyXN
 0CKdU3+J4nxzoaYmH6Ks7Yf/EOczqnIAtPS17gz2hphXjvaSsSSxTirr6yF2dFj6USCIVjygRDQ
 KO4xh5E2iSI2Gk5+fnfbohPZQt/Pb/r0LsPZko2PM2cap3Rm9AGfgOP4fW5vyUlghE5aK/9vH4C
 vJb2ooWoTAceFtDgwJLY6aY6wz36NSGPrRsZeuoJQRoYGOd1A3y7SAk5EgY+6J6LPN9LjfV6iq5
 chsVPfq11RTMfQAwdiWWric6K76v8m+P/OBLcMCcbe002x+JcAKwgrbG4LkeIA==
X-Received: by 2002:a05:620a:ac01:b0:7ff:f801:d4e7 with SMTP id
 af79cd13be357-7fff801e61cmr1151945185a.13.1756819379541; 
 Tue, 02 Sep 2025 06:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd4VwxuS1eGRypUe4kM4U6jYmO0Ezi3tIVq6bOYrcgkw40C61F2D+N3HvW7dh77+xCl7mZkA==
X-Received: by 2002:a05:6a00:2194:b0:772:7251:7148 with SMTP id
 d2e1a72fcca58-772725173a8mr2742364b3a.27.1756818988929; 
 Tue, 02 Sep 2025 06:16:28 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm13790790b3a.18.2025.09.02.06.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:16:28 -0700 (PDT)
Message-ID: <d909d5ec-4223-4b9d-abbe-176672ff7f0a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:46:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
 <2mhq73sckc3x7rqvllbmfk3qwla2lqqidchecogytxyramoeu5@66j7zupcni2i>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2mhq73sckc3x7rqvllbmfk3qwla2lqqidchecogytxyramoeu5@66j7zupcni2i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX650auWEalFBv
 a4RbE34FYJJuZddPHf7onK1/drAVGWyWMkG4rO8iLjP7zLkPGnmbRzu6zWzCvA6c2iUUp9qhnPN
 2wfgOhi/Sa9B3mubixDeXTAq0Ir1GeaFW0SA+QalD2+lvNFBFWgFvS0kzRJPkUSVLS0nlKXzIGj
 jlz2T9G5BYrjcw4pEt3V78zxD9vx8HXrFvRJfLT0eCVTCF/8/t+c1QDyrHi2fVmpvKpadfX03tl
 OJ49/1nVieW5kevm3hNC1+kaxp8omTyt4TBpxo4Mp0Gco3LynrKVbdFi43a8k8VYJSvcs/bfCXY
 B64dC7LaHu1NmTk78BILpbskJZQogdAg3mAa9Y5snFxKYikUCiVSvIOqf1C29I0UCzQcMesXIma
 BxifEfS/
X-Proofpoint-ORIG-GUID: 3JBGQh5QZmAUT32Ikf8FdUR8HomvHmb2
X-Proofpoint-GUID: 3JBGQh5QZmAUT32Ikf8FdUR8HomvHmb2
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6efb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gUvfbfcqA5cecSJ7q00A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On 9/2/2025 5:57 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 05:20:00PM +0530, Akhil P Oommen wrote:
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
> 
> Nit: usually you can drop timestamps from the kernel log.

Missed my eyes. Will update in v2.

-Akhil.

> 
>>
>> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

