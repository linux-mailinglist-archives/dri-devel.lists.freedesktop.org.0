Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDFA2C8402
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B66E463;
	Mon, 30 Nov 2020 12:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C7E6E463
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:20:20 +0000 (UTC)
Date: Mon, 30 Nov 2020 12:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606738817;
 bh=riJ0lZ+dyYlUqCTjBcCOqPXU0BeyuXNWFkmiOQVIBig=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=VW0Ndk3/wWpD52F8x31gtWgMoalRO7t097h8oTVHkIoNVD4qjQCewWzZhBBba6wPL
 po8m69kZ+zsH50twsTHiw90XgCHWoGJFeOkdRy3eFgTiadKCKHCFVG3gc0XXP+FQOZ
 SW09KJD1Ox05HswoAoODu+DvYu6rcDnQri+bLHNFaKCjOpmNuplNNExDV1VT1XDoVs
 H9v9w7/Jm2Hst4v3JJYjpB4lOjag0i5AiyUCXOtnMDkCQnR6WCex+UL5Kr0b9+Kah+
 I421HE50BcmADLsTA3yqhoGjClZe6BmumGM9PrYIpAD9saDf6g9ZLHIszAMWKaTHjA
 qjRDq/hSLuuxA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <mIkeaGvvD78FCgaiPQol6Kurxl1_qb3W5WU1hCf6KFNt0JkSRkN71TbNEy9wC4dLyWHW6dPFynuBY4Nw4xNNM6f2gLSxB0d3Hc87xErbL-o=@emersion.fr>
In-Reply-To: <20201130132446.79fffe6e@eldfell>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
 <20201130131326.7ac87605@eldfell>
 <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
 <20201130132446.79fffe6e@eldfell>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Daniel and Ville

On Monday, November 30, 2020 12:24 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> > > Please record the justitication for that patch in its commit message.
> > > "Can't" does not explain anything.
> >
> > Yeah, sorry about that. I'm just annoyed by all of this get_connector
> > uAPI, so I don't really want to spend a lot of time documenting why
> > it's so gross.
>
> But I still don't understand why the kernel cannot be fixed to do the
> right thing that most of us assumed it should be doing: probe
> automatically so userspace never needs to.

My understanding is that it could maybe be implemented this way, but
that it's not the way it works right now. So someone would need to go
through all DRM drivers and implement the better behavior, then could
restore this doc section.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
