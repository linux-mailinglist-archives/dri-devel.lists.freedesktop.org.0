Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80159860C7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9726410E847;
	Wed, 25 Sep 2024 14:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xz6HiRmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B173210E847
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:33:13 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f75c6ed428so70425391fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727274791; x=1727879591;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65VA0NQnFRDpybsCtjHAkUveWm0YvCe5g8L8mRc9rpA=;
 b=Xz6HiRmi+8J5U478jS9eEz6uufZAp9y6Zpiy6gq9qZddpDjgKNvOADO7gdBGCcSzZ6
 VeePJ3Q+cnqaPXoxYHydGfKWSP5zpYHcBj2Cux1ThIXQBtKtTNcqbt8t6MPU+7Op3U0a
 5ifLBwR+0cqcfgo3+W7M1o1fINtnyE0IRkArk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727274791; x=1727879591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65VA0NQnFRDpybsCtjHAkUveWm0YvCe5g8L8mRc9rpA=;
 b=w1iw5rCTlvQG/lVGTkm8919FpIFZUOBJHVeSZqSxGi4OK5cTfcCoxcramWUDN/zzXX
 ghqu1634GoRRwUEeN9TDv58efhyiGkctKC2Clnw9EXG/sKx+4Z4ONPBBVe2vhIJ5WKY5
 c+fAIHyf1D1qWK86kNkcK2AJqF01WP8s4ArPGbtRMjrz2RHTY7S0/0zDL7aAtEP1S6ZZ
 /SJuiJ/ZhRVOQ5ZXy1grOY+T6F44JjAcov0yFvRhArHC2IqKEFiIl69Qj949wpZxLIby
 vXQ9w4IerPjDrwL0RCLiTnbasSDFO1A5MB/wPtdW5MUTstoTnZaxh4FgMUxDaCTC/fsz
 I+Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHp/e0H/tnyaZgVhuGDC2A5qgrakkdD9iPzOxqfCzYFw2m4G8610B/z9Rn6s9W9qfSGLIAR+Ibi38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKTkexItabDefQQAB3xRSmUOtplwTnStefu+48XzeGFl+5+IFk
 EqT8pPxWl9+r98kFvB9W/sSX8AGM0w4SuLzPxbMEcTcIGwmxwMeZMu149MyqxJAh80H/eGstlYJ
 rxQ==
X-Google-Smtp-Source: AGHT+IHIKMDHSSgsLbp0UJ0Acc1LtghKilAzqrj0V+5JKecYetDCFozgLlHhgjKuS5e9HBR1NaAIyg==
X-Received: by 2002:a2e:be04:0:b0:2f7:4e9b:93c4 with SMTP id
 38308e7fff4ca-2f915ff9a1emr16630961fa.19.1727274791115; 
 Wed, 25 Sep 2024 07:33:11 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282fc2dsm5404371fa.7.2024.09.25.07.33.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 07:33:09 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so8814020e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9VOmDDzOLA36pB7i3moLzaQpXommxPonAq1MGOnBF/ymvyHg0Dx0oSmL8QGed3WpGXBXg4WKvWbI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:33d4:b0:530:ae99:c7fa with SMTP id
 2adb3069b0e04-5387048cec7mr1901357e87.10.1727274789474; Wed, 25 Sep 2024
 07:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240925080003.1250448-1-tejasvipin76@gmail.com>
In-Reply-To: <20240925080003.1250448-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Sep 2024 07:32:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZJCvLJMmx45zgfruNfRKSMndUm7X5DWTO=7MVmMpO4Q@mail.gmail.com>
Message-ID: <CAD=FV=XZJCvLJMmx45zgfruNfRKSMndUm7X5DWTO=7MVmMpO4Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
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

On Wed, Sep 25, 2024 at 1:00=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the elida-kd35t133 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Added back bytes that were removed
>     - Replaced mipi_dsi_dcs_write_buffer_multi with mipi_dsi_dcs_write_se=
q_multi
>
> Changes in v2:
>     - Changed mipi_dsi_dcs_write to mipi_dsi_dcs_write_buffer_multi
>     - Cleaned up error handling
>
> Link to v2: https://lore.kernel.org/all/20240923122558.728516-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20240917071710.1254520-1-tejasvip=
in76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 108 ++++++++-----------
>  1 file changed, 45 insertions(+), 63 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
