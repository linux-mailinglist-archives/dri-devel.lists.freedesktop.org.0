Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4018B8D88
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BA910E161;
	Wed,  1 May 2024 15:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l7jkV+fE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C3411202D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:57:28 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de4665b4969so7442208276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714579048; x=1715183848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eg8D/K80r70GPeKVeJzvUlTNioKE+UQ27ElJDTct8fc=;
 b=l7jkV+fEs0qGgDxl04rRxWL/BrbE5N8gNxb2ZYUtIOkJKgI0ZT7FG8LQq17R/zMXzT
 cicg5O2TQCp96SW4LCBjFekcCs3cz9prjh4UQXI7dNQSNfCsYTg2xoIDFWyzPs4Z04Vf
 PMIpPsHq0LX4wEBwYxOCx260lbyhT95fsUri5LdxTaVNeoPlYEr6mDNezhK9Kz6hZ3LR
 TuspiMwGyw7ZYAZt8ipI/Ee5HkYhL3srKcGBGyzMEBJ+/hOg1M3nt5L0wqjk/JzsLMMg
 EFFuz9bvAIV1Ws+2Lak5AChTAAnXjJP8aCcPvOfn6jX8g9+3E4m4a3iL8ovVcJem7fd5
 IWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714579048; x=1715183848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eg8D/K80r70GPeKVeJzvUlTNioKE+UQ27ElJDTct8fc=;
 b=QCyLVl8sp5tNpK5aYx22wyWV2tRThJJxelTuCVj06/2l4bOnfADDDuvgyzvEBwac0n
 ylxkHmTdgReXiQTFfxTUAWT7yRoGiKAKev68KieFM+NLbiqIhUgAsdbZwRBkjrCCeAmH
 78KdATUHwSP4OLlHQHB8HB8KN2+ZWG0gC3i8RdV9JlagmMxwe4mgvW1V6YR4qvdGYu5B
 jSsItHV21MGTACe1EHqgy41EKcKfoOv35K1476iFMoLXhtJlnSS4g1htAQYv5dFAut/J
 WpsgVs3MeYfadZqOY6qBYtH+KFeKrUu9VFB6HOByb3ulmfPmgUW0PcDN59y3p6AnOC3q
 P+SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR//xakfHop2ChD7t/DL9y2pdPI40ELzEFh+KzfInDmNFwITQgYZUg7rs9AujFr6tAvNWe6hYmzBJn3/b3a3ifUwtXgT7dgQP5RGBuqwmp
X-Gm-Message-State: AOJu0Yw0ACOQT5HoLkB1dmT0fE6PtzTygDCaBWT4DNO1p2wLw3bovLrv
 c6trU6Z7hwLNwwTk0OCUT61UYbR4gpegukXxtTidmunTTY/bC6q8gMZvjdoXxLzNqFvJlWAbXSl
 xWSAszNO+2ScwAHKrdA7ax6gTbao7kjWN11bvHQ==
X-Google-Smtp-Source: AGHT+IH86QJyeyp567BCwp8BUUZmiXku0Gk/2CGwoI60s7MqsC0CFmX7RnQZ7KksZBZqJhbhph4o/NFIeEggEjh0Icw=
X-Received: by 2002:a25:a2c6:0:b0:de4:6334:5534 with SMTP id
 c6-20020a25a2c6000000b00de463345534mr3234633ybn.63.1714579047482; Wed, 01 May
 2024 08:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
 <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
 <87y18w2n6h.fsf@intel.com>
 <CAD=FV=X5jBqBgOqtm8nYtEKNHcnJgQDWj+ynS5U7KXuQgHLySg@mail.gmail.com>
In-Reply-To: <CAD=FV=X5jBqBgOqtm8nYtEKNHcnJgQDWj+ynS5U7KXuQgHLySg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 18:57:16 +0300
Message-ID: <CAA8EJppMf2nAU_=pZz6eUhasQGEzEnz1_i72pNXBsmE9UgV--Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Wed, 1 May 2024 at 18:49, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Apr 29, 2024 at 8:39=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Mon, 29 Apr 2024, Doug Anderson <dianders@chromium.org> wrote:
> > > Hi,
> > >
> > > On Mon, Apr 29, 2024 at 2:38=E2=80=AFAM Neil Armstrong
> > > <neil.armstrong@linaro.org> wrote:
> > >>
> > >> > +/**
> > >> > + * struct mipi_dsi_multi_context - Context to call multiple MIPI =
DSI funcs in a row
> > >> > + * @dsi: Pointer to the MIPI DSI device
> > >> > + * @accum_err: Storage for the accumulated error over the multipl=
e calls. Init
> > >> > + *   to 0. If a function encounters an error then the error code =
will be
> > >> > + *   stored here. If you call a function and this points to a non=
-zero
> > >> > + *   value then the function will be a noop. This allows calling =
a function
> > >> > + *   many times in a row and just checking the error at the end t=
o see if
> > >> > + *   any of them failed.
> > >> > + */
> > >> > +
> > >> > +struct mipi_dsi_multi_context {
> > >> > +     struct mipi_dsi_device *dsi;
> > >> > +     int accum_err;
> > >> > +};
> > >>
> > >> I like the design, but having a context struct seems over-engineered=
 while we could pass
> > >> a single int over without encapsulating it with mipi_dsi_multi_conte=
xt.
> > >>
> > >> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *=
ctx,
> > >>                                      const void *data, size_t len);
> > >> vs
> > >> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi, in=
t *accum_err,
> > >>                                      const void *data, size_t len);
> > >>
> > >> is the same, and it avoids having to declare a mipi_dsi_multi_contex=
t and set ctx->dsi,
> > >> and I'll find it much easier to migrate, just add a &ret and make su=
re ret is initialized to 0.
> > >
> > > Yeah, I had the same reaction when Jani suggested the context style
> > > [1] and I actually coded it up exactly as you suggest above. I then
> > > changed my mind and went with the context. My motivation was that whe=
n
> > > I tested it I found that using the context produced smaller code.
> > > Specifically, from the description of this patch we see we end up
> > > with:
> > >
> > > Total: Before=3D10651, After=3D9663, chg -9.28%
> > >
> > > ...when I didn't have the context and I had the accum_err then instea=
d
> > > of getting ~9% smaller I believe it actually got ~0.5% bigger. This
> > > makes some sense as the caller has to pass 4 parameters to each call
> > > instead of 3.
> > >
> > > It's not a giant size difference but it was at least some motivation
> > > that helped push me in this direction. I'd also say that when I looke=
d
> > > at the code in the end the style grew on me. It's really not too
> > > terrible to have one line in your functions that looks like:
> > >
> > > struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };
> > >
> > > ...and if that becomes the canonical way to do it then it's really
> > > hard to accidentally forget to initialize the error value. With the
> > > other API it's _very_ easy to forget to initialize the error value an=
d
> > > the compiler won't yell at you. It also makes it very obvious to the
> > > caller that this function is doing something a little different than
> > > most Linux APIs with that error return.
> > >
> > > So I guess I'd say that I ended up being pretty happy with the
> > > "context" even if it does feel a little over engineered and I'd argue
> > > to keep it that way. That being said, if you feel strongly about it
> > > then we can perhaps get others to chime in to see which style they
> > > prefer? Let me know what you think.
> > >
> > >
> > > [1] https://lore.kernel.org/r/8734r85tcf.fsf@intel.com
> >
> > FWIW, I don't feel strongly about this, and I could be persuaded either
> > way, but I've got this gut feeling that an extensible context parameter
> > might be benefitial future proofing in this case.
>
> I've gone ahead and sent out a v3 where I still leave it as taking
> `struct mipi_dsi_multi_context`. Neil: if you feel strongly about it,
> I have no problem sending out a v4. I still think that the size
> savings of using the context are a good "tiebreaking" factor in
> choosing between the two styles... ;-)

I like the idea of context. If later on we need to add additional data
(like DSC PPS or drm_mode), we can simply extend the context
structure.

>
> -Doug



--=20
With best wishes
Dmitry
