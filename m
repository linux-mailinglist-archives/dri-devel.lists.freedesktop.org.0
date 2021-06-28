Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D243B65C4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 17:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F589D1D;
	Mon, 28 Jun 2021 15:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C10D899A5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 15:34:20 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id q16so6336229qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJf1KMaAZyEMZzZr0dtgEtq/jwHtzO+5QbRg9Ngbh1M=;
 b=AdOjkqVfHuP6lVxwIGFarEqU09wa/HQlsmguT+msXi0+wYdT90bXYuMezTmTm6zyTN
 9Kln7p3loFXQPpNUtLwOjxcZ8R9cph94WzYSxGDBDjfKAGdKrddMKRNWXSjDUv45Dy+I
 6Ls+NqrehEGRg3Z9j2bmXPslDBCye8Zm0crB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJf1KMaAZyEMZzZr0dtgEtq/jwHtzO+5QbRg9Ngbh1M=;
 b=MBwPtIOKHjwj56nerGzOt18QVa38pPA+jtmr/TN01RnuFc9GGadBT2yCEu1FSHYFJa
 LprjTTYztYDcC8OagLhRW/FHvPB8nCt5U0DOLbbUdl0a4A1go55u2FZ1Yq7haqX3q3Wn
 dJegRCBkAaPXrHx0+w2tCi0C7T43P1nmjqaptyNCTgP7Z9+tT3RK3hjpZrooK6gzl7pi
 KUmJ6yqaea0/7YfJukYIH4N7qGrt1C3dlKvdxSY0t1nPlg1nnm6kl9q4Em0gUaSP8RGg
 +R3BNej2SKqtZ+IUAi5baLRioUrNOCiVcxmSb8IvHiVdEHNzHQi0NcU9GQuaU3Eb0Iyr
 1kGQ==
X-Gm-Message-State: AOAM533mH9ZRczbPbgc7PQNZfTza06zt5c6nvmiqp5TaremyLDQiJXJ5
 r76twiAMLLR8cbuHtZ74ngngwkYugJUoQw==
X-Google-Smtp-Source: ABdhPJydUp/Vil7Bum8FxMxCqrpHE2vlIXQ+b3QbyRAnkznA62jdmFwlA8ykYbM2XsbIzJeLirhWzA==
X-Received: by 2002:a05:620a:290a:: with SMTP id
 m10mr10686813qkp.190.1624894459105; 
 Mon, 28 Jun 2021 08:34:19 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id y3sm10593675qkf.2.2021.06.28.08.34.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:34:17 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g19so8522501ybe.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:34:17 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id
 u184mr31422485ybb.343.1624894456593; 
 Mon, 28 Jun 2021 08:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
 <YNjA+jg9Khn+a9K+@pendragon.ideasonboard.com>
 <d75afefac48229657d36e12b6bac0e9f@codeaurora.org>
 <YNnPqYjaZjmmrQTA@pendragon.ideasonboard.com>
In-Reply-To: <YNnPqYjaZjmmrQTA@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Jun 2021 08:34:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTuexwn8gWR8-VV_-5Frb-NCNHA7m0xhxdsc_riRUC8g@mail.gmail.com>
Message-ID: <CAD=FV=WTuexwn8gWR8-VV_-5Frb-NCNHA7m0xhxdsc_riRUC8g@mail.gmail.com>
Subject: Re: [v8 4/6] drm/panel-simple: Update validation warnings for eDP
 panel description
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 28, 2021 at 6:33 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rajeev,
>
> On Mon, Jun 28, 2021 at 05:46:24PM +0530, rajeevny@codeaurora.org wrote:
> > On 27-06-2021 23:48, Laurent Pinchart wrote:
> > > On Sat, Jun 26, 2021 at 10:21:06PM +0530, Rajeev Nandan wrote:
> > >> Do not give a warning for the eDP panels if the "bus_format" is
> > >> not specified, since most eDP panels can support more than one
> > >> bus formats and this can be auto-detected.
> > >> Also, update the check to include bpc=10 for the eDP panel.
> > >>
> > >> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > >> ---
> > >>
> > >> Changes in v8:
> > >> - New patch, to address the review comments of Sam Ravnborg [1]
> > >>
> > >> [1]
> > >> https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/
> > >>
> > >>  drivers/gpu/drm/panel/panel-simple.c | 6 ++----
> > >>  1 file changed, 2 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > >> b/drivers/gpu/drm/panel/panel-simple.c
> > >> index 86e5a45..f966b562 100644
> > >> --- a/drivers/gpu/drm/panel/panel-simple.c
> > >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> > >> @@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev,
> > >> const struct panel_desc *desc,
> > >>                    desc->bpc != 8);
> > >>            break;
> > >>    case DRM_MODE_CONNECTOR_eDP:
> > >> -          if (desc->bus_format == 0)
> > >> -                  dev_warn(dev, "Specify missing bus_format\n");
> > >> -          if (desc->bpc != 6 && desc->bpc != 8)
> > >> -                  dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
> > >> +          if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
> > >> +                  dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
> > >
> > > You'll still get a warning is bpc == 0, is that intentional ?
> >
> > This was not intentional, I missed considering bpc=0 case. As we are
> > removing the warning for bus_format=0 then a similar thing can be done
> > for the bpc=0 also. The bpc value should be a valid one if it is
> > specified. Unlike the bus_format, bpc has few possible values that can
> > be checked here along with 0. Please correct me if I misunderstood the
> > concept.
> > I will fix this.
>
> What's the point of specifying bpc if it's optional though ? Users of
> the panel will need to support the case where bpc is set to 0. Have you
> ensured that they all do ? Can they meaningfully use the bpc value if
> they need to be ready to support bpc == 0 ?

I must be missing something, but to me it seems like Rajeev's patch is
fine as-is. From my reading of the code:

* Removes the warning if bus_format == 0. This is correct since I
don't think specifying bus format for eDP panels makes lots of sense.

* Removes the warning if bpc == 10. This is correct since we've seen
eDP panels with 10bpc.

* Keeps the warning if bpc == 0. IMO we can/should still require
panels to specify their BPC. I guess I'm treating this as a "max BPC".
I know that we use this field in the sn65dsi86 driver, so if it's OK
for this to be 0 then we'll have to change that driver to handle it.

Does that sound right to you Laurent? So since I think Rajeev's patch
is OK, I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless I missed something and this patch needs to change then it feels
like Rajeev's patch series is in pretty good shape to land. I'm happy
to commit it but since Sam made comments on the previous version I'd
plan to wait a bit to make sure he has a chance for another look if he
wants to. I've also only got 2 days left before I vanish for 1 week of
vacation. ...so my plan is:
* If Sam / Laurent come back before tomorrow and say they're happy
then I'll commit.
* If I hear nothing then I'll check back after my vacation. If someone
else has committed then I'll be happy. If not and there has just been
silence then I'll commit it myself.

Please yell if that's not OK. :-)


-Doug
