Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20E2D0DB6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0577C89EA3;
	Mon,  7 Dec 2020 10:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8089EA3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:02:42 +0000 (UTC)
Date: Mon, 07 Dec 2020 10:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607335361;
 bh=VfDoRBW78/khTFVHgsmwYfTGGjJ4a0n7h2nMeWXCgV4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=L8JlCA1IksnHOFj7aJBaIWehZilpWsNoKcS0IjiONp8A7yCQGGmvLfP2R6xB4wN8+
 PtXwkkI9c92yv7tOKoOcak81Met0lalf91FmbRSbGftUk0HoNZ6I/LEWuHmeLsjY50
 qrPcpGSz3cDdnjKy1PnFW4Rq35r2Bv8MXUgPq+0f/1GagWGcGlBIMKSIyZ2lXDIRZB
 AD3MBkHdj73rlvSQFt/TshCOFmXwxzeiUUXMDsx1lA4U8QbcmnDguP6ubVGYPK5nJf
 qTAvFgTrlT2SMonoRUoFb78tTVFQqs13ySWTis92v8+cUxjugIEAR1EpdAo5VQMWFe
 SrKx+AlBaF55A==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <WkfFUG5sg6NZpIkXWzPT0ss3yKOdjhLBusBnhCReGLGgM1rRO8JpXjutMFODkq54jUnxUnHuJH8I6p23wmWeHAgt-hRvEjrVOlEmwuW-LIU=@emersion.fr>
In-Reply-To: <CABjik9ctkMs4b5M+EaAFnr7byqn_UvRUpgh8-ZbCGHO58pE0aA@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <AycyJAPt8CKsoAYi4sBlgIeDydMx1kGHulk0qEtAG7WbEfqkdYuc8FCmn5a7qu8YFjG3MfEYn-SZaA52PBy-75aBFZOcAkP1ld5V6LVD7GI=@emersion.fr>
 <CABjik9ctkMs4b5M+EaAFnr7byqn_UvRUpgh8-ZbCGHO58pE0aA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 11:00 AM, James Park <james.park@lagfreegames.com> wrote:

> Not to make too big a deal of it, but the idea was that if you went
> out of your way to define DRM_FOURCC_STANDALONE in your code base,
> that you would also go through the pain of removing drm.h includes
> elsewhere. It's too annoying of an implication to
> document/communicate, so I'm happier with the other
> DRM_FOURCC_STANDALONE solution that pulls the basic types into a
> common header.

In my compositors I'd like to globally define DRM_FOURCC_STANDALONE
(to make sure I don't miss any #define) but I still may include drm.h
in the same files as well.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
