Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49B794097
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 17:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0750B10E6AA;
	Wed,  6 Sep 2023 15:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9C210E6AB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 15:42:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-501bd7711e8so3598112e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694014963; x=1694619763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KJHngntgSXNMxKxt0DzBdQdlXtnfRcyHVCesrJpXWM=;
 b=WiLdgk9etHxmGwn3qIT/531jR2D1Cr/AA+NoIu/95+bmNvCTiWm7PvCwk9UIYtl5LC
 zUMDwX+RB/zBbR6XdlPpzhDHnS1RbquGFUIolR5R6xPoZgS9UaQdJm1AR9MHSjjlRVNW
 vr7Dy9HLUfDMV2wRa1Ji9+Ct0AxPPw1et7NRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694014963; x=1694619763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KJHngntgSXNMxKxt0DzBdQdlXtnfRcyHVCesrJpXWM=;
 b=YIXIGppRgrG38Fhr/Hf3u+H0N/mLYW650v4Lv8P6USUUrCiAIajGkNNfHemVakX3us
 4/2e2I9IfnfWtE8LRZHblO3fQIrWMRvaCjlYatis6j1ej8UWVZZPxralZRgLZ7NqMJr6
 VafgXFXI4VPgA0pQNoismFteC7ji0C1djBJVndPl4dWbcNahHKsOzzOZBZGz/19I0fKC
 GxkA4zquunx+jGKAzU23+TrPHW5Dn/Hxn3oENrOaKAmv/z5yaGaEy/ef2WeoezYxKc3s
 nr0aIT2U9j3OInSXh5h9E0MWzibroCZTHCEvAPZxYtvjuToo+qKjFy3yhjN8O6Kz2vsZ
 UaWw==
X-Gm-Message-State: AOJu0YwjnuvPUYboiSS/ocBY8RrhZj925xLhVg1XFof6+XRGpE59T1oz
 5IJeM4ee6UXRYwXDaXCoTAdqWh5O7Nd09rdTJQ9i2cJ4
X-Google-Smtp-Source: AGHT+IGj3jSC6md9E7Mi9z1asyJB2rNKxEsEWII727F+EL9rPhV5wbkuH65GI/cDVlLQUeAMu5Cmwg==
X-Received: by 2002:ac2:5a59:0:b0:500:977d:a4e1 with SMTP id
 r25-20020ac25a59000000b00500977da4e1mr2678030lfn.40.1694014963626; 
 Wed, 06 Sep 2023 08:42:43 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 cf5-20020a0564020b8500b0052e7e1931e2sm1892051edb.57.2023.09.06.08.42.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 08:42:43 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-52c96d5df86so13095a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:42 -0700 (PDT)
X-Received: by 2002:a50:c047:0:b0:523:b133:57fe with SMTP id
 u7-20020a50c047000000b00523b13357femr150283edd.1.1694014962171; Wed, 06 Sep
 2023 08:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Sep 2023 08:42:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFuTion7w4maxVVWZmzoRGXcoUjp9NV9xE3_Kf2ZCvTA@mail.gmail.com>
Message-ID: <CAD=FV=UFuTion7w4maxVVWZmzoRGXcoUjp9NV9xE3_Kf2ZCvTA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around *_of_get_bridge()
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 31, 2023 at 1:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Drop unnecessary CONFIG_OF conditional around devm_drm_of_get_bridge() an=
d
> drmm_of_get_bridge() as it is guarded with #if..#else blocks in
> drm_bridge.h.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6:
>  * New patch.
> ---
>  drivers/gpu/drm/bridge/panel.c | 3 ---
>  1 file changed, 3 deletions(-)

Just to be explicit, I'm _not_ landing this patch though I've landed
patches #1 - #3 from this series.


-Doug
