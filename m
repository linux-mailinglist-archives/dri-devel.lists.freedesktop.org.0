Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1557BA42C84
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2810E4E0;
	Mon, 24 Feb 2025 19:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="meFeXxJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5D210E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:15:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5452ca02bdbso4477907e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740424538; x=1741029338;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TzgdVT1U2w63C1ytH7xYdb5XCyf7BmjRmhuaIOdGmM=;
 b=meFeXxJeNyu4xY0pReG9a/Hnz+ezQzGUjsbzhjRQsgXKPHcg6cvPRnO8kP4iZ4FJ8w
 oT1rokRwXDAqtvubxhptgJ4iO84jFLAW6JBJriDimrIZYXuoub1QWffIcRE7qAlyYq+1
 njrMo+HHTSFkrQJSrGxD3+aIydikF+Z57RVyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740424538; x=1741029338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TzgdVT1U2w63C1ytH7xYdb5XCyf7BmjRmhuaIOdGmM=;
 b=ZOuSBbDoTn80bmeMLY9lt/lWWqSoGD/bIvi6lTAtIFI0U1wnBQVqhFshB7hGSDxkei
 AN9NACEqlvAS7SI8lRUukvJKbPafFzcacjK8Jl3CLH7Qj21hJeMYnB6mXuoXjnGIUEtE
 GXwsTWJoWtrREWY2OBqtHYootCwXy4ac9r2aiPFTkQ1tDsoWifKjZNJKl34tjsfrck/5
 LI4efL7tmCmMGCdFqOmDg8g9Il5rKZF2IvQ5gyq1wwFEYHbDt5aSddFeo03c6gc+TVQm
 umUpwGD+jyxU8IH1iHyiEJv143C6mjmMxsIKQNZ+oiAKeONPVPcaB90UMQE5VyfQaEoH
 xv0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWArXcvWGNo/cfZKQSwfxzqNU+dfIjFPFXAlOoXQsU6CSyZ5fLWlonz5lU0QTIRacu0Ua0IXRc/OK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj3nFEvGCRGB6eEyo19Y7U60QW1HBB6LExbo4JzzKKR8kcOhRf
 UZXSF5UwqlH7zhQoUvon7tI8yfQ7IZ8RALOJffMUkq/bf7LsS1TuZIAk7WH4+Di9aeWMt0u1MuE
 n/w==
X-Gm-Gg: ASbGncsBMzW06MeHgKjKQRDRwD5upepNj6eUrpjIphZ4QYD3AX4sknNA+WyVH/uzj1/
 ZNcWEHjldj5h/C3YNO/jV9jMQs+rKFPIW+w6NAnH8Pf3tUcTe/6erwkG/WBR25x+vxblWILoouC
 GMonbCxjb6GX2ZxwINrzPsafp4oLqOA8UmfdZlrseaHx5jBbA/MGdX2QCgKCxbpoumvxwOZXGH1
 yaNy6Aptaqloftfc8N4wBpcvxs490PrqvEpSqe3Nw9DCWYnpS+xQJL6N9z4mDu9Nbwrbw9pKzcQ
 VCYrY5aA2kHIOZcBkhIrwCbsFmKJTtPQHct9CbRwssr1vWiCQ1e2z2nV/pV5a2VGRg==
X-Google-Smtp-Source: AGHT+IF3Oq7vpasZFhmp/I+C5KoOSmse0Hd8OtJ4B8kh7md+wUgR3tyjgAfg0u77LeBerNTLlgQYpw==
X-Received: by 2002:a05:6512:3b8d:b0:545:2474:2c98 with SMTP id
 2adb3069b0e04-548510dba39mr86457e87.23.1740424537970; 
 Mon, 24 Feb 2025 11:15:37 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-546270fbf1fsm2122093e87.77.2025.02.24.11.15.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 11:15:37 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5452ca02bdbso4477848e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVbncZs2Q57LiFZLbMVoDGh8v98Ku6MvUgcFy6ahBE8qTEFP7KUpbJ7KrMlrC0Eg60GpDjwYXktIg0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:12cf:b0:545:5d:a5c3 with SMTP id
 2adb3069b0e04-548510ccd73mr93794e87.4.1740424536187; Mon, 24 Feb 2025
 11:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20250220045721.145905-1-tejasvipin76@gmail.com>
In-Reply-To: <20250220045721.145905-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 11:15:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UAX2wRBwZxEjFrETfi7HTrOc7cs3o6qJ2VZJ-F2bJ3bw@mail.gmail.com>
X-Gm-Features: AWEUYZl_4QZhQ9m7dCSBsVynW99879f9gxkGsKZXdk6G-yBZ_BrfThciwM_kgsE
Message-ID: <CAD=FV=UAX2wRBwZxEjFrETfi7HTrOc7cs3o6qJ2VZJ-F2bJ3bw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mipi-dsi: extend "multi" functions and use them in
 sony-td4353-jdi
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

On Wed, Feb 19, 2025 at 8:58=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Removes mipi_dsi_dcs_set_tear_off and replaces it with a
> multi version as after replacing it in sony-td4353-jdi, it doesn't
> appear anywhere else. sony-td4353-jdi is converted to use multi style
> functions, including mipi_dsi_dcs_set_tear_off_multi.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Squashed panel changes and mipi_dsi changes into 1 patch
>
> Link to v1: https://lore.kernel.org/all/20250214172958.81258-1-tejasvipin=
76@gmail.com/
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c                |  42 +++----
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
>  include/drm/drm_mipi_dsi.h                    |   2 +-
>  3 files changed, 47 insertions(+), 104 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
