Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B25611E38
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 01:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F3C10E901;
	Fri, 28 Oct 2022 23:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA52D10E8FF;
 Fri, 28 Oct 2022 23:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667000482; x=1698536482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FvMpnK36q+J9IrtKkD1OhSNyNNsMn22rphzsQ2Z5ATk=;
 b=HZ5lr7gF3jl7piPYL9QElfMvpwK6byNvsZgng06nUDHLDFYvZkQhOmRs
 2EiyAqv6xhp4owOjj6CvhL/U4/OfvJZSc/jjL2sVwnAOqaM+d0a4UubHt
 pCwT3lSgPMYR+/+JTRyu7k5vUab83GW/IPB5Qa/F41yJB4T67Abo1e5cD
 Z6KTiMWCvexJLZ0A/fmIs8i3M7dcFliX+R3MYP1QVCsEmIzMGj9AMSpI/
 B8iYdA7UPYQ2xOY+X+mEEGmjUXv7ZMn3HTkLXbPkmbZyuu5OPH1kTMb/S
 RR4/9PWRRXxnqMdr7yzhTkspvq8C3EecSXL1Ms9r5jP33yMcIHgNvj/5c Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="309704244"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="309704244"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 16:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722233731"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="722233731"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 28 Oct 2022 16:41:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 29 Oct 2022 02:41:17 +0300
Date: Sat, 29 Oct 2022 02:41:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next
Message-ID: <Y1xonYqg5qrbTFA/@intel.com>
References: <Y1wd6ZJ8LdJpCfZL@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1wd6ZJ8LdJpCfZL@intel.com>
X-Patchwork-Hint: comment
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 02:22:33PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> 
> Here goes the first chunk of drm-intel-next targeting 6.2
> 
> The highlight goes to Ville with many display related clean-up
> and improvement, some other MTL enabling work and many other
> fixes and small clean-ups.
> 
> drm-intel-next-2022-10-28:
...
> - ELD precompute and readout (Ville)

A slight clarification seems to be in order. The ELD
precompute+readout is in fact not in yet. This was just a pile
of cleanups and minor fixes. The real ELD stuff will come later,
once we figure out how we actually want to do it.

-- 
Ville Syrjälä
Intel
