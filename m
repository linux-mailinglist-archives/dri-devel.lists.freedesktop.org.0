Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFCC1F10E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DF610E915;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jeffgeerling.com header.i=@jeffgeerling.com header.b="E5jYTwwU";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="cjsBhfss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 536 seconds by postgrey-1.36 at gabe;
 Thu, 30 Oct 2025 02:01:07 UTC
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB1B10E068;
 Thu, 30 Oct 2025 02:01:07 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 84013EC0169;
 Wed, 29 Oct 2025 21:55:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 29 Oct 2025 21:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 jeffgeerling.com; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to; s=fm3; t=1761789313; x=1761875713; bh=w+DZY/7oOKw/rQOX4sQIf
 1LjctoWQQr2OLZSbKfwR7s=; b=E5jYTwwU4UG28ThP+GtPeUAs4KSv91yYEchd9
 i9LGymUYp9Ulp1EsWa9GXqpjQ06Y7LTB0+t2h2DHLoG01h8ItKpUfMI/bESqQZMj
 y1d1jqexdMC1iyOhHRlRCnaqzlmiDk6S794nwRzSUT8sGDAilmhbEUiZVctPXYMF
 /yj0oJeF52x25EN61mVvo+zxlgLcAYbcso0W66JqzN125v3TgQ6C0RfFqq9EF/de
 cwXW//EMycYoLs20PcQUlBX16koxrhKo4E/OSH+o8pQm5isZB+kpZMXTsnloQUxG
 vYgv9k1QR09zchG1bjvbmVYdkQus70dezfUmISHskStBhYAuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761789313; x=
 1761875713; bh=w+DZY/7oOKw/rQOX4sQIf1LjctoWQQr2OLZSbKfwR7s=; b=c
 jsBhfssb41c6vezECDq0FtUHQxQc3AhEw0cI0PiIaY/kCtCJgSxRN63J3qLr3Gti
 w30b9zngZttYPtAibk5m4+65CymmQ2AiFWbKqPfY9KXAz4laq1AyolQIknCmnLzg
 wZhK6RLSEM3H5bMlb2a4V87XObOdopHs7yKEgWCF7AJQpPVUXFPHmzBZxuIOah6d
 9hdZ1qIvGwQYazFygf/gdfERkxVGWWSsDAjOhcA0Cjs5l0iBcCM0ETghNBh39Ul6
 gqy3IbTA6LNcnnCGFCRuOqOz2pA32U/bZJZ+pdadbR2E7Iw96n7Hdw28kp/bS2OM
 1/kgJs4veEaFIjedhXmFw==
X-ME-Sender: <xms:gMUCaYXB-3_MnhUbBz7MAjfDtfd9E47i5-Qk8MQJZTEeklfTEaba1w>
 <xme:gMUCacAHEoYjaZiE6hXYL0DBmvoj7EUE1uw3TJxIvkhDrUXPRwPiUnFfUpvMsqhts
 8x3kA-OaB8JDmXSJrkbn39wJQsb93s80WcAS-TLTG_zC2rqYoELLc8I>
X-ME-Received: <xmr:gMUCadfRzoGzVCanRtf2Fri9doRHUDfg9Kf2MtEdSCf0FIRNL8CWA-g-PZEYYauiN22CjUdtWvkRGed-VkM0lFTm5gOAldX2-C1RFO70EQzAab-nQ0aNtfI32w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehfeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmh
 dthhdtjeenucfhrhhomheplfgvfhhfucfivggvrhhlihhnghcuoehjvghffhesjhgvfhhf
 ghgvvghrlhhinhhgrdgtohhmqeenucggtffrrghtthgvrhhnpefgtdevvedugefggfehge
 ehvddvfffhgfelleeuueeluedtuefglefhffekieegkeenucffohhmrghinhepghhithhh
 uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhgvfhhfsehjvghffhhgvggvrhhlihhnghdrtghomhdpnhgspghrtghpthhtohep
 udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeiihhgrnhhgiihhihhjihgvse
 gsohhstgdrrggtrdgtnhdprhgtphhtthhopeifrghnghhrrghnsegsohhstgdrrggtrdgt
 nhdprhgtphhtthhopeiihhgrnhhgjhhirghnsegsohhstgdrrggtrdgtnhdprhgtphhtth
 hopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtohepjhgrnhhirdhnihhkuhhl
 rgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvih
 hvihesihhnthgvlhdrtghomhdprhgtphhtthhopehjohhonhgrshdrlhgrhhhtihhnvghn
 sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhurhhsuhhlihhnsehurh
 hsuhhlihhnrdhnvghtpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:gMUCabr1dC37ks7vDdFD0XRvFgsQLh72eplQ-1TVEDy3c7kAhtopbQ>
 <xmx:gMUCaWQs7aOzf5YpE8XE2EEF3WXug1MD_tW5A070n5WPoBrPpYrPwQ>
 <xmx:gMUCaTWOn9yY7-bUvRNgH4d8rncQhlWL3mu4I3vl5mbJ8F6WTkMA7A>
 <xmx:gMUCaTc1OnOREIBOjqs5MFdulQgx7FNjRx6LMCx4mT9-KzTuF7SElw>
 <xmx:gcUCaebA9PJaS9HFCe8FHDYl9h9gJmAT_Al5z-asHcwi__jASYVnGzPr>
Feedback-ID: i66614745:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 21:55:12 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
From: Jeff Geerling <jeff@jeffgeerling.com>
In-Reply-To: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Date: Wed, 29 Oct 2025 20:55:06 -0500
Cc: wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C67D4EC2-649C-4E46-A55D-8B48A31E8928@jeffgeerling.com>
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>
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
> if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> return;
>=20
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> outb(0x01, VGA_SEQ_I);
> @@ -40,6 +41,7 @@ void intel_vga_disable(struct drm_i915_private =
*dev_priv)
> outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> vga_put(pdev, VGA_RSRC_LEGACY_IO);
> udelay(300);
> +#endif
>=20
> intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
> intel_de_posting_read(dev_priv, vga_reg);
> @@ -80,6 +82,7 @@ void intel_vga_redisable(struct drm_i915_private =
*i915)
>=20
> void intel_vga_reset_io_mem(struct drm_i915_private *i915)
> {
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>=20
> /*
> @@ -95,6 +98,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private =
*i915)
> vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> outb(inb(VGA_MIS_R), VGA_MIS_W);
> vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +#endif
> }
>=20
> int intel_vga_register(struct drm_i915_private *i915)
> --=20
> 2.34.1
>=20
>=20

