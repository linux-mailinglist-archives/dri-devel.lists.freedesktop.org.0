Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60C6C7203
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 21:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BFC10E143;
	Thu, 23 Mar 2023 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886110E143
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 20:58:29 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id p203so26398941ybb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679605107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXG2m3AhU8tFazET94PFq/bMhgtfxarcttWvDXsnJsI=;
 b=NBDzFged+JYkXhU/hB4dL/pjHnNDXwAc4Dx9aAuSvv1Wi7S+uP8We/ynKJ2Dk6JJgM
 1EosogQHe4gQYUl5axlda2rZ9VM8XW3d9Q3OkIS3Df52AnmCUCABKwgVNMWKqoHNIjJN
 SgPr6+Y7Fz7349LjppNYgrjIhKyh5bsqIKE1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679605107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXG2m3AhU8tFazET94PFq/bMhgtfxarcttWvDXsnJsI=;
 b=OK/6NlWLs78Gsi1iuQa0ofMyx1aYvoaAOVsOmH7o4Fpaih8apV8oNI94j8Jctu9nvG
 LBxEmG3Ucb2rFEAONOmyjR6StDh2J88IdfSlBGSQE3joImo/sMhg5KFFYSGo6uZhTaHH
 uLHUBQ/MjyktLhus0axidEV77tUq0cKHB2rbwSI60wuU5KWKXanm1zCfhREYeo61xy+a
 1Jj12ylaXHiiI8/2CO3lNZ3V1+j+An6i5auQa1Ca1fE+fpdYUU5sIRUT3GaJAKtBJcK0
 OoGMVszzwyKwuj3kRCRFT6gYY6sVftsRynzJtjK2hxFB5+T/J+dma2K6KKsuYk6z1lcY
 pJmg==
X-Gm-Message-State: AAQBX9ffAXg4+MkOeGZj3ahp7KXDR2lRyjSujiz4KsZ+oe7SsCsaUSC0
 L3o2L9QcyI9JiBn4E21Ok0EceeHaYKqqONoSI7k=
X-Google-Smtp-Source: AKy350azSEDj5Ex+AagKWlW14JMzu1fiph+F30iB/i/pzwKfUjVdhHjSNaHV+5plXAEsbp3jvUtVMQ==
X-Received: by 2002:a25:ae9a:0:b0:b25:594d:eaff with SMTP id
 b26-20020a25ae9a000000b00b25594deaffmr4783097ybj.57.1679605107468; 
 Thu, 23 Mar 2023 13:58:27 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 j83-20020a252356000000b00b7767ca7469sm41522ybj.6.2023.03.23.13.58.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 13:58:26 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-544b959a971so382622927b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:58:26 -0700 (PDT)
X-Received: by 2002:a81:b149:0:b0:544:b7ff:b0df with SMTP id
 p70-20020a81b149000000b00544b7ffb0dfmr2598921ywh.2.1679605105763; Thu, 23 Mar
 2023 13:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230315035508.2874915-1-treapking@chromium.org>
In-Reply-To: <20230315035508.2874915-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Mar 2023 13:58:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VxKO6y38nDUmppRseC7kP1cJCUEMkbUPMY1d8LzKe4ZA@mail.gmail.com>
Message-ID: <CAD=FV=VxKO6y38nDUmppRseC7kP1cJCUEMkbUPMY1d8LzKe4ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ps8640: Skip redundant bridge enable
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
> Skip the drm_bridge_chain_pre_enable call when the bridge is already
> pre_enabled. This make pre_enable and post_disable (thus
> pm_runtime_get/put) symmetric.
>
> Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Even though this could go in drm-misc-fixes, doing so would cause a
conflict with patch #2 in this series which is not a fix. Since I
don't believe this is massively urgent, I've landed both in
drm-misc-next to avoid needing to involve more senior folks to do
fancy stuff:

845e730eaf36 drm/bridge: ps8640: Skip redundant bridge enable
