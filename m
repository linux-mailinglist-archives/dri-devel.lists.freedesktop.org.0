Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2777F79147E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 11:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858210E30D;
	Mon,  4 Sep 2023 09:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B710E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693818732; x=1725354732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cRXNq9EH5e0PduqdEKQkaQOgqb4pxzgS4wdXvH0K0B0=;
 b=gGC7a03vvzaTyRzHRDYGq4qhF47ddprcw12lA2HzE8TGzi9t3DD5KHvf
 J2l/lh8zosn+NVA02GocsDITlj3tQzSCKcCurYGX/2vhLHddIPK+zyVs3
 iNZhBrGUkqhKReMnQezvVlwEQUOiiudeN1cARPMlH9A4JrQy5jyIL2l8U
 vhsbqHc5R20gB31E+BZGS8AbyD5KF8dxgm92U3Ut6iIlsqOA6XGW0EhBj
 NVGR8Wjl6kBDx7UGNVXNdwyE7VSLOTOSpK7iRcwTsIx2sKrubK2XnJ7A7
 B5xJUsHHE+HKQLmMPesOTC2JcWObYUf4RAF9lPQ2MFN3LHkLiD2jvKFAy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442953346"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="442953346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690521395"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="690521395"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:12:02 -0700
Date: Mon, 4 Sep 2023 11:12:00 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: Register for PCI driver at the beginning of
 module init
Message-ID: <20230904091200.GB184247@linux.intel.com>
References: <20230901161037.6124-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901161037.6124-1-quic_jhugo@quicinc.com>
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 10:10:37AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> As qaic drivers base device is connected to host via PCI framework, it
> makes sense to register in PCI framework at the beginning of module
> init.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
