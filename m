Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C5A1A893
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 18:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22F510E1BC;
	Thu, 23 Jan 2025 17:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PWz7SaHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006B10E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 17:13:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so2704721e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737652379; x=1738257179;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUZLZt5iVz/3SqS+Qd/2WMP5R6+9NXdfBKObsyfvqsg=;
 b=PWz7SaHRkmGFkaAH8Nykc0OMz1pbZCol2hOEvvNUQN7Uk+7XmbSJZ5ocH06rkBebPs
 RfNGMWgQDELPrQfXRIQAXTMvmyUlkEgk0jg4+0oEUXky23jCNkh5DVwIJyTfQYvjFj/I
 +NWDdr3kIO0GZtnbD5fpr/YRLM1GEhOUDnnF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737652379; x=1738257179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUZLZt5iVz/3SqS+Qd/2WMP5R6+9NXdfBKObsyfvqsg=;
 b=RoBqoFfm74JuXWcF1+qcWjOWOaEFOSANKs03h8P7mrdwHNilvjNeR0+PKapcoFSgck
 vco2QvXqp/GdFVF8l+OCOgVvpwuw0a99JAr0a6DkIc8AgidYy9q5dFH7Gdb0Nm0ZaAoo
 ruIpdfiJOpzvpEqFwjBP6u1qqatzvTFdY4ATta2tSdk3fdl3OPC/DKs1i7MvO/wFVr2t
 U5lHRbEovt6WJXi5MzseugfRSGMckm5H3a8uyvplBDEE6FK6SUXGNijAvVNLCidxUQAl
 CzRCLoyNMomO8Cf7f6XaXMMoGaXWctp/YUbU+jRbr9noaLX2I7vBv1PxZHGI4wATMKqn
 vf4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBEeUhoBdKOLJiM8+tUv1FVbWVfHaGKezOTXS1WSm8INhJW+1lV1iQ20yEGkrxqYTw/GyL/upp/X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTI03qMwMwIFQGasY+yBOpgpFAzehhSWLZKkx9ozQ5UnLeq2+p
 YEWYPwCYrOl/rJjwDVWIH6NHmhDvY8PT4lbvDV+3se4r/n9Yf8dhfapItyKFOfKNXeEHQZqmqrG
 Kwc+P
X-Gm-Gg: ASbGncvQU1aUkh2eeIVqwSdigm+vKf0mAQHurGSo0FwXjyQrOxXM8gCoKJsB4R1/tA/
 RNx3a19Q8SW9W+AaSlCgTwwABW9bAxXIkEsgdTUPfAk++WkJKhb9Gt10OUKN+zAx1AATE8EcNtx
 Y1PqSKHZgn9TkTtK5XiHXksmW4qxrL0CJ1vpGvyGqeTvUiR5d6alNpUD6bCt9CgyLamL0Cl6wgm
 1+rvZUHowAR9rvhrSZ3MF6b46zgT/QzqExt6BqfONNMXPgjQK74NjZ0MS8FsmAT/wgIxxdZT8O+
 tH2RV0TBRhwlSiGOWzQlfKy0Uczbw/uSGKuCgD/gvK1V
X-Google-Smtp-Source: AGHT+IEG8NaR9ARl6KKvmDmtq2CXXvNdTyl+5Em6ffs9zrdCI7XheQgVKzaH+xYbrcIBrrgfKkoa0w==
X-Received: by 2002:a05:6512:4028:b0:540:16b3:3699 with SMTP id
 2adb3069b0e04-543c7d5738fmr39719e87.9.1737652378739; 
 Thu, 23 Jan 2025 09:12:58 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af074b1sm2728885e87.16.2025.01.23.09.12.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 09:12:58 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso2125522e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVApAwZDYpWe9CWfuatGgz+bWbqsqCw9oBDBwTBRNixIXYLD7qlyA8WwvGyYYsGt6kAZ8uKE6erJr4=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3f13:b0:542:99a7:b415 with SMTP id
 2adb3069b0e04-543c218c7d5mr2076806e87.0.1737652376055; Thu, 23 Jan 2025
 09:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20250123112055.1521471-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250123112055.1521471-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 09:12:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XSr+tDGuSB-_DQQDbrsfSxqOAzpUaH5Tb=1EfPzEm0jA@mail.gmail.com>
X-Gm-Features: AbW1kvbV6diAqQj1igbDC6taW_4SBPpKKA-e0hwNqygvXggxfSM-Fx4rAcDM1ZM
Message-ID: <CAD=FV=XSr+tDGuSB-_DQQDbrsfSxqOAzpUaH5Tb=1EfPzEm0jA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add STA 116QHD024002
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Thu, Jan 23, 2025 at 3:21=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the STA 116QHD024002, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 4e 81 09 00 00 00 00 00
> 26 21 01 04 a5 1a 0e 78 02 1e b5 9a 5f 57 94 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 8e 1c 56 a0 50 00 1e 30 28 20
> 55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 20
> 20 20 20 20 20 0a 20 20 20 20 20 20 00 00 00 fe
> 00 31 31 36 51 48 44 30 32 34 30 30 32 0a 00 3b
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)

This should have been tagged v2 and had a version history "after the
cut" since there was a v1 [1]. I'm OK letting it slide this time, but
some maintainers aren't so lenient so please make sure you use good
hygiene in sending your patches. Using a tool like b4 or patman makes
this a lot easier.

In any case, the content of the patch is fine, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add STA 116QHD024002
      commit: 6ce24b3450b8e8132b74d4f0b43a48f4e370e825


[1] https://lore.kernel.org/r/20250122082340.1603169-1-yelangyan@huaqin.cor=
p-partner.google.com
