Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD37D51F4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 15:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683610E3BF;
	Tue, 24 Oct 2023 13:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75B410E010;
 Tue, 24 Oct 2023 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698154669; x=1729690669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VJ94bv8/Jxv1ScWtIceUR8PmAGQcPkcmZNbpbHKZbBk=;
 b=BmQXkxYUS8erTQkvbdvinn+zhRKgg0kmHQEqVD3cJwWISl68Gw7ebvZS
 kgux9AgkwmACsOkPtyOujdOXmhPoN58J9p7BLAeDoPnrdyFZE+HKUXQQQ
 VzKd92XxBJ1mJBiUtwNYrGyoBYC6kKhPQgvCLDUqeKWzA6MC7YbjIvuHz
 VksbzHXSFHBt+w+CYuRwcMc9tDFvNzVp6wJR1hba9wWzZCNzF46HGvMs2
 B2TRYZdINB4yG06jrz7HLm060QTS3WbIq0daqFm6qT88qRCyH+TspgH/k
 WyVWAvTZJpKSFXghe8EE7yHWpIFSkjj6Sg9ccDImv9FNxM4Zwl9EjIc8L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="385949789"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="385949789"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 06:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="875070414"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="875070414"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga002.fm.intel.com with SMTP; 24 Oct 2023 06:37:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Oct 2023 16:37:45 +0300
Date: Tue, 24 Oct 2023 16:37:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <ZTfIqVPOtnSRleK_@intel.com>
References: <20231023203629.198109-1-contact@emersion.fr>
 <20231024103604.6dd7f6d5@eldfell>
 <TJceGIK3ZUXu0BwrhZUQIJhVtnuTayrPRLcg_KGuxE91o9OPfqxduzZljtreq-z48_1FGMy1z6qppi9UleSqx_hIMJ4GK_CCGBPiyRKkCwM=@emersion.fr>
 <ZTfAn2al6lspfQCI@intel.com> <20231024161234.4b35230b@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231024161234.4b35230b@eldfell>
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
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 04:12:34PM +0300, Pekka Paalanen wrote:
> On Tue, 24 Oct 2023 16:03:27 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Oct 24, 2023 at 09:03:22AM +0000, Simon Ser wrote:
> > > On Tuesday, October 24th, 2023 at 09:36, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >   
> > > > Are DP MST port numbers guaranteed to be tied to the physical hardware
> > > > configuration (e.g. how cables are connected) and therefore stable
> > > > across reboots? What about stable across kernel upgrades?
> > > > 
> > > > If I knew that, I could perhaps manufacture a stable identifier in
> > > > userspace by replacing the parent connector ID with a stable connector
> > > > designator.  
> > > 
> > > Hm, my assumption is that these are stable, but maybe that's also wrong?
> > > Ville, Dmitry, do you know whether the DP MST port numbers are
> > > guaranteed stable across reboots when retaining the exact same hardware
> > > configuration (not the software, maybe the user upgraded the kernel)?  
> > 
> > I suspect in practice those should remain the same as long as the
> > topology didn't change, but I don't think there's anything in the
> > DP spec that actually guarantees that (eg. some branch device
> > could in theory reshuffle its port numbers on a whim).
> > 
> > But there is no stable identifier for the corresponding SST
> > connector anyway so I don't know what you would even do with
> > stable port numbers.
> 
> You mean the index in the array of connectors exposed to userspace is
> not stable either for the root DP connector?

It just depends on the order the driver probes the outputs, which
could change when the code changes (or perhaps even across reboots
with the same kernel due to randomness in deferred probe?).

> 
> KMS device bus path + connector array index for hardwired connectors is
> what I've been imagining as stable enough for all end users.

I once posted a patch to add a path property to all connector
which could give you a more stable identifier. But IIRC the
discussion didn't really end in any kind of useful conclusion.

Seems to be this one:
https://lore.kernel.org/all/20190613184335.7970-1-ville.syrjala@linux.intel.com/

-- 
Ville Syrjälä
Intel
