Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDB6DB57C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 22:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AC810EE4E;
	Fri,  7 Apr 2023 20:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E93E10EE55
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1680900841; i=deller@gmx.de;
 bh=550F14P5Hzd4WFJcjAc0nSlwr1Mlxm9P3KdstqvYPGk=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=CE4AF4jF6VOWktxBzClZOl5vUQHiiEhYBJNUnsfHZqOHZbHNusYql0atRM4eUZ6nB
 1eYWC/yHqKQQuFg+ylVvFxcFac5jrrau55TTzji74ytL+GFWS+FzyiK79fpUFbqMtW
 b8rzXvsFD6+TVT2FqzQ2Dbs+WbF3dIckDyHca/j19tmPfJOUrTV8QLfmvhzX+rM+HA
 aoqiUgGvGxFramOFJgeu3DJpMM1ymMDsYlclrU4CuloXCzA7iwQaa6POMfPp0VrfoN
 lGfbp3UvOwWc9LGY784Dv8FWolPpRHI4Yq76ql4+R/dJpkpVFNS5NZq3u5BdtvNKzY
 7J8zJk1bgVwmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.92]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBDnI-1pfz0B0Qmc-00CeYv; Fri, 07
 Apr 2023 22:54:01 +0200
Message-ID: <85282243-33a6-a311-0b50-a7edfc4c4c6e@gmx.de>
Date: Fri, 7 Apr 2023 22:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
References: <20230406132109.32050-1-tzimmermann@suse.de>
 <20230406132109.32050-3-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 2/9] video/aperture: use generic code to figure out the
 vga default device
In-Reply-To: <20230406132109.32050-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pl3kcAyEcut6Yyrp868xThy7FcYNZdvudStKiKyhyjuNbeEWiX9
 7LrauqZWeVyTIN4Kns/I+r90UluJeIPhF0kSYd6Puzo08poKBy2A+1nIawYFjZAmGzLjKMZ
 1xYr7rZ0ah7PFQj3eswWxcAKb7Qxb4C3r60B9yX6EigoI1tQyTLbjN6FfYZWgpM2SZL6v8d
 8MYx1uAv+agZxEvonxK6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gJLwJ3UW3r0=;oCNjJrVLRm1YHRaPyFBjKSiMuXA
 g5mVkNsG+2vEaJL6xe1tpXDTRE6XZUmyo8onWTANFhDyPNKs5C2qHYTQ6HHjIUL5KCRMN9+D5
 CxnRar81A34eAuyUABQt/6KT1yHoYoW5E3PBbk45PQW92t19ymIxBixTbmPHHhEe8nFFnCBxS
 d0ojrRyUuZgJE8O6t4zPpCDtE+Kn9ER1ry3yyQVmG0WkU9egWap3A6fK1f0MhqiAwACz8hlay
 EUYPxNu2DxRXdOwRO33TE/bIAU8YoFz/VB246dLuJA4lByxAEjXJQbnzLIvjofM7h8rgua767
 9K/eJ3d70AoOphqiL8IBcfS00IRF8G+Upej0jlNKCke7wj5RVR4PIe6gu3fIFJP7i/SJ+ecrl
 v0saQLA+xkNS6m6UaRhg5t9H4aGILj/FGra16X3SvDfcG6cwswwZNkZ5jvhZEvjsJTAYmfbJ8
 vh7cWV7M4S0x8Rha3yuHQ9XYCt4U1+J3O7a6NGqAWcVhm+3RGQssM2d9QZL63X6gZG8tyi/i2
 E3jwj/sUVZHnUMVUbKl1zLfuF80A4a102ip80T7Nkdi0ggN1D/L2kmywc9rennQ32uKowahpH
 1w6pe8TmKkF4mcbqx2JWk1u6J/J9tTVLKjxfd1YkxR5XeXU2qCJv2V/QTzLhyfgdcu4BEWBNE
 4/S5wlav+9tm+GbMbNuo2hg//cFdfhinY6IkzS0upBtdpuzLeGbbP2QjfEky0C3Q1UUMzSDMI
 4BxIqJwxX+npEmJXrMjzqqYs2H1Y8JqMwsio8V2WTwE58v0/h9LaLJSKWqN0Esnn4f9qdOYkv
 KImnPU+FljAtuKdhrUPhc/9Wz6Fn4TB/cZOIExUXyyNl7/kWcqKXm7fKhP6BH6SnvbDniBd/q
 9CDWq8o7uSLdIhXgDtXEM6gTUTWVbbrNG0AHsH6w657tw9do0v3mp5YGKSuRuHkFFsfmvfslE
 HifTEQ==
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/23 15:21, Thomas Zimmermann wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Since vgaarb has been promoted to be a core piece of the pci subsystem
> we don't have to open code random guesses anymore, we actually know
> this in a platform agnostic way, and there's no need for an x86
> specific hack. See also commit 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
> drivers/pci")
>
> This should not result in any functional change, and the non-x86
> multi-gpu pci systems are probably rare enough to not matter (I don't
> know of any tbh). But it's a nice cleanup, so let's do it.
>
> There's been a few questions on previous iterations on dri-devel and
> irc:
>
> - fb_is_primary_device() seems to be yet another implementation of
>    this theme, and at least on x86 it checks for both
>    vga_default_device OR rom shadowing. There shouldn't ever be a case
>    where rom shadowing gives any additional hints about the boot vga
>    device, but if there is then the default vga selection in vgaarb
>    should probably be fixed. And not special-case checks replicated all
>    over.
>
> - Thomas also brought up that on most !x86 systems
>    fb_is_primary_device() returns 0, except on sparc/parisc. But these
>    2 special cases are about platform specific devices and not pci, so
>    shouldn't have any interactions.

Nearly all graphics cards on parisc machines are actually PCI cards,
but the way we handle the handover to graphics mode with STIcore doesn't
conflicts with your planned aperture changes.
So no problem as far as I can see for parisc...

Helge
