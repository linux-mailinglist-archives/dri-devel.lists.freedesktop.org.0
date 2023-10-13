Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2B7C7B9A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 04:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30A510E586;
	Fri, 13 Oct 2023 02:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0678A10E078
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:28:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405459d9a96so39725e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 19:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697164107; x=1697768907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9/YuC6y9eUihKpZ8jmF6NlsO7n14+K0koQ+noy1ggQ=;
 b=0w6F8mfyTvKodbnc803noDEXdQF1FeO2DvUJ6jk04mNgqoRA3YWx3h1bRzdKAI0tgm
 SUlu49g9Id7vSDO+VLLtcwpq1dsxy+snig0LoseP3nhLd9nDZ3fsJGQGCKD8btF4V96l
 is7Ff68SixaccduDKM5SqbvVXTbIt39Ylhbmhhk1vgY1WlrcSZTuY1jjS3qp+K5EBDGN
 5lu61i2aP8CPXLFDW35IsvmJ6WEhsW62na7g9Ap02RALfB7s1BG0WdBP775+6sg8ixCj
 812JltmIzKrP0PsdiudilIv71x/9kvacxfxQZEuJSnBjhuOrtNWtsgqenpdJdqrNIyZ2
 LCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697164107; x=1697768907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9/YuC6y9eUihKpZ8jmF6NlsO7n14+K0koQ+noy1ggQ=;
 b=OUVg4/J42ePABtam5ngZk7afsktJ0cwGMHPOPhc1ZqvHIkIh6Z3qGFEGz6VXQHn1vF
 R9VTWXpHaIwdhHf3w5BWElWHWX7XplDqTDbtrnANSPFS7F8vtk8Fsf9JQikcN/9qhnZT
 zqoETVooaxlu45Rn334c4jDlE4ne/BHLZ3rdt0ALXpPilwoq2Sz5V+lgQP+TKamzVPNE
 jcOiHCJLefRkCS47P1/IFCiUSZ0oKsnWvMSYXPn1FTknq0v8aGRDDLoi6HfIY2R9QlN2
 QtGnPRD3pJH0Q9wSCZ3ZkQTQp6+o91ZKeXQuzupt4SgWNuPRw+CM6pXgKJfUZIb/o17W
 6b3g==
X-Gm-Message-State: AOJu0YxxGomNGqr/XRnqefG56BzbJC9oPR9YsZZeBomOc1a47CskPrTt
 rOGdIWAZrWu7+kndCwtIG68/EBGx4Ibjq36Zye5ulw==
X-Google-Smtp-Source: AGHT+IEu3bheZn/kvrw6MTnB9tzASaTpUw4xRezBw/4fkpa7r55AH2ohLLQYSj1JU+sur8lRAt/zUYM8E4TeV6/Dtk0=
X-Received: by 2002:a05:600c:2102:b0:405:38d1:e146 with SMTP id
 u2-20020a05600c210200b0040538d1e146mr63274wml.4.1697164107120; Thu, 12 Oct
 2023 19:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
 <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
 <CAHwB_NKSL8vHdN8TnQY2Z04E4rDRLK5BHoryZCi2kNAwQEjisQ@mail.gmail.com>
In-Reply-To: <CAHwB_NKSL8vHdN8TnQY2Z04E4rDRLK5BHoryZCi2kNAwQEjisQ@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 12 Oct 2023 19:28:11 -0700
Message-ID: <CAD=FV=VmiS6G25JyAj4UGjU5Q9f80GcjLq1xwU4gdVyzDdk8LQ@mail.gmail.com>
Subject: Re: [v3 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Thu, Oct 12, 2023 at 6:12=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> On Thu, Oct 12, 2023 at 11:15=E2=80=AFPM Doug Anderson <dianders@google.c=
om> wrote:
> >
> > Hi,
> >
> > On Thu, Oct 12, 2023 at 5:10=E2=80=AFAM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > At present, we have found that there may be a problem of blurred
> > > screen during fast sleep/resume. The direct cause of the blurred
> > > screen is that the IC does not receive 0x28/0x10. Because of the
> > > particularity of the IC, before the panel enters sleep hid must
> > > stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> > > If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
> > > touch reset will pull low before panel entersleep, which does not mee=
t
> > > the timing requirements..
> >
> > The above makes me believe that the reset GPIO should be moved out of
> > the input driver and into the panel driver. I could just imagine that
> > the kernel might have some reason it wants to suspend the i2c hid
> > device. If that causes the panel to suddenly start failing then that
> > would be bad... I think we should fix this.
>
> Thanks, I will confirm with ilitek in further analysis and use "move
> the ili9882t_enter_sleep_mode
> function to ili9882t_unprepare".  Is the test failure really because
> the touch reset timing
> does not match? There is also a separate reset GPIO on the panel.
> Shouldn't touch reset not
> affect the panel?
>
> If we find a better solution I will continue upstream,=E3=80=82 So is it
> possible to apply this plan now?

I wouldn't be too upset at applying the current code as long as you're
going to continue to investigate. We can always continue to iterate on
it and having something working reasonably well is better than nothing
at all. However, I probably would wait at least 1 week before applying
any patch from you just simply out of courtesy to give others on the
mailing list time to express their comments. ...presumably we could
get to the bottom of the problem in that 1 week time anyway...

I'm not trying to be an obstinate pain here--I'm merely trying to make
sure that whatever we land will continue to work across kernel uprevs,
even if driver probe order / timing changes in the kernel. If the
panel is really so tied to the touchscreen device's reset GPIO timing
then it worries me. What happens, for instance, if you disable the
touchscreen CONFIG in the kernel? Does the panel still work, or is
that extra reset GPIO totally critical to the functioning of the
panel. If it's totally critical then it probably makes sense to move
to the panel driver given that the touchscreen is a panel follower
anyway...


> > > So in order to solve this problem, the IC
> > > can handle it through the exception mechanism when it cannot receive
> > > 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> > > Refer to vendor detailed analysis [1].
> > >
> > > Ilitek vendor also suggested switching the page before entering sleep=
 to
> > > avoid panel IC not receiving 0x28/0x10 command.
> > >
> > > Note: 0x28 is display off, 0x10 is sleep in.
> > >
> > > [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Pow=
er_Sequence
> > >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 +++++++++++++++++=
+-
> > >  1 file changed, 21 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/=
gpu/drm/panel/panel-ilitek-ili9882t.c
> > > index 93a40c2f1483..54ff1efb94aa 100644
> > > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > @@ -463,6 +463,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t=
 *ili)
> > >         return 0;
> > >  }
> > >
> > > +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page=
)
> > > +{
> > > +       int ret;
> > > +       const struct panel_init_cmd cmd =3D _INIT_SWITCH_PAGE_CMD(pag=
e);
> > > +
> > > +       ret =3D mipi_dsi_dcs_write(dsi, cmd.data[0],
> > > +                                cmd.len <=3D 1 ? NULL :
> > > +                                &cmd.data[1],
> > > +                                cmd.len - 1);
> > > +       if (ret) {
> > > +               dev_err(&dsi->dev,
> > > +                       "error switching panel controller page (%d)\n=
", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
> > >  {
> > >         struct mipi_dsi_device *dsi =3D ili->dsi;
> > > @@ -484,8 +502,10 @@ static int ili9882t_enter_sleep_mode(struct ili9=
882t *ili)
> > >  static int ili9882t_disable(struct drm_panel *panel)
> > >  {
> > >         struct ili9882t *ili =3D to_ili9882t(panel);
> > > +       struct mipi_dsi_device *dsi =3D ili->dsi;
> > >         int ret;
> > >
> > > +       ili9882t_switch_page(dsi, 0x00);
> > >         ret =3D ili9882t_enter_sleep_mode(ili);
> > >         if (ret < 0) {
> > >                 dev_err(panel->dev, "failed to set panel off: %d\n", =
ret);
> > > @@ -546,7 +566,7 @@ static int ili9882t_prepare(struct drm_panel *pan=
el)
> > >         gpiod_set_value(ili->enable_gpio, 1);
> > >         usleep_range(1000, 2000);
> > >         gpiod_set_value(ili->enable_gpio, 0);
> > > -       usleep_range(1000, 2000);
> > > +       usleep_range(50000, 51000);
> >
> > From my previous response, I think the above is better as msleep(50).
>
> Sorry. Will be corrected in V4.

Thanks! It's not a huge deal, but it's nice to fix.

-Doug
