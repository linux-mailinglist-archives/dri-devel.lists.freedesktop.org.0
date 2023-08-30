Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51E78DEB0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 21:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A83C10E59E;
	Wed, 30 Aug 2023 19:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB18210E59E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 19:53:21 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce529fdso14794a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693425199; x=1694029999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41hvAPL8iDSd2F9dx5AwXqTXvkVERKd19eESU0aBFm0=;
 b=E3JFDmsq1HwYuWS5JnBm46Uc9wx35VPgMQNuq8bOq2BJpsiIh82wnvB5CsSdn9xey+
 /NGyMdnH+i1W9DLykXtZbBhLBXhH03ClxBykZyfTtIU+Ri4YcK8tiOSKtnqZhuCS20ec
 V9UMxeiMv9q+Rasi5nUYLN/+BhbpVdge2jaUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425199; x=1694029999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41hvAPL8iDSd2F9dx5AwXqTXvkVERKd19eESU0aBFm0=;
 b=VLEISWNwRjsvnbrEQLxZw8cxz08sf1HNo+XL9JDx+v2sj0+3V4uK37HIXmi1NfGazJ
 uqJyyvz9xk6wk5YILcP8UoX3xJnH+4REqzD3rr+YYS88HfmiOnWqdLmGxCQxG4zF+eQZ
 lUM/6wrFuWr0ncK/SjdM4d6+8+Y6Oq1Hm8XedQI9/7DT1rKtuyd+63pX5DygNzqajMUe
 sPJS38LKbWp8sxG3Jg0/V3jwBjyHefYVpDsZUxQbhvg67Qz6MEFQz0XejF87OVpUL52s
 k6qdor18qCisXP0fEhOMrVW38Yqu7Y5xL4fry9Je9dKDfSM0Rl2J6/eH7/JAG4IWzFOx
 7riA==
X-Gm-Message-State: AOJu0YzmE/qdHN7NokxwIt04TH6UM3qqJAV0ymyNIKgRshJ4gLvAK6Rz
 QjzGqEB0D9Y1+sTnzl5p69mXWfVZ/ZgyqnAEM5Tfq7ic
X-Google-Smtp-Source: AGHT+IE/eeKMsDBGdBKCcNI+q8nUP2fcAVfYNOzBu4s5Y0p4bMbHX0lom4RS/q0C5HFLlHOMnY2RRQ==
X-Received: by 2002:a17:906:cc59:b0:9a1:fda6:2e27 with SMTP id
 mm25-20020a170906cc5900b009a1fda62e27mr2636009ejb.55.1693425198952; 
 Wed, 30 Aug 2023 12:53:18 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 b8-20020a170906194800b0099bd5b72d93sm7546368eje.43.2023.08.30.12.53.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:53:18 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso1205e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:53:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3d89:b0:400:46db:1bf2 with SMTP id
 bi9-20020a05600c3d8900b0040046db1bf2mr31256wmb.2.1693425197923; Wed, 30 Aug
 2023 12:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
 <20230830170819.309269-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830170819.309269-4-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Aug 2023 12:53:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULqAZ=7ArRmoeY_=V7mYOhZK1UeJrPPJ8X1LmrATD_vw@mail.gmail.com>
Message-ID: <CAD=FV=ULqAZ=7ArRmoeY_=V7mYOhZK1UeJrPPJ8X1LmrATD_vw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/bridge/analogix/anx78xx: Drop conditionals
 around of_node pointers
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 30, 2023 at 10:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * Split from patch#2
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

My current plan, assuming no objections, will be to apply all 3
patches to drm-misc-next in about a week. I'd also be fine if someone
else wanted to apply then. ;-)
