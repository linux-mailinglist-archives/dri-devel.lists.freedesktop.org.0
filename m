Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7425BB135
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438C310E4C6;
	Fri, 16 Sep 2022 16:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42C410E4C6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 16:43:56 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id 13so21734237ejn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=4S8cX88Es8i3MLoJRyzbdun9gW08SUXlcQPWBMTUJws=;
 b=Dhu8Yd5YFJ7SYZj6LWj8Gs7ewgUud/FLZ+qU+yCXOoRgB4taCZhQQluD5HFHGU2t3Y
 dLqbKl1IbcFlPqv/1t+a2r5fVtTiQK1bsHD/VfKeHmPHSibWxqgjsaTYUb2nte1hnDnL
 CkF3SK9NL7ybCPxYMnBZDEvL7CRx8frZCOloc2qrcMyl2TDsePEXZO6nkhmsuPnVMxIL
 G6mBv3hV3Fxk0gbgGsWHYvTVJWpaC6BFzgKff7vWvp/Hy8R6wmCeJLCW836LST/CKlRJ
 O9ZGk6ChkC67EAC9lmhAfv95mzwINSQGgFgVnMmd/r+k6sTG9VlGQlzMQeKLqFALzszt
 9fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4S8cX88Es8i3MLoJRyzbdun9gW08SUXlcQPWBMTUJws=;
 b=oj6qeVs3eq4WzEWwJvrminib7vHotEofqdJsnSnxl6dxAUKysEPI23ucA8xR2HwUpP
 80zs9E6yyaFZlGe9k+//6/AJ1cu4o2nHL49lJpA4P2iFwUwT06HadaZ1YHSrLunwTtiS
 Eqo8hJlXCrCAMqEYLkHjwV+iOcr+jze+MoXGR3oHeWQGOMw3AsuNys0UdlATc1+UBH79
 LNvdZYvOMe1fK187JIi312b9WcAR4CsSCXrAEEQl1M6AOfG2Hmr7aNFiiGQs0GjzRxOz
 LaE2EHahFqed9j+6fJSwyzT9w2lfE5EjZTafnZRH/KUghqmzzPOVfHIVTbpbsNkYO2Xz
 IhuQ==
X-Gm-Message-State: ACrzQf1tmKAKAapEKaADedu2cYMXAV1PzjtRptYmvPIJLhI6N1Zk0YLo
 QaStp9lI5y6belgVB7x1EE67kCsu1nuRZyA3o6EgLA==
X-Google-Smtp-Source: AMsMyM5YC0fOX0+qFcisQfW5zkv5GmlFTeL+5x7BQ+4b00bO2O4kl1QmoHdXrpt+RMqp6iXzlVdnoi46lgAeYw+Vkx8=
X-Received: by 2002:a17:907:2706:b0:77a:4c0e:d37d with SMTP id
 w6-20020a170907270600b0077a4c0ed37dmr4150793ejk.501.1663346635005; Fri, 16
 Sep 2022 09:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <ca6a97c5-1abe-b215-0ff2-443f4ed9a25f@kali.org>
 <YyFuT9N0f8bg0epk@hovoldconsulting.com>
In-Reply-To: <YyFuT9N0f8bg0epk@hovoldconsulting.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 16 Sep 2022 11:43:43 -0500
Message-ID: <CAKXuJqh4XeuA2TREPeGp+EGUk4mLWHS7H9qNj+r6MRByj7Qf2w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
To: Johan Hovold <johan@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan,

On Wed, Sep 14, 2022 at 1:01 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Sep 13, 2022 at 03:23:10PM -0500, Steev Klimaszewski wrote:
> > Hi Johan,
> >
> > On 9/13/22 3:53 AM, Johan Hovold wrote:
> > > The MSM DRM driver is currently broken in multiple ways with respect =
to
> > > probe deferral. Not only does the driver currently fail to probe agai=
n
> > > after a late deferral, but due to a related use-after-free bug this a=
lso
> > > triggers NULL-pointer dereferences.
>
> > > In some cases, such has for the DP IRQ, the above situation can also =
be
> > > avoided by moving the allocation in question to the platform driver
> > > probe (d0) or component bind (between d2 and d3). But as doing so is =
not
> > > a general fix, this can be done later as a cleanup/optimisation.
>
> > I've tested this on both sc8180x (Lenovo Flex 5G) and sdm850 (Lenovo
> > Yoga C630), and both of them show the same issue:
>
> [ Copied the below from IRC instead as the formatting in your mail was
> off. ]
>
> > [    7.449305] platform ae9a000.displayport-controller: Fixing up cycli=
c dependency with ae01000.mdp
> > [    7.454344] Unable to handle kernel NULL pointer dereference at virt=
ual address 0000000000000008
> > [    7.454406] Mem abort info:
> > [    7.454423]   ESR =3D 0x0000000096000004
> > [    7.454446]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [    7.454475]   SET =3D 0, FnV =3D 0
> > [    7.454494]   EA =3D 0, S1PTW =3D 0
> > [    7.454512]   FSC =3D 0x04: level 0 translation fault
> > [    7.454539] Data abort info:
> > [    7.454556]   ISV =3D 0, ISS =3D 0x00000004
> > [    7.454577]   CM =3D 0, WnR =3D 0
> > [    7.454595] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000101504=
000
> > [    7.454629] [0000000000000008] pgd=3D0000000000000000, p4d=3D0000000=
000000000
> > [    7.454669] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > [    7.454700] Modules linked in: i2c_hid_of i2c_hid leds_qcom_lpg led_=
class_multicolor rtc_pm8xxx msm mdt_loader gpu_sched drm_dp_aux_bus drm_dis=
play_helper drm_kms_helper drm phy_qcom_edp llcc_qcom i2c_qcom_geni phy_qco=
m_qmp_combo phy_qcom_snps_femto_v2 phy_qcom_qmp_ufs phy_qcom_qmp_pcie ufs_q=
com pwm_bl
> > [    7.454860] CPU: 2 PID: 76 Comm: kworker/u16:2 Not tainted 5.19.0-rc=
8-next-20220728 #26
> > [    7.454902] Hardware name: LENOVO 82AK/LNVNB161216, BIOS EACN43WW(V1=
.15) 09/13/2021
> > [    7.454941] Workqueue: events_unbound deferred_probe_work_func
> > [    7.454982] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [    7.455020] pc : dp_display_request_irq+0x50/0xdc [msm]
> > [    7.455145] lr : dp_display_request_irq+0x2c/0xdc [msm]
> > [    7.455265] sp : ffff800008c1bb30
> > [    7.455285] x29: ffff800008c1bb30 x28: 0000000000000000 x27: 0000000=
000000000
> > [    7.455327] x26: ffffc9c918420000 x25: ffffc9c9186ec570 x24: 0000000=
00000003a
> > [    7.455368] x23: ffffc9c918811d30 x22: ffff2a5806baa998 x21: ffff2a5=
806ba3410
> > [    7.455410] x20: ffff2a5806baa880 x19: ffff2a5806baa998 x18: fffffff=
fffffffff
> > [    7.455451] x17: 0000000000000038 x16: ffffc9c9164eeb24 x15: fffffff=
fffffffff
> > [    7.455492] x14: ffff2a5806bc3004 x13: ffff2a5806bc3000 x12: 0000000=
000000000
> > [    7.455533] x11: 0000000000000040 x10: ffffc9c918493080 x9 : ffffc9c=
918493078
> > [    7.455574] x8 : ffff2a5800681b88 x7 : 0000000000000000 x6 : ffff2a5=
806baa880
> > [    7.455616] x5 : ffffc9c8ca2de000 x4 : 0000000000080004 x3 : 0000000=
000000000
> > [    7.455656] x2 : ffffc9c8ca296000 x1 : 00000000000000a8 x0 : 0000000=
000000000
> > [    7.455698] Call trace:
> > [    7.455714]  dp_display_request_irq+0x50/0xdc [msm]
> > [    7.455834]  dp_display_probe+0xf8/0x4a4 [msm]
> > [    7.455950]  platform_probe+0x6c/0xc4
> > [    7.455976]  really_probe+0xbc/0x2d4
> > [    7.455999]  __driver_probe_device+0x78/0xe0
> > [    7.456025]  driver_probe_device+0x3c/0x13c
> > [    7.456051]  __device_attach_driver+0xb8/0x120
> > [    7.456077]  bus_for_each_drv+0x78/0xd0
> > [    7.456105]  __device_attach+0x9c/0x1a0
> > [    7.456129]  device_initial_probe+0x18/0x2c
> > [    7.456154]  bus_probe_device+0x9c/0xa4
> > [    7.456178]  deferred_probe_work_func+0x88/0xc0
> > [    7.456204]  process_one_work+0x1d4/0x330
> > [    7.456231]  worker_thread+0x70/0x42c
> > [    7.456255]  kthread+0x10c/0x110
> > [    7.456278]  ret_from_fork+0x10/0x20
> > [    7.456306] Code: aa1403e6 f2a00104 f0000225 f0ffffe2 (f9400400)
> > [    7.456341] ---[ end trace 0000000000000000 ]---
>
> > This is from the sc8180x, sdm850 is the same call stack, just with
> > different addresses.
> >
> > I do have
> > https://lore.kernel.org/all/20220712132258.671263-1-dmitry.baryshkov@li=
naro.org/
> > applied here which makes the 10th patch not apply cleanly.
>
> Yeah, that is expected. You need to drop Dmitry's series first. Once you
> verified that this series works, you can add it back if you want but you
> then need to restore the device pointer used when allocating the irq in
> dp_display_request_irq():
>
> -       rc =3D devm_request_irq(dp_display->drm_dev->dev, dp->irq,
> +       rc =3D devm_request_irq(&dp->pdev->dev, dp->irq,
>
> > It fails actually, but I applied it manually here.
>
> Please drop that series and give this one another spin.
>
> Johan

I thought as much but wasn't sure.  Thanks for the clarification.
With Dmitriy's patchset backed out, this series does work as expected.

Tested-by: Steev Klimaszewski <steev@kali.org>
