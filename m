Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34B4B9167
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9ED10E42E;
	Wed, 16 Feb 2022 19:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E910E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:39:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y17so5706368edd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciKM8JCmOjTFWsSXmArs9c1a9jxN6MlNWKsQdAvB9wQ=;
 b=S+Sj3p+F2dgiPbzCoR+LfRa53UtOXeFacCuEW1Mf2T3LAZQOHiwOq/wfozB3rRsSqp
 6m6F0YJx/DExHK3yJTw89l8Pd7sxcn9PMPbCsGt0Ox3DmNKQkRvhTzpZDwlLeXof1rUL
 5XWlIRBhJyKQu5JehUO7HjJMozFEjKnd9VuGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciKM8JCmOjTFWsSXmArs9c1a9jxN6MlNWKsQdAvB9wQ=;
 b=DuXUOhcqTOTtWCvrB3PYg7LHFldueDfOzovmNYIXsq9W9XRTfcyChldGzAArzoFm+z
 EAywJTD2o7TwKVAD83RdMMI2SjNao3VrzzUtoAtXXEmpFcdPVgtEkHlVbBrCUCoFzOHV
 Z1RpeJNWvzhx50dVJpNkgCHly3Kly9q+pSZ38c7nsKZE4bnW40xKaQXyvNSaWw97jR3H
 jccoo3Mwi9X+amphAfhdLMnXaOU2WiCcvePxhfn/d90eOC+clgLmOOTIVbBNDwV8B6Es
 AUEbPh/BpcbKx5nAyBRiDL7muQGtPSRoYNFf0xVwzhXdenQY40u3/2ObT/jjV5fkIXJe
 oSPg==
X-Gm-Message-State: AOAM530O88s4TJ+UuGJAP6XDOqCRZJ+ppLf4dCThyvP53TYc5OmWf8AC
 ftaGipl/6ZWibJSuHDc5+oXZwipO05+lYUgX
X-Google-Smtp-Source: ABdhPJzTFOTfIogLUBtB03w4GgeItFyXb/h+qLW54nU19gPYxc5vU1RJjL3q3FND2JqIOEgI3HQnkw==
X-Received: by 2002:a50:d088:0:b0:410:d12b:84e1 with SMTP id
 v8-20020a50d088000000b00410d12b84e1mr4816277edd.106.1645040397570; 
 Wed, 16 Feb 2022 11:39:57 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id en27sm187289edb.5.2022.02.16.11.39.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:56 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id o24so5190469wro.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:39:55 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr3549580wrm.422.1645040395241; Wed, 16
 Feb 2022 11:39:55 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
In-Reply-To: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:39:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UvTXLEuKbkVHeiP=djzFscGJxL5iP+cafGnvjMXhmFKA@mail.gmail.com>
Message-ID: <CAD=FV=UvTXLEuKbkVHeiP=djzFscGJxL5iP+cafGnvjMXhmFKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: simple: Add sharp
 LQ140M1JW46 panel
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 16, 2022 at 11:26 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
> >
> > Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> > with 1920x1080 display resolution.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Changes in v4:
> >   None
> >
> > Changes in v3:
> >   None
> >
> >  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

122365cfe9de dt-bindings: display: simple: Add sharp LQ140M1JW46 panel

So v5 shouldn't include this patch.

-Doug
