Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8F7DA5A1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 09:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D23610E05B;
	Sat, 28 Oct 2023 07:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574CE10E05B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698479945; x=1730015945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iwJAHg41/OSbvb+sXPVEt90Jhk+wNlMcb3ew4IMN8NY=;
 b=XT1xz8vUKmb3m/dRMLkYJ5nVaNosxDanpchX7n8A7wqLWE2bKO6b3JvM
 PSpBBT+4snyzdbb3R+eWjTHidEereg1IJGZ83x+RZX+e4VJ5RLybAhLrj
 6tPH5WsED0tyIqtkbEWFpI4uaVwIBvfiar1+d0/Jct4mOcooh7I3hCogM
 n5EYWBeceXawrDjzalCVPw+D9GqYNJ1mJulPciA9c2UKb8b333pBVyqDP
 79e1enOFNq2yjzUEAzFGnPJ+2e3oOmNL2oUEIA8+ltkClrVAUrr5cXK0u
 rVBguk9pXYgZ+reBU/z7EFs+ZTd3kt2bQcsYAh8wb5COIllow/jyZUWqY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474123654"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="474123654"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 00:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="1070095"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.225])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 00:58:51 -0700
Date: Sat, 28 Oct 2023 09:59:01 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 01/11] accel/ivpu: Update FW API
Message-ID: <ZTy/RbjBxVgELWTk@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-2-stanislaw.gruszka@linux.intel.com>
 <c83b4b50-fb25-6888-deb3-0a1e6a27165d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c83b4b50-fb25-6888-deb3-0a1e6a27165d@quicinc.com>
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Oct 27, 2023 at 08:37:39AM -0600, Jeffrey Hugo wrote:
> On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> > From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> > 
> > Bump boot API to 4.20
> > Bump JSM API to 3.15
> > 
> > Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
<snip>
> >   /*
> > @@ -89,6 +98,14 @@ enum VPU_BOOT_L2_CACHE_CFG_TYPE {
> >   	VPU_BOOT_L2_CACHE_CFG_NUM = 2
> >   };
> > +/** VPU MCA ECC signalling mode. By default, no signalling is used */
> 
> This does not look like valid kernel-doc.  Maybe you wanted "/*" instead?
> 
> > +enum VPU_BOOT_MCA_ECC_SIGNAL_TYPE {
> > +	VPU_BOOT_MCA_ECC_NONE = 0,
> > +	VPU_BOOT_MCA_ECC_CORR = 1,
> > +	VPU_BOOT_MCA_ECC_FATAL = 2,
> > +	VPU_BOOT_MCA_ECC_BOTH = 3
> 
> Personal preference, but having the "=" and the interget values all line up
> vetrically would make this a bit more plesant to look at.

This file came from FW and I'm reluctant to make any changes here, even
formatting. I'll ask if in the future we can get some improvements of
formatting done by scripts or if FW can change their files.

Regards
Stanislaw
