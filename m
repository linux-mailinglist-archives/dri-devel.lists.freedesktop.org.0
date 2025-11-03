Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919CC2D2F5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350C10E430;
	Mon,  3 Nov 2025 16:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fzG0Zjf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919210E430
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:38:43 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so723232966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762187918; x=1762792718;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PghuBkXqlQuLQvvfx47tjZsK1SlCyBf84+57arPAJ2o=;
 b=fzG0Zjf5poQh05C4rn5Iau43MIwoZ5GZm8dU/haAXjwyjqOmWvt4+jeC0VU5rnv/Co
 t+bzo03CgM7T0jNgLzGA1+ROuqRZw8BNDzsOlGuHMkTaFbaVT5e4sPNj/SiOaVY+Wfs2
 8ohtfvGm8zAyvc0wutEtK9fNwCBOVLnOMT4SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762187918; x=1762792718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PghuBkXqlQuLQvvfx47tjZsK1SlCyBf84+57arPAJ2o=;
 b=w66pcJRG0c4wQm81URPjiEB+f2VWhosSgx7UW0LYO6Z8ndKFFPH2FUkbGPz4yfB5a2
 8rreyJV0fIxE4ngI1bxOPbP9Kfpemr0dJPi9mDOThBIdcfwwFO5A2YfspJuaY+QvxSxt
 dZUAK1vf0GmGKQCKyC/X5tf8iAhz7glxOXy41/u1/Fpy5phwqE/aTgG1TBX6drMTiEs8
 yy+fO8MAGGzzqyAkDsLDgjAh9zPpWzDAFErBpb5cmIXQkczi7LjqhCQG27bL4Ij6dPp8
 crfUkCHty+9Ix1KXVI2atytpZJOId8NADnSGnXm+aTvfWmGC8k6BI1WSIi0BlqfBYNAN
 LOtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw+ZVBlKa75VYS7x8js9gqEzIHHc8DNG/0UIR7DpnMKrLylYPsHrHfPSVajlcyfdvRlFhR1UXtCm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgEwiTJk/6vM73coLkah0+YNus4CzkJsPvwge2hoAuAf092sV/
 MFdX3HUn2K+m+5wWNrB7d0nT9CYsd0KMfXl6Q0INxmmPSRZUgpVnYzi/tmaKNHSecXQ+T3Vt8jo
 7jV4=
X-Gm-Gg: ASbGnctyERv40VPIk4H4n5XaVt7VnZEw3Z7cKLztF2vQtSLIuY02zet0itivJY465xu
 RppK/8H6MW2ngkqnwYDurKDmtA+ktAxuYxbbQU4bIF9qSuwdzGVWxrOvNzyJB7tEdYodda4BpKN
 RmfKio0tfFV0T8DFiC6ZEhF/gqP5RONYCDd9Gf8Ff4pGA0tAehI716niEXHqqQ+L+n7J+XYC7Yt
 ScZxF8l6lCMxAVlfV4Pvc2uRtZOcd1lCH6tbfa95gFFHe+4/Wm0XOIbDiP1qjEA9ysMNpNOR43Q
 jxQraDles6jUZy8rRK1S1tX1NJdVViCbpgakLs/uglUIC1Kag2THohi8r3bRuw7QypNS9occxXK
 7rlQulm+M7JsCLngw+YcQQRJjDb5M/YIWTd8blxL/0NvWTYyVDHgiE4iKive3oHqHTIlvbOS9hk
 yuw21TKSQ3Xlkm1ulLkUJcIGdkq8mp/cbTyM1xntA=
X-Google-Smtp-Source: AGHT+IE1pceuTFR/KpFBymoTyFuPF1TUF4at0N4YMrDl3E5IT/ui9I4Rh8rvUDf/q0DCKWuhHkVQpg==
X-Received: by 2002:a17:906:fe4d:b0:b3f:3570:3405 with SMTP id
 a640c23a62f3a-b70704b3554mr1164151066b.34.1762187917917; 
 Mon, 03 Nov 2025 08:38:37 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64092e1a405sm8172027a12.31.2025.11.03.08.38.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:38:37 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-429bf011e6cso3253065f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 08:38:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4P5McOrH5ebmuFF8Et/672jiobSn2UCE/4ikmj/Vi42x6nYKIzNNf6i9Ge9B3wk4sWoHIn1B15zM=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2383:b0:429:d66b:50a1 with SMTP id
 ffacd0b85a97d-429d66b52cbmr2236083f8f.22.1762187915153; Mon, 03 Nov 2025
 08:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20251101040043.3768848-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20251101040043.3768848-1-ajye_huang@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Nov 2025 08:38:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XqgkgLLOeozooypbwiO-8j0ZNy_GJ1UD2sXL1EKzC=Fw@mail.gmail.com>
X-Gm-Features: AWmQ_bkbUC_oSCELL5XoimElzVvNkzBNl9O2Hy0wzDnBb9GrSFRmMX5_QbbO5eA
Message-ID: <CAD=FV=XqgkgLLOeozooypbwiO-8j0ZNy_GJ1UD2sXL1EKzC=Fw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
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

On Fri, Oct 31, 2025 at 9:01=E2=80=AFPM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
> but it will happen display noise in some videos.
> So, limit it to 6 bpc modes.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
> changes from v1->v2:
> * Change EDID_QUIRK_FORCE_6BPC to BIT(EDID_QUIRK_FORCE_6BPC)
>
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)

There was some extra testing and summarization on the internal
discussion about this problem that cleared up my confusion and I agree
that this is the right fix. While the panel does properly link train
at 8bpp and generally displays images OK, showing certain images on
the screen displays consistent corruption on just this panel (other
8bpp panels are fine). It seems like there's some sort of subtle bug
in the panel at 8bpp. Limiting it to 6bpp, which is what the panel was
originally tested with, is the right thing to do.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
