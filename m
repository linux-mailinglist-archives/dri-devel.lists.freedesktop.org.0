Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61556A2F1AD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4171E10E597;
	Mon, 10 Feb 2025 15:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HJ/MjCJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482F410E597
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:28:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54504f29000so2103683e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739201322; x=1739806122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zBbPgo0gstLNKC4D9HeuENhxvfaeb27YQF5JgeDpmA=;
 b=HJ/MjCJhf1qP6mw5t5qsgUjjNDSm3gf/22AavjLIscLX7a9LsI58fBccJSJzKgoGz3
 ZcDKSSQc9D8v4z66LZBfJJ8Hza8JmZQuEtYVZdrprfNrw69bAx2h6OZo32GnGJmWdJTd
 QbvSvWpAvCtrMf6Egb8lOoBBslOcr8QD87OPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739201322; x=1739806122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zBbPgo0gstLNKC4D9HeuENhxvfaeb27YQF5JgeDpmA=;
 b=uWvxMbCL7/0It4p9RNCZir8odr9uSrkCgw5CgZgl4f7UXrYa5Tz8QlHAafgYERKpcz
 8tMRDDugNCV1zlhPwjlms+44XLXr9TS4ci294kMqp3xP3L8a+BjgekHD9owyTVwNbE8/
 uw6NppA6+dHFP4q1uAY1kiWZ0VwnlzuPlaaoqwi9fWlJ0/OuVlbqdgip1b+pgpmz8qij
 g+fY3DfqX0hKpSvbTBGjFGLupdj1AjKKvPMRPWYA5SSHVs5u+55cDD7WdbcdGMbp865G
 GUPQDE5LwjKSKvusfmi/36PPongKsQCQFYntFJk1GnyJrucuFe8lDKdsF2psmhATEQCb
 1itw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt352gu2socZ93TCNtETD6SkfQKak8DWnU2dbZmFibyLz2ABCy8Ob/4zP+2ZOGcoaDuhkqCCLu8Xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5YJtS2rDXBO8QQW4v0vQqIooUhCzQlTGj8YnzB4Bzz2r9alWU
 bH757VlSXP4DgJXFr4siaAjE1TDKM02PfmHKlDGsTNG7u8fYW7K/z/d4GXUARuzt6fhQW2/SrnP
 Dwg==
X-Gm-Gg: ASbGnct+g0+zJ4ky9sjMfoI2H6qBwZSzIw4EMoqzrOUWM1xQJ7DxYL3SLjtvvwrl7+q
 OljfJbKkKUt3I+KHOqNbSVRm9fRqM2WHXEr/UORtSxEAgLJ1xEGPMWMhHEUYAdp3E/vdwQXuxGJ
 hgPdsWVe5bi26o0GDmWhjJmlNHlxDGXgNGRLO7Isx2OZaoAWLCGRttZmD2Z3hZUKk2/J2SmiDKg
 u+F8UJhW9qdRJTMJMQjH1kuSF6rbktW+Hi5tF9qO3GbJRFeGSnLBk3o5dEECTfdABgz/PsW9Ijh
 ZTnaL0jsiomwnlKiwOcEpl/8oOyDDtNiFWUSVlTS9bm+gOXXnJDRIjbJxRc=
X-Google-Smtp-Source: AGHT+IGbAEEFmMIzGbiY8m0Je/juT9XdqSvtEYvWdQSw1KnZ0LlXd9uLts+aBrvmX6E7dfVx2qIj0w==
X-Received: by 2002:ac2:58c4:0:b0:545:f70:8a95 with SMTP id
 2adb3069b0e04-5451186f36cmr33267e87.32.1739201322219; 
 Mon, 10 Feb 2025 07:28:42 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450ed1411dsm184942e87.97.2025.02.10.07.28.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 07:28:40 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-308edbc368cso11369691fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW65tsjfr+Fc2Lbgkiuzb8yNUDjmIlIhOS2q3W/BC+kalznsfKTWN4SodBNeEj4W6YxIVcpd5HnXrQ=@lists.freedesktop.org
X-Received: by 2002:a2e:bc07:0:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-308f8372de9mr941611fa.16.1739201319830; Mon, 10 Feb 2025
 07:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20250210092342.287324-1-tejasvipin76@gmail.com>
In-Reply-To: <20250210092342.287324-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:28:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
X-Gm-Features: AWEUYZmsY_bn2OOmH7vLcQO32Ai9fXk4Kpekh7FXVF9vNXeLEqjQTJQ1OOX1tWI
Message-ID: <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
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

On Mon, Feb 10, 2025 at 1:24=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Change the visionox-r66451 panel to use multi style functions for
> improved error handling. Additionally, always drop LPM flag after
> sending init sequence.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Fixed visionox_r66451_enable to return dsi_ctx.accum_err
>     - Mentioned changed handling of LPM flag in commit message
>
> Link to v1: https://lore.kernel.org/all/20250208051541.176667-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 181 ++++++++----------
>  1 file changed, 77 insertions(+), 104 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
