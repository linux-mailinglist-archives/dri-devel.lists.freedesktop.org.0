Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FB6383AD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 06:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE8E10E296;
	Fri, 25 Nov 2022 05:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C210E296
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 05:53:47 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id d7so2089976qkk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 21:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sJO4CKtz6uCVjlMUGm3BSASo1KZZ4zekB4W49uCXr0Q=;
 b=GEQWK1zMTOaNgc6Jsw7BvrlA2RvLaRBKdutwd2mWXuN32GcN/F/lh7Do+jJwhu/lKf
 eUQzy4v825QJ8od3gmSFrmEbBs06XRTg2khVxN2jX2t/NUFG68evKAZHk2uGyqoEdH/l
 BYs68ifkf0D5ULeS+KO0T9nvkikk56lTOVFYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJO4CKtz6uCVjlMUGm3BSASo1KZZ4zekB4W49uCXr0Q=;
 b=3BdOE87H1QvAJCev6offsnkBZnADQMfEMBUJ0wyzvWHsEY7QAzi5GWFX9AjxXqVT5d
 cfuRdAnVhq2y6wKJK/SrVgDzlFgos97mqg8CV0ll47H0veWNGr1OQ4bgoMUsiRtbHXMQ
 O9HrMF8dyWxP3yloB64mC1OyaWo5e5yRaFKDWmYk6gPHhaLPriH5NCka+StCe/RZG5rs
 eLpk6HhDyiua0Cjuj5hSO/9goyXOInAvPG+nZoZ3SvG12suKzQfSnmdUPMe4ShX0SMiT
 KE8FVv5kPXa012n2lK/gMlCUQNajr37nDr26Te5tl07YjCpgIwF7X2TYhU2yNIrDRj9P
 yolA==
X-Gm-Message-State: ANoB5pnaUjYD3UgU6LrBQZS5rWA8n6mK727v8L4O++WbG6aRBDXgsjA2
 v46eZnTn2uapaivcvvhF+YUK1f3vxKOgu+1NJ6zgwA==
X-Google-Smtp-Source: AA0mqf6knSu6QR92mZ0wCOhRti8BSXDFhhs9fIvKI9CaT08+1NzMdooQC08kJNAEDw9GfohzPzP4gUJ+R3xq6VWqYa4=
X-Received: by 2002:a05:620a:31a5:b0:6fb:ff0f:e7e0 with SMTP id
 bi37-20020a05620a31a500b006fbff0fe7e0mr19622315qkb.747.1669355626882; Thu, 24
 Nov 2022 21:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org>
 <Y39ikbcqx5/pEc64@smile.fi.intel.com>
In-Reply-To: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 24 Nov 2022 21:53:35 -0800
Message-ID: <CACeCKaewXJYUJCyGyh==dsA6wsU4OESXFXJRiKm9AWPECS_ZBA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for taking a look at this patch.

Pin-Yen beat me to the punch with comment responses, but I'll add mine anyway.

On Thu, Nov 24, 2022 at 4:25 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> ...
>
> > +     /*
> > +      * OF graph may have set up some device links with switches, since connectors have their
> > +      * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> > +      * assumes the connector is a supplier).
> > +      */
>
> A bit too long lines...

They are within the 100 character limit [1] which is followed
elsewhere in the driver; has something
changed recently to make that invalid?

>
> > +     if (dev->of_node)
>
> Why do you need this check?

This issue only arises when using DT for this device. So the rationale
is we don't need to
perform this step on systems that don't use DT.

Best regards,

-Prashant

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
