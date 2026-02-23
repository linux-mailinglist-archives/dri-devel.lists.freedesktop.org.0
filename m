Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCh6Io53nGlfIAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:51:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9091179131
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965010E00F;
	Mon, 23 Feb 2026 15:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ToOYVwzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A2510E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:51:37 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8f96f6956aso617291066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861896; cv=none;
 d=google.com; s=arc-20240605;
 b=jICErovQV1qoiMU0Nbul+LT6wX40f3ys02IBP7P5l+1z0gADilG5ffjadENWcd60sd
 aSjlTfOIwW0jWtCUE6rk4HcT0zM+bTpvnVn3rND0ZElQzFZGaBgoJ1+g1gcaqBvcD+Q1
 ZAW064kWdh3N62hQTeodxfjuChaHQ/S4BxmpCQIkf/y8MD4lcnmaEMoLNJmn6QJddFtu
 TvSq/LOtGM5VHc8wqTwzjDcEeGKhNe6qHybrNVzDYbp0alF5AJt4un2pTjCS10lG1JOd
 nlYxOL3UQNb3N0TD3t2X7pRg0zLc2RtxxnIbg57OGwhktHqM0W/2CfWkN//nDa//hAVD
 LmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
 fh=HtreJmN15ls0DXHkjVVzTdsEsMy7+aY3pchQJpJrbRs=;
 b=YpQUi7IZBcNyLq6tLpRgy5kCogyOwy3NJu8slXvf1BQ6Fr5+IpRI4GF7GZzNQCU5LL
 kxYQwk/fWGY8nTP2CyVz3rA3UllxJ3dko8FMmdAaHyVoLDCjTxLyS5jUkGONmQE1YED7
 W7bu/q2depiuckEdN+jXi+azvrZIGp5uKWusghdyywJ+ZlGRizGUKV9UotHW5pXnLJSg
 Zmj7a4o2VI7LILF/hgi4/WfQID1bVNlhqWCfbz3NQnGelkXbLjWj6nM2JYOxt5HY8Myl
 r/FUawIdQnG0fL9UB+GzoDQBU8izNPWFe2ySF8ssKgG8s2kWNWJFqKzAIlPfZrZFol+M
 NCfw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771861896; x=1772466696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
 b=ToOYVwzfdZoXPTmtBPXluZs9GinH77IuAdqfJcpFG3MmL1P42ZXw+xPj8Amesdxhr8
 KzpL89evsbMq2nsUkTkCi14+OtsHtXKHKN2IozjoUADRCRKPEiFzeEGOEBzlzxzonzGN
 Ceq0ftHcxfikT+EnANASvC3kQL++l9Asoc4R66KZMa5MDhmH/u882Q25IH/vJx2PJVlx
 HUW4/sX8ru988BD1brRWflU47J4VD0VFUCaUszVpfIX6Kh22ulZm4zNGyrpFQj6gGIXZ
 1MFa9V/QiLexNUqNnGGZLQMt7yFZJ4cQsJlFPiDGcXegbPUPn7IYRZ5sx1wtsW0xQ2Nd
 PIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771861896; x=1772466696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
 b=jQiWtpCPgLwMnNdtVi18jSi7NijmzCifL3rQOlVSnGkjsIqtf5sVm7dR/0BdKErK5M
 3DmU5FcczCtsYLNgs1RmJ/3UR58GM6KZ13reUo7fv53saw9k3W/VAll7ueeXkJ8J2Fy+
 08O0FP11ISQ7w3OPjWJb8LHcngdNJoK410Qhz3SNx1zBQT++xwlqgtUJyzhcZX4iIL58
 PyCQ9woOctX93IRzzr8b9TdDOMs0h7N7iANy1i6O01J6c+lnh3WI9A3s64VJSsTEqgIS
 dM9B4RFlnb7o9/TcR7ZirambDLw1a5hLG5tulCeItK/rfRBv75nmIEZO0Jgz1PND782W
 KeKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOIPz6mggKLxLzzx0SCQt3dSPVqoNbZX+AH/s5qjPfc8LVDPzTaB4cKxbnmCi6aO8L5CPSW4Uw4/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhKn0L6LPxJX1b1NRlr1cQfZ4WIs4FT4ntGc5cT2pDeoc2cfgB
 VR2p3aK+tL+Z6Gq5wUQYbTWpEL9q6kA+OH0vA7mXasu66UnqFlFx9ROAn7LeC/ejsSnRY++QZEz
 J1mnkgZ7SF/P8m0vospjQxcESvDcG1No=
X-Gm-Gg: AZuq6aIiVYl0kq5KO9q5TN2QvOhrLOsV0gDvmfnFKyoR+quQEBi6i05lhZR/wlLbpHZ
 nqSr+Hztjy4N2QoUoUmhBGViXE9CLKTyn1pofQymFxpkqh9JF5G1TaxQzUAyAHgOaGZK+cktmY6
 SYQPW02FNk5VzCFsYFpDGKEjcCV0y1eF2EiXIa7y97Q5R6tM5J8NuPh416WRW70n+APH78fH6h2
 l970BxxkpexOC45OjyDpRoW/VDxw+IJi1hV0aLvDfSDpWlSMgF2n6iYCu6u/VSy4kd0yeJaeHKp
 1VqzgCcwapGalji7QH6ke9RoDDnd48JspV2WSUjNAd38BBnP+JqAKx5BxXqiAtFpTMh/B5OZyPm
 uhEuaWHE=
X-Received: by 2002:a17:906:5ad6:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b9081badd6emr413937066b.44.1771861895691; Mon, 23 Feb 2026
 07:51:35 -0800 (PST)
MIME-Version: 1.0
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 17:50:59 +0200
X-Gm-Features: AaiRm51McMZohKyigNQFIbQDImiJ8vF_g2F0DjapyVKPe6Rkgx4x17MorqEdw1M
Message-ID: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
 "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, 
 Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
 Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 Mark Brown <broonie@kernel.org>, 
 Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
 linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
 Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 nic_swsd@realtek.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
 linux-crypto@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
 mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, 
 Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m:raag.jadav@intel.com,m:hansg@kernel.org,m:greg
 kh@linuxfoundation.org,m:jirislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:phasta@kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhu
 ang@gmail.com,m:linux-spi@vger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[87];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: E9091179131
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 5:32=E2=80=AFPM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> This patch series addresses a long-standing design issue in the PCI/MSI
> subsystem where the implicit, automatic management of IRQ vectors by
> the devres framework conflicts with explicit driver cleanup, creating
> ambiguity and potential resource management bugs.
>
> =3D=3D=3D=3D The Problem: Implicit vs. Explicit Management =3D=3D=3D=3D
> Historically, `pcim_enable_device()` not only manages standard PCI resour=
ces
> (BARs) via devres but also implicitly triggers automatic IRQ vector manag=
ement
> by setting a flag that registers `pcim_msi_release()` as a cleanup action=
.
>
> This creates an ambiguous ownership model. Many drivers follow a pattern =
of:
> 1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
> 2. Also calling `pci_free_irq_vectors()` in their error paths or remove r=
outines.
>
> When such a driver also uses `pcim_enable_device()`, the devres framework=
 may
> attempt to free the IRQ vectors a second time upon device release, leadin=
g to
> a double-free. Analysis of the tree shows this hazardous pattern exists w=
idely,
> while 35 other drivers correctly rely solely on the implicit cleanup.

Is this confirmed? What I read from the cover letter, this series was
only compile-tested, so how can you prove the problem exists in the
first place?

> =3D=3D=3D=3D The Solution: Making Management Explicit =3D=3D=3D=3D
> This series enforces a clear, predictable model:
> 1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
>     pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed=
 IRQ
>     vectors should use these functions, which set the is_msi_managed flag=
 and
>     ensure automatic cleanup.
> 2.  Patches 2 through 36 convert each driver that uses pcim_enable_device=
() alongside
>     pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup t=
o instead
>     make an explicit call to pcim_alloc_irq_vectors().
> 3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim=
_setup_msi_release()
>     to check only the is_msi_managed flag. This decouples automatic IRQ c=
leanup from
>     pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors=
*()
>     are now solely the driver's responsibility to free with pci_free_irq_=
vectors().
>
> With these changes, we clear ownership model: Explicit resource managemen=
t eliminates
> ambiguity and follows the "principle of least surprise." New drivers choo=
se one model and
> be consistent.
> - Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit c=
ontrol.
> - Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

Have you checked previous attempts? Why is your series better than those?

> =3D=3D=3D=3D Testing And Review =3D=3D=3D=3D
> 1. This series is only compiled test with allmodconfig.
> 2. Given the substantial size of this patch series, I have structured the=
 mailing
>    to facilitate efficient review. The cover letter, the first patch and =
the last one will be sent
>    to all relevant mailing lists and key maintainers to ensure broad visi=
bility and
>    initial feedback on the overall approach. The remaining subsystem-spec=
ific patches
>    will be sent only to the respective subsystem maintainers and their as=
sociated
>    mailing lists, reducing noise.

--=20
With Best Regards,
Andy Shevchenko
