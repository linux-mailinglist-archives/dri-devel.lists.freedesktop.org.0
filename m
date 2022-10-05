Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06C5F5744
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296110E68E;
	Wed,  5 Oct 2022 15:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42C10E699
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:14:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id u21so19249628edi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kFWy1h0GujeKKIt/U4s0Yal8/TAWysVv3EH0DHTh2+I=;
 b=AFAYpcBDaiii63veXKXcAqnDWDy5a/T4lZbVKpjCbWd+v39jKdmMZ/IW2b65A2RQe9
 qQynzx9pFmTsx154M76wNPn0gzv4tJmkw8ZRfVe+xR7n08dKBsTnsfd9ug/dkmJaI1ix
 w6oJuzT/tZfu0m2qtu5aZdLCvpEQaJ+FTzFLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFWy1h0GujeKKIt/U4s0Yal8/TAWysVv3EH0DHTh2+I=;
 b=IJpHxBt0BoUDCykWDuEY82Vac1S57NLutdiF2nAerzm+lXy89m9/0G8UDDPUrBBbHd
 O6hlL5+c29IqDd8ap2jraDv4KtzGPb47qRu9TxpLOZTrGYnYHBLUCQ7HMXd4CGR/hs8z
 1JB6v3b/EM4BVGzCDfKmRQWhV3vQklRhtS/GwHNzSTUbvTKfgqzsuboml8I2b5O3CNm2
 EgyJr7njPzeiBOFPMYgkSoT+8ib5SS2Sl/U9H7iiY097XhRQQ+pca5KMHIQZ4w/i3LNH
 jdJpXu6ZdJEgK43y0qa2azsim36z1zOLAarpnKBQq5OawkIr9aEAhMVc/7CzsRW+kh71
 mx0A==
X-Gm-Message-State: ACrzQf17naJ2Nv9mkatuKsiRymCH/hKyAiskz6P3p4nLvzdEH9auE9ru
 3iNNGhRdqGCgVAyt5BHCRghEqPRnbzQ7OnVe
X-Google-Smtp-Source: AMsMyM7xf/De0Pud7Ypwz6/hFkQhAdT3uqdii5jVhuLz4UduOCVlIqibtzD2G7FPjnI3u1Z60dKC+Q==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id
 eq13-20020a056402298d00b004515fc5d423mr260116edb.102.1664982877885; 
 Wed, 05 Oct 2022 08:14:37 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 m5-20020a50cc05000000b004588ef795easm4050542edi.34.2022.10.05.08.14.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 08:14:37 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id j16so14473953wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:14:37 -0700 (PDT)
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr128514wrm.617.1664982876836; Wed, 05
 Oct 2022 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220930042506.2529522-1-jason.yen@paradetech.corp-partner.google.com>
 <CAD=FV=XoyhpoRpQpv5dNYy0qEJcu=JRw=1TKynX-5ecjLJoibw@mail.gmail.com>
In-Reply-To: <CAD=FV=XoyhpoRpQpv5dNYy0qEJcu=JRw=1TKynX-5ecjLJoibw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Oct 2022 08:14:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuEifohmfUjucwrLAirSGoneovuNDmSCLtLxwQbs-frQ@mail.gmail.com>
Message-ID: <CAD=FV=WuEifohmfUjucwrLAirSGoneovuNDmSCLtLxwQbs-frQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ps8640: Add software to support aux defer
To: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 30, 2022 at 7:20 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Sep 29, 2022 at 9:25 PM Jason Yen
> <jason.yen@paradetech.corp-partner.google.com> wrote:
> >
> > This chip can not handle aux defer if the host directly program
> > its aux registers to access edid/dpcd. So we need let software
> > to handle the aux defer situation.
> >
> > Signed-off-by: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
> > ---
> >
> > Changes in v2:
> > - Add aux defer handler
> > - Remove incorrect statements
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 31e88cb39f8a..76ada237096d 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -286,7 +286,6 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
> >         }
> >
> >         switch (data & SWAUX_STATUS_MASK) {
> > -       /* Ignore the DEFER cases as they are already handled in hardware */
> >         case SWAUX_STATUS_NACK:
> >         case SWAUX_STATUS_I2C_NACK:
> >                 /*
> > @@ -303,6 +302,14 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
> >         case SWAUX_STATUS_ACKM:
> >                 len = data & SWAUX_M_MASK;
> >                 break;
> > +       case SWAUX_STATUS_DEFER:
> > +       case SWAUX_STATUS_I2C_DEFER:
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> > +               len = data & SWAUX_M_MASK;
> > +               break;
>
> This seems fine to me now. There is nothing too controversial here but
> I'll still give this a few days on the list for anyone else to speak
> up. I'll plan to land it midway through next week unless anything
> comes up.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

As promised, pushed to drm-misc-next:

562d2dd87028 drm/bridge: ps8640: Add software to support aux defer
