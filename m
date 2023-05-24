Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58470F704
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA26A10E5FB;
	Wed, 24 May 2023 12:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348B410E673
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 12:58:12 +0000 (UTC)
Received: (qmail 355 invoked by uid 990); 24 May 2023 12:58:10 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Wed, 24 May 2023 12:58:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <b9c8243ed53c5c9d7c1b5711237f6130976ea99b@lausen.nl>
TLS-Required: No
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
To: "Kuogee Hsieh" <quic_khsieh@quicinc.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, 
 "Bjorn  Andersson" <andersson@kernel.org>
In-Reply-To: <e547edf4-1b48-5d12-1600-45f78e7cab49@quicinc.com>
References: <e547edf4-1b48-5d12-1600-45f78e7cab49@quicinc.com>
 <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
 <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
 <f2d1bb37-ea83-4d5d-6ef5-ae84c26d6ac1@quicinc.com>
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-2.261991) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: -0.861991
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 24 May 2023 14:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=0K2cVAiH3swWPanAhg2IlTJVOgHg2n2zSgYVoyJp/7U=;
 b=TJOCtOEpyTOW3b5jdDguZvXE5b+yKKv3JyPYZHjvcJFNIYGuSPaMqMvooZfnCKRoLTVGkmiX4w
 dJQUm4BqthzeyEUGcFTaMV/kqtbhToatNkHIHXvVr91+PhdzOzDSK7r2uq9Uz/0qkhfZCv2y3blq
 D6yd0Yh36vkKhVwR51eVCLd1Ta7xS7afH0scCP4JL4tQuvPAzFaCdzVWoSBzMhz58i4x+LJqeMUA
 wJqr+egnLAJqx5SrGcEn7dH58L+C1j1QTMFJOpnueIeGzUaedDKhSsP7XQsLfq3M/Tl7fwT9CTHr
 6UICJ2vxxk7t3U0lcJvGWD/1ElpJg2C1YVe7Uvfo2G0a199uI9Z7kJAMwfB7woVJ2O8Q8zSLekOy
 98/hrWGSICjtweMe0zMsaLWeQ/vKJzaF1Cl1wEzmj7OfPqw6REZIVNodrI1uFa64tn8Gz0KOEmBM
 PCHARP6sZCQm2nvHYY6rLbT2Vq3CVJWErm4AVIvNdPwKO/X/AVMJzwy4XdGG+uBM5NetI4FCqJAO
 WomqjWOdI7abcGR57R8EZAqjkg41D1HgBBKnwTf5skbkCvtoSkos+WQOYvQpVQ50xmG7D3ntkteU
 Jd8p0+/9WTjjrygUs7OMri0c+lqPvcWBp2K5V4AobQGPJY1pINOFVO/E06Q9oAgfh0ApKM7qxFkm
 Y=
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Nikita 
 Travkin <nikita@trvn.ru>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>>>>> [=C2=A0 275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done=
:488]
>>>>>> [dpu error]vblank timeout
>>>>>> [=C2=A0 275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu er=
ror]wait
>>>>>> for commit done returned -110
>>>>>> [=C2=A0 275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu
>>>>>> error]enc33 frame done timeout
>>>>
>>>> This is a different crash but the root-cause of both the issues is t=
he
>>>> bridge hpd_enable/disable series.
>>>>
>>>> https://patchwork.freedesktop.org/patch/514414/
>>
>> Yes, the new patch to fix this issue is here
>>
>> https://patchwork.freedesktop.org/patch/538601/?series=3D118148&rev=3D=
3
>>
>> Apologies if you were not CCed on this, if a next version is CCed,=20
>>=20will ask kuogee to cc you.
>>
>> Meanwhile, will be great if you can verify if it works for you and=20
>>=20provide Tested-by tags.
>
> Hi Leonard,
>
> I had=C2=A0 cc you with v5 patches.
>
> Would you please verify it.

Hi Kuogee,

thank you. Verified the v6 patch fixes the regression when ported to
6.3.3. One non-fatal issue remains: Suspending and resuming the system
while USB-C DP monitor is connected triggers an error, though the system
recovers within a second without the need to unplug the cable.

[drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-107)


dmesg snippet related to the suspend below

[  194.066321] PM: suspend entry (deep)
[  194.178793] Filesystems sync: 0.108 seconds
[  194.184142] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/qcom/sc7180-trogdor/modem-nolte/qdsp6sw.mbn" pid=3D3380 cmdline=3D""
[  194.196934] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/qcom/sc7180-trogdor/modem-nolte/mba.mbn" pid=3D3387 cmdline=3D""
[  194.197320] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/regulatory.db-debian" pid=3D3390 cmdline=3D""
[  194.204128] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/qcom/venus-5.4/venus.mbn" pid=3D3380 cmdline=3D""
[  194.204808] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/qca/crbtfw32.tlv" pid=3D3380 cmdline=3D""
[  194.205058] LoadPin: firmware pinning-ignored obj=3D"/usr/lib/firmware=
/qca/crnv32.bin" pid=3D3380 cmdline=3D""
[  194.253591] Freezing user space processes
[  194.263621] Freezing user space processes completed (elapsed 0.005 sec=
onds)
[  194.270816] OOM killer disabled.
[  194.274165] Freezing remaining freezable tasks
[  194.281253] Freezing remaining freezable tasks completed (elapsed 0.00=
2 seconds)
[  194.288866] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
[  194.494479] Disabling non-boot CPUs ...
[  194.497569] psci: CPU1 killed (polled 1 ms)
[  194.501844] psci: CPU2 killed (polled 1 ms)
[  194.506311] psci: CPU3 killed (polled 1 ms)
[  194.510237] psci: CPU4 killed (polled 1 ms)
[  194.512854] psci: CPU5 killed (polled 1 ms)
[  194.516076] psci: CPU6 killed (polled 1 ms)
[  194.518397] psci: CPU7 killed (polled 0 ms)
[  194.520706] Enabling non-boot CPUs ...
[  194.521595] Detected VIPT I-cache on CPU1
[  194.521664] cacheinfo: Unable to detect cache hierarchy for CPU 1
[  194.521678] GICv3: CPU1: found redistributor 100 region 0:0x0000000017=
a80000
[  194.521743] CPU1: Booted secondary processor 0x0000000100 [0x51df805e]
[  194.522829] CPU1 is up
[  194.523646] Detected VIPT I-cache on CPU2
[  194.523701] cacheinfo: Unable to detect cache hierarchy for CPU 2
[  194.523716] GICv3: CPU2: found redistributor 200 region 0:0x0000000017=
aa0000
[  194.523775] CPU2: Booted secondary processor 0x0000000200 [0x51df805e]
[  194.524809] CPU2 is up
[  194.525537] Detected VIPT I-cache on CPU3
[  194.525592] cacheinfo: Unable to detect cache hierarchy for CPU 3
[  194.525611] GICv3: CPU3: found redistributor 300 region 0:0x0000000017=
ac0000
[  194.525668] CPU3: Booted secondary processor 0x0000000300 [0x51df805e]
[  194.526674] CPU3 is up
[  194.527486] Detected VIPT I-cache on CPU4
[  194.527535] cacheinfo: Unable to detect cache hierarchy for CPU 4
[  194.527556] GICv3: CPU4: found redistributor 400 region 0:0x0000000017=
ae0000
[  194.527612] CPU4: Booted secondary processor 0x0000000400 [0x51df805e]
[  194.528836] CPU4 is up
[  194.529553] Detected VIPT I-cache on CPU5
[  194.529601] cacheinfo: Unable to detect cache hierarchy for CPU 5
[  194.529623] GICv3: CPU5: found redistributor 500 region 0:0x0000000017=
b00000
[  194.529675] CPU5: Booted secondary processor 0x0000000500 [0x51df805e]
[  194.530986] CPU5 is up
[  194.532280] Detected PIPT I-cache on CPU6
[  194.532307] cacheinfo: Unable to detect cache hierarchy for CPU 6
[  194.532322] GICv3: CPU6: found redistributor 600 region 0:0x0000000017=
b20000
[  194.532358] CPU6: Booted secondary processor 0x0000000600 [0x51ff804f]
[  194.534434] CPU6 is up
[  194.535408] Detected PIPT I-cache on CPU7
[  194.535445] cacheinfo: Unable to detect cache hierarchy for CPU 7
[  194.535463] GICv3: CPU7: found redistributor 700 region 0:0x0000000017=
b40000
[  194.535505] CPU7: Booted secondary processor 0x0000000700 [0x51ff804f]
[  194.536281] CPU7 is up
[  195.285023] onboard-usb-hub 1-1: reset high-speed USB device number 2 =
using xhci-hcd
[  195.541240] onboard-usb-hub 2-1: reset SuperSpeed USB device number 2 =
using xhci-hcd
[  195.796915] usb 1-1.4: reset high-speed USB device number 22 using xhc=
i-hcd
[  195.972952] usb 2-1.4: reset SuperSpeed USB device number 10 using xhc=
i-hcd
[  196.278492] usb 1-1.4.4: reset high-speed USB device number 24 using x=
hci-hcd
[  196.468996] usb 1-1.4.2: reset high-speed USB device number 26 using x=
hci-hcd
[  197.055717] usb 2-1.4.2: reset SuperSpeed USB device number 11 using x=
hci-hcd
[  197.845110] usb 2-1.4.4: reset SuperSpeed USB device number 12 using x=
hci-hcd
[  198.235191] [drm:drm_mode_config_helper_resume] *ERROR* Failed to resu=
me (-107)
[  198.528638] OOM killer enabled.
[  198.531866] Restarting tasks ...=20
[=20 198.531994] usb 1-1.4.4.1: USB disconnect, device number 27
[  198.532223] usb 1-1.4.3: USB disconnect, device number 23
[  198.532509] usb 1-1.4.2.1: USB disconnect, device number 29
[  198.534805] r8152-cfgselector 2-1.4.4.2: USB disconnect, device number=
 13
[  198.535444] done.
[  198.535536] usb 1-1.1: USB disconnect, device number 15
[  198.567811] random: crng reseeded on system resumption
[  198.583431] PM: suspend exit
