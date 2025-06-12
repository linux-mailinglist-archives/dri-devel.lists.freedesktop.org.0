Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B6AD7CA1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C4D10E112;
	Thu, 12 Jun 2025 20:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6LzZjZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F3210E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 20:47:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CH1xau026057
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 20:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=OUQqiN0h+KOF+AItufskcppy5j1/Jr2ZlesKUzp3WRQ=; b=G6
 LzZjZ/n6W6y8ayTp8bsV5O9LWgFCZ5fmjMwfBUAJjzr1eB8/WGsC/oWETj4bZS0f
 Ty53xsV6hIn4hBQAMT61HUVQPRQyd0TBLOkW/bd5Qrwca4Jhw8Ps/Lh0nYBB7T8t
 lRDXSX+cCPTVmEfJOPXI/DUt8KIz6a6Q83aeEgfRlIdbei9UmHGgJrTwPxblX36y
 OzdjcW1Iba1iaWEjCYpNHPOUxU4VbFlSFBzEAQmaljR2F0U6LIu7LRfWaC1aXm6J
 HCiqcIWiPZIVLntKb42/1mGL9Rki0HIb3Rwju/Vht8E18E/qZSVHvFed2fMuWEAO
 BZWRxeDrJ3KvMZhAmILA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ycnn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 20:47:33 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-60f430d0fbbso1103008eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749761252; x=1750366052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUQqiN0h+KOF+AItufskcppy5j1/Jr2ZlesKUzp3WRQ=;
 b=QfQpYhgXq5Bq+Iy+3JFQwkAFMbvy+v8yaRO2nbeulzXqfX0uWR/VeBFS+Lw4k+VqYT
 dP0X1TXFx27mt3WupTORBOb89iOFjOxMPRF/s8+WpQbwgYUcIJqbB50maNn+GA2RTYuL
 t6nbfo3ExDWARLYu18t5lj2KHwfteUtx+5cILiaWsk/LKmIYwop5zOhGqMB9TzCUE5eg
 9vuPzz9o13K9mVK9L2rpNPABjdppKBCH7CSf5/UEZh134D13EscUEKgCwE383vuZ+d6k
 GR3yuQ8jeFDllKXxvKNmt/r/AP1Et1U7wsJaBmkknGpdDDr/8OHvAXVDwU/y19LdphCD
 prPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5eAtn0uMqI9OPBcClaZal027yiBMVEOPQ58COdSoM1doEBooA2qh4lTsORWSBkLpEnBd3VpAsVh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycpl0OQeidKn++Mjg3Lfg6RHVh9fysLxfQNJPMlZZKlFHfYD99
 x2eDgxf/lzAjwUzyx96ooFU3a8UGeenHYVGH6nBvqB549RlM7fjP15dhu8q2WOw9u9H1242itsJ
 5Rsaqn1tMz4TnPQfMQi/nFGocUYbiMxjBbtnVUHpylPOGZKYnjaJQLp54OVAWBHLtVc5xGUlSsE
 9tDdy8TX6B4Y32ozIaTQw9g7NrhJQ/ksE7GgvEBZleB8TU4w==
X-Gm-Gg: ASbGncsAswblyFTIFVF/LKZcRO0IQk9d3DEsiKPmflnjgq+GHoqbAoShCRs+zBFiUfs
 6lFXTr+wsl6oPRsohMCcHMYBI2aJvE9XxBX2rcQegBdtRlwUqP1PfAifY8bgaSSYMGLF/LjfNhI
 koqzqpvHMWtaDS8SxHqihCf3FKzNTuthvX1Bo=
X-Received: by 2002:a05:6871:4002:b0:2ea:736c:2b08 with SMTP id
 586e51a60fabf-2ead5178353mr351840fac.29.1749761252001; 
 Thu, 12 Jun 2025 13:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo4t3zZYDyUT3FmlpIHipzv8NT4Dibo+WvhB3zcMygU2qylNFs4x1N+vPpadMlaGiNB2orLt5ziP1Mj7CpG3M=
X-Received: by 2002:a05:6871:4002:b0:2ea:736c:2b08 with SMTP id
 586e51a60fabf-2ead5178353mr351812fac.29.1749761251594; Thu, 12 Jun 2025
 13:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
 <DAKOKYU9O323.M7OSA1CFHQWX@linaro.org>
 <1bf920c8-245b-40c3-bce1-ec5194b30fd9@oss.qualcomm.com>
In-Reply-To: <1bf920c8-245b-40c3-bce1-ec5194b30fd9@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 13:47:20 -0700
X-Gm-Features: AX0GCFuxTx9pgxu_i4KrKSjSeKFBX6EzOI1MTSGy4XpCql4QPO4U0LlgB52T-48
Message-ID: <CACSVV01ZsrLsLZstnwyH89-gM7KGd3dZYR_AieQYmXeqZPossw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2MCBTYWx0ZWRfX7fjH2Cqr3Jcg
 qhykzsbTf7UuiE2mwHqNYOlXxwkPuLBDA3zdteb+ql15yUNfzt9SAUVBMguu8zB6ZHhwDVz9rYw
 H1p0soKQn93ZM00OIEiAtSs2xoFeOtOMI+F5fJqhONOs28qkNFYeQk1RBBP9wElozJggblEFEwz
 nM4kDdmTAD2EW80nc4I0/1GCIf3lD7or4cDgyWZA4GlTNu7bRhEwBBfWada2VxXrrqLeKe25KwQ
 eMlEKcwzJ924JlSNfAmx5ABiJJbgR4qRLtKOI5vs7ZQvZKMREY83bWtHHxgk+Ta6flpgPlAbcwP
 D1u0oFENo8pWlnZ5ftpu1Zvjae4Zhtvg04yYz522fsIpi3rZtfA6ovVY3xpGf/LyKXTYTxEe1ev
 4yFnW0AGEaio+aFhcSubzWXuDRZPXtt8fyCP4usL0rqu7NojdsBsqEzSP0iDRS7AbzFS/fWk
X-Proofpoint-GUID: Ur8HhCOBiHcSOVLh57t-eR17RyoHyryR
X-Proofpoint-ORIG-GUID: Ur8HhCOBiHcSOVLh57t-eR17RyoHyryR
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684b3ce5 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=wlZFfpuQTLNucttZ8HoA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120160
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 12, 2025 at 9:08=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/12/25 6:04 PM, Alexey Klimov wrote:
> > On Mon Jun 9, 2025 at 7:24 PM BST, Rob Clark wrote:
> >> If we have a newer dtb than kernel, we could end up in a situation whe=
re
> >> the GPU device is present in the dtb, but not in the drivers device
> >> table.  We don't want this to prevent the display from probing.  So
> >> check that we recognize the GPU before adding the GPU component.
> >>
> >> v2: use %pOF
> >>
> >> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++---=
-
> >>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
> >>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
> >>  3 files changed, 26 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/=
drm/msm/adreno/adreno_device.c
> >> index 778e6ae7f137..0d12454b1f2e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, =
uint32_t *chipid)
> >>      return 0;
> >>  }
> >>
> >> +bool adreno_has_gpu(struct device_node *node)
> >> +{
> >> +    const struct adreno_info *info;
> >> +    uint32_t chip_id;
> >> +    int ret;
> >> +
> >> +    ret =3D find_chipid(node, &chip_id);
> >> +    if (ret)
> >> +            return false;
> >> +
> >> +    info =3D adreno_info(chip_id);
> >> +    if (!info) {
> >> +            pr_warn("%pOF: Unknown GPU revision: %"ADRENO_CHIPID_FMT"=
\n",
> >> +                    node, ADRENO_CHIPID_ARGS(chip_id));
> >> +            return false;
> >> +    }
> >> +
> >> +    return true;
> >> +}
> >> +
> >>  static int adreno_bind(struct device *dev, struct device *master, voi=
d *data)
> >>  {
> >>      static struct adreno_platform_config config =3D {};
> >> @@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struc=
t device *master, void *data)
> >>      int ret;
> >>
> >>      ret =3D find_chipid(dev->of_node, &config.chip_id);
> >> -    if (ret)
> >> +    /* We shouldn't have gotten this far if we can't parse the chip_i=
d */
> >> +    if (WARN_ON(ret))
> >>              return ret;
> >
> > I just hit this with linux-next on qrb2210 RB1 [1].
> >
> > Is it expected an warning now or do we miss some device tree updates on
> > linux-next for RB1?
> >
> > I don't recall seeing such warnings previously.
> >
> > Thanks,
> > Alexey
> >
> > [1]:
> >
> >  msm_dpu 5e01000.display-controller: bound 5e94000.dsi (ops dsi_ops [ms=
m])
> >  ------------[ cut here ]------------
> >  WARNING: CPU: 0 PID: 242 at drivers/gpu/drm/msm/adreno/adreno_device.c=
:224 adreno_bind+0x90/0x120 [msm]
> >  Modules linked in: q6asm_dai q6routing q6afe_dai q6adm q6asm q6afe_clo=
cks snd_q6dsp_common q6afe q6core apr pdr_interface qrtr_smd qcom_pd_mapper=
 qcom_pdr_msg mcp251xfd ath10k_snoc snd_soc_wsa881x_i2c snd_soc_wsa881x_com=
mon can_dev lontium_lt9611uxc(+) ath10k_core ath mac80211 hci_uart btqca bt=
bcm libarc4 msm snd_soc_sm8250 qrtr bluetooth drm_exec snd_soc_qcom_sdw qco=
m_q6v5_pas llcc_qcom snd_soc_qcom_common lmh qcom_wdt ocmem cfg80211 ecdh_g=
eneric qcom_pil_info pinctrl_sm6115_lpass_lpi gpu_sched ecc drm_display_hel=
per rfkill qcom_q6v5 pinctrl_lpass_lpi qcom_sysmon pwrseq_core lpasscc_sm61=
15 dispcc_qcm2290 qcom_common snd_soc_lpass_va_macro cec snd_soc_lpass_rx_m=
acro drm_dp_aux_bus snd_soc_lpass_tx_macro qcom_glink_smem gpucc_qcm2290 sn=
d_soc_pm4125 mdt_loader snd_soc_lpass_macro_common qmi_helpers snd_soc_pm41=
25_sdw soundwire_qcom regmap_sdw slimbus qcom_pmic_tcpm qcom_usb_vbus_regul=
ator drm_client_lib tcpm rtc_pm8xxx snd_soc_wcd_mbhc aux_hpd_bridge qcom_po=
n qcrypto soundwire_bus sha256 qcom_stats gpi
> >   spi_geni_qcom i2c_qcom_geni rpmsg_ctrl libsha256_generic libsha256 rp=
msg_char qcom_rng sha256_arm64 authenc icc_bwmon phy_qcom_qmp_usbc libdes t=
ypec phy_qcom_qusb2 display_connector i2c_gpio rmtfs_mem drm_kms_helper soc=
info fuse drm backlight dm_mod ip_tables x_tables ipv6
> >  CPU: 0 UID: 0 PID: 242 Comm: (udev-worker) Not tainted 6.16.0-rc1-next=
-20250612-00025-g0ce0d3974333-dirty #2 PREEMPT
> >  Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> >  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >  pc : adreno_bind+0x90/0x120 [msm]
> >  lr : adreno_bind+0x50/0x120 [msm]
> >  sp : ffff8000813f3580
> >  x29: ffff8000813f3580 x28: ffff000008ae8800 x27: ffff000007c63700
> >  x26: ffffca4a2814b860 x25: ffff000008b26880 x24: ffffca4a24922000
> >  x23: ffffca4a249229d8 x22: ffff000009838800 x21: ffff000008b26880
> >  x20: ffff000002ce4410 x19: ffffca4a2495a710 x18: 0000000000000006
> >  x17: 6f5f697364207370 x16: 6f28206973642e30 x15: 0720072007200720
> >  x14: 0000000000000000 x13: 0000000000000000 x12: 0101010101010101
> >  x11: 7f7f7f7f7f7f7f7f x10: ffffca4a2866e1b2 x9 : 0000000000000002
> >  x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff2f383131
> >  x5 : ffff00007fc1b968 x4 : 0000000000000000 x3 : 000000000000001e
> >  x2 : 0000000000000001 x1 : 0000000007000200 x0 : ffffca4a2495a710
> >  Call trace:
> >   adreno_bind+0x90/0x120 [msm] (P)
> >   component_bind_all+0x100/0x23c
> >   msm_drm_bind+0x148/0x3e0 [msm]
> >   try_to_bring_up_aggregate_device+0x16c/0x1e0
> >   __component_add+0xa4/0x174
> >   component_add+0x14/0x20
> >   dsi_dev_attach+0x20/0x34 [msm]
> >   dsi_host_attach+0x58/0x98 [msm]
> >   devm_mipi_dsi_attach+0x34/0x90
> >   lt9611uxc_attach_dsi.isra.0+0x94/0x124 [lontium_lt9611uxc]
> >   lt9611uxc_probe+0x568/0x604 [lontium_lt9611uxc]
> >   i2c_device_probe+0x158/0x32c
> >   really_probe+0xbc/0x2b4
> >   __driver_probe_device+0x78/0x120
> >   driver_probe_device+0x3c/0x154
> >   __driver_attach+0x90/0x1a0
> >   bus_for_each_dev+0x68/0xb8
> >   driver_attach+0x24/0x30
> >   bus_add_driver+0xe4/0x208
> >   driver_register+0x68/0x124
> >   i2c_register_driver+0x48/0xcc
> >   lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
> >   do_one_initcall+0x60/0x1d4
> >   do_init_module+0x54/0x23c
> >   load_module+0x1730/0x1cc0
> >   init_module_from_file+0x74/0xa0
> >   __arm64_sys_finit_module+0x130/0x2f8
> >   invoke_syscall+0x48/0x104
> >   el0_svc_common.constprop.0+0xc0/0xe0
> >   do_el0_svc+0x1c/0x28
> >   el0_svc+0x2c/0x80
> >   el0t_64_sync_handler+0x10c/0x138
> >   el0t_64_sync+0x198/0x19c
> >  ---[ end trace 0000000000000000 ]---
> >  adreno 5900000.gpu: supply vdd not found, using dummy regulator
> >  adreno 5900000.gpu: supply vddcx not found, using dummy regulator
> >  msm_dpu 5e01000.display-controller: bound 5900000.gpu (ops a3xx_ops [m=
sm])
> >  [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x60050000
> >  dummy 1-0045: No cache used with register defaults set!
> >  [drm] Initialized msm 1.12.0 for 5e01000.display-controller on minor 0
> >  msm_dpu 5e01000.display-controller: [drm:adreno_request_fw [msm]] load=
ed qcom/a702_sqe.fw from new location
>
> Looks like we should be doing this instead
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 5e7307567239..16e7ac444efd 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -221,7 +221,7 @@ static int adreno_bind(struct device *dev, struct dev=
ice *master, void *data)
>
>         info =3D adreno_info(config.chip_id);
>         /* We shouldn't have gotten this far if we don't recognize the GP=
U: */
> -       if (!WARN_ON(info))
> +       if (WARN_ON(!info))
>                 return -ENXIO;
>
>         config.info =3D info;

Oh, yes, indeed

BR,
-R
