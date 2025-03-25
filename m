Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EAA704EF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342010E550;
	Tue, 25 Mar 2025 15:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="I/S8hXcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FCD10E550
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:24:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54af20849bbso1778747e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742916250; x=1743521050;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3+8bsc2QVqd8YR+1dNBTuUVkIye6hV+ORmbDcd3a38=;
 b=I/S8hXcjgoa2eKUjok2S6W5vDs+CY4fFbmMKLUb9Svr1iin5w+Kt9YIXU+s9A+EQi/
 tqcYy7OWEcgG16+C+6RuF/6c9wJLmpeaQxlCf2m23tYVbQm0OICiyj5kEumzDXw+GTiz
 4rdqAuNVZ30/9bPIqADK2y5Nsr4505XiIf4eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742916250; x=1743521050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3+8bsc2QVqd8YR+1dNBTuUVkIye6hV+ORmbDcd3a38=;
 b=E5fbhPXMufRtJYo/5G+1oFK7suTFka/ooHlBut9HUDfJjDrgz7H39fr36Onmg3Nnyp
 uqSHxLnSnDtDp/H3g9Wz7f3OQXr3J8wUZ2X2SD4S/DYyP8Jih4S/m2uWo+3XrKHBjjFp
 bjupUsgWeSEJbewno7R0lGMvbM4z2XuNEfdoZjTgJo8BG/+nJyTntzXaQeCFF5Oe3Jg0
 KCp5OOF82wNK+W3g7Tn3GA5YTodXO4gZjK3Ag+/ZhRHcO8SMnpXm5Wd9iqQNPX9GuAtp
 m32z8F2pM6RHTxxtcbWhUmPWo/qBvHw9hd/vwrKJIL6V8FnVAHGfea30egrq+/TMbdNi
 1pAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyd+2YJR/i+wtg3724nTsMKga8PuxZhM7X7+du50kNdCR5xzzDyu9s7qf0qzBt5buuWKaURTkD2vE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZaI6OOvMMk3eEkykn2Hrz/BpTwdgty693Q5xuc1dyi2IBFFKW
 fegD9sHUarKH8D0rDn0PQhlMkn6hGXt7gOblyl5+k8mr6k1Rr+qxPsiZv9nqATkJ+1RCgtD4cRJ
 pOdDd
X-Gm-Gg: ASbGncuGmfmzuF2A7D/WoXWHYUD5s+EfYE/01JdPZyEwiEO7kmj6yqxSjHata/ypdu2
 xs2IzAsVrwHL+m4+kfyqJ1nt3aQ9ZFpKWCOUE3UCxhXCqjLfLwdg9hXC3lVyXHzbakHQ45Ge4u8
 4PLvQ5re2VXoKM4yEhvDxqTq/vuzlE72B/8TTGK/0shwLPTlBDE61MNNM5Ag4ZBezn4HrW5UjqZ
 asFxRQ/WhllQCfhl1lJ8VZjCSA07E8JZ6uw/evF6hNEDVLtkO92axbqk9rnKqSveCc66rkKkrt7
 RXKlPP59IzNu3yuV85xHjaYdKz8PqqtaTsq8PxWESsOS2uWFQ7esnL7CjiAtgd7A6VJldXvln01
 zFEClphi5iyDj
X-Google-Smtp-Source: AGHT+IHrTxznkXuW0vjv60xv5OtAAVZfvweRbsiRYjLzYF99RZl+cfRBPyZ4M1xDqNFyfv4Xs9A9tg==
X-Received: by 2002:a05:6512:108d:b0:545:10eb:1ab2 with SMTP id
 2adb3069b0e04-54ad64f611cmr7025670e87.33.1742916249904; 
 Tue, 25 Mar 2025 08:24:09 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad647c79dsm1512068e87.70.2025.03.25.08.24.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 08:24:09 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso55821171fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVslPLETQamle8ssegEcBAYIh8tYDKIOdkpxhQ5hR2xvU27ddl8lWbZT7PtQev8JChjHnXmpW79jfU=@lists.freedesktop.org
X-Received: by 2002:a2e:be0a:0:b0:30d:62c1:3bdd with SMTP id
 38308e7fff4ca-30d7e2ba26emr74845121fa.23.1742916247223; Tue, 25 Mar 2025
 08:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250325094707.961349-1-tejasvipin76@gmail.com>
In-Reply-To: <20250325094707.961349-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Mar 2025 08:23:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhVYBjGYJFn7Ooszx5Wgk47vLPj_59MWU6t=LQ-iJbTQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrWE2x9JIn0TPRim15TMFG4kF_9Ffm6HQx-1emxlt_BczIgP8cT-z7urPc
Message-ID: <CAD=FV=WhVYBjGYJFn7Ooszx5Wgk47vLPj_59MWU6t=LQ-iJbTQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: himax-hx8394: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 megi@xff.cz, javierm@redhat.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Tue, Mar 25, 2025 at 2:47=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the himax-hx8394 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Revert behavior change in hx8394_enable
>     - Move variable declaration to top of function
>
> Link to v1: https://lore.kernel.org/all/20250323053007.681346-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-himax-hx8394.c | 441 ++++++++++-----------
>  1 file changed, 210 insertions(+), 231 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
