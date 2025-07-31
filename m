Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB8B17915
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 00:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FBD10E2C6;
	Thu, 31 Jul 2025 22:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MeYYyphC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9B10E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 22:25:41 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so2347435ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754000739; x=1754605539;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDly6jsUjLYLpTk911qABJ1dSyDnXYYIjODUvF3M+Yc=;
 b=MeYYyphCvBuC5tRV3Jw9hYDEQZR2aIAJTTS/PVBWIP4TJURekCO7KqH4YfjnbrTygM
 w48Voh+4eiqOAjljh7OpWbR7hrIBFbDi97AvRtSxTSb65ip5QZFDmj1Gh2JAx2UjRcHz
 P8St+omOZ3YMIsxDJnos+qqM3pZGjlueU/rzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754000739; x=1754605539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDly6jsUjLYLpTk911qABJ1dSyDnXYYIjODUvF3M+Yc=;
 b=Fqvm23V9/mOazLbhwZoplqwZ2B9G5r57MVLtgSMmJqUPUl5m+BqiFKjSqHcqHzV7R1
 tvdkjpkCLP5ne+BiQ7Jv5T6r6TYt0oGYWjqW48YgTvOagq8RgPLy6FavB2olxeFmGIQI
 RJFTJ00bp9nh8vmLpBZE+MNkENlXAe0XAQk0hfx1wwob7F0J8FKyhLBFJliSbTxiH8aH
 EqScmsp1jODjd/k64bn5TjVW3bqZ5CC9HDoRhvsb34+h0nOhq2q7G0pej1yDeoNGCwEi
 nBSqvNlHvNgMfyIXpw49gcqssx784KCVz2YcQlGTTBlqwQyRD8HoA2llgUNbP81m/cTx
 xJjQ==
X-Gm-Message-State: AOJu0YxKDWdSCCMKaLkFaQxmFjkM/S0eUFBoxCw7LTEcw+p82/eyMmqT
 ze//UQUPYewxNK1IG3HsB/mUlKDnzzKiahoJEfnV9z98wPYPoln5Ltzus4WjgsE74XNc/oIW9JA
 mWic=
X-Gm-Gg: ASbGncsbhcyvr270pHAyxNRCq3TCEoSVsptYwIA8xOkXPhsqa5Se/Kd9wLa0QYRjUzo
 CrRGPx2N4MfqrZcEA5szebTHCuPxc34YzKqG0z9Nl8ohlLk7LEpGdAQdLpMAL/yAzHjM0a3B+zI
 FLN76g7eMJGuOF7izHx2W0xBmudssAsN8lXMlHTJUuDPsj3t0Zm3NoSaDFe5LCqALAdomrpg0vZ
 wREiq2IjvieSo8EHrgYTJh8QMf7dT1vNA9ZHn6gbpfsz2KEHQ68Fpohktl+pms06MnGQ1Ip1T4R
 5qFCRK/VL/4t3wFbSqJzhdIJRbUaU/KYFLRnae11wRvhNJqgY6hBO9nTNhhrSZFQC3tGtMbjC2s
 p27oOEpy7C64X8hf+uvKljRhOJMBzBD+Dy2QH+1j7jCcCdeECpjfmnIXkWxFBG0HR1g==
X-Google-Smtp-Source: AGHT+IFEkQJNYgvnddgY/s5AeDK/3daqjGHtiD1YftRxt//rVo4wkaIIyLic4jqsTfwJCv6KbVS0uw==
X-Received: by 2002:a17:903:240c:b0:240:3ef:e17d with SMTP id
 d9443c01a7336-24096b3551bmr126179825ad.40.1754000739352; 
 Thu, 31 Jul 2025 15:25:39 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0e7d8sm26890455ad.42.2025.07.31.15.25.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:25:38 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b42254ea4d5so165650a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:25:37 -0700 (PDT)
X-Received: by 2002:a17:90b:288b:b0:31e:fac5:5d3f with SMTP id
 98e67ed59e1d1-31f5de54b78mr12214752a91.16.1754000737144; Thu, 31 Jul 2025
 15:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
 <20250731215635.206702-2-alex.vinarskis@gmail.com>
In-Reply-To: <20250731215635.206702-2-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Jul 2025 15:25:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbLW36hJZwQ2uS86wmvsqiAzp2RMjds=-+qXOafg-YDg@mail.gmail.com>
X-Gm-Features: Ac12FXxFZufQJD5lK1zYZRbpN7hzBp2lfR58ugoDPco-BA4iqzwE9ZcJ34mjneA
Message-ID: <CAD=FV=VbLW36hJZwQ2uS86wmvsqiAzp2RMjds=-+qXOafg-YDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: samsung,atna40cu11:
 document ATNA40CU11
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Jul 31, 2025 at 2:56=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> The Samsung ATNA40CU11 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution. It is found in some arm64 laptops, eg.
> Asus Zenbook A14 UX3407RA.
>
> Raw panel edid:
>
> 00 ff ff ff ff ff ff 00 4c 83 9d 41 00 00 00 00
> 00 20 01 04 b5 1e 13 78 03 cf d1 ae 51 3e b6 23
> 0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cb fe 40 64 b0 08 38 77 20 08
> 88 00 2e bd 10 00 00 1b 00 00 00 fd 00 30 78 da
> da 42 01 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 41 54 4e 41 34 30 43 55 31 31 2d 30 20 01 2a
>
> 70 20 79 02 00 20 00 0c 4c 83 00 9d 41 00 00 00
> 00 00 20 00 21 00 1d b8 0b 6c 07 40 0b 08 07 00
> ee ea 50 ec d3 b6 3d 42 0b 01 45 54 40 5e d0 60
> 18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
> 22 00 14 e7 f3 09 85 3f 0b 63 00 1f 00 07 00 07
> 07 17 00 07 00 07 00 81 00 1f 73 1a 00 00 03 03
> 30 78 00 a0 74 02 60 02 78 00 00 00 00 8d e3 05
> 80 00 e6 06 05 01 74 60 02 00 00 00 00 00 91 90
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)

Pushed this to drm-misc-next:

[1/3] dt-bindings: display: panel: samsung,atna40cu11: document ATNA40CU11
      commit: d680a7959b9d7cce9526b1b391cc7b13e313a096
