Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459466B1755
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 01:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324A10E0C0;
	Thu,  9 Mar 2023 00:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BEB10E0C0;
 Thu,  9 Mar 2023 00:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320070; x=1709856070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zv20jPCINFakTYCqUmZD3EcBqCSqS/XF/HDBjCEXcqc=;
 b=MRjAj1sCXyvugdCVBDK0E0+RXRiuOLyyrsMZWcQLmNFHnqBtL7QoNeB/
 4zKc8dguM7dk+dwniKwX2CWfIC1yO+X2oxszgDjtLjmDbdzc++RsEXcnH
 +58jruB9AiMyW5T2h39WZUvMgmrogv2hkPPd1srvvnAPkLOZNqkMFWs1Q
 WP/Z8Y/Osny6Gg+RE6JDUdXX7GWAlavZyL4reqCp02TwHUVgTQg0Cm6sE
 G4Z4bKPlksBR6nEsOcQlMj5JhqyhMh5ZKYcE2EleGxQZ8g7EcsNEwDPZw
 JTNH2fQJSudJT0tpfFNXL93lvvP0pgluJvN1QzHFyUVWRmG5J1h2wq8wd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="401142086"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="401142086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677186739"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="677186739"
Received: from gbain-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.108])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:00:56 -0800
Date: Thu, 9 Mar 2023 01:00:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 1/4] drm/i915/gt: make nop_clear_range public
Message-ID: <ZAkhtn8ROeSb4AUs@ashyti-mobl2.lan>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
 <20230308-guard_error_capture-v5-1-6d1410d13540@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308-guard_error_capture-v5-1-6d1410d13540@intel.com>
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

On Wed, Mar 08, 2023 at 04:39:03PM +0100, Andrzej Hajda wrote:
> Function nop_clear_range can be used instead of local implementations.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
