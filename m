Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F57FD434
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A8E88E45;
	Wed, 29 Nov 2023 10:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 10:32:53 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78F88E45
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701253973; x=1732789973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PAI5mu2vOQLNfBq6uCf/1RnujVA0d7SiwZnOV/K8ThI=;
 b=C9p3Xxp4HggG8W7mMBIksIUI7bp7n1MwqTIDNoPWi5hws/cskYYy1b8H
 K6ndznknv7yeZyUkoWRbh79CehsKLsq9YRqRoiXK8cQk0016UYpS0R9yt
 iUAJA+qACOCMPiA21bsSQAFjA++zksNV+cfgK8LrWxTqW0Wk5WYQedEg1
 Pd68Crwsm+VkJGqHKKDoTpahHsJ93Fla1FaKbuyuFTPpWIubmdx2HyTPs
 SSGQqxPujPcJzaOpqbXTxjg9dkubfS3y/I+tzASm4AYi0fZ3nXfG4e904
 +2uB5NBJa5wqLblbnVi41mx4yVqtw9QRNXasxoAphA9KGw3qQPSaFU25m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="121912"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="121912"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 02:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762269751"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="762269751"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 29 Nov 2023 02:25:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 Nov 2023 12:25:37 +0200
Date: Wed, 29 Nov 2023 12:25:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <ZWcRoTJ9VgOqZ3ts@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com> <20231129121259.47746996@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129121259.47746996@eldfell>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 12:12:59PM +0200, Pekka Paalanen wrote:
> On Tue, 28 Nov 2023 15:49:08 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > Should we perhaps start to use the (arguably hideous)
> >  - void f(struct foo *bar)
> >  + void f(struct foo bar[static 1])
> > syntax to tell the compiler we don't accept NULL pointers?
> > 
> > Hmm. Apparently that has the same problem as using any
> > other kind of array syntax in the prototype. That is,
> > the compiler demands to know the definition of 'struct foo'
> > even though we're passing in effectively a pointer. Sigh.
> 
> 
> __attribute__((nonnull)) ?

I guess that would work, though the syntax is horrible when
you need to flag specific arguments.

-- 
Ville Syrjälä
Intel
