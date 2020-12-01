Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776072C99F9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D9C89F3C;
	Tue,  1 Dec 2020 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA46489F3C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 08:55:06 +0000 (UTC)
Date: Tue, 01 Dec 2020 08:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606812903;
 bh=dkUTBoGl4Y4qVHun3WADOkpI46mSxrBXpvE+2McK310=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=CWM0wu0+qSPN9xaCyOD33Q/P65K9rK0nyqTgiz/rrzSZPJ4N9uDtvjB84cVTw8NVl
 w+K1INzGkxeBkF66KGPFzISy0/m2HnMwl3v2NKPckTSoE60vlS/3yacjYnX8jC6OS/
 iZMnTRVFnRMHDf8AD4okJessFnVGNX3j4w/4KiiB6wEoj02pvEfUk2C8d4Pc5V1c03
 2GKYr7n84V/va3tqEuARRSeOhpcarOZrGFuRSCrJFdFZsaHQFOcd4Kzvs+xbRA+UhU
 tAQ19pzBPKah7HTxeTIh4WAvEoKe3UA2hb7ldSGQtsJLorg8NkSikU9e2zyqY2RfYp
 wNcIYDBnnsCEA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <t7UrHn3uz2sK-zJs0XETBxEzbbDg9CxhYOXvFGMktr4WUHCfFwNXFPrYx7iPprvU2DrOhbMnJZYFaXG1wV89ptlremn15diuBLXtVrvV2TM=@emersion.fr>
In-Reply-To: <20201201104659.4c250d7b@eldfell>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
 <20201130131326.7ac87605@eldfell>
 <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
 <20201130132446.79fffe6e@eldfell>
 <mIkeaGvvD78FCgaiPQol6Kurxl1_qb3W5WU1hCf6KFNt0JkSRkN71TbNEy9wC4dLyWHW6dPFynuBY4Nw4xNNM6f2gLSxB0d3Hc87xErbL-o=@emersion.fr>
 <20201201104659.4c250d7b@eldfell>
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

On Tuesday, December 1, 2020 9:46 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 30 Nov 2020 12:20:08 +0000
> Simon Ser contact@emersion.fr wrote:
>
> > CC Daniel and Ville
> > On Monday, November 30, 2020 12:24 PM, Pekka Paalanen ppaalanen@gmail.com wrote:
> >
> > > > > Please record the justitication for that patch in its commit message.
> > > > > "Can't" does not explain anything.
> > > >
> > > > Yeah, sorry about that. I'm just annoyed by all of this get_connector
> > > > uAPI, so I don't really want to spend a lot of time documenting why
> > > > it's so gross.
> > >
> > > But I still don't understand why the kernel cannot be fixed to do the
> > > right thing that most of us assumed it should be doing: probe
> > > automatically so userspace never needs to.
> >
> > My understanding is that it could maybe be implemented this way, but
> > that it's not the way it works right now. So someone would need to go
> > through all DRM drivers and implement the better behavior, then could
> > restore this doc section.
>
> Right, so that would be really good to explain in the commit message.

v2 should take care of it. Let me know if you think the new commit message can
be improved.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
