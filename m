Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E6A9F9D4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5A810E24B;
	Mon, 28 Apr 2025 19:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jveAZfMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D2710E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:45:02 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-73972a54919so4414575b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745869497; x=1746474297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZajjwoyukOvr9mE6CeoV8lx4UVycOtlXQYao/G3ci3w=;
 b=jveAZfMjqCpaPkDJqskE3BPUlqIqVNteGo7QhHBEpmVbmcewDqgZKqGQlgp0ksPeJU
 wtJ0EKA8hg6wYhHMIvhImJyMFWzBsWap08CTpq98wB3n29J0tqGnoMkXqfImm37TU4d8
 qt+Rz7TQn0e/jmRyifN/pTItTPNpMhXbXMtgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745869497; x=1746474297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZajjwoyukOvr9mE6CeoV8lx4UVycOtlXQYao/G3ci3w=;
 b=M9p601ND8Qc5zNC7Y6zZOk8o1sRqOrhTy9cR2CFRv9I4hmT87agTbONaNNYDcnw7qv
 4tE8QtcCTl9ciF63eL1Y/aOPZpqFeDFfbVxuHpE1VFuBWj8wsDosTr+GJ41DiEEqce8u
 IpsTJlQc9T4oAmr5SSf9iW1I+NI8COaUSkMXUkMiUqwaSicQeA3zq6FeQU5Lgdv2rlV0
 TCwBy5nrY4GHRZCsU+QfTt2k2s2bhg2l51ckmVKHyHNf1c0+65IeNeyzVfo7U4OV1Q9p
 TshqmgNyfdzHLlgwFctnHRgUyFZyj2QPjXCvlL7RrYzoJCF4fPfoJ7iq+a1X6va83Who
 k3TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXntZSQ+FB4Gn7q3mkHgAngvQswmFSKBzzGdWUc6sABmNwX4RWAunMtKjp5mmQiH0FKyjYT3Zpx/6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+eZYfqmureYovtcRumfsPHWjjj4NjpHIGPptqJRJJUxmUp06h
 yAcFNwvUd3uHFq6uXw2CW6icPv1h2VjeyKuw7FFs9jl+S8fKk+tLU3ESa61ycA1AXCMAuL6G3Qs
 =
X-Gm-Gg: ASbGncvQv+h3ex694k/rjlUCQhR3QzyxC0qJ5+DFQEfX6bQ68IbOfJg1ZYF6kxgIUNc
 XYDiXSeCvQvp9mpbBzWfxh9zJsMQ6bQb7qxwKZ2mq0o5HYrhIa5qYHhKGXQBHNhe7rcrlnL+cLJ
 lbBs9w/nIkCrsawFCLYdRblxyTB+LCfzVuPig6lcl5vlQaGsaIyQiLTgDDd+xfLtz0IueLn/dvO
 OQXHt7pGFfbmmFVvEeOKpUjCXoW+OCtYnn+hDtVcJBzGREjDhoBjpU3Lrf8H2RXvCP78tVEqEEQ
 cvKId2G/JniQPOo+Q8c270C4c3aQOyQ0aZM2hmxOdoW2by3nfAdnZjWSX4jXIa/j2OINcZxpIEz
 oT9H+
X-Google-Smtp-Source: AGHT+IGGKFqtl2akIwUmu3gzwjG5a4FBnkpjRVbMATYbT3zGWOwTf0eKC7TNxq4hudOW2kCHXb2I8g==
X-Received: by 2002:a05:6a00:3a1c:b0:73f:f623:55f8 with SMTP id
 d2e1a72fcca58-7402710ca27mr1258944b3a.5.1745869496698; 
 Mon, 28 Apr 2025 12:44:56 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acce16sm8674648b3a.175.2025.04.28.12.44.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 12:44:54 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso4358461a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXa3ZmnFjPXq79p+6xZvqQ/N0kSOBVDk0c6/aWZGGWDJBrxnPOnC8Evxfi/dA8IY7gJqYNHYqgst5g=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2b45:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-30a2155abb1mr1620972a91.15.1745869489782; Mon, 28 Apr 2025
 12:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXrxRJxWdQJaJAioNsE+rnvDL-MXXYU=k64eASfou63w@mail.gmail.com>
X-Gm-Features: ATxdqUHk40m4BLleMiw4YHxAaXz6Vw_z9VcQGzZEIPd0g-53-HTwHpMUpI5fXw0
Message-ID: <CAD=FV=WXrxRJxWdQJaJAioNsE+rnvDL-MXXYU=k64eASfou63w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: Add support for AUO B140QAN08.H
 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
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

On Mon, Apr 21, 2025 at 4:36=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> AUO B140QAN08.H EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
> 00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
> 65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
> 3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79
>
> 70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
> 88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
> 2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
> 3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
> 5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
> 60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 52028c8f8988..958d260cda8a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1880,6 +1880,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140Q=
AN08.H"),

Please sort the list. 0xc9a8 does not come numerically after 0xf390.
As per the docs for this section:

 * Sort first by vendor, then by product ID.



-Doug
