Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D7B5842B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F0210E52A;
	Mon, 15 Sep 2025 17:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZZknlNjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AFB10E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:58:18 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77615d6af4fso3888092b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757959094; x=1758563894;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJLVEM/+RXo9abva332LMQ7q3OHHpZR7J7yQ3y9DZUM=;
 b=ZZknlNjN0kNZ/K+kZlZOmsoHKWDSg/fafjqikJS//iIFKY98tTVjsJvlxTEy4oMaoo
 MJtAf2wxWS7aCB9/HviMFl1OCkJBarz1FtSwH2MmMe6mifvtkQEFp8wdVZXUXdLC5wDc
 Ok0uCCzHNNX8u09kqpNCgcQLnvN75TT8L3nT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757959094; x=1758563894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJLVEM/+RXo9abva332LMQ7q3OHHpZR7J7yQ3y9DZUM=;
 b=qk33dns8XA5HrvuDWZAhvYAoI0+j8ByCUIyDlmwd9L0Zeg7OFGfDqxacvYf/kApqPq
 W9vRFoEYYVg9VfYM/GT6ITChn4FXjpoZZpOO+bXt59ORewGg/X1W4b0Op0WYtnWiyPDW
 VORtalhUtJBBKi/Xy/MoQVkErUWQv9eoEbmvld9tViZG/NEfRI7iWCGWelO4nQV2c6kx
 SP2j2p/yighCyt1Jw16+oT4m/+pCM3bZN1lYWNmSe9+FsbYYc2OlzmcXSCsQwPpFtD2w
 iCeXKdD30kRXlLoMMEWMWBpir+WA+givn1s7FjCyrTA5Vd4e+orJWLTk8BOZJ1uldYai
 HZlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCqydijm4TdgY7M92vO6oUvHXIVDdmsit63ZGaaK4RUmYosEpxdO39ifwP8v+bliXuv5iptM0hTuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztjSvGNGc/HJQRIRDr53oOMfhmtGL4EFiwINQ2VPJA6+M6w9dn
 OdkWXNYsuXEWEKJ4HDWYWE9k6EcL38svdFK1ISPh8zASE4oP6vKGdHlrF+kha4opElkiTwoWpZl
 up20=
X-Gm-Gg: ASbGncsFwaubdWcnTYh11odvtl6yPfMfp11bp5FPdguQuXv71/Q6apQpBJSoHlbpgfO
 OeyImSoJGCjAsXaBfzulbZHLPpDqId+OOWbXSSN6XCu37Z8QaP4iD8ILmLO4xSKj/tsAKbtB6Kf
 0jGQNmNC+2c5xwStfDKsPS+wqCPMHsAYDuHfMC9njMTusMJVJlB7sUbc4rBx9g3SNgCtOhfmlah
 hGuG/tMAAae73SpkaPxMTunhA0HTEx7WwGE7gANudlh32hz80U1AElgTAFJzugXIfd424tKXyOS
 DYMvSSSV3UCGrQatoJtZGH0XQF4IVU9/W8xmxMjtzaTjW1nUJ0QJK15G8KfOZlbac9Aw4cw1dGc
 LhGqmVNOWoJORWlGoQkEfJz8Gtg+q/6KQBhK+cFhlDEFJBYmorU6kkUKrcyGEH5WIsg==
X-Google-Smtp-Source: AGHT+IH4Z+zU2CCNJYVbGp+kaHcHzz+e6wyh6rWz2zChJwUOksof7rFDG6HZujZY+/QDmdvMGxUIIw==
X-Received: by 2002:a05:6a20:d70a:b0:260:80e1:33a3 with SMTP id
 adf61e73a8af0-26080e134camr15716224637.32.1757959093651; 
 Mon, 15 Sep 2025 10:58:13 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com.
 [209.85.214.174]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a47601sm13735368b3a.28.2025.09.15.10.58.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 10:58:12 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2445806e03cso50401595ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxzVbrRp6NN4BQY62ad1QfludYAUPnBU46pn5xXtr3xWwuHVYceDjwVitQ4iMB5/hoa0xDPm6kg+E=@lists.freedesktop.org
X-Received: by 2002:a17:902:f686:b0:25c:f95c:8122 with SMTP id
 d9443c01a7336-25d26470527mr169156365ad.30.1757959091192; Mon, 15 Sep 2025
 10:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250915165055.2366020-1-john.ripple@keysight.com>
 <20250915174543.2564994-1-john.ripple@keysight.com>
In-Reply-To: <20250915174543.2564994-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Sep 2025 10:57:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xhd+0ZsUE3pkkii-Gijrwx0_Oh6WfRKrutqPQT3Jm_rA@mail.gmail.com>
X-Gm-Features: Ac12FXwvS7Gg8Am23kf54Y4k8rEMwg-5EolA1F18RxI6Ae5bp3Npfh3ORkXawzw
Message-ID: <CAD=FV=Xhd+0ZsUE3pkkii-Gijrwx0_Oh6WfRKrutqPQT3Jm_rA@mail.gmail.com>
Subject: Re: [PATCH V7] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

Hi,

On Mon, Sep 15, 2025 at 10:46=E2=80=AFAM John Ripple <john.ripple@keysight.=
com> wrote:
>
> Add support for DisplayPort to the bridge, which entails the following:
> - Get and use an interrupt for HPD;
> - Properly clear all status bits in the interrupt handler;
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
> V2 -> V3:
> - Removed unused HPD IRQs
> - Added mutex around HPD enable/disable and IRQ handler.
> - Cleaned up error handling and variable declarations
> - Only enable IRQs if the i2c client has an IRQ
> - Moved IRQ_EN to ti_sn65dsi86_resume()
> - Created ti_sn65dsi86_read_u8() helper function
> V3 -> V4:
> - Formatting
> - Allow device tree to set interrupt type.
> - Use hpd_mutex over less code.
> V4 -> V5:
> - Formatting.
> - Symmetric mutex use in hpd enable/disable functions.
> - Only set and clear specific bits for IRQ enable and disable.
> - Better error handling in interrupt.
> V5 -> V6:
> - Formatting.
> - Convert pr_ to dev_ for printing.
> - Add error check to regmap_clear_bits() call.
> V7:
> - Move status check in interrupt.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 112 ++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply to drm-misc-next next week unless anything else comes up=
.

-Doug
