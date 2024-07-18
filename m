Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAF934553
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 02:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892E10E326;
	Thu, 18 Jul 2024 00:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QEpsxVHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF88410E326
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 00:18:19 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-447ea09c8ddso1269801cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 17:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721261897; x=1721866697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR5TgSXxmEkVnQyI32oZApsa806xibThRKsCEzfjQ2s=;
 b=QEpsxVHmwEN2DpReNCU9qBTS/3RGUxOIdxKRYKR9huIBE8/qyI8X+seI7Sl/uT2NM0
 PXIGUVirnC1UlGHKfN7wciCYyYvbt4t9D7p3p1CzOeW7J8wW2VBzrZfxFb7w2qFhxxzO
 8a2vEP2HvXpRQWbEn1E88e9OrSHc2Z2vvOagI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721261897; x=1721866697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jR5TgSXxmEkVnQyI32oZApsa806xibThRKsCEzfjQ2s=;
 b=kz3Cvoo3sc2cxM3EUnxYxcUIeU7y8NSB72YFvBYW/zvzIHbzFrsgD8qje7jabOBL2L
 xrTqG+IBXxr227aC6UvkvDoJVswkZm7/L+7giGsTZH8tQ95to2PoeOzWJPi4xGOFO/jv
 FD3ZhD631GFCNPYKNcKLFWdhbAMzw1uaKJybPzkLkvndU1S5R6I6NToV2gONHSs4qAiJ
 eZLEI1dMZOH2vM6t6bfXeY/7Ke8wHPsHfJu1EHRlldc/HhOefZR//TTWYIW17mbl/Q0A
 P6YebXf7DQd/sc4/6g/92K6KTYcgdDKOjEAbyiqrFo+kHJz9rXq+wf5AfoIT7bCheCda
 KfDA==
X-Gm-Message-State: AOJu0Yw5RzrJFYl5sHi5rt0ipludGLB2LoD1oZxFT+JaaA8s+msphQMx
 JMWbM5yyRzVDLZcbwOBi73A6l4mCwH5vLDhr4fw3pgLajYNsdlizsgJ/ZsIhBufo0cnUkn4KetY
 =
X-Google-Smtp-Source: AGHT+IH75W1cSIRXgCVitnQSOoElybZVkfqpQvFpIJH1YMpJdwdBWlDYgEYF8IUi6uqyIwEToBWWTA==
X-Received: by 2002:a05:622a:210:b0:446:5a73:31bd with SMTP id
 d75a77b69052e-44f8616a580mr43545121cf.7.1721261896692; 
 Wed, 17 Jul 2024 17:18:16 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f5b835525sm53421771cf.68.2024.07.17.17.18.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 17:18:15 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso156631cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 17:18:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2506:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44f925cad76mr430051cf.9.1721261894932; Wed, 17 Jul 2024
 17:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
In-Reply-To: <20240717215847.5310-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jul 2024 17:17:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
Message-ID: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Just a guess on the panel timings, but they appear to work.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
> find any datasheet so timings is just a guess.  But AFAICT everything
> works fine.
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

Given that this is a Samsung ATNA<mumble>, is there any chance it's an
OLED panel? Should it be supported with the Samsung OLED panel driver
like this:

https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3=
@linaro.org

-Doug
