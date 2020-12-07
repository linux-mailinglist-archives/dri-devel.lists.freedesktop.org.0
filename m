Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D92D0E5E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 11:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4AD6E5A4;
	Mon,  7 Dec 2020 10:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4F89ED3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:47:33 +0000 (UTC)
Date: Mon, 07 Dec 2020 10:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607338051;
 bh=E8XFLnm6DL0Y/zK7W6WA45sT31BnAWHB1HoQJA++8rY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=I/zg0D08SJ8AVWnUhFSNqc2OPf0epI+J+p7oPDBjfOqSa/jURFWz+uMNi4JD1OvGC
 mM3s/7isN2zEghbx++kl80LUCsAtiFSPLwWJtxCJ3yl6JkmT8vfGXIaZoJbqxDy/08
 LI/yPAY/YcqnkbuIjTor8QEuASUeBKJoz4lmr26mJMfw9jrUultXHJQd8BVoxFtclk
 GyWR9A8I3pP7vX0iuCE4xJrVBoZ+7h7lrnoTVbW01ewrXnwPPyVktmMbiNrd5y43xZ
 K+IhMt+1D0a7M+XQfNsfEcny7Iw9aTzPd5KM56I1NJwq/XSFaQM2Ni2wejtRgWcx2S
 LXhtLLm2ug7Lw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <EdWYHKD3WXh4_hWSW633I_O9leJ7ib3vLux7KuDhdcl-3vhSphWQnDALaATh_HVU97nzVuDWf5j4pp1d9tnHCelC7ogUjBcqxzW7Z_erfIs=@emersion.fr>
In-Reply-To: <20201207124454.42b87186@eldfell>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <20201207105109.599273be@eldfell>
 <CABjik9c+TVMK3685bkYp43PbqxoAosTxXEeQvH6hmfBD0YSz6A@mail.gmail.com>
 <20201207123514.65e4b868@eldfell> <20201207124454.42b87186@eldfell>
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
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 7th, 2020 at 11:44 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> But then, the code in the header should be literally
>
> #ifndef DRM_FOURCC_STANDALONE
> #include "drm.h"
> #endif
>
> without an #else branch.

As long as there is a #include "drm_basic_types.h" right before
(drm_fourcc.h needs __u32 and __u64), I believe this can work too
indeed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
