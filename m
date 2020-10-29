Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A829FF97
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9046E982;
	Fri, 30 Oct 2020 08:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598589A9F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 20:24:21 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t22so1836299plr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=ACjSzpbrKtSuPAejOOu3PL/YyWi3MpWIsWw+F6TKD04=;
 b=QRzkEWXp/3RkpqhLZt/ufcjhIMlU42FOAduQF+sya7GKWTSOvDcvF+sSGgPWwRur7K
 apaGjzZOlXaZVyvvDlu/z4X3XlmtvjwRlWpFgkUb07/rAtNYQdjETqfehEf270n6kANi
 WzEzEzwn8aCEJaAR1HfsLKtnB/XRoIzEPcp1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=ACjSzpbrKtSuPAejOOu3PL/YyWi3MpWIsWw+F6TKD04=;
 b=M4aiGjPwG1/UqcGgb2iTnpNNNM3iUTzmVsrUqmrLU6RCQpYVcKKltPixMd90WCOhm8
 8/SrnAdHCgLlAgkjjJug1aGew9el5UQ3RdRUtkfhY7p6Q68uIe0+Gi17s6wTSP2LOAas
 J8XBK7UMzZdtTHAgh33FN39qCfdGtQLu/jnYddQgPw/vbccgh/IOZSqE0haepXIdZXZt
 IdhXV8g+jtZlqk6cTw1JoAZceMMu3z/ADtylh8lvs01ykFiRP6X40PUR8PfxEzJM+GS2
 Hsg739tSJQUJknhH4Dp/bMhiEqJMQyQT/SSdu0I0lGEFHq1Imdo8HEYckvJNKld8cFi1
 kADA==
X-Gm-Message-State: AOAM530uErdz+zQvynxKaF5HCLGWrJjrHoYJhlcqLjTTzoCMIR8NkG3x
 MZqbC30U/1CmRh84BaQQJGWoLg==
X-Google-Smtp-Source: ABdhPJwUT/Ff7p4k+wseDOBzd3E9yVEzssK3vFub2SSuP4NA2W/RLjj4gDG5AE2vx/QnEUwNoqq9nQ==
X-Received: by 2002:a17:902:b70f:b029:d6:5bcb:1b24 with SMTP id
 d15-20020a170902b70fb02900d65bcb1b24mr5646759pls.82.1604003060613; 
 Thu, 29 Oct 2020 13:24:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id o15sm3900924pfd.16.2020.10.29.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 13:24:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U93bfZv_uLG0XFXtBBMrD7gg=L3ijnpPnOCgeeo=CqAg@mail.gmail.com>
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-5-swboyd@chromium.org>
 <CAD=FV=U93bfZv_uLG0XFXtBBMrD7gg=L3ijnpPnOCgeeo=CqAg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux failures
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2020 13:24:18 -0700
Message-ID: <160400305868.884498.15370248590957087613@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-10-29 09:22:55)
> Hi,
> 
> On Wed, Oct 28, 2020 at 6:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > We should be setting the drm_dp_aux_msg::reply field if a NACK or a
> > SHORT reply happens.
> 
> I don't think you update the "reply" field for SHORT, right?  You just
> return a different size?

Correct.

> 
> 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 6b6e98ca2881..19737bc01b8f 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -909,10 +910,32 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
> >         ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
> >         if (ret)
> >                 return ret;
> > -       else if ((val & AUX_IRQ_STATUS_NAT_I2C_FAIL)
> > -                || (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT)
> > -                || (val & AUX_IRQ_STATUS_AUX_SHORT))
> > -               return -ENXIO;
> > +
> > +       if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
> > +               /*
> > +                * The hardware tried the message seven times per the DP spec
> > +                * but it hit a timeout. We ignore defers here because they're
> > +                * handled in hardware.
> > +                */
> > +               return -ETIMEDOUT;
> > +       }
> > +       if (val & AUX_IRQ_STATUS_AUX_SHORT) {
> > +               ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
> > +               if (ret)
> > +                       return ret;
> 
> IIUC, your digging through the code showed that in order to fully
> handle the "SHORT" case you also needed to add support for
> "DP_AUX_I2C_WRITE_STATUS_UPDATE", right?

Oh yeah. If a short reply happens and it is aux over i2c then
drm_dp_i2c_msg_write_status_update() is called and
DP_AUX_I2C_WRITE_STATUS_UPDATE is set and then we try a transfer again.
We need to handle that type of request in this ti_sn_aux_transfer()
function.

> 
> Even without handling "DP_AUX_I2C_WRITE_STATUS_UPDATE" though, this
> patch seems to be an improvement and I'd support landing it.
> 
> Oh, I guess one other thing: I think this is all from code inspection,
> right?  You didn't manage to reproduce anything that would tickle one
> of these code paths?  Might be worth mentioning, even if "after the
> cut"?
> 

Yes, just code inspection. I can add that detail to the commit text.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
