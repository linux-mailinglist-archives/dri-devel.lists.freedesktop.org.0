Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B11C1F117
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAA710E916;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mac.com header.i=@mac.com header.b="bZcTJyVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 974 seconds by postgrey-1.36 at gabe;
 Thu, 30 Oct 2025 02:06:52 UTC
Received: from outbound.ci.icloud.com
 (p-east1-cluster5-host9-snip4-10.eps.apple.com [57.103.89.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DA10E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:06:52 +0000 (UTC)
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-central-1k-20-percent-2 (Postfix) with ESMTPS id
 862A9180018B; Thu, 30 Oct 2025 01:50:36 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
 bh=I7tCoYxb41/Drq2+GPL1Ci37qVTZZ5eqKPzaURsjoFE=;
 h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:To:x-icloud-hme;
 b=bZcTJyVjYYpYV/dus6KsFPOOrOnVxl1odqgeTbp6Tox5LyPmvPnmLFwJjrt6yUQPa37PWxk/TQlqhRXzjX/GuLZj2U2QigNCwg3eAGC7+xe6mH6lQ5HzexMNvSdTv6F32nB0EL3gM/858KGtNoVDosmKjP8WmiDS6uBgODXl65+rvAeu9aniABBp68sTa30trvgJD/tqe5yduAg9WvlxFdDiJXOh2OTaCoySiYACFg/egrZnpZYSaAx0ss9LNQ+j1CBjOf5e3mTl+IyhJjJzO4D9/rPTa29GLRMKva3vTWaQrvBwpbq4xWKj77IJq6KjxGK8ijL8I7pcuwIynHM7Gw==
Received: from smtpclient.apple (unknown [17.57.156.36])
 by p00-icloudmta-asmtp-us-central-1k-20-percent-2 (Postfix) with ESMTPSA id
 F341A1800180; Thu, 30 Oct 2025 01:50:35 +0000 (UTC)
From: Jeff Geerling <geerlingguy@mac.com>
Message-Id: <3F61A177-482E-496D-9041-ADED72586968@mac.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_358AD353-3A03-4A64-9985-3310BC9941E7"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
Date: Wed, 29 Oct 2025 20:50:25 -0500
In-Reply-To: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Cc: wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: zhangzhijie <zhangzhijie@bosc.ac.cn>
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxMyBTYWx0ZWRfX7Nzw5hUHsoAH
 NL9o2f48K8K3lsRxEEVqMA+oUqeQU+GgbtbEoe+kNCsz+40ojW8iLRih0sAG5qDKGlZGMewFdUl
 oteaC5aFVRGQMVhWsqVb6rEnQiEvkl2TMj/rOlJrNsBIVKpz2UTIlolnmbjEhlr61uKUjqQFPOB
 +EgK0y0oJXu8QTAbSz7pgIHQBByzYIxzGiCHDgfJTFjNPVVBrCteEa7R2x6b6hH7stnPXOE/LnX
 fLlb+87czKiZvgtcVSaDFyEesdgDBdCLySNGJZi5Ihm5sHqgGlj+sGO1i2BVNgsX3tQRcb8n4=
X-Proofpoint-GUID: p8K_fckhTduZncMkQ8j9IcaRiP8DrrpB
X-Proofpoint-ORIG-GUID: p8K_fckhTduZncMkQ8j9IcaRiP8DrrpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2510300013
X-JNJ: AAAAAAABWvmhw+ZCaNVFkXiaHhpniypsJ2U6R41zMFCdksvLmUJZqPS+4eKFEtshjOCm+dmmaiV6Jec3YF+cdX4Bh9tC2MmHp5JrrvdBmNPl0cgZAIeEggGIYosWEg20maNVulSvYsMc9QTxYjNOujLI7skMLzyswb8iV5vff+HlQ4yRHjQI4tkIFQDdYMdV1p7QAjAsT5atZFBPMCgQpHFrRlhG9/mWux+XJuFMVRYdrkPIZi3jb3LnysNtPBmHglrnzCaXmKXoEdJlKNRpjt+hfe7gQFbVY6ALqkKsCS2BxTI4kZoHJHnaTg2jBcxUgbzedCV+Gr9MPBFwK0UWVwtoznOolMBPGW3GZiP64OwgpBKIq/qzC+trLOzZpn9z6O5TeRUDkMNV64QI+loyTsaTsgbAQdkZ821xQfBC7AZmu+Aolx5DE+PbN9QmjPrwkRzjIZMagbUHiyplIPefeXny6u6wz2rhCXoTlpWIK8hPSGwIi6nFDkCVzFI9yXQnld/TkI81HA5ATLFuh/gAQ4BrpaxPBJmGuuIOkgCGEXhKNgcecer0WBwGT0KF6s2lTT1Ddja9uGwwVq7iUUMsEaPdgJ/QSgztr+MCSBaBAyi+9vG4L+ubmu3QIpsQLgYNUY+/Q2+H18xcN+DCnIf4rQdvUqgqSp9kkbKh9JnSBJ7Y/nWtD7Nne82X8IXvjiZ6hJI8TvjNj33NdQjlk2GZZnH6+htE0l4WKYPnptFASE0hMnDfvWPxwMj9LTPUZRY9krEJTxJPbiWTNzsZe+hZ5HZs2U49Ns6Ms2/X9H2nFp8kIOax7P39RsfxMKAp61d1u7hy9obP24piL7PDRQer
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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


--Apple-Mail=_358AD353-3A03-4A64-9985-3310BC9941E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

+1 for this patch, as it would enable Xe on any non-x86 system.

I've successfully tested this change on Ampere and Broadcom (Raspberry =
Pi) systems.

We've been using the flag `CONFIG_VGA_CONSOLE` instead of `CONFIG_X86` =
but either should achieve the same goal. See: =
https://github.com/6by9/linux/commit/6bd4cfe79b5111986dd11a5c6e48d4a963fd7=
740

With some OSes a later Mesa version needs to be compiled to support =
newer Xe/Xe2 cards, however I've successfully tested a number of Intel =
dGPUs at this point. Sometimes setting force probe to '*' (or the =
particular GPU ID) is required, but otherwise stability is good.

For example, the A750: =
https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/510#issuec=
omment-3383284831

> On Jul 15, 2025, at 1:18=E2=80=AFAM, zhangzhijie =
<zhangzhijie@bosc.ac.cn> wrote:
>=20
>    inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.
>=20
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
> drivers/gpu/drm/i915/display/intel_vga.c | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c =
b/drivers/gpu/drm/i915/display/intel_vga.c
> index 4b98833bfa8c..5e48e3282670 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -33,6 +33,7 @@ void intel_vga_disable(struct drm_i915_private =
*dev_priv)
> 	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> 		return;
>=20
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> 	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> 	outb(0x01, VGA_SEQ_I);
> @@ -40,6 +41,7 @@ void intel_vga_disable(struct drm_i915_private =
*dev_priv)
> 	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> 	udelay(300);
> +#endif
>=20
> 	intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
> 	intel_de_posting_read(dev_priv, vga_reg);
> @@ -80,6 +82,7 @@ void intel_vga_redisable(struct drm_i915_private =
*i915)
>=20
> void intel_vga_reset_io_mem(struct drm_i915_private *i915)
> {
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> 	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>=20
> 	/*
> @@ -95,6 +98,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private =
*i915)
> 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> 	outb(inb(VGA_MIS_R), VGA_MIS_W);
> 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +#endif
> }
>=20
> int intel_vga_register(struct drm_i915_private *i915)
> --=20
> 2.34.1
>=20
>=20


--Apple-Mail=_358AD353-3A03-4A64-9985-3310BC9941E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);">+1 for this patch, as it would enable Xe on =
any non-x86 system.</span></div><div><br></div>I've successfully tested =
this change on Ampere and Broadcom (Raspberry Pi) =
systems.<div><br></div><div>We've been using the flag =
`CONFIG_VGA_CONSOLE` instead of `CONFIG_X86` but either should achieve =
the same goal. See:&nbsp;<a =
href=3D"https://github.com/6by9/linux/commit/6bd4cfe79b5111986dd11a5c6e48d=
4a963fd7740">https://github.com/6by9/linux/commit/6bd4cfe79b5111986dd11a5c=
6e48d4a963fd7740</a></div><div><br></div><div>With some OSes a later =
Mesa version needs to be compiled to support newer Xe/Xe2 cards, however =
I've successfully tested a number of Intel dGPUs at this point. =
Sometimes setting force probe to '*' (or the particular GPU ID) is =
required, but otherwise stability is good.<br><div><br></div><div>For =
example, the A750:&nbsp;<a =
href=3D"https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/51=
0#issuecomment-3383284831">https://github.com/geerlingguy/raspberry-pi-pci=
e-devices/issues/510#issuecomment-3383284831</a></div><div><div><br><block=
quote type=3D"cite"><div>On Jul 15, 2025, at 1:18=E2=80=AFAM, =
zhangzhijie &lt;zhangzhijie@bosc.ac.cn&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div> =
&nbsp;&nbsp;&nbsp;inb/outb speccial wire not support on other =
ARCH.<br>Should detect whether arch platform support or =
not.<br><br>Signed-off-by: zhangzhijie =
&lt;zhangzhijie@bosc.ac.cn&gt;<br>---<br> =
drivers/gpu/drm/i915/display/intel_vga.c | 4 ++++<br> 1 file changed, 4 =
insertions(+)<br><br>diff --git =
a/drivers/gpu/drm/i915/display/intel_vga.c =
b/drivers/gpu/drm/i915/display/intel_vga.c<br>index =
4b98833bfa8c..5e48e3282670 100644<br>--- =
a/drivers/gpu/drm/i915/display/intel_vga.c<br>+++ =
b/drivers/gpu/drm/i915/display/intel_vga.c<br>@@ -33,6 +33,7 @@ void =
intel_vga_disable(struct drm_i915_private *dev_priv)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(intel_de_read(dev_priv, vga_reg) &amp; VGA_DISP_DISABLE)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return;<br><br>+#if defined(CONFIG_X86) || =
defined(CONFIG_X86_64)<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* =
WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>outb(0x01, VGA_SEQ_I);<br>@@ -40,6 +41,7 @@ void =
intel_vga_disable(struct drm_i915_private *dev_priv)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>outb(sr1 =
| VGA_SR01_SCREEN_OFF, VGA_SEQ_D);<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>vga_put(pdev, =
VGA_RSRC_LEGACY_IO);<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>udelay(300);<br>+#endif<br><br> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>intel_de_posting_read(dev_priv, vga_reg);<br>@@ -80,6 +82,7 @@ =
void intel_vga_redisable(struct drm_i915_private *i915)<br><br> void =
intel_vga_reset_io_mem(struct drm_i915_private *i915)<br> {<br>+#if =
defined(CONFIG_X86) || defined(CONFIG_X86_64)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>struct =
pci_dev *pdev =3D to_pci_dev(i915-&gt;drm.dev);<br><br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/*<br>@@ =
-95,6 +98,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private =
*i915)<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>outb(inb(VGA_MIS_R), VGA_MIS_W);<br> <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>vga_put(pdev, =
VGA_RSRC_LEGACY_IO);<br>+#endif<br> }<br><br> int =
intel_vga_register(struct drm_i915_private *i915)<br>-- =
<br>2.34.1<br><br><br></div></div></blockquote></div><br></div></div></bod=
y></html>=

--Apple-Mail=_358AD353-3A03-4A64-9985-3310BC9941E7--
