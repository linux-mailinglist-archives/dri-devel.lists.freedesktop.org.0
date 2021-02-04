Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F630FF26
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1286EE6E;
	Thu,  4 Feb 2021 21:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043A96EE6E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:17:32 +0000 (UTC)
Date: Thu, 04 Feb 2021 21:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612473450;
 bh=aZR1Cr4mUUPd+bdpXXmH0tFntE3kW5R629//25Qz7mk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=vU+i8uWaKW00VI4GG7ouXD9Y9seaTS0NU0ExM1IMC3sTIuE6iWTY9798SRQS9nMdt
 RUj95skYpoKsWAoSgDy24edLY6UCTm5R8nAkvpRn6xTXZFBGjtDoxfp1gdmS/5Sp7b
 mTpc3p6PXp1tfsdRlCd2jl5kqheBTnEa850XZshV+fWTuSBKuAvns1xzK67ZGP7tsJ
 MBS/gZPHiYk9SJDyFWzBqYY0hltyCV5PuhzdolKuyHy1glbW4qE/t+A5xSWSx1vZhS
 L7Tk4/wO5isG+OixmrC3ZjueoAvaSarUtRyRhrCwcuRJzPefuoC5DkSD9VTblmxrQj
 n1nQ0/xlbTz7Q==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Message-ID: <fCc3Nv4tnc7eTeF2EWEJN5e2mTpTMuhnvitj4GdiFemwpi7_IJvIqDAQpF_5HG9D6jb5jLat0xgpsRbYjMtdrYNqZvPCTCmBt69UbUR19dI=@emersion.fr>
In-Reply-To: <CABjik9dxwG7vHbGiREVfg4ZQodbc4qkTctbAV17S5wX263CUYA@mail.gmail.com>
References: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
 <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
 <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
 <CACvgo53wwtkr-DeCMsnKRpjsBO=GhTVWBODC=32-6sNxgaQwLQ@mail.gmail.com>
 <CABjik9dxwG7vHbGiREVfg4ZQodbc4qkTctbAV17S5wX263CUYA@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 4th, 2021 at 10:15 PM, James Park <james.park@lagfreegames.com> wrote:

> No, I haven't pushed anything with DRM_BASIC_TYPES_DEFINED yet. I was
> just illustrating since DRM_BASIC_TYPES_H would not be a great
> choice for a name in this case.

This approach looks fine to me too. I'd R-b it.

Thanks for your patience.

> I'll send a patch tonight (USA time). I have to remember how to do the
> git-send-email dance.

https://git-send-email.io/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
