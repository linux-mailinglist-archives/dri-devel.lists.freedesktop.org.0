Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19188B3BDE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7F10F07B;
	Fri, 26 Apr 2024 15:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gf5vueX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37510F07B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:42:37 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de45385a1b4so2136774276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714146157; x=1714750957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1r/qRH9kPvAGgkQEMeuJ0NKJrHsmyltgKmm0PUhotBc=;
 b=Gf5vueX/dywcRC7+McpipNTCKmLZquSKHy+m0Fy/phlxzLl/IcCHuYnZCfhxPZGpa9
 Wf6HeH56n2jMkLPiAaABT/pXsGxKESzNlirfjLIZvbq+8xmo6gpHVKIJXTiWAKL/n5ll
 HCmvRogOKdMXbYlAcXRjEQj66CbR9kJTABemC4znifeg9EynMYLJ8UlpqjDIDdS9Xkqv
 k673D2uk4qQ8eCBqRyKPVs++Sw0cxavIKsXAuKrSKuHDsBagh+fYy7XwIXNW21+/xEsQ
 seXiFc/jpEVCb4enDNPv6Xv+lL9kxbOQhXmVeMoFVmXwGWJDc/yNnIePQ5pHkcqWQO71
 puAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714146157; x=1714750957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1r/qRH9kPvAGgkQEMeuJ0NKJrHsmyltgKmm0PUhotBc=;
 b=PcmQeInDcswROuL4x3a+Wzq669jwJJmVbDPmMQ2/j2NopnibIFZ1tVr28AfSXnIe5c
 OHeNcA1PIBLKekk/4caduCRHVWXkwkPnOK8HlBYGq/O7P5vQ5XjXfP2gQ5+S1nhUmL2S
 3ibg81owfyUjE5pOCOW6CbpoK1I5pQLRNEWlJdSPy3/rL1HwVtZ7POzZpEJa45P+sHvj
 MvXpTZIPs7Xa/mL/tzmAWmYA1a0S3KZQslIGdfvKBSIYOT0Ux2UUlJ/PPVx5f6rnvOtF
 zzz7hdXAl0qzQcgWWDkD4qh+sw3qiDyGV2jq6kDMPuUvcbP+QY4+Iaof3tLyu1utHis/
 3Zhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjP5l0yoLqV5HPT22G65/eht9gv3UY4x+lnOJMw7epfbQasSjcCQgCo9/uWpdMOr4JX4jP67JKOfhaved524gukMCaDE/ol1W/X5R2sur1
X-Gm-Message-State: AOJu0Ywt0jhshDxx751x+KZwSg8s0EDJ88La8AVvRu1ajHYHBp0CYk5H
 m+VJmqqlVo7oVSFtfdBf6Ct0sl1DlM5V8vk9aV3nmrXRowuKJsRklywy6r0X195amBpsvYczlGN
 KhN94TsHQ7s51Gt9GgooVsSXeLH5+9jphsVIbbA==
X-Google-Smtp-Source: AGHT+IHXqiLVi5dGGByxbmqNOLy8Bm6k1zPc3+mbxHwesdXyWEV5jekoYy/P2rzj/Dz7Gdb0KBXe5GlRkEgu/X9acRQ=
X-Received: by 2002:a05:6902:1b84:b0:dd1:2f58:6a2e with SMTP id
 ei4-20020a0569021b8400b00dd12f586a2emr3667726ybb.9.1714146156805; Fri, 26 Apr
 2024 08:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
 <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
 <beqsovvdkvn63prt3c6b3epb6tachff35vpaf62dfkwof7kwht@u3p7bkv7owro>
 <CAD=FV=WxYoFYefdZ4PQ=QF5aHpeWoC3qM1b5d2vf_qBH90ZMQw@mail.gmail.com>
In-Reply-To: <CAD=FV=WxYoFYefdZ4PQ=QF5aHpeWoC3qM1b5d2vf_qBH90ZMQw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 18:42:25 +0300
Message-ID: <CAA8EJpodW+VjUzBh1VLC2OeUaMhoX7FgNrsNStq5rPbOnyp95g@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linus.walleij@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang <hsinyi@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
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

On Fri, 26 Apr 2024 at 18:41, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 25, 2024 at 8:03=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Apr 25, 2024 at 10:04:49AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Apr 25, 2024 at 1:19=E2=80=AFAM Jani Nikula <jani.nikula@linu=
x.intel.com> wrote:
> > > >
> > > > > @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
> > > > >
> > > > >  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
> > > > >                                 const void *data, size_t len);
> > > > > +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device =
*dsi,
> > > > > +                                      const void *data, size_t l=
en);
> > > > >  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
> > > > >                          const void *data, size_t len);
> > > > >  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, v=
oid *data,
> > > > > @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_lar=
ge(struct mipi_dsi_device *dsi,
> > > > >  #define mipi_dsi_generic_write_seq(dsi, seq...)                 =
               \
> > > > >       do {                                                       =
            \
> > > > >               static const u8 d[] =3D { seq };                   =
              \
> > > > > -             struct device *dev =3D &dsi->dev;                  =
              \
> > > > >               int ret;                                           =
            \
> > > > > -             ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d=
));           \
> > > > > -             if (ret < 0) {                                     =
            \
> > > > > -                     dev_err_ratelimited(dev, "transmit data fai=
led: %d\n", \
> > > > > -                                         ret);                  =
            \
> > > > > +             ret =3D mipi_dsi_generic_write_chatty(dsi, d, ARRAY=
_SIZE(d));    \
> > > > > +             if (ret < 0)                                       =
            \
> > > > >                       return ret;                                =
            \
> > > > > -             }                                                  =
            \
> > > > >       } while (0)
> >
> >
> > Reading the thread makes me wonder whether we should be going into
> > slightly other direction:
> >
> > Add __must_check() to mipi_dsi_ writing functions,
> >
> > #define mipi_dsi_dcs_whatever_write(dsi, cmd, seq...)   \
> >         ({                                              \
> >                 static const u8 d[] =3D { cmd, seq };     \
> >                 mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> >         })
> >
> > Then in panel drivers we actually have to explicitly handle the return
> > code (either by dropping to the error label or by just returning an
> > error).
>
> Given the sheer number of init commands needed by some panels (see
> j606f_boe_init_sequence() for instance) I'm still convinced that we
> want something that allows people to write their init code in a way
> that's not quite so verbose. It sounds as if Jani is OK w/ the
> proposal of using the "accumulated return value" (proposal #2 I had).
> I'm hoping you're OK w/ that too...

Yes, I'm fine with that.

--=20
With best wishes
Dmitry
