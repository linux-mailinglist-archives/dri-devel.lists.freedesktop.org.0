Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3E5EA91D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 16:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A72510E09E;
	Mon, 26 Sep 2022 14:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9310E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:54:33 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hy2so14610960ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OTQQafdYKhVU1CUsDylDEUFWuB5UKeHQ3P3f0D343jA=;
 b=X6Szd4P/Y8jrSapH1KfrBEHwbfRvaED1elbdcHIybIcX91cqAaGu6dZ/eOe+tzg293
 zpFOIyVPnPMqeC/flsaOreo467LTT3LrymCWDidJDQbuSIODXju0BkdUUaHkwCOoz+Em
 Y6rL//DxT+GlC3zFaaAvqKB02/zFVU7Sr5CFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OTQQafdYKhVU1CUsDylDEUFWuB5UKeHQ3P3f0D343jA=;
 b=T6NpVavbTJDVogMGYegf3h3cDvva8j86jFKbewK0hq39FIW9C+9xlR0sJnBjPN7x8b
 K5lKZTENa3Z6k+zOVHGzoswvMVrXlug877Ic4nluNYxrWvvOkurApVOnXqjsGLG5Ic58
 XB3LKgbDtUVMtYJ3wExx/gI1IxXsTcJqQmM5d7IejSDwa3DaRbgF6xUBI7n7cGBxtHx8
 jw+/D6WYG0e9kFgnyghPey4Ed++IAlW+g0LlGUEc1e7QReTxkHck1V4dkr34wjmH6GIt
 oO9K+83BQsD/jQwasORWubMhujkEMiEZLZJ7Rzf57JCNjqjyvA1JIktAK2Y65WKh7efB
 FOQQ==
X-Gm-Message-State: ACrzQf3b31fkUlfmsupw8ItyHodtuMrs2EDZxsf92m2MUBV8Svz4Uv0D
 sbKCc8X38+homiwIuBEw2TpBQHs6FJF735/B
X-Google-Smtp-Source: AMsMyM5vXatFQYU2PTMUxisXylYkDmP+5AyrjgYUTXHrcQPj9VZJqD3LOAlSC9lVR77YvISWA7tlIw==
X-Received: by 2002:a17:906:fe09:b0:77a:52b3:da5d with SMTP id
 wy9-20020a170906fe0900b0077a52b3da5dmr18162324ejb.57.1664204072127; 
 Mon, 26 Sep 2022 07:54:32 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 cn24-20020a0564020cb800b004571907240asm4185813edb.36.2022.09.26.07.54.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 07:54:31 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id t14so10610049wrx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:54:31 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr12684396wri.138.1664204071442; Mon, 26
 Sep 2022 07:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220926100839.482804-1-sean.hong@quanta.corp-partner.google.com>
 <CAD=FV=U1iUHBbA52Jr2mV5JSvTeipTZ3DuAS9mJ6gitBDwp8UQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U1iUHBbA52Jr2mV5JSvTeipTZ3DuAS9mJ6gitBDwp8UQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Sep 2022 07:54:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WOTBvBKh2LqX08pBh2HyJ_ORbLyuwcy5zFOwzUYqFYHw@mail.gmail.com>
Message-ID: <CAD=FV=WOTBvBKh2LqX08pBh2HyJ_ORbLyuwcy5zFOwzUYqFYHw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add INX N116BCA-EA2
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

On Mon, Sep 26, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Sep 26, 2022 at 3:08 AM Sean Hong
> <sean.hong@quanta.corp-partner.google.com> wrote:
> >
> > Add support for the INX - N116BCA-EA2 (HW: C1) panel
> >
> > Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 060f4f98bc04..ba75fae7d376 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1889,6 +1889,7 @@ static const struct edp_panel_entry edp_panels[] = {
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
> >
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
>
> This patch doesn't apply cleanly. You should be posting it against the
> top of drm-misc-next to make it easy to apply.
>
> In this case the merge conflict was trivial so I've fixed it and pushed it but:
> * Other folks applying patches won't do this.
> * If a patch is more complicated, I won't do this either.
>
> In any case, this is now in drm-misc-next as:
>
> c7bcc1056cff drm/panel-edp: Add INX N116BCA-EA2

Actually, though I've applied this change, while I was picking things
to the downstream ChromeOS tree I was reminded about a patch that
Chen-Yu landed recently:

https://patchwork.freedesktop.org/patch/msgid/20220908085454.1024167-1-wenst@chromium.org

I suspect that the two Innolux panels that you added recently need the
same treatment. Can you please post a patch for that? Said another
way: I think all of the Innolux panels that are using
"delay_200_500_p2e80" should switch to "delay_200_500_e80_d50"

Thanks!
