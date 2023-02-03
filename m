Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B8689A50
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 14:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1910E7A1;
	Fri,  3 Feb 2023 13:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C7310E7A1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 13:54:02 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id e19so2883145qvw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 05:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nbKgXRRhHOsf8b2qFYqubarXiD/2JOI3CXyxQSetlOo=;
 b=wZSqL7udI0UewPr7kKCCMKgFqFLTD7/Od5kQAAUC9avzwkMDLMYFhQyfv4eqTIvqPC
 MjiWmBW1P1RNN3gP4/nu/7XmgzbADSb3L4Yw6NFjuz+TGdK5saD6cRCT1FNWNfz+Cp5V
 ULP/bAgajSJ01288TzWXqI18OXyAQ3WJKtzshd5T7QwTNhsAic6n4tc+asj7qqbhjBGt
 gJL6X61d63O4wWddjtMbYdAhBgZEZCcvg+EkuEg4fIgZvf7eDltpcv6w5IqQ19Gxhrbw
 mY03hekgB0dpTicAuYh0nUzt4rdLi98t1qokrlUemHliX1UtB6EIRan/T4eBwZ/yQ3D+
 AhsQ==
X-Gm-Message-State: AO0yUKXGok9r9msJJfZ1tvVZOddMWSF2dd3v0a0xEj439xvQB71aaV3p
 PFRK/+LN4+Wjx5w0PlXkVBbBi1plzLljKw==
X-Google-Smtp-Source: AK7set9USHjeX37i7IilclIPc/eUKqeczJTPtswS6lrEjD8sS2Aik7N1kF/7l6fNQvC2gPCUFi3oKw==
X-Received: by 2002:a05:6214:2aa2:b0:539:80d6:c892 with SMTP id
 js2-20020a0562142aa200b0053980d6c892mr18452194qvb.8.1675432441514; 
 Fri, 03 Feb 2023 05:54:01 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05620a20d200b007090f7a4f2asm1812383qka.82.2023.02.03.05.54.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:54:00 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-4a263c4ddbaso69775647b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 05:54:00 -0800 (PST)
X-Received: by 2002:a0d:c2c4:0:b0:514:a90f:10ea with SMTP id
 e187-20020a0dc2c4000000b00514a90f10eamr1025067ywd.316.1675432440139; Fri, 03
 Feb 2023 05:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com> <20230203071506.GB24833@lst.de>
 <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
In-Reply-To: <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 14:53:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Feb 3, 2023 at 2:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Feb 03, 2023 at 08:15:06AM +0100, Christoph Hellwig wrote:
> > So given that the big series doesn't go in, can we get this removal
> > picked up through the drm tree?
>
> Geert has a board with an ARM-based SoC compatible with this driver, and
> he expressed interest in taking over maintainership. Geert, could you
> share your plans ? Should the shmobile_drm driver be dropped now, or
> will you revive it in a relatively near future ?

(Trying to) get it working on that board is on my list...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
