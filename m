Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8769A73F88
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 21:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CFB10E086;
	Thu, 27 Mar 2025 20:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Kuk/+bzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFD910E086
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:54:34 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54991d85f99so2649737e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743108869; x=1743713669;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8UsDIEuQLaBq2B4bFyfUGHpD+OjquB6qiwgS7a8XjY=;
 b=Kuk/+bznrIxbGGmfn9yVoIwA1hEjBhTVCEGlLPPmHQeEY9N5Nu/kqwVKO0mD+AOesv
 rPCD5G7HYOxqRUlGW/9ZEJcknc7+PxXpD8vUBOMbo7sEY4V6Ri1fiJG0BCYkw1/Nngo9
 A0+YcKfkAkHr+49wEr9I9aU26+nsQ8AHrWeKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743108869; x=1743713669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e8UsDIEuQLaBq2B4bFyfUGHpD+OjquB6qiwgS7a8XjY=;
 b=HdHk4jW3qEYmjTMTP9gZiyaiWx/EaJ+y5xrh3584zRUKbM11swblZPvvoP3PiNOukI
 CDqeFWlSsppIOKqaLKKNcvh2U75oB9Hudxi6cpQV6TZgZ4gzanq6rDZluG/YaSXCE/EK
 YjxEODyBnCyCjkSjZ2iGxfUmpg503uxFot7AcwOezlb0LaWci+kZ8/0dUBRf2S2dNxoS
 ruAlsaNRxMDjjKOWbYRf73h8Mz3lelVo4MFKvSOGmAR9hqOXu+3/oOWqT30Exnrge72n
 xbE7Yr29aScCe3eGp6nYL/BqruV864gedjMHuwEn0+T4WWA2vxX8jJdVXmHKKWZHi/bL
 uINA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAMwJ3eSo3Z84mrRxY25WGDI/lrZpjtEXW5VUodWEv88sOymCI7/qOzIK3CMhF6N3CjhlKeOlLg3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4/jYCCoBWWFxVuPezRAtqFbvWEPkYbWXbCEmejDrq8LE/MMTl
 RxnVknKEZvNayLx9t229FLYof4hlfZ18XF75tl1vwqxKg3EtzsLJB6I6qEGvmpf02rDWomzcIsU
 BgYw1
X-Gm-Gg: ASbGncvobcOov3YzmzGc01+QUgmEpVLFpLqdGXDfoXv3mKxsO8CDzLtulw213rFS3xI
 lHM5PZLQnxZ+NSBAls8zUOv6CjpUshiMkPxvyDfeDACiZUo1DNWAHTxvTV4B4x2U6x6LVE5puUT
 1O66DD7buke3eK3mrCWJv5vQkcmSJV0epHpxFPIKE4ZINr3bCgN+48q4FHjuF5z463KgvRHTKH4
 DL3DPNbtqEh/BZKDI5og3LhfmGBdu8kwDXb0MFr22ygl/3OBsiWsA0Ae4KUVAX7ONBG6xxSKq1E
 gnMp+Rm2t78ZOlvq1bBV3Wdz1VQNVWqmJGpmkDSltSqsL/EvpGnBtMUW3v0eHDDXFm7O/b4GeGo
 sHVdG054S
X-Google-Smtp-Source: AGHT+IEPOfajfgh70a/9yh/P79oDhtnFrrKCq9gKZ/DOr/+Xsw5ioJryrWSxBRg/ASvdeDQwjPRPiA==
X-Received: by 2002:a05:6512:ac3:b0:549:8f14:a839 with SMTP id
 2adb3069b0e04-54b0adf3756mr64282e87.11.1743108868659; 
 Thu, 27 Mar 2025 13:54:28 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959104bsm74404e87.174.2025.03.27.13.54.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 13:54:28 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54af20849adso1422131e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7vaSG9WJsT8K+cQtwnt8oy2eysV87upDo35ViiF9rNr+ioCVVn8x6+zPA0NyAXIhhR5CdsyreWRA=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1145:b0:54a:f743:3137 with SMTP id
 2adb3069b0e04-54b0acd179cmr72751e87.19.1743108866803; Thu, 27 Mar 2025
 13:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
In-Reply-To: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 13:54:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
X-Gm-Features: AQ5f1JqwXpRnI1xK0FFhWi1aSV1krHZ9nkiYrhEk988aBRX6Vsz34UXOhp11Tyw
Message-ID: <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
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

On Wed, Mar 26, 2025 at 8:29=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> Move away from using deprecated API and use _multi variants
> if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> instead of msleep() and usleep_range() respectively.
>
> Used Coccinelle to find the _multi variant APIs,replacing
> mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
>
> The Coccinelle script is the same as the one in commit c8ba07caaecc
> ("drm/panel/synaptics-r63353: Use _multi variants")
>
> v2: Use mipi_dsi_write_buffer_multi() in place of
> mipi_dsi_dcs_write(). (Dmitry)
>
> v3: add commit details where the same coccinelle script is
> used and remove the actual script from commit log.
> Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v3:
> - Simplify commit log by adding a reference to a patch that uses the
>   same script.
> - Simplify code by using a helper that doesnt need additional code
>   changes other then using the helper itself.
>
> - Link to v2: https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-=
1-e43aedc115be@redhat.com
>
> Changes in v2:
> - While mipi_dsi_dcs_write() does not have a corresponding _multi()
>   variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
>   APIs following _multi() usage for easier error handling
>
> - Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-=
1-ee38371b0ba0@redhat.com
> ---
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41 +++++++++----------=
------
>  1 file changed, 15 insertions(+), 26 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
