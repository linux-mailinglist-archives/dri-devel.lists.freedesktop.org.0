Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4132CC0F1DA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B087410E16A;
	Mon, 27 Oct 2025 16:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE010E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:00:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37775ed97daso58739011fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761580821; x=1762185621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6YwhOXZKSbw/QgDI8R5plvx25chz++lg8tg98IFV5D8=;
 b=MEB3tpmhpGrbBiVImjwj3q3tUHrH1Vd4xEdb7uWTfz5EjUvV3UyvJkdNqBDaR6kqK0
 08ZAttyGd3XUCPB66qjBC3styXhKS2MZ20hL2yb8jWUfSmQ0Es0X5hSeKaOmsWn2gb5D
 TKPFHvnVWUGRiv/WKEdwLyLGp9cPkKH2N/PvYaQN+Wewf9SO4Oai7C4fmdsXRYpaIP63
 kCtYUq2eInZQ3XOVB4veSVoVflYOp10dGOnLgrxIm8Ue3hil9mRFXfjtqtWgyK2Hwvve
 ml2gjNtDb4kWMsCUuUzeqq9Cg6cWRV/gu9asnRhcDeBUAI2PjcEQoaxbUp4sLmEFOSRf
 3Yuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw6JEVKbTV9zGBn5LVy4fQX10HdR8V4kP2wkDUxEIuFUeUwrE3j5vABEeRk9U8SZE/PRbX+F45vkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8NPkWXsev1n6mO5Wz/bctOT3ZjB6USbGuFWXbHB0O/V7BG9+U
 x0kCgqjPwOHm5EQPUDQJuFpm+rscuq6tOaBOO3e9+k+uvFkT4H0CeHLBMXz+CSJvG40=
X-Gm-Gg: ASbGncuRReDf/zU46B4eF8MZUmhjBjDXfwzs3gq4YlXp29kCJ8QShH74kvbxjkD3/fl
 cAVpAMhByWcYYwaHiuX7gfdrxSNCi4KY4B5wMI4H1cyf/gEzcZeyx2egaQd3kDK4lcX8wcDRoTP
 jeW1v90LvZx7MuPQdSvtVF8oqOMK3ivdEEC+2Ic2WYDpbRn+A13CSaH/t6+/mPXxIVjJVBaIU2J
 r2PEfOBgxQdK9+MM+qO7MkoOjayGYun52TFWdwX2RNbNwSkjhn1d2DnYsrNOgLmpu5qHZ2Rl7yN
 Yyd6W9dfab7yyBoe/rLwQ+9SeE3KzG163epNP6ThhIu5+yXUXLbPQxVwQH7ZeE2M0paeL68mZad
 +efO2KsEniTUcSubXgCoGcHop+GuCYHoKvPmjxwao9wagXVCYZ4yvyMndlLU+rlIL7iO0xskY/m
 2pZXt5MIZik1O7LVLQxrwwbNfn2FUKkLM9GL8WFomjlxA=
X-Google-Smtp-Source: AGHT+IHKX0n0kdPGw4RSkxnjggk5Lv0pY/mS2LDXg7Ve625rqOstYrWVaA8UoiLd/qh5zECtkWPi/A==
X-Received: by 2002:a2e:a016:0:20b0:378:e3a7:5dfa with SMTP id
 38308e7fff4ca-37906956cfcmr1477401fa.20.1761580820768; 
 Mon, 27 Oct 2025 09:00:20 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0a55a1sm19999651fa.19.2025.10.27.09.00.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-378f010bf18so20738511fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbUx3/vA/+mm1sXrDO61tRqFxORg00bL6KQ5XGACJkH3YDtRit4GZN/AM5fIuWjcj5NEr/1e2FGcU=@lists.freedesktop.org
X-Received: by 2002:a2e:a7ca:0:b0:377:d151:c090 with SMTP id
 38308e7fff4ca-378e3e0adfdmr38098431fa.1.1761580819015; Mon, 27 Oct 2025
 09:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-8-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-8-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:00:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkrUs29MfoNSjd071G9lNzBwjNkUIcpLZfwjGgRDO3VQYGwungCMVXDTOo
Message-ID: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> With upcoming DE33 support, layer management must be decoupled from
> other operations like blender configuration. There are two reasons:
> - DE33 will have separate driver for planes and thus it will be harder
>   to manage different register spaces

So if I understand correctly:

- the "layer" is from DMA up to CSC, which is the last stage before routing
- in DE30 and before, routing was limited to within one mixer
- in DE33 and onward, routing is global

> - Architecturaly it's better to split access by modules. Blender is now
>   exclusively managed by mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
