Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842274AC76
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3C610E527;
	Fri,  7 Jul 2023 08:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20D10E527
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688717096; x=1720253096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E5ATNdPwsgWK6MvbcrQUaJtfV9qxo0Dm0gl9+kj97zM=;
 b=EMShPc1duR2KIGfPt+6WYrXgKKVCbfRXvB1GSjWbxQFNhEIIUQFcPXMm
 FuKcVwaBuLmxSNLVXlIOK93mWyms8fzjCx3gkMyXiiKFzu+XYJtLudzv1
 mMJFPzuiGAw1A4Pmv201hMT5ErvLc7TVhvOUTaRcKps/zP4R76rqho06k
 qBWOKV+jjkh+VCeWB0QE47MLudT4QMfR2n/GlrePnWjNXEkqEePp+6ogw
 YcLmY56pWcVcpUzBLLEkjH0jtPZuiP80mj2/qfOX12lQ+SLqpFNKp3AzL
 Ac+N8wNomeUCN1yViXvlUknvgxaLU7TffHbh+dBU8tGhqBr8oDHu0qCA0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427517118"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427517118"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 01:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050428313"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050428313"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 01:04:53 -0700
Date: Fri, 7 Jul 2023 10:04:51 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] accel/ivpu: Add debugfs support
Message-ID: <20230707080451.GB2135759@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 09:48:42AM +0200, Stanislaw Gruszka wrote:
> Add debugfs support for ivpu driver, most importantly firmware loging
> and tracing.

Applied to drm-misc-next

Regards
Stanislaw

> 
> Andrzej Kacprowski (1):
>   accel/ivpu: Print firmware name and version
> 
> Krystian Pradzynski (1):
>   accel/ivpu: Add fw_name file to debugfs
> 
> Stanislaw Gruszka (3):
>   accel/ivpu: Initial debugfs support
>   accel/ivpu: Add firmware tracing support
>   accel/ivpu: Add debugfs files for testing device reset
> 
>  drivers/accel/ivpu/Makefile       |   4 +-
>  drivers/accel/ivpu/ivpu_debugfs.c | 294 ++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_debugfs.h |  13 ++
>  drivers/accel/ivpu/ivpu_drv.c     |   5 +
>  drivers/accel/ivpu/ivpu_fw.c      |  68 ++++++-
>  drivers/accel/ivpu/ivpu_fw.h      |   4 +
>  drivers/accel/ivpu/ivpu_fw_log.c  | 142 +++++++++++++++
>  drivers/accel/ivpu/ivpu_fw_log.h  |  38 ++++
>  drivers/accel/ivpu/ivpu_pm.c      |   1 +
>  drivers/accel/ivpu/ivpu_pm.h      |   1 +
>  10 files changed, 563 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.c
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.h


> 
> -- 
> 2.25.1
> 
