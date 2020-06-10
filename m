Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C71F52F5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 13:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273076E525;
	Wed, 10 Jun 2020 11:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39736E525;
 Wed, 10 Jun 2020 11:20:00 +0000 (UTC)
IronPort-SDR: r7q/RWm9Ngf4sIcFFaRVOgZI0JIimXMDr6AGmPWLvgn1B0C6wcnoLUyxASzs753fdJ7XkXY2da
 oovrUhTePfdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 04:20:00 -0700
IronPort-SDR: XUS0bAxuLGXrDoxyflGA7pQxhrpKRQym6i7IwOB3+qQrw8sStNQZQY/bOGQDGmdzMoDWAcxGTF
 TSm633yhwWMA==
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="349818113"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.92.206])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 04:19:57 -0700
MIME-Version: 1.0
In-Reply-To: <20200610093700.GA8599@jlahtine-desk.ger.corp.intel.com>
References: <20200610093700.GA8599@jlahtine-desk.ger.corp.intel.com>
Subject: Re: [PULL] drm-intel-next-fixes
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 10 Jun 2020 14:19:54 +0300
Message-ID: <159178799449.10895.1314682153738530580@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2020-06-10 12:37:00)
> Hi Dave & Daniel,
> 
> Sending this one early for it to hopefully make it in before -rc1.
> 
> Two important fixes: OOPS fix that was missing "Fixes:" tag and
> not picked up earlier. Also fix for a use-after-free in cmdparser.
> 
> Additional fixup to module param types.

Oh, the CI results:

https://intel-gfx-ci.01.org/tree/drm-intel-next-fixes/combined-alt.html?

CI_DINF_195 was drm-next
CI_DINF_197 is this PR

The extra yellow cells due to FIFO underruns are due to a
concurrent CI update that started flagging the issues. So
no regression, just existing long-running issue being
highlighted.

Regards, Joonas

> Regards, Joonas
> 
> ***
> 
> drm-intel-next-fixes-2020-06-10:
> 
> - Avoid use after free in cmdparser
> - Avoid NULL dereference when probing all display encoders
> - Fixup to module parameter type
> 
> The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:
> 
>   Merge tag 'drm-intel-next-fixes-2020-06-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08 11:59:57 +1000)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-06-10
> 
> for you to fetch changes up to 3680c2e9f4254d1f033bf00f540e47a51f8f996b:
> 
>   drm/i915/display: Only query DP state of a DDI encoder (2020-06-09 14:47:05 +0300)
> 
> ----------------------------------------------------------------
> - Avoid use after free in cmdparser
> - Avoid NULL dereference when probing all display encoders
> - Fixup to module parameter type
> 
> ----------------------------------------------------------------
> Chris Wilson (2):
>       drm/i915/gem: Mark the buffer pool as active for the cmdparser
>       drm/i915/display: Only query DP state of a DDI encoder
> 
> Jani Nikula (1):
>       drm/i915/params: fix i915.reset module param type
> 
>  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 56 ++++++++++++++++++++++----
>  drivers/gpu/drm/i915/i915_params.c             |  2 +-
>  3 files changed, 52 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
