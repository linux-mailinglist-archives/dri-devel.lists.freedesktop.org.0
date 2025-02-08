Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D06A2D892
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABAC10E131;
	Sat,  8 Feb 2025 20:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oZbtbaEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0E110E12B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:25:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so394698e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739046322; x=1739651122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0snXFD48srt2bPIw0/xHSEpJ3QuHpc2GgTYscYldOH0=;
 b=oZbtbaEB4grMAhUGT4/dsIzdyh9zqXRau5dJQCtqzZ3bHz0jf0jI8TOxeLv45zg+kA
 /vTztiSeSb0YokADKLdS3B+BgG1DQM9iiOugZhZtUgUG7+nmPhRN+e4ryzMo29OkQkE/
 4pAxk5H4Ks4PQsSULLnhD2hxVdiapt2vjJfUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739046322; x=1739651122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0snXFD48srt2bPIw0/xHSEpJ3QuHpc2GgTYscYldOH0=;
 b=l4HjtTbCZOlDl7HoCEOFJZ0i2Wu9LG/NBEBWyoA6kkgE0GKzk895qaKGbO6FC9376g
 3ZUbC9GrLINZkUo2mEHnOv5TSOin4ZaPYRaJlJSVegiYDwLu8ymlPFas4ga3AY3khtv0
 wV4wknRcbS5U9pIpzWX3FqO98gjtlutP672LcBJe/IWVjzXbwZGJYBC8iqh6QA23yu2h
 I3Z2RLije1+jHgX0Muh3Wt/NETQNUVCFVKRXnGXCpbEKcJI8q/vd+SqOAWV9CNOnUrK1
 y+Imeb3JIP3OpRx150kvW1pyfj4F/Knnc1WIlUiiPNkaPSnIm9MeOcdIlss6cbPYeOjU
 5dJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0C5HMD5S+xZKxzp2JnfTPr96+6o578gWECLXNZAxatWMGJUynQM/T0LIS3Ai7gBDmcCPPZ1k0sKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsi1tkup3hxLBa6hGqEkVlqr/AmsCD3EqnlyV96+enZ1gRSuq0
 Pu98MhHsl2+LjgwVGz/N7ZoLYoCLRSyb34OmLfoRX8UlvIqHbpPq+rk0sxjMgYA47r7YA23SbIP
 m8t5L
X-Gm-Gg: ASbGncunPzB6754asAsWVrRfAk3Lfxou1Yf9OXpxlkg2gT1/yCEovB7rRKJUrz28PHB
 2VkLq5kBAvuSsTHpl3P3Ip0uE2a1KCTtWAit9eX1RJi7HLpWlUtQa60bOn0ANzvyJ6ITAvMyRY1
 p6KMSdzaew3XNe85y1hExS4fqJ+9PiHoncB3GW3O/Up6whhUyDR3rZJQf2ZpEfoHbop6qBXBQsS
 ayI363dGLv3gI8+CevDxWERTvpSqrbb1jW5dFvJQOuD07heYMSVcQOcI8MsM6xfPckMTmchVC0r
 Cp5usyEFP5ti8k0Xs/SLDh60CmzNzyLXXONjiGG+AQf+VispFnhOsrmlspY=
X-Google-Smtp-Source: AGHT+IFM4gWEAvNPW1adyGL+7CADNk5vZAMEXLtCI+1d+1Zk02m+ABsACihzguBHFHH2RTFWHBy8yw==
X-Received: by 2002:a05:6512:2803:b0:545:4d1:64b9 with SMTP id
 2adb3069b0e04-54504d16739mr725675e87.27.1739046321717; 
 Sat, 08 Feb 2025 12:25:21 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544ff90d83esm415016e87.97.2025.02.08.12.25.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 12:25:18 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so29802771fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgTRZfmj1NuMIjKSh9mR1jiowHDojkwyGHnXuw05GyIZHBXMTwroS+GCGK2EK+48nexxjM9CDUey0=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1616:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-307e57fd416mr31605761fa.11.1739046317966; Sat, 08 Feb 2025
 12:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
X-Gm-Features: AWEUYZnkToH8gEJqi66QQhCeYhQX2_qfYzlMhuvpnRPH9ru5wjR-xYGs0fqUV7s
Message-ID: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/panel: panel-himax-hx83102: support for
 kingdisplay-kd110n11-51ie MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The kingdisplay-kd110n11-51ie is a 10.95" TFT panel. The MIPI controller
> on this panel is the same as the other panels here, so add this panel
> to this driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 115 ++++++++++++++++++++
>  1 file changed, 115 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
