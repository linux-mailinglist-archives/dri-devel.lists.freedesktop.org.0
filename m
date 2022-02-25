Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC744C3D07
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 05:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8872210E75A;
	Fri, 25 Feb 2022 04:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81810E75A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 04:23:09 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id q4so3594117qki.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 20:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pIfur/BNUTUvjd28Fy9Sk2KPx1lrPyiGoSMEXffjfw=;
 b=h5vvxAAKAy7dOXLsmQJOnypBtwm+jvdLV1PWrVf9H69xP7sunYzAKphd/d00HBjQi2
 infP5IpBAaiZW98p1Cq2asaIDLx0Dma6tlig3YED8wLZ9TrbYhRqVaL8dY4/Uemup/Qt
 DclZNzV8SrE04gIw/oTsbzAVHy/JtpWTUbOAN4TK2/v5/Ms9NGHuB+VqPgrMq0jsVRK6
 k20rQ6O68F40bokgj55kNmS9uu6b77JsojHXZoRw2XumPCryi16zvEboets4v7NeQH18
 JBYi75DGg5MFXcMPV6F46QpjRa92qArhLnyOrO14x7nbltzJG/OeMxpjpC67JlbB0dGw
 Rbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pIfur/BNUTUvjd28Fy9Sk2KPx1lrPyiGoSMEXffjfw=;
 b=ikGfnZZVOyGsYiyzZ5lO6B2X6E4ELcoUQg/ecv2athWSrvz6ek+YHIO8VNTUyjs+fr
 KLBn6HeFcXLKycWgS+NjfE4lGU56Vw1hav7sk9LFOFtcwoWedj7qY4iCfZTR3FYA6ec2
 0eRWix7oBd5wuRE3KvQ6HtH3QWGfhzjLPA+QlhZqmL76IMFDUHXhjDooN4x7AKyYB2A4
 lEZeJoWzBerqqwaeEbNE4M9AE2iw52svUHtzvvvJsz2D95lHIpGUa57DeXtGu/RdS1m1
 N4LyubHm5AVwt67iM7bNq/JwR4PBC1G0ixm1cc66PvnnxMreIo352nBavkYr7uzSdh+n
 ImpA==
X-Gm-Message-State: AOAM533gp4x1qaquqkBHMuF3eYW6V7+L8XYvcAGwWjitBU2MqlDQPwc1
 1XiTHDfcadvlhvo4Mp+XqCw0NjBxlY3NZooLOa/VMQ==
X-Google-Smtp-Source: ABdhPJxLIGllhxQlS8UwUxzDedmZdiRlghmyBHTXe4s/eVlAdVKzVxi7kl4IZQ5kX4nevF35fu0CcZT4ZC0XUbg9MH0=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr3742655qki.59.1645762988148; Thu, 24
 Feb 2022 20:23:08 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
 <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
 <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
 <9398567b-6517-8eb3-f5d5-d8c88cb10814@quicinc.com>
In-Reply-To: <9398567b-6517-8eb3-f5d5-d8c88cb10814@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Feb 2022 07:22:57 +0300
Message-ID: <CAA8EJpp2KrHfNN0F7s6iNOd8Zh1w-1dBMfAXff4Yy4UAdpPGUA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge
 attachment
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Feb 2022 at 05:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/24/2022 12:41 PM, Dmitry Baryshkov wrote:
> > On Thu, 24 Feb 2022 at 21:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
> >>> On 19/02/2022 02:56, Stephen Boyd wrote:
> >>>> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
> >>>>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>>>> enable and disable") the DP driver received a drm_bridge instance, which
> >>>>> is always attached to the encoder as a root bridge. However it conflicts
> >>>>> with the panel_bridge support for eDP panels. The panel bridge attaches
> >>>>> to the encoder before the "dp" bridge has a chace to do so. Change
> >>>>
> >>>> s/chace/chance/
> >>>>
> >>>>> panel_bridge attachment to come after dp_bridge attachment.
> >>>>
> >>>> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
> >>>> is the "DP driver's drm_bridge instance created in
> >>>> msm_dp_bridge_init()"?
> >>>>
> >>>> My understanding is that we want to pass the bridge created in
> >>>> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
> >>>> panel bridge to the output of the DP bridge that's attached to the
> >>>> encoder.
> >>>
> >>> Thanks! I'll update the commit log when pushing the patches.
> >>
> >> Please correct if i am missing something here.
> >>
> >> You are right that the eDP panel's panel bridge attaches to the encoder
> >> in dp_drm_connector_init() which happens before msm_dp_bridge_init() and
> >> hence it will attach directly to the encoder.
> >>
> >> But we are talking about different encoders here. DP's dp_display has a
> >> different encoder compared to the EDP's dp_display.
> >
> > The encoders are different. However both encoders use the same
> > codepath, which includes dp_bridge. It controls dp_display by calling
> > msm_dp_display_foo() functions.
> >

> >> So DP's bridge will still be attached to its encoder's root.
> >
> > There is one dp_bridge per each encoder. Consider sc8180x which has 3
> > DP controllers (and thus 3 dp_bridges).
> >
>
> Sorry, but I still didnt follow this.
>
> So for eDP, dp_drm_connector_init() will attach the panel_bridge
> and then msm_dp_bridge_init() will add a drm_bridge.
>
> And yes in that case, the drm_bridge will be after the panel_bridge
>
> But since panel_bridge is at the root for eDP it should be okay.

No. It is not.
For both DP and eDP the chain should be:
dpu_encoder -> dp_bridge -> external (panel) bridge, optional for DP
-> [other bridges] -> connector

Otherwise drm_bridge_chain_foo() functions would be called in the
incorrect order.

Thus the dp_bridge should be attached directly to the encoder
(drm_encoder) and panel_bridge should use dp_bridge as the 'previous'
bridge.

For example, for the DP port one can use a display-connector (which
actually implements drm_bridge) as an external bridge to provide hpd
or dp power GPIOs.

Note, that the current dp_connector breaks layering. It makes calls
directly into dp_display, not allowing external bridge (and other
bridges) to override get_modes/mode_valid and other callbacks.
Thus one of the next patches in series (the one that Kuogee had issues
with) tries to replace the chain with the following one:
dpu_encoder -> dp_bridge -> external (panel) bridge -> [other bridges]
-> drm_bridge_connector.

>
> Your commit text was mentioning about DP.
>
> For DP, for each controller in the catalog, we will call modeset_init()
> which should skip this part for DP
>
>    if (dp_display->panel_bridge) {
>          ret = drm_bridge_attach(dp_display->encoder,
>                      dp_display->panel_bridge, NULL,

as you see, NULL is incorrect. It should be a pointer to dp_bridge instead

>                      DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>          if (ret < 0) {
>              DRM_ERROR("failed to attach panel bridge: %d\n", ret);
>              return ERR_PTR(ret);
>          }
>      }
>
> Followed by calling msm_dp_bridge_init() which will actually attach the
> bridge:
>
> drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);

And this bridge should be attached before the external bridge.

>
> Now, even for 3 DP controllers, this shall be true as there will be 3
> separate encoders and 3 dp_displays and hence 3 drm_bridges.
>
> What am i missing here?
>
> >>
> >> So what are we achieving with this change?
> >>
> >>>
> >>>>
> >>>>>
> >>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>>>> enable and disable")
> >>>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>
> >>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>>>
> >>>>>    drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
> >>>>>    1 file changed, 11 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>> index d4d360d19eba..26ef41a4c1b6 100644
> >>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>> @@ -169,16 +169,6 @@ struct drm_connector
> >>>>> *dp_drm_connector_init(struct msm_dp *dp_display)
> >>>>>
> >>>>>           drm_connector_attach_encoder(connector, dp_display->encoder);
> >>>>>
> >>>>> -       if (dp_display->panel_bridge) {
> >>>>> -               ret = drm_bridge_attach(dp_display->encoder,
> >>>>> -                                       dp_display->panel_bridge, NULL,
> >>>>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>> -               if (ret < 0) {
> >>>>> -                       DRM_ERROR("failed to attach panel bridge:
> >>>>> %d\n", ret);
> >>>>> -                       return ERR_PTR(ret);
> >>>>> -               }
> >>>>> -       }
> >>>>> -
> >>>>>           return connector;
> >>>>>    }
> >>>>>
> >>>>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct
> >>>>> msm_dp *dp_display, struct drm_devi
> >>>>>                   return ERR_PTR(rc);
> >>>>>           }
> >>>>>
> >>>>> +       if (dp_display->panel_bridge) {
> >>>>> +               rc = drm_bridge_attach(dp_display->encoder,
> >>>>> +                                       dp_display->panel_bridge,
> >>>>> bridge,
> >>>>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>> +               if (rc < 0) {
> >>>>> +                       DRM_ERROR("failed to attach panel bridge:
> >>>>> %d\n", rc);
> >>>>> +                       drm_bridge_remove(bridge);
> >>>>> +                       return ERR_PTR(rc);
> >>>>> +               }
> >>>>> +       }
> >>>>> +
> >>>>>           return bridge;
> >>>>
> >>>> Not a problem with this patch, but what is this pointer used for? I see
> >>>> it's assigned to priv->bridges and num_bridges is incremented but nobody
> >>>> seems to look at that.
> >>>
> >>>
> >>> That's on my todo list. to remove connectors array and to destroy
> >>> created bridges during drm device destruction.
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
