Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0729490D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD636E975;
	Wed, 21 Oct 2020 07:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A13B6E975
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:41:03 +0000 (UTC)
Date: Wed, 21 Oct 2020 07:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603266060;
 bh=7uirlr1LRaxjO4t9BNA+JYOCSKMYbSgM0KtI2HvKUuQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=cOYF1uo2h97ZVmaqB6AUMGaEaS/GxxZnbRt3MDusJsit+WLpnYitRgPsiie4SdHLI
 50t3JTbHu0WM+2wmFGPlb9+tb8xLbkB9O1aKxaHLHvD5i6ajTJxTRpr2BbiSKeCZfr
 GICn0O0HmNyYH/XFcB9hio1N0qb+Rk2Qo9Nb2d7ZulOUk9V9Sx/GKlBvws9+QaLPyP
 KIDQQll8L/w7Tya3xuyLIPdPileOPDSjdu1qfAMze0pcThm+Yb58RMPgOWxzdKzMRW
 fI1XuWw4JfZYN8w72siNPnQrxDS0fi6TO69VkAIZQstHQiyHDjiHYEsJd72asQZzc2
 97FW9LVfeKu4A==
To: Ken Huang <kenbshuang@google.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
Message-ID: <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
In-Reply-To: <20201021065404.1336797-1-kenbshuang@google.com>
References: <20201021065404.1336797-1-kenbshuang@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Adrian Salido <salidoa@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, October 21, 2020 8:54 AM, Ken Huang <kenbshuang@google.com> wrote:

> From: Adrian Salido salidoa@google.com
>
> Some displays may support Low Power modes, however, these modes may
> require special handling as they would usually require lower OPR
> content on framebuffers.

I'm not familiar with OPR. Can you explain what it is and what it means
for user-space?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
