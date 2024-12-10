Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9969EB774
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 18:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C055410E930;
	Tue, 10 Dec 2024 17:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="X+vHMb81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C94710E930
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:09:10 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so29915681fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733850547; x=1734455347;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
 b=X+vHMb81EDUWAVcD49CnWRueKwCXahWg2FFAV85gKcZY+UMSCjKxKkOYZbEYdSiZs4
 65WUkmtbF/Qt4n0nQ2xRZhbY51fm0dYTkJ7sUQ69Z5JFpcqsUWSNYT5qIrARtLVp26Hz
 cVGJSQZCv/ImSKTSV1G2TprkIp3DFeTldyFvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733850547; x=1734455347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
 b=vyZgBa+zKJSNP7Is7InIClPaqg70uHSXwiY+UnUgOSrGs38fl+CNXkc0K6gfz87KEc
 giTa6sTlbPxT9SIgIJCuGmMMRVnqIKiJx5+JN7AxtmOXEs0NMwoD/ZcVbku/a5Pfdu7W
 vms/ieilcaicI149flXT/qVcFUJxKYzYtV8dOeYl9XRWHWGFn0f0rj9M2vTsPAwgJX/2
 JR1Gwqvx3Rc+Bqk8gP/ZepXjXe2F54XM3jbA2N0+9YGyGiClTlQLQSRs+RpTDyT0cqBk
 dIJskm74CpUDy3vjinQ0Kf1ekg2FCPFrGOVU0/jbQmNIntegpTI/ii705MwpL8o2tm4I
 jeOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIPpZXJ1eGPPhQhZyt9MG3gVHPScATDfH0IF1bGsCRRNp2YlTlPjwaDZluchSrR0GYbHYJv4Cqn4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqQC0nm3cdIwfIhOUE5r5+wYtUYcWkVSfPa4sDIt3zp1jDEXVl
 F/jLxqi0B3R3VtZT1SptU1ATe4ktkus79NZ8ZWpCGxkVp+40kODKmVm2qcM7V09gwnqJvtK3XIS
 rXQ==
X-Gm-Gg: ASbGncv+cnhJBsVpDnjxEpjNOguB4CvcJrQ8Gl5EBoJtBFjDd4h1zzkTh6h9wP4V+gZ
 KicnlqabCxufKHbNfaTqgcKg6DVGXN3HUEInfKa/8iIAnAX1nPAgU6vEVM6VIjUI48+mAohvRTf
 c+T+ijc7XCn0I/H7ZxPFA4rVIKnpt0g13YXTR8wbV7vn2wreN8HtBSZQPQcRcN9nT61GLb6aTV+
 01j8numI/n4waqStDk9o3xhFlqDpl4WdlJNfXelggZVBiq3zu44jFnl164sVBf+McQCnTZmd4FX
 XBFqEcZPpSiHRHvKzQ==
X-Google-Smtp-Source: AGHT+IFubJXy3vtkJcOwHqqS9mESC3A7XabtJV9kuba14K6i1ZD7hDmahPlfBhOOFL5Pjv0KmynR8w==
X-Received: by 2002:a05:6512:238f:b0:540:1f67:689e with SMTP id
 2adb3069b0e04-5402410d928mr2204911e87.47.1733850546924; 
 Tue, 10 Dec 2024 09:09:06 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401796d426sm1008552e87.14.2024.12.10.09.09.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 09:09:05 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso2588236e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:09:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXnMGrZ3hgBVih7WkKW8caixMQP9M5GmIIixdZBsrRsl5iVX26cmJ9LI53YwhnN/RY8XqzpTgV41Uo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:33d0:b0:53e:368c:ac43 with SMTP id
 2adb3069b0e04-540240aac8fmr2378233e87.5.1733850544359; Tue, 10 Dec 2024
 09:09:04 -0800 (PST)
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
In-Reply-To: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 09:08:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
X-Gm-Features: AZHOrDkvV4hXVBzL5LdGwv2-ywEkfcu0N74i9maLRg8R7KrBlypjtg_v-QyKEuk
Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Each bridge instance creates up to four auxiliary devices with different
> names.  However, their IDs are always zero, causing duplicate filename
> errors when a system has multiple bridges:
>
>     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn=
65dsi86.gpio.0'
>
> Fix this by using a unique instance ID per bridge instance.  The
> instance ID is derived from the I2C adapter number and the bridge's I2C
> address, to support multiple instances on the same bus.
>
> Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-t=
o-eDP bridge into sub-drivers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> On the White Hawk development board:
>
>     /sys/bus/auxiliary/devices/
>     |-- ti_sn65dsi86.aux.1068
>     |-- ti_sn65dsi86.aux.4140
>     |-- ti_sn65dsi86.bridge.1068
>     |-- ti_sn65dsi86.bridge.4140
>     |-- ti_sn65dsi86.gpio.1068
>     |-- ti_sn65dsi86.gpio.4140
>     |-- ti_sn65dsi86.pwm.1068
>     `-- ti_sn65dsi86.pwm.4140
>
> Discussion after v1:
>   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729=
180470.git.geert+renesas@glider.be
>
> Notes:
>   - While the bridge supports only two possible I2C addresses, I2C
>     translators may be present, increasing the address space.  Hence the
>     instance ID calculation assumes 10-bit addressing.  Perhaps it makes
>     sense to introduce a global I2C helper function for this?
>
>   - I think this is the simplest solution.  If/when the auxiliary bus
>     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
>     updated.
>
> v2:
>   - Use I2C adapter/address instead of ida_alloc().
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

While I agree with Laurent that having a more automatic solution would
be nice, this is small and fixes a real problem. I'd be of the opinion
that we should land it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If I personally end up being the person to land it, I'll likely wait
until January since I'll be on vacation soon for the holidays and I
don't want to check something that's slightly controversial in and
then disappear. If someone else feels it's ready to land before then I
have no objections.

-Doug
