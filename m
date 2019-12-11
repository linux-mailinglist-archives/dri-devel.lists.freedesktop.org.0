Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74D11C89C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2E16ECD7;
	Thu, 12 Dec 2019 08:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 479 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 20:24:35 UTC
Received: from softboy.mntmn.com (softboy.mntmn.com [91.250.115.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD2FE6EB8B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 20:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com 6E3307206B2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntmn.com; s=mailout;
 t=1576095394; bh=ttA1gcQY3v0SC2pPq/8dQvdaF1ZP/kGZmrhHV+IJ3SQ=;
 h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
 b=r1zNK9UFerwizzFpHujssXuNw709igKjzCaU26BxyL/VX750iqAh2HyT0TjYClRX6
 LAUp7a8tH7c53nw5W7D4ztV/DkyowXW+0X06KcEIc58jidulXKxoc4sCEfgIKMBRwp
 /sc9pcG8SNo2I2lSnLp1c6pul2WwsCf0KRiWUx8U=
From: Lukas Hartmann <lukas@mntmn.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 0/4] Add support for iMX8MQ Display Controller Subsystem
Date: Wed, 11 Dec 2019 21:16:32 +0100
Message-Id: <29DC2566-B2AA-439A-B54B-A2FF35AA9538@mntmn.com>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
In-Reply-To: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
X-Mailer: iPhone Mail (17B111)
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1324586276=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1324586276==
Content-Type: multipart/alternative; boundary=Apple-Mail-81F7479F-F379-447F-9577-93204CEB1186
Content-Transfer-Encoding: 7bit


--Apple-Mail-81F7479F-F379-447F-9577-93204CEB1186
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

thanks for the updated patch! I can confirm after intensive testing that the=
 hangs on boot are fixed in this version (I=E2=80=99m using DCSS->MIPI DSI->=
TI eDP Bridge).

Best
Lukas
--=20

Lukas F. Hartmann, CEO
MNT Research GmbH
https://mntre.com

--

Did you know? Our Open Laptop MNT Reform will launch soon on Crowd Supply: h=
ttps://www.crowdsupply.com/MNT/Reform

> On 6. Dec 2019, at 10:53, Laurentiu Palcu <laurentiu.palcu@nxp.com> wrote:=

>=20
> =EF=BB=BFHi,
>=20
> This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> includes only graphics plane support (no video planes), no HDR10 capabilit=
ies,
> no graphics decompression (only linear, tiled and super-tiled buffers allo=
wed).
>=20
> Support for the rest of the features will be added incrementally, in subse=
quent
> patches.
>=20
> The patchset was tested with both HDP driver (not yet upstreamed) and MIPI=
-DSI
> (drivers already on the dri-devel ML).
>=20
> Thanks,
> Laurentiu
>=20
> Changes in v3:
> * rebased to latest linux-next and made it compile as drmP.h was
>   removed;
> * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> * fixed a a spurious hang reported by Lukas Hartmann and encountered
>   by me several times;
> * mask DPR and DTG interrupts by default, as they may come enabled from
>   U-boot;
>=20
> Changes in v2:
> * Removed '0x' in node's unit-address both in DT and yaml;
> * Made the address region size lowercase, to be consistent;
> * Removed some left-over references to P010;
> * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence co=
mpilation
>   issues reported by kbuild for other architectures;
>=20
>=20
> Laurentiu Palcu (4):
>  drm/imx: compile imx directory by default
>  drm/imx: Add initial support for DCSS on iMX8MQ
>  dt-bindings: display: imx: add bindings for DCSS
>  arm64: dts: imx8mq: add DCSS node
>=20
> .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  86 +++
> arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  25 +
> drivers/gpu/drm/Makefile                           |   2 +-
> drivers/gpu/drm/imx/Kconfig                        |   2 +
> drivers/gpu/drm/imx/Makefile                       |   1 +
> drivers/gpu/drm/imx/dcss/Kconfig                   |   8 +
> drivers/gpu/drm/imx/dcss/Makefile                  |   6 +
> drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |  75 ++
> drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 224 ++++++
> drivers/gpu/drm/imx/dcss/dcss-ctxld.c              | 447 +++++++++++
> drivers/gpu/drm/imx/dcss/dcss-dev.c                | 286 +++++++
> drivers/gpu/drm/imx/dcss/dcss-dev.h                | 195 +++++
> drivers/gpu/drm/imx/dcss/dcss-dpr.c                | 550 ++++++++++++++
> drivers/gpu/drm/imx/dcss/dcss-drv.c                | 181 +++++
> drivers/gpu/drm/imx/dcss/dcss-dtg.c                | 442 +++++++++++
> drivers/gpu/drm/imx/dcss/dcss-kms.c                | 322 ++++++++
> drivers/gpu/drm/imx/dcss/dcss-kms.h                |  52 ++
> drivers/gpu/drm/imx/dcss/dcss-plane.c              | 418 +++++++++++
> drivers/gpu/drm/imx/dcss/dcss-scaler.c             | 826 +++++++++++++++++=
++++
> drivers/gpu/drm/imx/dcss/dcss-ss.c                 | 179 +++++
> 20 files changed, 4326 insertions(+), 1 deletion(-)
> create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8m=
q-dcss.yaml
> create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
>=20
> --=20
> 2.7.4
>=20

--Apple-Mail-81F7479F-F379-447F-9577-93204CEB1186
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Laurentiu,<div><br></div><div>thanks for=
 the updated patch! I can confirm after intensive testing that the hangs on b=
oot are fixed in this version (I=E2=80=99m using DCSS-&gt;MIPI DSI-&gt;TI eD=
P Bridge).<br><br>Best</div><div>Lukas<br><div dir=3D"ltr"><span style=3D"ba=
ckground-color: rgba(255, 255, 255, 0);">--&nbsp;<br><br>Lukas F. Hartmann, C=
EO<br>MNT Research GmbH<br><a href=3D"https://mntre.com/" dir=3D"ltr" x-appl=
e-data-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-=
detectors-result=3D"68/2" style=3D"text-decoration-color: rgba(0, 0, 0, 0.25=
8824);">https://mntre.com</a><br><br>--<br><br>Did you know? Our Open Laptop=
 MNT Reform will launch soon on Crowd Supply:&nbsp;<a href=3D"https://www.cr=
owdsupply.com/MNT/Reform" dir=3D"ltr" x-apple-data-detectors=3D"true" x-appl=
e-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"70">https://=
www.crowdsupply.com/MNT/Reform</a></span></div><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">On 6. Dec 2019, at 10:53, Laurentiu Palcu &lt;laurentiu.pa=
lcu@nxp.com&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><=
div dir=3D"ltr">=EF=BB=BF<span>Hi,</span><br><span></span><br><span>This pat=
chset adds initial DCSS support for iMX8MQ chip. Initial support</span><br><=
span>includes only graphics plane support (no video planes), no HDR10 capabi=
lities,</span><br><span>no graphics decompression (only linear, tiled and su=
per-tiled buffers allowed).</span><br><span></span><br><span>Support for the=
 rest of the features will be added incrementally, in subsequent</span><br><=
span>patches.</span><br><span></span><br><span>The patchset was tested with b=
oth HDP driver (not yet upstreamed) and MIPI-DSI</span><br><span>(drivers al=
ready on the dri-devel ML).</span><br><span></span><br><span>Thanks,</span><=
br><span>Laurentiu</span><br><span></span><br><span>Changes in v3:</span><br=
><span> * rebased to latest linux-next and made it compile as drmP.h was</sp=
an><br><span> &nbsp;&nbsp;removed;</span><br><span> * removed the patch addi=
ng the VIDEO2_PLL clock. It's already applied;</span><br><span> * removed an=
 unnecessary 50ms sleep in the dcss_dtg_sync_set();</span><br><span> * fixed=
 a a spurious hang reported by Lukas Hartmann and encountered</span><br><spa=
n> &nbsp;&nbsp;by me several times;</span><br><span> * mask DPR and DTG inte=
rrupts by default, as they may come enabled from</span><br><span> &nbsp;&nbs=
p;U-boot;</span><br><span></span><br><span>Changes in v2:</span><br><span> *=
 Removed '0x' in node's unit-address both in DT and yaml;</span><br><span> *=
 Made the address region size lowercase, to be consistent;</span><br><span> *=
 Removed some left-over references to P010;</span><br><span> * Added a Kconf=
ig dependency of DRM &amp;&amp; ARCH_MXC. This will also silence compilation=
</span><br><span> &nbsp;&nbsp;issues reported by kbuild for other architectu=
res;</span><br><span></span><br><span></span><br><span>Laurentiu Palcu (4):<=
/span><br><span> &nbsp;drm/imx: compile imx directory by default</span><br><=
span> &nbsp;drm/imx: Add initial support for DCSS on iMX8MQ</span><br><span>=
 &nbsp;dt-bindings: display: imx: add bindings for DCSS</span><br><span> &nb=
sp;arm64: dts: imx8mq: add DCSS node</span><br><span></span><br><span> .../b=
indings/display/imx/nxp,imx8mq-dcss.yaml &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nb=
sp;86 +++</span><br><span> arch/arm64/boot/dts/freescale/imx8mq.dtsi &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;25 +</span><br><span>=
 drivers/gpu/drm/Makefile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 +-</span><br><span> drivers/gp=
u/drm/imx/Kconfig &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| &nbsp;&nbsp;2 +</span><br><span> drivers/gpu/drm/imx/Makefile &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;1 +</span><br>=
<span> drivers/gpu/drm/imx/dcss/Kconfig &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &n=
bsp;&nbsp;8 +</span><br><span> drivers/gpu/drm/imx/dcss/Makefile &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;| &nbsp;&nbsp;6 +</span><br><span> drivers/gpu/drm/imx/dcss/d=
css-blkctl.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;| &nbsp;75 ++</span><br><span> drivers/gpu/drm/imx/dcss/dcss-crtc.c=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;| 224 ++++++</span><br><span> drivers/gpu/drm/imx/dcss/dcss-ctxld.c=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;| 447 +++++++++++</span><br><span> drivers/gpu/drm/imx/dcss/dcss-dev.c &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;| 286 +++++++</span><br><span> drivers/gpu/drm/imx/dcss/dcss-dev=
.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;| 195 +++++</span><br><span> drivers/gpu/drm/imx/dcss/dcss-=
dpr.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;| 550 ++++++++++++++</span><br><span> drivers/gpu/drm/im=
x/dcss/dcss-drv.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 181 +++++</span><br><span> drivers/gpu/drm=
/imx/dcss/dcss-dtg.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 442 +++++++++++</span><br><span> driver=
s/gpu/drm/imx/dcss/dcss-kms.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 322 ++++++++</span><br><span> d=
rivers/gpu/drm/imx/dcss/dcss-kms.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;52 ++</span><br><sp=
an> drivers/gpu/drm/imx/dcss/dcss-plane.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 418 +++++++++++</span><br><spa=
n> drivers/gpu/drm/imx/dcss/dcss-scaler.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 826 +++++++++++++++++++++</span><br>=
<span> drivers/gpu/drm/imx/dcss/dcss-ss.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 179 +++++</s=
pan><br><span> 20 files changed, 4326 insertions(+), 1 deletion(-)</span><br=
><span> create mode 100644 Documentation/devicetree/bindings/display/imx/nxp=
,imx8mq-dcss.yaml</span><br><span> create mode 100644 drivers/gpu/drm/imx/dc=
ss/Kconfig</span><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/Make=
file</span><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkct=
l.c</span><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c=
</span><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c</=
span><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c</span=
><br><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h</span><br=
><span> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c</span><br><sp=
an> create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c</span><br><span> c=
reate mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c</span><br><span> creat=
e mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c</span><br><span> create mo=
de 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h</span><br><span> create mode 1=
00644 drivers/gpu/drm/imx/dcss/dcss-plane.c</span><br><span> create mode 100=
644 drivers/gpu/drm/imx/dcss/dcss-scaler.c</span><br><span> create mode 1006=
44 drivers/gpu/drm/imx/dcss/dcss-ss.c</span><br><span></span><br><span>-- </=
span><br><span>2.7.4</span><br><span></span><br></div></blockquote></div></b=
ody></html>=

--Apple-Mail-81F7479F-F379-447F-9577-93204CEB1186--

--===============1324586276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1324586276==--
