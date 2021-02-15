Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4D31BA75
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 14:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC04B6E049;
	Mon, 15 Feb 2021 13:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0D46E049
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 13:39:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d3so10161461lfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 05:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6BYM7OU0X4+Ts4eFgjt8GD7MgdkB7+S8N/2hO3q/EQk=;
 b=B5NjPd3fxq3T05A6xMJSvu95blwBsJCgv/FK+EcPVE7msEJw9Teo/OH48R/uXfz2vx
 UYTz9zIGv7XY8oxe1FFJfKZsb9VaydeUz++xLCGZJYtG3f7V1idY00kBc1a/SpxDX2Pr
 08BEfxmjMcp3dHUMIkTC/a6/X6LGxs1aNfOEaLd5PEfnfQ8nTkdriIonq/gRQVlx9LOM
 WbzAeqpZ3BkWNE3Ajb3ME8al+UQLE3iI18UDHwkOMB+V/tbU192cMC21jukw4k3u5g0m
 epInkQyukKGGrns69s+ojLAHHeBJWduXAfLjxcPpdHmCkTRgKTs56mTtFfJd7G/JrWxH
 rn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6BYM7OU0X4+Ts4eFgjt8GD7MgdkB7+S8N/2hO3q/EQk=;
 b=p9j1YaZV6YC0dGSS+kGiFbVOgKRUvn+braybmEW7HFfw3rh+myLNBGUaeNHEIwRY6D
 4acn1Vkkq9mXwLkaTF3dzXD7ZbwDE3q8t9q9m25TVXcvhWkFMjEqVMVl2PVqAIfjfF0q
 NRxZ2ufXX7F3e5yuwpJS6jGQQ3VoloNmLvXyzMeMaflOhZmTD2Loa1twYf4gg9ml/kAR
 8jKwR/0YGYOduCcOSikQSDk4StN1XsXASccenlJKPI/ThCqJOxEX5n8vcokhc5303SmF
 Qi3Nke6uztp6o/xUfTKAggMYZT5lcmK/20s7SQw1zZWqpcUmhDhWes4LT+Oeq5z/wOpK
 5WRg==
X-Gm-Message-State: AOAM531z/tKfzAtzZgUUUkuGEF/s1M06yQoN81CM0Whfrj/4Zydp8Gl4
 jT+gZ3uP7ColW0xqwaAssTQdLg2gd+ByyV77s6s=
X-Google-Smtp-Source: ABdhPJwE/WKjc/fkUcHrXwy8je/n46qRIabOn4VzngTagIEsxA1RmF1H9YMQNFX0DAzZOTryZx7raOM0Z6HcGRWrBT4=
X-Received: by 2002:a05:6512:10c5:: with SMTP id
 k5mr8526324lfg.583.1613396355133; 
 Mon, 15 Feb 2021 05:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20210119231341.2498036-1-festevam@gmail.com>
 <CAOMZO5AekLMhN6+itpaROqOdmE3mV-Z8yKoCRcyNxPoW7tqPuw@mail.gmail.com>
In-Reply-To: <CAOMZO5AekLMhN6+itpaROqOdmE3mV-Z8yKoCRcyNxPoW7tqPuw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Feb 2021 10:39:03 -0300
Message-ID: <CAOMZO5C8a4cj+zZixjMYArgnki0DzAJdyZ3yh9rHW8abx8Dx=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: Call shutdown conditionally
To: Rob Clark <robdclark@gmail.com>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, stable <stable@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, kalyan_t@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle ping...

On Fri, Jan 29, 2021 at 8:09 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> Any comments on this series, please?
>
> On Tue, Jan 19, 2021 at 8:15 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Issuing a 'reboot' command in i.MX5 leads to the following flow:
> >
> > [   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
> > (commit_tail+0xa4/0x1b0)
> > [   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
> > (drm_atomic_helper_commit+0x154/0x188)
> > [   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
> > [<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
> > [   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
> > [<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
> > [   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from
> >
> > In the i.MX5 case, priv->kms is not populated (as i.MX5 does not use any
> > of the Qualcomm display controllers), causing a NULL pointer
> > dereference in msm_atomic_commit_tail():
> >
> > [   24.268964] 8<--- cut here ---
> > [   24.274602] Unable to handle kernel NULL pointer dereference at
> > virtual address 00000000
> > [   24.283434] pgd = (ptrval)
> > [   24.286387] [00000000] *pgd=ca212831
> > [   24.290788] Internal error: Oops: 17 [#1] SMP ARM
> > [   24.295609] Modules linked in:
> > [   24.298777] CPU: 0 PID: 197 Comm: init Not tainted 5.11.0-rc2-next-20210111 #333
> > [   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
> > [   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
> > [   24.317743] LR is at commit_tail+0xa4/0x1b0
> >
> > Fix the problem by calling drm_atomic_helper_shutdown() conditionally.
> >
> > Cc: <stable@vger.kernel.org>
> > Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
> > Suggested-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> > Changes since v1:
> > - Explain in the commit log that the problem happens after a 'reboot' command.
> >
> >  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 108c405e03dd..c082b72b9e3b 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1311,7 +1311,8 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
> >  {
> >         struct drm_device *drm = platform_get_drvdata(pdev);
> >
> > -       drm_atomic_helper_shutdown(drm);
> > +       if (get_mdp_ver(pdev))
> > +               drm_atomic_helper_shutdown(drm);
> >  }
> >
> >  static const struct of_device_id dt_match[] = {
> > --
> > 2.25.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
