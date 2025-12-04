Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C348CA4CE3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 18:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B77A10E03E;
	Thu,  4 Dec 2025 17:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oo912eAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FB110E117
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764870619; x=1796406619;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=plZqPd5AgvFzy8Z5GnGogb0ce974/c0CwB9yW1Q1AMY=;
 b=Oo912eAq1ZAkRtWRopBKftGHGf3Qr0m6hq6ikp/Jz/Qrxh2crUwtBX0l
 cDndTwt+MCTspMtuOYmOvXfvRsg4JIo5AESflnYuTfTcA14t9QlzDxLzH
 UA4bhKdWu753eiPgSNiMddTG2RL3ieMl0jdbiqjEYeAYC686FGdiu4j1O
 HW8pfopwpA7DdaTNY8ychunbGo4ChAptth8Oem5anMBlJPkj68GbL7mhb
 Nsgfy7aMamz/BkE+7Ehv6uKXztzVtThnyg/eqtKKfl5z2hpqTGttBUBMB
 iK19OL4apRtXcDD4apjm2ZKt02T/PBG3EqA70v2fQVe1A8xvZz0Xn/VfU A==;
X-CSE-ConnectionGUID: 1YukRZTAQhuLbfmpk/EzUg==
X-CSE-MsgGUID: 9jj+f9abQFeb0nxK/GzUew==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89551148"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="89551148"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 09:50:18 -0800
X-CSE-ConnectionGUID: dbEtKAJPSKuxVJXyT41FOA==
X-CSE-MsgGUID: cxJvP8gRQfqrnAztoQ68Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194119709"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 09:50:14 -0800
Message-ID: <cfe36079c764e984e9719a8d398f4ffc074a6ae7.camel@linux.intel.com>
Subject: Re: [git pull] drm for 6.19-rc1
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Jouni
 =?ISO-8859-1?Q?H=F6gander?=
 <jouni.hogander@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>,  LKML <linux-kernel@vger.kernel.org>
Date: Thu, 04 Dec 2025 18:50:11 +0100
In-Reply-To: <CAHk-=whaiMayMx=LrL7P119MLBX6exM_mEu4S2uBRT+xWQ-mbA@mail.gmail.com>
References: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
 <CAHk-=whaiMayMx=LrL7P119MLBX6exM_mEu4S2uBRT+xWQ-mbA@mail.gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

Hi, Linus,

On Thu, 2025-12-04 at 09:35 -0800, Linus Torvalds wrote:
> On Tue, 2 Dec 2025 at 23:23, Dave Airlie <airlied@gmail.com> wrote:
> >=20
> > This is the main drm pull request for 6.19.
>=20
> I have pulled this and pushed out the result. It "works" for me on my
> Xe setup, but I do get a new refcount warning, which looks like
> something might be seriously wrong.
>=20
> (Side note: I'm also running with
>=20
> =C2=A0
> https://lore.kernel.org/all/20251119153321.2640969-1-jani.nikula@intel.co=
m/
>=20
> fixed up for the merge and applied to make my dual 6k monitor setup
> happy).
>=20
> I get this:
>=20
> =C2=A0 refcount_t: underflow; use-after-free.
> =C2=A0 WARNING: lib/refcount.c:28 at 0x0, CPU#43: gst-plugin-scan/2770
> =C2=A0 Modules linked in: rfcomm sunrpc nf_conntrack_netbios_ns ...
> =C2=A0 CPU: 43 UID: 60578 PID: 2770 Comm: gst-plugin-scan Not tainted
> 6.18.0-06709-gab59a11f1240 #25 PREEMPTLAZY
> =C2=A0 Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS
> MASTER/TRX40 AORUS MASTER, BIOS F7 09/07/2022
> =C2=A0 RIP: 0010:refcount_warn_saturate+0x42/0x70
> =C2=A0 ...
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 xe_exec_queue_destroy+0x1be/0x1d0 [xe]
> =C2=A0=C2=A0 xe_vm_close_and_put+0x3b8/0x770 [xe]
> =C2=A0=C2=A0 xe_vm_destroy_ioctl+0x107/0x180 [xe]
> =C2=A0=C2=A0 drm_ioctl_kernel+0xa3/0xd0 [drm]
> =C2=A0=C2=A0 drm_ioctl+0x30f/0x470 [drm]
> =C2=A0=C2=A0 xe_drm_ioctl+0x48/0x70 [xe]
> =C2=A0=C2=A0 __se_sys_ioctl+0x6d/0xb0
> =C2=A0=C2=A0 do_syscall_64+0x6a/0x260
> =C2=A0=C2=A0 entry_SYSCALL_64_after_hwframe+0x4b/0x53
>=20
> which hopefully gives somebody an idea.

Looks like a backmerge gone wrong and duplicating a put.

We'll pick that up and try to provide a fix ASAP.

Thanks,
Thomas


>=20
> Added Xe people involved with recent commits to the participants.
>=20
> Anybody?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Linus

