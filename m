Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F652CF08
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA2811B09B;
	Thu, 19 May 2022 09:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913911B09B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:09:53 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ff155c239bso50619297b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTYN8SQA1Kibj+1iEMNK2WJ4kiFH1jZy+Z6ZLSVIzN0=;
 b=hvulyA/9nIvcQL349rFarbnddLvY9KxNXVzOwnuziFMGzgoXJafIeq4MkYBy6jLk6W
 s3M1vHrQCdqvZAScHSvOaiC24sEZLHS49j0W88ksuOnZWzOJcz/qal8MrrGbJgy3AxE/
 jC8pn9TpW1Fsn7CRdkMKMPRWnyntyy4uNhTFYqyIsPsY3xLU+1Tj8BSmdpt+ZPQQREut
 hKV7/XAof2E30dQbV/qIr57X2zMxMUYLPtvgd3NWcR1W//0MOFeYlipiFSPiPdoYTRkl
 EVNnGm474dJJ1JPi1bY7lymcKpQU0jo24pOGJbZyS5KotlMFZoWGsrDcpf3mxJcprTz2
 2QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTYN8SQA1Kibj+1iEMNK2WJ4kiFH1jZy+Z6ZLSVIzN0=;
 b=a67fNbgDhK2a8ukc3uVUNDQ8EevUGJn5Ljt0Kgys0rNd/dUnYHy+tXSZwQpJaMHSef
 rVcwDuFp1Xw18IscDjhUJcyPKYtym39tm7RPzq2mwUAVaH8V7N8CadBnTX/DtXoDpp0x
 aNvMCNkpjL4tQfeuaM3sE2X6eHXCBz6wpnp50hNTjmoUv1yLTqaijcZyV9JL0DugfRmu
 pLl3zh4cXg2T73stbkYHFKiDFzFJ7fA7M0m2zm2DGQa1E6MGqvz06URRelWGkoY2wP/X
 qAajYOOpBFPgYQOBMdHnPLZxCgnWwOREEyxSkDv9k/78paXkSeHcl5FkVZOag4v1tPrA
 biCw==
X-Gm-Message-State: AOAM530Kfk0Hrv1jfK8S4QntCmkU/g7MLvPdeIVa+ajVza9bIrQEBwXY
 v7j28aGUfZlqNhTsvJlHFyNbIOrkYRSrnKD5mzU2kQ==
X-Google-Smtp-Source: ABdhPJwWgBnbFPBng8jyysNwYozhHy5L14kmJuY8TO30we9HAg0aLzdUurH9h7SgBVzWDxYOJ2zAzts+I/soNqiTxJU=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr3757471ywd.448.1652951392715; Thu, 19
 May 2022 02:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651835715.git.jo@jsfamily.in>
 <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
 <BY5PR02MB7009831D8BC4DB2B34739CB6D9CF9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009831D8BC4DB2B34739CB6D9CF9@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 11:09:41 +0200
Message-ID: <CACRpkdZw+MwU42s8BWHkN2T3A-a-TGML8jJ0kQteMOE06m0UXg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
To: Joel Selvaraj <jo@jsfamily.in>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, phone-devel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 2:56 PM Joel Selvaraj <jo@jsfamily.in> wrote:
> On 13/05/22 03:21, Linus Walleij wrote:
> > On Fri, May 6, 2022 at 2:18 PM Joel Selvaraj <jo@jsfamily.in> wrote:
> >> +#define dsi_dcs_write_seq(dsi, seq...) do {                            \
> >> +               static const u8 d[] = { seq };                          \
> >> +               int ret;                                                \
> >> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> >> +               if (ret < 0)                                            \
> >> +                       return ret;                                     \
> >> +       } while (0)
> >
> > First I don't see what the do {} while (0) buys you, just use
> > a basic block {}.
>
> The do {} while (0) in macro ensures there is a semicolon when it's
> used. With normal blocking, it would have issues with if conditions?
> I read about them here: https://stackoverflow.com/a/2381339

Hm that seems true, it enforces the semicolon ; at the end of the
statement which is nice. I suppose we should fix the other macro
as well.

Noralf added this ({}) form in 02dd95fe31693, so maybe he wants
to chip in.

> > Second look at mipi_dbi_command() in include/drm/drm_mipi_dbi.h
> > this is very similar.
>
> Does the ({..}) style blocking used in mipi_dbi_command help workaround
> the semicolon issue I mentioned above?

Nope. But add the rate limited error print please!

> > It's dubious that you always have dsi_dcs_write_seq()
> > followed by dsi_generic_write_seq().
> >
> > That means mipi_dsi_generic_write() followed by
> > mipi_dsi_dcs_write_buffer(). But if you look at these
> > commands in drivers/gpu/drm/drm_mipi_dsi.c
> > you see that they do the same thing!
>
> They almost do the same thing except for the msg.type values? Mostly the
> msg.type value is used to just check whether it's a long or short write
> in the msm dsi_host code. However, in mipi_dsi_create_packet function,
> the msg->type value is used to calculate packet->header[0] as follows:
>
> packet->header[0] = ((msg->channel & 0x3) << 6) | (msg->type & 0x3f);
>
> Wouldn't the difference between the mipi_dsi_dcs_write_buffer's and
> mipi_dsi_generic_write's msg.type values cause issue here?
>
> I tried using mipi_dsi_dcs_write_buffer for all commands and the panel
> worked fine, but I am not sure if it's correct to do so?

I think it's fine? The only issue would be if there is a DSI host controller
that only supports short writes, and in that case it should emulate
long writes by breaking long messages apart. (My amateur view at least.)

> > Lots of magic numbers. You don't have a datasheet do you?
> > So you could #define some of the magic?
>
> Unfortunately, I don't have a datasheet and the power on sequence is
> taken from downstream android dts. It works pretty well though. So I
> don't think I can #define any of these magic.

If you know which display controller the display is using (usually
Novatek nnnnn, Ilitek nnnn etc someting like that) there is often
a datasheet for the display controller available but the display per
se often obscures the display controller.

>  > Doesn't it work to combine them into one call for each
>  > pair?
>  >> +       dsi_dcs_write_seq(dsi, );
>  >> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);
>
> By using a macro? We can... but I am not sure what (0x00, 0x80), (0x00,
> 0xa0),etc type of commands signify without the datasheet, so I am not
> sure what to name them in the macro and make any sensible meaning out of it.

I meant just sending dsi_generic_write_seq() with everything in
it:

dsi_generic_write_seq(dsi, 0x00, 0x80, 0xff, 0x87, 0x19);

Instead of two writes. Doesn't this work?

Yours,
Linus Walleij
