Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15813FC9BC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7CB6E0A2;
	Tue, 31 Aug 2021 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F26E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:30:45 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x16so15118629pfh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLs1OUbJzfsYm6BgOLPaRns16hZqvmQbWuGKXagDwHE=;
 b=L8YUiecESYZD/UaVoOGca4GpndK2j49FkCwHWQo4Odzs9yTBnwQiEl4Hq9Fx1yNLqC
 m4hwgKMKOF6qyazhuHwDcEBOz0BwWTcLHqgVlC0sOsIyVQdQ2XU2v89wmCQLMX2H2Jdi
 uJwKENjhrjKJDYmOUJfXkdJr0+z5SLdfj7ACT+GiNw9Gps9+I0DusUTMShDxHF0/ahBo
 c6/GqJXnUbGLQaGbQLo7m8jx6ehEeRxfaVN+8k9+4EaT9zVpRZTVPqtkrK9GHzjlDJ+w
 BmnIBZd5UTg+hyFsWMpUQBKsK1mX0BbhPwzQeSrqk8mGhI9qs9omGxtw+4+Rv25xLzIQ
 UvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLs1OUbJzfsYm6BgOLPaRns16hZqvmQbWuGKXagDwHE=;
 b=lES1sa88mbPLaaeqqiGqYvocWsZm/5EoJljWByxH3hbsgBGsd6O2auqPfU+wPC5zN6
 4dF/gOHz+3b56LriEZTZEDVl/asMMs/1W2wjI44zLzXvmHJ77PRtQZai5NVELa/GeXgT
 fSF5AyN4VWqfQmLWsjn0BKu4Oi0FywcGa44f7vVrV7vl/KWkumvEOGQ7Kg/vAM1eacf7
 hW7ySRpxt5AUO7PXvWPNn6nuLq/o6lGHSZttCmNZFvdCxg4KrT/vdH5vguVQSbwf3VP/
 2uV4to9e7eCa93jtdRpVGyvCbj1AV84alhLJJG7ntaloH4/raNd8sS3wD3VPCbtF6K7G
 /0Mw==
X-Gm-Message-State: AOAM530XSDw9gO7O2pIlrO2KmcrGEqwvAuoaRmuSRWmmE4A2UP7oP3OZ
 RLcmaGWu2DGjcfkpORIOYA29wmuQoh5qN5Ac/t6idw==
X-Google-Smtp-Source: ABdhPJz92eo0sWW0JytfTA/KdktPbj1ZDfvj4NPdVNGiMbn2SFgsAvwRKT8XjcguHMFKwcSsDLjIFDh5QLE0+E6m15o=
X-Received: by 2002:a62:8287:0:b0:3ec:f6dc:9672 with SMTP id
 w129-20020a628287000000b003ecf6dc9672mr28544553pfd.65.1630420245232; Tue, 31
 Aug 2021 07:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210822072111.628-1-caihuoqing@baidu.com>
 <YSJQLtj7dknOXNi0@pendragon.ideasonboard.com>
In-Reply-To: <YSJQLtj7dknOXNi0@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 31 Aug 2021 16:30:33 +0200
Message-ID: <CAG3jFyu1b8Nit5CNi0AJ-UR_PUC5gKhA3HKXLff73_XY9Fc=Qw@mail.gmail.com>
Subject: Re: [PATCH] drm: adv7511: Convert to SPDX identifier
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Cai Huoqing <caihuoqing@baidu.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 22 Aug 2021 at 15:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Cai,
>
> Thank you for the patch.
>
> On Sun, Aug 22, 2021 at 03:21:11PM +0800, Cai Huoqing wrote:
> > use SPDX-License-Identifier instead of a verbose license text
> >
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to drm-misc-next.

>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > index a20a45c0b353..28d9becc939c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > @@ -1,21 +1,8 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> >  /*
> >   * adv7511_cec.c - Analog Devices ADV7511/33 cec driver
> >   *
> >   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > - *
> > - * This program is free software; you may redistribute it and/or modify
> > - * it under the terms of the GNU General Public License as published by
> > - * the Free Software Foundation; version 2 of the License.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> > - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> > - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> > - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> > - * SOFTWARE.
> > - *
> >   */
> >
> >  #include <linux/device.h>
>
> --
> Regards,
>
> Laurent Pinchart
