Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51F6A98F0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 14:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9610E5D6;
	Fri,  3 Mar 2023 13:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8894710E5D6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677851859; x=1709387859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nSpXovstq9ryCqVJkFnv7h1Lwdq9lEritgt5M4+pxzw=;
 b=GyDH7+IkJugawr9OleqJ93+pm4I65iDN4XJG+BoPIdaE0fND6FB50G7e
 R7uUgytWbpd6IU3cNSJx/T/PPAkIignoZUKHzDKlCXGkO+7R9gknfi0Me
 Yh18qlO1cquzjEpaXsp9hCyRy5VSr+EB+xHbwOJ3CD/EJ58cRIN2QLY9V
 BYC+7ElfaaPfsjsXl54pWmqrUOabMf5Psq6fWkYIp9M4ENygaQ+TgiQYt
 x2MzTHaoBtjZgdue9wb4+5UsLRjTj+ci5xUz6x9yb00ppMLwWZ2AiBYOr
 jN+H6LMiLRFnQELx7bXUW/X/ElqX1hxKAcTtmiCfI6WegR5lCnimuNlQk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397634444"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="397634444"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="744247173"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="744247173"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:57:36 -0800
Date: Fri, 3 Mar 2023 14:57:35 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 3/8] accel/qaic: Add MHI controller
Message-ID: <20230303135735.GG3963532@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
 <20230228115239.GH3547587@linux.intel.com>
 <0f2959e3-8d9e-b603-1317-0d348263f90c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f2959e3-8d9e-b603-1317-0d348263f90c@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 09:09:57AM -0700, Jeffrey Hugo wrote:
> On 2/28/2023 4:52 AM, Stanislaw Gruszka wrote:
> > On Mon, Feb 06, 2023 at 08:41:40AM -0700, Jeffrey Hugo wrote:
> > > +	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
> > [snip]
> > > +	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);
> > 
> > I recommend usage of devm_kzalloc(), devm_kmalloc() for those
> > to simplify error and exit paths.
> 
> When this was written, I didn't want to pass the struct device to the
> mhi_controller just for the purpose of using devm_*.  Today, I'm thinking
> that is not the end of the world, and devm has advantages. Will change.

If already available &pci_dev->dev can not be used in devm_ due to
different life times of pci_dev->dev and mhi_cntl, I don't think change
would be justifiable and kmalloc/kzalloc should stay.

Regards
Stanislaw

