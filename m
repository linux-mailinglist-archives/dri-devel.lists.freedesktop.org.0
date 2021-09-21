Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5D413ABA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 21:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323F6E94F;
	Tue, 21 Sep 2021 19:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833246E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 19:29:48 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mSlSZ-0004Qy-Ih; Tue, 21 Sep 2021 21:29:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, hjc@rock-chips.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be, airlied@linux.ie,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused
 warning
Date: Tue, 21 Sep 2021 21:29:41 +0200
Message-ID: <2662894.r5Zzv63rEP@diego>
In-Reply-To: <mhng-4c5264da-5502-4947-b32d-e9008a79ee90@palmerdabbelt-glaptop>
References: <mhng-4c5264da-5502-4947-b32d-e9008a79ee90@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi,

Am Dienstag, 21. September 2021, 17:04:10 CEST schrieb Palmer Dabbelt:
> On Tue, 21 Sep 2021 02:12:17 PDT (-0700), heiko@sntech.de wrote:
> > On Fri, 10 Sep 2021 20:43:18 -0700, Palmer Dabbelt wrote:
> >> cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
> >> unused function warning is triggered undner !PM_SLEEP.  This marks the
> >> function as possibly unused, to avoid triggering compiler warnings.
> >
> > Applied, thanks!
> >
> > [1/1] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
> >       commit: f7c57a4566115657c16fd6603b6ef8a21bae5194
> 
> I'm not quite sure where that lives, but is it applied on top of 
> something or is it merged from the tag?  Like I said a bit below this in 
> the original patch, this has started to break the build for me and I'd 
> like to pull it in as soon as possible.

The patch now lives here:
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=f7c57a4566115657c16fd6603b6ef8a21bae5194

This is the drm-misc tree, with the patch living in the drm-misc-fixes
branch, which targets the current rc-kernels.

drm-misc-* moves into the core drm tree and from there on to Linus.


Hope that helps
Heiko



