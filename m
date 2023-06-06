Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868672431E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 14:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129EE10E331;
	Tue,  6 Jun 2023 12:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086810E331
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055959; x=1717591959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QEYX0Ex41ZXbR1YLfgJZbRaO+hNuoY7e64mWtN7i1j4=;
 b=Kwp+xjEAICGXyICZZOu0M+vHEUPsAeIBVlN8U8wnaPg9g0yX7h55Goxz
 pUYhhg5pf5XvtjDg1v007wAFD74HFEQj3l1CzfkMYu78VLqFurm9zDYll
 3Bnt/REjlRu8njz+rVlU9IZIi26HhmOUaoxd9uXrTsfPOSd7APqImoFfd
 yTpnzQzmN7NvoEiHshuenABZrnqOoEAoueVLMSq1JgzZGcA48DgX/Q0fi
 fNPkcoGI2TzafkM852sEDCLD8DJqUxUectM1MZQpfj/1/IhwklYOhxED1
 H4lQAdrC5v7dfQvWJIqsP/a3mvzNaV7Q1nN7MH53t90vgPEGnywknc3kV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354155646"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354155646"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738774413"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="738774413"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:52:36 -0700
Date: Tue, 6 Jun 2023 14:52:35 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/ivpu: Reserve all non-command bo's using
 DMA_RESV_USAGE_BOOKKEEP
Message-ID: <20230606125235.GB324119@linux.intel.com>
References: <20230413063810.3167511-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413063810.3167511-1-stanislaw.gruszka@linux.intel.com>
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

On Thu, Apr 13, 2023 at 08:38:10AM +0200, Stanislaw Gruszka wrote:
> Use DMA_RESV_USAGE_BOOKKEEP reservation for buffer objects, except for
> command buffers for which we use DMA_RESV_USAGE_WRITE (since VPU can
> write to command buffer context save area).
> 
> Fixes: 0ec8671837a6 ("accel/ivpu: Fix S3 system suspend when not idle")
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Applied to drm-misc-fixes

