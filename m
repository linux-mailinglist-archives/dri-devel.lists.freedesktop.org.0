Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E627C7C5F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 05:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E3810E587;
	Fri, 13 Oct 2023 03:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190C610E587
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 03:56:04 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-27d1b48e20dso1123278a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 20:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697169363; x=1697774163;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIHLpJzADGVfsixYsPearKAep1jENI5gM5uG8d38gEE=;
 b=DemSvoZ3uW0DVPjMnFa72bzJ5Xvlz6bDgzxn/zXniaSUBLFpferruwG5qKLUHtvMOO
 tU5Aq6JWkJMg0KEMK8VpRrx4f4O0dhL97OIeumbLsNlMxEiv4JlI/gnQo8QhHJpXLuCU
 +wFe9iAWDWSWckLVk2VYaHJt7z0bTvpSG2PcJuPDQK11L8GfMzFosHSsIy/I/FnQDmtS
 mptt3P+iI2ZxOFeHFtwcxQAWUuDkkOnYLSdumhStqW+XRdFFq3S8uzL5Mrrpw/UMTDrJ
 7HxkC/qj9fRQYDNWR34UVnzfpzgU8Bz2Pwg08BF7ezbCnKy75kN8ZOs4F/+g7x1I2wCE
 UUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697169363; x=1697774163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIHLpJzADGVfsixYsPearKAep1jENI5gM5uG8d38gEE=;
 b=euMWTdioNQP8Sgw2ngx4FjhFl2XwNDn5UiXZQIHBFwEGefrpr7WWag5W/Hv2IeAhEp
 pvM2E9pub/A0xBSzIEkS107K/kmcW1wBlBRzTinSoLREZcpt2odoBsJlooLVquZeUCBn
 DaAI2E02TZL40tUrgsnQpdJbNyLx3OgZDPcH9TtkAy9FSbm6s3bwG3kd9CMVnlFTI75R
 4oThUJNfSXxCBKupyuHGHxCaqHak0rh6ydOJuidipDeXNFJBDg+wtucBpDFkSDDdI2Kq
 vu2CCrl4spm3AJUfvf1pHHiU0Hg70ctTiP4j/KOHHl7iiz0BXngOvHhwS8xZLBb54Xbm
 8gZA==
X-Gm-Message-State: AOJu0YyXSuMlSqI9Trvx87GfeIj25WEz+mIUdDVVjUe8JxsS05+xzC4v
 +V1B1t4rwvU3n/NDqAAdVW6Q4R3WxtQKY/o1Nbbntg==
X-Google-Smtp-Source: AGHT+IElj/scEolxQo0Jr+6lqUbHjeByQUChKuIhq69cnRLDSf1j85AU3lUtlFYNeZZTHhzt6IJ/oVftys4qYi+ykX4=
X-Received: by 2002:a17:90b:1050:b0:27c:f4c7:57f with SMTP id
 gq16-20020a17090b105000b0027cf4c7057fmr8017881pjb.35.1697169363541; Thu, 12
 Oct 2023 20:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
 <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
 <CAHwB_NKSL8vHdN8TnQY2Z04E4rDRLK5BHoryZCi2kNAwQEjisQ@mail.gmail.com>
 <CAD=FV=VmiS6G25JyAj4UGjU5Q9f80GcjLq1xwU4gdVyzDdk8LQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VmiS6G25JyAj4UGjU5Q9f80GcjLq1xwU4gdVyzDdk8LQ@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 13 Oct 2023 11:55:52 +0800
Message-ID: <CAHwB_NL_RfLBmAOWqj-9iaUZEg-C2JUUveP1cn4dnR98az0BXQ@mail.gmail.com>
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

On Fri, Oct 13, 2023 at 10:28=E2=80=AFAM Doug Anderson <dianders@google.com=
> wrote:
>
> Hi,
>
> On Thu, Oct 12, 2023 at 6:12=E2=80=AFPM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Hi,
> >
> > On Thu, Oct 12, 2023 at 11:15=E2=80=AFPM Doug Anderson <dianders@google=
.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Oct 12, 2023 at 5:10=E2=80=AFAM Cong Yang
> > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > At present, we have found that there may be a problem of blurred
> > > > screen during fast sleep/resume. The direct cause of the blurred
> > > > screen is that the IC does not receive 0x28/0x10. Because of the
> > > > particularity of the IC, before the panel enters sleep hid must
> > > > stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> > > > If move the ili9882t_enter_sleep_mode function to ili9882t_unprepar=
e,
> > > > touch reset will pull low before panel entersleep, which does not m=
eet
> > > > the timing requirements..
> > >
> > > The above makes me believe that the reset GPIO should be moved out of
> > > the input driver and into the panel driver. I could just imagine that
> > > the kernel might have some reason it wants to suspend the i2c hid
> > > device. If that causes the panel to suddenly start failing then that
> > > would be bad... I think we should fix this.
> >
> > Thanks, I will confirm with ilitek in further analysis and use "move
> > the ili9882t_enter_sleep_mode
> > function to ili9882t_unprepare".  Is the test failure really because
> > the touch reset timing
> > does not match? There is also a separate reset GPIO on the panel.
> > Shouldn't touch reset not
> > affect the panel?
> >
> > If we find a better solution I will continue upstream,=E3=80=82 So is i=
t
> > possible to apply this plan now?
>
> I wouldn't be too upset at applying the current code as long as you're
> going to continue to investigate. We can always continue to iterate on
> it and having something working reasonably well is better than nothing
> at all. However, I probably would wait at least 1 week before applying
> any patch from you just simply out of courtesy to give others on the
> mailing list time to express their comments. ...presumably we could
> get to the bottom of the problem in that 1 week time anyway...
>
> I'm not trying to be an obstinate pain here--I'm merely trying to make
> sure that whatever we land will continue to work across kernel uprevs,
> even if driver probe order / timing changes in the kernel. If the
> panel is really so tied to the touchscreen device's reset GPIO timing
> then it worries me. What happens, for instance, if you disable the
> touchscreen CONFIG in the kernel? Does the panel still work, or is
> that extra reset GPIO totally critical to the functioning of the
> panel. If it's totally critical then it probably makes sense to move
> to the panel driver given that the touchscreen is a panel follower
> anyway...

Thanks. It looks like the panel works fine after I disable the touch screen
device. So the panel may not depend on touch screen reset.
Need to continue investigating the root cause for current status.

>
>
> > > > So in order to solve this problem, the IC
> > > > can handle it through the exception mechanism when it cannot receiv=
e
> > > > 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> > > > Refer to vendor detailed analysis [1].
> > > >
> > > > Ilitek vendor also suggested switching the page before entering sle=
ep to
> > > > avoid panel IC not receiving 0x28/0x10 command.
> > > >
> > > > Note: 0x28 is display off, 0x10 is sleep in.
> > > >
> > > > [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_P=
ower_Sequence
> > > >
> > > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 +++++++++++++++=
+++-
> > > >  1 file changed, 21 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/driver=
s/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > > index 93a40c2f1483..54ff1efb94aa 100644
> > > > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > > @@ -463,6 +463,24 @@ static int ili9882t_init_dcs_cmd(struct ili988=
2t *ili)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 pa=
ge)
> > > > +{
> > > > +       int ret;
> > > > +       const struct panel_init_cmd cmd =3D _INIT_SWITCH_PAGE_CMD(p=
age);
> > > > +
> > > > +       ret =3D mipi_dsi_dcs_write(dsi, cmd.data[0],
> > > > +                                cmd.len <=3D 1 ? NULL :
> > > > +                                &cmd.data[1],
> > > > +                                cmd.len - 1);
> > > > +       if (ret) {
> > > > +               dev_err(&dsi->dev,
> > > > +                       "error switching panel controller page (%d)=
\n", ret);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
> > > >  {
> > > >         struct mipi_dsi_device *dsi =3D ili->dsi;
> > > > @@ -484,8 +502,10 @@ static int ili9882t_enter_sleep_mode(struct il=
i9882t *ili)
> > > >  static int ili9882t_disable(struct drm_panel *panel)
> > > >  {
> > > >         struct ili9882t *ili =3D to_ili9882t(panel);
> > > > +       struct mipi_dsi_device *dsi =3D ili->dsi;
> > > >         int ret;
> > > >
> > > > +       ili9882t_switch_page(dsi, 0x00);
> > > >         ret =3D ili9882t_enter_sleep_mode(ili);
> > > >         if (ret < 0) {
> > > >                 dev_err(panel->dev, "failed to set panel off: %d\n"=
, ret);
> > > > @@ -546,7 +566,7 @@ static int ili9882t_prepare(struct drm_panel *p=
anel)
> > > >         gpiod_set_value(ili->enable_gpio, 1);
> > > >         usleep_range(1000, 2000);
> > > >         gpiod_set_value(ili->enable_gpio, 0);
> > > > -       usleep_range(1000, 2000);
> > > > +       usleep_range(50000, 51000);
> > >
> > > From my previous response, I think the above is better as msleep(50).
> >
> > Sorry. Will be corrected in V4.
>
> Thanks! It's not a huge deal, but it's nice to fix.
>
> -Doug
