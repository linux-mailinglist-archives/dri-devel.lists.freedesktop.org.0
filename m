Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32795C20E3B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8022A10E9E1;
	Thu, 30 Oct 2025 15:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BBsbORra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3510E9E1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:22:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so199986166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761837744; x=1762442544;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d/OVmKJJb7OlddG1Bh9+D9lD7AVNsH/e/F/SKjKcKo=;
 b=BBsbORrag0H+ZNJ4W51KYc+VAhHYYkZy9WVKoo7Fl+i00w+SObBKPUKdmTIcyu60+8
 Q9g1CSx02BMhGo/7P+sY9s2sbyWFQB+/6EXLroeUPeeEmZ2dwh8uC/QgBvZSRO+J/L4D
 bKdqHjp2SSdpCyvI0byQ2GU/zow7CNxSRfb8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761837744; x=1762442544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d/OVmKJJb7OlddG1Bh9+D9lD7AVNsH/e/F/SKjKcKo=;
 b=Bau5HTzvZ4Jm9GEXrgN80v4AI0kSnKk6vt+wO8utF/h0kdUzd/bU3AwN8sb/c8SXIb
 JfO5samiNpAMn/kftpfPOPLkjPWkZGsTlPUJM2f0n4B+CkW/39XIYk6pCSdR++3HrJkp
 NyKdjHs0R2xhprokf7LiG29WMtyPWHgPf84ju+rdfc3UcCU17tzwVsewgtaT8WiT8X6S
 HaYQDo4PiGFBaYu3vVBhujQDgmOed3kt3MObKCD1EXw5iKz3raFxNP1+SG/8m/9AI2gA
 HQWiNmGAT5MUyQHnzkoyVUIxkoWOE2MKKxuGH2NPmtc7yQRRUxNSfiw+dUv/JX6xhHmm
 1G6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEZT5KW0wYX1chn3kmTloku0nQUBh132HespMypLogiCDXfYXx9pg7zF83fUt5xVN0MTE5xxbB9pY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhEcE+VA48Dmj5qR36ywA3s89bNS5ZZgHZ7HRkR5yvjT6npRca
 68apqTOXgy4z2fxvVj/NDe5c76ARWYSooTeS4GVQsDedOqQarhxSnZEoPwmTD0H8FDvpm1OBlM9
 qdLmIeO2U
X-Gm-Gg: ASbGncvP9hJ4DbwFl10GI0ZiSOsUsoNjaX3DEqP3C0o5NxTuOORyWbnx49ybcrqwbGo
 ZKyp1Yha9LykxtgK++Y2/jaOouZjaHoDSezxq78yFwZYjKBjqrEZSIwjnVFmwSCXAMDq/sjAjGv
 qrmMgEJo3UipS5nMRk8KxUVYluvb3UanHFqHxDLeu79oZDEPQIx1KQxHP9BnNX4uWs8q+8AmFTT
 K51f+KZNTtT/0Lc0vPiEWRrZ5QdF1Gv8OBRZDnDlo5StK5akjBQo6yJDQIpEX+4Pcps0tNS03T+
 iy9XTKsb/1heVBTTGViN/gruaJe+GUcTphPvOtNQp0JbkZses6bUmNrFELmzV30LwS9IhXj23Ps
 A767bDxcp8icnyQFqMF2cWize4El+Hoy+FrGHvBqXpNb+7K2v9W6GyQpdVrej10/9zoCQe8RsSU
 awn108sUajpI6gjZwJ+tEepfqnohc/cjU8UX/oTdU=
X-Google-Smtp-Source: AGHT+IFYxuDQkRKeHIdbOPshgRd6sHcgZXUvtBRwaffitIWrJY3K26UihxqWWpJVDakSIxRHucdrwg==
X-Received: by 2002:a17:907:7fa0:b0:b3d:9261:ff1b with SMTP id
 a640c23a62f3a-b7053b63973mr310772666b.5.1761837743644; 
 Thu, 30 Oct 2025 08:22:23 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853e5138sm1781744466b.44.2025.10.30.08.22.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:22:22 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso8531985e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqc9g0xT8PqHXBK9/wHBQPLNw/Q2Wm0wpbESTY4b1ACbiqkwS7KcDPOrefA1S9CMulRcJ9HcU9lgI=@lists.freedesktop.org
X-Received: by 2002:a05:600c:190e:b0:46e:42aa:75b5 with SMTP id
 5b1f17b1804b1-47730793c04mr1042045e9.4.1761837741749; Thu, 30 Oct 2025
 08:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-3-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=WbR0u_a7S1pcL-6C+sj9Kt=GOLUwJmwt8ANJbyV4JYFQ@mail.gmail.com>
 <CALprXBb=_HuwskwFP0nRKH=3zwoGbig4fWY+Q4g53Jhn985TsA@mail.gmail.com>
In-Reply-To: <CALprXBb=_HuwskwFP0nRKH=3zwoGbig4fWY+Q4g53Jhn985TsA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Oct 2025 08:22:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXRpk=O7zC4B9hRE4oTNHJLosm_bhhNUgVur0csChMhQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnhb78qdonzJKwyTXBrXsT_c1_8-ezmVyvceIjunYMg8V3tseIDtx918nA
Message-ID: <CAD=FV=UXRpk=O7zC4B9hRE4oTNHJLosm_bhhNUgVur0csChMhQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel-edp: Modify LQ116M1JW10 panel's bpc to 6
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
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

On Thu, Oct 30, 2025 at 2:58=E2=80=AFAM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Hi Doug,
>
> On Thu, Oct 30, 2025 at 7:25=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
>
> >
> > Unless folks end up preferring EDID_QUIRK_FORCE_6BPC:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> After following your suggestion with the following, the issue goes
> away during YouTube playback.
> I will send a new patch for drm_edid.c, thank you so much

FWIW, it is a bit baffling to me that you report link training seems
to be failing yet then talk about the symptom of noise during youtube
playback. If link training is failing I'd expect nothing to ever show
up on the screen...

-Doug
