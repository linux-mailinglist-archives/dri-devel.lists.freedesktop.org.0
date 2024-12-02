Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D89E07F4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 17:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D121C10E0F5;
	Mon,  2 Dec 2024 16:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LR3Ohizc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCBA10E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 16:07:17 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffdbc0c103so60678181fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733155633; x=1733760433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZViN9u7WEeef4ck6iMwRDaJEybzCZmgvmXDAyqUy/E=;
 b=LR3OhizczAqAfgIBN6Y2Jn31ew43wYfFa6Irq3GREM85XTCNMWS/oxIEcNTTAzPJly
 pTpFGKTKXkchNypN6k9S7sRmo8R066CPSOW+xFHap+cLyjFPzCU0kPNFAWhBo49tVGmu
 I3JX+6OJsAn7sgjN0p9ivNZtCiNUHSAWRbMOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733155633; x=1733760433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZViN9u7WEeef4ck6iMwRDaJEybzCZmgvmXDAyqUy/E=;
 b=U/d1zMQksRm0Yu8/wuYgHM42QOqy2/+oATCAjLEKDKhxoDSVzX6KSlRJdNOLFmToQV
 WPXcDUWtYkG6fwVOijOYYkHl4rKwkrgdrqIrPmnpl8CkUHp2XbJj3luOvfY2ymhbqKDW
 jnLW+ZXTeIvvjSQkWBljMFu8RGwzrX9aBZmuYUpS2KqCLOobIF4j4luay6z2w2vCiWFH
 DlqwoPGTIJNC2CXOo1N5c4eXvPDNDdclLH91mi9xUtu22NkDt48n67WaHWAlb7ViJjPT
 LPEd4SPfzs0bpDYerpgBsB2Xcj01EPAsKj2IB0lGcR7iSr/TUGieMCcoWJbnzF7O1mtT
 xRGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF6nu4hmoL57LP2O0021CMxpTHah85DaqnIGqco0LMevdtoubZWf/EaYl3P0UfFvzkgaScGZ9kRDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvZbt/q+0AjwzIP8RpjKDWV2hyK3Av4PiaMJQWq+OqyTBNv+76
 ffHIJSv4Kc+gqLg8YWzD+tzYwr84RQurSC3hIe/3S58GiKK1L3GA/oB95WxKHzgOqzpfvPoQ7WA
 mHw==
X-Gm-Gg: ASbGncsatzOt3ztg6mJJxz2yjplgLMdMKKEobZJk5a41PLHRxwIkRnRQPnKD1mDOseW
 Y/z/SvzsmqYEJJtXrtXe8U0JB5estVYSSuZupBq7JSmTJOy18+3QB7O3WkOmsiOagl9rmYcRkKT
 FIv7b4D5pL725wwjH8F+wk0Br166PSN4XR/s3bZKo7/1wXbpGwUyI8u0fnHApvr6W78YrJWc/IQ
 TrokwayoISAXrPCTzt1hayhYoCznsBDzSxxUxs7z3Rh2cDISFnEqGSj+Rnvwq16IGGh9Z5Q9mvi
 5uQm7fVW+7clBw==
X-Google-Smtp-Source: AGHT+IHOArZvEylp5v1mLriBHHlyfOU/HhdSgbrcnefA1IQ5pFCbKAnisiPIIHgd4o9++FSHAWcvAw==
X-Received: by 2002:a2e:be87:0:b0:2ff:d0aa:11b with SMTP id
 38308e7fff4ca-2ffd60230cbmr166793171fa.16.1733155631772; 
 Mon, 02 Dec 2024 08:07:11 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc09aa5sm13730241fa.64.2024.12.02.08.07.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 08:07:09 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53de92be287so6390091e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 08:07:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLShWG/zCc1vftkxntDe4cZt9tIHpnuEVlBP8Wd1LqXwXBqX8ciJV9m/vfFRmM98E6HEF6snrn5Nw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2396:b0:53d:ed0a:8113 with SMTP id
 2adb3069b0e04-53df00d01b2mr15721785e87.14.1733155628493; Mon, 02 Dec 2024
 08:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
 <20241130-hp-omnibook-x14-v2-3-72227bc6bbf4@oldschoolsolutions.biz>
In-Reply-To: <20241130-hp-omnibook-x14-v2-3-72227bc6bbf4@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Dec 2024 08:06:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJR3O=8xHtdPapwtDS2ShL3SVTyvzNgOTNjp4U7OGO4A@mail.gmail.com>
Message-ID: <CAD=FV=VJR3O=8xHtdPapwtDS2ShL3SVTyvzNgOTNjp4U7OGO4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/panel-edp: Add unknown BOE panel for HP
 Omnibook X14
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, Nov 30, 2024 at 11:09=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Seems to be like NV140DRM-N61 but with touch. Haven't disassembled
> the lid to look.
>
> Due to lack of information, use the delay_200_500_e200 timings like
> many other BOE panels do for now.
>
> The raw EDID of the panel is:
>
> 00 ff ff ff ff ff ff 00 09 e5 93 0c 00 00 00 00
> 25 21 01 04 a5 1e 13 78 03 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 a4 57 c0 dc 80 78 78 50 30 20
> f6 0c 2e bc 10 00 00 1a 6d 3a c0 dc 80 78 78 50
> 30 20 f6 0c 2e bc 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 36 ff 0a 3c 96 0f 09 15 96 00 00 00 01 8b
>
> There are no timings in it, sadly.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

You should drop this patch from your series since I already landed v1:

c1bae6802ee9 drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
