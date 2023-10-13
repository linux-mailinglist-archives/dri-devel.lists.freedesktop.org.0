Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD9B7C7B11
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 03:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9838110E02D;
	Fri, 13 Oct 2023 01:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0DA10E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 01:12:00 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-27cfb84432aso1168162a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697159519; x=1697764319;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRkrBo0/H4M28ioavqjEK2u4W4xG7+8r5X5sl8HE0gQ=;
 b=s3D3LKXSXX44dVwFuLvr2vVHFWFNGwpiuEk+PhbjhW7pteREe1Puu7nwWD2UlTN2at
 JWD8T83kms6FDLpn4cFmbr6HbEkCp8rDLsW6menlh1MJGcnsjLefDFBQpqzCAWYwPlXh
 5k85HmPdzHicjaIN8nN3Qu+lxBdo5C8L0rTnAwerPMeOHjZd65HXGgfwiYdsI5aatm2A
 GmECqed0BaZpV4d19UxgCDUhpAY+mqQmonCyo+KG/UEzNuVpbL/y9d+GfdBrw9HcXKEi
 IG4XVomLer5ffJRkX/Ewf8krJONvEaCoAYGREjWEycPtYI1fCBKlU+n5IG5DuVLT6U7X
 81KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697159519; x=1697764319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRkrBo0/H4M28ioavqjEK2u4W4xG7+8r5X5sl8HE0gQ=;
 b=rw5FJXdMynExh4ysofl6dO5fBKPbcCklZcoisx+RHdQB/8SAEC1fdk3O8Mk0wktWga
 KYjkJXTvZUPcGs5kFAWlz8lxKluhUKu3gApkgpOeEgRR/Tw/OJF1M/kjR2W7iUZOXnvB
 /U68SJba+0RBiy92+sQbhgDQqdT3bqbg3ekUz6DAKzxr9l/j48ECErvNQxou44W7Mj6Q
 mUZPd7UUhQ/10N1SNUN5MSXCWcl8YmIDSTAqKx2ArL40gp8VzpThVwL91LCHY90+/oBs
 qUO/SxbumaHf5T/7feSGPICX8Gy7XziWmwBKgQ08Rlwku3rFRg80hAPJi/NwwrVyj44j
 JByQ==
X-Gm-Message-State: AOJu0YxicTL3m4poTU+lNiQ8MCdhkJaEXwNAYNuLxcdZsSsCJcWDYjXB
 NbDjQCQf3ZXk5zvzjN8kwZrq13cAkeOHec/9MDj493Zb6P36r2I9lDr2yw==
X-Google-Smtp-Source: AGHT+IGhgp3EzVpUA8B6w/gxz5O9e1za9Jflwg5ZlDlkn+ruHgj0d5IhyGum8GDTbU5w5S7kQboXjOfyqigfiyl+Dh0=
X-Received: by 2002:a17:90a:709:b0:27d:32d8:4683 with SMTP id
 l9-20020a17090a070900b0027d32d84683mr950494pjl.5.1697159519588; Thu, 12 Oct
 2023 18:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
 <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
In-Reply-To: <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 13 Oct 2023 09:11:48 +0800
Message-ID: <CAHwB_NKSL8vHdN8TnQY2Z04E4rDRLK5BHoryZCi2kNAwQEjisQ@mail.gmail.com>
Subject: Re: [v3 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 12, 2023 at 11:15=E2=80=AFPM Doug Anderson <dianders@google.com=
> wrote:
>
> Hi,
>
> On Thu, Oct 12, 2023 at 5:10=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > At present, we have found that there may be a problem of blurred
> > screen during fast sleep/resume. The direct cause of the blurred
> > screen is that the IC does not receive 0x28/0x10. Because of the
> > particularity of the IC, before the panel enters sleep hid must
> > stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> > If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
> > touch reset will pull low before panel entersleep, which does not meet
> > the timing requirements..
>
> The above makes me believe that the reset GPIO should be moved out of
> the input driver and into the panel driver. I could just imagine that
> the kernel might have some reason it wants to suspend the i2c hid
> device. If that causes the panel to suddenly start failing then that
> would be bad... I think we should fix this.

Thanks, I will confirm with ilitek in further analysis and use "move
the ili9882t_enter_sleep_mode
function to ili9882t_unprepare".  Is the test failure really because
the touch reset timing
does not match? There is also a separate reset GPIO on the panel.
Shouldn't touch reset not
affect the panel?

If we find a better solution I will continue upstream,=E3=80=82 So is it
possible to apply this plan now?

>
>
> > So in order to solve this problem, the IC
> > can handle it through the exception mechanism when it cannot receive
> > 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> > Refer to vendor detailed analysis [1].
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
> >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9882t.c
> > index 93a40c2f1483..54ff1efb94aa 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > @@ -463,6 +463,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t *=
ili)
> >         return 0;
> >  }
> >
> > +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
> > +{
> > +       int ret;
> > +       const struct panel_init_cmd cmd =3D _INIT_SWITCH_PAGE_CMD(page)=
;
> > +
> > +       ret =3D mipi_dsi_dcs_write(dsi, cmd.data[0],
> > +                                cmd.len <=3D 1 ? NULL :
> > +                                &cmd.data[1],
> > +                                cmd.len - 1);
> > +       if (ret) {
> > +               dev_err(&dsi->dev,
> > +                       "error switching panel controller page (%d)\n",=
 ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
> >  {
> >         struct mipi_dsi_device *dsi =3D ili->dsi;
> > @@ -484,8 +502,10 @@ static int ili9882t_enter_sleep_mode(struct ili988=
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
> > @@ -546,7 +566,7 @@ static int ili9882t_prepare(struct drm_panel *panel=
)
> >         gpiod_set_value(ili->enable_gpio, 1);
> >         usleep_range(1000, 2000);
> >         gpiod_set_value(ili->enable_gpio, 0);
> > -       usleep_range(1000, 2000);
> > +       usleep_range(50000, 51000);
>
> From my previous response, I think the above is better as msleep(50).

Sorry. Will be corrected in V4.
