Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F084AA7FCD
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6398E10E1F0;
	Sat,  3 May 2025 09:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpJ6SDfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E95B10E1F0
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:51:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1691259f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265868; x=1746870668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWt/E24dFyub98qTTTZajSu/749h8/WuLO8wYKjQfmE=;
 b=WpJ6SDfHwEXnbm6PGb2AuVhHdfqW77M95RiSDKnpT5/dp9+f05JJrnW5uA1qbQ6B3k
 OoQwYAaCgj87iBMnORH2NIlxpFUoHkWq0tf6vYSxGVvbxRGMx2WL5DxAiFBjXxRUcLcy
 xKeGlL63KjiVUAdysk/nj4n4uPLaYqHZ7PbaBFWoLMQYC19VtIi+5uaVUYb8m499aQcw
 TxYNxnHg6iq729Iz4uVrPiMwjrspm/jgv+sQGZaMX1w53rE7OlJKfxp4h0EevTCNWYad
 X1UqCQmXlW2gbU0Oj6rVGxfnya2q4wcWV/aoLarjntoh9eeAAQPUKNJNZXFLnvcgSTWM
 LPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265868; x=1746870668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWt/E24dFyub98qTTTZajSu/749h8/WuLO8wYKjQfmE=;
 b=fnX+XjMKLqQvlZwF8q6zL0OYSRInvX+SJVfP2mir5S33AUu370glTherK9s6guYD21
 Bn/RuhuG3bAixreGS2dyY+Q/ZRJuIx+V8yIW3d66rZAJW4zjlqyXI4h9weQ/OqxC0wqO
 JNORPj/+DoF4Z0jOs1TkuI6wpwG8bCiqW5tGf8ydsc+G7kbJuFDZ1+C9kIoN8XGsbC1Q
 AqHGS1bg9elc3FtmhYiBTuMu9QXP8R5ANW66vHWEhT12sbxXBnMRWmf4DLzyvfpLs636
 0Pcwvmdrlyh77f1p8m4C2s2Lsp+ooNfSB93jyMEQI4v9TDFxC/hThyJCa0VZqBZdyTEq
 32GA==
X-Gm-Message-State: AOJu0YzHavFmeIEL5E+BVb4CSnPzf7iS/U8q88k6tSskk1vBDAYC+y+3
 RqzP8Wsv/AU9aIobAkIqNKlD5eiOXpq1vz5Wxo21iB3y0IUzM3oH7KxH9E6KtxjqnUA7uY2FgHH
 Z78CsAepd+vKc0m3ATfEHuIwxGUQ=
X-Gm-Gg: ASbGncv3io/kV/z0zE6yJsppnhMmShckhnkIvpnnKodSSnygf2Ud2xS2b9js8HCuYxK
 RaZPk/cwv0WkslxvbXB3dh/MJlwQdNC5hOHA0KXbi1P/7wM8UelWTMsQ9d5fQSc2b3sXSok+gl+
 sSnmf8gQb6ECH3qQrgYOUVNopIp2B+UUgoOg==
X-Google-Smtp-Source: AGHT+IELmDa8tUY8I6sTC32dmcWCs9uyqHPcxFCiqKy0asFsnzb6BDBRBXfnErIHdF0nShPafFx/rVrq/S2iBlEpens=
X-Received: by 2002:a05:6000:2411:b0:3a0:7afd:cbfd with SMTP id
 ffacd0b85a97d-3a094034df4mr7175956f8f.7.1746265867684; Sat, 03 May 2025
 02:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com>
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 3 May 2025 12:50:56 +0300
X-Gm-Features: ATxdqUFfzmyWFFfsWmwTVH5O2UO-xmaaejS3vhiKg1fJkdEwVYfMrP98aXjh3Og
Message-ID: <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

=D0=BF=D0=BD, 3 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:05 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
> MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
> P1801-T.
>
> ---
> Changes on switching from v2 to v3:
> - place mstar,tsumu88adt3-lf-1 alphabetically
> - fix typos
>
> Changes on switching from v1 to v2:
> - sort compatible alphabetically in schema
> ---
>
> David Heidelberg (1):
>   dt-bindings: display: extend the LVDS codec with Triple 10-BIT LVDS
>     Transmitter
>
> Maxim Schwalm (1):
>   drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
>
> Svyatoslav Ryhel (1):
>   dt-bindings: display: extend the simple bridge with MStar
>     TSUMU88ADT3-LF-1
>
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
>  3 files changed, 7 insertions(+)
>
> --
> 2.43.0
>

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
