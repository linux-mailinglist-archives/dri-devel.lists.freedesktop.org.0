Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED634D3F8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DC289C63;
	Mon, 29 Mar 2021 15:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72BA89C63
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:32:31 +0000 (UTC)
Date: Mon, 29 Mar 2021 16:32:17 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
To: Simon Ser <contact@emersion.fr>
Message-Id: <TTLQQQ.OCR65URAWJVQ2@crapouillou.net>
In-Reply-To: <BoDZUOZSsZmHjkYkjHPb18dMl_t_U8ldrh8jZezjkA6a2O-IBkPGaER4wxZ2KlqRYuXlWM8xZwPnvweWEAATzoX-yuBJnBzjGKD3oXNfh5Y=@emersion.fr>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <BoDZUOZSsZmHjkYkjHPb18dMl_t_U8ldrh8jZezjkA6a2O-IBkPGaER4wxZ2KlqRYuXlWM8xZwPnvweWEAATzoX-yuBJnBzjGKD3oXNfh5Y=@emersion.fr>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

Le lun. 29 mars 2021 =E0 14:11, Simon Ser <contact@emersion.fr> a =E9crit =

:
> On Monday, March 29th, 2021 at 4:07 PM, Maxime Ripard =

> <maxime@cerno.tech> wrote:
> =

>>  Since it looks like you have two mutually exclusive planes, just =

>> expose
>>  one and be done with it?
> =

> You can expose the other as an overlay. Clever user-space will be able
> to figure out that the more advanced plane can be used if the primary
> plane is disabled.
> =

> But yeah, I don't think exposing two primary planes makes sense. The
> "primary" bit is just there for legacy user-space, it's a hint that
> it's the best plane to light up for fullscreen content. It has no =

> other
> significance than that, and in particular it doesn't mean that it's
> incompatible with other primary planes.

Yes, from what I understood when writing the driver, there is not much =

of a difference with primary vs. overlay planes when dealing with the =

atomic DRM API, which I used exclusively.

Making the second plane an overlay would break the ABI, which is never =

something I'm happy to do; but I'd prefer to do it now than later.

I still have concerns about the user-space being "clever" enough to =

know it can disable the primary plane. Can e.g. wlroots handle that?

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
