Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57567C0F7DD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3110E508;
	Mon, 27 Oct 2025 16:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00B510E508
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:59:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-592f7e50da2so5466842e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761584358; x=1762189158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyqxH4hxbPgxvQElXkdgiIeZ0ywNFegx6MYkB5gAcoA=;
 b=lcA9+R02xG0YrnZJeCXjveqGRUa+Pcf1w6GppnkUKDTfocno3YRkVU38M7Txwm2WXx
 mIGtjkwwUuLrhKjvDfDKc4f3zEHrUTaP4HPkemLl8ulKAbrzNa+cIzPbQ3VLKyEzwB6P
 Wf3MEjXbGBvY/6MsW/IeEdkfhXcdbd5jSoh6EovRGD6iYP8Oot9V2Gx82jUE/nud9aec
 +NbD/Cvc8eBpnNPYlFp25uvfx5XjEvRuDEqfRuEbcAvuVCK/eOAm9ZVFihWAG2ZMkBR/
 kPBsore6v2LqdAn7UlB79vhhZtTisKjJNCln4AFevNzVm/UXLnXML1tmkoipoWPXBplf
 kgcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbHKK6Zbc6seHr84BD0uZQqt6XR4JIUX/a0zijO0ZgWyYdVzDzTGLTDZI+5nYMc6POfg0Fq4xOzLA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjx20ZEzmi4fdsNU8Mn+ua2jUP+8dB8XEstJMXPF+T+q9a6gvq
 GUZwll/E/PPeUtmt8p6qr3kql5AlqqCzQlFNUeClg6o5V1lEg3CuU9GyO7cbG3zLj20=
X-Gm-Gg: ASbGncsn/U/DB/Q3Gr02UsxF2yvuoWZLPbDD9vnvw0ygz9Pc4nJutghtgUF/1ggPucf
 C/6/dNPAmPqTDhlFn7Eh5kyTvzpz54CREsNRdIWALfSA4aIjVZPoyU/D1XAWi3mDTmz0xY4K2ah
 uFqC4wA2pnEWn1Ezaejnvvh15Y37jG16Xi2hzMzcxhgVwywmvuAZx/sg2ipLZpVUpZynUJGCjda
 W9e2a3Cm6e1krIw1Lj1wbN4ddj0c4TIQ/OlnQt19SRiTjRuyzK4OoXS5GolMP4BOOmf+5Ge5Jvd
 txywgC/4Pt0yQngo+fB7jRBF/gnk4lg7j9N8hekBdV/S1pT7qgXY/el03xfRSn3iYvbD9e/JFJl
 vQ6EGEkjWWnqXN2XKTZXzqI9mnr7P8KMTMQfyNSj8RD+hP+7qN7vgaqf/9z/eDhPZbcHPfuNvqn
 6Q5PWK4pf7SLiF7oUel2T8+66UBYQdsjG+gKXcJYUXHUc=
X-Google-Smtp-Source: AGHT+IFNR6tE6R/GWJml6w2CGlf9vFLnjpsnaC36TNd6L6rQCcxcMNQuCb0JNltF9FlIZLvEgwV1dw==
X-Received: by 2002:ac2:4f03:0:b0:58b:75:8fc6 with SMTP id
 2adb3069b0e04-5930edffad9mr48042e87.19.1761584357679; 
 Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f83963sm2406089e87.100.2025.10.27.09.59.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-378d61ce75aso45378251fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUlG9uv4mqyN0SaLSLFsGSTIwtkq7E5wQUHmE6rmP8NN1GGHAaX0MGO4Le94vAIPgAXfBIuQWMr7Xo=@lists.freedesktop.org
X-Received: by 2002:a05:651c:19ab:b0:378:e912:74b0 with SMTP id
 38308e7fff4ca-37907ced9d2mr462481fa.23.1761584357146; Mon, 27 Oct 2025
 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-15-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-15-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:59:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
X-Gm-Features: AWmQ_bl-KpqEJmmAdB5ZTKNvkIm9zEnVpIzMtZYC06hw3Dn_VXdqxOKWZ6n-OCc
Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> In the pursuit of making UI/VI layer code independent of DE version,
> change meaning of UI index to index of the plane within mixer. DE33 can
> split amount of VI and UI planes between multiple mixer in whatever way
> it deems acceptable, so simple calculation VI num + UI index won't be
> meaningful anymore.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
