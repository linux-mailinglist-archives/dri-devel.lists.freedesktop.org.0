Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBAB7D2AF7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61CA10E150;
	Mon, 23 Oct 2023 07:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89ED10E150
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698045227; x=1729581227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DNA8Y0ZMzIa4VFyYd7CHxhD71xZodRzI9oDYx8ZjiHw=;
 b=QyKBVkucCUWAemx3/6yJ9HgqpqrUgaT39/cwTQah0R+Dg17TEpEl/93m
 2bFZUZF3RSEG4TE5tR/pI3jPOORM8dA4Fp8Lm0PnvLoZt5qhFXtW1/FTh
 h4J4XegOrDLi7RJv/aMQRq0tDqpOHZH+FYdM2CAOBUDFKucDLmO80sCUT
 OfpUuMu2VZf0xxXVuy3mRmBbHVDMH390MSnLPPK8VgIcJtLIl902K1xlF
 xfHGVhmocIiqMhy0WqYsDghDHtral/zNpPDflrE2axxTYz+oe2HkCTJU+
 wzVix1hEZ/DUGO2vZX49g5p0M9zmbLVTYtNLs2vKZgCOT19+1YXKnYn9g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="451002246"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="451002246"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="707835997"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="707835997"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:13:44 -0700
Date: Mon, 23 Oct 2023 09:13:42 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] accel/ivpu: Update to -next 2023-10-20
Message-ID: <20231023071342.GD704032@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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

On Fri, Oct 20, 2023 at 12:44:55PM +0200, Stanislaw Gruszka wrote:
> Random changes across the driver.
> 
> Karol Wachowski (1):
>   accel/ivpu: Read clock rate only if device is up
> 
> Krystian Pradzynski (3):
>   accel/ivpu: Use ratelimited warn and err in IPC/JSM
>   accel/ivpu: Fix verbose version of REG_POLL macros
>   accel/ivpu: Print IPC type string instead of number
> 
> Stanislaw Gruszka (2):
>   accel/ivpu: Do no initialize parameters on power up
>   accel/ivpu/37xx: Remove support for FPGA and simics
Fixed typos pointed by Jeffrey and applied to drm-misc-next

Thanks
Stanislaw
