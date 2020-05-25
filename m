Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A01E118C
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD88966C;
	Mon, 25 May 2020 15:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050008966C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:20:44 +0000 (UTC)
Date: Mon, 25 May 2020 15:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590420043;
 bh=3RdNudmO4hC+GYd+Ig1ZoKDa7xqF0YYW/EZMY3WG7UU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GCgMbpMzR1PD3wYrkwGnmsXzEfPttQN6UX4cG5i5epxeMrmkPNqiouYx2GrwBHIOy
 OKNSX7DyTb8bDqajjrjpInKInekr1138duoIKBf9SPvsVSrh5SuoLi/zUN+lO2Kxt+
 xcOpQXIHdmM6SMjDIkj1vkKeR/xjRpfB2rA2O+SQ=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
Message-ID: <y61UnQ7JgZGomUBsKxwazOBwHB6sLQG3RfeimrIQ97Z35kTL6kwdLyCekZVWVVYA05qTERecIAbZdORUorZVsm_WK7zz9tPYCdGzWc0d2aw=@emersion.fr>
In-Reply-To: <20200525151515.GK206103@phenom.ffwll.local>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <20200525151515.GK206103@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 uday kiran pichika <udaykiran.pichika@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, May 25, 2020 5:15 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:
>
> > Hello,
> > Am working on enabling the Adaptive sync feature as part of the
> > Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> > (xf86-video-amdgpu). Below is the commit which i submitted.
> > https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371cc3731ee805cc4a0ace80db
> > I have made the below changes to enable this feature
> >
> > 1.  Enable Adaptive sync in Graphics Driver
> > 2.  Added Xorg.conf file with VariableRefresh property which is read in the
> >     Modesetting driver --> This is working fine.
> >
>
> -modesetting, even in latest git master branch doesn't have VRR support.
>
> So yeah this wont work.

FWIW, Sway supports VRR (via the output adaptive_sync command). So it
would be a way to test your driver.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
