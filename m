Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E470253E63
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEAF6EB3C;
	Thu, 27 Aug 2020 06:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881856E357
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:23:39 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m23so3128459iol.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iYoq01qIbGPauST5RfEEhLR3G1zLYNWZoPlBmyH0nwc=;
 b=rrACsr3CvBASDErVlhyy5K/fvnE8tuvuh2uL4jiaUL3ZGIxyyW4t874WgsTFTUoygE
 0nd8dw2k6j5xfynBZ5BbH95ghQWO1tmk7qS4QlhhS+UpQrW6VIixR6b9/tabHPbrZ1TA
 woRwMlA1QVHyLaxTiI+ivqIC95ZJuDOtfQTTRjgK/HRRPkZA+BKnnG+a/1BKvKYfczZW
 giax0/bYLHTK1M0qOlsm4qENxTU2Bh4hQC+PjQEIdvsBdLlLAs06s5gOU5WsPK3RNiVa
 O8bil5tUrtg/+lUTAs1DLmtjKaPjTtBsrUkUk5J3gV7xeMNwjOueDK9lEWOPdwyFfjWL
 4fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iYoq01qIbGPauST5RfEEhLR3G1zLYNWZoPlBmyH0nwc=;
 b=GS7yjcOYS+nBmMFHdrrvtfDDf4Qn/HNsJ3JSBw4Hqi2rg0Tca5lC0VhunDwxc2X3rh
 PlkXEFh+0tBXM58+G1HRZDrVXVb2taoupp6AaCQ7P+5XN8zRzLClCkMkw80Lf1yzjGRH
 zhZPg/KiPK7q6dTyTU46JOYKzHZ3WGIdcX+mUyyLWqp/dDkSYl7VHRL+lx5GsbVS3Mno
 5jn8lEHnH2t9B2/FPbXlHbqzGj5pjdfxrDN/rfnv7ECAuZQktj/9HXdK0kUtKEHL9JtC
 bZK6BD2+tKJStpvVXK1V7cOPYdWNYk1PXlyJpNi1SoZg0l97rgOTMHTbmcQAQhbjNC7d
 UNGQ==
X-Gm-Message-State: AOAM532gjw/Mkat49xhqhEHPl6fUcP1TVA4buo5LMm6m1FiQokmyPUK7
 ILM6k3vb93TcQEXEsf+a7fbna7WrpTeHLaWgFZptDA==
X-Google-Smtp-Source: ABdhPJwFN6cBCs9PM+s7XTIce9XLWKWdjPF/GBPpGUznZWktGx6heltYKpGLa4ads24y20InNb1vg24deYZIDTRb1/0=
X-Received: by 2002:a05:6638:258a:: with SMTP id
 s10mr16082808jat.101.1598466218702; 
 Wed, 26 Aug 2020 11:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <03caf286-09e8-a072-8d3a-b6bcca991516@arm.com>
In-Reply-To: <03caf286-09e8-a072-8d3a-b6bcca991516@arm.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Wed, 26 Aug 2020 14:23:26 -0400
Message-ID: <CALQxJuttUa0=Z0dQrgxAE=+w-UeE5XPW3b3BBzujtJ3aw5J8LQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Kukjin Kim <kgene@kernel.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="===============1882660024=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1882660024==
Content-Type: multipart/alternative; boundary="00000000000026d76505adcbeb74"

--00000000000026d76505adcbeb74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That would be great!

On Wed., Aug. 26, 2020, 2:14 p.m. Robin Murphy, <robin.murphy@arm.com>
wrote:

> Hi Tom,
>
> On 2019-12-21 15:03, Tom Murphy wrote:
> > This patchset converts the intel iommu driver to the dma-iommu api.
> >
> > While converting the driver I exposed a bug in the intel i915 driver
> which causes a huge amount of artifacts on the screen of my laptop. You c=
an
> see a picture of it here:
> >
> https://github.com/pippy360/kernelPatches/blob/master/IMG_20191219_225922=
.jpg
> >
> > This issue is most likely in the i915 driver and is most likely caused
> by the driver not respecting the return value of the dma_map_ops::map_sg
> function. You can see the driver ignoring the return value here:
> >
> https://github.com/torvalds/linux/blob/7e0165b2f1a912a06e381e91f0f4e495f4=
ac3736/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L51
> >
> > Previously this didn=E2=80=99t cause issues because the intel map_sg al=
ways
> returned the same number of elements as the input scatter gather list but
> with the change to this dma-iommu api this is no longer the case. I wasn=
=E2=80=99t
> able to track the bug down to a specific line of code unfortunately.
> >
> > Could someone from the intel team look at this?
> >
> >
> > I have been testing on a lenovo x1 carbon 5th generation. Let me know i=
f
> there=E2=80=99s any more information you need.
> >
> > To allow my patch set to be tested I have added a patch (patch 8/8) in
> this series to disable combining sg segments in the dma-iommu api which
> fixes the bug but it doesn't fix the actual problem.
> >
> > As part of this patch series I copied the intel bounce buffer code to
> the dma-iommu path. The addition of the bounce buffer code took me by
> surprise. I did most of my development on this patch series before the
> bounce buffer code was added and my reimplementation in the dma-iommu pat=
h
> is very rushed and not properly tested but I=E2=80=99m running out of tim=
e to work
> on this patch set.
> >
> > On top of that I also didn=E2=80=99t port over the intel tracing code f=
rom this
> commit:
> >
> https://github.com/torvalds/linux/commit/3b53034c268d550d9e8522e613a14ab5=
3b8840d8#diff-6b3e7c4993f05e76331e463ab1fc87e1
> > So all the work in that commit is now wasted. The code will need to be
> removed and reimplemented in the dma-iommu path. I would like to take the
> time to do this but I really don=E2=80=99t have the time at the moment an=
d I want
> to get these changes out before the iommu code changes any more.
>
> Further to what we just discussed at LPC, I've realised that tracepoints
> are actually something I could do with *right now* for debugging my Arm
> DMA ops series, so if I'm going to hack something up anyway I may as
> well take responsibility for polishing it into a proper patch as well :)
>
> Robin.
>
> >
> > Tom Murphy (8):
> >    iommu/vt-d: clean up 32bit si_domain assignment
> >    iommu/vt-d: Use default dma_direct_* mapping functions for direct
> >      mapped devices
> >    iommu/vt-d: Remove IOVA handling code from non-dma_ops path
> >    iommu: Handle freelists when using deferred flushing in iommu driver=
s
> >    iommu: Add iommu_dma_free_cpu_cached_iovas function
> >    iommu: allow the dma-iommu api to use bounce buffers
> >    iommu/vt-d: Convert intel iommu driver to the iommu ops
> >    DO NOT MERGE: iommu: disable list appending in dma-iommu
> >
> >   drivers/iommu/Kconfig           |   1 +
> >   drivers/iommu/amd_iommu.c       |  14 +-
> >   drivers/iommu/arm-smmu-v3.c     |   3 +-
> >   drivers/iommu/arm-smmu.c        |   3 +-
> >   drivers/iommu/dma-iommu.c       | 183 +++++--
> >   drivers/iommu/exynos-iommu.c    |   3 +-
> >   drivers/iommu/intel-iommu.c     | 936 ++++---------------------------=
-
> >   drivers/iommu/iommu.c           |  39 +-
> >   drivers/iommu/ipmmu-vmsa.c      |   3 +-
> >   drivers/iommu/msm_iommu.c       |   3 +-
> >   drivers/iommu/mtk_iommu.c       |   3 +-
> >   drivers/iommu/mtk_iommu_v1.c    |   3 +-
> >   drivers/iommu/omap-iommu.c      |   3 +-
> >   drivers/iommu/qcom_iommu.c      |   3 +-
> >   drivers/iommu/rockchip-iommu.c  |   3 +-
> >   drivers/iommu/s390-iommu.c      |   3 +-
> >   drivers/iommu/tegra-gart.c      |   3 +-
> >   drivers/iommu/tegra-smmu.c      |   3 +-
> >   drivers/iommu/virtio-iommu.c    |   3 +-
> >   drivers/vfio/vfio_iommu_type1.c |   2 +-
> >   include/linux/dma-iommu.h       |   3 +
> >   include/linux/intel-iommu.h     |   1 -
> >   include/linux/iommu.h           |  32 +-
> >   23 files changed, 345 insertions(+), 908 deletions(-)
> >
>

--00000000000026d76505adcbeb74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That would be great!</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed., Aug. 26, 2020, 2:14 p.m. Rob=
in Murphy, &lt;<a href=3D"mailto:robin.murphy@arm.com">robin.murphy@arm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Tom,<br>
<br>
On 2019-12-21 15:03, Tom Murphy wrote:<br>
&gt; This patchset converts the intel iommu driver to the dma-iommu api.<br=
>
&gt; <br>
&gt; While converting the driver I exposed a bug in the intel i915 driver w=
hich causes a huge amount of artifacts on the screen of my laptop. You can =
see a picture of it here:<br>
&gt; <a href=3D"https://github.com/pippy360/kernelPatches/blob/master/IMG_2=
0191219_225922.jpg" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/pippy360/kernelPatches/blob/master/IMG_20191219_225922.jpg</a><=
br>
&gt; <br>
&gt; This issue is most likely in the i915 driver and is most likely caused=
 by the driver not respecting the return value of the dma_map_ops::map_sg f=
unction. You can see the driver ignoring the return value here:<br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/7e0165b2f1a912a06e38=
1e91f0f4e495f4ac3736/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L51" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/torvalds/linux=
/blob/7e0165b2f1a912a06e381e91f0f4e495f4ac3736/drivers/gpu/drm/i915/gem/i91=
5_gem_dmabuf.c#L51</a><br>
&gt; <br>
&gt; Previously this didn=E2=80=99t cause issues because the intel map_sg a=
lways returned the same number of elements as the input scatter gather list=
 but with the change to this dma-iommu api this is no longer the case. I wa=
sn=E2=80=99t able to track the bug down to a specific line of code unfortun=
ately.<br>
&gt; <br>
&gt; Could someone from the intel team look at this?<br>
&gt; <br>
&gt; <br>
&gt; I have been testing on a lenovo x1 carbon 5th generation. Let me know =
if there=E2=80=99s any more information you need.<br>
&gt; <br>
&gt; To allow my patch set to be tested I have added a patch (patch 8/8) in=
 this series to disable combining sg segments in the dma-iommu api which fi=
xes the bug but it doesn&#39;t fix the actual problem.<br>
&gt; <br>
&gt; As part of this patch series I copied the intel bounce buffer code to =
the dma-iommu path. The addition of the bounce buffer code took me by surpr=
ise. I did most of my development on this patch series before the bounce bu=
ffer code was added and my reimplementation in the dma-iommu path is very r=
ushed and not properly tested but I=E2=80=99m running out of time to work o=
n this patch set.<br>
&gt; <br>
&gt; On top of that I also didn=E2=80=99t port over the intel tracing code =
from this commit:<br>
&gt; <a href=3D"https://github.com/torvalds/linux/commit/3b53034c268d550d9e=
8522e613a14ab53b8840d8#diff-6b3e7c4993f05e76331e463ab1fc87e1" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/torvalds/linux/commit=
/3b53034c268d550d9e8522e613a14ab53b8840d8#diff-6b3e7c4993f05e76331e463ab1fc=
87e1</a><br>
&gt; So all the work in that commit is now wasted. The code will need to be=
 removed and reimplemented in the dma-iommu path. I would like to take the =
time to do this but I really don=E2=80=99t have the time at the moment and =
I want to get these changes out before the iommu code changes any more.<br>
<br>
Further to what we just discussed at LPC, I&#39;ve realised that tracepoint=
s <br>
are actually something I could do with *right now* for debugging my Arm <br=
>
DMA ops series, so if I&#39;m going to hack something up anyway I may as <b=
r>
well take responsibility for polishing it into a proper patch as well :)<br=
>
<br>
Robin.<br>
<br>
&gt; <br>
&gt; Tom Murphy (8):<br>
&gt;=C2=A0 =C2=A0 iommu/vt-d: clean up 32bit si_domain assignment<br>
&gt;=C2=A0 =C2=A0 iommu/vt-d: Use default dma_direct_* mapping functions fo=
r direct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mapped devices<br>
&gt;=C2=A0 =C2=A0 iommu/vt-d: Remove IOVA handling code from non-dma_ops pa=
th<br>
&gt;=C2=A0 =C2=A0 iommu: Handle freelists when using deferred flushing in i=
ommu drivers<br>
&gt;=C2=A0 =C2=A0 iommu: Add iommu_dma_free_cpu_cached_iovas function<br>
&gt;=C2=A0 =C2=A0 iommu: allow the dma-iommu api to use bounce buffers<br>
&gt;=C2=A0 =C2=A0 iommu/vt-d: Convert intel iommu driver to the iommu ops<b=
r>
&gt;=C2=A0 =C2=A0 DO NOT MERGE: iommu: disable list appending in dma-iommu<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/iommu/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0drivers/iommu/amd_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 14 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/arm-smmu-v3.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/arm-smmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/dma-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 183 =
+++++--<br>
&gt;=C2=A0 =C2=A0drivers/iommu/exynos-iommu.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 =
+-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/intel-iommu.c=C2=A0 =C2=A0 =C2=A0| 936 ++++-=
---------------------------<br>
&gt;=C2=A0 =C2=A0drivers/iommu/iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 39 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/ipmmu-vmsa.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/msm_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/mtk_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/mtk_iommu_v1.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 =
+-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/omap-iommu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/qcom_iommu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/rockchip-iommu.c=C2=A0 |=C2=A0 =C2=A03 +-<br=
>
&gt;=C2=A0 =C2=A0drivers/iommu/s390-iommu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/tegra-gart.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/tegra-smmu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/iommu/virtio-iommu.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 =
+-<br>
&gt;=C2=A0 =C2=A0drivers/vfio/vfio_iommu_type1.c |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0include/linux/dma-iommu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0include/linux/intel-iommu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 -<br>
&gt;=C2=A0 =C2=A0include/linux/iommu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 32 +-<br>
&gt;=C2=A0 =C2=A023 files changed, 345 insertions(+), 908 deletions(-)<br>
&gt; <br>
</blockquote></div>

--00000000000026d76505adcbeb74--

--===============1882660024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1882660024==--
