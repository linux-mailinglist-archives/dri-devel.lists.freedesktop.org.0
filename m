Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8492AECAB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 10:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D9189FD9;
	Wed, 11 Nov 2020 09:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB28289FD9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:08:18 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605085697;
 bh=qHYBN2xu7Ul8MOo3AvIY5jKw3Pap9a78qf2KLt9U8N0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Dge4juFFVENvPaCOFlOn8BCWJESCwNuVXvv1G++Db/yBIj7JwT6kzExuS6jGyL0Jg
 RYuRoMmJnxf78Awtv3lZ0OP5vUBvYW7+BPJ/A1/Xh6jqHQbek2PDPRD6WRQgTIOeii
 wQpDmRH33kvK6v+pn78DWIsZVkQdjjhPacy5rhI7TpyPyQpW7RXv7DIQTfSeC1Ihn/
 Sg8kw6Q/A5OWGLWoFLHs6U67NmHYO0xrW7TC4uUXptkPDE5LPeGZtg1djMMYLQ+lEa
 OGE4dsQFcthxwU55UroBF5d7ztkd4c/1p67eMfE8ED/DjdSJg4zCz3bh/ZJAkS7QnT
 vFs7j+jVAViYA==
To: Sam Ravnborg <sam@ravnborg.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add debug logs for drm_mode_atomic_ioctl errors
Message-ID: <kSN4kVzjo4skCZfD_kvT61IVnag1ThthZB4Zs_lv4ACvYLfxiP-qFB5zrucIOFiMG-b-ltx-O6vjv8I1xFkWmkZUdpes6J11H-YvokgEiPw=@emersion.fr>
In-Reply-To: <20201110173922.GA2808051@ravnborg.org>
References: <2sJwtJZS8GpTVmDedCE6b5WNkmnmUARXGt0mugjU2BA@cp3-web-033.plabs.ch>
 <20201110173922.GA2808051@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, November 10, 2020 6:39 PM, Sam Ravnborg <sam@ravnborg.org> wrote:

> You could consider migrating to drm_dbg_atomic() and friends while
> touching this - so we get one more core file migrated.
> You have a drm_device so the code is fine with the new drm_ based
> logging.

That's a good point! Sent a v2.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
