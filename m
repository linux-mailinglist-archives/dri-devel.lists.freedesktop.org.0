Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05788485E81
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 03:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0414A10E57B;
	Thu,  6 Jan 2022 02:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E6F10E57B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 02:17:54 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r131so1772546oig.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 18:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=3AqXmqq/fvbOxqwSsHR7wVrpv5IIhXUtH49b4LPOTWI=;
 b=iS7/hV/IXv3fGbOyIo3DxFq5LwX+yNVjDMVRBSweVFwpCyyZTPKA24PenSTX69xA/i
 OuDCHNlFBOa4gVHOPRVu34iAgxyQp+F7IAqYNajp4XaNH8p+ohYFmq9bM3aYpSXZKQDU
 oaJROehE/SR2d9RGiS+dRzOOJ2oOSF4snbOh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=3AqXmqq/fvbOxqwSsHR7wVrpv5IIhXUtH49b4LPOTWI=;
 b=tKnBIcZGNPWmXO+S2kerx1Jn344+15VPbao3un63aLu4dV71AyulauDhy7+W8qOcfD
 BwIEA33pZidXV4JJ36a/cetFJofv2Fp+HWhu+QYeYsntwfozgAz1k/lVnOx77IX5hCLI
 ZVX1hzJSQj9mKMXNHGwgsBDFtihdOh18Rx9z6nT7lMoJLg/MUVucOMLUNB/OCD1tGbU5
 wQDx2wW6FsBLn+/BW8SU6/KEJ/xmwB4S4qqaaFL8dc7IZFT+6qz9NNL75Bw7nFZ/HMDr
 KqKCxyN3VErkxuKYCpSK78m+dxduQdEIPufYY/5MEWPsPeqllj2sefN3msWqgJRNgzPZ
 +q7g==
X-Gm-Message-State: AOAM531e3qQkWy6mRliBMmmGJUj6pssqD7zU0aIE9ej/BrMMvEkVCgJi
 BcUrcvbXLQGzANEyeTddjiPSgbE0en/OrAobUbST+g==
X-Google-Smtp-Source: ABdhPJxVckkTPHg9kSdLRZHjaIGQnCN/oUiOy+mbGbuwVgV7+6FQORY/VTnh4Y+bCHsmoHzUw0n87Qpp99riuTZQHtQ=
X-Received: by 2002:aca:4382:: with SMTP id q124mr4659737oia.64.1641435473794; 
 Wed, 05 Jan 2022 18:17:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 18:17:53 -0800
MIME-Version: 1.0
In-Reply-To: <YcGel9PtOgqWH6l3@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-2-swboyd@chromium.org>
 <YcGel9PtOgqWH6l3@kroah.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 18:17:53 -0800
Message-ID: <CAE-0n53WuAZZQzEsidz-N9Nat=qAJ10Mn4O4syurW11rTuEEMw@mail.gmail.com>
Subject: Re: [PATCH v4 01/34] component: Introduce struct aggregate_device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Greg Kroah-Hartman (2021-12-21 01:29:59)
> > @@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
> >       if (!master)
> >               return -ENOMEM;
> >
> > +     id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> > +     if (id < 0) {
> > +             kfree(master);
> > +             return id;
> > +     }
> > +
> > +     master->id = id;
> >       master->parent = parent;
> >       master->ops = ops;
> >       master->match = match;
> > +     dev_set_name(&master->dev, "aggregate%d", id);
>
> You set the name yet the device is not "real"?
>
> I don't understand this patch at all, sorry.

The device is registered in the third patch. I'll squash this patch with
that one and move the rename patch to be the first patch in the series.
Then it should be clear why a struct device is introduced along with the
bus type it's associated with.
