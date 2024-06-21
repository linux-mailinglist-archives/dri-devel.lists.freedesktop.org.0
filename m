Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF036912300
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 13:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1975A10F14C;
	Fri, 21 Jun 2024 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMy7emWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F8110F14C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 11:07:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4217dbeb4caso16767855e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718968053; x=1719572853; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+E55Bqa88vXpyC7KNeYzEgmKWlWtFJt5B+iA497prM=;
 b=gMy7emWvHiXjackMEOFddj9zBTqH+Xh9LTPOPe8burhdQvQa/3tgrYPO5XNsJmvH2Y
 1DFkJaoVu766qoUdx9RuT3xY655oHtaH+qbGySjUmk0HQf7xDyJL++WWAgmNnSBhpR1E
 XTvAFLQfyIJIauNBp+NynFKtjxp8ubbwOPRb0upv6PtWAAbESBMUISutArewT1ktUAOR
 BeFBNMPXJxKXdkmtbxUwwzRGZSRNM2+sMyIZ+/4/ZXxiz6xzDcmeF0mmi3qMddckrZrd
 qdeiAN5s5wVrAok3pTvyPzBdV4u2LlQvMsnMr2C/u8xgaEAKBcQ+aKqN39QQ2atp1P0B
 T/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718968053; x=1719572853;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+E55Bqa88vXpyC7KNeYzEgmKWlWtFJt5B+iA497prM=;
 b=FoeYRkAZEScpDo/PwRkJvi0EFyVMp3snnNj4lnyYypapMsQjrFs3oTR3Jffn54YwGF
 N6z/HY3vpri2rOF+SKDqHajm1hrpA4t9/YYgvEQfM0FiNQI2Dg8qQm1g0wVBg1Dvdviq
 lQUbAn4u3ioEdRsKrISKJXuY7+nfOaVqIQzP9sAFH/GQz6fPHWC2/HldLmuQB8O49NfH
 ovCLNrWgLsNRVe0hvysbQKiUDRkrFNag5pUExziyNJQLXfskzbtahCz8r35e8my/Mmcy
 ReXbXHgNlR9C7srfLwvdzvUXLp3R25K7U63IXxes4IDifHLAzFXMz6atdbwQlVCXpzLi
 LGYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3VJjCvxgbgUi8T7VUuM5oD+UD8Qf6/5THrFgKIawCdfKPdF+ufbK2bCNmV11tHsIoW49lZmwNcbEYemR3TXZr18ZqTg9Xy8Y7thTIUU5f
X-Gm-Message-State: AOJu0YyL63y27JXPJ9CISVDDrgszKQoezH3l5qtur4b/vCjziSltQsW4
 zyiD8CtGwAq4TTKXqk0h8UsX4UhHZj7hl85GuT/G006wQFkv5pfO
X-Google-Smtp-Source: AGHT+IHscR9SP+ppu4ASqW5YmQmsS4APVFI/ixPfCUhAEhzSa9AwpZSAeYzXrKxdXcxqdTpqdzUPLg==
X-Received: by 2002:a05:600c:6a09:b0:421:eecc:2404 with SMTP id
 5b1f17b1804b1-424751809e3mr61337675e9.24.1718968052436; 
 Fri, 21 Jun 2024 04:07:32 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f694asm1415656f8f.77.2024.06.21.04.07.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2024 04:07:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 0/8] drm: bridge: dw_hdmi: Misc enable/disable, CEC and
 EDID cleanup
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240611155108.1436502-1-jonas@kwiboo.se>
Date: Fri, 21 Jun 2024 15:07:17 +0400
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1599BFE-FE99-453B-BE99-B22C79562960@gmail.com>
References: <20240611155108.1436502-1-jonas@kwiboo.se>
To: Jonas Karlman <jonas@kwiboo.se>
X-Mailer: Apple Mail (2.3774.600.62)
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

> On 11 Jun 2024, at 7:50=E2=80=AFPM, Jonas Karlman <jonas@kwiboo.se> =
wrote:
>=20
> This series ensure poweron/poweroff and CEC phys addr invalidation is
> happening under drm mode_config mutex lock, and also ensure EDID is
> updated (when the dw-hdmi connector is used) after a hotplug pulse.
>=20
> These changes has mainly been tested on Rockchip devices together with =
a
> forthcoming series that add HDMI 2.0 4K@60Hz support to RK3228, =
RK3328,
> RK3399 and RK3568.
>=20
> Rockchip use the dw-hdmi connector so this should also be validated =
with
> a driver that use the bridge connector.

I=E2=80=99m not sure my level of kernel fiddling counts as proper =
validation
(Neil would be a more authoritative tester) but FWIW, I picked the
series to my 6.10-rc4 dev branch (for Amlogic devices supported by the
LibreELEC distro) and AFAICT everything is still working. Tested with
Amlogic GXBB, GXL and G12B boards.

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

> Jonas Karlman (8):
>  drm: bridge: dw_hdmi: Call poweron/poweroff from atomic =
enable/disable
>  drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
>  drm: bridge: dw_hdmi: Fold poweron and setup functions
>  drm: bridge: dw_hdmi: Remove previous_mode and mode_set
>  drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
>  drm: bridge: dw_hdmi: Remove cec_notifier_mutex
>  drm: bridge: dw_hdmi: Update EDID during hotplug processing
>  drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio
>=20
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 145 ++++++----------------
> 1 file changed, 39 insertions(+), 106 deletions(-)

