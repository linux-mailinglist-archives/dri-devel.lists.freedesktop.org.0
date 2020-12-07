Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F572D0D96
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 10:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414D189E65;
	Mon,  7 Dec 2020 09:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100A89E65
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:59:12 +0000 (UTC)
Date: Mon, 07 Dec 2020 09:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607335150;
 bh=EXd7Qmwbo9g9EM1n7UVmsL222pW21FRsz/VlS1Qa0lQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dDxmRwP4PPhSUUxgORM/7MWrvoZxOskjZ4eeiOTDjgy8PispNEq+zL2KfucYtLmt4
 baF4kUWLw2TIklyYrzOp0y+FaC/97hhaUevcqzQw2qt1H8UhRzUAI4Kn9//HsUQJXL
 36TTtVrqWFJAyUIy/CsMmJTRTN166+TGAZCvrLMXF4JLQXkBIP8XpUszFlIQ5JEs+6
 vV6GJs+cA6i1XeI9DmkPymWG8yZksvXM1ctrVF66ni7AKsCDImEKJVSmVBC7o0zcWa
 xsawy0dbAXwq88IQf5hs8/dX3SvCBIcxDHFsFu9v0oePlF/UvdQBtlThSZ/GNeHolu
 FQxcsC/108GEw==
To: James Park <james.park@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <C1hn9atmhrsfGrdxpjMd9sURb7AK2mpm0YkULfT-i160BF6miRFym6dmoBbzXK_bRi0j2L1lf8jbYw2b30yUYQRqaBaS5pxSKkCxxaK_y7g=@emersion.fr>
In-Reply-To: <CABjik9dC26tm0KzOc4SqWm-f-LW=+JbzZQuOR1fZJdZXowHaVw@mail.gmail.com>
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
 <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
 <V01BVRDu5ULkPDHO-WKC98pTaPlU3acbwd99o01-R6bWW0sO9SVlKjTo8l-bvUd6C1BwJafiZGBQ5XeWMFPteVDoc0bURCtVCu2A8IVau3w=@emersion.fr>
 <CABjik9dC26tm0KzOc4SqWm-f-LW=+JbzZQuOR1fZJdZXowHaVw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 10:55 AM, James Park <james.park@lagfreegames.com> wrote:

> I'd noticed the #if could be combined, but they weren't in drm,h when
> they could have been, so I didn't want to depart from the existing
> pattern.

I see. The original code really needed the two branches and
drm_basic_types.h doesn't. But let's see what others think.

> I think "One of the BSDs" is more informative than "Not Linux" if
> that statement is still true. Given the aversion to making drm.h
> robust to Windows, I don't think we want to imply compatibility that
> isn't there.

Well, drm_basic_types.h would be included on Windows as well from
drm_fourcc.h, right?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
