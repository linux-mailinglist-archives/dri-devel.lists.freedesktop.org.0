Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00384E794A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 17:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2810E392;
	Fri, 25 Mar 2022 16:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04A110E392
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 16:51:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so16554051ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
 b=SjSMuLWWBMRDZCZAYqkZjt8DVD1lMxcnTQ0pRcoYE6pc5KA03fRjaO+NG5JnARI9G0
 FdIxBtqN2SuWVe3DEw0nVislGa6FeRILBe77MlmD72/jA9e8G3JD5rKHwo6BJ0bvdI0A
 HSMzQ+1ZTMcraGaMFyqLA5koHqo6CEQtOaaRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
 b=FKJCwmR886EyR49N4Ra+XS9QX3WQqYoc1ZSS8rxTy4KnPWCu/g4RYNcCWqTw/tS3T1
 nIeKCC60hpoxDuC9iStYThP+mcM2394hisJGBNfw8YIeEVhYkUv1dAdxnlVYz9nJ0MfO
 JVURDVGBYitqTJHZBzVn7zj7D0Eq5wdWY73Wv+CGQqpT3dZIS26AiwqDyMHtLhg9gqgv
 BgOsyCT8ywOnZw5yFkTi1mTi3WVeaDqMTI65AUu3CL3SQzbdS2ZM06lFnfN2g8asYcXE
 bz7oyfjEKntI35nOaez2oi06hX+z6WAfTTB0a2deDCNKI1SZsRZ3WUv3inGgT58kgzUu
 YSEw==
X-Gm-Message-State: AOAM530I8hLw+HNjarSJNgjsI4/wWfgdmvvQbAIOlbcQpTAgFqvheAVL
 +8pmHB3U/T7CwZkbzNt96cQTGgaYiFBvRSh7zMk=
X-Google-Smtp-Source: ABdhPJx8IRNR93Hl0l2LP3SFPErs8UgjCXO70iAmteD5x7Th+VTJhl2+TjCxzQtL520o7gdT5oNVuQ==
X-Received: by 2002:a17:906:c107:b0:6df:c114:e286 with SMTP id
 do7-20020a170906c10700b006dfc114e286mr12539238ejc.216.1648227078183; 
 Fri, 25 Mar 2022 09:51:18 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 mp19-20020a1709071b1300b006dfdfe15cf8sm2652391ejc.196.2022.03.25.09.51.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:51:17 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id q20so4793945wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:51:17 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr10706474wmb.199.1648226737471; Fri, 25
 Mar 2022 09:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50dmA0ETgNvaBGs+XmGu+r=6RbfbmnHqXAFqUBGjVGDvg@mail.gmail.com>
 <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Mar 2022 09:45:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/msm/dp: Add eDP support via aux_bus
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 25, 2022 at 7:11 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > > @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct
> > msm_dp *dp_display, struct drm_device *
> > >         bridge->funcs = &dp_bridge_ops;
> > >         bridge->type = dp_display->connector_type;
> > >
> > > -       bridge->ops =
> > > -               DRM_BRIDGE_OP_DETECT |
> > > -               DRM_BRIDGE_OP_HPD |
> > > -               DRM_BRIDGE_OP_MODES;
> > > +       if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
> >
> > Why can't eDP have bridge ops that are the same?
> >
>
> eDP needs to be reported as always connected. Whichever bridge is setting these ops flags should provide the ops.
> The farthest bridge from the encoder with the ops flag set should implement the ops.
> drm_bridge_connector_detect  reports always connected for eDP. So, we don't need DRM_BRIDGE_OP_DETECT
> eDP panel bridge will add DRM_BRIDGE_OP_MODES in drm_panel_bridge_add_typed and will call panel_edp_get_modes.
> As we are not supporting HPD for EDP, we are not setting the HPD ops flag.

Right. It's Expected that eDP and DP would have different ops. If we
define "detect" and "HPD" as whether the display is _physically_
connected, not the status of the poorly-named eDP "HPD" pin, then eDP
is _supposed_ to be considered always connected and thus would never
support DETECT / HPD.

...and right that the panel is expected to handle the modes.

This matches how things have been progressing in Laurent's patches
(taken over by Kieran) to add full DP support to sn65dsi86. For
instance:

https://lore.kernel.org/r/20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com/
https://lore.kernel.org/r/20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com/

-Doug
