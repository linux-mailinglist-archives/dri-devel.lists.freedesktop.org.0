Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012BABA212
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 19:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0910EB4E;
	Fri, 16 May 2025 17:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oEFK3ZLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C6A10EB51
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 17:43:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-741b3e37a1eso2693917b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747417387; x=1748022187;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
 b=oEFK3ZLOaZMt1jA3BsxRBc6WJ75C4riHc4WAaLYKJ9YxlVkr+T5Ii/indbG1eEUKcU
 7aCOX1AwmEfIyeoFaJhri/RB6v4veRibFqpZ7k/J5P8F2f+TxfHEq/rd8HsPe4NPLUti
 4JQxTXHhtnL2s55t6pVZVEpqvQrpf6oeeqoGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747417387; x=1748022187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
 b=qUG19Cu33V90HykHkXACids12fuLBIq96P4NhC1BO/+Oz3QbY4ssPiWmS7j1urm/IF
 TjLPXDrcGcTAtYmd/q6Fk1QtfQnbcuMxDu6CnHBq4oDsEAicmcewqCRjSQg4LaumZeYb
 EENQMANwom4GLH2GoSKjlDoY0ZSCKeTPCKdfoE6y0LlJi/SGGrmlULuD44MQ0NZ7Lsv2
 n5OF8X41Sc8GWOTbKDFrmYMoP3D396nqkrXqTfJ/TKMnmOt0EZr403XrfHEbfpF5UGj5
 gxCj3VcnOl5puysEyEv//Df1q9K+H4X9roJpGgkOa9H79r9eES8r+LjwwNRVKzh7Gy7g
 IntA==
X-Gm-Message-State: AOJu0YyosZ9uARAzCqJQT+bZFI2UIT9M7oQreaNZGTB/Z/bx0sYdadQe
 RrH/3joMu34wfn2Hshfpz7vr37pwCl3AuIAgkIPa+RpMHke1llJtKNxikTAJdMjabPNJSVf7rn7
 wWnY=
X-Gm-Gg: ASbGnctbpY3+REbGJjs72LJtc12+Ox/DB83drYk2UM3r5reJV9ylC3sNmwra5pC50Ks
 2lhA2d5Yfu/POOZxFD4d1dMhrLNz8Gf4wQP0PJnlVuFP5OGv2HhHh9fRGqU6exh7Z8ywAcDQpUh
 uxJM/nMZ2aKpcj1jPQ67O6/03e9u5E3vKNcpeYwoSH/KXV3ldSIQ+oATH/6wkpy8kNZVYMCWm5Z
 OLAm8jBTZoE6rlPf3iujvWR0gX5fsyrEAX3JmNfF/K4rR6sKv4nQzRjkuygHirrguOg6O4U/ODy
 OHiEIzXVUXg+n8uFOi+t0lW8yYyotyBorLuy0/M73e7OxciRnKrJpRk0xl79Xy8OkXGdCOHU/48
 CcUHh3R8fSXotQJbXeNI=
X-Google-Smtp-Source: AGHT+IGxA4Q0ZvYI4rbpltZYgmyhxT006S6xGExfwtS65Nnsn94JgCeCVtKlLaTOZL5i0h68xfdUBA==
X-Received: by 2002:a05:6a20:430f:b0:215:db66:2a28 with SMTP id
 adf61e73a8af0-216218f7e47mr6758282637.22.1747417387587; 
 Fri, 16 May 2025 10:43:07 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf5abedsm1852348a12.3.2025.05.16.10.43.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 10:43:05 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b1a1930a922so1680925a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:43:05 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:231:7e15:f7a with SMTP id
 d9443c01a7336-231d453469cmr47600355ad.27.1747417384710; Fri, 16 May 2025
 10:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250515211110.8806-1-robdclark@gmail.com>
In-Reply-To: <20250515211110.8806-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 May 2025 10:42:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
X-Gm-Features: AX0GCFsvr22QrX8yE42n8nz9bH4x0JASq7vWnUdqtPzSrItPo7-Ymzm-4RYVtfc
Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Thu, May 15, 2025 at 2:11=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an eDP panel for BOE NV133WUM-N61, which appears to be a 3rd panel
> option on the lenevo x13s laptop.
>
> edid:
> 00 ff ff ff ff ff ff 00 09 e5 64 09 00 00 00 00
> 16 1e 01 04 a5 1d 12 78 03 55 8e a7 51 4c 9c 26
> 0f 52 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
> 36 00 1e b3 10 00 00 1a 5d 30 80 a0 70 b0 28 40
> 30 20 36 00 1e b3 10 00 00 1a 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 57 55 4d 2d 4e 36 31 0a 00 7d
>
> datasheet: https://datasheet4u.com/pdf-down/N/V/1/NV133WUM-N61-BOE.pdf
>
> v2: Actually get the panel name correct in the table
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next

[1/1] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
      commit: 3330b71caff6cdc387fdad68a895c9c81cc2f477
