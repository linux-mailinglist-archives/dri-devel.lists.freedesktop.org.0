Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111488B5B09
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 16:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7AF10E614;
	Mon, 29 Apr 2024 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZtLor+Yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4010E614
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 14:13:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4365c1451d4so30901021cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714400008; x=1715004808;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXaUKKpFujkWymSRJKlgkreifFUpxgXsPFgEoLgrUDA=;
 b=ZtLor+YtDVVb26QIWrUjRuTpXl3APUK6lXEBf36vVaqaoGhCUXuv2SK1sg8z7FCLxv
 wJYwohScgarxDUYNQn7xGgi+71LEv/FgvDklgHirPZoT+WZEQWuczkjnVExel4chHf+s
 t1EtlQnn/kavvP2UEvcHSNmZsND1leTjbOurg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714400008; x=1715004808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXaUKKpFujkWymSRJKlgkreifFUpxgXsPFgEoLgrUDA=;
 b=NseKan0oytcSDde/q27nx6qhZmp0SaDSZpmPZBgPclMAEfD+gKYFQQ/MGtvDAdfahR
 cw9FRCseYNttieSl58DU4/CsI1zeGnK41ShHbjhsW/5HiHrVyHXqU/xixug5XBTC0+K2
 KHQoF/nK1H/wMLXq/iIL1wQmmGHKWnYeG/K1KdeFPfV9dO/sh7C2/fBZsmZAZ4uJf0hF
 9Lb/qchBPqZcQg+7pd+IKkvU2WC6UYt2bco+iQecbVBmyyj6GnjqAPKlDMOcgvmAJHra
 TpvKmCgmaCYLz1EByI0pH7TTmuE3VqhqIDCbt5uVkoqZZAm7t8OEs5cIzFNxkbuviltd
 Z/3g==
X-Gm-Message-State: AOJu0Yy9cXAQ7hfIl/IlO3v4Ddv8Lpcd1c8Kd0NT5ClFBxyxMTOEmBny
 4Z7LFl5yvxXIJabnbQWwnS6PMF9ZtGZHhToEOeqgLVQX48sm1NezUmqnLRpacZXgHN53iOmd98A
 =
X-Google-Smtp-Source: AGHT+IFJkozk5OTkwCsn5OkLhcemPB7dA7YafD4WdNJbOiqjKItfz7R2iuxuydaXIEWC94dii2xckA==
X-Received: by 2002:a05:622a:1188:b0:43a:d7a7:7322 with SMTP id
 m8-20020a05622a118800b0043ad7a77322mr4252879qtk.37.1714400007501; 
 Mon, 29 Apr 2024 07:13:27 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac86652000000b00437392f1c20sm10405500qtp.76.2024.04.29.07.13.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 07:13:26 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-439b1c72676so699051cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 07:13:26 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:43a:c278:83f9 with SMTP id
 h9-20020ac87d49000000b0043ac27883f9mr320794qtb.3.1714400005486; Mon, 29 Apr
 2024 07:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <20240427063250.GB1137299@ravnborg.org>
In-Reply-To: <20240427063250.GB1137299@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Apr 2024 07:13:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UN5tWqQvnLRGtk+EVqjEqO6vqtEfaYONkCsze2+539Xw@mail.gmail.com>
Message-ID: <CAD=FV=UN5tWqQvnLRGtk+EVqjEqO6vqtEfaYONkCsze2+539Xw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Joel Selvaraj <jo@jsfamily.in>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, Apr 26, 2024 at 11:33=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wr=
ote:
>
> > ---
> > Right now this patch introduces two new functions in
> > drm_mipi_dsi.c. Alternatively we could have changed the prototype of
> > the "chatty" functions and made the deprecated macros adapt to the new
> > prototype. While this sounds nice, it bloated callers of the
> > deprecated functioin a bit because it caused the compiler to emit less
> > optimal code. It doesn't seem terrible to add two more functions, so I
> > went that way.
> The concern here is when it will be cleaned up. As a minimum please
> consider adding an item to todo.rst that details what should be done
> to get rid of the now obsolete chatty functions so someone can pick it
> up.

Sure, I can add something to do TODO. Do folks agree that's the
preferred way to do things? A few thoughts I had:

1. In theory it could be useful to keep _both_ the "chatty" and
"multi" variants of the functions. In at least a few places the
"multi" variant was awkward. The resulting auo_kd101n80_45na_init()
[1] looked awkward. If I was writing just this function I would have
chosen an API more like the "chatty" one, but since I was trying to
make all the init functions similar I kept them all using the "multi"
API. Does it make sense to keep both long term?

[1] https://lore.kernel.org/all/20240426165839.v2.7.Ib5030ab5cd41b4e08b1958=
bd7e51571725723008@changeid/

2. Going completely the opposite direction, we could also not bother
saving as much space today and _force_ everyone to move to the new
"multi" API to get the full space savings.


So I guess three options: a) leave my patches the way they are and add
a TODO, b) Keep the "chatty" variants long term and remove my
"after-the-cut", or c) Don't get as much space savings today but don't
introduce a new exported function. Opinions?


> > @@ -792,6 +792,34 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_=
device *dsi,
> >  }
> >  EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
> >
> > +/**
> > + * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/=
 accum_err
> > + * @ctx: Context for multiple DSI transactions
> > + * @payload: buffer containing the payload
> > + * @size: size of payload buffer
> > + *
> > + * Like mipi_dsi_generic_write_chatty() but deals with errors in a way=
 that
> > + * makes it convenient to make several calls in a row.
> > + */
> > +void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
> > +                               const void *payload, size_t size)
> > +{
> > +     struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +     struct device *dev =3D &dsi->dev;
> > +     ssize_t ret;
> > +
> > +     if (ctx->accum_err)
> > +             return;
> > +
> > +     ret =3D mipi_dsi_generic_write(dsi, payload, size);
> > +     if (ret < 0) {
> > +             ctx->accum_err =3D ret;
> > +             dev_err_ratelimited(dev, "sending generic data %*ph faile=
d: %d\n",
> > +                                 (int)size, payload, ctx->accum_err);
> > +     }
> I see no point in using ratelimited and then change it in the next
> patch.

Sure, I'll re-order patches.


> > @@ -197,6 +197,22 @@ struct mipi_dsi_device {
> >       struct drm_dsc_config *dsc;
> >  };
> >
> > +/**
> > + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI f=
uncs in a row
> > + * @dsi: Pointer to the MIPI DSI device
> > + * @accum_err: Storage for the accumulated error over the multiple cal=
ls. Init
> > + *   to 0. If a function encounters an error then the error code will =
be
> > + *   stored here. If you call a function and this points to a non-zero
> > + *   value then the function will be a noop. This allows calling a fun=
ction
> > + *   many times in a row and just checking the error at the end to see=
 if
> > + *   any of them failed.
> > + */
> > +
> > +struct mipi_dsi_multi_context {
> > +     struct mipi_dsi_device *dsi;
> > +     int accum_err;
> > +};
> Inline comments is - I think - preferred.

Sure, I'll update in the next version.
