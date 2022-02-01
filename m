Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80E4A6655
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 21:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83F910E163;
	Tue,  1 Feb 2022 20:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509F10E143;
 Tue,  1 Feb 2022 20:47:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w25so36129710edt.7;
 Tue, 01 Feb 2022 12:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBnJnA9U9S3KagUnngEcBE9vHXc5AUv/doMbVPNRS3M=;
 b=DVRlUjS7VD4VU5BIZI8dkhEQHskJDVcEhTqXgdBLXMvM85SH3FVbL1zwAze6A0bx8X
 OAW0RmKejtBz7i1iD0FUGGayBM737FcPbGGupR5eUbQXtdhysj2U/fSebBcJAcmFxrC2
 /Tk9m3SCEpQsrDlVridmbiOa5DoIj3XduwMBgfuz2MJHNOk1hrZQFUfZDeboO4ayqnCf
 xAuHpuxqj4JGFYbwMaC6W/9Mn94WUZIxjhX6dauEPZ6tTYVvRALbVQ75OI6aqmbfBVOx
 tl//7qnWxG1dkofxM2g/2PlGzhuRgMIwnjoGiiQ8fUKNLW3DP0Wenw6I5dcj18YIz64U
 qi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBnJnA9U9S3KagUnngEcBE9vHXc5AUv/doMbVPNRS3M=;
 b=65oYKmRJajs8EdIvhy2SIROWvTO0WiPryM+LlC5DZr3T3HK+/7Y11QfNL2V/S5aw7B
 jhJWCS0/VkRtc0jJYrDamliBhcrbWILbxwZP6NFIQUV9LlEyux1vIzyr75XH1WsNgiSY
 ++PaefidHypvAt+Gb744iTkgZazMAIDT+epW3hBy/6UkApttrwluotzOLppdoLUtWA4k
 1hnv4nVIC7XJX3yRb/iWxxbsTcsU4k1x66q1SnbQoWjYtmzunSqfLvNlxIx/x4BJbGNG
 YBZWx6gNTBnH08/ELGe2GySLhN4pkQsp+dCf7t1cOVu5McNbdJ0G9gppRB6aLHoz1lIN
 IB2Q==
X-Gm-Message-State: AOAM531uW59dxiF/0AQ9Nz0G6SBXaWhaulVRYqneV+H8Ot0CWYffK3R4
 fpxdUdRMIImdqdLH6WdmncOiJkLwEH5eZeN0oVM=
X-Google-Smtp-Source: ABdhPJyBBdtce7X6YzSzBIRP8A8MLaDIvOP+WrtnwMdA5W9VQWaObJqInyQslAQfXCXv4oNyf4z0GJMdf8TOMxscNbo=
X-Received: by 2002:a05:6402:5186:: with SMTP id
 q6mr27091981edd.96.1643748447233; 
 Tue, 01 Feb 2022 12:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Feb 2022 06:47:15 +1000
Message-ID: <CAPM=9txcHr11R9_bmwBrhz6pDs_Vk0Xb840_piRH9QdYM29KZg@mail.gmail.com>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 DRI Development <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Feb 2022 at 07:06, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Ever since Tomi extracted the core code in 2014 it's been defacto me
> maintaining this, with help from others from dri-devel and sometimes
> Linus (but those are mostly merge conflicts):
>
> $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
>     35  Daniel Vetter
>     23  Linus Torvalds
>     10  Hans de Goede
>      9  Dave Airlie
>      6  Peter Rosin

Acked-by: Dave Airlie <airlied@redhat.com>
