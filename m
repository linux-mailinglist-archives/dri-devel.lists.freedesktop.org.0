Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285BA1C6A4C
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C95889067;
	Wed,  6 May 2020 07:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96C89067
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:45:01 +0000 (UTC)
IronPort-SDR: 6ePObQok+Tm63qDi/x9PHfd2VO0cYKVh1FRG8aBFlH1qPY6rOzpXcnOYoXk464khgngyva4FRG
 b8Xo7lh7uoOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 00:45:00 -0700
IronPort-SDR: mDj2WO1kxPbv3e0VtVZ/7eRl79oLBn0GxmMvFLGfcqcvF1wBHFc7Pprx1C0hUUw5qLjtb8qRFw
 myC9RzFcpEMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="304724587"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 06 May 2020 00:44:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 May 2020 10:44:57 +0300
Date: Wed, 6 May 2020 10:44:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Artem Mygaiev <joculator@gmail.com>
Subject: Re: Question about sRGB framebuffer support
Message-ID: <20200506074457.GK6112@intel.com>
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 01:24:16PM +0300, Artem Mygaiev wrote:
> Hello all
> =

> I am currently working on DRM/KMS driver for Fresco Logic FL2000 USB disp=
lay
> controller [1]. I have already implemented a POC driver [2] which is work=
ing for
> me, although there are still plenty of things to improve or fix, of cours=
e.
> =

> So far I have one thing that I somehow cannot find in DRM/KMS documentati=
on or
> existing drivers: how to tell the system that HW expects sRGB (i.e. non-l=
inear)
> color encoding in framebuffers? This is a HW limitation that I cannot inf=
luence
> by configuration.

Does it do something to process the data that requires linearization
or why does it care about the gamma applied to the data? In a typical
use case the data is just passed through unless the user asks otherwise,
so it doesn't matter much what gamma was used. Though most displays
probably expect something resembling sRGB gamma by default, so that's
presumably what most things generate, and images/videos/etc. pretty
much always have gamma already applied when they are produced.

> =

> Any pointers are greatly appreciated.
> =

> [1] www.frescologic.com/product/single/fl2000
> [2] https://github.com/klogg/fl2000_drm
> =

> Best regards,
>  -- Artem
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
