Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B2545001
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974E12AC16;
	Thu,  9 Jun 2022 14:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2201F12AC16
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 14:57:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b8so14890774edj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7hpuCxPNLVFxcvMRfyiVo6q9G+tIko2wxttQMFet/hg=;
 b=ofhULVoXgr5aSdU9fti5Ryx68DzsJkkDR8JYOJLfpaRqoqqUNgVfWSm7JDnVZBBwe4
 +neaFWLNsksdAYWfLzO1RbloQWZj3b1F29sPLtBRf1P7to+Wjip1psaEdEKK8OzGJHum
 rKvxm3x5F5pDXlpzqf0DtIWt9XimX1R1rckLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7hpuCxPNLVFxcvMRfyiVo6q9G+tIko2wxttQMFet/hg=;
 b=Y4gP8RWq26sAS28ISYUnhPa+YPE3WrHWa1pYHVvbkJ1dU0OHoEUwmkyRTWspUBTtoQ
 CeceZA4ao4i8KbhmPGiYuylBsmWJAowlMu73+icMlPFSGBG8zqXzunGcB92xoto9FBdS
 hRgNpD7Pdd1MrjiacYJ09XdPi+2tuCBDCDqghdLjKqEX+ZVMHYGQYn7s2UoEVXrnjWNH
 G7hP+168ZG4d5qZxERS1e1qsmeC9C5yP82mm4BPirjT621cfogIh43699toa6wbGjVuO
 C3WCpzOEwJk+icNqB9tspBoGvkvdQ2SVzI4da4jnBXrHv5amsV23cugRLGxBS9Db2dWz
 5ASQ==
X-Gm-Message-State: AOAM530mrWlqHfZC9InyFoljpQrj/n9e0uGXOag9Uc0OXPMcqoYOnTNK
 IY6aPLAc0sz23S8G7HgzdeHbYoQAk1ESzYDM
X-Google-Smtp-Source: ABdhPJwaDtOSLU7LT8/6XnWfxGphwfjZZ15xjZPtK++2gcPKM6JM45GCWQ1yGYV+At26Cjp0zPIoDQ==
X-Received: by 2002:a05:6402:190d:b0:431:4e5d:d780 with SMTP id
 e13-20020a056402190d00b004314e5dd780mr27570074edz.279.1654786668329; 
 Thu, 09 Jun 2022 07:57:48 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 s23-20020aa7d797000000b0042bc54296a1sm14295587edq.91.2022.06.09.07.57.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:57:47 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id d14so23791199wra.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 07:57:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr19531096wrd.301.1654786666218; Thu, 09
 Jun 2022 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152928.831245-1-robdclark@gmail.com>
 <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
 <CAF6AEGtRO2VdweN014JpApQ460=KxEU9uF8jf1U__Gh-bMRo7w@mail.gmail.com>
 <2e8544dc-1914-92ab-a9c6-e9093a649c49@quicinc.com>
 <CAF6AEGvgd7AbGG9szgAW1hXPrhfY78Vdh2s8a6Cei1gpScDQNw@mail.gmail.com>
 <9d321f53-eabc-3f8d-79a9-f2c407aea6f1@quicinc.com>
In-Reply-To: <9d321f53-eabc-3f8d-79a9-f2c407aea6f1@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jun 2022 07:57:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmzKfZEv_vFo=y1OxLx2=PN6jwDC7EdQpdw=TBANE=HQ@mail.gmail.com>
Message-ID: <CAD=FV=WmzKfZEv_vFo=y1OxLx2=PN6jwDC7EdQpdw=TBANE=HQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Switch ordering of runpm put vs
 devfreq_idle
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 9, 2022 at 7:16 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wr=
ote:
>
> On 6/9/2022 2:17 AM, Rob Clark wrote:
> > On Wed, Jun 8, 2022 at 12:36 PM Akhil P Oommen <quic_akhilpo@quicinc.co=
m> wrote:
> >> On 6/8/2022 3:00 AM, Rob Clark wrote:
> >>> On Tue, Sep 28, 2021 at 7:52 AM Akhil P Oommen <akhilpo@codeaurora.or=
g> wrote:
> >>>> On 9/27/2021 8:59 PM, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> I've seen a few crashes like:
> >>>>>
> >>>>>        Internal error: synchronous external abort: 96000010 [#1] PR=
EEMPT SMP
> >>>>>        Modules linked in: snd_seq_dummy snd_seq snd_seq_device brid=
ge stp llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp es=
p6 ah6 ip6t_REJECT ip6t_ipv6header vhost_vsock vhost vmw_vsock_virtio_trans=
port_common vsock rfcomm algif_hash algif_skcipher af_alg uinput veth xt_cg=
roup xt_MASQUERADE venus_enc venus_dec videobuf2_dma_contig qcom_spmi_adc5 =
qcom_spmi_adc_tm5 hci_uart qcom_vadc_common cros_ec_typec qcom_spmi_temp_al=
arm typec btqca snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_sc7180 bluetooth =
snd_soc_qcom_common snd_soc_rl6231 ecdh_generic ecc venus_core v4l2_mem2mem=
 snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_pl=
atform snd_soc_max98357a ip6table_nat fuse iio_trig_sysfs cros_ec_lid_angle=
 cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_b=
uf cros_ec_sensorhub lzo_rle ath10k_snoc lzo_compress ath10k_core ath zram =
mac80211 cfg80211 ax88179_178a usbnet mii uvcvideo videobuf2_vmalloc joydev
> >>>>>        CPU: 3 PID: 212 Comm: A618-worker Tainted: G W 5.4.139-16300=
-g88d8e1285982 #1
> >>>>>        Hardware name: Google Pompom (rev1) with LTE (DT)
> >>>>>        pstate: 60c00009 (nZCv daif +PAN +UAO)
> >>>>>        pc : a6xx_gmu_set_oob+0x114/0x200
> >>>>>        lr : a6xx_gmu_set_oob+0x10c/0x200
> >>>>>        sp : ffffffc011b7bc20
> >>>>>        x29: ffffffc011b7bc20 x28: ffffffdad27c5000
> >>>>>        x27: 0000000000000001 x26: ffffffdad1521044
> >>>>>        x25: ffffffbef7498338 x24: 0000000000000018
> >>>>>        x23: 0000000000000002 x22: 0000000000014648
> >>>>>        x21: 0000033732fe638b x20: 0000000080000000
> >>>>>        x19: ffffffbef7433bc8 x18: 0000000040000000
> >>>>>        x17: 000000243508d982 x16: 000000000000b67e
> >>>>>        x15: 00000000000090d4 x14: 0000000000000024
> >>>>>        x13: 0000000000000024 x12: 0000000000017521
> >>>>>        x11: 0000000000000b48 x10: 0000000000326a48
> >>>>>        x9 : 1a130d33f6371600 x8 : ffffffc011e54648
> >>>>>        x7 : 614948e00005003c x6 : ffffffbe3cd17e60
> >>>>>        x5 : 0000000000000040 x4 : 0000000000000004
> >>>>>        x3 : 0000000000000000 x2 : ffffffbef7488000
> >>>>>        x1 : ffffffbef7488000 x0 : 0000000000000000
> >>>>>        Call trace:
> >>>>>        a6xx_gmu_set_oob+0x114/0x200
> >>>>>        a6xx_gmu_set_freq+0xe0/0x1fc
> >>>>>        msm_devfreq_target+0x80/0x13c
> >>>>>        msm_devfreq_idle+0x54/0x94
> >>>>>        retire_submit+0x170/0x254
> >>>>>        retire_submits+0xa4/0xdc
> >>>>>        retire_worker+0x1c/0x28
> >>>>>        kthread_worker_fn+0xf4/0x1bc
> >>>>>        kthread+0x140/0x158
> >>>>>        ret_from_fork+0x10/0x18
> >>>>>        Code: 52800c81 9415bbe5 f9400a68 8b160108 (b9400108)
> >>>>>        ---[ end trace 16b871df2482cd61 ]---
> >>>>>        Kernel panic - not syncing: Fatal exception
> >>>>>        SMP: stopping secondary CPUs
> >>>>>        Kernel Offset: 0x1ac1400000 from 0xffffffc010000000
> >>>>>        PHYS_OFFSET: 0xffffffc280000000
> >>>>>        CPU features: 0x88102e,2a80aa38
> >>>>>        Memory Limit: none
> >>>>>
> >>>>> Which smells a lot like touching hw after power collapse.  I'm not
> >>>>> *entirely* sure how it could have taken 66ms (the autosuspend delay=
)
> >>>>> before we get to a6xx_gmu_set_oob(), but to be safe we should move
> >>>>> the pm_runtime_put_autosuspend() after msm_devfreq_idle().
> >>>> https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c#L132
> >>>> We have this check in the gmu freq set path which should avoid this
> >>>> scenario. I might be a bit pedantic here, but I feel that the origin=
al
> >>>> code is more accurate. We should immediately mark last busy and put
> >>>> runtime_pm refcount.
> >>> So, I've been doing some experiments, changing the _put_autosuspend()
> >>> to _put_sync(), in the course of tracking down some remaining "GMU
> >>> OOB" timeout type issues and related badness, and discovered things
> >>> very quickly die with SError splats like below.  Possibly the issue i=
s
> >>> that runpm has some race conditions, but I'm not sure we can trust
> >>> pm_runtime_get_if_in_use() quite as much as one would like..
> >>>
> >>> -----------
> >>> [   33.225332] CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W
> >>>         5.4.196 #7
> >>> [   33.225337] Hardware name: Google Wormdingler rev1+ INX panel boar=
d (DT)
> >>> [   33.225343] pstate: 20c00009 (nzCv daif +PAN +UAO)
> >>> [   33.225353] pc : msm_readl+0x14/0x34
> >>> [   33.225361] lr : a6xx_gpu_busy+0x40/0x80
> >>> [   33.225365] sp : ffffffc011b93ad0
> >>> [   33.225371] x29: ffffffc011b93ad0 x28: ffffffe77cba3000
> >>> [   33.225377] x27: 0000000000000001 x26: ffffffe77bb4c4ac
> >>> [   33.225384] x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
> >>> [   33.225390] x23: 0000000000000000 x22: ffffffa2f22bf020
> >>> [   33.225397] x21: ffffffa2f22bf000 x20: ffffffc011b93b10
> >>> [   33.225404] x19: ffffffc011bd4110 x18: 000000000000000e
> >>> [   33.225410] x17: 0000000000000004 x16: 000000000000000c
> >>> [   33.225416] x15: 000001be3a969450 x14: 0000000000000400
> >>> [   33.225423] x13: 00000000000101d6 x12: 0000000034155555
> >>> [   33.225429] x11: 0000000000000001 x10: 0000000000000000
> >>> [   33.225436] x9 : 0000000100000000 x8 : ffffffc011bd4000
> >>> [   33.225443] x7 : 0000000000000000 x6 : 0000000000000007
> >>> [   33.225450] x5 : ffffffc01d8b38f0 x4 : 0000000000000000
> >>> [   33.225457] x3 : 00000000ffffffff x2 : 0000000000000002
> >>> [   33.225463] x1 : 0000000000000000 x0 : ffffffc011bd4110
> >>> [   33.225471] Call trace:
> >>> [   33.225478]  msm_readl+0x14/0x34
> >>> [   33.225484]  a6xx_gpu_busy+0x40/0x80
> >>> [   33.225490]  msm_devfreq_get_dev_status+0x70/0x1d0
> >>> [   33.225500]  devfreq_simple_ondemand_func+0x34/0x100
> >>> [   33.225510]  update_devfreq+0x50/0xe8
> >>> [   33.225517]  qos_notifier_call+0x2c/0x64
> >>> [   33.225523]  qos_max_notifier_call+0x1c/0x2c
> >>> [   33.225532]  notifier_call_chain+0x58/0x98
> >>> [   33.225539]  __blocking_notifier_call_chain+0x74/0x84
> >>> [   33.225545]  blocking_notifier_call_chain+0x38/0x48
> >>> [   33.225554]  pm_qos_update_target+0xf8/0x19c
> >>> [   33.225560]  freq_qos_apply+0x54/0x6c
> >>> [   33.225566]  apply_constraint+0x60/0x104
> >>> [   33.225572]  __dev_pm_qos_update_request+0xb4/0x184
> >>> [   33.225578]  dev_pm_qos_update_request+0x38/0x58
> >>> [   33.225584]  msm_devfreq_idle_work+0x34/0x40
> >>> [   33.225591]  kthread_worker_fn+0x144/0x1c8
> >>> [   33.225597]  kthread+0x140/0x284
> >>> [   33.225604]  ret_from_fork+0x10/0x18
> >>> [   33.225617] Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
> >>> [   33.225623] ---[ end trace f6309767a42d0831 ]---
> >>> [   33.236185] SMP: stopping secondary CPUs
> >>> [   33.236186] Kernel Offset: 0x276b600000 from 0xffffffc010000000
> >>> [   33.236186] PHYS_OFFSET: 0xffffffdf80000000
> >>> [   33.236187] CPU features: 0x088102e,2a80aa38
> >>> -----------
> >> Any chance we are racing with system suspend here? Because, when
> >> "dev->power.disable_depth > 0", pm_runtime_get_if_in_use() returns
> >> -EINVAL. Then I guess we should look for a positive return value from
> >> pm_runtime_get_if_in_use() before proceeding.
> > I think that is possible.. although I can still still SErrors in
> > a6xx_gpu_busy() with:
> >
> > ----------
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 1ec90a9ca56c..61e1e33f355a 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -129,7 +129,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct
> > dev_pm_opp *opp)
> >           * This can get called from devfreq while the hardware is idle=
. Don't
> >           * bring up the power if it isn't already active
> >           */
> > -       if (pm_runtime_get_if_in_use(gmu->dev) =3D=3D 0)
> > +       if (pm_runtime_get_if_in_use(gmu->dev) <=3D 0)
> >                  return;
> >
> >          if (!gmu->legacy) {
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 95a6c3361a1e..b17a95f7b85c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1456,7 +1456,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu,
> > unsigned long *out_sample_rate)
> >          *out_sample_rate =3D 19200000;
> >
> >          /* Only read the gpu busy if the hardware is already active */
> > -       if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) =3D=3D 0)
> > +       if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) <=3D 0)
> >                  return 0;
> >
> >          busy_cycles =3D gmu_read64(&a6xx_gpu->gmu,
> > ----------
> >
> > So I don't think this completely explains it
> >
> > I am starting to think it might not be a bad idea to drain the gpu's
> > kthread working in the suspend path
> If it helps, draining kthread sounds like a better solution compared to
> the current patch. Because msm_devfreq_idle() is queuing a work which
> can still race with autosuspend + system-suspend under enough system
> pressure.

So I think I've tracked down the crashes that we were seeing and that
they are fixed by:

https://lore.kernel.org/r/20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3=
016b85d06@changeid

That being said, I'm still a fan of landing Rob's patch because it
gets rid of the potential WARN_ON in adreno_runtime_suspend() and
seems more correct.


> -Akhil.
> >
> > BR,
> > -R
> >
> >> -Akhil.
> >>>> -Akhil.
> >>>>
> >>>>> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/msm_gpu.c | 6 +++---
> >>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/ms=
m_gpu.c
> >>>>> index d1a16642ecd5..2b2bbe7499e6 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> @@ -667,9 +667,6 @@ static void retire_submit(struct msm_gpu *gpu, =
struct msm_ringbuffer *ring,
> >>>>>
> >>>>>         msm_submit_retire(submit);
> >>>>>
> >>>>> -     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> >>>>> -     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >>>>> -
> >>>>>         spin_lock_irqsave(&ring->submit_lock, flags);
> >>>>>         list_del(&submit->node);
> >>>>>         spin_unlock_irqrestore(&ring->submit_lock, flags);
> >>>>> @@ -683,6 +680,9 @@ static void retire_submit(struct msm_gpu *gpu, =
struct msm_ringbuffer *ring,
> >>>>>         mutex_unlock(&gpu->active_lock);
> >>>>>
> >>>>>         msm_gem_submit_put(submit);
> >>>>> +
> >>>>> +     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> >>>>> +     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >>>>>     }
> >>>>>
> >>>>>     static void retire_submits(struct msm_gpu *gpu)
> >>>>>
>
