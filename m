Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385952D0D5A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 10:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91E89E2A;
	Mon,  7 Dec 2020 09:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8089E2A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:49:04 +0000 (UTC)
Date: Mon, 07 Dec 2020 09:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607334542;
 bh=hdSmV1WIoqjivE50i995vDlNlpZMVX2ni4YhS4kZSXE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=e04Ks+U6TXyDed6uJkr+ap56X1HgbjFBSiiP+EhsIixSYGKIgGyNav9A9A53c8DzJ
 i9y+c3gZntgdKSMetJztJvjc8zRSemcYOwDxaN/yEyZXVdKsLbVKsl8BIFA95TVHcJ
 sF3XaGQSRL7hpReO3v0CF2k1fqX77RUCFMUirKawOoWtMGCUwozNI5t+6Z3O18vGHI
 wKK4+VjoXyPr7K4M11bVnG/gTjbqYkRNQEq5/ecl1Xsyujkm67gWKB6+vBXVf9nUiN
 kiU4X+v5RyNI9q+ZGfTvUuZURQ9iHsgqqwzi8VgNh/3GrmNkxgGdB9aef1MctemZQ+
 JWclCdkHVN4Mg==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <AycyJAPt8CKsoAYi4sBlgIeDydMx1kGHulk0qEtAG7WbEfqkdYuc8FCmn5a7qu8YFjG3MfEYn-SZaA52PBy-75aBFZOcAkP1ld5V6LVD7GI=@emersion.fr>
In-Reply-To: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
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

On Monday, December 7th, 2020 at 9:57 AM, James Park <james.park@lagfreegames.com> wrote:

> I could adjust the block to look like this:
>
> #ifdef DRM_FOURCC_STANDALONE
> #if defined(__linux__)
> #include <linux/types.h>
> #else
> #include <stdint.h>
> typedef uint32_t __u32;
> typedef uint64_t __u64;
> #endif
> #else
> #include "drm.h"
> #endif

This approach still breaks on BSDs when DRM_FOURCC_STANDALONE is defined and
drm.h is included afterwards.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
