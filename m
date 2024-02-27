Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F9868509
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 01:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264910E4E9;
	Tue, 27 Feb 2024 00:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnzHbtvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1210E4E9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:37:25 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-607f8894550so26447957b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708994244; x=1709599044; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0iKNjUWW7iRYO9A2SIeCUXKezp5MA/FCeIQBi7AX+V8=;
 b=bnzHbtvh8O/3/RBsl1s4eCiHYYKI2uvZ2m9FZQCgmS9LLjZ7dXisNL2HkA1DCk97Be
 P0Spgs5stBVFmgJVbHDPOvbTWRdkKUR0WZhpcD1gyemFjghgi5UzpYoqoWyO0peFUpSi
 +9CXPhUCcquoDWuRvgHZwY2+yx8fmRyVYIeut62cLvck66MwRNhbAjdTM3WshR8PZv0P
 FWjg7sBAxa+YyGR042jHzdu4uFguOsUF7Wo1//btdtOdmsJeZOL8TTaQLFa6pyCG7Nzr
 rILZLEFOZf/Ig+Y1OOK91qj66Y1uiG6xUNiZhWJbtTa3nSLrkRyLcf4r3hVh9MKk12K7
 HWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708994244; x=1709599044;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0iKNjUWW7iRYO9A2SIeCUXKezp5MA/FCeIQBi7AX+V8=;
 b=WtmN0MVmRhvBLGp4s4RdvU+5RnPE3HeH+HNp5HTxR/1BGOyY73Yc4dzJlppa6zJG6c
 w5P7EMrQrCQbOe+XDHSNKJIOFwVwtT1jn1/bHozJ29LT2+a5llrgcYZp6NMmL+iEIKrh
 KQriWUdamFPnKxAa1nejVtqBlbpvSjTtlbCQfahzY1v/VaE5HnSBihHKYuTjBxbR2mlq
 S1Md7axKpk61tN8g3GDMPHrvBcySm1aIaAqmCWOQ3CFBBMfmDVCw+mpevso24WjygXTO
 MARp1quAQ/cxXwrfW4S1ZFkrT9KpLyE964XcRERvBgbcXvBa2pG93f4WMMS/D+bTHFPW
 BpCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLwx85PNlE29j/V4Pu7RyTo8Srdn4Awt3fb0S2bBdCARvfxXtUSQ23KFlI5MomXycauBN5boUo5zf4sonlO5W9hu9GbYzqxI4Z7cHzZo8+
X-Gm-Message-State: AOJu0YzYCkbTIm2F4SpKtJFjGOdA+zzrOSZDaPdoFm53oik4CQzlQmri
 T061PXIpRDbcqdJbFt2Zmkw5/fQRVwCPEjAgpLG3+uR11lz5qCh9TukX/KRqFgNpNSW2PNQSy/K
 foyCmxLGqn13N7NWM/Rt7KFV1J8GrsKvX9U9Ydg==
X-Google-Smtp-Source: AGHT+IE4df8EejmK1GYtnYYIrilUdBgPMb7hN2YbBWwQO1DFK1I89UwkIg2NUUy1NEoZP4PPArIQGcOaiQ/Mu43T4Vk=
X-Received: by 2002:a5b:752:0:b0:dcd:b034:b500 with SMTP id
 s18-20020a5b0752000000b00dcdb034b500mr889012ybq.43.1708994243773; Mon, 26 Feb
 2024 16:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
In-Reply-To: <20240223223958.3887423-1-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Feb 2024 02:37:12 +0200
Message-ID: <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Match panel hash for overridden mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
> auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
> product id. One of them requires an overridden mode, while the other should
> use the mode directly from edid.
>
> Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is extended
> to check the crc hash of the entire edid base block.

Do you have these EDIDs posted somewhere? Can we use something less
cryptic than hash for matching the panel, e.g. strings from Monitor
Descriptors?

>
> Hsin-Yi Wang (2):
>   drm_edid: Add a function to get EDID base block
>   drm/panel: panel-edp: Match with panel hash for overridden modes
>
>  drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++-------------
>  drivers/gpu/drm/panel/panel-edp.c | 60 ++++++++++++++++++++++++++-----
>  include/drm/drm_edid.h            |  3 +-
>  3 files changed, 84 insertions(+), 34 deletions(-)
>
> --
> 2.44.0.rc0.258.g7320e95886-goog
>


-- 
With best wishes
Dmitry
