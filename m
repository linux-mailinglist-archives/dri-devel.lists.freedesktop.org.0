Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD58621957
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D950010E4C3;
	Tue,  8 Nov 2022 16:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADE10E4D1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:27:05 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-370547b8ca0so138789507b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 08:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tAZBstAdAsmK2XVl2Tom+G2xfbr9YP3jCR0NWwLcpbY=;
 b=HiGTzUoVmhEVvVkdyNqwuF6heV9nAwZvdLKlIXsppaoNt+uX/qVAQNtFGgYmPsBGHM
 0F9S5/bsxeZCjF0LQEYGU9FcMiHDVR50vlIZ6RKwgEFqBYEb/SsdGHuFycPHMw9MmghX
 JjXvd2EuDhKDQ9Isyh1iu309DukrHDA6mX8uOCxPHXgO2TvVT3sf1ovRCns3OwWcPg5R
 jRCEfTr/BIz/5+1S8pIwwjXLmEf5g1xz6RFdomtLcAxOnwpB+kWGnszEEf0rbebzYfr+
 32G35niUMCT9cuuQFobooLkMDxKcF4TCb5KHkYcr5IaZ/IFlv1mnMNXdgwXk5goxJNTD
 obsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAZBstAdAsmK2XVl2Tom+G2xfbr9YP3jCR0NWwLcpbY=;
 b=JPDwR39d2BH90XlQSQiPwMgkVV8TcOaTl7p5dGQmLUtf8ZhAAATrOgtk8UHRuA7Q1q
 yy3lsSarD2cjuIFBi3R+Dp/q7hrWKbl0ijd+QjMJk1HRgdtBeVkN94pkmYpgecP7XHh1
 KGMPWFUziO59REQ/bgbDxLFUJNbiK7oXfBuY9O7tB3DzUlsKCZTRKDsGQD8C5UQucN1r
 CD3d17Ot9L/jrW/4gslQajgwMz5kQ3gnxE+ZOIEJ1ig/+gTRvFMbpvPyVCGFX08kDRGZ
 WcvDq/fChV0KBL7xsU3ZOyThRbw5WXIdU20XFrckb3bjTfzzGL1dAtUraSSzPT53RxHY
 3a7w==
X-Gm-Message-State: ACrzQf1UIJJAa5ZUR14zSWX3f6/10EyZPn/jQUA4Zj1GP8KY9EjjFmb/
 jq9LOtIOs6pS+drTR8/pPPeH8UFxAwaZF5l7ggbNpA==
X-Google-Smtp-Source: AMsMyM6l2BaUQaFUsRd0n/pdKYEWQEefaZfrhq2KgsqeM81bGZLhCI92KaCqsVBeiJB0GDyRYIblXXScpd1fyEvMuwY=
X-Received: by 2002:a0d:dd49:0:b0:36b:f81c:ceb8 with SMTP id
 g70-20020a0ddd49000000b0036bf81cceb8mr55021890ywe.171.1667924824513; Tue, 08
 Nov 2022 08:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
 <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
 <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
 <CACRpkdaZnGgJ3egXEtoH0gTmR0m_-9Q+iGZr2eOx2JVHYgXCXA@mail.gmail.com>
 <CA+VMnFz1h0MfwxiQeFCdvMJWQ9uKWvwstJvKnpDTKjaVHN3pYw@mail.gmail.com>
 <CACRpkdZGXeGc_vyAGw3zW4MyR+tp9jhvKJ4sf2tSS7L9B+oyOA@mail.gmail.com>
In-Reply-To: <CACRpkdZGXeGc_vyAGw3zW4MyR+tp9jhvKJ4sf2tSS7L9B+oyOA@mail.gmail.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 8 Nov 2022 21:56:53 +0530
Message-ID: <CA+VMnFwKFFDADLDyjm-EG5p_8K8HE7V851b0uLPqR+i=MKFZDA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 at 20:33, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 8, 2022 at 3:53 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > On Tue, 8 Nov 2022 at 20:18, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Nov 8, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > > > On Tue, 8 Nov 2022 at 19:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > >
> > > > > On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > > > >
> > > > > > Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> > > > > > dot matrix LCD with 800RGBx1280 dots at maximum.
> > > > > >
> > > > > > Add support for it.
> > > > > >
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > > > > > ---
> > > > > > Changes for v3:
> > > > > > - updatd to WXGA
> > > > > > - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY
> > > > >
> > > > > My comments on v2 have not been addressed, for example I asked to
> > > > > remove the delay from sequences and just use an explicit delay and
> > > > > to then use the existing sequence sending macro.
> > > >
> > > > True, I responded on the same day [1], since I didn't get the reply I
> > > > have posted by assuming my comment is valid. Would you please check
> > > > and respond?
> > > >
> > > > [1] https://lore.kernel.org/all/CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com/
> > >
> > > OK I see, sorry for not reading close.
> > >
> > > The driver just supports one single variant.
> > >
> > > What you are doing is preparing the ground for more variants
> > > that may or may not exist. This creates the antipattern "big upfront design"
> > > i.e. abstractions added for things that do not yet exist.
> > >
> > > I think it is better to strip it down to just open coding the delay after
> > > the init sequence. When the next variant appears, if ever, they can
> > > add abstraction. Maybe they need the same delay in the same
> > > place? Who knows...
> >
> > I understand your point, but delays are strictly mentioned by the
> > panel vendor init sequence, cz101b4001 do you think adding in the
> > generic or common code is still valid since we have code added for
> > cz101b4001 specifically via driver data?
>
> I would instead of encoding a sequence into the driver data
> encode a per-variant callback that sends the sequence (which
> can then be just static array) and then ends with an explicit delay.

Okay. I will wrap up that delay to make it explicit and update the dcs
packet send sequence.

Thanks,
Jagan.
