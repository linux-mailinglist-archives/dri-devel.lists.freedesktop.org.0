Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0803313C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 15:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E852F891FA;
	Mon,  3 Jun 2019 13:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22116891FA;
 Mon,  3 Jun 2019 13:39:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so3870394wrn.1;
 Mon, 03 Jun 2019 06:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OGd/wZlcKk8OR0e9eywNJXJdwbPz/GOTBVPWXmYjO9Q=;
 b=lDYLGBICpsdF2FQAJ+iju3aPUDDCDEenRFiucPuX8Hc3dP1HlSIFRW6LlG8WnsuJLb
 oIjGqFWVg4Xlt9fxMcQB4+KsxoBEFPaCnH+8C4U1otjcUghI6kGqtQrXk2uT7cVgRlba
 SiSe0B3Vg/Wuq0gxACKrBjARb3eujvD2m/O3vVk87oJjpLoZ5geUcbBdvPiFpRpmp7n2
 057Sh0P6+6+mFSEmgAl6XNDbDmIlbZHevfBw+AXxQ24sgZVluK4CVQ0RNCNkIivPoP/w
 PTGmeoRTCqy3iuL/VMNUXiQvCrgb6vPswpc7BMX9dmoqJ+gLaFdr7CI/x4Bhvoxc4XdW
 5+mw==
X-Gm-Message-State: APjAAAUF9+xfT+uYt22hl+4V67fJAaZkCUVuCCW/nDo+dXbMFHUEdNO5
 39MXDTSmq+PA0HXHLxu8rFI=
X-Google-Smtp-Source: APXvYqzL+u98luSQybxP10AJJpuDIP1Z0OLlJY6PQnLVEXpUXPIRm63JJLPfhsY4S88bCQiTYDT65Q==
X-Received: by 2002:adf:a749:: with SMTP id e9mr16739435wrd.64.1559569161478; 
 Mon, 03 Jun 2019 06:39:21 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id s63sm6129254wme.17.2019.06.03.06.39.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 03 Jun 2019 06:39:19 -0700 (PDT)
Date: Mon, 3 Jun 2019 15:39:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Message-ID: <20190603133918.GD30132@ulmo>
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
MIME-Version: 1.0
In-Reply-To: <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OGd/wZlcKk8OR0e9eywNJXJdwbPz/GOTBVPWXmYjO9Q=;
 b=dG+p+G/1M6qCVmTYyElfvb34+7ZiQM+mgPnXs/5YnNMQD2FVW6401aKatULSBhrAfO
 /p3qdrPutjpLS8pwLJxi0vAbBhKbtvjadf0DiKlmuvL8qzFputVObNkd8CDwlzKCkVA/
 d7p4wfEsfZKIfX1jcyWSDKnhMwhsncdCVV3FNmB82FFqF3ps7suMgKOynh0jIV6lTQ+k
 zwukyI9Nuz/vbMY7gegL2pet0FJ8K1DleazG0jEVV1Yvfoen009X6f3a+w5o33Wno/E/
 UQ3L3E/VUVjHt7cbRmtsySEOOUZ6/L+8NNlbq3F4tPlmIUe+BDiVTea7vlve83j7G4BU
 EzBQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Sean Paul <seanpaul@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1242468331=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1242468331==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline


--Q8BnQc91gJZX4vDc
Content-Type: multipart/mixed; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 12:14:27PM +0100, Robin Murphy wrote:
> On 03/06/2019 11:47, Rob Clark wrote:
> > On Sun, Jun 2, 2019 at 11:25 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >=20
> > > On Mon, Jun 3, 2019 at 4:40 AM Rob Clark <robdclark@gmail.com> wrote:
> > > >=20
> > > > On Fri, May 10, 2019 at 7:35 AM Rob Clark <robdclark@gmail.com> wro=
te:
> > > > >=20
> > > > > On Tue, Dec 4, 2018 at 2:29 PM Rob Herring <robh+dt@kernel.org> w=
rote:
> > > > > >=20
> > > > > > On Sat, Dec 1, 2018 at 10:54 AM Rob Clark <robdclark@gmail.com>=
 wrote:
> > > > > > >=20
> > > > > > > This solves a problem we see with drm/msm, caused by getting
> > > > > > > iommu_dma_ops while we attach our own domain and manage it di=
rectly at
> > > > > > > the iommu API level:
> > > > > > >=20
> > > > > > >    [0000000000000038] user address but active_mm is swapper
> > > > > > >    Internal error: Oops: 96000005 [#1] PREEMPT SMP
> > > > > > >    Modules linked in:
> > > > > > >    CPU: 7 PID: 70 Comm: kworker/7:1 Tainted: G        W      =
   4.19.3 #90
> > > > > > >    Hardware name: xxx (DT)
> > > > > > >    Workqueue: events deferred_probe_work_func
> > > > > > >    pstate: 80c00009 (Nzcv daif +PAN +UAO)
> > > > > > >    pc : iommu_dma_map_sg+0x7c/0x2c8
> > > > > > >    lr : iommu_dma_map_sg+0x40/0x2c8
> > > > > > >    sp : ffffff80095eb4f0
> > > > > > >    x29: ffffff80095eb4f0 x28: 0000000000000000
> > > > > > >    x27: ffffffc0f9431578 x26: 0000000000000000
> > > > > > >    x25: 00000000ffffffff x24: 0000000000000003
> > > > > > >    x23: 0000000000000001 x22: ffffffc0fa9ac010
> > > > > > >    x21: 0000000000000000 x20: ffffffc0fab40980
> > > > > > >    x19: ffffffc0fab40980 x18: 0000000000000003
> > > > > > >    x17: 00000000000001c4 x16: 0000000000000007
> > > > > > >    x15: 000000000000000e x14: ffffffffffffffff
> > > > > > >    x13: ffff000000000000 x12: 0000000000000028
> > > > > > >    x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
> > > > > > >    x9 : 0000000000000000 x8 : ffffffc0fab409a0
> > > > > > >    x7 : 0000000000000000 x6 : 0000000000000002
> > > > > > >    x5 : 0000000100000000 x4 : 0000000000000000
> > > > > > >    x3 : 0000000000000001 x2 : 0000000000000002
> > > > > > >    x1 : ffffffc0f9431578 x0 : 0000000000000000
> > > > > > >    Process kworker/7:1 (pid: 70, stack limit =3D 0x0000000017=
d08ffb)
> > > > > > >    Call trace:
> > > > > > >     iommu_dma_map_sg+0x7c/0x2c8
> > > > > > >     __iommu_map_sg_attrs+0x70/0x84
> > > > > > >     get_pages+0x170/0x1e8
> > > > > > >     msm_gem_get_iova+0x8c/0x128
> > > > > > >     _msm_gem_kernel_new+0x6c/0xc8
> > > > > > >     msm_gem_kernel_new+0x4c/0x58
> > > > > > >     dsi_tx_buf_alloc_6g+0x4c/0x8c
> > > > > > >     msm_dsi_host_modeset_init+0xc8/0x108
> > > > > > >     msm_dsi_modeset_init+0x54/0x18c
> > > > > > >     _dpu_kms_drm_obj_init+0x430/0x474
> > > > > > >     dpu_kms_hw_init+0x5f8/0x6b4
> > > > > > >     msm_drm_bind+0x360/0x6c8
> > > > > > >     try_to_bring_up_master.part.7+0x28/0x70
> > > > > > >     component_master_add_with_match+0xe8/0x124
> > > > > > >     msm_pdev_probe+0x294/0x2b4
> > > > > > >     platform_drv_probe+0x58/0xa4
> > > > > > >     really_probe+0x150/0x294
> > > > > > >     driver_probe_device+0xac/0xe8
> > > > > > >     __device_attach_driver+0xa4/0xb4
> > > > > > >     bus_for_each_drv+0x98/0xc8
> > > > > > >     __device_attach+0xac/0x12c
> > > > > > >     device_initial_probe+0x24/0x30
> > > > > > >     bus_probe_device+0x38/0x98
> > > > > > >     deferred_probe_work_func+0x78/0xa4
> > > > > > >     process_one_work+0x24c/0x3dc
> > > > > > >     worker_thread+0x280/0x360
> > > > > > >     kthread+0x134/0x13c
> > > > > > >     ret_from_fork+0x10/0x18
> > > > > > >    Code: d2800004 91000725 6b17039f 5400048a (f9401f40)
> > > > > > >    ---[ end trace f22dda57f3648e2c ]---
> > > > > > >    Kernel panic - not syncing: Fatal exception
> > > > > > >    SMP: stopping secondary CPUs
> > > > > > >    Kernel Offset: disabled
> > > > > > >    CPU features: 0x0,22802a18
> > > > > > >    Memory Limit: none
> > > > > > >=20
> > > > > > > The problem is that when drm/msm does it's own iommu_attach_d=
evice(),
> > > > > > > now the domain returned by iommu_get_domain_for_dev() is drm/=
msm's
> > > > > > > domain, and it doesn't have domain->iova_cookie.
> > > > > > >=20
> > > > > > > We kind of avoided this problem prior to sdm845/dpu because t=
he iommu
> > > > > > > was attached to the mdp node in dt, which is a child of the t=
oplevel
> > > > > > > mdss node (which corresponds to the dev passed in dma_map_sg(=
)).  But
> > > > > > > with sdm845, now the iommu is attached at the mdss level so w=
e hit the
> > > > > > > iommu_dma_ops in dma_map_sg().
> > > > > > >=20
> > > > > > > But auto allocating/attaching a domain before the driver is p=
robed was
> > > > > > > already a blocking problem for enabling per-context pagetable=
s for the
> > > > > > > GPU.  This problem is also now solved with this patch.
> > > > > > >=20
> > > > > > > Fixes: 97890ba9289c dma-mapping: detect and configure IOMMU i=
n of_dma_configure
> > > > > > > Tested-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > Signed-off-by: Rob Clark <robdclark@gmail.com>
> > > > > > > ---
> > > > > > > This is an alternative/replacement for [1].  What it lacks in=
 elegance
> > > > > > > it makes up for in practicality ;-)
> > > > > > >=20
> > > > > > > [1] https://patchwork.freedesktop.org/patch/264930/
> > > > > > >=20
> > > > > > >   drivers/of/device.c | 22 ++++++++++++++++++++++
> > > > > > >   1 file changed, 22 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > > > > > > index 5957cd4fa262..15ffee00fb22 100644
> > > > > > > --- a/drivers/of/device.c
> > > > > > > +++ b/drivers/of/device.c
> > > > > > > @@ -72,6 +72,14 @@ int of_device_add(struct platform_device *=
ofdev)
> > > > > > >          return device_add(&ofdev->dev);
> > > > > > >   }
> > > > > > >=20
> > > > > > > +static const struct of_device_id iommu_blacklist[] =3D {
> > > > > > > +       { .compatible =3D "qcom,mdp4" },
> > > > > > > +       { .compatible =3D "qcom,mdss" },
> > > > > > > +       { .compatible =3D "qcom,sdm845-mdss" },
> > > > > > > +       { .compatible =3D "qcom,adreno" },
> > > > > > > +       {}
> > > > > > > +};
> > > > > >=20
> > > > > > Not completely clear to whether this is still needed or not, bu=
t this
> > > > > > really won't scale. Why can't the driver for these devices over=
ride
> > > > > > whatever has been setup by default?
> > > > > >=20
> > > > >=20
> > > > > fwiw, at the moment it is not needed, but it will become needed a=
gain
> > > > > to implement per-context pagetables (although I suppose for this =
we
> > > > > only need to blacklist qcom,adreno and not also the display nodes=
).
> > > >=20
> > > > So, another case I've come across, on the display side.. I'm working
> > > > on handling the case where bootloader enables display (and takes io=
mmu
> > > > out of reset).. as soon as DMA domain gets attached we get iommu
> > > > faults, because bootloader has already configured display for scano=
ut.
> > > > Unfortunately this all happens before actual driver is probed and h=
as
> > > > a chance to intervene.
> > > >=20
> > > > It's rather unfortunate that we tried to be clever rather than just
> > > > making drivers call some function to opt-in to the hookup of dma io=
mmu
> > > > ops :-(
> > >=20
> > > I think it still works for the 90% of cases and if 10% needs some
> > > explicit work in the drivers, that's better than requiring 100% of the
> > > drivers to do things manually.
>=20
> Right, it's not about "being clever", it's about not adding opt-in code to
> the hundreds and hundreds and hundreds of drivers which *might* ever find
> themselves used on a system where they would need the IOMMU's help for DM=
A.
>=20
> > > Adding Marek who had the same problem on Exynos.
> >=20
> > I do wonder how many drivers need to iommu_map in their ->probe()?
> > I'm thinking moving the auto-hookup to after a successful probe(),
> > with some function a driver could call if they need mapping in probe,
> > might be a way to eventually get rid of the blacklist.  But I've no
> > idea how to find the subset of drivers that would be broken without a
> > dma_setup_iommu_stuff() call in their probe.
>=20
> Wouldn't help much. That particular issue is nothing to do with DMA ops
> really, it's about IOMMU initialisation. On something like SMMUv3 there is
> literally no way to turn the thing on without blocking unknown traffic - =
it
> *has* to have stream table entries programmed before it can even allow st=
uff
> to bypass.
>=20
> The answer is either to either pay attention to the "Quiesce all DMA capa=
ble
> devices" part of the boot protocol (which has been there since pretty much
> forever), or to come up with some robust way of communicating "live"
> boot-time mappings to IOMMU drivers so that they can program themselves
> appropriately during probe.

I ran into a similar issue not too long ago and I've been working on
what I think is a correct fix for this problem. Unfortunately I went
down the rabbit hole of trying to get all of the pieces in the
bootloader merged before posting the kernel patches, and that's been
taking a long time. Let me chime in here in the hope that it will be
helpful to others.

The problem that I ran into was pretty much the same thing that Rob
encountered. We have some platforms that will initialize display over
HDMI in an early bootloader to show a splash screen. During boot we
would usually take over display hardware by just resetting it and then
programming it from scratch. Ultimately we want to do seamless handover
so that the kernel can take over the splash and replace it by the
console when that's ready. But I'm getting ahead of myself.

One of the things I've been trying to do is replace direct IOMMU API
usage in the Tegra DRM driver by using DMA API only, which we need in
order to fix some corner cases we ran into (I've now forgotten most of
the details and I realize that my commit messages aren't all that
helpful...).

Anyway, when I started using the DMA API I was running into a massive
amount of IOMMU faults starting at early boot. It took me a while to
realize that this was because now the IOMMU was enabled before the
driver had a chance to set up the IOMMU domain. I think the only way
that we were getting around that was because we used to have a custom
IOMMU driver on older Tegra device and don't expose DMA API compatible
IOMMU domains. With newer Tegras using the ARM SMMU we don't really have
that option anymore.

So the root cause of this is that the bootloader initialized the display
controller to scan out from a physical address (the bootloader does not
set up the SMMU) and when the kernel attaches the display controller to
the SMMU during early boot, the display controller ends up trying to
fetch those physical addresses through the SMMU where no mapping for
those addresses exists, hence causing these faults.

The solution that I came up with is to use the reserved-memory bindings
along with memory-region references in the display controller nodes. I
have a patch for the Tegra SMMU driver that implements support for
parsing this data (the IOMMU framework has infrastructure to do this, so
I take it that this has come up before) and setting up 1:1 mappings
right before the SMMU is enabled for a device. This works rather well in
my testing. I've been using hard-coded values because the bootloader
does not properly put the reserved memory regions into the DT. I've been
trying to add that as a side-project, but it turned into a bit of a can
of worms.

These are all standard bindings, so I think we could implement something
similar in the ARM SMMU driver. In fact, I was going to do that once I
had sorted this all out for Tegra SMMU, but I'd be happy if anyone can
beat me to it.

I've attached the patch for Tegra SMMU here. I think pretty much the
same thing could be implement for any other drivers since this is based
on standard bindings. Perhaps there could even be helpers. Actually it
looks like one such helpers already exists:

	iommu_dma_get_resv_regions()

I think the generic code looking up the standard memory-region property
could be added to that to expose this functionality more broadly.

One thing to note is that I have this workaround in the Tegra SMMU
driver to bind the IOMMU domain to a specific instance during this early
direct mappings business. But I think that may no longer be necessary
since there seems to have been some work in this area lately.
Specifically I'm looking at 7423e01741dd6a5f1255f589145313f0fb1c8cbe,
which may help. I can investigate, but let me post the patch first to
keep the discussion going.

Here's a short extract of how I'm using this in device tree:

--- >8 ---
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2371-2180.dts
index 5a57396b5948..82c4e0c88740 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -8,6 +8,16 @@
        model =3D "NVIDIA Jetson TX1 Developer Kit";
        compatible =3D "nvidia,p2371-2180", "nvidia,tegra210";

+       reserved-memory {
+               #address-cells =3D <2>;
+               #size-cells =3D <2>;
+               ranges;
+
+               framebuffer: framebuffer@92c9f000 {
+                       reg =3D <0 0x92c9f000 0 0x00800000>;
+               };
+       };
+
        pcie@1003000 {
                status =3D "okay";

@@ -35,6 +45,14 @@
        };

        host1x@50000000 {
+               dc@54200000 {
+                       memory-region =3D <&framebuffer>;
+               };
+
+               dc@54240000 {
+                       memory-region =3D <&framebuffer>;
+               };
+
                dsi@54300000 {
                        status =3D "okay";

--- >8 ---

Note that these entries should all be generated at runtime by the
bootloader once it has allocated the framebuffer. That's the can of
worms I've been talking about.

Attached is the SMMU driver patch.

Hope that helps,
Thierry

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="0001-iommu-tegra-smmu-Add-support-for-reserved-regions.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 1c7c4fcc5364e48fc5390ac17dd7e4ca347a6eb4 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Fri, 15 Feb 2019 15:16:44 +0100
Subject: [PATCH] iommu/tegra-smmu: Add support for reserved regions

The Tegra DRM driver currently uses the IOMMU API explicitly. This means
that it has fine-grained control over when exactly the translation
through the IOMMU is enabled. This currently happens after the driver
probes, so the driver is in a DMA quiesced state when the IOMMU
translation is enabled.

During the transition of the Tegra DRM driver to use the DMA API instead
of the IOMMU API explicitly, it was observed that on certain platforms
the display controllers were still actively fetching from memory. When a
DMA IOMMU domain is created as part of the DMA/IOMMU API setup during
boot, the IOMMU translation for the display controllers can be enabled a
significant amount of time before the driver has had a chance to reset
the hardware into a sane state. This causes the SMMU to detect faults on
the addresses that the display controller is trying to fetch.

To avoid this, and as a byproduct paving the way for seamless transition
of display from the bootloader to the kernel, add support for reserved
regions in the Tegra SMMU driver. This is implemented using the standard
reserved memory device tree bindings, which let us describe regions of
memory which the kernel is forbidden from using for regular allocations.
The Tegra SMMU driver will parse the nodes associated with each device
via the "memory-region" property and return reserved regions that the
IOMMU core will then create direct mappings for prior to attaching the
IOMMU domains to the devices. This ensures that a 1:1 mapping is in
place when IOMMU translation starts and prevents the SMMU from detecting
any faults.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 115 +++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 8e49869812b0..b96444be325d 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -12,6 +12,7 @@
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -545,6 +546,38 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *a=
s, unsigned long iova,
 	struct tegra_smmu *smmu =3D as->smmu;
 	u32 *pd =3D page_address(as->pd);
 	unsigned long offset =3D pd_index * sizeof(*pd);
+	bool unmap =3D false;
+
+	/*
+	 * XXX Move this outside of this function. Perhaps add a struct
+	 * iommu_domain parameter to ->{get,put}_resv_regions() so that
+	 * the mapping can be done there.
+	 *
+	 * The problem here is that as->smmu is only known once we attach
+	 * the domain to a device (because then we look up the right SMMU
+	 * instance via the dev->archdata.iommu pointer). When the direct
+	 * mappings are created for reserved regions, the domain has not
+	 * been attached to a device yet, so we don't know. We currently
+	 * fix that up in ->apply_resv_regions() because that is the first
+	 * time where we have access to a struct device that will be used
+	 * with the IOMMU domain. However, that's asymmetric and doesn't
+	 * take care of the page directory mapping either, so we need to
+	 * come up with something better.
+	 */
+	if (as->pd_dma =3D=3D 0) {
+		as->pd_dma =3D dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
+					  DMA_TO_DEVICE);
+		if (dma_mapping_error(smmu->dev, as->pd_dma))
+			return;
+
+		if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
+			dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD,
+				       DMA_TO_DEVICE);
+			return;
+		}
+
+		unmap =3D true;
+	}
=20
 	/* Set the page directory entry first */
 	pd[pd_index] =3D value;
@@ -557,6 +590,12 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *a=
s, unsigned long iova,
 	smmu_flush_ptc(smmu, as->pd_dma, offset);
 	smmu_flush_tlb_section(smmu, as->id, iova);
 	smmu_flush(smmu);
+
+	if (unmap) {
+		dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD,
+			       DMA_TO_DEVICE);
+		as->pd_dma =3D 0;
+	}
 }
=20
 static u32 *tegra_smmu_pte_offset(struct page *pt_page, unsigned long iova)
@@ -897,6 +936,79 @@ static struct iommu_group *tegra_smmu_device_group(str=
uct device *dev)
 	return group;
 }
=20
+static void tegra_smmu_get_resv_regions(struct device *dev, struct list_he=
ad *list)
+{
+	struct of_phandle_iterator it;
+	int err;
+
+	if (!dev->of_node)
+		return;
+
+	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
+		struct iommu_resv_region *region;
+		struct resource res;
+
+		err =3D of_address_to_resource(it.node, 0, &res);
+		if (err < 0) {
+			dev_err(dev, "failed to parse memory region %pOFn: %d\n",
+				it.node, err);
+			continue;
+		}
+
+		region =3D iommu_alloc_resv_region(res.start, resource_size(&res),
+						 IOMMU_READ | IOMMU_WRITE,
+						 IOMMU_RESV_DIRECT);
+		if (!region)
+			return;
+
+		dev_dbg(dev, "reserved region %pR\n", &res);
+		list_add_tail(&region->list, list);
+	}
+}
+
+static void tegra_smmu_put_resv_regions(struct device *dev,
+					struct list_head *list)
+{
+	struct iommu_resv_region *entry, *next;
+
+	list_for_each_entry_safe(entry, next, list, list)
+		kfree(entry);
+}
+
+static void tegra_smmu_apply_resv_region(struct device *dev,
+					 struct iommu_domain *domain,
+					 struct iommu_resv_region *region)
+{
+	struct tegra_smmu *smmu =3D dev->archdata.iommu;
+	struct tegra_smmu_as *as =3D to_smmu_as(domain);
+
+	/*
+	 * ->attach_dev() may not have been called yet at this point, so the
+	 * address space may not have been associated with an SMMU instance.
+	 * Set up the association here to make sure subsequent code can rely
+	 * on the SMMU instance being known.
+	 *
+	 * Also make sure that the SMMU instance doesn't conflict if an SMMU
+	 * has been associated with the address space already. This can happen
+	 * if a domain is shared between multiple devices.
+	 *
+	 * Note that this is purely theoretic because there are no known SoCs
+	 * with multiple instances of this SMMU.
+	 *
+	 * XXX Deal with this elsewhere. One possibility would be to pass the
+	 * struct iommu_domain that we're operating on to ->get_resv_regions()
+	 * and ->put_resv_regions() so that the connection between it and the
+	 * struct device (in order to find the SMMU instance) can already be
+	 * established at that time. This would be nicely symmetric because a
+	 * ->put_resv_regions() could undo that again so that ->attach_dev()
+	 * could start from a clean slate.
+	 */
+	if (as->smmu && as->smmu !=3D smmu)
+		WARN(1, "conflicting SMMU instances\n");
+
+	as->smmu =3D smmu;
+}
+
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
@@ -917,6 +1029,9 @@ static const struct iommu_ops tegra_smmu_ops =3D {
 	.map =3D tegra_smmu_map,
 	.unmap =3D tegra_smmu_unmap,
 	.iova_to_phys =3D tegra_smmu_iova_to_phys,
+	.get_resv_regions =3D tegra_smmu_get_resv_regions,
+	.put_resv_regions =3D tegra_smmu_put_resv_regions,
+	.apply_resv_region =3D tegra_smmu_apply_resv_region,
 	.of_xlate =3D tegra_smmu_of_xlate,
 	.pgsize_bitmap =3D SZ_4K,
 };
--=20
2.21.0


--hxkXGo8AKqTJ+9QI--

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1IwMACgkQ3SOs138+
s6HFAxAAql1Hfx2rdOwJAHx+apg2RhwhIJKOmmY3L0aKIey/sRpxFCchGxjNi18u
xOUEBOYIrVmQgS/qholbxGbyUCupHyJF/1dWXjMKBn8dsw8jDbrHsm7Ew/Hp1jzL
cpC1LRcm3oBNvAvbMW8VyhYZv9FFp5BsJFgybPnQ8xULbiciA+CxG/LOWtlxy1sx
CneuLLDauioU2y8Gekx1kRJWYXQ1lHk+iwnS/aRgMCw7LTNnG/Ntzwh5QHwZe9qd
6YtVbATgxhA6keurY55ZCeLfBPl0k3+/uRqzQ02oGFn8FrWLPFaKo1sFxEoupNVN
EOkPDLXxuae0dBQaaz4fp+R0Vla7eQ1YXSl1fVxdgXUYgQxBjmFnABJ9rwJjju54
mTN0bNSKkxKJLDNMJ0i5rOnyexLt31jOTHuILKkGALoMVi9GZ/0SFqRZfa9M97nI
rejh/m5JK1ucIoeYqMPhK3MUEJ81aCV0cO7dYF1KXSU//cUO2qG+oOSaWvwbJihL
ON8IkcULv43TnOrjQmnUFSLuceOD0RgmSJZl8C6PecCLA6n4JNUvocHJyIKw4Bna
0NmDAin7yvgOjyUHki+A2Tfn+JaUfSgkiVl+Jego+jYCj0fp8iIxQWpbqYohp8lp
sNmKb4QB0tw66yhPIe/OD8QPEA/n9XUZizuBUh1e+GrU8V1MqWU=
=mlFr
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--

--===============1242468331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1242468331==--
