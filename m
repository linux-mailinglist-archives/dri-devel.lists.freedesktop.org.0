Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB647B0300
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2110E4E0;
	Wed, 27 Sep 2023 11:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CAF10E4E0;
 Wed, 27 Sep 2023 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814362; x=1727350362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CO0IRL6OIwwmJIioqpyWqS5YSQrws6fWdIRTMM6ILzg=;
 b=YfhRl2wmaOwOL33FsK13K+fqfuYCaDDr3+AQm/ciVJomHxts9v5CROSR
 1e+6y1CwX1PAvZQOzA6J/q/hIYv/GWg4xWhc7RGhmiMI2OEBqj6UjgCi9
 kWENbpWqoGkXfXb3Xly4v+cXRBH4NTb2tJmKWO6hsvjAFBGYz1QHDvFBn
 mWm0mNmHGZpavhV+cRrgjP6ZDuqbba2SgLEyN4vS0h1WZo94925MEEGvn
 wkLcE9a1fF//xrySObaFkcnZW4mfm6R8oytW0t4JzlaCoPgU95aJctiCG
 1DrEicnyPPe1IdIc94UjMl5PQr75QitZ1mxZ2Io8BftdH4OtXe0xmLOTw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361188041"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361188041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892567204"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="892567204"
Received: from xueqilim-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.83])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:31:29 -0700
Date: Wed, 27 Sep 2023 13:32:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Reset steer semaphore for media GT
Message-ID: <ZRQSzq8kU0TuWety@ashyti-mobl2.lan>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
 <20230927102237.30773-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927102237.30773-2-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Sep 27, 2023 at 12:22:36PM +0200, Nirmoy Das wrote:
> During resime, the steer semaphore on GT1 was observed to be held. The

resime/resume/

> hardware team has confirmed the safety of clearing the steer semaphore
> during driver load/resume, as no lock acquisitions can occur in this
> process by other agents.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
