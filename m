Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B547DA5C6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 10:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02D410E080;
	Sat, 28 Oct 2023 08:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB0E10E080
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698481124; x=1730017124;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d3quePgJmkWbvCsun+5tsXcQMFlRDpHuySRtaDuJy3U=;
 b=j29O7Kmmu2AhptAn8a/cVeRJ0Bacm+HURKhk3rBvpYdpLRajVg0dKfWL
 ye52grtiB7pLay8fTuYZvi0fiTwZxlPIRapyTDESM6fqR1sYUG5fgZ9Zd
 s4xIBVwkaNNTFq9AQqoqegltQjA0fGtPwVGPs7nxU2G+L2rFB7eDZcMHB
 dt7KMg1l7V0G6Zh57MNF6u2ldtoKSl5InTFcQMw6N3Jvq1QyusuWU0Veo
 UpJxQ4xincdlpFMYWNX7NB2jUDV9iEFNF/iJHBBCnpno4QfvRT160wRTH
 0s/OiTbOBGZcgxH+dB04QtQb0B2wWLIeaUEWgFYIveLfusPkl+/Q43kYN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="683884"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="683884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="1006973326"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="1006973326"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.225])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:18:41 -0700
Date: Sat, 28 Oct 2023 10:18:39 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 06/11] accel/ivpu: Change test_mode module param to bitmask
Message-ID: <ZTzD364/1CC736AE@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-7-stanislaw.gruszka@linux.intel.com>
 <e53dabb3-e8ec-b033-60f0-462f6e225e51@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e53dabb3-e8ec-b033-60f0-462f6e225e51@quicinc.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 08:47:11AM -0600, Jeffrey Hugo wrote:
> On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > 
> > Change meaning of test_mode module parameter from integer value
> > to bitmask allowing setting different test features with corresponding
> > bits.
> > 
> > Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Seems like this changes the uAPI.  You still haven't made a release of the
> userspace, correct? 

Yes the user space is not yet released. However I think module parameter
is not considered part of the linux kernel uAPI and there are no guaranties
regarding not changing or removing or change the semantics.

Obviously we don't want to brake anyone config file or script, but that's more
like courtesy than hardcoded rule. Currently nobody except Intel and it's
partners are using intel_vpu and all user should be aware of the change.

Regards
Stanislaw
