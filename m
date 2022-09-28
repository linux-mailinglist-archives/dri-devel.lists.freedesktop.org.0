Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536535EE31B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 19:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250D10E4FD;
	Wed, 28 Sep 2022 17:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820BA10E4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 17:27:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b2so5711467eja.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LoaCqW3jpS8TGypc4TVU/1rL8RVEj1gIc68KQRqm5M8=;
 b=WQi3vRXWrLpV5LLIyL3HI0/XBIdEZDVlgeISWfa1H4KEcZU4m8LKG2wFPBnmJVmXAV
 K2l0fhZq62LVNM3PRD0ZCTfA+8x6l4JygClEFkfTEu1sAeiSCN5h41vFkRLYVsllV3py
 v9XQ/Zh7sZyFWHTbsMepsHHm4RyBiHiXn2BwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LoaCqW3jpS8TGypc4TVU/1rL8RVEj1gIc68KQRqm5M8=;
 b=zEVoNX4qyMxvBtae84TA/A8EsrLceUnZdq4e4yg33/fcXmuS14IVlO97wi44nE0Fqh
 eJCCJMppukK5izSlkDHdLVwcllXga0FIkTRYoKZAZFKj9yhPDNWeXHEaRmvx7ftr9qdD
 rbZ0gqTZo4ze5UE0qGXMV9A0G+OUx/OL0r0ZHVnRpTFBJqf9qyvC4pejQ5sBn6celUK4
 y1oQaNVR7A+4jrPM96MPXXtmn4NleuNHO32cQwyP1RGzN2uf9fPBKJnXn+wjSnxxnV7a
 ljZmQiuH4rg2kHmKYWJZhi0KlkBNyZKycyLlBHh95nZn8ErbE2tqe8S2Ctkax0uSeqPA
 D3gg==
X-Gm-Message-State: ACrzQf2T/c7okkm9IjT7nqfR9nWuafRHowJSFZksAYVIz/dWC35KesfZ
 /e4peoJlrnjxXyw6DxHywAufZ83cSq8sP3ry
X-Google-Smtp-Source: AMsMyM4JAZhfoOLsEFac4tTEbEuODVXM6dp2v0Yr7qFnuYn6R87+vQAwDxRMZM3MPUIRF+/OyhqXhw==
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id
 mm24-20020a170906cc5800b0076fc119acb5mr27754860ejb.651.1664386074817; 
 Wed, 28 Sep 2022 10:27:54 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 n1-20020a170906164100b007824c5fe95esm2700842ejd.50.2022.09.28.10.27.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:27:53 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso1715125wmq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:27:53 -0700 (PDT)
X-Received: by 2002:a05:600c:510e:b0:3b4:fed8:e65c with SMTP id
 o14-20020a05600c510e00b003b4fed8e65cmr7575844wms.93.1664386073218; Wed, 28
 Sep 2022 10:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220927063524.493591-1-sean.hong@quanta.corp-partner.google.com>
 <CAD=FV=WQXOTJu-YUWyBjdoq4wPrwQYoo68FCJBF7EJfdf+9SrA@mail.gmail.com>
 <CAP19T+6SWu_siXom4EANarqSRGif7qnkUPwhfKgjASnFnYG+cQ@mail.gmail.com>
In-Reply-To: <CAP19T+6SWu_siXom4EANarqSRGif7qnkUPwhfKgjASnFnYG+cQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Sep 2022 10:27:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRX5AuRcw9=0jw+9WnPfeXtYnPEu+iYgqQxXcJh4LvTg@mail.gmail.com>
Message-ID: <CAD=FV=XRX5AuRcw9=0jw+9WnPfeXtYnPEu+iYgqQxXcJh4LvTg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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

Hi,

On Tue, Sep 27, 2022 at 11:51 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> On Tue, Sep 27, 2022 at 11:27 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Sep 26, 2022 at 11:35 PM Sean Hong
> > <sean.hong@quanta.corp-partner.google.com> wrote:
> > >
> > > Add support for the BOE - NT116WHM-N4C (HW: V8.1) panel.
> > >
> > > Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Wow, another panel?!?
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Pushed to drm-misc:
> >
> > 2f24fe8c54cc drm/panel-edp: Add BOE NT116WHM-N4C (HW: V8.1)
>
> Hi Anderson,
>
> I found some mistakes on this commit. I typed the wrong model name on
> title and content.
> The correct model name is NV116WHM-N4C and the code is correct.
>
> How can I fix it? Do I need to revert this commit and then submit a
> new patch upstream?

There's not much to be done at this point in time. Reverting /
readding the same code with a slightly different commit message
wouldn't be worth it. The code is correct and that's the important
thing. The commit has a link to the mailing list post so anyone who's
confused will hopefully click the link and can find this discussion.

-Doug
