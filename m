Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC34C3707
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C658910E6B0;
	Thu, 24 Feb 2022 20:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199CC10E6B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 20:49:24 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t28so637092qtc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VyQBdQeq30UmUiqwlI0GZfDYUe6OZQF6NDdZxu0b9es=;
 b=DlQD2EHGRUBoc/E0dh0hZrxOrEYga+JU0zzMecSmJFvU0l7vdl8Dyb4jMjY6eFRNMl
 jpPefec6vhJo9beapyUy3Aq7D7X87670T0fKNglEM6m+c5LvcI5uNDAUg5VwaWz1sGHA
 Sqc666ajb+V85fYRTiKz3z9vlHx2JXXdw3SHoOaqtNWr/I8spOb4wDL+lP/G+IuqaVU8
 YQuEJJry+vthMfycKkveSyxrc2PZw0HvB8wgNQbQ4eKw8XHyww6T4x3//csh9pHGQPbt
 WkfOqSsIKgiUAkku0lMm8DgVePmfkU/dDwNCEWbVsNSDtQKSl0M8j1Y2qWeQYPfkROoW
 YocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyQBdQeq30UmUiqwlI0GZfDYUe6OZQF6NDdZxu0b9es=;
 b=EzwF5hZvKvpvLHvtgEir94un/wgypt8ttzP1f0Y4qxOjdqPzXXjUAeH1eQIGtyEF4b
 UrCMRBov+tKhbaKCQ7wHdpwzX7QNKl6zAQAJF9ciiCKqE7NkA+tlfvaYhNkO6tX+O1ce
 khLG7fVWHUKpTpdVr0uZpM7A2JMZFtgBX10eN0eRv8QIQ205dzY31UxW8HBi8LfaeCHX
 i088Be81QHBLBPmZYLN1PH4IFC+UiwFq9y42wiDMiGdyVt5qQ4IYbKLjw8Av/7Mre/tS
 F41XjzEob2kitBALc0QZSM/HKsVzUJicV8S1jMJBGVEXRFwKILADMv9yMaPjGdvzd6mS
 /c9A==
X-Gm-Message-State: AOAM530DqS9h8el7DHYdhY6k40aHZjm5acu8XhWkvBRfpHSnOt4kXrUu
 7OCCJHXXEbELxZY6kUJva8nwj7skFQvkIdPTEnp0IA==
X-Google-Smtp-Source: ABdhPJx1lIYR/oq8NfFLg2T+0jojl7BBRYD0j2U/Ua/gdPrYCKluwQ1CgEY8WNy/xq/flALhgfmObgBmrbZt8GF/CAo=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr4077178qtw.682.1645735764109; Thu, 24
 Feb 2022 12:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
 <9348028b-a898-428e-a855-9df18e577328@quicinc.com>
In-Reply-To: <9348028b-a898-428e-a855-9df18e577328@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 24 Feb 2022 23:49:13 +0300
Message-ID: <CAA8EJpo0C1vtiZAeBDU0G0rg5CEHwc5fmdkeKRiEyOvfPxNm-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even
 for DP interfaces
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Feb 2022 at 23:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> > It is possible to supply display-connector (bridge) to the DP interface,
> > add support for parsing it too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_parser.c | 19 ++++++++++++-------
> >   1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 901d7967370f..1056b8d5755b 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -301,17 +301,22 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
> >               return rc;
> >
> >       /*
> > -      * Currently we support external bridges only for eDP connectors.
> > +      * External bridges are mandatory for eDP interfaces: one has to
> > +      * provide at least an eDP panel (which gets wrapped into panel-bridge).
> >        *
> > -      * No external bridges are expected for the DisplayPort connector,
> > -      * it is physically present in a form of a DP or USB-C connector.
> > +      * For DisplayPort interfaces external bridges are optional, so
> > +      * silently ignore an error if one is not present (-ENODEV).
> >        */
> > -     if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> > -             rc = dp_parser_find_next_bridge(parser);
> > -             if (rc) {
> > -                     DRM_ERROR("DP: failed to find next bridge\n");
> > +     rc = dp_parser_find_next_bridge(parser);
> > +     if (rc == -ENODEV) {
> > +             if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> > +                     DRM_ERROR("eDP: next bridge is not present\n");
> >                       return rc;
> >               }
> > +     } else if (rc) {
> > +             if (rc != -EPROBE_DEFER)
> > +                     DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> > +             return rc;
> >       }
>
> How is this silently ignoring?
>
> static int dp_display_bind(struct device *dev, struct device *master,
>                 void *data)
> {
>      int rc = 0;
>      struct dp_display_private *dp = dev_get_dp_display_private(dev);
>      struct msm_drm_private *priv = dev_get_drvdata(master);
>      struct drm_device *drm = priv->dev;
>
>      dp->dp_display.drm_dev = drm;
>      priv->dp[dp->id] = &dp->dp_display;
>
>      rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>      if (rc) {
>          DRM_ERROR("device tree parsing failed\n");
>          goto end;
>      }
>
> dp_display_bind will still fail if a bridge is not found.
>
> If supplying a bridge is optional even this should succeed right?

It will succeed as dp_parser_parse() will not return -ENODEV if the
connector is not eDP.
To rephrase the comment:
For the dp_parser_find_next_bridge() result:
- for eDP the driver passes all errors to the calling function.
- for DP the driver ignores -ENODEV (no external bridge is supplied),
but passes all other errors (which can mean e.g. that the bridge is
not properly declared or that it did hasn't been probed yet).

-- 
With best wishes
Dmitry
