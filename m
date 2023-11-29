Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40D7FCB5D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F910E35C;
	Wed, 29 Nov 2023 00:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36BA10E35C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:32:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so837150566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701217946; x=1701822746;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IYjqVnP6VX15cMyywBnNoaA5nt5J+0q+5L0rVvlUyA=;
 b=Dw9FQxH9kIcymv258zUvGimvGSJ6+YNlsBpt3engHmvi9QF1tfF53jNfwP1Lw5J+cw
 syDLxF5+tGQHuRI0pFowrZUbzTpMOUzLIYXGex5PLe4wyjaD7lEUpZ2pROpuic23u8tA
 ZqWBdTdUxVGVoXQlJgc/J4aZFUeg4GjWOd6No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701217946; x=1701822746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IYjqVnP6VX15cMyywBnNoaA5nt5J+0q+5L0rVvlUyA=;
 b=LwyeRYQTIzeg42mg2i08+atdCmMJOsOWvQTJpWh8z/uVWWbgQsauNTpROS9acANyci
 Ml+W5/S7Kjms8I4v44mb8a/P2ko8Zn1kcRjeK2fENN6CbAxov8WnnDq+Bjkl83jjOocI
 rDSTFdGRkm8DqVzgtL+BbJECXfaBk1Md50ShkvZnU8rxG7K+aSuYo9fVvoETvZxefDfY
 4YH8eu+RYrpnZpq6eOnffGcNZrAwK86SKDrwpW2yT25URwlD6oslEtQSNr88XSVrEfme
 5e8QnYOJSDyIIUDN3UBv+osF/MRzVcioj4M2QrtQ1rlx2DCfdPbS4ZHISDpK95U3/AFz
 35AA==
X-Gm-Message-State: AOJu0Yw90igt8tFolhBx3M0agCjrNMkIsoWdQoNvUUUNpHT4z1pxV+3T
 j25ig2rQ9kpyuG6pUxuytEYFfnggcnHWBvOQMpcIiF2B
X-Google-Smtp-Source: AGHT+IFPf6yCL2sO0VdY82FfKzZnOmRbK2MkVCzy8izvauw1shy0cZnoGTVNf20s51nZ4hZzKehRLw==
X-Received: by 2002:a17:906:3bc5:b0:a12:5dd2:4649 with SMTP id
 v5-20020a1709063bc500b00a125dd24649mr3112688ejf.43.1701217946369; 
 Tue, 28 Nov 2023 16:32:26 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 k10-20020a170906578a00b009e7bdb0d5besm7323222ejq.30.2023.11.28.16.32.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 16:32:26 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so13085e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:32:25 -0800 (PST)
X-Received: by 2002:a05:600c:2047:b0:405:320a:44f9 with SMTP id
 p7-20020a05600c204700b00405320a44f9mr867158wmg.5.1701217945260; Tue, 28 Nov
 2023 16:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123175425.496956-4-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 16:32:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0qxT94HuTiZKO1WrnVNbcW30vMQP8NSo5gz+ijBv1sw@mail.gmail.com>
Message-ID: <CAD=FV=U0qxT94HuTiZKO1WrnVNbcW30vMQP8NSo5gz+ijBv1sw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to
 ti-sn65dsi86 core
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <andersson@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 23, 2023 at 9:54=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Introduce a dedicated private data structure for the pwm aux driver
> provided by the sn65dsi86 driver. This way data needed for PWM operation
> is (to a certain degree) nicely separated and doesn't occupy memory in
> the ti_sn65dsi86 core's private data if the PWM isn't used.

I suspect we still end up at a loss memory-wise. All of the extra code
+ the overhead of another kmalloc seems like it would take up more
space than the tiny bit of data in the structure.


> The eventual goal is to decouple the PWM driver completely from the
> ti-sn65dsi86 core and maybe even move it to a dedicated driver below
> drivers/pwm. There are a few obstacles to that quest though:
>
>  - The busy pin check (implemented in ti_sn_pwm_pin_request() and
>    ti_sn_pwm_pin_release()) would need to be available unconditionally.
>
>  - The refclk should probably abstracted by a struct clk such that the
>    pwm_refclk_freq member that currently still lives in ti-sn65dsi86
>    core driver data can be dropped.

Right that the above could be done with more abstraction layers. I
guess the question I have is: how much do we gain with that?

Personally I'm not really sold on the idea. If others think this is a
great change then I won't stand in the way, but IMO without a
compelling reason this is just extra abstraction / complexity without
any gain...

> +/*
> + * struct ti_sn65dsi86_pwm_ddata - Platform data for ti-sn65dsi86 pwm dr=
iver.

Why "ddata" exactly? It seems like this is just the pwm "data" ?


> + * @chip:         pwm_chip if the PWM is exposed.
> + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> + * @regmap:       Regmap for accessing i2c.
> + * @pdata:       platform data of the parent device

"pdata" isn't a member of the struct, but "pwm_refclk_freq" is.


-Doug
