Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1563163
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245A898AA;
	Tue,  9 Jul 2019 07:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1944 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jul 2019 20:30:34 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDF689DB4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 20:30:34 +0000 (UTC)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hkZlv-0004Tq-9o; Mon, 08 Jul 2019 21:57:59 +0200
Date: Mon, 8 Jul 2019 21:57:58 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2] gpu/drm_memory: fix a few warnings
In-Reply-To: <1562614919.8510.9.camel@lca.pw>
Message-ID: <alpine.DEB.2.21.1907082150170.1961@nanos.tec.linutronix.de>
References: <1562609151-7283-1-git-send-email-cai@lca.pw>
 <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
 <1562614919.8510.9.camel@lca.pw>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-814371836-1562615879=:1961"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rfontana@redhat.com,
 Greg KH <gregkh@linuxfoundation.org>, joe@perches.com,
 linux-spdx@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-814371836-1562615879=:1961
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 8 Jul 2019, Qian Cai wrote:
> On Mon, 2019-07-08 at 15:21 -0400, Ilia Mirkin wrote:
> > > -/**
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > >   * \file drm_memory.c
> > >   * Memory management wrappers for DRM
> > >   *
> > > @@ -12,25 +13,6 @@
> > >   * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> > >   * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> > >   * All Rights Reserved.
> > > - *
> > > - * Permission is hereby granted, free of charge, to any person obtaining a
> > > - * copy of this software and associated documentation files (the
> > > "Software"),
> > > - * to deal in the Software without restriction, including without
> > > limitation
> > > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > - * and/or sell copies of the Software, and to permit persons to whom the
> > > - * Software is furnished to do so, subject to the following conditions:
> > > - *
> > > - * The above copyright notice and this permission notice (including the
> > > next
> > > - * paragraph) shall be included in all copies or substantial portions of
> > > the
> > > - * Software.
> > > - *
> > > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> > > OR
> > > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES
> > > OR
> > 
> > This talks about VA Linux Systems and/or its suppliers, while the MIT
> > licence talks about authors or copyright holders.

That's looks lika a valid substitution and does not change the meaning of
the license, AFAICT. Richard might have a differnt opinion though.
 
> > Are such transformations OK to just do?

Nope.

> From,
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Document
> ation/process/license-rules.rst
> 
> "The Linux kernel requires the precise SPDX identifier in all source files."

That's correct.
 
> That is the closest license I can think of.

Well, it's pretty much plain MIT, but you might have noticed:

 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.

So in this case, you need to talk to the copyright holder if he agrees to
remove the boiler plate language.

Adding the MIT SPDX identifier without touching the boiler plate is fine.

Thanks,

	tglx
--8323329-814371836-1562615879=:1961
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--8323329-814371836-1562615879=:1961--
