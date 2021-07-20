Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACA3CF13B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 03:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECE16E233;
	Tue, 20 Jul 2021 01:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F956E231;
 Tue, 20 Jul 2021 01:20:36 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id k184so30528668ybf.12;
 Mon, 19 Jul 2021 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DpvqyLOWtSd6SUj/nrK8j86LOAwNEwWcmSEZY/G68AU=;
 b=GD+ZZFLhM0olZlLqs+6aU0XLsr7QUS9xvFZbiF8SQQ67QJZO7Sk3LBpJ1/4mc1VQQ6
 eI/M7ZPMatl5ibEim9KQNhz3SF4yytB6WsIG8wdcbs1PoIJY4SCkrHfJiWkTfkLUFu+n
 ioMsV0F2jlklZuq3ul1dIl32DEzUkHlGwYB6rCHEyk5ajjhyGtda2UMp3pN2YQz+yyLq
 yDC0GcDBu6iYKfXEeXmDwHSiCVCOxS+ir8MqsiigtWPDjNosvOQ6k++xuT0N507FesCg
 0DHQTXaRvgprF1N12+tqur+c4dJFUxtdIHddzjQZz0zYNrQTbou3J6MtOKUbB1UIEZUX
 Yj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DpvqyLOWtSd6SUj/nrK8j86LOAwNEwWcmSEZY/G68AU=;
 b=QKgVL6idz0/XOKS14fFOsREwOJGKjQlWuvDhG24swOMisw6YWY4ojbCKt7F7QpGwMv
 BIRrJnGZGavx06eAxpUWkM/Mft9VAKO5KkpnfwcY5Rjp1QUyCh2fhOHmh/AilOk7Gjh1
 O0D2LZH+4z6Gp5y0hPqAj7+ZQlZYX/w3/0XJj43vIPt5qhTbEZB4Il2v+ZFLz6pHYA/E
 DfjWmvBqDijyAD/wGiRYesF/cmBoBpNzoP/iLLVfhO9J0d+v35m7s5An2Wwt3XteMYNz
 RZWoi0wArJ9DoeEWFQ+ALzhfp4hOCu4W2pPQzEdztMG4pApIbTy5ok8K3/NKkJpBkjmh
 HGnw==
X-Gm-Message-State: AOAM5305lGHzr3jRwpam7NE1fQdiToM1o4I/0ZJdY7AIUcaZu9QdCnVq
 jRrCB1/Bg6b51zYAolVlClAvIA6ynEArhyOHTKqN/smUdGIGPUcD
X-Google-Smtp-Source: ABdhPJzm4ga/ZOqGDquhCluqPhuyiA2+zOmiB+8AZPbxMXtAZiGoL+OaqOwyFJmQBMYLIAjqLWCG4PosDVvRlHZXe18=
X-Received: by 2002:a25:2d57:: with SMTP id s23mr35996097ybe.302.1626744035602; 
 Mon, 19 Jul 2021 18:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
 <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
 <CAKGbVbtRuVeUBD+m3J5U5AP_FM5S7i_qGXR-AHNeLnRogutVEQ@mail.gmail.com>
 <7462de54-5193-1606-7a93-390ad93c3b17@denx.de>
 <CAKGbVbt2nwcpf-H=gzR1-jEus7Dse36ikBt5Rg+QjmxKWLYOQw@mail.gmail.com>
 <7e75b9d0-0295-d04d-527f-971633f36532@xilinx.com>
 <BYAPR02MB45351BFFE6881440CBFC6FC7ACE19@BYAPR02MB4535.namprd02.prod.outlook.com>
 <016D5F28-CA7D-4B7D-B3BD-189E6E117D75@xilinx.com>
In-Reply-To: <016D5F28-CA7D-4B7D-B3BD-189E6E117D75@xilinx.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 20 Jul 2021 09:20:24 +0800
Message-ID: <CAKGbVbvqiUTWksoyJHjZZpYji9zYncpf3hYsisb7yTrFFt-+7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
To: Madhurkiran Harikrishnan <MADHURKI@xilinx.com>
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
Cc: Marek Vasut <marex@denx.de>, Michal Simek <monstr@monstr.eu>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 Jianqiang Chen <jianqian@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Michal Simek <michals@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 12:03 AM Madhurkiran Harikrishnan
<MADHURKI@xilinx.com> wrote:
>
> Hi,
>
> I had created a patch sometimes ago to test on our platform. That is corr=
ect, we have three clocks going to gp,pp0 and pp1 (Although all are at same=
 rate). DVFS is not supported primarily because at zynqmp clocks are shared=
, for example it could come from VPLL or IOPLL.
>
It's not necessary to change the root PLL clock rate to support DVFS.
You can also change a divisor to a sub clock if the sub clock is not
shared by another module. For example if root PLL is 700MHz, you can
set the divisor to GPU clock to 2 to make GPU run at 350MHz. My
question is if the GPU_REF_CTRL[13:8] is just such a divisor and can
be used to support DVFS (an OPP table in DTS)?

> All zynqmp specific patches can be found here: https://github.com/Xilinx/=
meta-xilinx/tree/rel-v2021.1/meta-xilinx-bsp/recipes-graphics/mali/kernel-m=
odule-mali
>
> -Mads
>
> =EF=BB=BFOn 7/19/21, 10:38 AM, "Jianqiang Chen" <jianqian@xilinx.com> wro=
te:
>
>     Add Mads.
>
>     Thanks,
>     Jason
>
>     > -----Original Message-----
>     > From: Michal Simek <michal.simek@xilinx.com>
>     > Sent: Monday, July 19, 2021 12:53 AM
>     > To: Qiang Yu <yuq825@gmail.com>; Marek Vasut <marex@denx.de>;
>     > Jianqiang Chen <jianqian@xilinx.com>
>     > Cc: dri-devel <dri-devel@lists.freedesktop.org>; lima@lists.freedes=
ktop.org;
>     > Michal Simek <michals@xilinx.com>; Michal Simek <monstr@monstr.eu>
>     > Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
>     >
>     >
>     >
>     > On 7/18/21 4:56 AM, Qiang Yu wrote:
>     > > On Sat, Jul 17, 2021 at 10:52 PM Marek Vasut <marex@denx.de> wrot=
e:
>     > >>
>     > >> On 7/17/21 4:21 PM, Qiang Yu wrote:
>     > >>> On Sat, Jul 17, 2021 at 9:08 PM Marek Vasut <marex@denx.de> wro=
te:
>     > >>>>
>     > >>>> On 7/17/21 2:34 PM, Qiang Yu wrote:
>     > >>>>> On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> w=
rote:
>     > >>>>>>
>     > >>>>>> Instead of requesting two separate clock and then handling t=
hem
>     > >>>>>> separately in various places of the driver, use clk_bulk_*()=
 API.
>     > >>>>>> This permits handling devices with more than "bus"/"core" cl=
ock,
>     > >>>>>> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as sepa=
rate
>     > >>>>>> clock.
>     > >>>>>
>     > >>>>> I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xi=
linx
>     > >>>>> which has mali GPU node with an upstream kernel, where is it?
>     > >>>>
>     > >>>> Posted here:
>     > >>>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20=
21071
>     > >>>> 6182544.219490-1-marex@denx.de/
>     > >>>>
>     > >>>>> So what's the relationship between "gpu" clk and
>     > "gpu_pp0"/"gpu_pp1"
>     > >>>>> clk? Do they need to be controlled separately or we can just
>     > >>>>> control the "gpu" clk? Because the devfreq code just controls=
 a single
>     > module clk.
>     > >>>>
>     > >>>> Per the docs, they are separate enable bits and the zynqmp clo=
ck
>     > >>>> controller exports them as separate clock, see bits 24..26 her=
e:
>     > >>>>
>     > >>>>
>     > https://www.xilinx.com/html_docs/registers/ug1087/crf_apb___gpu_ref
>     > >>>> _ctrl.html
>     > >>>>
>     > >>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>     > >>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>     > >>>>>> Cc: lima@lists.freedesktop.org
>     > >>>>>> ---
>     > >>>>>>    drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
>     > >>>>>>    drivers/gpu/drm/lima/lima_devfreq.h |  1 +
>     > >>>>>>    drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++-----=
--------
>     > -----
>     > >>>>>>    drivers/gpu/drm/lima/lima_device.h  |  4 +--
>     > >>>>>>    4 files changed, 32 insertions(+), 32 deletions(-)
>     > >>>>>>
>     > >>>>>> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c
>     > >>>>>> b/drivers/gpu/drm/lima/lima_devfreq.c
>     > >>>>>> index 8989e215dfc9..533b36932f79 100644
>     > >>>>>> --- a/drivers/gpu/drm/lima/lima_devfreq.c
>     > >>>>>> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
>     > >>>>>> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(str=
uct
>     > device *dev,
>     > >>>>>>           struct lima_devfreq *devfreq =3D &ldev->devfreq;
>     > >>>>>>           unsigned long irqflags;
>     > >>>>>>
>     > >>>>>> -       status->current_frequency =3D clk_get_rate(ldev->clk=
_gpu);
>     > >>>>>> +       status->current_frequency =3D
>     > >>>>>> + clk_get_rate(devfreq->clk_gpu);
>     > >>>>>>
>     > >>>>>>           spin_lock_irqsave(&devfreq->lock, irqflags);
>     > >>>>>>
>     > >>>>>> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_devi=
ce
>     > *ldev)
>     > >>>>>>           struct lima_devfreq *ldevfreq =3D &ldev->devfreq;
>     > >>>>>>           struct dev_pm_opp *opp;
>     > >>>>>>           unsigned long cur_freq;
>     > >>>>>> -       int ret;
>     > >>>>>> +       int i, ret;
>     > >>>>>>
>     > >>>>>>           if (!device_property_present(dev, "operating-point=
s-v2"))
>     > >>>>>>                   /* Optional, continue without devfreq */
>     > >>>>>>                   return 0;
>     > >>>>>>
>     > >>>>>> +       /* Find first clock which are not "bus" clock */
>     > >>>>>> +       for (i =3D 0; i < ldev->nr_clks; i++) {
>     > >>>>>> +               if (!strcmp(ldev->clks[i].id, "bus"))
>     > >>>>>> +                       continue;
>     > >>>>>> +               ldevfreq->clk_gpu =3D ldev->clks[i].clk;
>     > >>>>>> +               break;
>     > >>>>>> +       }
>     > >>>>>
>     > >>>>> I'd prefer an explicit name for the required clk name. If som=
e DTS
>     > >>>>> has different name other than "core" for the module clk (ie.
>     > >>>>> "gpu"), it should be changed to "core".
>     > >>>>
>     > >>>> The problem here is, the zynqmp has no core clock, it has "gpu=
 and
>     > >>>> both pixel pipes" super-clock-gate which controls everything, =
and
>     > >>>> then per-pixel-pipe sub-clock-gates.
>     > >>>
>     > >>> So the "gpu" clk can gate both "gpu_pp0" and "gpu_pp1" clk, how=
 about
>     > frequency?
>     > >>
>     > >> I don't think it is a good idea to just gate off the root clock =
while
>     > >> the sub-clock are still enabled. That might lead to latch ups (+=
CC
>     > >> Michal, he might know more).
>     > >>
>     > >> And who would enable the sub-clock anyway, it should be the GPU =
driver,
>     > no?
>     > >>
>     > > Right, I understand it's not proper either by HW or SW point of v=
iew
>     > > to just use root clk gate.
>     > >
>     > >>> Can we set clock rate for "gpu" then "gpu_pp0" and "gpu_pp1" pa=
ss
>     > >>> through the same rate? If so, "gpu" works just like "core".
>     > >>
>     > >> I don't think the zynqmp is capable of any DVFS on the GPU at al=
l, it
>     > >> just runs at fixed frequency.
>     > >
>     > > I see the GPU_REF_CTRL register 13:8 is a divisor, is this for al=
l
>     > > "gpu"/"gpu_pp0"/"gpu_pp1" clk rating? If so, can we use it to
>     > > dynamically change the GPU clk freq because other SoC also use sy=
stem
>     > > clock to do GPU DVFS, see sun8i-h3.dtsi. If we can't then zynqmp =
won't
>     > > finish
>     > > lima_devfreq_init() and get here at all because it does not have =
an
>     > > OPP table.
>     > >
>     >
>     > Jianqiang: Please take a look at this from zynqmp point of view.
>
>     Hi Mads, can you comment on this?
>
>     >
>     > Thanks,
>     > Michal
>
