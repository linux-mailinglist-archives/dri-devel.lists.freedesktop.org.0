Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2EC40B8EE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9E89ADC;
	Tue, 14 Sep 2021 20:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092A89ADC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:21:31 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so501953pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opbU04o7Av2seByLDm+85tUZqupNHweB2QHyYQl46u0=;
 b=Cg4NzZFqSaeWh4iwIopzkDRdf9YkC4YU7w7K6lGW+bGKsuACZacPGqTiw32dbnvhK9
 xKTisVlvzsBA9DGgELL0LAVERYePLiDfLtDhTF6kMZZh9bTierktXrVkazV0+fd34DWy
 +kSKoNkXw7p2UWJVuUyM2SnhvGt0usal+Z5KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opbU04o7Av2seByLDm+85tUZqupNHweB2QHyYQl46u0=;
 b=MQCNaqbbtswMDcPxP3Z8eh5NotBVrW1NOlaEirbnnhbNxpu0kABqr+yDYbSsDXn1D+
 j3tqELX87eoEz6ooa/cGXAZ4SN+T5F5OpzdKuLLRtm1TOluseRwfc6rlU0TrBIXQ/ftT
 33mxnM+Hgto2o4p2lApAQrPpDOglPSJjJSPge4qj5Tjbb3X+cMxupJJj/NNRV7T5+k05
 D5FwgFjdnAYQEDTmn9Gzh39TUeco+A2YIflg2Ss6RhJE1nDLnduBTuJTtdIT1Vg8kwHg
 GGYQOVsPtj7AXzt3fuzQX2lW80nNxcLAt0oVfooLbRHDu7WmdmsKeS4xxuHhOMkk+AOi
 b/jQ==
X-Gm-Message-State: AOAM533tlPvehfB/5gQZJPxDLXL8aP7in6FrT6zP9y4Y2s8QV2P2VDby
 57u/3FOO62UqZvdNQu3LPP6UcZJl47BN+w==
X-Google-Smtp-Source: ABdhPJzjS6boZI7a16HcToTeaJw9fSm+aYdanMXh435lYts0TY71gRoSXFGrePZeA/EJIM/4wIhwig==
X-Received: by 2002:a17:90b:38cc:: with SMTP id
 nn12mr4133243pjb.139.1631650890798; 
 Tue, 14 Sep 2021 13:21:30 -0700 (PDT)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com.
 [209.85.210.182])
 by smtp.gmail.com with ESMTPSA id f1sm2378257pjq.26.2021.09.14.13.21.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 13:21:30 -0700 (PDT)
Received: by mail-pf1-f182.google.com with SMTP id f65so436628pfb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:21:30 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:: with SMTP id
 d14mr12547218ilv.142.1631650416432; 
 Tue, 14 Sep 2021 13:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
 <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
In-Reply-To: <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Sep 2021 13:13:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uc77p-BifFvr=GkWVbP=KKb-eHNtvnOKQJ5D86ogi8hA@mail.gmail.com>
Message-ID: <CAD=FV=Uc77p-BifFvr=GkWVbP=KKb-eHNtvnOKQJ5D86ogi8hA@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] dt-bindings: drm/panel-simple-edp: Introduce
 generic eDP panels
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Tue, Sep 14, 2021 at 12:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-09-09 14:00:17)
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> > new file mode 100644
> > index 000000000000..6a621376ff86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> > @@ -0,0 +1,188 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Probable (via DP AUX / EDID) eDP Panels with simple poweron sequences
>
> Should that be "Probeable" or "Probe-able" or "Detectable"? It's not
> about statistical probabilities right?

Thanks for the catch! Will be fixed in v5.

-Doug
