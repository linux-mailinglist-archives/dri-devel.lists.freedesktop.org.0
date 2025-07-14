Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B9B04800
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 21:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3985E10E0AA;
	Mon, 14 Jul 2025 19:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FJcmJtBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9510E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:40:33 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so4119057b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752522030; x=1753126830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEniyjVNgLZ7A/xokzs1kJjeCJ9pKk7c1wIFnkTmCLg=;
 b=FJcmJtBBBVKoaBDABpvn+j38PAH+4Mme3lAhQZYTE8/OWAOZPsGcuwgJVhlhujcii+
 U2iIuuW3hjZnHBZ324JReHMS9exWWDykusB1VnnEbNJprB/R8ZLWrXyNt9eCG2l92X4Z
 cMHsPC01O9d9M8O0s+9KUGW2E8DGzFypmFt9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522030; x=1753126830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEniyjVNgLZ7A/xokzs1kJjeCJ9pKk7c1wIFnkTmCLg=;
 b=U1obXV+Q3QnC6E8Gi8VNYuajtFRYHVmUU1MPSFYEupNZMj7uPJxpLMq41BzNvMlMZB
 JOstAw7QCgXlFH+gUEnhA/kc+f6PZimTUNiccpXkuhf8+zdspMimcy8r4XUxYv4JHOwV
 EwvGuk8jt5DhvWtCZA5oaBAjvwQWXqOi/SXuZqmjPnaCa6uwnDuyBY4O9HR95Z+sfDE4
 ryd2uYATJUgP6B+CqfuAYfUbUSNHrmqZ6TrIvH73cvwDgwITjCTc0fKXhsaoUHc0xUjo
 6qWkkG8CHN6N1dgQA4DRB0/hkCml3kAjQDcaJcMzjWHrP3eW7sC1LyONlRJD65dJP1YQ
 jkFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwcGl4B1NvVfdTM79jeFy752K9S4Vu+Fd1N9gK5gKa3m2dgjJIg6kH3PCzjVX9QnhTnrO9gAFC7KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykmO/EJ4Dd3ohmMLSJ/DxNo/UXUtOfk2mTKSttNN2+qArFKOpe
 JHNvSsECX0f2s8B6dMLSwI3iY+5DO+G0MnU8A0OG+/G/+wfmaOETYlM6MGXXPsp7oHau+MmYU9N
 L0Gc=
X-Gm-Gg: ASbGncuiJUduOqxxWSRPqIDIEIlkjtsmJJAfdblmaWOtzcWw8MGXwTeIatQ02p5CSo6
 WDDrNmWhOsxXh2jkAdiaHv5AAVSkbbl8EgZPqpOvri3w7yaN/vj9Jq+mTbd7oZEPtGSKDJ9Ep5a
 9+UcSMkAeLkcFkG0WBonk9TDSUoOAXabFib3/Rk7TpSNIv5NuJtN6W7GfA2IS1nauYizpmTrPb4
 QbGsOOwR3rMMBUxYhecMr+xWDcG5S5Dc/6Y2aBzufIj08gyCQgz5YC3MDLa2vygGawiWMGF3MOF
 JUzsYoysaJEza/FZ80i/v72tuc3niNNmnwqi1k/EVdAtTOHa/pQFoYPbcXy0D2+2+9PPK+HI5Cn
 4xDQlYGfLDf2KoyLMpqLzWQ5I5SL1BAfGg7qBpPZ+01qxQFn/o8HkwD3OqrcoTQ2ntvNIGx7T
X-Google-Smtp-Source: AGHT+IHaq6jTnkOgzeeeV93IV6GrpKmcG+CvdXFnC9SWpj1qxdtTE+DL8JOQFSrQVlQR9Qxt1kxKcw==
X-Received: by 2002:a05:6a00:23d5:b0:736:4e67:d631 with SMTP id
 d2e1a72fcca58-755b4cbb698mr184348b3a.23.1752522030210; 
 Mon, 14 Jul 2025 12:40:30 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1b2f6sm11579500b3a.99.2025.07.14.12.40.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 12:40:27 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-31332cff2d5so4594693a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxlhuHNedVeyD1ezGE3g8a23Klyq0Q33qtScr6Q18OxjEhpuQmzHuP0KFmb8TR0wChG88sgn81Pc4=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2247:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31c4cca46b0mr20433281a91.5.1752522026579; Mon, 14 Jul 2025
 12:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-x13x-touchscreen-lookup-v1-1-a1277f119f92@riscstar.com>
In-Reply-To: <20250701-x13x-touchscreen-lookup-v1-1-a1277f119f92@riscstar.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 12:40:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzjC-+Uz4vpTQf+76uL9_Aad9Zs=qkQKBjadRxUKZgYg@mail.gmail.com>
X-Gm-Features: Ac12FXyGVOxl4TaPz_wHI3nt_YQssoML9lSoXS6OMPQ4CI5qfxsAw4BaSTKq62Y
Message-ID: <CAD=FV=XzjC-+Uz4vpTQf+76uL9_Aad9Zs=qkQKBjadRxUKZgYg@mail.gmail.com>
Subject: Re: [PATCH] drm/edp-panel: Add touchscreen panel used by Lenovo X13s
To: daniel@riscstar.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Tue, Jul 1, 2025 at 1:17=E2=80=AFAM <daniel@riscstar.com> wrote:
>
> From: Daniel Thompson <daniel@riscstar.com>
>
> After (checks watch) a little over two years I finally investigated the
> boot warning on my Thinkpad X13s and it was caused by the conservative
> timings warning in panel-edp.c . The X13s was sold with a variety of
> different panel versions; I have the 300 nit multi-touch variant.
>
> I have been unable to secure panel documentation so the I copied the
> timings from NV133WUM-N63.
>
> The raw EDID is:
>
> 00 ff ff ff ff ff ff 00 09 e5 84 0a 00 00 00 00
> 1e 1f 01 04 a5 1d 12 78 03 5c 70 a6 51 4c 9c 26
> 0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
> 36 00 1e b3 10 00 00 1a 00 00 00 fd 00 28 3c 4b
> 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 57 55 4d 2d 54 30 31 0a 00 51
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 90e8c154a9788ad40e2101fdf39cbd92f2e0773a..9144de974f1e4abdd1af12613=
238f6f28d98fc41 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1935,6 +1935,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116=
WHM-N49"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116=
WHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116=
WHM-N4C"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a84, &delay_200_500_e50, "NV133=
WUM-T01"),

Looks fine, but can you send a v2 with the proper sort ordering? 0xa84
should be before 0xac5, I think...

-Doug
