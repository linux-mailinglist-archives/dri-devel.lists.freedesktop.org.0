Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3F6A5907
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD810E170;
	Tue, 28 Feb 2023 12:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396FC10E170
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677587420; x=1709123420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rc1OmP9wMmY5+dn33znnHM6RbUbQmaFHCNu6e7Z4he4=;
 b=fgooX9gaD+SqWQua8BDwzP4Z4ev2iVyXQsI00sHPwDf4IopBhsUZVKxH
 BCY8I/4Ip9YjW8aHO/pUvxoaTthAOiGw5G3vkhUlX18SWzFuGjXpLJ5Ay
 uTazs6J1l8tCSDgEvmMpn15X2F+0QgbdGwcw1ymTHsz8FHxhdbqkr8tmF
 0FTunJkf6xECXcuOZjCOK5O+bJnn3DF4BmZTal1Vj+O/oFjAkN4gs3Kd+
 SEtcR63ZxA8XWInmnFgMqNlKDfd44TOIJI8pbYS17RMkP27GculgxQJPP
 g/shPubhLA8de8PtA38D3/8ZheVywTReg8BCJrfYW7phhPKzukplq+IZg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334163542"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="334163542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706555434"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="706555434"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 28 Feb 2023 04:30:16 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 14:30:15 +0200
Date: Tue, 28 Feb 2023 14:30:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <Y/3z19IgLf7q/Ev5@intel.com>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell> <Y/3lcEq5y2SrUYyA@intel.com>
 <20230228142423.08213444@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228142423.08213444@eldfell>
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
Cc: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 02:24:23PM +0200, Pekka Paalanen wrote:
> On Tue, 28 Feb 2023 13:28:48 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Feb 28, 2023 at 12:12:22PM +0200, Pekka Paalanen wrote:
> 
> > > Oh! That would be really good to mention in the doc. Maybe even prefer
> > > plane props over this? Or is this for analog TV, and plane props for
> > > digital TV?  
> > 
> > Plane properties would be pointless for this. CRTC properties might
> > make sense. But what is more accurate kinda depends on the hardware
> > design.
> 
> I meant the existing plane properties CRTC_X,Y,W,H. They can already
> describe e.g. a primary plane that does not cover the whole CRTC area,
> which is essentially the same as margins, scaling included even.

Yeah that can work, assuming you have hardware that supports it.

-- 
Ville Syrjälä
Intel
