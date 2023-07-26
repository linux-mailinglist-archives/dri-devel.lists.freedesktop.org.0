Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5E764814
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FFC10E4F2;
	Thu, 27 Jul 2023 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta01.prd.rdg.aluminati.org (mta01.prd.rdg.aluminati.org
 [94.76.243.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2423110E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:11:22 +0000 (UTC)
Received: from mta01.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id D16BA2030A;
 Wed, 26 Jul 2023 11:11:20 +0100 (BST)
Authentication-Results: mta01.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=LMr9ELW8; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta01.prd.rdg.aluminati.org (Postfix) with ESMTP id C7569203C4;
 Wed, 26 Jul 2023 11:11:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1690366279; bh=6bk/l9S3HDcBOeGVjGgzmCzSyAeKIdS6Zlajp7XZal4=; b=
 LMr9ELW8o8h40p50B7j4KAmQeOPabjr3vKCb6PfL+P6QFXxeX5ucxt9J6eH2C5iS
 YIr6HZnFrOywtFA10OoIrUSpOa1mYElflu7+gncsESckB9WdaAqxM4A/8OP1IkbG
 VnVyIljWXPyWUKp5z6J90QX+Ykb9GgzB6YKX475okyD9xLKWbrGnZKl/i62H3CJY
 IYpzQfkPs+nEr84Q/C1uMtvSSiQfHygP+e+ph+8Es95fqAWyAzDYEFW3KWCqFbJ/
 wnhatVFvauzO98x8rirpNUky+8ilWgA09IQVD/S0iqNjpQ1OG+UwlObbizW5h/c7
 VV0mWmh51OkccZ/19B+fUA==
X-Quarantine-ID: <tme63SuFZOTi>
X-Virus-Scanned: Debian amavisd-new at mta01.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta01.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id tme63SuFZOTi; Wed, 26 Jul 2023 11:11:19 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-1.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 010BB1C0002;
 Wed, 26 Jul 2023 11:11:14 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 1FA3D120362; Wed, 26 Jul 2023 11:11:14 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Wed, 26 Jul 2023 10:16:36 +0200
 <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Wed, 26 Jul 2023 11:11:14 +0100
Message-ID: <20230726111114.5287@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jocelyn,

>> How can I check for sure whether I am using 24 or 32 bits per pixel
>> ?
> 
> The easiest solution if you already rebuilt your kernel is to print
> the variable bpp here:
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L326
> 
> pr_info("mgag200 bpp %d\n", bpp);

Did that, and I get "mgag200 bpp 32".

> Also if you can run Wayland at 1440x900@60, that would mean the
> hardware is indeed able to handle it in 32bit.

I can indeed run Wayland at 1440x900@60.

So I think I'm right in saying that my graphics chip can handle
1440x900@60 with 32 bits per pixel.

However, while searching /var/log/messages for the bpp output above, I
also found these two lines:

/usr/libexec/gdm-x-session[2366]: (==) modeset(0): Depth 24, (==) framebuffer bpp 32
/usr/libexec/gdm-x-session[2366]: (==) modeset(0): RGB weight 888

in case it makes a difference.

Thanks,
Roger.
