Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04D993A9D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 00:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3710E443;
	Mon,  7 Oct 2024 22:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ev2nfEqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370F110E443
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 22:58:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539983beb19so6155918e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 15:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728341913; x=1728946713;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9IXdCfaNtqS6OVy5IGIFP7SGWVPgo6mw3WGn70+14M=;
 b=ev2nfEqYrRN8KSVJLoi/3fVHaQwkNu8Qpq9N6yghITYVNqRSMwQwf+Fq72YKo3nGvR
 HoqDwmNAeTIcNrzIj7OaryLz+NJyoCXSviZDCZJqgfhv+T3Coup+h/uCQOO5ArKOGenq
 LqhEy6by7rvXCYn5IY4v16CL4QSNpUKAIhp4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728341913; x=1728946713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9IXdCfaNtqS6OVy5IGIFP7SGWVPgo6mw3WGn70+14M=;
 b=e+aRaAeqnXfSmVbUg0SzqjiMTn4uvu8QMFdFxS0m4T4EWIxIdnQsXsIE8cOkI3ro9n
 c67CBjHIuEsFQ6eZibaqhtIrqcSfZnVuVarGDJi1hqy8XGqcdK7G3FL/aFs8vBNNXFX0
 rfYwBFLsU9kGAu1VTTCge4O/qxGaIPe8kuVbQr6T3caeX6haxLfYQOg1I78P63kcbAho
 LKpGp1GGb5/WnhLj1Ge7gj9oXOFG0vxyZOUeCSNSXEhlCnJskX4TQv5ua7VR7ZuSahCJ
 VlYDOnJ96Cr8ripnSLvIvRRFGBlZRQCRNvF4JpEgURxHGm89W21DimYs81jLUu8/S+Cl
 Hvjg==
X-Gm-Message-State: AOJu0YyUoMtIc0tEf6+eAqtqh+WXYqYjamrDN95KxZd+dtp9CTHbnAZk
 yhoEj7iaxYybHW7ozSDSOQb9hCrKWuuukcVZwlq9nXRdEYuP5298hPbGrnxrwjxJWy3OAqK6xoS
 ChA==
X-Google-Smtp-Source: AGHT+IFKzLA6Xcz5/s0ZR1Fr+Y/UFWbWrrn2govbDZ6URmFK92KMxocVbKbuNldinh/E7U9U0JhGyg==
X-Received: by 2002:a05:6512:2355:b0:539:8b81:7f19 with SMTP id
 2adb3069b0e04-539ab86810bmr7505703e87.22.1728341912880; 
 Mon, 07 Oct 2024 15:58:32 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d3cdsm986733e87.166.2024.10.07.15.58.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 15:58:31 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5398996acbeso5506934e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 15:58:31 -0700 (PDT)
X-Received: by 2002:a05:6512:3b8e:b0:536:5646:251e with SMTP id
 2adb3069b0e04-539ab84e0b8mr6613892e87.10.1728341911337; Mon, 07 Oct 2024
 15:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241007201356.10430-1-alex.vinarskis@gmail.com>
In-Reply-To: <20241007201356.10430-1-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Oct 2024 15:58:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsLHQ5KkOekMntQ1GK=TFoGKN9kaMcLnUmXBLtrmP4qA@mail.gmail.com>
Message-ID: <CAD=FV=UsLHQ5KkOekMntQ1GK=TFoGKN9kaMcLnUmXBLtrmP4qA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com, 
 Peter de Kraker <peterdekraker@umito.nl>
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

On Mon, Oct 7, 2024 at 1:14=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Introduce low-res IPS and OLED panels for mentioned device.
>
> SHP panel's timings were picked experimentally, without this patch or wit=
h
> `delay_200_500_e50` panel sometimes fails to boot/stays black on startup.
>
> LGD panel's timings were copied from other LGD panels and tested to be
> working.
>
> Particular laptop also comes in high-res IPS variant, which unfortunately
> I do not have access to verify.
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Tested-by: Peter de Kraker <peterdekraker@umito.nl>

Your signed-off-by should be _below_ Peter's Tested-by. That means
that you're the one that signed-off on the fact that Peter tested
this.

> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

This looks OK to me. I've been requesting people include the RAW EDID
of panels that they add in the commit message, though. Could you do
that and send a v2? Also: note that since I didn't see Peter provide
his Tested-by himself, I'd probably wait a little longer before
landing to give him a chance to object.

-Doug
