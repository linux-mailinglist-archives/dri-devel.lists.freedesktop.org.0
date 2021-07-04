Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA63BB774
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7850489935;
	Mon,  5 Jul 2021 07:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2728E89D7F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 10:29:38 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id s19so14464059ilj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQoR4QISuapGKpauC178uaj75KbY/vGpOxEXEM7G76o=;
 b=HVOnclRtG4IAOhine7xprF5Y0qsYY8NRMEg8kTJjJqNVJH7o8MCTpVIBajLwaPxlEE
 IPu3pWL2IMMHC3lG32PaXBQbPWTLFBJV35PMS92JNxr/C9pAZ0S5zqaIlRJ072G9qL0m
 kF9Q1YWd6PEzv558ovO0UsTxYRq6JKOKl46IoXSiOa89FuY38TSOzXfoeCc69AVlhwo9
 hJQyfEV8plIdboPSD7vcn49vSerQldYQ23IBP25MiY3WjQQJ4/1oo7fWpLh4yxX1/yYW
 W2WFO5H29TmEYMssk0gRvcVr80KnsHM9Eh9ViXM00RCRo+jX8qVTF9pcfPCdwvzSs/qf
 t0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQoR4QISuapGKpauC178uaj75KbY/vGpOxEXEM7G76o=;
 b=rHMTLJbk80QlBnMD91bFxuI1ss3t3h3etyVmg8U/pwKcE0MswBgqk5KOu2qgNGp2m4
 DkSrKIBEpXIHvhrT8R+C85ZJDispjpJoi82QBqGJeo8kCSi+elT0l6h9VSs0Qunc7s3A
 ed5jZ0wPG59FgfBdDknnUNFfV1t3RFsh8kSFCyODmLDyAeUaD3yruw46NiZ6GiEenqtg
 zPPCAQbYTyP9DoYFE189S7vHtHReCs6l2AFgQqjRSyjQAfC1ZVwiVbkiJ2xz6dz2baXG
 S0XY+P8aB203lRA6PiXjlSVz2j7OBPgvoIhn1/3/uJP02eqQX1V5pJu5cpEThXlHJ6Mf
 jd4Q==
X-Gm-Message-State: AOAM531/oTn6Cly8U9tdunZJjGyklQMA5mCAQPxEP/r1rfItmHLbyxuN
 w+SkJGXdDnZK6liXUzZYoddeSRdmslPD5YvAfDlv0W1ndOU=
X-Google-Smtp-Source: ABdhPJzYVVVgO1l5ee+G35ToqBgV6W1VLg1yzwFPGoT3eURjFCINmhI8FyoxCHV3g75JMGJwB1kUeUoFLK1o2XIjf54=
X-Received: by 2002:a92:c886:: with SMTP id w6mr6465707ilo.227.1625394577542; 
 Sun, 04 Jul 2021 03:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210615103312.872-1-alistair@alistair23.me>
 <20210615103312.872-2-alistair@alistair23.me>
 <20210624205229.GA1966800@robh.at.kernel.org>
In-Reply-To: <20210624205229.GA1966800@robh.at.kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 4 Jul 2021 20:29:08 +1000
Message-ID: <CAKmqyKPHG9o_Ntm6h38Q2L7FdNjOjo6zZyBNR-Raq4gTw=P11Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add support for E Ink VB3300-KCA
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 05 Jul 2021 07:05:10 +0000
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Alistair Francis <alistair@alistair23.me>, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 Shawn Guo <shawnguo@kernel.org>, daniel@0x0f.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux@rempel-privat.de,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 max.Merchel@tq-group.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 25, 2021 at 6:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jun 15, 2021 at 08:33:12PM +1000, Alistair Francis wrote:
> > Add support for the 10.3" E Ink panel described at:
> > https://www.eink.com/product.html?type=productdetail&id=7
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> > v2:
> >  - Fix build warning
> >  - Document new string
> >
> >  .../bindings/display/panel/panel-simple.yaml  |  2 ++
> >  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index b3797ba2698b..799e20222551 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -128,6 +128,8 @@ properties:
> >          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
> >        - edt,etm0700g0dh6
> >        - edt,etm0700g0edh6
> > +        # E Ink VB3300-KCA
> > +      - eink,vb3300-kca
>
> Combining this with patch 1 would be preferrable. Either way,
>
> Acked-by: Rob Herring <robh@kernel.org>

This should be ready to merge.

Let me know if you want me to squash the patches and send a v3.

Alistair
