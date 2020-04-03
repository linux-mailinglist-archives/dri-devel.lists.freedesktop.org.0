Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BC19E4FE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3D26E1EE;
	Sat,  4 Apr 2020 12:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7F6ECA5;
 Fri,  3 Apr 2020 20:54:36 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w26so10923955edu.7;
 Fri, 03 Apr 2020 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZdnOORFu4H2ncsWZBuMn+O/Vwy1/vWmYAz7CgGo7Sc=;
 b=R/XHcrnF8RrI4gK5Wg0/ONiy2qxryMTjdhYGyMDP+pQA9HT9eQCxUm6lI0prQK+ytA
 sYJ32KDLe5fsXzqgxomhxaZRj9Jfcy0qSgmRPM6GJrrYUaFtef27jFx95GjamyvVj5WG
 I+adZ1oYXqNIlwkk6Ippk9JPt584o3X7OuGqu3SQi9Ci2w7DDgojGBiSL3vZ5H9k2b5r
 ABNvTtgC+4G9p59VwUaUVXIAvWIWJNVjjVWzzXVSMZOJMpiVJc0jIdD8cZNN5C/j6UPx
 CMAGzAdZcRuqtPl59O5ZGQo+MLPmOsTyM2PYghR42F/jgW++pQEF6czjxkiadI6wX/Bn
 Kylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZdnOORFu4H2ncsWZBuMn+O/Vwy1/vWmYAz7CgGo7Sc=;
 b=QI4TA0Mmb134juVod6MROuiB8Q2F1U0VknxBiLymz+wK3JgL7BmO4UA1oRdN1LuVBF
 R9Z0RRzXnfT+BNprBQkSyu2tmmILCDZ4zrwW6ifDuLENtFGz9Kole5ibsSztV/q5G4tV
 YLY1Dn/veDR+Mww8+EeNlaw62lye8esmn5/DfhX8JfQqTe4wJTHvrYgFL9+J5PwVudLy
 jDdLtCjMQiV3ldB2UoGB8SLeXN4hTUxvXhYVnTiP/5GSZdfuTvQak40diHZEKJFYwQPA
 iUNFBUtu/Y4T85DUWVARpE2RAPi2nCZGa3ymkYyVmAVw7VSUHU62+mB1Yh1b8V1GxFH3
 bbHg==
X-Gm-Message-State: AGi0PuZqLvpLV5lz1zuzNb9wg1W11isyRyKR91CKM2LvukJPuX5lHuMO
 gTp84qQmx2bamZxjuQahpP+ioBvioJ5Ajmu9Eoo=
X-Google-Smtp-Source: APiQypIy5CB9OVW6Wj41dcAMstNUuQKfbsCH8C+7QTvfdPNq7a53X6Hv/44OhmtWgSlS1a5SLS/S4YwBUVWeMqrzaO4=
X-Received: by 2002:a17:906:3618:: with SMTP id
 q24mr4376800ejb.90.1585947275239; 
 Fri, 03 Apr 2020 13:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <83618b63-b852-9e6d-b460-001fd7900b37@suse.de>
 <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>
 <f66ac1d8-6ba2-44c3-9faf-d02d1dca997d@suse.de>
In-Reply-To: <f66ac1d8-6ba2-44c3-9faf-d02d1dca997d@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 3 Apr 2020 22:54:24 +0200
Message-ID: <CAFBinCDCs_8mTmw5ipKVTVtEE5=Pjo4kFLWdmxujTNKBNCiTWg@mail.gmail.com>
Subject: Re: lima,
 panfrost: multiple definition of `of_devfreq_cooling_register_power'
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: tomeu.vizoso@collabora.com, lima@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, yuq825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 9:46 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Martin
>
> Am 02.04.20 um 09:39 schrieb Martin Blumenstingl:
> > Hi Thomas,
> >
> > On Thu, Apr 2, 2020 at 9:26 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Hi,
> >>
> >> building lima and panfrost drivers from drm-tip, I currently get the
> >> following linker error
> >>
> >>   > make clean
> >>   > make
> >>   [...]
> >>   LD      vmlinux.o
> >>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/panfrost
> >>         /panfrost_devfreq.o: in function
> >>         `of_devfreq_cooling_register_power':
> >>   panfrost_devfreq.c:(.text+0x18c): multiple definition of
> >>         `of_devfreq_cooling_register_power'; drivers/gpu/drm/lima
> >>         /lima_devfreq.o:lima_devfreq.c:(.text+0x1a0): first defined here
> >>   make[1]: *** [/home/tzimmermann/Projekte/linux/Makefile:1078: vmlinux]
> >>         Error 1
> >>   make[1]: Leaving directory '/home/tzimmermann/Projekte/linux/build-
> >>         arm'
> >>   make: *** [Makefile:180: sub-make] Error 2
> > can you please try building again with the attached patch?
>
> Yes, fixes the bug. Thanks for responding quickly.
I just sent a fix to the correct mailing lists: [0]
it would be awesome if you could give it your "Tested-by"


Regards
Martin


[0] https://lore.kernel.org/patchwork/patch/1220292/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
