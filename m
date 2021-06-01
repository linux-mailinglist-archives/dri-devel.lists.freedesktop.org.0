Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78521396DD9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 09:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56E89FCE;
	Tue,  1 Jun 2021 07:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486889FCE;
 Tue,  1 Jun 2021 07:19:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s6so15998419edu.10;
 Tue, 01 Jun 2021 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aMuf6Zwvp9YE1uES5A5ymwviB/xP/Pc8uTaTSOxuvrs=;
 b=FAAXlQjKM8H1PukR8U+yUhU1LuCMnIY0FZ+b11BqqiQiKryFEA71318JnamPNIDf72
 XSPwR+MIF47K218IhIWX/xoolr/NIuC5geEp3L+k/SO7n0l4tmJKowjygcCby8Bqo6Bv
 3vwd8oLbcypiBqQr/ngCql3r6v4IEO/81Vok30X8z6lGSz8aZ8dg0xT2zFZv1IwqbT68
 qedl1jy29LWOR2Zo5wk6TpbNNL+2sbkDy+zcJfzxrx69ym//T82rl6V+r0TSxuJO6wEa
 Fq24FhF4VkUi5ahfrKuDhx0EPIxS1DUluuojcQFlXfmZY2YMrbFL8bKwwJViqPa9aApg
 /QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aMuf6Zwvp9YE1uES5A5ymwviB/xP/Pc8uTaTSOxuvrs=;
 b=Tga5jT9S1610NRLzmSQ/vDauBcRxYb1BcnNO2iIMxae8TKkdkksZAFcDvricIq9GTA
 U30amNv5C3vzaXp6ve95Bk0g3X3wYPMT0DvQuKv6H1IuEDS1k0MX/aSsBj6yaLuf/W+D
 hJzG9AIuwfG1N2TEBHmtuv7ZMN9fIcLLiquRc5lIPUP29X2fJFAIQ9eM7X3hgTTZ5ffu
 d7uajO2jIOFenDp3hQeG1WaRSzzC7MG0iS+lYjQAVMxJvUOBrjykvqOBz85nI8tVFe9j
 0QicDCPb5YbW2a9mdi3F6Eocf4BiA3zrtotjDiYQvZQmp8OUQn+2PqjbTOvscxRv8P2j
 k1LQ==
X-Gm-Message-State: AOAM530fOJs5xCv2iEtWspjH4e4z5yoioM+Lx72b8xpLntLNYqb+6tb7
 GGJZtyWOJZ3QgeMipCpMmBk81GxWX5niIjZYFqI=
X-Google-Smtp-Source: ABdhPJw07s13De4fMTEbLWOPPhXYF72ptxy3HLqB6iX0ULdMVX84nZGRgfFUDn0OkU3AuDwHAFl5aVjr9YfjR4D8yzg=
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr30782027eds.78.1622531998562; 
 Tue, 01 Jun 2021 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
 <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
 <CAPM=9ty84uK-gT3uXZXGOEFno11SBRUh=btXb-B7OYUmnGiRoQ@mail.gmail.com>
 <YK9uwBAvUD+2NYlL@phenom.ffwll.local>
In-Reply-To: <YK9uwBAvUD+2NYlL@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Jun 2021 17:19:47 +1000
Message-ID: <CAPM=9txR2ZDpLX1bwzgqq+f9nsiP0feWB+1=tpto2zf_qPKu=Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 May 2021 at 20:04, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 26, 2021 at 10:35:49AM +1000, Dave Airlie wrote:
> > On Wed, 12 May 2021 at 03:05, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Tue, May 11, 2021 at 10:31:39AM +0200, Zbigniew Kempczy=C5=84ski w=
rote:
> > > > We have established previously we stop using relocations starting
> > > > from gen12 platforms with Tigerlake as an exception. Unfortunately
> > > > we need extend transition period and support relocations for two
> > > > other igfx platforms - Rocketlake and Alderlake.
> > > >
> > > > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@inte=
l.com>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > >
> > > So the annoying thing here is that now media-driver is fixed:
> > >
> > > https://github.com/intel/media-driver/commit/144020c37770083974bedf59=
902b70b8f444c799
> > >
> > > Which means igt is really the only thing left.
> > >
> > > Dave, is this still ok for an acked exception, or is this now leaning
> > > towards "just fix igt"?
> >
> > Oh that isn't great is it, I had thought it was the media-driver,
> > keeping a big uAPI like this open just for the test code seems a bit
> > silly. I get the tests are testing more than just relocs, but it's a
> > pretty big interface to leave lying around if we can avoid it.
>
> So since we need to do the work anyway for DG1+ what about some interim
> hack? Currently ADL still has the require_force_probe flag set. We could
> re-enable relocations just for ADL, only while this flag is set. This
> gives us a bunch of wiggle room, unblocks everything else (CI is a bit on
> fire right now due to this and practially unuseable on ADL gem areay) and
> we'll still make sure that when ADL is all done we wont expose relocation=
s
> just for igt.
>
> Thoughts?

I can handle that as a compromise, though I'd not want to block ADL
getting out of alpha over some IGT that needs porting.

Dave.

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
