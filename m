Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31A6B176C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 01:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8430F10E764;
	Thu,  9 Mar 2023 00:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D4910E157;
 Thu,  9 Mar 2023 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320144; x=1709856144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Ti/HKdse3vtp4gGV+yH/2hnO+BkMioCYWNo45U+7hE=;
 b=e8I1X/FZ4Xz5iBtu+kYFzIMC7QyopV7DISMAfSFwkehbA+IWQmXHrVKF
 Lnwi9+1CmOzvSHLyITiA+jW67Abg2Vw0kVpYCmlIBq2XpkN29uRZ3Ypod
 96CJlQZSs22MXU7J36VNZFrT2YPSRmNRU5xh08nbYenAuCBizUSniBlqZ
 S+T8N5V7E2x0buptBRNBIRzM/0QgLswD5l3+goA1x8ETnTuakX+TfgWsK
 JDo2PXJTJolNX6pAfVNLmdjQ9IkTLdo7PY9Kt8CmDYs33jmKZj3zF3z2I
 RqtNfbhNWjkl7aM6+X24cN1wLBkmxu9T/Iep/M16QowdgGWKclnAeyY2h Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="363947497"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="363947497"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679528032"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="679528032"
Received: from gbain-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:02:21 -0800
Date: Thu, 9 Mar 2023 01:02:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 3/4] drm/i915/selftests: use nop_clear_range instead
 of local function
Message-ID: <ZAkiCsnVYq+c7YqI@ashyti-mobl2.lan>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
 <20230308-guard_error_capture-v5-3-6d1410d13540@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308-guard_error_capture-v5-3-6d1410d13540@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Mar 08, 2023 at 04:39:05PM +0100, Andrzej Hajda wrote:
> Since nop_clear_range is visible it can be used here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
