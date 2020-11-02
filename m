Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F72A3702
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 00:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19CA6E588;
	Mon,  2 Nov 2020 23:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6F86E57A;
 Mon,  2 Nov 2020 23:14:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 23so2009573wmg.1;
 Mon, 02 Nov 2020 15:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yd/yHPwpX3j/PkBKgMI4UlExzusZQuxmftwkBiDfwd0=;
 b=Hp/PzG2nBC1gTiutjecqG6sDMBWHpgxt68CWrv7FKoC2KpclVQi5DiALbyOH/UcWEE
 pQXKbYe/q6R7+nfsAwBRSWgf6LEXMHlbzywmE9ffoTe5xjvyaVB9nGgsq4MnnZnf3F7s
 wOPYrOWMdoiPXfr+yVkOhf3z5JyZm0BSSJFj2WGltz5ZwHfd3v6p8bAs2G/TfvXs1wEA
 tKbJBU1HxsqBWxSZc/HBWRLZWDFDclhHUrPTST+38gO/i9jnWdaBaEQ6qQp7T/bCml11
 G5ahd5unJCmCcd0EL39PVQDFmIUVJQKmFjLpOUCpt4LGTRpkOg0yVog98tDRygh2Xky1
 aMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd/yHPwpX3j/PkBKgMI4UlExzusZQuxmftwkBiDfwd0=;
 b=Fy7FoOXK9wuwZdumvShSRhIoIASP/Yv316JkpQ8my/FYgDzNkP7B8JUg7+9eOnHHa5
 nrNo0RPZ52OgyMRdj+RJ0rkwaWy6m4jsxO2SvCSWhoiOKxHUzogxv1v9X8Td7XMIhJNM
 Kj6GMXatzEOdE8m2oyn4baeeqTO3MjbKYnf8Z39OhroochtjvWh07CwhTizdO4XAa1wQ
 ozcoYtj8+HZ0+h7qYm2LPWbL+rWOikj/vSSSuVClBDrdwHzn0JQcJUKGrQYi5A+a8t9g
 poPsHNUK3RKXdmNqOwQve7F3CByng+2HEGrlUon4DdW2tAg3fHBGCeZeYfMZIYHDROcy
 VmqA==
X-Gm-Message-State: AOAM532E33mUtH19u2o5sQIdmsDNK4tUCBsKrqERJATErcpLNX/1Bgkw
 29HH5X/UA7tEn1FTap8juxgJuCAgBUe0BCzwfKQ=
X-Google-Smtp-Source: ABdhPJwIDGZ0F593ZCG0Vdco3dS8P/GZ41McoEEBcPXuBq07neKqHo16c1wS1lmeymA//w36H1H4T5Bb6rszi0gxHKE=
X-Received: by 2002:a1c:8194:: with SMTP id c142mr440404wmd.94.1604358880548; 
 Mon, 02 Nov 2020 15:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20201030232324.11170-1-khsieh@codeaurora.org>
 <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
In-Reply-To: <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Nov 2020 15:16:13 -0800
Message-ID: <CAF6AEGu9pbRxncwVyRt9q=Gw1yOggj7Jg_zd+Y-rMZD=khmatw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: promote irq_hpd handle to handle link
 trainign correctly
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>, aravindh@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 11:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Subject has a typo in "training".
>
> Quoting Kuogee Hsieh (2020-10-30 16:23:24)
> > Some dongles, such as Apple, required link training done at irq_hpd
>
> s/required/require/
>
> > request instead of plugin request. This patch promote irq_hpd hanlder
>
> s/hanlder/handler/
>
> > to handle link training and setup hpd_state correctly.
> >
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
>
> Any Fixes tag?
>
> >  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 13b66266cd69..55627530957c 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -483,10 +485,24 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
> >                 return -ENODEV;
> >         }
> >
> > +       hpd = dp->usbpd;
> > +
> >         /* check for any test request issued by sink */
> >         rc = dp_link_process_request(dp->link);
> > -       if (!rc)
> > -               dp_display_handle_irq_hpd(dp);
> > +       if (!rc) {
> > +               sink_request = dp->link->sink_request;
> > +               if (sink_request & DS_PORT_STATUS_CHANGED) {
> > +                       dp->hpd_state = ST_CONNECT_PENDING;
> > +                       hpd->hpd_high = 1;
> > +               }
> > +
> > +               rc = dp_display_handle_irq_hpd(dp);
> > +
> > +               if (rc && sink_request & DS_PORT_STATUS_CHANGED) {
>
> Can you add parenthesis around this?
>
>                 if (rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
>
>
> I honestly don't know what's going on in this patch. It talks about
> making link training happen during irq hpd handler but this is the
> attention handler and we're checking port status changed? This is
> related? The code is really not clear.
>
> > +                       hpd->hpd_high = 0;
> > +                       dp->hpd_state = ST_DISCONNECTED;
> > +               }
> > +       }
> >
> >         return rc;
> >  }
> >
> > base-commit: 0e162b10644605428cd2596c12f8ed410cf9d2d9
>
> What commit is this?

Note that I skipped over a few dp related patches yesterday while
starting to pull things into msm-next-staging.

Kuogee, when you send the next version can you make sure it is based
against v5.10-rc or msm-next-staging?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
