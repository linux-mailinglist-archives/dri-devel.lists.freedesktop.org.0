Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6713B4506F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7D36EE0A;
	Mon, 15 Nov 2021 14:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E836EE0A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:31:30 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636986688;
 bh=Z5zVyv8sZJFOw0j235JueSE3qOBMKroxSXfzMV+GZbw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UCYonmXKfSwGueKz4P0OhVnnA0tgvTc08r+75X5pCioJbSf2DMgg05uoV0Z3PYZSD
 bQeJf+znB3HLOBksaIS9etl6Wm5r0tEZhfOEROmONtxAGHRUuyucBW4ScSejkpdgTr
 V1VxV4TQ5Gw1ZGOrILu7ZdT0cqqOaPKp8fe3AVobL72rs/KVtPiCwlHXseb8kW0954
 ZAFnvmI5iJkq+76nz2c0X/l7dl0U1NEF8f8LhkxHk/6Z+Qy4zYOhHo8rIjkDUhMWnM
 GFQHicHFmNQsr4zknUNtrxfbuC5x2M5U86Nz/h4T7xX9OEDnC2kVvRoo8K4+DgXAK5
 swCkOKbjpwPBA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <mjksilqpqvU6TJE9-1HqK5Gh0lXPFKPa_a2mQbjVuv-Gczxf0iAgyiL7S39dA1Yw8KUcHMtKzHzblzwN_uV4nluz6Ge94wGbqAuEblZkY1Q=@emersion.fr>
In-Reply-To: <YZJsnNBc4w15Teva@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
 <CAPj87rNA1SzxJnT+L+Vpw8n15Gzed4rWto+OL6LdJRi0KOYReA@mail.gmail.com>
 <K23DZgTtMERkTEFRX3ZTohvEJ4DCdbJ3uj7rCmQC2Hh8n5z3mOioMVz4Q6TxxJjgVPao9H2RRTBL1NuCsDOCmJhrD0VelHPwqW6AhsbS7dA=@emersion.fr>
 <YZJsnNBc4w15Teva@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 15th, 2021 at 15:20, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> On Mon, Nov 15, 2021 at 12:09:47PM +0000, Simon Ser wrote:
> > On Thursday, November 11th, 2021 at 12:50, Daniel Stone <daniel@fooishb=
ar.org> wrote:
> >
> > > In fairness it is perfectly clear, it's just that I never considered
> > > calling it without master/admin because why would you ever do that?
> >
> > FWIW, drm_info does it to display the current buffers metadata. Pretty
> > useful when debugging.
>
> We also have the state debugfs file for this, which should dump everythin=
g
> we can decode. If it doesn't we should extend it there ideally, instead o=
f
> hand-rolling some tool that users/devs then don't have handy. debugfs
> tends to be there (at least for developers).

The debugfs output isn't as nice as drm_info, and can't produce structured
output like JSON.
