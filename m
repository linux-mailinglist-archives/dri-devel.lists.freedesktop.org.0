Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C45225E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75A10EA06;
	Tue, 10 May 2022 20:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2D10E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 20:54:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ba17so239551edb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ztZp3U2l6hqvTD2+MJlZoHDiQdWoIYQvaGE8e6p4ip4=;
 b=npgdfB7ICEKnoahuzW9AM7wqnGmzxTA0armBndcv2WnzxipFQH3l2o1BkNutsuKIjo
 PEizIjYEL/eXATkpMXxtht5LS3oeX9odrx9HgtVUa9vWSIq2abNI0Fd82UAgH8oRMNFC
 0Och3P5s8gH2H0r/KkktR6LhIc2zgyXfLb2YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztZp3U2l6hqvTD2+MJlZoHDiQdWoIYQvaGE8e6p4ip4=;
 b=UTyV5kJERdvywMvxWnTEwonBPjOjiD9apYMccWNX4hKqOwz1m7i+TU9o6GhMZJqJUC
 JxImdtBd58j5FX+MXDPvjHSBqVL30P7SflJxNrcpMESypTlLqEq8IJERounx8F6dIOXS
 lbnY3MvahsZw+7Saz0UeT0JlToUpcyp1XdDl1+k1XEaA0TFTiaxNQ71pLasMrHT7/mhR
 xYPsMYbBVOis6FMgkWXfzTRjHya0+yfVg2aEWzWlF+2h0e5wYJXyKUVnA+cx3irLPZ2V
 Y6VV/X8imXR9tv5qZ9eA4C6pCaGYt8FiYlrqpbkLWlVCV+h/JWKf0jHNaBu7GqeTb4Lf
 t7Xg==
X-Gm-Message-State: AOAM53310YKxFZdg+H1OqAC0we01evbWkb2kPJ3ToWCbGLDb41FoGxUa
 Iw8oMUwejrBYvsvLoBtfdyfo7PLnkIXss3P3
X-Google-Smtp-Source: ABdhPJzFZjtf18HhwPXA5hY8YrIHzAHyZTVhQURK8zrM0+Ls2vrJgsM2BCXwZkBpcg6D3Df53/GoSQ==
X-Received: by 2002:a05:6402:2078:b0:428:1071:d9b2 with SMTP id
 bd24-20020a056402207800b004281071d9b2mr25820514edb.302.1652216043784; 
 Tue, 10 May 2022 13:54:03 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 y8-20020a170906524800b006f3ef214d9esm167650ejm.4.2022.05.10.13.54.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 13:54:02 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id w4so221881wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:54:02 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr19537800wry.342.1652216041708; Tue, 10
 May 2022 13:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
 <874k22lxmh.fsf@intel.com> <8ea03441-b835-f5db-5cc3-85e5330dfe3f@quicinc.com>
In-Reply-To: <8ea03441-b835-f5db-5cc3-85e5330dfe3f@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 May 2022 13:53:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBTEAQD+49xwFM4UdzD2dqQ7WkpNYtO=JRTJwfRWo1Yg@mail.gmail.com>
Message-ID: <CAD=FV=UBTEAQD+49xwFM4UdzD2dqQ7WkpNYtO=JRTJwfRWo1Yg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 6, 2022 at 9:33 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Jani
>
> On 5/6/2022 4:16 AM, Jani Nikula wrote:
> > On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
> >> Ville,
> >>
> >> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
> >>>
> >>> If we're unable to read the EDID for a display because it's corrupt /
> >>> bogus / invalid then we'll add a set of standard modes for the
> >>> display. When userspace looks at these modes it doesn't really have a
> >>> good concept for which mode to pick and it'll likely pick the highest
> >>> resolution one by default. That's probably not ideal because the modes
> >>> were purely guesses on the part of the Linux kernel.
> >>>
> >>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>>   drivers/gpu/drm/drm_edid.c | 9 +++++++++
> >>>   1 file changed, 9 insertions(+)
> >>
> >> Someone suggested that you might have an opinion on this patch and
> >> another one I posted recently [1]. Do you have any thoughts on it?
> >> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
> >> don't have an opinion, that's OK too.
> >>
> >> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid
> >
> > There are a number of drivers with combos:
> >
> >       drm_add_modes_noedid()
> >       drm_set_preferred_mode()
> >
> > which I think would be affected by the change. Perhaps you should just
> > call drm_set_preferred_mode() in your referenced patch?

I'm going to do that and I think it works out pretty well. Patch is at:

https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid


> So it seems like many drivers handle the !edid case within their
> respective get_modes() call which probably is because they know the max
> capability of their connector and because they know which mode should be
> set as preferred. But at the same time, perhaps the code below which
> handles the count == 0 case should be changed like below to make sure we
> are within the max_width/height of the connector (to handle the first
> condition)?
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c
> b/drivers/gpu/drm/drm_probe_helper.c
> index 682359512996..6eb89d90777b 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -517,7 +517,8 @@ int drm_helper_probe_single_connector_modes(struct
> drm_connector *connector,
>
>          if (count == 0 && (connector->status ==
> connector_status_connected ||
>                             connector->status == connector_status_unknown))
> -               count = drm_add_modes_noedid(connector, 1024, 768);
> +               count = drm_add_modes_noedid(connector,
> connector->dev->mode_config.max_width,
> +                               connector->dev->mode_config.max_height);
>          count += drm_helper_probe_add_cmdline_mode(connector);
>          if (count == 0)
>                  goto prune;
>
>
> > Alternatively, perhaps drm_set_preferred_mode() should erase the
> > previous preferred mode(s) if it finds a matching new preferred mode.
> >
>
> But still yes, even if we change it like above perhaps for other non-DP
> cases its still better to allow individual drivers to pick their
> preferred modes.
>
> If we call drm_set_preferred_mode() in the referenced patch, it will not
> address the no EDID cases because the patch comes into picture when
> there was a EDID with some modes but not with 640x480.

I'm not sure I understand the above paragraph. I think the "there's an
EDID but no 640x480" is handled by my other patch [1]. Here we're only
worried about the "no EDID" case, right?


> So i think the second proposal is a good one. It will cover existing
> users of drm_set_preferred_mode() as typically its called after
> drm_add_modes_noedid() which means the existing users want to "override"
> their preferred mode.

I looked at this, and I'm pretty sure that we can't clear the
preferred modes. It looks like it's possible for there to be more than
one preferred mode and I'm worried about borking that up.

[1] https://lore.kernel.org/r/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

-Doug
