Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1027D7F1B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69510E77C;
	Thu, 26 Oct 2023 08:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36EF10E77C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 08:57:34 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d8a000f6a51so440018276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698310654; x=1698915454; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d15OUBlXoCJoUgZsOraHwb/V6/eE2WDwET5ZkyPx89I=;
 b=ndWL2PoU2c5KmgEI5cxishw1KqwZSQfG59ISXcxyXVegorzZURJ7bfa9c3KdIgWhkU
 /kZ3UlWiC2TgL5gM/NtHpNe8cmD/GKdzA0YCrqbr8E2No/SxLLtj4g5BzYxJ2gHLQ33q
 PwieGWWCJY+uJmXLQSa6USp3SneZIgAPPidwhAxpwfRgGm4qqQwFsQIHXc1Voc64t3da
 HDT7M83q3ma+aiTFU9Qp1RRSxJF0uwQ/yWB9IcwlrW3iSV4/txp8vnMu3oUHRUXWVqdc
 FZ8J27BpnCN6VqaN6on5x2nUQY7AqbalV2ZQ6Ox26XQOPMPuPVTUWIUPBHWU18IGnVJ/
 quXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698310654; x=1698915454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d15OUBlXoCJoUgZsOraHwb/V6/eE2WDwET5ZkyPx89I=;
 b=iDyQdhqkbyWROQwZYQFfSLGlr1Xyr4ZwuXeY8+KxA5nAMsNGUAhie6lh2D74BjxBVr
 5f/lxYpBnuxKwMAkYwj0wwem5t54Bn08VE1ofi2JdeGmtoNyofB+ua54J+qLZLM0N74F
 tl1sYhxMoHjp6KRy6RStONIQ9OE42pfAbHojPgmdhfRbLzu83kCMNRF9+DQniVWmD9NZ
 lqf6XtUYK2Q9azzyn5Br4qtvd0YoBi27htflvr5pDJExVsE7T2bowwHZIokxf8qO/2NK
 wc8HI5atFmRKeT10LPQeQQXyETNwQ4gKKS9XJlCjew7EhQR3XrmO9LYjhBd3jcf8L9n4
 COhg==
X-Gm-Message-State: AOJu0YzR2+9kuMJmLA4LqZz0J4sjhwwtIK8ZAAC28e8wDnpGZaBs0uGs
 GgqVZMkSq5H5aU51eHhtgb3Od0E8XZuckXjIevUQXg==
X-Google-Smtp-Source: AGHT+IFhzh3jp3HfNlJ8La8+jINi5sy551LrNDFQM80H3MVmgkxMCbioFraPFHdJrZNwGJJzriw+6D047YqUbWdNHEc=
X-Received: by 2002:a25:fb01:0:b0:da0:9735:b012 with SMTP id
 j1-20020a25fb01000000b00da09735b012mr2234616ybe.11.1698310654073; Thu, 26 Oct
 2023 01:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
In-Reply-To: <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Oct 2023 11:57:22 +0300
Message-ID: <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > +static int starfive_hdmi_register(struct drm_device *drm, struct starfive_hdmi *hdmi)
> > > +{
> > > +   struct drm_encoder *encoder = &hdmi->encoder;
> > > +   struct device *dev = hdmi->dev;
> > > +
> > > +   encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> > > +
> > > +   /*
> > > +    * If we failed to find the CRTC(s) which this encoder is
> > > +    * supposed to be connected to, it's because the CRTC has
> > > +    * not been registered yet.  Defer probing, and hope that
> > > +    * the required CRTC is added later.
> > > +    */
> > > +   if (encoder->possible_crtcs == 0)
> > > +           return -EPROBE_DEFER;
> > > +
> > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> > > +
> > > +   hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > > +
> > > +   drm_connector_helper_add(&hdmi->connector,
> > > +                            &starfive_hdmi_connector_helper_funcs);
> > > +   drmm_connector_init(drm, &hdmi->connector,
> > > +                       &starfive_hdmi_connector_funcs,
> > > +                       DRM_MODE_CONNECTOR_HDMIA,
> >
> > On an embedded device one can not be so sure. There can be MHL or HDMI
> > Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector.
>
> On an HDMI driver, it's far from being a requirement, especially given
> the limitations bridges have.

It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
are not widely used in the wild and are mostly non-existing except
several phones that preate wide DP usage.
Using drm_connector directly prevents one from handling possible
modifications on the board level. For example, with the DRM connector
in place, handling a separate HPD GPIO will result in code duplication
from the hdmi-connector driver. Handling any other variations in the
board design (which are pretty common in the embedded world) will also
require changing the driver itself. drm_bridge / drm_bridge_connector
save us from those issues.

BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
asking because we heavily depend on the bridge infrastructure for HDMI
output. Maybe we are missing something there, which went unnoticed to
me and my colleagues.

-- 
With best wishes
Dmitry
