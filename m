Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0C8C1BF3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 03:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B072F10E078;
	Fri, 10 May 2024 01:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ld+H7eXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E910E078
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 01:16:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2b5f3e20615so1402524a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 18:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715303774; x=1715908574;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnHzXcqwdMje6zef+rnrR24PpbhWOfPmWy1Mi5rLSKA=;
 b=ld+H7eXJH0+qB3WmuQ2kAkruwhXaip8GB9+T9jAmfUNu9rSeX4MoCwhwJn7ROktWWq
 Alr6L7F0ESg2HR/sXTa6zQk8GDx1WqktAivBu+ZD52NIMu2f0XSdN0ReqDbYMIquVUrZ
 KFt33f/JJGy+3TvLlHRj10qaM2xZ6jccvqTwuRLYjBdA/RR+0xfWG05boq/vXnRTZF4f
 Mi6twN09wYL71A39csymzncZHP4RWmKkliV/ON8SezQYPHE+ICztbmwJ+qVGq6KWSxqA
 E8KOMMDGgFAw1mfzDYcAmckfzJ8MKVeebZDgu8/Kq8+eD7+yKhhM+G7jMMgvf5b8OjhL
 O0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715303774; x=1715908574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnHzXcqwdMje6zef+rnrR24PpbhWOfPmWy1Mi5rLSKA=;
 b=meF25LprPeUNd8mJMjZqnk/ysdyhsNDZWpKYtWfkSpuFwxXtVeQ+Wz6ZJIIN9tMEny
 edP15L+GmOF+C+swJ/ODEDNxuloldHHpEf9Hu5xECRvYYWydMVVBRpr1C2DUiL7/ItxA
 X8MYneAVQ01IhWV5YNZ8wQIfavOrup6U2zbXNkULpEUReIaqjf0W4piNqt/1rSWYzx7+
 WS+L+g6/UIB5QkHTUoaTp+9DaLysfzl9eDGOLrnaEWC6djT41EtWclej+vz8FGRRpSTT
 lKw9btKaeHbtR+7Kx3zXoTgQpCcs5LsIZHQFjxkcGOtwDmZo0EQ2C2Qb37aUPCKqdg0E
 3GGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXsU+oL7VPe9IZqVkHFZ13dCZP+XYEGEC6gK/P9LrJdeITkLiZQe+u6j6XHhBDcrztWQ/uj406MLPR4iX7e6LCSTeV1TUjlEi8N8oXyfPA
X-Gm-Message-State: AOJu0YzkYWgozwUhoqCrPb3XBDDekAmhD8R9hmQgjJWAH2QZI39TRikG
 sh7yFUa8aLd8JxRlRobBIXlFyucuUXK2MeCQCIzjpew0/C5jaPhbTVjuCrLXfmuuXIPa+V6+1BW
 AIU/m2POYTW0+5y8EP8YiQH1GbTVsSzRI3thgnA==
X-Google-Smtp-Source: AGHT+IGieCHyqLLzJXlHoooTGbyYocfx4JUS5UcV50/4kEyYvlHyDg3xZp1atR6QdJzTm0NzVCH90GAqfLme1ElBJTg=
X-Received: by 2002:a17:90a:b38c:b0:29c:5708:b922 with SMTP id
 98e67ed59e1d1-2b6cc76f920mr1355513a91.26.1715303774695; Thu, 09 May 2024
 18:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
 <20240509015207.3271370-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=UaTj_ojJvc2T22e49MhB-zp1+Z_tp9uULS0r8MesUd2Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UaTj_ojJvc2T22e49MhB-zp1+Z_tp9uULS0r8MesUd2Q@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 10 May 2024 09:16:03 +0800
Message-ID: <CAHwB_NKtw0AyMgFb4rMFNgr4WF10o9_0pYvbKpnDM45aYma9zg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=BA=94 00:42=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Wed, May 8, 2024 at 6:53=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > +static int hx83102_enable(struct drm_panel *panel)
> > +{
> > +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +       struct device *dev =3D &dsi->dev;
> > +       int ret;
> > +
> > +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       msleep(120);
> > +
> > +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to turn on the display: %d\n", ret=
);
> > +               return ret;
> > +       }
>
> FWIW, I think that the mipi_dsi_dcs_exit_sleep_mode(), msleep(120),
> and mipi_dsi_dcs_set_display_on() should also be in the prepare() to
> match how they were in the boe-tv101wum-nl6.c driver, right? Then the
> enable() would be left with just the simple "msleep(130)".
>
> I know it doesn't make much difference and it probably doesn't matter
> and maybe I'm just being a little nitpicky, but given that the
> prepare() and enable() functions are unique phases I'd rather be
> explicit if we've moving something from one phase to the other.

Yes, if it is consistent with the boe-tv101wum-nl6.c driver, then it
should be moved to prepare().
However, I was working from the driver readability,
enable() corresponds to 0x11 & 0x29.
disable() corresponds to 0x28 & 0x10.
..
Ok, I'll be happy to send V6 version to fix that, thanks!

>
>
> -Doug
