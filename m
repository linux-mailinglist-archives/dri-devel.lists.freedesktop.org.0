Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F773598B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7178410E215;
	Mon, 19 Jun 2023 14:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0AC10E214
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687185053; x=1718721053;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wewI2uGHU+TorSGLos43+rAi3luN0XAjXU6V+8oFNmo=;
 b=VfP4aZ0N2WvhLgZc70bkVeeR2cNYRX3CELWvBkC9QuMY2RF4wMf1lh5Z
 dW3yUgtl+pmHDl+RurlB21qKRQnQGUFQurFoZQOIjOgmoEWfnhwoJacgO
 pB0AftOzWjVn1tY9ro94WlrCDKy6969h3SwkU4lcDt8FGbZ8S/Ry8r7Hr
 IV2vn9ePtFkH6D6J+ghH2t1962eza2IiTHbO9QvVswt58BuOKTJW9Xn6n
 0x+NfSGcGBjRTtA9Q/LjgIC1F/0NucDqaoVTfQzx2YRQLisdnkdCe+sOa
 OggDNAVIgQ4rvii7mUzN9qrQy1bik1qc671XgbrWZMGL4FWOHZqWoXYK4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349367959"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349367959"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 07:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="707911572"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="707911572"
Received: from fuhrberg-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.37.35])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 07:30:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard
 <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
In-Reply-To: <20230619135849.crbbeqsytla7upbw@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
 <20230619135849.crbbeqsytla7upbw@pengutronix.de>
Date: Mon, 19 Jun 2023 17:30:47 +0300
Message-ID: <87bkhbjzhk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[Trimmed the recipients considerably; there's really no need to keep
spamming so many people about this.]

On Mon, 19 Jun 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=
 wrote:
> Not knowing dim I think there is a simple(?) technical solution here: It
> only has to make sure that after the pull request from drm-misc to drm
> was sent, no new patches are added to the branch that is merged in next.

The drm-misc-next and drm-intel-next branches are *always* open to
patches, regardless of the merge window. That's not going to change. We
never tell people "this is not the right time for your patches" due to
the merge window, like some subsystems do.

We have separate branches specifically for feeding to linux-next and
they serve no other purpose. The tooling tries to push the right thing
there, depending on the last pull request cutoff, so that linux-next
reflects what it's supposed to, but obviously the tooling doesn't have
the smarts to figure out when the last pull request is going to be
sent. (Really, humans don't always get that right either, because
predicting the future is kind of hard.)

Looks like you hit an issue, and although nobody else has complained
about this one over the 9 years we've been using dim, it royally
confused you. Sorry about that. There's always room for improvement in
the tooling, in the process, and in the human communication.

BR,
Jani.



--=20
Jani Nikula, Intel Open Source Graphics Center
