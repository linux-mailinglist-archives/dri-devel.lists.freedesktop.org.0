Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F75955326
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7BD10E013;
	Fri, 16 Aug 2024 22:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mGfIY3jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F3210E013
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:12:56 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6bf6606363fso13455206d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 15:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723846375; x=1724451175;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=27Aa5uP6ynSRq3MyGqYDRl/zOjMC3BQBnPalcqJi/4g=;
 b=mGfIY3jjLMbg67hhDQpf/bTnPR5FylIS3aDM3klEX17yD52RHv17hrOIjn9x3MM04g
 T1Jo67atYCzyNvd/i60vefAwdwQxPA+cl8He1s0VaTJ0EsiZ24BtVOkLu/8fPOLzIrHm
 UUQDMy751bd9GRy99xes8kQ2Ft+b/OhB/63N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723846375; x=1724451175;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27Aa5uP6ynSRq3MyGqYDRl/zOjMC3BQBnPalcqJi/4g=;
 b=xC6hzEOwyjKa24cCVQkF2kXsEcgj7VJfk/Ib9B8CFdH+bqwIG+AvdOToA/y0pqGj+J
 hpRkhJwXXRqkKBIWkMktw1j6S5QJdaaFCFWMGObL6jUvOPlLWa9plJ1LukdtBwGu4bO6
 0Yw9p35A+B3sBw+0VCfC9j7uqG/biL4DWmtA9zf31tkyQ4Q5Nz0Me41OpieSY/V3WcjI
 GMEjfZlm3bZEzxqsTBXPSorgaAPyVzyPfF0RppdbcKDPCQHse9Hc+5TX/ilUlFhpFYjB
 hQrqhuHdrNqOJI7N48uyleO/Pv7esVDl2XKrFfTsClKkxMJowwmToeiKk3WPDKf3v2VN
 mSzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMOOM4fKU4NZ5MYTvsS5tcije3s+dc0v4yhvYQDEoCD51KV90fIi5n5TNmQyqPMKg4cEGKW8j3/S4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBgfITA5XtBblQdmG//wQ5V7+w0sRC4I/F0w5Ek5lm7gzEtguO
 O9J2nK2+63/3ponFl9efGjoPwL3WBRc915bJ3Otb4i9wlAMlUBzaO6TNRVxOEyDCMeDjGgKlTAl
 BeRiau+MHLB/W/5QX2iBAFMwLnLpi/ISvJBAU
X-Google-Smtp-Source: AGHT+IEXgJVhNBbiykq2c9JLQpgdG+hj5r76CFo72LJUCN7wWKauh3tPqJtN47pGnDcVtY+0kRff3bANoaG4a/doWjY=
X-Received: by 2002:a05:6214:4a93:b0:6b7:9bc1:708a with SMTP id
 6a1803df08f44-6bf7cea2549mr55681266d6.55.1723846375483; Fri, 16 Aug 2024
 15:12:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Aug 2024 22:12:54 +0000
MIME-Version: 1.0
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 16 Aug 2024 22:12:54 +0000
Message-ID: <CAE-0n50J3vuSKEPM5Pum+8CiQ6_X=Q0eCzyEJLkyof0awCWjow@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] platform/chrome: Add DT USB/DP muxing/topology
 support
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
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
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>
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

Quoting Stephen Boyd (2024-08-14 17:34:05)
>
> I'm thinking of working in changes so that the drm_dp_typec_bridge
> registers a 'struct typec_mux_dev' as well. If that is done then we can
> register a drm_dp_typec_bridge from the port manager and let the type-c
> framework drive the pin assignment and orientation directly instead of
> calling it from the port manager layer. To get there I need to add the
> ability for a 'struct typec_mux_dev' to associate with more than one
> typec_port (technically already done) and then make sure that the
> cros_ec_typec driver doesn't try to enable DP altmode on the type-c port
> that isn't muxed for DP. I'm working on this now but I'm sending this
> out to get some feedback because I've reached a good stopping place.
>

I've done this now, and it works well. I've extended the usb-switch.yaml
file to support a third graph endpoint for DP. And I've moved the hpd
notifying and lane remapping to be internal to the drm_dp_typec_bridge
code so that any device that registers the auxiliary device can follow
the usb-switch binding and connect the endpoint to the usb-c-connector
to get hpd notifications and pin assignment basically for free.

I'll send a v3 next week.
