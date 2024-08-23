Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01AB95D7F3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 22:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635510E047;
	Fri, 23 Aug 2024 20:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NHR7n/VG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4010E047
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 20:44:43 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7a4df9dc885so159400885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724445882; x=1725050682;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=qHJoSIvn3TQXsP4HGj1BbikslhYUk1pFvCcRMop1S9M=;
 b=NHR7n/VGxDK9uYITVF8iEWndJ+9GAiRjMmN2P5OFmW6tvXwvNrKx/Fri/G03I06Pqi
 en63OyTHdc4c+6MQh6X9MGDRefH0ldnMzzgs5yinC16enm9ojtew/s24OaJMu+Bg9H5v
 bHOkFuOiks7G6Qp4q4DSnah8rXEmxp9gWQj3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724445882; x=1725050682;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHJoSIvn3TQXsP4HGj1BbikslhYUk1pFvCcRMop1S9M=;
 b=t7TsaWZ6JZsjMdJqNlp/ABJCduSmeUK3EI1NN0camlaRtbeGQBUZieZSawXJWQblv4
 dGIIQGjV2GOjOV2RIXdM3NjwIOTtHbw4ytc8rnEjFiyqaTW1++4w2SaJKqsxcKEsbfpF
 /s6H6nP51XvD0xnmLQUGF8l4CuqixFbwM4pVkeeOckR423GsCjxCyuv5GwrzraqWNEG4
 U4vwdU7JffQVrq9UmaOEwZNj/gEQrPXKzcYndsPNwp4X6xiecCBrHahzA1ukVxepQzCm
 saeiwzIksw5NJjJ+G83PlomCg/ABr+WfRmyGLJ81H8L5TXNMWto43GMNEVp4ZpKy0Zed
 uNNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1So/Gf9yDljZK4ct9Qj6R+619PCmVcxoc+vdBkrTDMjfKPvSJSmoe0MNJTa/Ycu52r6wRJFkplcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydj04hR6iTIidnl2PCIr42sSM4C5yAp1zqzjTs7/DIQNNteLkU
 yEdebHl/VkGNJgmFI42qrhm3UBkPi9D3R5ikPPkWfqk48evjrRq10/3g/J1VzLn26ze5NplmtCi
 t439BM/sTClQT/6Ckd193cYvlSDnvB1sDfpa1
X-Google-Smtp-Source: AGHT+IER+vkUNoi1LrSh0oKYCE+8iNRAFkc0O4BKptBtu1VAQywG251TPcXwcoPrrjWuSke5xL1qPKa71h4z9pa/Llc=
X-Received: by 2002:a05:620a:1aaa:b0:795:e9cd:f5b8 with SMTP id
 af79cd13be357-7a67d497dd3mr1281397585a.23.1724445881936; Fri, 23 Aug 2024
 13:44:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:44:41 -0700
MIME-Version: 1.0
In-Reply-To: <ZsdNEWX-eeLiokZl@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-17-swboyd@chromium.org>
 <ZsdNEWX-eeLiokZl@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:44:41 -0700
Message-ID: <CAE-0n50Tuxp0WjFoTx+_i1L4cSOajSNHWPh32PPoXvskJByJJg@mail.gmail.com>
Subject: Re: [PATCH v3 16/17] platform/chrome: cros_ec_typec: Support DP muxing
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
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

Quoting Tzung-Bi Shih (2024-08-22 07:37:05)
> On Mon, Aug 19, 2024 at 03:38:30PM -0700, Stephen Boyd wrote:
> > @@ -671,6 +674,20 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >       if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
> >               return 0;
> >
> > +     dp_enabled = resp.flags & USB_PD_MUX_DP_ENABLED;
> > +     hpd_asserted = resp.flags & USB_PD_MUX_HPD_LVL;
> > +     /*
> > +      * Assume the first port to have HPD asserted is the one muxed to DP
> > +      * (i.e. active_port). When there's only one port this delays setting
> > +      * the active_port until HPD is asserted, but before that the
> > +      * drm_connector looks disconnected so active_port doesn't need to be
> > +      * set.
> > +      */
> > +     if (dp_bridge && hpd_asserted && !dp_bridge->active_port)
> > +             dp_bridge->active_port = port;
> > +
> > +     is_active_port = !dp_bridge || dp_bridge->active_port == port;
>
> Why `!dp_bridge`?  When will `dp_bridge` be NULL?

I'll add a comment.

'dp_bridge' is NULL when this driver is running on non-DT platforms,
i.e. ACPI, or there isn't a graph/ports node for this device. The latter
could happen if there's some AP controlled piece of hardware that is a
typec switch, connected directly to a usb-c-connector. This is the case
on Kukui where we send the DP lanes directly to the usb-c-connector.
