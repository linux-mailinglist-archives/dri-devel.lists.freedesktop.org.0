Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6541365E46D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 05:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF77B10E69F;
	Thu,  5 Jan 2023 04:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC77D10E0C9;
 Thu,  5 Jan 2023 04:09:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3053uurU030304; Thu, 5 Jan 2023 04:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Su183HxisoMhzyv/2MsZh70AdRgSrHdieKR5MFC8G/I=;
 b=HgBko4ovKlgvnu0kkZxiQwDZvpwrpLNdC0vTqbYw8k+7siMHI6cJuMSZx8eKMXkU+Bpx
 WkMIOTWAoVxoGyo01jGGm5G3IlHRpVCsDbESDgzbzDlouQbdEENh7wV8ewNH+l1Ft+l+
 xRDT8rKq66pc54uihBF5kEfqIBETE6/o/k4XYGxufKtEyyE4faKeUaOwVHi3sXx7RZ11
 nYEeUWQ66y5BMWj/SVRZ9e8nuTR2VYtKD8w4XvOugEhPbLWIbni+PVfoPQ7Zsf0jXG4f
 noR8X7TR7MiAd4R9bRspO1tsIGzY0M+we7CL9s88IlAyLHUXkn6jaGB2Kpzfa20xW6Ri hA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvf3d8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 04:09:43 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30549gid024893
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Jan 2023 04:09:42 GMT
Received: from [10.110.82.17] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 4 Jan 2023
 20:09:42 -0800
Message-ID: <5dfc67e1-c251-079b-65e8-b2705f6a4808@quicinc.com>
Date: Wed, 4 Jan 2023 20:09:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm: another fix for the headless Adreno GPU
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230105014743.1478110-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230105014743.1478110-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ImSpb_qNsbaAyjRZqxk981gptyvS61N5
X-Proofpoint-GUID: ImSpb_qNsbaAyjRZqxk981gptyvS61N5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050033
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/4/2023 5:47 PM, Dmitry Baryshkov wrote:
> Fix another oops reproducible when rebooting the board with the Adreno
> GPU working in the headless mode (e.g. iMX platforms).
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> [00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
> Internal error: Oops: 17 [#1] ARM
> CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
> Hardware name: Freescale i.MX53 (Device Tree Support)
> PC is at msm_atomic_commit_tail+0x50/0x970
> LR is at commit_tail+0x9c/0x188
> pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
> sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
> r10: 00000058  r9 : c2193014  r8 : c4310000
> r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
> r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 74910019  DAC: 00000051
> Register r0 information: NULL pointer
> Register r1 information: NULL pointer
> Register r2 information: NULL pointer
> Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
> Register r4 information: NULL pointer
> Register r5 information: NULL pointer
> Register r6 information: non-paged memory
> Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
> Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
> Register r9 information: non-slab/vmalloc memory
> Register r10 information: non-paged memory
> Register r11 information: non-paged memory
> Register r12 information: non-paged memory
> Process reboot (pid: 51, stack limit = 0xc80046d9)
> Stack: (0xe0851d30 to 0xe0852000)
> 1d20:                                     c4759380 fbd77200 000005ff 002b9c70
> 1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
> 1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
> 1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
> 1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
> 1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
> 1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
> 1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
> 1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
> 1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
> 1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
> 1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
> 1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
> 1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
>   msm_atomic_commit_tail from commit_tail+0x9c/0x188
>   commit_tail from drm_atomic_helper_commit+0x160/0x188
>   drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
>   drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
>   drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
>   drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
>   device_shutdown from kernel_restart+0x38/0x90
>   kernel_restart from __do_sys_reboot+0x174/0x224
>   __do_sys_reboot from ret_fast_syscall+0x0/0x1c
> Exception stack(0xe0851fa8 to 0xe0851ff0)
> 1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
> Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
> ---[ end trace 0000000000000000 ]---
> 
> Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes since v2:
> - Moved the condition check from msm_atomic_commit_tail() to msm_drv_shutdown()
> 
> Changes since v1:
> - Moved setting of `async' before the call to trace to fix the
>    uninitialized variable warning
> 
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8b0b0ac74a6f..45e81eb148a8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1278,7 +1278,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	 * msm_drm_init, drm_dev->registered is used as an indicator that the
>   	 * shutdown will be successful.
>   	 */
> -	if (drm && drm->registered)
> +	if (drm && drm->registered && priv->kms)
>   		drm_atomic_helper_shutdown(drm);
>   }
>   
