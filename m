Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AA6C7207
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 21:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206AC10E135;
	Thu, 23 Mar 2023 20:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14F810E135
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 20:59:02 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id p204so15334918ybc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679605140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siTlddsD9BwLsdvAOrWrUYDt/REtWPoX/LdY9MShx4A=;
 b=VopnpPIMoHFFI2KnaYlkgBN4hq4lRuWy7hMI2faKZpgZ4wWsMFrETganN8aM3WgHbH
 lXWMiuSLfgo1DRI8gGEAPs58bYmy235zbwabmqA+nUGIKkjd8I843Oudop05mOaBDMbV
 vCUGaj7oo5fFvPew9IaxwFSzL0anX9N8ZqJJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679605140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siTlddsD9BwLsdvAOrWrUYDt/REtWPoX/LdY9MShx4A=;
 b=5fHtLnqBvL6OrnC/56TQe9UHkuxqgh2WVIbUpbeWGHMu2MxPp1qdOmF+2sfeBtTGqq
 goO+tYnS+XS+hPQayQkY8OpGLuulFh9NqK7MTCq7QVvxs+UO2rE2gSZ5WbdVS5gic0dp
 +5EiC0Dlq5UEhslPyCMdT4FdAzR+0yeGlKc5zFQqbtrydb+iZyUiaboU5huwKzy+09pH
 uzUTOy3Nr7XN1LhZhxzk0UlbAw6dbztDATWSqgEPTM3alcdrKWRRSl8xUrz6uw8O5CXk
 orfwh/OwQ/D9xRfJw4FN+BvDbWpuWPIOTeQkzwOEYtpbzUzG0QZUvSrZyS0RnyN0CWTw
 Mauw==
X-Gm-Message-State: AAQBX9drC2/UJYOuwBwpb6ZjtcTy/CqyVWT3Ue5BYe5us63S/xhUBLGH
 FVlLLEI1r9U31D0Z3qlIDrOCcGN+cB9+AUtLbiI=
X-Google-Smtp-Source: AKy350YCdVMPSLEObC4mi5NJWzO6XuKyo7ZDl6v1CSReIF+3+WpGyaKmcr4KGbSmWeVwrAYQmwPLnQ==
X-Received: by 2002:a25:ae0d:0:b0:a47:faae:1816 with SMTP id
 a13-20020a25ae0d000000b00a47faae1816mr5133634ybj.50.1679605140374; 
 Thu, 23 Mar 2023 13:59:00 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 q206-20020a25d9d7000000b00b7767ca746esm41116ybg.11.2023.03.23.13.58.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 13:58:58 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j7so26446397ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:58:57 -0700 (PDT)
X-Received: by 2002:a05:6902:70d:b0:b45:5cbe:48b3 with SMTP id
 k13-20020a056902070d00b00b455cbe48b3mr18602ybt.0.1679605137060; Thu, 23 Mar
 2023 13:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230315035508.2874915-1-treapking@chromium.org>
 <20230315035508.2874915-2-treapking@chromium.org>
In-Reply-To: <20230315035508.2874915-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Mar 2023 13:58:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vqw3x20YH5oBVQuNmNvbApE79kZw8U0J3tJ2cPgha1_Q@mail.gmail.com>
Message-ID: <CAD=FV=Vqw3x20YH5oBVQuNmNvbApE79kZw8U0J3tJ2cPgha1_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: ps8640: Add a cache for EDID
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 14, 2023 at 8:55=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> When there are multiple EDID reads, the bridge will be repeatedly
> enabled and disabled. Add a cache for EDID to speed this up.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Remove the NULL assignment in ps8640_remove
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 60 +++++++++++++++-----------
>  1 file changed, 36 insertions(+), 24 deletions(-)

Landed in drm-misc-next:

6a17b4d1b52f drm/bridge: ps8640: Add a cache for EDID
