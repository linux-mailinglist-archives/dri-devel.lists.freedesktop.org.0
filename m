Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E48A1BDDD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130710EA17;
	Fri, 24 Jan 2025 21:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cVRaVFVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1228710E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:29:02 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so2288457e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737754138; x=1738358938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAbd6tMTwRIwMygCkzxQlnTK1Tk8zRNd7YqKL98Xz1o=;
 b=cVRaVFVYKh4XiiKHhx/f2759kbELpAakDPlp6Qk/82MyZc7T3VZ7LgUOn3BaBxw2nh
 GMp142/lbvjQwMfWVla/7TI3KaaAQQqlO2bg7ehnvKDrtrr4xivCXwqAi9w4uaNY/3y7
 fN4Hh7qbi49RwRj3krLP3Kxt5jjwx0FS6D09I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737754138; x=1738358938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAbd6tMTwRIwMygCkzxQlnTK1Tk8zRNd7YqKL98Xz1o=;
 b=pHLusLHKeQNjsna07RFvxCcGMQwJ7b050TFZJsXYOAE2h+a9f2ZAv3L63VUniqAi3h
 eKGT9829yEEDs+9JP1UmnTdsq0ZbJZIQiEmAOCaM3X2Ak2T8YWztcwMNxqido0Wu6660
 e2z7SXnwkjVUZuKIkvrAZ/rjbEhX+qPGUZI0mCqvgQOrqah9OLBJY7fm5821IpOQc9Yn
 RwItNTkddJq37OYGCkAobAaqX0/uEgk0MnnIFEd1+gIhDuSC9bSPQH8+vt+ZihOLZW77
 vFyZuOmA/OdfVM++1be2VoMmSeSFlqRUWKFbiPdPl5NypxMo7WpgwlINBKCbkCSmfhmO
 IblQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLAhy53DEa8cCSCUak9ZYm3FofEJ5WyQ29rkstGq5JdyEOybxTar36GKsuR0zZXCneQWTYt6HfC5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzX47EWYgDpj91Ri1DI82fm3/Ag39EwAzlh0P2CF0KfXxZreqg
 t/q51sC0XiMkUDOXZEZp6VxZGGnw9my1VSnvzuXMvvas96b9+mo7yN0eCxGsL68HbsC9k88ROb8
 AAw==
X-Gm-Gg: ASbGnctWAmHwddMOUfPABcQ/O4YzqkqOnYRPcllYumwzIJIwP0TUgv44Xd8CY0Mn/9z
 f6pZ1C2V8ftZ+JoazQFC2xPro7YLOFGflEfzR1C/Wq1wggpLwifoTzSKwAsND+bPXNmnCFYkBfJ
 3OwGsdyy1C3nNf+XEl4N+uvJBd/k7YyEP24xoHufbOMOFNv7QSxETd7bgm7gQUw7+qA4BOyu9KP
 FX+WDx48aGN9e80LlZ/pJ0bdFTPNURDgI5UYMpI3DKbW+l5yMfW8sxlm3GkMe0/l34XiAVFrHkZ
 9F0s2bLEGPq4rnBMh5u9Pu6vc8kKzNjK4u59wyrrKHCX4lghEu4Bs2U=
X-Google-Smtp-Source: AGHT+IFOJiq26hHp7eqL3kaLFNEKAsf5eQDf/Cf7WETs8CD4gCcCpfo2p3ocb2yvKHOvLcQtJ2cw0A==
X-Received: by 2002:ac2:5497:0:b0:542:9757:d5df with SMTP id
 2adb3069b0e04-5439c2291dbmr8482536e87.21.1737754137687; 
 Fri, 24 Jan 2025 13:28:57 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836878csm410507e87.143.2025.01.24.13.28.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 13:28:55 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401c52000dso2599004e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:28:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjPCXyseDm5sWLUG0bPOtcA6xj4EFv6Z82G6S3BmBmU7Z7AZsd+pfES4exdGIcK+IcdW9/bKSJmNo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3d25:b0:542:292b:1e68 with SMTP id
 2adb3069b0e04-5439c269834mr13183930e87.32.1737754135342; Fri, 24 Jan 2025
 13:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20250122031110.286079-1-tejasvipin76@gmail.com>
In-Reply-To: <20250122031110.286079-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2025 13:28:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VL63A81UDQ9MeWFGP5QJmA+4uHQNnhPp_W5817p+xP0w@mail.gmail.com>
X-Gm-Features: AWEUYZn7YP5YwAAuhErVvPkagAKEFs_6GEvq8j8HEeO10pRfOjr-nNL2-5QL3Ek
Message-ID: <CAD=FV=VL63A81UDQ9MeWFGP5QJmA+4uHQNnhPp_W5817p+xP0w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: samsung-s6e88a0-ams452ef01: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Tue, Jan 21, 2025 at 7:11=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the samsung-s6e88a0-ams452ef01 panel to use multi style functions
> for improved error handling.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - changed s6e88a0_ams452ef01_off to return void
>
> Link to v1: https://lore.kernel.org/all/20250121134819.251718-1-tejasvipi=
n76@gmail.com/
> ---
>  .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 91 +++++++------------
>  1 file changed, 31 insertions(+), 60 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: samsung-s6e88a0-ams452ef01: transition to mipi_dsi
wrapped functions
      commit: ce8c69ec90ca83fd4eacb246e2be699e6b439e97
