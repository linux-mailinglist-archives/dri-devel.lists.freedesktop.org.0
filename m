Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21A54D0BA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AAF10EF64;
	Wed, 15 Jun 2022 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ECE10F218
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:13:44 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-313a8a8b95aso69641967b3.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88rWp51m5t+bsaVtWMHrNKjzep9CN6agHaxeYLzqOSg=;
 b=H8MUMyZkbpsfkUYxJJTUpsb3WM9USwP6+APqKsyACfl9Rvj1vNCBuWn4HVYMWjjkwd
 V7BpgMIUSiYmd/8sLRw/Vc1cJJL8XwBPAZdLidcg/opIXQrJVk1/XvUTzTAZIDhyoa8X
 4xUDtSa72THRkFvfsgrVcZvllNcbogoaLUgVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88rWp51m5t+bsaVtWMHrNKjzep9CN6agHaxeYLzqOSg=;
 b=z93dzKuXGQe6Ona2paujbMmjml1zPAn657C2oHOFNPtyZOzin1tFjsW0VauQRhLZ3A
 GlIe8x1JUYHMhWHnPSACA1uT4qIVvmjteN/X5xO+M/dWHl7Hihu5Rs4PIeBhx8FIJdSN
 oyLYashQ3G0j5IRDatv29JkcIB3m/6iVUgzd/599VVgMA2Wz4cu+BkcCHyNhffXGZdZ7
 rffAghYzx+AOMj4oPE0o/HXdwdAX/0XvG3iuqQxK10WPVxSYq4YY9RsOzdBQw8bXX3T5
 C7ri3UF3jSnSAtSR5J+Hj3ONay/BdfqKcrtEG5kUoinOW0hD9PBLqLbzXgcEZWuduM12
 gPAQ==
X-Gm-Message-State: AJIora/j6B/IPHXWn5D6D0WuIeyMNIXMRNUZ2yqIuAmKWJzYu0LAHL0w
 SknMaF3GZ4XueXIsIUa5IyICsPD523PfpE4r9mA1cQ==
X-Google-Smtp-Source: AGRyM1u+RECui2g1rqJWo2sDArYUxX8+ZP/YRCEWMicYm4UeyPBeP4772cKrmnj1CsKqr1gXTmUp8cr2Q3utYCTbhDU=
X-Received: by 2002:a81:fd1:0:b0:30f:f98b:4957 with SMTP id
 200-20020a810fd1000000b0030ff98b4957mr1085245ywp.350.1655316824181; Wed, 15
 Jun 2022 11:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220615172129.1314056-1-pmalani@chromium.org>
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 15 Jun 2022 11:13:33 -0700
Message-ID: <CACeCKaetgayTS+yX0cuNiK7j6Yqd4o2ziX6nCoGTt64A3jFT=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I should add:

Series submission suggestions (of course, open to better suggestions too):
- Patches 1-3 can go through the USB repo.
- Patches 4-7 can:
   + also go through the USB repo after the maintainer acks have been
received <or>
   + go through the DRM repo (after creating a branch from USB repo's
usb-next branch after Patches 1-3 have been applied).

(I"ll add the above to the cover letter if there is a v5).

Thanks!

On Wed, Jun 15, 2022 at 10:21 AM Prashant Malani <pmalani@chromium.org> wrote:
>
> This series introduces a binding for Type-C data lane switches. These
> control the routing and operating modes of USB Type-C data lanes based
> on the PD messaging from the Type-C port driver regarding connected
> peripherals.
>
> The first patch introduces a change to the Type-C mux class mode-switch
> matching code, while the second adds a config guard to a Type-C header.
> The next couple of patches introduce the new "typec-switch" binding as
> well as one user of it (the ANX7625 drm bridge).
>
> The remaining patches add functionality to the anx7625 driver to
> register the mode-switches, as well as program its crosspoint
> switch depending on which Type-C port has a DisplayPort (DP) peripheral
> connected to it.
>
> v3: https://lore.kernel.org/linux-usb/20220614193558.1163205-1-pmalani@chromium.org/
>
> Changes since v3:
> - Some more modifications to the anx7625 binding patch (4/7).
> - Picked up 1 more Reviewed-by tag.
>
> Pin-Yen Lin (1):
>   drm/bridge: anx7625: Add typec_mux_set callback function
>
> Prashant Malani (6):
>   usb: typec: mux: Allow muxes to specify mode-switch
>   usb: typec: mux: Add CONFIG guards for functions
>   dt-bindings: usb: Add Type-C switch binding
>   dt-bindings: drm/bridge: anx7625: Add mode-switch support
>   drm/bridge: anx7625: Register number of Type C switches
>   drm/bridge: anx7625: Register Type-C mode switches
>
>  .../display/bridge/analogix,anx7625.yaml      |  64 ++++++++
>  .../devicetree/bindings/usb/typec-switch.yaml |  74 +++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.c     | 148 ++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
>  drivers/usb/typec/mux.c                       |   8 +-
>  include/linux/usb/typec_mux.h                 |  44 +++++-
>  6 files changed, 350 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml
>
> --
> 2.36.1.476.g0c4daa206d-goog
>
