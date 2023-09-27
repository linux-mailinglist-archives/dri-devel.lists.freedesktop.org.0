Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D17B0298
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB58710E4D9;
	Wed, 27 Sep 2023 11:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F210E4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695813390; x=1727349390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RH/m3NDGCQ3bnpca/RJJUXRmQCnKinFz4BUFRxz+Cqo=;
 b=g/daVJUPlqy/4OR4K9YI42UOLHkm/Gi/tKuJ4/P+x5Ob3axQ6mONWNdp
 ihB45h9JdKtH5MjASvNS7NmO69pm2+iER5AUisrd8rJO8NSjYwGnEdndm
 Q7aom+3Hr6tu8O+ZVfrSGxXrRTCaNETssINdEDFfOME7xYd+skd6lM9D1
 a1YW+d1KHSwBWzSJh4P1CiAi0d0K5AMQBt8YN2LmkaujcPTphVHtSiCYX
 tJelzcE0FQIulsOZPSPXH2rEuOfhELgNv2YyXaiW4AhcCQ/WjYz2edh3v
 RCGGMIoBwhmdymuxjCdogfEOGTZbgsS43wqvVvJsNiXujqvaf7i9y2c9j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385655102"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385655102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742678808"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="742678808"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:16:28 -0700
Date: Wed, 27 Sep 2023 13:16:26 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] accel/ivpu: Update debugfs to latest changes in DRM
Message-ID: <20230927111626.GF846747@linux.intel.com>
References: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
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

On Thu, Sep 07, 2023 at 09:26:09AM +0200, Stanislaw Gruszka wrote:
> Use new drm debugfs helpers. This is needed after changes from
> commit 78346ebf9f94 ("drm/debugfs: drop debugfs_init() for the render
> and accel node v2").
Applied to drm-misc-next

Thanks
Stanislaw

