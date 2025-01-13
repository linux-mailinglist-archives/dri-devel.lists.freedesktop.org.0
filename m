Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FAA0BDA4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522D110E719;
	Mon, 13 Jan 2025 16:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k2d37j41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0810E719
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:35:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401ab97206so4454497e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736786098; x=1737390898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dj8i/OG0NvdbTYZbJVR8dmElnqnmapAiXGw7vzP3o90=;
 b=k2d37j41nZkqsn3EpZKqy976jyurOb6XsShVVh+pEISHRxwbs6n5104DqsBil+zzAG
 YpFsUKdqQKGsMM5vZAzHTAaLFzEVuPyK9EVbfsqd2A7qUdxsHqWRiq4mIwvHKaSfZZKa
 cClNZXvEkuIvoXsmT3xR6NakgL4YPsjja9QVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736786098; x=1737390898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dj8i/OG0NvdbTYZbJVR8dmElnqnmapAiXGw7vzP3o90=;
 b=jxgDDBohkqOmvHysRn8nNyeykNokgO2y7Ya6+fddTaMrK/mwluePD5S286fLEuA7Ws
 9uYstCcbKa0/w8asV+jC5V3oR7V78xHA7bmUS7TNND2Rd9iJbppaIg902DZmYgwx7I2q
 EaeeuIZ5y1+7HkYdoNEkZViZM64yutsVRNRZZQHVMXXZigYNttq81kWMHGAfClOmcIly
 xSmLwUyplyBcW70jD//j8d9G4HZ6Z5P7+8leq/0MkzyOyQp2iNGhvpq5twUR2S0iYbku
 ehXqQ2pz1PkyJbNGtu7BbG8vRH1eOP0ATPL+62O8XRhxh5aXB+3mMB6V+TEojPzw9/iX
 EfVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy3PipDyXjD7JZWbP2okL4n3yp+F/76BW0PXIMcHog/AgnPkBZmX+rSTnEvfpxoXGnU3K091kQXek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXSQR6JYFEgKjmzFlVNQCmP1YCPYAdO3H/CqW/JXf5rI4B5RwI
 t7SZuunKAoyb8YI4YbhjJUDRiueiR7F/bR1fB2Yc9H1B0UO3VtG+STKM9/IdBereD9P0hxzusfT
 UsQ==
X-Gm-Gg: ASbGnctes1DRkdYjYutloxWWdoSH5kxDUPSS2Cffolk769jWRz0fGuqtsg/sQrahS5n
 prVG/J4+Ld/2Z9WgH0Rwet779YolwnZIxBO2csC+wg01uMjR0l+7pFBeBxFckU3mgSnP/dHgQyM
 7Q1DTZOgWhnXwVeRRtMhzeHOPVd+r6HxfV0PU8TmxZqfAV0kYWONGbVB2xqi8sb46Vl74DXIuhi
 K2Lbw8yzGTnRukc0/aWjqeMaJQo8tq5TXyxx5K6+NW53Cgm6JrHsK7JR1llH/7sFDSwZWoCOv+n
 rkEitELPmry1rsVw4XUOHYuH
X-Google-Smtp-Source: AGHT+IGlE8Lxmw7xUPg93liLyCLDlAVHS9rhb1yF0/AqmolqFnf7LZzfkCaHRppapRnAnnqLZ/sDmw==
X-Received: by 2002:a05:6512:3b9e:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-542845bc78dmr6600724e87.50.1736786098049; 
 Mon, 13 Jan 2025 08:34:58 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec2c8dsm1375818e87.219.2025.01.13.08.34.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 08:34:57 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-304d9a1f198so37366431fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnqQAoI91JGx5KmNEJRMxRmjXPtL3D3RTHr4bvR5EMlCFkcUeWZlLLc411g550dQHrjPSXQwwfNes=@lists.freedesktop.org
X-Received: by 2002:a05:651c:198b:b0:304:68e5:eabd with SMTP id
 38308e7fff4ca-305f455ec3emr65161451fa.3.1736786096050; Mon, 13 Jan 2025
 08:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20250107092510.174089-1-tejasvipin76@gmail.com>
In-Reply-To: <20250107092510.174089-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 08:34:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W9Xn416m7yMbpConM6tc7RfFQF2azKuCRBB=qSQutqYQ@mail.gmail.com>
X-Gm-Features: AbW1kvYvr-WO-0nGzc95FzC8CM2fkUGIer7prmvOq9-wCvML_zl3wRlS2WFoUSA
Message-ID: <CAD=FV=W9Xn416m7yMbpConM6tc7RfFQF2azKuCRBB=qSQutqYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
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

On Tue, Jan 7, 2025 at 1:26=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the xinpeng-xpp055c272 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Changed print statement to conditionally run
>     - Removed unnecessary error message
>     - Reverted 2 mipi_dsi_msleep to msleep
>
> Link to v1: https://lore.kernel.org/all/20241223052049.419831-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 178 ++++++++----------
>  1 file changed, 80 insertions(+), 98 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped functio=
ns
      commit: 8025f23728e9bc817495d48a04954cdee27462bd
