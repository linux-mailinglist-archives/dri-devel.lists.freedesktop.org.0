Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A727AFAAF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 08:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730F610E0DC;
	Wed, 27 Sep 2023 06:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223D10E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695794741; x=1727330741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gxNbZGqI7yHu2ScNl9my5CtZLsRlc7YmxftZCIK8WF0=;
 b=fApIBAj71eWcMT+QmD378NSO9uL9WohHMM9xGp1Zy9A0jPwam96/4kbE
 rCs/JTjdq4Qi25Cw/9U8LpiB1LDGgc9gTLfrHwJFXIuVuFA9lNm1jkXW9
 fSIS5iM3QaJswrtCXfflrKN3KWWxEN5i5KBtycJdNe7vrbAw/q34ta+Nw
 OLeLyvFdTQTyarPRm9UKPq9B+7VJ2N96bpKst3+KeI1Y+nNMs7RHGo42y
 naJ1Oy6fvbpUFVLPZTQJlBbPGsHPCiNDdvdIxcBgvElRiKBQe6YVgDGbt
 RwnX1TYijSO/DWaF91TnMRIbnjMGRd3ofCzIy1eqA3DyX8ntVM57HAGzS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361125085"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361125085"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 23:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080003360"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080003360"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 23:05:39 -0700
Date: Wed, 27 Sep 2023 08:05:37 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] accel/ivpu: Fixes for linux-6.6-rc4
Message-ID: <20230927060537.GE846747@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 02:11:31PM +0200, Stanislaw Gruszka wrote:
> - dmesg flood fix
> - HW power-on and interrupt handling fixes for VPU4 
> - FW loading/mapping fix 

Pushed to drm-misc-fixes.

I had to resolve conflict when rebuilding tip, hope everything is ok there.

Thanks
Stanislaw

> Jacek Lawrynowicz (1):
>   accel/ivpu: Don't flood dmesg with VPU ready message
> 
> Karol Wachowski (4):
>   accel/ivpu/40xx: Ensure clock resource ownership Ack before Power-Up
>   accel/ivpu/40xx: Disable frequency change interrupt
>   accel/ivpu/40xx: Fix missing VPUIP interrupts
>   accel/ivpu: Use cached buffers for FW loading
> 
> Stanislaw Gruszka (1):
>   accel/ivpu: Do not use wait event interruptible
> 
>  drivers/accel/ivpu/ivpu_drv.c         |  2 +-
>  drivers/accel/ivpu/ivpu_fw.c          |  8 +++++---
>  drivers/accel/ivpu/ivpu_gem.h         |  5 +++++
>  drivers/accel/ivpu/ivpu_hw_40xx.c     | 28 +++++++++++++++++++--------
>  drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
>  drivers/accel/ivpu/ivpu_ipc.c         | 11 ++++-------
>  6 files changed, 37 insertions(+), 19 deletions(-)
> 
> -- 
> 2.25.1
> 
