Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FC7BB751
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 14:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2981C10E4DA;
	Fri,  6 Oct 2023 12:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462F10E1F2;
 Fri,  6 Oct 2023 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696594031; x=1728130031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ebuT+6vHDbPi1CVkg6q7nGvxWeb9dWXq9T75cBfSFx0=;
 b=O03tqqaQ+vv73mwy20s7TkkZrEN/VQqP68AqBujIIyv+fXk7bSuIcd9l
 6uNfqoJPQNxXr/3egaAIeEiHtPoH7FeNwhPqfYvRUgsGc6PxZwwczJPcq
 tECMzVZEvXwf6Hs9HCZ/bo1WoqRbkf5HXlLjJqB0f0C6xy8hXtKSzAO1U
 YkHS5tccs9wnzFf/aR3va8o/zkvdjYxqcwyJ43CwQu3Ofg+NB9lfJoR2f
 s32AKY9HhrCiil/S683VBMS9bAEac6AHEfCtIX10yj7gjwK85VPw4gga3
 0ljNa/OdfYhGZV38tSnedPiruP6MkT3wl7Nuy2gg4PyTsxtKEy1LOwNLf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450230180"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450230180"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 05:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787370567"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="787370567"
Received: from suthengc-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.154.2])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 05:07:06 -0700
Date: Fri, 6 Oct 2023 14:06:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Remove incomplete PVC plumbing
Message-ID: <ZR/4YZYyISZxtTjk@ashyti-mobl2.lan>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006083103.660153-3-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Fri, Oct 06, 2023 at 09:31:02AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> PVC support will not be coming to i915 so get rid of its partial
> enablement and reduce the driver maintenance burden.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
