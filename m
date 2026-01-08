Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBFD027C9
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EFA10E6F3;
	Thu,  8 Jan 2026 11:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwjRPhnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8010E6F3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767872795; x=1799408795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MhE7jiYZIj0B8flEBKWApFt1Gzd3vQNrmfY1XSd2+DI=;
 b=AwjRPhnAZevETPgD7U32cP6SwJGA12Mp9ydWCGeGLEAcDYWSVM1moVA7
 g48poVxdHeD39Q8qAQdbJIABnZELAX3MMSEcFkoyJlovBuNuF1Z4tC6hJ
 YyHFVxbpAthpWhYJ9lx+M4iQoUci+WNbPF51Od7BJBwG+YAOK3IR4qZub
 zbkGRdG9CddKGGvhi7KhpPLsp5jqeugBkSXj3WEHvdfUkrWbP9JtSgvfv
 Ztyw2BabYJlMhL82ftwujhyGtwwIoNsThoIfG8WpDCPY6TkBJSyKPd2/N
 tdTXyKoV01nxu6hi8EvSWmW4BOA+zuKdYqre8fcVjAFI6jSmUpQK4JguF A==;
X-CSE-ConnectionGUID: lxIM5d25QCiq7kljmmCyWw==
X-CSE-MsgGUID: PpgUrZDySFqK3rafo+OI3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91910073"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="91910073"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:46:34 -0800
X-CSE-ConnectionGUID: 6Wy7mDL0QSydDy2D+uf+AQ==
X-CSE-MsgGUID: tqYeuH/+Q1mMHO4OD8JPwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202390142"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:46:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "WangzXD0325@outlook.com" <WangzXD0325@outlook.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [BUG] WARNING in drm_gem_object_handle_put_unlocked via
 drm_release
In-Reply-To: <KL1PR03MB880038ED4D0899BEC73A1E24A185A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <KL1PR03MB880038ED4D0899BEC73A1E24A185A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Date: Thu, 08 Jan 2026 13:46:29 +0200
Message-ID: <5c81c9d2864287460d69b70f1b3e74a497d71595@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 08 Jan 2026, "WangzXD0325@outlook.com" <WangzXD0325@outlook.com> wrote:
> Hello DRM maintainers,
>
> This is a WARNING bug detected by syzkaller.

As this is an issue detected using a tool, it would be quite helpful to
include the minimal command-line required to reproduce the issue.

That said, I'm not quite sure who is going to step up to debug and fix
the issues. But at at least lowering the bar improves the odds a bit.


BR,
Jani.


> 1. Description
> A kernel WARNING was triggered in drm_gem_object_handle_put_unlocked during the close() syscall on a DRM file descriptor. The issue appears to be related to GEM object handle management during the release process (drm_release).
>
> According to the log, the warning is located at drivers/gpu/drm/drm_gem.c:300.
>
> 2. Environment
> Kernel Branch: mainline
> Kernel Revision: v6.18 
> Kernel Config: https://gist.github.com/manual0/b8f4c12ea784620b3db92dbe56afedbb#file-gistfile1-txt
> Compiler: gcc (Debian 12.2.0-14+deb12u1) 12.2.0
>
> 3. Syzkaller Report
> WARNING: CPU: 3 PID: 48617 at drivers/gpu/drm/drm_gem.c:300 drm_gem_object_handle_put_unlocked+0x30e/0x3e0
> Modules linked in:
> CPU: 3 UID: 0 PID: 48617 Comm: syz.3.11626 Not tainted 6.18.0 #1 PREEMPT(full) 
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:drm_gem_object_handle_put_unlocked+0x30e/0x3e0
> Call Trace:
>  <TASK>
>  drm_gem_object_release_handle+0xc7/0x200
>  idr_for_each+0x119/0x230 lib/idr.c:208
>  drm_gem_release+0x29/0x40
>  drm_file_free.part.0+0x724/0xcf0
>  drm_close_helper.isra.0+0x183/0x1f0
>  drm_release+0x1ab/0x360
>  __fput+0x402/0xb50 fs/file_table.c:468
>  task_work_run+0x16b/0x260 kernel/task_work.c:227
>  exit_to_user_mode_loop+0xf9/0x130
>  do_syscall_64+0x424/0xfa0 arch/x86/entry/syscall_32.c:308
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
>
> Best regards,
> Zhi Wang

-- 
Jani Nikula, Intel
