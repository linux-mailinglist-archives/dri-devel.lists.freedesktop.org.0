Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FE94990B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114710E3FF;
	Tue,  6 Aug 2024 20:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="cEPZnw9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBDD10E3FB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:28:21 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fd69e44596so1769735ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722976101; x=1723580901;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NewxizV/QrE0bDS6mTJcWWeH0ghijd0o6ZQvUX6X8Co=;
 b=cEPZnw9zfQZoxEmny6C3VAoAPxZHeWaedNo6OE2QnIiadvZz6fCeVaQqNe3JQj1tFK
 xd7XPULSjQL184V8SKCceE44LM4nRgQS1cF4QL/WCxVO6c0vY8xxJNsLHv70qeS4xzqH
 7RRG4VoWvqi6FtlrPUwXx9+56k7jXhsd2RVMo6Ha9uXfX6YB6nTisTVq6A76S9rrACrR
 vOQTIp0NEsZc2q1N1SDeYl+laMslx2REaalJvtiJ6WHIZyjXPkEc5Sl7cOiiQQ/Cwe9h
 /YrqyFr21rnPa/aELxKC8ysqJjn3NeIOWDoGisQ2aQEt5PRG1oB6A7JoMVkkpgYaqHjr
 0tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722976101; x=1723580901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NewxizV/QrE0bDS6mTJcWWeH0ghijd0o6ZQvUX6X8Co=;
 b=agUgRvkybUNaq2s98+fOGEv95qcsSpsfWth6ABchOoAkTLmTOvxmvbpJ0FhPlJfIQH
 JqtlypJs7VsPWTy+aBaAEQdJAsu3WdsAvYEPOoCQcnBJS+MikzUonq/RN3FD2zrB5JGd
 SL+mgRAZW8o51ZuC8rNQdvUpanhb/QTSE/rdWfdjUBISgXtEKlLT19TFlgj2a+lumt/1
 1Q1StfEO5ZqmABijH/lWsgkQva6pbu+CzZrcQGiat7f0w6Do4+v5kDfPV4117aAsTqWT
 eTDSHUunw8CbrjQqenzL74PRe9O0Tj4e8ERqoM1EYorF/Xs/6VwtWhRm6XWtA4hzAN97
 u5iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ2SCp3Xd8zkelaf707mqbwH4uszikNh97Azimjb8ec/uGfFrVVtwv6oSPyRAyA7PWKshBxkMewRjZGKpqrC21jmn2BvfuQM1Fl3Jzp9dV
X-Gm-Message-State: AOJu0YzxpAfGgKZKTxYq8NvVrjADiyth8DjKvy+2Io+JSkmpFFmILeNE
 nVANQ5tkv2urQa7bBImvnlN/tR4P+WjCX393oyytsMb5JBOrP4G69huDMrUWKgx6Go+YVcdFYxd
 8TshmNUH0HgseaNaAMS8M8eugkEw=
X-Google-Smtp-Source: AGHT+IHJzplOe6T346XHNyXlXK1O9+ysbtzTM327nVE1L0ilozkYUPHpw1p+kyXVwiPZ5odozVxc038s2IOyIQTUyCU=
X-Received: by 2002:a17:903:1206:b0:1fc:253b:5951 with SMTP id
 d9443c01a7336-200853a50c0mr27695ad.4.1722976101123; Tue, 06 Aug 2024 13:28:21
 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-4-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:28:10 +0200
Message-ID: <CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The Amlogic HDMI phy driver is not doing anything with the clocks
> besides enabling on probe. CCF provides generic helpers to do that.
>
> Use the generic clock helpers rather than using a custom one to get and
> enable clocks.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

note to self: even if we need to manage one of the clocks specifically
we can do it with clk_bulk_data
