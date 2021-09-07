Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02348402AA0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 16:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E7D89B62;
	Tue,  7 Sep 2021 14:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E6089B62;
 Tue,  7 Sep 2021 14:20:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1972342wms.5; 
 Tue, 07 Sep 2021 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luXtrlWKkEbo6gjXF9w6MUBaY+hqLwTyeCPULqI28uM=;
 b=YHXK+b0QjOZ3KI9JEdZvhpn79Y0T5XLUjAg8HlQrKoCMv7K0njHk37OW6JZaTCDmPw
 yf6cVpolpIyI6CWd0kX3RdQe505EZl5P8MefLcGpQ/KxFFhN8bavnNCxPvShMtjj/yt0
 N0M/njaoBPlR09ylXg6qgv2++y4DwbPx9f5B0jiKFQTbI7NFxHaNiVt/+Qyij8CHOtjR
 r28nXDT2aLZc0fnt4gdBkmHUIFU88WFXJ8RWm8ak6bqC10cfiliPD1cGrBozKpeqttd5
 TI9z2cv604JjXtp2rAZhpjOZh0WXwIRfP+FSRDTzQ1iXHLG8DWSGbEgIXXGH7tgM347h
 vkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luXtrlWKkEbo6gjXF9w6MUBaY+hqLwTyeCPULqI28uM=;
 b=iJDZrUY08TvFwDDVQfRZeqi9XWucx6xb0aFGcGgEH5Su9LsF2xOPi+n8sGBtGbgQmd
 ZyjCFT4/B+SA0o0M53uWcjyYGdIIs+c9Ri6zxSJh0ph9C0/heFggqMnBL066cB5CHB3l
 pv5dxskkEiyCAhp2qRZ0Gd7dvmB+rFFE0JeJTtvJ3tKiqEvu9zGotTzbU5pS8naUr0dQ
 y9toLfA7HdRC/NjlN72uLiuR+/Nxsqv1d5gcHvZB2wVP2edyK4Mndp5Bn6SIlHTgWRuj
 dFExAJfkCqwhAQMix5XiwyVQ9TOmR/8P2DXUfOvpma7RB/NUiYHINfIsuKOBPMedvDb/
 2YGw==
X-Gm-Message-State: AOAM5313Wz40RZ6WJYYot9F/1Wfd5hCjUWoWAeAcneebXURzNXSVHJey
 Gw4meuSDdsmNdRRjAU4ZPgzFgZZqUNiJ+7v/S14=
X-Google-Smtp-Source: ABdhPJzwsGMId/Rq4xvsxVcYBQDCnhsu9wBa9cuTSDUYpERk5CQpFn6F9+mMs5vCZj5ZOS3gDIbgebsJG2tz0HRcqSk=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr4221369wmr.168.1631024448733; 
 Tue, 07 Sep 2021 07:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com>
 <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
 <CAMi1Hd0dniDXPNOuh05ywqHKY+cGvAsd-cnD91K1GLppfO=x0w@mail.gmail.com>
 <CAF6AEGvtw06MYST2PdhqHVpsG4Tec2DnUA-uwFRP-6xqa9yf5Q@mail.gmail.com>
 <CAMi1Hd1kp8ijH8y3U2sxs5cE3Zfat_v-C3rrGtTK01ry8Om6Lw@mail.gmail.com>
 <CAF6AEGugB5QinhyOxvAiG_V40=mXS20nnqxgk71xe_fmm1iZsw@mail.gmail.com>
 <CAMi1Hd20xd0Lrp0MuKo=HdDPKeNC_DW08iFoF5wseCH5eB=FzQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd20xd0Lrp0MuKo=HdDPKeNC_DW08iFoF5wseCH5eB=FzQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Sep 2021 07:25:07 -0700
Message-ID: <CAF6AEGs-E1fybsxoRONUv8NGTyGohsM_j8A6cfXwoHEK6fOF5A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Amit Pundir <amit.pundir@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, 
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 7, 2021 at 1:25 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Tue, 7 Sept 2021 at 07:11, Rob Clark <robdclark@gmail.com> wrote:
> >
> > One thing I thought of, which would be worth ruling out, is whether
> > this issue only occurs with freq changes immediately after resuming
> > the GPU, vs freq changes in general.  Could you try the below patch.
> > And if it "fixes" the issue, then try reducing the delay until you
> > start seeing GPU hangs again.
>
> It doesn't fix the crash and I can still reproduce it
> https://pastebin.com/raw/bxK4mAhB

Ok, thanks for confirming.  That implies the limitation is about
changing freq in general, rather than immediately after resume.. the
latter could be a new scenario after 9bc95570175a.  But this confirms
that this is an issue that has been there all along.

I'm still not quite sure what the correct fix is

BR,
-R

>
> >
> > ----------
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 40c9fef457a4..278b85207ea3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1513,6 +1513,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
> >   if (ret)
> >   return ret;
> >
> > + msleep(5);
> > +
> >   msm_devfreq_resume(gpu);
> >
> >   a6xx_llc_activate(a6xx_gpu);
> > ----------
> >
> > BR,
> > -R
