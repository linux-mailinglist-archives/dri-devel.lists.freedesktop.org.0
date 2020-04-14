Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DB1A8F56
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 01:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BE76E198;
	Tue, 14 Apr 2020 23:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCE76E198
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 23:56:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z6so16587179wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=be0q2rjhwVc9Yi+ssBzQr/Anw/EWaI6N7hXKtZkKaXo=;
 b=BnROSGwWErO6usd963RDM9CrXkCe/C3WwHV48iMWS0xU8hgTUZ6IWFLCdsfosVR613
 kYN2FjLWavy4GevURW0TJrJoGlULIB9Qzg0KL508TX7wa5P8A1qQNME4XQ+qfxwNKgVB
 UJ0tz410q4X2itfyjMsbRcsK6McJcmuUBol6WGkE/h7G1LJRcj0ZaVIsg7S7CGpp2sTR
 ektMAVG03Gal6IV44EzW7P3p9b7SVXb24TihSxfjWnVufsL/3x8dMbXP6OXtVPE2RK1S
 ddfo7xwCXOaPOhGci5ijR/vgEIg26wkJFS0vv/hn3YLOAWXIfB9tVU4hBGja4OoeO/CY
 EtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=be0q2rjhwVc9Yi+ssBzQr/Anw/EWaI6N7hXKtZkKaXo=;
 b=Mly51dQkdp1X4TNFlWnzSIA6lwu7qyIKxWvmxUi3pj4mOffWhxiWc47yfiQMeuDbe9
 /3+pKmIMadfeKh/zcMMIZI8yXQyqYwH7TMYM8xZiJ0rHUqY/g7h+oEjkN4p/KsL+NkAa
 tmBAoPFkkr0nf7v1eT3VYLS9mBsXp8VNlAANQ1yKBVRX0Xyz/d9C7uBoZHGMssHEikC6
 paXOnMHz11rFtFbMoRg+WqC5bwsWHnoU6xPEYFZ1gONPohn86MLOmC/yhAjgmeZ09s5Y
 y4vFaLBRuFSdK9dlwFtXuMAjmz24fX5KOg06K6W3nogFH2/W90sxAAOVUMyiRQoVaW4S
 j7Ig==
X-Gm-Message-State: AGi0PuZQF/GrqJ/vQQHu/O0PIAVGWkZBh/UvrBD/rCCExHeP/RyF8LP0
 kY/dUsF7pPOGa96OzTJX+pOY6nk78mtTEWHXx9c=
X-Google-Smtp-Source: APiQypIoyQf9rsh8NwC2QO9zZBBORwk52k2MlKH4VNIqO9Di2R2EXDJTUqqyGfZiHfI3Qc/9JXUmoX7tIVXjMb1GkOI=
X-Received: by 2002:a1c:a4c2:: with SMTP id n185mr2396333wme.104.1586908575106; 
 Tue, 14 Apr 2020 16:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200411054106.25366-1-james.hilliard1@gmail.com>
 <87lfmymilm.fsf@intel.com>
In-Reply-To: <87lfmymilm.fsf@intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2020 17:56:03 -0600
Message-ID: <CADvTj4oyK1f5fLM63GZybqdFReEa7sqQqqPyhtRWtLeyWzoDFw@mail.gmail.com>
Subject: Re: [PATCH] component: Silence bind error on -EPROBE_DEFER
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 5:07 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 10 Apr 2020, James Hilliard <james.hilliard1@gmail.com> wrote:
> > If a component fails to bind due to -EPROBE_DEFER we should not log an
> > error as this is not a real failure.
> >
> > Fixes:
> > vc4-drm soc:gpu: failed to bind 3f902000.hdmi (ops vc4_hdmi_ops): -517
> > vc4-drm soc:gpu: master bind failed: -517
>
> I'd think the probe defer is useful information anyway. Maybe just tone
> down the severity and/or the message?
That's probably not needed as there's dev_dbg logging for -EPROBE_DEFER
elsewhere from what it looks like.

For example:
https://github.com/torvalds/linux/blob/v5.6/drivers/base/dd.c#L621
>
> BR,
> Jani.
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/base/component.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > index e97704104784..157c6c790578 100644
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
> > @@ -256,7 +256,8 @@ static int try_to_bring_up_master(struct master *master,
> >       ret = master->ops->bind(master->dev);
> >       if (ret < 0) {
> >               devres_release_group(master->dev, NULL);
> > -             dev_info(master->dev, "master bind failed: %d\n", ret);
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_info(master->dev, "master bind failed: %d\n", ret);
> >               return ret;
> >       }
> >
> > @@ -611,8 +612,10 @@ static int component_bind(struct component *component, struct master *master,
> >               devres_release_group(component->dev, NULL);
> >               devres_release_group(master->dev, NULL);
> >
> > -             dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
> > -                     dev_name(component->dev), component->ops, ret);
> > +             if (ret != -EPROBE_DEFER) {
> > +                     dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
> > +                             dev_name(component->dev), component->ops, ret);
> > +             }
> >       }
> >
> >       return ret;
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
