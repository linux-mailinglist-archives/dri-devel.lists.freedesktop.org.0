Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77728A2AED2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D835E10E254;
	Thu,  6 Feb 2025 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dq5jKnTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89E010E241
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:27:11 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so12066381fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738862829; x=1739467629;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBijg/MWWNMLTZeDAl4JcMDsL9YDu4fhpZGRnrHfPao=;
 b=dq5jKnTbw8altOl7g9fX31vuNt+FH1i0IbRU5vvZ5x5VP93qvR9ApAso12H5W/4fM6
 clmPkiLBaTpPVz2Z8HXiX8D+mXbcKQ6wSjRs1KrFaJ+qAENP1c+CN05vZuOhoXJXjTWu
 BOln8oWGYJklZPAiaFs9JT28q4bNuihJj+rwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862829; x=1739467629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBijg/MWWNMLTZeDAl4JcMDsL9YDu4fhpZGRnrHfPao=;
 b=v0fzuUctpUmRyKLYdO/WoGAag9Xn+itO+gg6KoAtLASjH5UwLE7Yl80s9B6kxWAwr3
 erYl+RyL6FHHZLiq790uFwR3mdzOvDvTds/IV/uG4FCGfSvRsiiuaROuIDC+uYD/v8lT
 mpXsN17YmcLiSiQX90GtFfip7BFvnp2tdJ7lY28j/hTsAFICjUd3ex7GCYW48ebzpmps
 VPmtDGbUYozsm5HGmq3BpIww0w+SCcw6A2X2kSdyGoko6YOlLRe3O87bouAz+wmPtTZd
 h9FI59YDo3NrypXmDDwQ4iaZ6vdL1WiZOeyemK48mdnh+21zwe5i0D106uD3ZVUq6S8F
 UJzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3tkIGe7KHPINPAkTwJV1NQ6yAAFvt+Sjresayjw0UglB8dMwPDMkBWoN65oCCQLBLO8QBSgCsXdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMt78cJGGH4Y2gzieIexx1/y39XSq/CLaqX6PydcAJW/lgWC+z
 4uFFMcHpsU/FAZRxeQb6uGZ5532jojWgK72qFx/XWvtlPnFxhVeYaJHIkc1ZOKCfldlpI+cVhkM
 ZLPUh
X-Gm-Gg: ASbGncusELaHGm+o+W3mPRuN1wnRo5VDF2bdcsRaxMh9CEaCiuvoxQgJxvpPy2UwxTd
 7oLmo6VoEjUk2A56oVeCSnErZQREBE2bonYuBOa6tjOaTSxXPCtEng658PhSBB4zB5t8zXvX+Pp
 31cA0PmlVQswtq9JYwPVvM/vLD2wb6eTIOQ3fhb+qYkcs/Kb1CPcZu3GrCkhnmIS3Eikp5lMy81
 DZ0IO38YQdWXB5cAlxLxC2uDk79Me2wOQVmXQn17e11m9BiaKMgUQMqwkAdvMJ65T1C4LnKtCly
 sm9BWr2jtxt0pyHaOX0NJfQTCSJ3ArXTSsV20L8tprtQ1UGNzPqfd2Fytm0=
X-Google-Smtp-Source: AGHT+IEupB60n+biVWfFiKZM3PueL7On2FBv31zhsliEPBzCegZ78XBHJMGjgdjfPwvcn8WTTcYhiQ==
X-Received: by 2002:a2e:be9e:0:b0:306:12ad:8c7d with SMTP id
 38308e7fff4ca-307cf3863ecmr26346861fa.31.1738862828669; 
 Thu, 06 Feb 2025 09:27:08 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1a6afasm1777681fa.47.2025.02.06.09.27.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:27:07 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so12065681fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrG7+5l14CDRs/wbqGcOdCxDmaLo9BLQB3+PtgmXhArjP+BYWSF/Xg+LOkXVycjyH+Vtg0SzDMWA=@lists.freedesktop.org
X-Received: by 2002:a2e:b8ce:0:b0:306:10d6:28b3 with SMTP id
 38308e7fff4ca-307cf2f0ab0mr29592191fa.1.1738862827317; Thu, 06 Feb 2025
 09:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
 <20250206-drm-cleanups-v1-8-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-8-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:26:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UiL4-QMq-YW1vz39exETr+feAfUgk8CKbvB6AWpqo+1Q@mail.gmail.com>
X-Gm-Features: AWEUYZnZB-Z2teoI_9owUXED11rcj_EPx60vyBFO2w0QVK0rgG-h8fLXZ7hnhKk
Message-ID: <CAD=FV=UiL4-QMq-YW1vz39exETr+feAfUgk8CKbvB6AWpqo+1Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: ti-sn65dsi86: remove unused drm_panel.h
 include
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Feb 6, 2025 at 9:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> The file uses the panel_bridge APIs from drm_bridge.h, but no drm_panel
> APIs from drm_panel.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 -
>  1 file changed, 1 deletion(-)

I'm not sure I'd really even say it uses any "panel_bridge" APIs, but
that's a bit of a nitpick. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
