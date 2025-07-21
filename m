Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E76B0C7A7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6E10E56C;
	Mon, 21 Jul 2025 15:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U2xHGXKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2B910E56C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:30:54 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-701046cfeefso70955586d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753111853; x=1753716653;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prtXQzGwpDYewy3C/PL7YFCwjtX4giGSBgIkaPID8u8=;
 b=U2xHGXKTukaW79Wx6E/yrCsKzTXDwBpxmJWBW7QjgdxGTqAxr8BNi2eIVJZ2/gKEKK
 X55xA+dZuOGm1yGprg+Eu2Xof1dNwsY0R2gZfTtZNVn3fRTizCYW8lJEU/DfWDc7gp5g
 J9zoU4sjo6oMNmbarkZdkexZB2odogcuTFmNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753111853; x=1753716653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prtXQzGwpDYewy3C/PL7YFCwjtX4giGSBgIkaPID8u8=;
 b=uUbhbTnPsPn/ZeQQgdxmuVM0GQRkuPv/gdPeAMnugwO1Pf+KE3bGiQ7fQ9dg+N2C0r
 KG7LuX3MHpx3Ewj5pFQYqV0vqfKVV2YVU6eGrzOLyRJgN+c+9LtZPyKiGIrVvXOUnjg0
 3YI4xnALQmOo/Je78Kh8DcnNzssxZhpoLYJuYsyiXiY+ISNq/sRrBRVK+dM0mhJ1QPsB
 WwN8okPuDr4IglSpw2Hyn3JkwSMc44m4wxIwg8vjWKFIODDO2UaJ2NeZdLpTo2yC3AvI
 aHfdwjtM5S+aL+vEZ8voipCFNjV0JIkOl2WSn9lJp0JLIfqZPqGcLm8uuQk1ftTb/4c/
 mOZg==
X-Gm-Message-State: AOJu0Yxz4nt3BExojK2l/9KcIXWrHJ+R1SgQpqhHEaZJ2APr3S76r8Sa
 KIiD5wjEQH8/M8BqsS8cRhzJHPvFoeXMoVM9V60ytrSTUbSs6ZpqpZ05Ukh6T6UF8oIR/8umbTk
 eM4E=
X-Gm-Gg: ASbGncuosEbTtfi3bXt3a9zcAP8X/EylSnAU4tVYta+2RLRtWMaGR0IG98V9xy7u8lu
 CKXfKPRxF8ryvPCyoRIdLKd6HuVL6ucWuzX129pwteiwLFMlODYxxfzsAh1KXvxbeALwhXOGgzG
 12SkvIs1WBXKG2Aak0XnIAn8WxzJfHa0qRotZD3MwATxM030NVCmjoiCAAdKYEesKTQvOtTG764
 BPjJSWYW4ZL0ZqPv+pIGtyUrT/vDHJQm5fdIRDiDBw/HuFetAY7Ap77h3wzN4k/O2Pd3wqtFeI7
 /C8aWkphrHHX+VEsSuZWDUr4RFbXbJOW2TV/DdTQmV7x71sQ1Oiv8W51/EeqZm1IGAGMfK1L+MF
 KKtgR/oCKGSld5MXqC2TocMH8sEl7noOfwtJB63bv21gmBpIABCcM4PJaTRzSqyZzgA==
X-Google-Smtp-Source: AGHT+IFh//VqDqZwmR9AJfcuQOkYXBj4PHzq6PS+4mnBPHZv8ho0QGUJVcf3s2CSgwOXWgS4j4lYpQ==
X-Received: by 2002:a05:6214:27c9:b0:700:bc3e:4499 with SMTP id
 6a1803df08f44-70519fca225mr217241956d6.10.1753111847282; 
 Mon, 21 Jul 2025 08:30:47 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7051b8df533sm40453736d6.26.2025.07.21.08.30.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 08:30:45 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e33d36491dso640146985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:30:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4d:b0:311:c1ec:7cfd with SMTP id
 98e67ed59e1d1-31cc25e7a85mr18598752a91.26.1753111452054; Mon, 21 Jul 2025
 08:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250714130631.1.I1cfae3222e344a3b3c770d079ee6b6f7f3b5d636@changeid>
In-Reply-To: <20250714130631.1.I1cfae3222e344a3b3c770d079ee6b6f7f3b5d636@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 08:23:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XPdKK=AWBag=q8PitEfgkopOdACnaMaNhDeS7N54Vn9w@mail.gmail.com>
X-Gm-Features: Ac12FXx1Rt4jqey2hZlgCizXtfQmsGzgS11Zc1tzIdan8gitLdT714tk0LDKMMk
Message-ID: <CAD=FV=XPdKK=AWBag=q8PitEfgkopOdACnaMaNhDeS7N54Vn9w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Remove extra semicolon in
 ti_sn_bridge_probe()
To: dri-devel@lists.freedesktop.org, Jayesh Choudhary <j-choudhary@ti.com>
Cc: kernel test robot <lkp@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
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

On Mon, Jul 14, 2025 at 1:07=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> As report by the kernel test robot, a recent patch introduced an
> unnecessary semicolon. Remove it.
>
> Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort c=
onnector type")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506301704.0SBj6ply-lkp@i=
ntel.com/
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can't land this without some sort of Reviewed-by tag. Anyone care to
do the honors? Jayesh, maybe?

-Doug
