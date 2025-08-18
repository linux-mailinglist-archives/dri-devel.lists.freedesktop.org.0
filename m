Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12705B29DAB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E4110E401;
	Mon, 18 Aug 2025 09:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YyxQE3nI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EA910E401
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:25:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-55ce527ffbfso3432133e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755509110; x=1756113910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWl9Wdg6tQt829hLiKPSU5FXqMuW8JcenL87lFgKzLo=;
 b=YyxQE3nIzoTEQ/tgj8v5+R211JD9L58t6fiuqG5Rq1lTWWUwgfKLOrCrc3Dn2d1zYB
 2NEzKpzsgGs/fknV2kSCjfGdyH74cfwclb+fmvE3+0TeQIfydv3cHklL0TQiA4/uvSjY
 jW/Y3+Re8aFjUDnVnkiGC1Otyj8p75DNs5g16gC9gvYnlQXOpnQmzgGwPUwV+SitZMiY
 3XljrGqQ+oZ97Oku2XNWilfHXKalEzPAejNJzVSdJBxja98glEjz5lNrE2UdOq3ZTRjW
 VScHOsvn/VRw+Eg4fQfc0BdIWbUmM8B/REvogbne6sSj0lkRAeWEh6M54FZ86e0l7X8N
 MfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755509110; x=1756113910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWl9Wdg6tQt829hLiKPSU5FXqMuW8JcenL87lFgKzLo=;
 b=PNYTIijwwodFEcDUptU3wlxHyo1ohG4VyZA3fGRE1kWC5hd7XkuyT0X8K9CGIJRGjg
 o16aa92LnHIsbPCaz0yBUxCdm4CXTaz3qv0fgAbocUWNCgI+gJ4TLnlpbV2cW/C7Isa6
 bOe9QCTXXZDMvSIXdvwV7JkpJtk2Y1O6iW0yPb4wV3K6F/ulvqiUwX4DKzuXPgTjak0J
 SAKJZywhQ8oh9W2P/H5+Stjsh4kFz0/CgBqi2JPquWsm2VJFhXqMMRD2bLMR94cbFNkB
 aoXQb8BoOtOMT9s0Ysi4Ofl1jJhrfb0WwQKqgFOP1SELBmqUp+RV2buPLTVAx/rZzXgW
 zqMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn7IX224lf3SLTeRWjk+nvBGcPoz45i1QercBigAvRzUP+OYQZGFEP4Byq/aCn54j0tNpEuBdtk8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxQvLs7uhfnZtWFL42F4UvuC4VbvSs2m0PfpZf07JQsWur/TIC
 XbGsHYddEqSKT6UW/cVew7yy+biCvWYgBdtFo5vwQ460gRnEMby23YTzNgZhVqOyqLH9dJ8rNvV
 kcfdPkT8q5Ga8+Es712/WU0sNJR/R2/nVtL3av8gGrw==
X-Gm-Gg: ASbGnctW3h89nYpVZOAtW33erpVB+XgUrL1us854bLMaa++8l4ioXnbcmIl/6oUo3Oq
 nL7Obp6lIc5ZvDU+fj1C3glWSbeHCVpn1b7M+h5hfH51340RvI6TXXpI2dOXjZktK/iG6vvb50G
 u9sGgSEC8CM7kuCCetnObCiZ8SlMbFWAi9ukBA95ZrnnRkygUOqts8sxDXBi23iQ7pfLWHcmrHu
 1He9+znECPH
X-Google-Smtp-Source: AGHT+IFC1ZjNERncmt6aCwcSemfraYYSYedGgU7En/j6NqE3CZM6qjD72eC9aTSLaWwQX3FdwMknfiQchSSy/0ZOP1k=
X-Received: by 2002:a05:6512:104a:b0:55b:760d:c2f2 with SMTP id
 2adb3069b0e04-55ceeb68062mr2942102e87.33.1755509110245; Mon, 18 Aug 2025
 02:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com>
 <20250730061748.1227643-2-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-2-me@brighamcampbell.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:24:59 +0200
X-Gm-Features: Ac12FXwBqttAHWn-Fzo0FTZhwhrfc7nvpSbb3PEL3L84qoflel5B9j8C02N8kLo
Message-ID: <CACRpkdaZxPKmi3XWxKVG+HpssdH=HGDa68Ek=bcX-GEaQXaSbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
 jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, dianders@chromium.org, 
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

On Wed, Jul 30, 2025 at 8:17=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:

> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
>
> Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(Maybe this is applied already...)

Yours,
Linus Walleij
