Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7324345625
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079C6E082;
	Tue, 23 Mar 2021 03:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFC6E073
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:17:57 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l1so10290275pgb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Sde9ubYnM8N//wckrwjNnkeTvAXS6rg5mS6gvl/pZUo=;
 b=jBlLfJSVhdqoxsXpMG/sMoK5YHZ1gBShMw9pEb9RzY7dO5pwDig0eePdPiyHMnfoMw
 FKlNy4bz+8Nm6djUH96zOE8ri9oVufANooL0qI+4kdTiI0WS44Mc0lrPwt6d8IXAPtpF
 layi2llxziU9FDsdewA5UvMjO2xFy59K+sOdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Sde9ubYnM8N//wckrwjNnkeTvAXS6rg5mS6gvl/pZUo=;
 b=Aml+8xnoRHZ0lINds93jopFvtQe7s4EPbKdx/HeWWitSwicVVuzZS3u920kI+QcU+B
 O56ea3RQGRPjPKaEE4JPUoEMyMzpMVCrxOUbumrpDKPu8CD6I52BD2K4pBwVK01LqR4m
 KyM8jXxVyTgZYGLqInKQBV/mOHRukV7yKkFExC8frBPDWap6jLRXvAVInSXyCE7pj8jf
 tNivAMEfDm0VMCmDt+rtPS3Ik6yWnWVyNIgUoibwSb3kjjjYIO1I6y55WH7CvigfSvr+
 akRwwxpvBvvs6YiedrUajROAnAoyMif1ZNxCUo7E0qOgNkQ0MLJPceWQF1TDw54nyxX0
 DeGQ==
X-Gm-Message-State: AOAM531Rspipzkg1730f3O+BqhoDRm6CRMzf15ABaHxjHXIQch/5zKWm
 HY7/YvRB8dNX2FSelf6mGIUNZA==
X-Google-Smtp-Source: ABdhPJzio4eIHsMr16l9KdlFKhVOamp64XhFRSBMJ5Bb1buPTL7wbW9YLkwV9VXhGXU2Fjy8GUhDww==
X-Received: by 2002:a63:d7:: with SMTP id 206mr2228693pga.30.1616469477218;
 Mon, 22 Mar 2021 20:17:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id v134sm14944494pfc.182.2021.03.22.20.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 20:17:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
References: <20201102181144.3469197-1-swboyd@chromium.org>
 <20201102181144.3469197-4-swboyd@chromium.org>
 <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 22 Mar 2021 20:17:55 -0700
Message-ID: <161646947526.2972785.6883720652669260316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-17 17:20:43)
> Hi Stephen,
> 
> Reviving a bit of an old thread, for a question.
> 
> On Mon, Nov 02, 2020 at 10:11:43AM -0800, Stephen Boyd wrote:
> > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> >  {
> >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > +     struct edid *edid = pdata->edid;
> > +     int num, ret;
> > +
> > +     if (!edid) {
> > +             pm_runtime_get_sync(pdata->dev);
> > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > +             pm_runtime_put(pdata->dev);
> 
> Is there any specific reason to use the indirect access method, compared
> to the direct method that translates access to an I2C ancillary address
> to an I2C-over-AUX transaction (see page 20 of SLLSEH2B) ? The direct
> method seems it would be more efficient.
> 

No I don't think it matters. I was just using the existing support code
that Sean wrote instead of digging into the details. Maybe Sean ran into
something earlier and abandoned that approach?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
