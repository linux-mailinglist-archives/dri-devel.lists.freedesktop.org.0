Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5598B8B43BB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 04:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC6910FAA2;
	Sat, 27 Apr 2024 02:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x8u3OLni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0888010FAA2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 02:05:26 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-61b62005f38so28218707b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 19:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714183525; x=1714788325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bWxST7R5ZxzrDscEPj1WVcSCVkPOXWKQJTTlykb8isE=;
 b=x8u3OLniHRhU/g2HgORVP6a8vxB9No/cuJS7hsS4I6bjyiGEssHM9My8OO7WYKnkFz
 yz51OV8lKvTsca1w+5FGUE34wPSM8gzKwfca2V5Ng6SQUn8DmVECITpvi0ipGPYOBqiF
 51PlfOZ4BbOMC5WrcFDAfSH1U/XJQSSlpf9VGqJgpmbxRCx9OkguVG8N5QmQ4a3MeR5D
 C6ITCIpEIhrRe/IU8gG5OOwQiF4jHL2wEQg6MemWY8UPJnuGjdvb/++DDl7kM9Y653rd
 t9ML05bJNh+j65XNLXKRnXzaZLb4fJGxBKbFHuXLMDMq6ih0lBt5EtQwBjiuCijqVwfR
 PGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714183525; x=1714788325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWxST7R5ZxzrDscEPj1WVcSCVkPOXWKQJTTlykb8isE=;
 b=nP3pS+meyLDvJseab3iT0DVb9R7YDZp/2faLEitRsOvsF/nKprhwUjhHBZGgKaewTI
 uR03O7eJr33x1EB3AC5QUj6RJYBKhKzcVKMYBxoHGNCfqo0GujP9LxSTjr4B3J96JIR5
 UrMUpVFcVpe6JGW5W6WIuHFAIboR0Gf4a3wW1/I9YofpmYTCtTxDK63i4SMZJr2wwrHt
 5GV8JqVGkPFAyT0AsoLIre+9NrPBc1Iu0DP9yj3JPFiotymzqyjl8Df6Cv6/pFXRr9eK
 T0w/fvjs70zx/Y5UHaamqI9bStBleDCJO06g77i+7hqQ9gudeErQKcAUU/vlxqCcmCpg
 MVcw==
X-Gm-Message-State: AOJu0Yx2G1UZi2DDPCunWB3QTuyrJtQ1RNjJwSmf/DSuMT9aWkeEilcD
 TGsOyNKypWVLJsZeu70gtM6KCFm4vd/tH4yd2Msc6emaCS4gqU4lmKXZ1PtzpY5GVd6nneSUXq4
 25ePkWG1Suyuulbiw1xBByE4tLuotQ5FSz7yT/w==
X-Google-Smtp-Source: AGHT+IGnRShRp9PeR2/ALAStb8yu6otKEbYsvFyI+r1QREL275VyB3Nulrh8Ejld+RH/JqoCG6Z8hiJolHCvPun1Koc=
X-Received: by 2002:a05:690c:4483:b0:615:6d2c:2cf6 with SMTP id
 gr3-20020a05690c448300b006156d2c2cf6mr4974839ywb.47.1714183525401; Fri, 26
 Apr 2024 19:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.3.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
In-Reply-To: <20240426165839.v2.3.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Apr 2024 05:05:14 +0300
Message-ID: <CAA8EJpon4wAT8=U5t2pyzdDWDjY6651QyDSp0hJGn9WGks6-ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Joel Selvaraj <jo@jsfamily.in>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Sat, 27 Apr 2024 at 02:59, Douglas Anderson <dianders@chromium.org> wrote:
>
> Through a cooperative effort between Hsin-Yi Wang and Dmitry
> Baryshkov, we have realized the dev_err_ratelimited() in the
> mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
> kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
> version of the functions that includes the print. While doing this,
> add a bit more comments to these macros making it clear that they
> print errors and also that they return out of _the caller's_ function.
>
> Without any changes to clients this gives a dramatic savings. Building
> with my build system shows one example:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-novatek-nt36672e.ko \
>   .../after/panel-novatek-nt36672e.ko
>
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-21496 (-21496)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
> nt36672e_1080x2408_60hz_init               17412    6236  -11176
> Total: Before=32147, After=10651, chg -66.87%
>
> Note that given the change in location of the print it's harder to
> include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
> theoretically, someone could call the new chatty function with a
> zero-size array and it would be illegal to dereference data[0].
> There's a printk format to print the whole buffer and this is probably
> more useful for debugging anyway. Given that we're doing this for
> mipi_dsi_dcs_write_seq(), let's also print the buffer for
> mipi_dsi_generic_write_seq() in the error case.
>
> It should be noted that the current consensus of DRM folks is that the
> mipi_dsi_*_write_seq() should be deprecated due to the non-intuitive
> return behavior. A future patch will formally mark them as deprecated
> and provide an alternative.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Add some comments to the macros about printing and returning.
> - Modify commit message now that this is part of a series.
> - Change the way err value is handled in prep for next patch.
> - Rebased upon patches to avoid theoretical int overflow.
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
