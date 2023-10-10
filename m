Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349637BF9DB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E5810E1D9;
	Tue, 10 Oct 2023 11:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903A10E1D9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:36:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3b0dcbf3672so648455b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696937776; x=1697542576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqt1li5npzbMPmUrjQpxaenaIH2mnyz+ZsNA//4Hc1E=;
 b=y/hgz1f7FOMx5B0pTH+UDblbYbiKaTfsR6ijU4uD5l8dZGdp7hb51UnK1zxAQhYCyr
 73q0FaW6GJ0dNgtkDPncetsGndGXFKM8Zf9wvEPVxVI2tngutbfb1DZsriScKwDtuR+0
 eHf/3XXzYyf8IJJDAJ25W4VcxbC8PleirkKD0UAPHgw4n83VijtYhfiOFeAzDOy6JCjw
 rSZQXNDxwndJGQv5ZNVx0KDdIQOAV6O9XPfP9utJZ/+IP5/Qt3Adc3XtL/PGy+GWtX9X
 hbAoLUcNFtG7FiCMhw4CjOhxwr7GJtylqGimfXIg8Jt+wUgQJYTLdtxZiaRF+2GPTcGH
 6auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696937776; x=1697542576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqt1li5npzbMPmUrjQpxaenaIH2mnyz+ZsNA//4Hc1E=;
 b=rpa58I6Iuyjtg6+NsNvUCTTD0X+WIoVN/BErzKJG8h2Aa/nPvWb21L0uu+1FjgHCYj
 MzJclS3MaOjy+vLTSeNbKylh5dxzWVgGOSWY1gmY7gylvP2k+X658EAz67sx0PaQWud/
 Vp2ggzf9hqVLgLFciuNRL8TCg5iDdIFhs+0RUpaMjr72Wmb4y2JEUjk5fXuosck0U09a
 Yo+D73CFnNq6pFHI8loDgc7jyPk9ex/nkoOnpF4aM0Sg0C3lCWOY2xq01652+4qoyQ9j
 EmvxMhqXexpgAsDsySGOxKp08EKPm4X4qcMTo0wk8USlDmN4ITfGKK3wcGgHD4s8PRSI
 V7/g==
X-Gm-Message-State: AOJu0YzC/DKlTOxGp0b0RAKz069dWmmPYVDTfH3PdO0LRW1kiD1gG2Qw
 KeQVAqWU8AMoIZZh2XFZdTKLGyqTnBazcSlaIIDgjQ==
X-Google-Smtp-Source: AGHT+IF6PQHUp+2decfVNVGCfI2Ki3R4/iuCCfsMaLJgDhaNhJCQObl0/R9wqaoh8xJssd8PKVUcrtCY59CI6aFxsAg=
X-Received: by 2002:a05:6358:88f:b0:143:61d:ffd3 with SMTP id
 m15-20020a056358088f00b00143061dffd3mr20923846rwj.4.1696937776108; Tue, 10
 Oct 2023 04:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
In-Reply-To: <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 10 Oct 2023 19:36:04 +0800
Message-ID: <CAHwB_N+=h8-5H6SM8REAge19SgLvrZD=drAP83QnSuuqB5gN8A@mail.gmail.com>
Subject: Re: [v1 2/2] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 10, 2023 at 4:44=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Fri, Oct 6, 2023 at 11:07=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > At present, we have found that there may be a problem of blurred
> > screen during fast sleep/resume. The direct cause of the blurred
> > screen is that the IC does not receive 0x28/0x10. Because of the
> > particularity of the IC, before the panel enters sleep hid must
> > stop scanning, i2c_hid_core_suspend before ili9882t_disable.
> > This doesn't look very spec-compliant.
>
> Presumably you could be more spec compliant if we used
> "panel_follower" in this case? Would that be a better solution?

In the "panel_follower" solution, the phenomenon is the same.
The current order is
ili9882t_disable=3D>i2c_hid_core_suspend=3D>elan_i2c_hid_power_down=3D>ili9=
882t_unprepare,
ili9882t need touchpanel stop scanning,i2c_hid_core_suspend before
ili9882t_disable.
>
>
> > So in order to solve this
> > problem, the IC can handle it through the exception mechanism when
> > it cannot receive 0X28/0X10 command. Handling exceptions requires a res=
et
> > 50ms delay. Refer to vendor detailed analysis [1].
> >
> > Ilitek vendor also suggested switching the page before entering sleep t=
o
> > avoid panel IC not receiving 0x28/0x10 command.
> >
> > Note: 0x28 is display off, 0x10 is sleep in.
> >
> > [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power=
_Sequence
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 21 ++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9882t.c
> > index bbfcffe65623..0a1dd987b204 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > @@ -423,6 +423,23 @@ static inline struct ili9882t *to_ili9882t(struct =
drm_panel *panel)
> >         return container_of(panel, struct ili9882t, base);
> >  }
> >
> > +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
> > +{
> > +       u8 switch_cmd[] =3D {0x98, 0x82, 0x00};
>
> Can't you just replace the last 0x00 above with "page" and get rid of
> the manual assignment below?
>
>
> > +       int ret;
> > +
> > +       switch_cmd[2] =3D page;
> > +
> > +       ret =3D mipi_dsi_dcs_write(dsi, ILI9882T_DCS_SWITCH_PAGE, switc=
h_cmd, 3);
>
> Instead of hardcoding 3, should use ARRAY_SIZE().
>
>
> > +       if (ret) {
> > +               dev_err(&dsi->dev,
> > +                       "error switching panel controller page (%d)\n",=
 ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
>
> optional: It feels like it would be nice to somehow use the
> "_INIT_SWITCH_PAGE_CMD" macro I suggested in patch #1 instead of
> having to hardcode 0x98, 0x82 again. In patch #1 I already suggested
> breaking out the function to send a sequence of commands. If you had
> that function take a pointer instead of hardcoding it to look at
> ->init_cmds then you could probably use the same function that you do
> at init time?
>
>
> >  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
> >  {
> >         struct mipi_dsi_device *dsi =3D ili->dsi;
> > @@ -444,8 +461,10 @@ static int ili9882t_enter_sleep_mode(struct ili988=
2t *ili)
> >  static int ili9882t_disable(struct drm_panel *panel)
> >  {
> >         struct ili9882t *ili =3D to_ili9882t(panel);
> > +       struct mipi_dsi_device *dsi =3D ili->dsi;
> >         int ret;
> >
> > +       ili9882t_switch_page(dsi, 0x00);
> >         ret =3D ili9882t_enter_sleep_mode(ili);
> >         if (ret < 0) {
> >                 dev_err(panel->dev, "failed to set panel off: %d\n", re=
t);
> > @@ -507,7 +526,7 @@ static int ili9882t_prepare(struct drm_panel *panel=
)
> >         gpiod_set_value(ili->enable_gpio, 1);
> >         usleep_range(1000, 2000);
> >         gpiod_set_value(ili->enable_gpio, 0);
> > -       usleep_range(1000, 2000);
> > +       usleep_range(40000, 50000);
>
> nit: use 40000, 41000 instead of 40000, 50000. Linux almost always
> uses the longer delay, so that'll save ~9 ms. The only reason for the
> range is to optimize kernel wakeups which is really not a concern
> here.

We need 50ms delay to meet the requirement.
