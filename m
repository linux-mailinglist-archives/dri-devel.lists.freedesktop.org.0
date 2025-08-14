Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A407B272C2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 01:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0610E22B;
	Thu, 14 Aug 2025 23:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mhOGUnRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494D10E22B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 23:09:15 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-244581caca6so11165875ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755212950; x=1755817750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS3pe34+blEX5syRHqDIoKBEMxv5qKslIftcYANOZlI=;
 b=mhOGUnRFsu0RX/+PM0kI72J9Mf/ML1qtFRdktdp3n5Yibp1m42PazeWBgLBFV+SXUD
 ew+KhUk72QHn921BypyrheSiiZDsU6GKvjBNdaELuJxTM09gqh5LTwM3cohHNRhTf9OS
 zQDG3pw0kKasWZj9VI4Lmpda5K1E6wZiirOR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755212950; x=1755817750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wS3pe34+blEX5syRHqDIoKBEMxv5qKslIftcYANOZlI=;
 b=vlmD+WWR10+s8V1/4C2SiBk/fdVCHH6KEg1J4UQ5Ml0fnOFftX+BjtCutQEs1bNBnj
 Lb8cRJASh925bAQZFC7RmAWL/aza84LcI/NibGiENCpcyiOEIMUKwNmYit+4M416O4Lh
 Wn9iR8uB9BZ0Fk0W7nY8CAt/UseddXHhbgPVJJJgLAqJa5QBIt9PbDeogETOSACY/A23
 YYU9gVZ3EH8aGCbq2F+1u80F0aDTFUl7zLb/vbwxtUm4SmPswf7XDpw5RI3iy2nbl17q
 5mt/3jH4GjALKhVxgp5R5A5dmHMAjklvLA/Pl/epIRYt1bqMqnbiJgh2Eaun8OxdWqS/
 Jz2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSSS5Y7XL55M0ZUuxWn0PNVxfo1eoEVDlCdhz8vJq2Wt/2w9b/60a+15u6ZGPcLtah1MdCAmoclfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfQp3w2kPKE6G1lynk42/rnVrK1tAO15RwrhtmugwcBmKvxArh
 e99AkiMoUQDYlnVRxrve344R/BLtQAxwZFIO0wCFhAz+PT0f61uGxKKZ/09+zk7GgmFVQjjEIQb
 7eS0=
X-Gm-Gg: ASbGnctob4PulTnyYwK2YBNE6gpCqDHcBmZjhyuTEZPcX/3iUJdlpfHHHycsoV+XSJs
 TIpJYc1UCo4KkT0qhH5ipwqs7HTtA8BpKOGI2RZIGbKhezUAXJkyuFjdSzIWKn14VnIFdGiOpJg
 jjg/nbPHCHjBx+rNA4DtRtnnvooEQC/bYES603PY4W/jSgGC2hDZJkAEh3PqPDUEvd5SmpZsUBu
 8Vaen8gpqqRQOy7XsmavTmVRbdTatV20iKRjcAJfnqwiDMYCbH/s1kPIDltrovn7ZsSW1t7yZSS
 masJcOpXIOhvKZsY3YEtXpI+vZ7nbLQGH4n9Di7y8XP9N+T6qmy5pXdX6H5m3Qz5fphRvNoI4pl
 PbrpPeIZu1oOXozoAKhLNWKOyacs50ZOu252PTBvKlX/kZWMsjjeZMeGoNA0w+CU2kA==
X-Google-Smtp-Source: AGHT+IH1Tr4UYtssU0kBHnBO427na/hHk9+TPu9+vY351pda1cptIJE9uz+1i6/AHiO9UpVhW5eznA==
X-Received: by 2002:a17:902:f788:b0:240:3f4d:b9b1 with SMTP id
 d9443c01a7336-244586c404cmr67167975ad.29.1755212950198; 
 Thu, 14 Aug 2025 16:09:10 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com.
 [209.85.214.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ef54sm38765ad.26.2025.08.14.16.09.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 16:09:08 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2445826fd9dso16123655ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHvAMi8MRzDfaedNYyO2qG+s1PjZWGIS0cYxxRovVy47sh2x1E7EHumuCcy0JiK+tB3EwnJwM4dlM=@lists.freedesktop.org
X-Received: by 2002:a17:902:d2c1:b0:240:a430:91d with SMTP id
 d9443c01a7336-244584ed485mr70762725ad.10.1755212947590; Thu, 14 Aug 2025
 16:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250731032343.1258366-1-me@brighamcampbell.com>
 <20250731032343.1258366-3-me@brighamcampbell.com>
In-Reply-To: <20250731032343.1258366-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 16:08:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7wxe81Oi+SZdT0ym1FTz94+=_2r25x3Ju3aS4YsW7JQ@mail.gmail.com>
X-Gm-Features: Ac12FXxHx_giTOx_CEoA9_jVJzsA_CjD1xiP9IJHbCl-KW_M3haonEOgwpAIZVU
Message-ID: <CAD=FV=V7wxe81Oi+SZdT0ym1FTz94+=_2r25x3Ju3aS4YsW7JQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm: Add MIPI read_multi func and two write macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
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

On Wed, Jul 30, 2025 at 8:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-constant data to display controllers.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

I resolved a context conflict with the other recent patch we landed
from you and then landed. Pushed to drm-misc-next:

[2/3] drm: Add MIPI read_multi func and two write macros
      commit: ffc23a204a5f2e763a8cc8a8cfefe0027a6f0ec3
