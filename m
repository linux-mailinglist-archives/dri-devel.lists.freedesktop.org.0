Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CA1EFC14
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 17:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB846E929;
	Fri,  5 Jun 2020 15:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B896E929
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 15:02:19 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id b10so2236833uaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ceWBNLxWuQhYrkktGQieEFGEV8NTc8EVrrjHEjb4bd4=;
 b=iOLKNilRGjTp9czkKTXjJ/qsJlNddN2wXsdc4MGcvk3qT2IlR59dHyXrJ7rQqYEx0Z
 ENbanqlTbYx1wBlNohfjiXbJpxdJTSun0E5e+vV7b63OZcx12K6xcckQsxPSvDqcZAvo
 Z09lkPb2zEY0kFkHfrRDJP4Khn6eB6VZhBSGIgTlVCkHhbfm7qWySUWx4l23Ant1uKj3
 fUSdB5v8L2H9Vg+YisWSgSqBzSVQs7Jgc/X7xN34WvgozybJwOgMzFeI/et9+/neFOAA
 HPvltQudmO9oROQvnzeZAvxUv6iUqoIWOFqcBY1bRU97UPhlD2PoN1TUwtcxuPZ2deU5
 pVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ceWBNLxWuQhYrkktGQieEFGEV8NTc8EVrrjHEjb4bd4=;
 b=YtLhcS/tKMBTqZm64gn/ssQ19hRtJFWu/StWuzFRdzGrjHVNWL7AMT9WjGqE0SjyBD
 swLdx0nqfLbUaK/JakHZQObCXwaxJvk8SXIUY6uLxiSguuW45zKd5ZVNf25/nZvEbwr9
 IaRLwJgQWW3UZYfF7e1uWzJigqzAqoIY0QE2r8JrFPpmYijX7Hr8M00WfkRp3v0oAKeq
 zxQ06xzNWr42e5lN2zMDTgVxmQ7rtfruLRaGCwYdMwPeakQ8qfk+9ctTVqwxbqmWRutk
 TU1D/UkyCvQjPcCDJ8X/vHTntGQwBCX4u+su7v68Y88kmZpo6suufF119xvGTMhIa0wH
 pl/A==
X-Gm-Message-State: AOAM5301T8t05qqZW5LlnHImA8uTX3uWlvp37CMypvWlWZBEsZQJNbnF
 xpGMyVfRYyCBZpmu9xAHC+b0tj5fbwF6uHU1LCg=
X-Google-Smtp-Source: ABdhPJwChvkFcp5hYobsJGhUThpO9nnKXF1mztiqFSX6H1W+YP9MFl1i0bY9dU/bJzDfZjjsHPmGxUuTCA5Oq/yMWQs=
X-Received: by 2002:ab0:3055:: with SMTP id x21mr7791323ual.106.1591369337071; 
 Fri, 05 Jun 2020 08:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-21-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200530031015.15492-21-laurent.pinchart@ideasonboard.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 15:58:53 +0100
Message-ID: <CACvgo51QNp745AKkW6CqEUGQ=Jx9v4hqp3YguZpVmvZWwx9y2g@mail.gmail.com>
Subject: Re: [PATCH v2 20/22] drm: mxsfb: Merge mxsfb_set_pixel_fmt() and
 mxsfb_set_bus_fmt()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

With the previous disclaimer in mind, the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

There's a small suggestion inline, for future work.

On Sat, 30 May 2020 at 04:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>         switch (bus_format) {
>         case MEDIA_BUS_FMT_RGB565_1X16:
> -               reg |= CTRL_BUS_WIDTH_16;
> +               ctrl |= CTRL_BUS_WIDTH_16;
>                 break;
>         case MEDIA_BUS_FMT_RGB666_1X18:
> -               reg |= CTRL_BUS_WIDTH_18;
> +               ctrl |= CTRL_BUS_WIDTH_18;
>                 break;
>         case MEDIA_BUS_FMT_RGB888_1X24:
> -               reg |= CTRL_BUS_WIDTH_24;
> +               ctrl |= CTRL_BUS_WIDTH_24;
>                 break;
>         default:
>                 dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
>                 break;

Off the top of my head, the default case should be handled in the
atomic_check() hook.
That is, unless I'm missing something and one can change the bus
format in between atomic_check() and atomic_enable(). Which would
sound like a very odd thing to do.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
