Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609C78DEAC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 21:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47FA10E5A5;
	Wed, 30 Aug 2023 19:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76DC10E59E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 19:51:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bed101b70so751960466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693425106; x=1694029906;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFxy/5km8F3IE+PzA+aM3e4Lk7VngPbyZnO7tUwI/KY=;
 b=N5DZnbXL6vjwW1O6Va7aCuD1kolB48RZTp6WirBVCJLXwZcwZMQCoHQ0aiCyjJU1zd
 W6+comkLqF+avOF53Qv0bQ8UmpLUKnk2RTKaia67ODNxppOJhyMaCfMkdUIhAWxJ8TgB
 v9I8SkNGwfZpaGOyBbZmHur9XBH39l510izGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425106; x=1694029906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFxy/5km8F3IE+PzA+aM3e4Lk7VngPbyZnO7tUwI/KY=;
 b=Jxs1KPShdZtKp/wRUaed9W1+9aLYQeXzGC+CTphARZMfinSQGqPoQJkG1pWUntVAtc
 qDTKw3hYP+b81WRuw5bmiKl3uUj1fCGkAz5173uZAKgWp7xlzXsZ2+1NDSPG6Hg4AL3u
 m43D3H5JzMjlFLqM929s7wEIDQnlhEwx0TSgBQgyLSWT1D7h2SxfUdQUqTMqrIZ3rFDG
 aXd0eaKLAvV1f3nglbNp/lubbCN2Ilz0r5wq5vhPFG0aRnMpDdmwwaqZAFPL7IPGG6el
 U2etbj0X62M6BCz446xVSEsxfl6liStTaaeuAWRw1kD5jamT2h5Z0xIUScJDBV8p3ckZ
 qf1Q==
X-Gm-Message-State: AOJu0Yy84CZj5L+jOc1uVcd1Ew35qSqkvBhpr4WE02KzeMcmOuNyC2XF
 oT9O4CJuopNmCfcZAEis8l+nEhNMacVCWJhQpueau48u
X-Google-Smtp-Source: AGHT+IGf3LLc2kqAfGL7z4aACWVxiGwryu4fr6Z/RngWYuOMzEhB4++nLmsQwCRGWKPWV/a9KKCjhg==
X-Received: by 2002:a17:907:75d7:b0:9a5:7926:e391 with SMTP id
 jl23-20020a17090775d700b009a57926e391mr2353348ejc.10.1693425106479; 
 Wed, 30 Aug 2023 12:51:46 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 n18-20020a170906841200b0099ce23c57e6sm7536344ejx.224.2023.08.30.12.51.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:51:46 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso755e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:51:45 -0700 (PDT)
X-Received: by 2002:a05:600c:c8f:b0:400:c6de:6a20 with SMTP id
 fj15-20020a05600c0c8f00b00400c6de6a20mr23687wmb.3.1693425105614; Wed, 30 Aug
 2023 12:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
 <20230830170819.309269-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830170819.309269-3-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Aug 2023 12:51:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USEXGTEYNLQaQX+fzn0AifZTEMwkNSZCncF0ORu2q1Xw@mail.gmail.com>
Message-ID: <CAD=FV=USEXGTEYNLQaQX+fzn0AifZTEMwkNSZCncF0ORu2q1Xw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/bridge: Drop conditionals around of_node
 pointers
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 30, 2023 at 10:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> The commit c9e358dfc4a8 ("driver-core: remove conditionals around
> devicetree pointers") supposed to remove conditionals around of_node
> pointer, but it missed out drm/bridge.h. So drop #if conditionals by
> adding struct device_node forward declaration.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * Split from patch#2
>  * Updated commit description
>  * Added struct device_node forward declaration.
> ---
>  include/drm/drm_bridge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
