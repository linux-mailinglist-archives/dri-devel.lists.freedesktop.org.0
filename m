Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56AA03449
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 02:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150810EA45;
	Tue,  7 Jan 2025 01:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="g6Tse0Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744A710EA45
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 01:00:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1161586066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 17:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736211589; x=1736816389;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kwhGEEmdEJNOQbydBa2a570LTshsDNhgvzLL4TNYH0=;
 b=g6Tse0HpeTn3AK/ZGbEUDLqBTrv2IdAARKUqgesJu/ujaOQmoN6b4YtrEQJ1AvTDca
 Mae+GfrxxFLJWhP/EndM99xfpnDdzKxZS+6DI1jWqY5kYyAOIb843LDeBdsI86u1HW+M
 4TK/EUV8WFyl4nowT627prvzkAiAbHOAvIlhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736211589; x=1736816389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kwhGEEmdEJNOQbydBa2a570LTshsDNhgvzLL4TNYH0=;
 b=USBQTKsTYh0uorEubp9QZK+YRoa6M6LQtuDaovxW0JaR1vWnvbKAPz4bqHjG/br2WA
 NONVBPkyQEMXoeTZ4kX5Koim+ItfAUW/tvTfMglb2tsmzeHpockFB+szbsSN9yIamXO/
 L2br2Y+xCWAWIAfbFbQ0YBRJr0b7upiWzVDQJ/ItNntm1ScMrYZuFRMaims5GRTyF8Rh
 vMfFEtnwC/wHKTKOHakiD2DGp/+MTNTKnmg3tqS47SfMR/9Ufq/UpzpOm0a/xw++i8H8
 muyHFG/R6btWHXf0PFC13T3O6ZivZbFnuSVeywMBwNsUj2vB7Zoph+voF2khp4TJO0CH
 M5hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5dcYJUY++pEA1luIGvlhSYtqGiDluQMGugfY04I8yQ2PWiprIA9mUqvexNB7HFfmiNSjy2TTHQ5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX6UblVAymosXKTriGKe+9E4SGb1hBH7fsXWLtDFU0hROifjQK
 I1zX9i5KOPRj3lyHbL/J6DFNd7muVxRhCL4okBKQOkNCSXcEbKiMNVr9Xc5cNc/Fq36vDiQORp5
 gfdT1
X-Gm-Gg: ASbGncu0zeTcLGuMZfpDe/x5PQt/c24bL1Dvt8R0IeV7XHeCkVw8C5JYerOWKGrasBS
 hFfa5LLvNhcFZ6VRpUB9v6zhnal+MnCJc7JlfnpxCVrA5zyucU43QQb5ei4MIwluhtnY3znpoMh
 gK5TFPQZwozEVdN3yXIW5uB4dfaTOBDtAiAKoS8QfBLyqyZ28MMMib1vOAGLUXuIIQA9nFPVyft
 TPatkWF7pE7rH6VNIRUFsb4wdZ6soY+Mvlz7PC3K8bKa8KQHDljU/gdTErXZ5QuliZhnBVYziCO
 4shbZzYc7YGereLab0yJ
X-Google-Smtp-Source: AGHT+IGRugHBXgeZLklrKkn7i9t0rqJcmYBk71Ju78NolCWicNSuqL6AA0+J5MpMKpJzX5xTFmBFRg==
X-Received: by 2002:a05:6512:3f1a:b0:542:1bdd:748d with SMTP id
 2adb3069b0e04-542295328eamr16001340e87.13.1736211252948; 
 Mon, 06 Jan 2025 16:54:12 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm5040360e87.44.2025.01.06.16.54.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 16:54:12 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so15714085e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 16:54:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXKt1JIaS4Nk8FI/9HKOmMB3Rwb7oQMAYBQTwLvecIyCeJnm/TjRyNO6RhnkEFIWksrsDwfdokfNI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3c8c:b0:541:3587:9d45 with SMTP id
 2adb3069b0e04-542295246c7mr17877267e87.4.1736211251707; Mon, 06 Jan 2025
 16:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20250106041129.114867-1-tejasvipin76@gmail.com>
In-Reply-To: <20250106041129.114867-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2025 16:54:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvvYjGcShzEiiNqbOFSmRx-snBtraRhiCjwpOL8COtNw@mail.gmail.com>
X-Gm-Features: AbW1kva3u4OvsNgHiTF3oVB-FEynkoB4rYy757SYxYMBcw9kKeSK_D9ugUEHxA4
Message-ID: <CAD=FV=WvvYjGcShzEiiNqbOFSmRx-snBtraRhiCjwpOL8COtNw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: jo@jsfamily.in, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, Jan 5, 2025 at 8:11=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the ebbg-ft8719 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 67 ++++++-----------------
>  1 file changed, 16 insertions(+), 51 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
