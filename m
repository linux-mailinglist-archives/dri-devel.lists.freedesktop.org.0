Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DB59C50E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB3949B1;
	Mon, 22 Aug 2022 17:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3FE907A9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:33:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id vw19so9003444ejb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=i/ov1Fd0UK/G3QEuwXc0gcm83RKp3BYtJaImDo4MAf4=;
 b=hzycMOPSp8UyNEagfTDlZw2qlyUREyCmxKqD2S30ANxSwRUEghi32rK6rpJbv+PzA4
 2+O7uODbHg/27AKfr0gVEamTvKk75ZkAs5aG9j+6bRnvDvUWMeozTOEdKvuFBve7arJg
 j5WKWOtoAxGmRpRN7WmCQJ9720ExQK98nTUCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=i/ov1Fd0UK/G3QEuwXc0gcm83RKp3BYtJaImDo4MAf4=;
 b=G88FXQKPXHRh69EAI7U08jeo2ilV9ozb8xQlRIUuGJnXb7+jlA0HGUDLN/3CGUhSdb
 22I89ssoLEUlJ0x5BrDheMST3FA8+FDczDdkLmHBRnbbkkluh3pCR03iyt3E4jHPaaUj
 mCwrQmmTMdeOOEXpYSy2Qv0/0ZPAfE9XdDe1xPYulnhNyL7K8ifL9w+GSXHh+ejY6TfU
 xkw/+w/gQgv30I+iZbIwnlLst3YVTVbIW6Gx3spIZg9SHT0A6K4XPhDlztzXSXTTiDq+
 8K2XghIW8epDtwO0ksUQmk3F0HPqfMXwyrYEvCRPndG68gTrKbkb0v3UIvmBLWAN3ZIU
 m8Qg==
X-Gm-Message-State: ACgBeo3TYutIoxCmA5D4R4i7W1E2vEdd0pt53c2CYHkh0bPKdqBh+B9e
 F0UtgT8o7M++jCjqD9aqHWxRpeeIN2+tEXxV
X-Google-Smtp-Source: AA6agR5/rsJKYqU7LxGkxeF2+2og6HyHGVtptJjku028VMASFigYPPnB7DRiL3+IJPjR4Zf9BWbnJg==
X-Received: by 2002:a17:907:3e12:b0:738:fd2f:df80 with SMTP id
 hp18-20020a1709073e1200b00738fd2fdf80mr14109530ejc.29.1661189635200; 
 Mon, 22 Aug 2022 10:33:55 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 q2-20020a170906770200b00730860b6c43sm6611315ejm.173.2022.08.22.10.33.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:33:53 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id h1so5958564wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:33:53 -0700 (PDT)
X-Received: by 2002:a05:600c:5008:b0:3a6:1cd8:570d with SMTP id
 n8-20020a05600c500800b003a61cd8570dmr12921599wmr.57.1661189633154; Mon, 22
 Aug 2022 10:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220711075202.21775-1-johan+linaro@kernel.org>
 <YtpyeCHojFovBKxv@hovoldconsulting.com>
 <YwOGCPFTx0+MNfN2@hovoldconsulting.com>
In-Reply-To: <YwOGCPFTx0+MNfN2@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Aug 2022 10:33:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
Message-ID: <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: add AUO B133UAN02.1 panel entry
To: Johan Hovold <johan@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 22, 2022 at 6:35 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Jul 22, 2022 at 11:48:40AM +0200, Johan Hovold wrote:
> > On Mon, Jul 11, 2022 at 09:52:02AM +0200, Johan Hovold wrote:
> > > Add an eDP panel entry for AUO B133UAN02.1.
> > >
> > > Due to lack of documentation, use the delay_200_500_e50 timings like
> > > some other AUO entries for now.
> > >
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Any comments to this one?
> >
> > It looks like it hasn't shown up in the dri-devel patchwork and just
> > want to make sure it isn't lost.
> >
> > Rob Clark mentioned something about a spam filter on IRC.
>
> This one still hasn't been picked up.
>
> Is this something you can do, Doug? I noticed you applied a couple of
> patches to this driver recently.
>
> Or who is really responsible for this driver?

Officially it falls within this section of maintainers:

DRM PANEL DRIVERS
M:      Thierry Reding <thierry.reding@gmail.com>
R:      Sam Ravnborg <sam@ravnborg.org>
L:      dri-devel@lists.freedesktop.org
S:      Maintained
T:      git git://anongit.freedesktop.org/drm/drm-misc
F:      Documentation/devicetree/bindings/display/panel/
F:      drivers/gpu/drm/drm_panel.c
F:      drivers/gpu/drm/panel/
F:      include/drm/drm_panel.h

...and then you just have to know that if the "tree" is drm-misc that
it falls under drm-misc rules. That means that anyone who is a
drm-misc-next committer can commit it.

I've been trying to keep an eye on panel-edp ever since I split it out
from panel-simple, though. I'll post up a MAINTAINERS entry to try to
make that more official.

In any case, I've landed this on drm-misc-next:

ee50b0024408 drm/panel-edp: add AUO B133UAN02.1 panel entry

-Doug
