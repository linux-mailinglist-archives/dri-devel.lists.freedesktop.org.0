Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5F7FBBD6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0610E532;
	Tue, 28 Nov 2023 13:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611010E532
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701179375; x=1732715375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ho8ya67y0bcAC8iRE41B+MB3YSCUZNByqFAIWF4TZg8=;
 b=bLUBN1mZZou5l2DpSwqd76IRKi9lCnF/q03rmow5bzk4VnOvGAomiCuf
 ZsGChg6ngoHVcKaUurgXNNY5PASkeGIz+vtbaSpPXeS/BSsmGiDcXyQG/
 4T8WQjacTQKvvxdzGeFJQ5MX5tIaprmUeh3G5g7LNQGlwZu0+Y3Eja4x3
 NsyxUasf3QMTOzg0yn0TVzFhGLnwy5aG5Wo2kk8MGlXnMgAgbANxbzLPj
 B40sIc9zCXFje6wMt/gDeN4bFU/luJ48jhUW6a464PtZXuHu8h876iloi
 G7sQhCSwmPWU2i0xsCkZiq0ZNEXtvu9twpdU69xeGToxLEljCgJaIaUJq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392676344"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="392676344"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 05:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761938211"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="761938211"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 28 Nov 2023 05:49:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 15:49:08 +0200
Date: Tue, 28 Nov 2023 15:49:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <ZWXv1Oi_sH0BRWao@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
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
Cc: Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> Hi Jani,
> 
> On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > All the drm_connector_init variants take at least a pointer to the
> > > device, connector and hooks implementation.
> > >
> > > However, none of them check their value before dereferencing those
> > > pointers which can lead to a NULL-pointer dereference if the author
> > > isn't careful.
> > 
> > Arguably oopsing on the spot is preferrable when this can't be caused by
> > user input. It's always a mistake that should be caught early during
> > development.
> > 
> > Not everyone checks the return value of drm_connector_init and friends,
> > so those cases will lead to more mysterious bugs later. And probably
> > oopses as well.
> 
> So maybe we can do both then, with something like
> 
> if (WARN_ON(!dev))
>    return -EINVAL
> 
> if (drm_WARN_ON(dev, !connector || !funcs))
>    return -EINVAL;
> 
> I'd still like to check for this, so we can have proper testing, and we
> already check for those pointers in some places (like funcs in
> drm_connector_init), so if we don't cover everything we're inconsistent.

People will invariably cargo-cult this kind of stuff absolutely
everywhere and then all your functions will have tons of dead
code to check their arguments. I'd prefer not to go there
usually.

Should we perhaps start to use the (arguably hideous)
 - void f(struct foo *bar)
 + void f(struct foo bar[static 1])
syntax to tell the compiler we don't accept NULL pointers?

Hmm. Apparently that has the same problem as using any
other kind of array syntax in the prototype. That is,
the compiler demands to know the definition of 'struct foo'
even though we're passing in effectively a pointer. Sigh.

-- 
Ville Syrjälä
Intel
