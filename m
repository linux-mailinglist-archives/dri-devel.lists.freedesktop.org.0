Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D75392B66
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770036EC68;
	Thu, 27 May 2021 10:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E56EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:04:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i13so158477edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IOyLRFg3lB9wz2+L2BQWMrwyK2pliXsl09aBznEMw5k=;
 b=TA5iRO5GvBA6GLpnCULRhknJ60fDVzrO3gLyeNdDAWtUpoP4AP68PLts0y/s4MUiR/
 6nDEAqJt4jDwpYcy6sbqZGhjlxZT2cVuekBrAuIsL67UyeizA4hpAYViByxMRcWBSqWB
 HZjPsmwQPZlL5+YFrbm7issCHLrZdYISvIdsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IOyLRFg3lB9wz2+L2BQWMrwyK2pliXsl09aBznEMw5k=;
 b=oTwvyPCG3fbOAcve37sihaXjHsVQWmd7zBuaZT/MJ+9V9aOmohkhMjP8GVlKnqFgx4
 Vn0g/jX8WeXJel4jxLv9JA19/dkjSi2FsJL1c2zussU+EymUlhl/HpqpTAPEAnJ0YVjm
 0w753DaR68FtVjfQDVDtX3iQrvgVowafmskSIDTGCz+ZkZGHWoTApKCaPpuhXCAlhQa8
 wmCr5KWzy1guEVWFI3EJIZFxd7IWaaB+jL5mYh414SK/7Jhp6Ax+F8FqbZqfgNfKAylI
 2zbYNoRQS3C2ZyVdLL6WPCStpUMa1dRNxKN9hHEQ8DNOVszp4wPWui0JoIRPrwcK5y3J
 0L2Q==
X-Gm-Message-State: AOAM532GX2qtH+Wv/s4sPCrfNlGy3uzLgdVyQhK5x0b6VUT9wsTpFapL
 3zw8kseQ3hYMdzfS3GPeJ6FEMA==
X-Google-Smtp-Source: ABdhPJwR/k2x3+IPuYcak4pfgAu121CaitqyqAkbK/qAiq0+zdyHP+2rrScnFYquqSyJPtSQLPqmoQ==
X-Received: by 2002:aa7:ca0d:: with SMTP id y13mr3360640eds.307.1622109891014; 
 Thu, 27 May 2021 03:04:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hz10sm770574ejc.40.2021.05.27.03.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:04:50 -0700 (PDT)
Date: Thu, 27 May 2021 12:04:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
Message-ID: <YK9uwBAvUD+2NYlL@phenom.ffwll.local>
References: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
 <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
 <CAPM=9ty84uK-gT3uXZXGOEFno11SBRUh=btXb-B7OYUmnGiRoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9ty84uK-gT3uXZXGOEFno11SBRUh=btXb-B7OYUmnGiRoQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 10:35:49AM +1000, Dave Airlie wrote:
> On Wed, 12 May 2021 at 03:05, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, May 11, 2021 at 10:31:39AM +0200, Zbigniew Kempczyński wrote:
> > > We have established previously we stop using relocations starting
> > > from gen12 platforms with Tigerlake as an exception. Unfortunately
> > > we need extend transition period and support relocations for two
> > > other igfx platforms - Rocketlake and Alderlake.
> > >
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> >
> > So the annoying thing here is that now media-driver is fixed:
> >
> > https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b70b8f444c799
> >
> > Which means igt is really the only thing left.
> >
> > Dave, is this still ok for an acked exception, or is this now leaning
> > towards "just fix igt"?
> 
> Oh that isn't great is it, I had thought it was the media-driver,
> keeping a big uAPI like this open just for the test code seems a bit
> silly. I get the tests are testing more than just relocs, but it's a
> pretty big interface to leave lying around if we can avoid it.

So since we need to do the work anyway for DG1+ what about some interim
hack? Currently ADL still has the require_force_probe flag set. We could
re-enable relocations just for ADL, only while this flag is set. This
gives us a bunch of wiggle room, unblocks everything else (CI is a bit on
fire right now due to this and practially unuseable on ADL gem areay) and
we'll still make sure that when ADL is all done we wont expose relocations
just for igt.

Thoughts?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
