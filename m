Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B68EA6A7190
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BA910E117;
	Wed,  1 Mar 2023 16:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC0510E117
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677689608; x=1709225608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=90bqr2zZH080ohiZVz65qC69BRG67D276LK7gA+7dgw=;
 b=X19cuOb90sK14LKBWisMBftPSMGhnR7+3gRfdGD4h75tswyriA8bAzIa
 rAf67O4RmoiZ0DAprJdV4GcakFMRtvnWqgzn9IDIEioFBWgsKLzinBx2z
 FjcQGnEFCFJWN+aKIaKRb6wHhjI/GrR0/FVNO7hdxh+GOUPtpEw4SgvdE
 K7Et/M1DIbVVjE57WVzw8QxGIWnjfTNvIdSbwQnIXoRvBdqJkgihppzrn
 AG7UoMMgKDf6I0Zi5DWju+2TlflFB5Vk0AkuCX01Tkvr7p/TGQA36Yx7j
 L55ax4r34zBjrZokoNpk1isaqvgcENe1kRFbHRVS3QiLFSQC8NdR2GxSK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399246046"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="399246046"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 08:53:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743498709"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="743498709"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 08:53:06 -0800
Date: Wed, 1 Mar 2023 17:53:04 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel: Build sub-directories based on config options
Message-ID: <20230301165304.GA3963532@linux.intel.com>
References: <20230301162508.3963484-1-stanislaw.gruszka@linux.intel.com>
 <3d6df357-ed90-5a0e-e9a8-bb39e147798e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6df357-ed90-5a0e-e9a8-bb39e147798e@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 09:31:10AM -0700, Jeffrey Hugo wrote:
> On 3/1/2023 9:25 AM, Stanislaw Gruszka wrote:
> > When accel drivers are disabled do not process into
> > sub-directories and create built-in archives:
> > 
> >    AR      drivers/accel/habanalabs/built-in.a
> >    AR      drivers/accel/ivpu/built-in.a
> > 
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Should there be a fixes tag?  Feels like something that should be
> back-ported.

This tag could be added:

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")

but since then Makefile changed with habanalabs addition.

I expect this will go to drm-misc-fixes and then to linux 6.3-rcX
from there, so (stable) back-port will not be needed.

Regards
Stanislaw
