Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF677D50E1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 15:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332AA10E398;
	Tue, 24 Oct 2023 13:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007710E398;
 Tue, 24 Oct 2023 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698152611; x=1729688611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uOVs+S/Vm5KdP4XzRWN/fe7nQcMLrO0eNOaeBiJ8gw0=;
 b=nSxDdqrrhEgu4Mf8MzSwajaFVh6QQED1OR4bn7rexdOp3P0S7FH6iyvO
 5Qk1ifIge10u7FJeN03wenx9G+429olDtlaHYmWCOwouG++7KRd4jLt07
 d0leQzhzsuGmr1RIUwRlmj+TVJb6syKTEQjic/mutcTDFlP6ox6zKuLpg
 PrpME/U6dLJg6nupFsKQR8y/XohHDnbx+7FuNU/ecdMgAkLQ/i0Sfa51W
 Xs0SGBD8PG/IJUXZJgFqlJtD1qQ15uLk8xb4cH3ckJ/a0lGGYTEVs5hnk
 Rrbc0h2qEkvKBl7pL4oFeHjKplrqJ6pUlI5LW85TiJ+UvJbbAA5Vt1Y4s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390925202"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="390925202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 06:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="875063991"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="875063991"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga002.fm.intel.com with SMTP; 24 Oct 2023 06:03:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Oct 2023 16:03:27 +0300
Date: Tue, 24 Oct 2023 16:03:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <ZTfAn2al6lspfQCI@intel.com>
References: <20231023203629.198109-1-contact@emersion.fr>
 <20231024103604.6dd7f6d5@eldfell>
 <TJceGIK3ZUXu0BwrhZUQIJhVtnuTayrPRLcg_KGuxE91o9OPfqxduzZljtreq-z48_1FGMy1z6qppi9UleSqx_hIMJ4GK_CCGBPiyRKkCwM=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TJceGIK3ZUXu0BwrhZUQIJhVtnuTayrPRLcg_KGuxE91o9OPfqxduzZljtreq-z48_1FGMy1z6qppi9UleSqx_hIMJ4GK_CCGBPiyRKkCwM=@emersion.fr>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 09:03:22AM +0000, Simon Ser wrote:
> On Tuesday, October 24th, 2023 at 09:36, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> > Are DP MST port numbers guaranteed to be tied to the physical hardware
> > configuration (e.g. how cables are connected) and therefore stable
> > across reboots? What about stable across kernel upgrades?
> > 
> > If I knew that, I could perhaps manufacture a stable identifier in
> > userspace by replacing the parent connector ID with a stable connector
> > designator.
> 
> Hm, my assumption is that these are stable, but maybe that's also wrong?
> Ville, Dmitry, do you know whether the DP MST port numbers are
> guaranteed stable across reboots when retaining the exact same hardware
> configuration (not the software, maybe the user upgraded the kernel)?

I suspect in practice those should remain the same as long as the
topology didn't change, but I don't think there's anything in the
DP spec that actually guarantees that (eg. some branch device
could in theory reshuffle its port numbers on a whim).

But there is no stable identifier for the corresponding SST
connector anyway so I don't know what you would even do with
stable port numbers.

-- 
Ville Syrjälä
Intel
