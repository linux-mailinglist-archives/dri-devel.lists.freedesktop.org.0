Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73980C1F0F3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719CB10E8C4;
	Thu, 30 Oct 2025 08:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jeffgeerling.com header.i=@jeffgeerling.com header.b="ndQaUWO+";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NAIoBtQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61C610E068;
 Thu, 30 Oct 2025 02:01:08 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id EEA2214000DE;
 Wed, 29 Oct 2025 21:52:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 29 Oct 2025 21:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 jeffgeerling.com; h=cc:cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1761789130;
 x=1761875530; bh=hoZGz5R8UoPDoasJsmeTpblX9uvR5hvy9RFLHgLyoVk=; b=
 ndQaUWO+yZ1GoPFZF00eAAqqLYMoqGLV0+X1BCOceMNK4JZbiPH04BywKaOkBdu9
 4eWxPOg+h96KWJ9Z6aurwbmXfSZA/ywJD9EVGmaBYy/sa0nXZunEMZvMI7mNYOzN
 IIJpnUfMZVMDCqyMAgOPyK+SmMG3CS4BbjFKFSVMj9lpP+euN9JD6g50n1RDJIPO
 cJhivXmOT1H8TYY1q0ozQrosFRXXbwchpA9jY7eEWxz9jzXiFlRXMul7UvEI6UQs
 2lhG26QyNr3iY5oxhU4vjqD08OD8bzloQslhAX46faQYBdGMGwG0s0WGqB8GqOG8
 dis3P8zv67b7MAy5oyeTIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1761789130; x=1761875530; bh=hoZGz5R8UoPDoasJsmeTpblX9uvR5hvy9RF
 LHgLyoVk=; b=NAIoBtQxPnr4M8NkG1m+BhkABY6LUyohaXPQEdNThz7mQ7GfLJH
 PjfWyAb4ZGcsvabkXwubXwt4BgnYS3u22/YsXqwgPHccEVWzOX4EnLD/Wki0SoaJ
 aJLfz8EAqDjn0YNNxNIvGwqMdbYfSsezjzICSd3Oi679KNru8a1vBNlkBubMGraI
 h8ME+Y5SH+D4aC7qca6eZEdxsmW48FnHFj7cnKLp/wKew7fCQIfq0qOkxKLouqCi
 bCOLFYObQPhz+sGhm2WldR3SNGeCc7mMymX8U+oqA/8GwqvxVZpaZEnz4Hvo0bSn
 8lad6gO9txPX1kHr7LGcJL3pmLrOmiHHHog==
X-ME-Sender: <xms:ycQCaVZ8QWI6danacVVcqc7WrlXoKz8K4_XxmQYmiEOYOJS2IVsPHA>
 <xme:ycQCabU5CnOW7925_dDbvAbi5HQM_F24WHFLsCxAY_wVyPUphKNuICn5Xw73glRwZ
 NjcWKJDWnocCNTA7aC7KGYgYIiHojLRxne27vcLkLx0MJBYCHTB-vE>
X-ME-Received: <xmr:ycQCaUCjuYeRGUBWBRnOme8Sc2fY2UugtRLq_tkwoXo7uyfuNBgj9BStSg1IEgTdPX91JhWpU2wiBDTYIFDkQ1Ml2VaDVvbcY3OGkd-OVspr0NIp5H-YbsTgpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehfeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefhkfgtggfuffgjvefvfhfosegrtdhmre
 hhtdejnecuhfhrohhmpeflvghffhcuifgvvghrlhhinhhguceojhgvfhhfsehjvghffhhg
 vggvrhhlihhnghdrtghomheqnecuggftrfgrthhtvghrnhepkeehhfekteeiueekhfefke
 fgtdduhffhfeehkeevtdelgedvvdejhfehteelueegnecuffhomhgrihhnpehgihhthhhu
 sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehjvghffhesjhgvfhhfghgvvghrlhhinhhgrdgtohhmpdhnsggprhgtphhtthhopedu
 fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiihhrghnghiihhhijhhivgessg
 hoshgtrdgrtgdrtghnpdhrtghpthhtohepfigrnhhgrhgrnhessghoshgtrdgrtgdrtghn
 pdhrtghpthhtohepiihhrghnghhjihgrnhessghoshgtrdgrtgdrtghnpdhrtghpthhtoh
 epuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjrghnihdrnhhikhhulhgr
 sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivh
 hisehinhhtvghlrdgtohhmpdhrtghpthhtohepjhhoohhnrghsrdhlrghhthhinhgvnhes
 lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtuhhrshhulhhinhesuhhrsh
 hulhhinhdrnhgvthdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ycQCaXJymfIq2F9FkgxBXgdRLHuyrlKGhA5rMeXPtZzYsvBZWcNDCA>
 <xmx:ycQCaSv20dvhLE0TZsoPRHVevcJ1Ylz1uobnUeo6M_mjUMgubBqGIw>
 <xmx:ycQCafV834-DGXwdgUzVTLX4nrdDZ2ZPr2Za9KHabBkkO6NORALHkQ>
 <xmx:ycQCadKx-2cP4pVtq4fC8vKqgQEOC0WItGMwrI5EzZe2DKDfHBQftg>
 <xmx:ysQCaUdOZTgZEVgk94s7IlQLDcBIFYBDrOMhyLeHSgPuoKQrD9xsEr5p>
Feedback-ID: i66614745:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 21:52:08 -0400 (EDT)
From: Jeff Geerling <jeff@jeffgeerling.com>
Message-Id: <2B3AAFA6-E0CD-471D-A377-A8E487CCA2FB@jeffgeerling.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E2ADBE55-4107-404A-B7A4-445B49A28299"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
Date: Wed, 29 Oct 2025 20:51:58 -0500
In-Reply-To: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Cc: wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: zhangzhijie <zhangzhijie@bosc.ac.cn>
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
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


--Apple-Mail=_E2ADBE55-4107-404A-B7A4-445B49A28299
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


--Apple-Mail=_E2ADBE55-4107-404A-B7A4-445B49A28299
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
e-devices/issues/510#issuecomment-3383284831</a></div></div><div><br><bloc=
kquote type=3D"cite"><div>On Jul 15, 2025, at 1:18=E2=80=AFAM, =
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
<br>2.34.1<br><br><br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_E2ADBE55-4107-404A-B7A4-445B49A28299--
