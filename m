Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F847121B8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5236E8A4;
	Mon, 16 Dec 2019 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F16E8A4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:11:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z193so5035337iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TNWv0aWtHJhxyhToHerV9BCppuZ+axUdKiJdVPw+LRQ=;
 b=celwqhK5NNdLd+EOZ1rmS8gY11hDBhbUukMQgDQedoTXtSg+H84z/+4GV0BB8RbBrQ
 heu7dj9LF8eofCdOTJQmz1YgpxpjQR9kjj7FQVr+AKCm5jkcaZmTNsm941CJlxqcZZZz
 4X2H2E6VWjM5LetvBt9f5XMWXRbwJcyh2sf7CFf4UNaPfbGiGuz2pRXsbAEVRB8vJ7/A
 PZM2hZ3qRw0OxAcSsB5fIN/4NLkusvQoI15AE2ouxGu14yxY6NM+TQh1jSKoRUqIDLns
 X8R9f+mJb9CGpl5zjyu6Gpa2du8cT3RgJwmybqBNSgdC0eFS+nEoSYqZcjv+ESoh0gjt
 1tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNWv0aWtHJhxyhToHerV9BCppuZ+axUdKiJdVPw+LRQ=;
 b=NSyiLc9q2ReOn8l++vHo/Xwqa2WG3RLUgGNPMCergq100+HrcgDuoMTPAncjbE3xJS
 64ajE6elbOFlTlkElAYzOqHk+c80/6J5hdTzwWFOT58S5j74b9ZxryD3e+LYmOdNIoOk
 CiNdfHoNrB8b4tNKO5i+lcRG6vPchmFGDLNvhyjssPX5SOJpRWXBt+oOwVGApAyfSLU2
 HI1ykF2JU+rG1erLM5neMLTVLrUxcPXQJ5z18yI3r68dXukaF+ocg0D/WyaAgWm7dj2f
 Znxj4n4Gt2CmEftei0Sg3QkZc8ah/hRrAScEe80hy0CEshGSgj3dZ0cnMVgZNoOwQW7s
 p1OQ==
X-Gm-Message-State: APjAAAVDI9JJHrUXE2ozxDBkuz1bvetWyFwjfswYclssGcwdhh5Eaa1Y
 tF6ANQK8YFKqjF3LOgChF0IgulRuZuDrGLl5q3cR6k4pzzQ=
X-Google-Smtp-Source: APXvYqxZSCccnCtPSIu8gDvzY3ilpk/8xU5jvGthRL5IwTogZ8JcwDNwFmX0RXa5BXv7BHu213PBQ86PBptozujIAmM=
X-Received: by 2002:a6b:fc0b:: with SMTP id r11mr937859ioh.251.1576530662308; 
 Mon, 16 Dec 2019 13:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20191216133405.1001-1-afd@ti.com>
 <20191216133405.1001-2-afd@ti.com>
In-Reply-To: <20191216133405.1001-2-afd@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 16 Dec 2019 13:10:51 -0800
Message-ID: <CALAqxLXyxEsYMA8swfQZJ2U1FPPSca6XKW_VFUhNkj2Nb3OxMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: heaps: Use _IOCTL_ for userspace IOCTL
 identifier
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 5:34 AM Andrew F. Davis <afd@ti.com> wrote:
>
> This is more consistent with the DMA and DRM frameworks convention. This
> patch is only a name change, no logic is changed.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Do wish we had caught/made this tweak earlier, but I do agree its a
more consistent name.
Acked-by: John Stultz <john.stultz@linaro.org>

I've also reworked my userland changes to use this name, and will
update them here shortly (assuming there's no objection to this).

Sumit: Mind queuing for drm-misc-next?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
