Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9FE8B1C67
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 10:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B0C10F894;
	Thu, 25 Apr 2024 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pGRFpXjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5A610F894
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 08:03:08 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-de477949644so795770276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714032187; x=1714636987; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y2BwMZXFm0L9AAXwMySeLBZN60aZGomq2yuNgtOR/fg=;
 b=pGRFpXjvd/0CDFTa5riuF7JVBSw3bnZ136a1aeTqsaPooJfDaMmYuSIde1zVVPGraT
 HavQ9eEKA140zvM4N7Am0leVMTe1uatOYeeWr8MHVyZXYihh1YP8seVH9rW3k/3jPsd7
 lhS7wKeUzs4hTWsdMMSkrCIffEOGdV6LE5s+36ecSd2vJB3S0LyPJYNVvSQGNBupITcB
 +aTplb7rhLxeeLP7qZdIAk7JgOAT5/cSzQ9j2Zu2uHO9HoBpTFUfM5V/PgueNOwJbK4Q
 9wCvJx96Wd6tFANjn0eOQlzwCXO6F9u/3/YR23R90nI4uj2d8ygvEEn9C3tKl4D17Ft2
 jHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714032187; x=1714636987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2BwMZXFm0L9AAXwMySeLBZN60aZGomq2yuNgtOR/fg=;
 b=SDxwTqatVrBEcF/1ppLi2Hx6+P+opGOi/6Xel7764BSCdsuj5MVY/EFdtyAOinIThB
 va194rvAW5FjedyFOJPeAAJy5kJqoEs5QrQfXXZbPZJIcdy0ENioAX98ouNGehvaDMGC
 hxgrGviaEx4XHIEDcUJoS07UaxohRcCJMrbSP/0v81Tee7RkBl+HOLjI1OcOAeJjZVwu
 J1N6AwS3YYfDrZffx8mR0Qpbkptsf7WVKpz3Id2gprzYgLQgfBpfcfjpXOSPlxBJa/Wo
 25AqJXXCdvQz3SiszLeb3LfgTQ624S7bph7Y21ZJEMIuD71mLlptAcSVzbmoZ+4to8IV
 l3ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvlAYmsZ/FSHjyE8gTXTQ4Sn3G2LWx0CN7PNRXxHohEjMe3T2dujT1A0lVa+FQ0BQ+7URswrjfWtKtM510qpzidcy3XnIAVMWlrcyrd7IC
X-Gm-Message-State: AOJu0YyPB8qGyB/W+ogpCHQdLbg50vLWlrCB4K0n+0A4QhCcAhr5OTIH
 kLq33L00z6OL6M3W/BgniaJ6UaobKKqK/T4EKUvPSoc1Coe9oK62yIUYrqEkkIbbPH5fGwNWCTf
 bR9wsj18M1HtToqI5UIgtVOFNrJaMm1gIIMEjKg==
X-Google-Smtp-Source: AGHT+IFkldo+vd6Mqtt1W7SjY880Ctl0aJc8yw+e5geIUtLXOum8JAuNYHkA+bs9AdjkfTBSrq+5nwYSpMu+pDUVJ60=
X-Received: by 2002:a05:6902:604:b0:de5:4f40:689b with SMTP id
 d4-20020a056902060400b00de54f40689bmr5315526ybt.25.1714032187496; Thu, 25 Apr
 2024 01:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
 <ul5vzz54kppxo6zkr7k6seejmmlgp3d4dqfzjlj5la3e5ltolo@ug5dtoknkibu>
 <16de57e6-39c1-4528-b9a7-8b8af2ec6880@linaro.org>
In-Reply-To: <16de57e6-39c1-4528-b9a7-8b8af2ec6880@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 11:02:56 +0300
Message-ID: <CAA8EJpp0KNXWdUVd38-+cOHOC45_orzY5vrv_VxtE9-Weo5QUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: drop driver owner
 assignment
To: neil.armstrong@linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 25 Apr 2024 at 10:47, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi Dmitry,
>
> On 24/04/2024 11:12, Dmitry Baryshkov wrote:
> > On Sat, Mar 30, 2024 at 09:27:40PM +0100, Krzysztof Kozlowski wrote:
> >> Core in mipi_dsi_driver_register() already sets the .owner, so driver
> >> does not need to.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>   drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
>
> I tried to apply them but you already applied them... could you make sure to notify the list when applying ?

Ack, excuse me.



-- 
With best wishes
Dmitry
