Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31BBA9710
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 15:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39510E426;
	Mon, 29 Sep 2025 13:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hY2be1ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEFB10E426;
 Mon, 29 Sep 2025 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759154172; x=1790690172;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=InW/YTaTkD8Una1CgxcS+Sd39MuweMYKZK1qU0gW9hU=;
 b=hY2be1apm2in9h4tc46OFoBsMRt/s6pjPp3enLQHuimKPJbZaLZ1Jb31
 4J0cY0fcyslHVbz95EKnyYrAgXy+z13tjx1FOGO+wp35QZYN6nUqUBDVD
 aYSscPcHbMvZZ5JUxPc+BcWh49saIqGSSmskTBmiPMy1SL4o8UvZitDSF
 7f2jVYjxC1AJxT3PqiM/oTZ2HkbCtaXdKjc1Ai36w1pxKhm7N5GtFQ6G4
 oWW9qToIukRHkW7Ax7wQZ/CNVttjIrEXky8NQIjOvqHK6xju+E4klFec8
 pjvjyMqiryUPm3DzHj+9rqHxHjc0md6K9JQiGsheeL0WECxYjWifqwP1X g==;
X-CSE-ConnectionGUID: b1mDP6MzRIGwGreHOo8JEw==
X-CSE-MsgGUID: HujT073DQBuAdifXjddrpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61560599"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61560599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:56:12 -0700
X-CSE-ConnectionGUID: p5/xDExsSWqsaFWuk/LpIA==
X-CSE-MsgGUID: 8VheNZ6BRFOYiVFSCPX/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178989233"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:56:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Sep 2025 16:56:03 +0300 (EEST)
To: Lucas De Marchi <lucas.demarchi@intel.com>
cc: intel-xe@lists.freedesktop.org, linux-pci@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Move rebar to be done earlier
In-Reply-To: <5osrqzgrh47n6rpjulvsixwbhbh5vwxrrn6p6hpodnwisjfung@lmivgjb66oed>
Message-ID: <dfdd45b2-5a8c-cfea-ecd3-495e947022d1@linux.intel.com>
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
 <20250918-xe-pci-rebar-2-v1-2-6c094702a074@intel.com>
 <5osrqzgrh47n6rpjulvsixwbhbh5vwxrrn6p6hpodnwisjfung@lmivgjb66oed>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1975384521-1759154048=:943"
Content-ID: <f64c7704-7852-3757-2f7c-098909d873f5@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1975384521-1759154048=:943
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <abbc543f-2c76-119f-fada-3f12d93deccf@linux.intel.com>

On Mon, 29 Sep 2025, Lucas De Marchi wrote:

> Hi,
>=20
> On Thu, Sep 18, 2025 at 01:58:57PM -0700, Lucas De Marchi wrote:
> > There may be cases in which the BAR0 also needs to move to accommodate
> > the bigger BAR2. However if it's not released, the BAR2 resize fails.
> > During the vram probe it can't be released as it's already in use by
> > xe_mmio for early register access.
> >=20
> > Add a new function in xe_vram and let xe_pci call it directly before
> > even early device probe. This allows the BAR2 to resize in cases BAR0
> > also needs to move:
> >=20
> > =09[] xe 0000:03:00.0: vgaarb: deactivate vga console
> > =09[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB ->
> > 16384MiB
> > =09[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasi=
ng
> > =09[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]=
:
> > releasing
> > =09[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffff=
ff
> > 64bit pref]: releasing
> > =09[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffff=
ff
> > 64bit pref]: releasing
> > =09[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffff=
ff
> > 64bit pref]: assigned
> > =09[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffff=
ff
> > 64bit pref]: assigned
> > =09[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]=
:
> > assigned
> > =09[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigne=
d
> > =09[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
> > =09[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff=
]
> > =09[] pcieport 0000:00:01.0:   bridge window [mem
> > 0x4000000000-0x44007fffff 64bit pref]
> > =09[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
> > =09[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff=
]
> > =09[] pcieport 0000:01:00.0:   bridge window [mem
> > 0x4000000000-0x43ffffffff 64bit pref]
> > =09[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
> > =09[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff=
]
> > =09[] pcieport 0000:02:01.0:   bridge window [mem
> > 0x4000000000-0x43ffffffff 64bit pref]
> > =09[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
> > =09[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000
> > dgfx:1 gfx:Xe2_HPG (20.02) ...
> >=20
> > As shown above, it happens even before we try to read any register for
> > platform identification.
> >=20
> > All the rebar logic is more pci-specific than xe-specific and can be
> > done very early in the probe sequence. In future it would be good to
> > move it out of xe_vram.c, but this refactor is left for later.
>=20
> Ilpo, can you take a look on this patch? It fixed the issue that I had
> with BMG. It needs the first patch for the full fix, but the fixes are
> more or less orthogonal.

FWIW, it looks okay to me from PCI perspective,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.
--8323328-1975384521-1759154048=:943--
