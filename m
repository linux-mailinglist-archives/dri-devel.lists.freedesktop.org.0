Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB9873A32
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1F811326C;
	Wed,  6 Mar 2024 15:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="le/G77he";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118C11326C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737618; x=1741273618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NkW0kjqnGBo5wFggNC6XMC1hc0EuI58azaDi+ScyGKk=;
 b=le/G77heZ2Z+nHB46j4uQozOhKAorE/GbZq8ORyb11rUGIGFmeJfyqXk
 UqKk2EhjKZSRegqIDR9PbooQJXCS0xmCKH2qKqncX4KpvbxaAAXcKp6Y+
 4xmtGRYrp/yLRHmlh6o3SWhws3nkRSXXAu2G2O+1V/u3oIe5uiW089N6h
 ubHEJ0v5oxckU8ua1mDQ2FXgRGzQMMKFhfbzCKcJ+1KHP6+cPGoCq/0vp
 JijR+R7IlBtQOitwlpyn4l4k82zyhQkNayosJHLYQGmUWRECKWk+bbdt6
 IoviZqnlG8n1i2qYdtQPM75N5MRuzotgPEOv/Zt9ehjd/xnWEBC6hc59K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15008373"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="15008373"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="827774338"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="827774338"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 06 Mar 2024 07:06:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Mar 2024 17:06:51 +0200
Date: Wed, 6 Mar 2024 17:06:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
Message-ID: <ZeiGi4l1lL_fYJ69@intel.com>
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
 <CAF6AEGs2zCP1SWPzxz4v2CU--yyEsN0+PS3dKM1nOuGyVkCpLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs2zCP1SWPzxz4v2CU--yyEsN0+PS3dKM1nOuGyVkCpLg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 06, 2024 at 06:49:15AM -0800, Rob Clark wrote:
> On Wed, Mar 6, 2024 at 4:18 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi,
> >
> > sorry that I did not see the patch before.
> >
> > Am 27.02.24 um 23:19 schrieb Douglas Anderson:
> > > Even though the UDL driver converts to RGB565 internally (see
> > > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> > > compatibility. Let's add ARGB8888 to that list.
> >
> > We had a heated discussion about the emulation of color formats. It was
> > decided that XRGB8888 is the only format to support; and that's only
> > because legacy userspace sometimes expects it. Adding other formats to
> > the list should not be done easily.
> 
> OTOH it is fixing a kernel change that broke userspace
> 
> > >
> > > This makes UDL devices work on ChromeOS again after commit
> > > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> > > commit things were "working" because we'd silently treat the ARGB8888
> > > that ChromeOS wanted as XRGB8888.
> >
> > This problem has been caused by userspace. Why can it not be fixed there?
> >
> > And udl is just one driver. Any other driver without ARGB8888, such as
> > simpledrm or ofdrm, would be affected. Do these work?
> 
> Probably any driver where ARGB8888 is equivalent to XRGB8888 (ie.
> single primary plane, etc) should advertise both.

To me that seemes likely to trick userspace developers into
assuming that ARGB is always available, and then when they
finally try on hardware that doesn't have ARGB it'll just
fail miserably.

-- 
Ville Syrjälä
Intel
