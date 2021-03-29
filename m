Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1E34D228
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 16:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BE889D2F;
	Mon, 29 Mar 2021 14:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E37389D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 14:11:30 +0000 (UTC)
Date: Mon, 29 Mar 2021 14:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617027088;
 bh=/m6fPZO9iofk/6bDloEmBjjdNKVfk6ewjpqtTbHzMJ0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=H6KxMsoOq95uVmocdEu4Su3McT7aYvwI7Vh3ED1ijihrdEYsLs4NEskce26iYUKo5
 8/eNe/e0ij0xFTGQUeJpIf3XONxqc9vGG2O527LwZCO9DRo9wnnRbhUOtbqZCiGJ6C
 UiS4iNLNjQ0UuneJyWS5ZaLY0Ues0UQTp/6cQrZ8WdwPd3LjNuEzcOT0I1VF+5gt9A
 cpd0aQIOvxo7hTcYa1pcFyqw6saYwFo4oEL78f/i+P+TqDmMqLVB6x4VFdCNH+Yct4
 dHeEPxX2Pd4gUrNxyH7thvN8DwUoqtyts42JPSWZ8bMiRX1OFzzJGi+iaqtb8Gj+9s
 LA0fr5z0zJW3Q==
To: Maxime Ripard <maxime@cerno.tech>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <BoDZUOZSsZmHjkYkjHPb18dMl_t_U8ldrh8jZezjkA6a2O-IBkPGaER4wxZ2KlqRYuXlWM8xZwPnvweWEAATzoX-yuBJnBzjGKD3oXNfh5Y=@emersion.fr>
In-Reply-To: <20210329140731.tvkfxic4fu47v3rz@gilmour>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, March 29th, 2021 at 4:07 PM, Maxime Ripard <maxime@cerno.tech> wrote:

> Since it looks like you have two mutually exclusive planes, just expose
> one and be done with it?

You can expose the other as an overlay. Clever user-space will be able
to figure out that the more advanced plane can be used if the primary
plane is disabled.

But yeah, I don't think exposing two primary planes makes sense. The
"primary" bit is just there for legacy user-space, it's a hint that
it's the best plane to light up for fullscreen content. It has no other
significance than that, and in particular it doesn't mean that it's
incompatible with other primary planes.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
