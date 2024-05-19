Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D18C9392
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 08:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A8710E0B4;
	Sun, 19 May 2024 06:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pj4IupAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253710E0B4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 06:18:05 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61e01d5ea74so15028717b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716099484; x=1716704284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXriUzICpDBRNTiZbaNDcq7UfRydL6wZIv4JRQHCJnE=;
 b=Pj4IupAeJ1QKK3BlIwVwXLpSHdJomDVuhW+lexfWELPbkrveB8NIln37WthFZsano0
 nfImoprBQ5zBr/oN75NhMKUsQBp9DoEL0NhYYI/yRcFkgROz5QgclqKVSlOYm5gIqZBH
 j3L3ly+zjO7BvRrEug3WpokJb4eG3jIJBrvst5wMTjY862jfYwC0xwGrfRWMpxUnJQMo
 4hck3PXSIwmPT5u0EM8bWZvjNH3WiA+gKkKuo06UQVXel7agLMk52iJ0iJmnr4cfsz6M
 ZD7JEuW9xGQbzy0u5hrCXogaX8x/z5wN+EtgVasduGhwcD2Vsdav3JEEwtvAP+UX2xmT
 uxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716099484; x=1716704284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXriUzICpDBRNTiZbaNDcq7UfRydL6wZIv4JRQHCJnE=;
 b=G1PjYwelHPO92bJqe91uqqlq2cZQia2kF1QOEbDEzp90cPGaxOTN1iUUYV+krlL1N9
 52qoDB7s1+WvdmRGWg14NBmYp6EtXDDyXzaSecnER+UwsQzHSSw5t83Fghwq2ve3rG9h
 O0YYt8rgna3FYuQOLAy+PYQgQ/YDe7QfBVD2APDTLz24FcxhdC8g5QswG7QNxa23oFo4
 cjPeVsV04NbXTxP4ObOIwzrwYBQa6Lg3mwSUpyx4N+YGTAvb9Ai9/cmBKEfPFCCh7jBo
 rCti+gpTWX8pquKsNBdAZkmoZEFlVn54tG17NnyMvt1RcM7wzH8mY91Ro+TPdkGWA8gy
 7vCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX0NvQrPSO2gwxP92UmP+lV5xDU8YYfSAu22xnFdQOjMsbaSeGlEfzs/8Dj2zydZQyhiieJYXc7e2f25YRq/qh4uPusQo214/58HWAYOCj
X-Gm-Message-State: AOJu0Yyk8Zt8WHONihIUSav5tUFs+yX9CNUSR5V34zNFGKnxFGoQ+Yj6
 LSAbwiu7BRnbTYmjhWYpyil6xOTMtXAWHjS2CdHOofUBoXUbXAopGWhoNUjiggsiY1QNtEu3WRo
 up5ha4EuzTiXUYgP8cC5/k3Uh57Op4ZJMuMUnFg==
X-Google-Smtp-Source: AGHT+IFJD3Kq3vPuYgkMWKc7CO+LDFPu6iA9WZLK38fvfnvLK5wrb1/eN/GRsNfOPrluONXSLuJ9tQ39/0h50f+M8VQ=
X-Received: by 2002:a25:9d83:0:b0:dee:673f:7a29 with SMTP id
 3f1490d57ef6-dee673f8901mr20976923276.32.1716099484044; Sat, 18 May 2024
 23:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240517213712.3135166-1-dianders@chromium.org>
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 May 2024 08:17:52 +0200
Message-ID: <CACRpkdY1hB3CABE+EJmkG6X2u7k=ETNB-7auC1EMxGui9f4JOQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/panel: Some very minor err handling fixes + more
 _multi
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Ondrej Jirman <megi@xff.cz>, Shuijing Li <shuijing.li@mediatek.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Xinlei Lee <xinlei.lee@mediatek.com>, 
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

On Fri, May 17, 2024 at 11:37=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:

> This series is pretty much just addressing a few minor error handling
> bugs that I noticed recently while reviewing some panel patches. For
> the most part these are all old issues.

All patches look good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
