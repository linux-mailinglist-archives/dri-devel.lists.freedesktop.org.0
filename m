Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4B5ED564
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDE710E29A;
	Wed, 28 Sep 2022 06:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2310E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 06:51:30 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id bu4so4334894uab.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iwJUBnrn5tDREi3DDlfw4s0KLtXFldwy4ed5ZI3vWW4=;
 b=Ws/GTYWqUQYbCFXcIomD1ALcZMDjjXFJRUzIey1WzlB+CadeA358bEdXg0Y26Lq/Ce
 lMxm6YXaA9QE76o6xvMLx6liB7EBzcVN+HBXfD/7QFwMvdKOHvd7zmHalg2D0gC43Gzl
 49wOpVFuv+aGA69CTIUy1aGPpknKZQ6LGYN+2bxk+QkvzgS+SlwPDvu1N/9fnqAeZ7e+
 jiNiq14yn7gXcBx0H5n/JOp/lONnUusEtW89/RBZhwGl/6NH3l9liHoAfPj8PE5WCSd4
 Rpitx6aEKThCOn5om/3KcQkBaZ/iHlnjppykS+sMOYkOj5EyCLilg6R+3Z9zs20Bu1oA
 aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iwJUBnrn5tDREi3DDlfw4s0KLtXFldwy4ed5ZI3vWW4=;
 b=DPbPcuW5oEF/GaqqcYqutZoVMhJhr/xTbOD379sHKddpVb+Q1r1xTS+KRqa+2V73bt
 fCBtFNjCayZ7n15H2j3rnt/GZ0N38SaN/7gx6JVFST3oMgNfMwBzNt9P1VP2U0HZ2AWC
 wjaH48d8qihkF9zbJGN+SdyiigQe1pEPrV4BWwwxKAGItiN86mm8S1xh6s598huO4xen
 Gljyti1gMhN3prjSQv+5zTp4iz22j97b4jE+VkfcJccAeSJH3orF+I2SDjNRJYpLAUBI
 W9TdjjGq15BbHAEQs40D905GbvvU86wuFXI+tGhevH6SioFSMB6Vk0fbttmFzpgeTS9N
 1AnQ==
X-Gm-Message-State: ACrzQf0bSHahM+ubF2XsojoePt83ujZEr9FGVM7jvHSMGNxcqxwIye1/
 u+wXQpMGXR3K4RkjLaQa7Atu4kvlMChP0AG3iVKWXQ==
X-Google-Smtp-Source: AMsMyM6VtkOeYlTXyhXASCv125A4HkhZNW5Pw2yUyfwQ3Fzr07m9faqyJ0KhvP38w8axeJbK9tL1x+t6NlkqMMZiy+s=
X-Received: by 2002:ab0:7a5b:0:b0:3b3:8eb9:5a25 with SMTP id
 a27-20020ab07a5b000000b003b38eb95a25mr13186139uat.55.1664347889574; Tue, 27
 Sep 2022 23:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220927063524.493591-1-sean.hong@quanta.corp-partner.google.com>
 <CAD=FV=WQXOTJu-YUWyBjdoq4wPrwQYoo68FCJBF7EJfdf+9SrA@mail.gmail.com>
In-Reply-To: <CAD=FV=WQXOTJu-YUWyBjdoq4wPrwQYoo68FCJBF7EJfdf+9SrA@mail.gmail.com>
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
Date: Wed, 28 Sep 2022 14:51:18 +0800
Message-ID: <CAP19T+6SWu_siXom4EANarqSRGif7qnkUPwhfKgjASnFnYG+cQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
To: Doug Anderson <dianders@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 11:27 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Sep 26, 2022 at 11:35 PM Sean Hong
> <sean.hong@quanta.corp-partner.google.com> wrote:
> >
> > Add support for the BOE - NT116WHM-N4C (HW: V8.1) panel.
> >
> > Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Wow, another panel?!?
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Pushed to drm-misc:
>
> 2f24fe8c54cc drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)

Hi Anderson,

I found some mistakes on this commit. I typed the wrong model name on
title and content.
The correct model name is NV116WHM-N4C and the code is correct.

How can I fix it? Do I need to revert this commit and then submit a
new patch upstream?

Sean
