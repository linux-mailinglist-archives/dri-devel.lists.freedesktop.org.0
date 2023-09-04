Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF203791477
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 11:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42A10E306;
	Mon,  4 Sep 2023 09:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77210E306
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693818688; x=1725354688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SVoVUF3mBKiEmxs8Wo+xD1Ih9xJj93mvBc/qxg1Ao1U=;
 b=VQ/+XcaLJsjwkLHU0BJUEPUJXy+qpgLvmGSJ8QkQJJ6cpSbBL6VTYqb1
 VBxIjS5HqJIlzAcbFkB7i32AKivwFxUEZl3WPeYM+vrhfBmJ6Je7Tj+uo
 bpn1g9eMsTzxz1GFRaWclVzw8FuZ7xPYkWCQTmQ5hEFgIwgWt657sbPd+
 puqHeBLA4mdjy0HMEHtXJLMsgexCYu6Lokc06nS6SMlb5arz8bBswREqm
 /6Up+QO5ifR8iGW9WFfMrQXQKZOs8PMvUD6KaRYEtrO6ONxTU7aUSP/gQ
 ZaZdnOe9ZdLTy7z1VGU4LpJRP0Pl1okwOdQdNUAGik6cdwi4nB+9uBC/d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="366778005"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="366778005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="743869212"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="743869212"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:11:26 -0700
Date: Mon, 4 Sep 2023 11:11:24 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] accel/ivpu: Update for -next 2023.08.25
Message-ID: <20230904091124.GA184247@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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

On Fri, Sep 01, 2023 at 11:49:46AM +0200, Stanislaw Gruszka wrote:
> Update for -next:
>  - various cleanups
>  - begin preparation for conversion to GEM SHMEM
>  - print information about used workarounds
> 
> v3:
>  - fix commit messages
>  - split patch 2 into separate patches
> 
> v2:
>  - fix compilation without CONFIG_PM

Made changes requested by Jeffrey and applied to drm-misc-next .
Except patch 8 which require small change from mainline to apply
cleanly. I will wait until 6.6-rc back-merge for it.

Thanks
Stanislaw

