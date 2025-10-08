Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6116BC6A97
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 23:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5910E8DC;
	Wed,  8 Oct 2025 21:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YSAjxKTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9FB10E8DC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 21:17:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so52884066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759958234; x=1760563034;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cAv3aIfZwqmRDaIqSQ8Kf1PKLE+RCGlZcqma3KwimQ=;
 b=YSAjxKTZ/hj3gdKIlKud2PgI6+xQ/Iq62lDDhN+DXR7IEqyfV0cM1Y/zwaVRoSJT9q
 q4EhHPLg8IIeRX2QkhIxg1OvX+AF5szSgS44X64nVt00YIK8UNtukGwTcAgtR0AIdmm2
 ZBOeazooopYZ+xTCSlFEujQT6rRwOhyNQHAXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759958234; x=1760563034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cAv3aIfZwqmRDaIqSQ8Kf1PKLE+RCGlZcqma3KwimQ=;
 b=i3Ugj35YscJZ7JmA4pcjdKY7EeKgykZW8/CxxoAV9RKX07iNKdp6uFuFFjhSWlyhPZ
 q3GmmDczYVcU2bHsPIlxSB0Z3DOTRXADfDf68K1uI8hJgfFKJ490xh+gcqeQbSUmzNuo
 44xtM/dUNZaVyA4wiDGNUO3jMybn2xxuT+4UCpT6qsNvjAQ32pKR25175YC9cH3tKqih
 wWQjTmHd85H2cxG5ZLtZgx+hxkoqbfmhMeUgoq5ZLH6ZxLj/iq+zQuzg1+WsZoamXAwx
 qWhhkc3f+wUD+lXOW81UqlAeW7Wg77uhyQxgKAfDYfKH8KZYPMigmRSEKa/UwYxNemY2
 0Lzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ZqMMqlP8D0dyWKKCsNAwDV3MlFAMscxkvt1NC+1Qj8p+1G0+j8u8IvF60iZzcaR6QtzYB8butI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKuca7fe50giQLU6UDd8RUQNuKhPwdiEP1BLd9Q1UjzdGHitif
 Jms4T9HMQDsqpQPW64dTi/fcU41lEw3IKc04G9CH6aeGfEOeO5C6onaCPJrAzvJJvcD3Cyk9tGo
 O9P9eJQ==
X-Gm-Gg: ASbGncuUEog9YMqjpaNtNqcSk/GQJq82eTN5vx9z+zI3xdiTgcu4ido+VfjlX37nW4Z
 vuYxuAWPLwicoZ/jfNeeWU/GrrjfZiAClvNtGhnWN8Trcds28DvHqL1rjyyoXX42n/CxScyYa54
 Ihgeg93uLWF/8QgXDPtpsmBwoktzMaaQjn0104DoKGOJKYAe1piiXL3tkaBuHk/P2aLaV8aDOW/
 gljSzEwImFGkUU2j3b7j/jd97Flo6gwz2NfikSZNTxKeAiByz+IeQECJDpXtBy93fCWDWWrNeg7
 V0Zfi8wfDCL4R+Ajt+e9Cx4VY2yKhciNe35l/BnMVArTuJXsbl5Z3A467Kt6gmTvQSUKrmV251R
 dAzUwGx4d6Y2Fk9WCMc5WKIZjcYxpj6IsixojrRoRX6PQCvNNajpoZuaIbDx18Zq4oOjiJREnMC
 Qc4gDQ7DGLog==
X-Google-Smtp-Source: AGHT+IEYkr9xQyRov8IiLZ+wcnFIB239aeyePnSVzPJmoEqvUB6iejTtDdGMiJlONkJtoXX4zguLkw==
X-Received: by 2002:a17:907:3e94:b0:b4f:4c70:f61a with SMTP id
 a640c23a62f3a-b50abfd59a0mr625034166b.40.1759958234216; 
 Wed, 08 Oct 2025 14:17:14 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865e7e8b7sm1737510166b.40.2025.10.08.14.17.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 14:17:14 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-628f29d68ecso527034a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 14:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgtIF1FqbbFiz1WfR2D/McAv8GuqLUIitouVsvMmvPY+6l1sIRR4Z+u6Hli4uK3zYq86ttFDZkhYs=@lists.freedesktop.org
X-Received: by 2002:a17:907:3d91:b0:b42:f7df:a2ec with SMTP id
 a640c23a62f3a-b50aa391ec3mr529354866b.9.1759957905420; Wed, 08 Oct 2025
 14:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-3-clamor95@gmail.com>
In-Reply-To: <20251008082800.67718-3-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Oct 2025 14:11:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=b2ivRzJsJiWMCQLOzEbLQRcFdJvVOGkCPB1n9WFygQ@mail.gmail.com>
X-Gm-Features: AS18NWA_nIjegIylG_UcLKKJDvhd5Cn1SpayqPs3VwGjbaJ5oTj9e8qwAVTiy9c
Message-ID: <CAD=FV=W=b2ivRzJsJiWMCQLOzEbLQRcFdJvVOGkCPB1n9WFygQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

On Wed, Oct 8, 2025 at 1:28=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
>
> The LD070WX3 is a Color Active Matrix Liquid Crystal Display with an
> integral Light Emitting Diode (LED) backlight system. The matrix employs
> a-Si Thin Film Transistor as the active element. It is a transmissive typ=
e
> display operating in the normally Black mode. This TFT-LCD has 7.0 inches
> diagonally measured active display area with WXGA resolution (800 by 1280
> pixel array).
>
> LG LD070WX3-SL01 MIPI DSI panel was treated as simple DSI panel when it i=
s
> actually not and requires proper setup for correct work. Simple panel wor=
k
> relied on preliminary configuration done by bootloader.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig             |  13 ++
>  drivers/gpu/drm/panel/Makefile            |   1 +
>  drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 184 ++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c      |  31 ----
>  4 files changed, 198 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

Reviewed-by: Douglas Anderson <dianders@chromium.org>
