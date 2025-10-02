Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71DBB5766
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 23:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192E410E857;
	Thu,  2 Oct 2025 21:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j53x98ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382F10E857
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 21:25:39 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3383ac4d130so1493247a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759440339; x=1760045139;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/omh4dnkehdvWXPDDTiNzbxTABAKha3OuNX6oJKT2mA=;
 b=j53x98wwj8tVkwEmeD3j6XvqYSWfqBTHJni1E8ND4fFmoHWnnIKYL7CBg2dFBU7UpE
 M7P2V5YPicZhRhnuY1fwgjsVnTXryIeOKXQAFl82yV4oM9zJ/Ag09Wwld5rbrV6lOG85
 uMCdxfYz1tsVarjqTeBDtihmikUoYaZnUNB0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759440339; x=1760045139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/omh4dnkehdvWXPDDTiNzbxTABAKha3OuNX6oJKT2mA=;
 b=meNY64IkX0YZ6GeocizESgEOiaVqRMY8Of3t0QKvgp2lUNjG8OJoWYGjBohQW6LVrf
 OMnK7lHsqrqotOxMd02g+mjHYtdZDCaPgnCMkzXhxM0hEBwyOwkspIvXeA5UeaK6IYCE
 gg4Mx6nw+YkKRWKWDGS0Ec3sAUEjYUpB3UysOUQ9zlgr/ueNKTNlzRa5OU4lSbJz28Is
 zhSQ4whn11fEbT5uPmmVPVw8a+tfa4E7SKZrRfQXPos3xtQtf5d3ZgUFa6cjm9cQj5T+
 wNvicLAgG/ybMi/sBvF06EaqT/16pmh6Sq0XZITUocjeDc3gxZRdfilnA/WdBxLMMrCA
 Mz6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsmbXxbwBMe4WvRaxqhW8OUz2/KWuIQby488hkKtBXqJsp1GnEN1W5mRI54YylQI5dCVeO84sQW4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGsOUvt8I06ddJPVRsVeWJpXiX67adANt8rQpt/evcXo+Kr7Jc
 Lfmi3vGxrMmRBRBhzb7q7fEWW7jRNGWWzV2V/mo1CUdofeV5T9rYKtyYp59oGrhCUpxi6AMUTnb
 RaD0=
X-Gm-Gg: ASbGnct3eNRBG8lpMK8d7awujArbQznN3q/O5KzvpZ6F/DevqOrfqIdPehdB2dFKAW9
 wkqsO4PgcvhvuIOjr079l5rfOMOnJiMer6SWNjzwTX45z/GjblNR2QTAfZVzyaQ/lrbWf2CAh3I
 5rs3SZuaIxBgb3FWLKODktadGMoNoX3PHNh0RcvM79GNGxs7MKmLF6ZjMGfhQWmtS8D23WutYcq
 SdyJH/BD0ctKIDhn2A0y8uJzSZbX3rN7qTRVAd+5avI7FTrUqLt3THCv8WV3r4J4pr5YWtsMajz
 kJGz0EY5fZmU9OaHARdYXpzmQtf3ae6HxcT6A+PvfIJjzn02poxqaMW1XNXPblJsMZVwt88LJuz
 4H8lZgfTyPXmaPQqNmNr7Rl4/hyNDsWsDt9c/+HnTLpFbmTndklDEpy0VgyWFWsxxRoF1jJfH4M
 PgSwXPcGLGhv3PTjCBiMwSIVZ4
X-Google-Smtp-Source: AGHT+IHPhJruK9zcLK/DBARQECp6w4oLqzK6zGzCCZSyE06mHZ0qkPQPJhXoeTBG5qzinhy7tYol1A==
X-Received: by 2002:a17:90b:1809:b0:330:ba05:a799 with SMTP id
 98e67ed59e1d1-339c276ebd1mr996194a91.16.1759440339540; 
 Thu, 02 Oct 2025 14:25:39 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com.
 [209.85.210.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a19fe4sm5429a91.8.2025.10.02.14.25.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 14:25:39 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso1525807b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSte0ofc/caVG2lWI14NKdX0Y3bCXxJPNfOBgU17t55HmR7ngx6E7tXVr2jST1q8doGn+DJYEKK9Y=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4a8f:b0:330:852e:2bcc with SMTP id
 98e67ed59e1d1-339c27b94e9mr883144a91.21.1759440338414; Thu, 02 Oct 2025
 14:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-9-clamor95@gmail.com>
 <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 14:25:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOEDgUHG138d-_HyRX1EmeuZ=8v+2UL4cXQ0GN0e1FqQ@mail.gmail.com>
X-Gm-Features: AS18NWBl_-6A1NX6XipYEQi78zuUuxrbDfjw2_uXBU-dcpIdXNfIO_PqcqCT8kc
Message-ID: <CAD=FV=VOEDgUHG138d-_HyRX1EmeuZ=8v+2UL4cXQ0GN0e1FqQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
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

On Mon, Sep 29, 2025 at 8:15=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga =
11
> > with Tegra 3 SoC.
> >
> > The raw edid of the panel is:
> >
> > 00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
> > 00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
> > 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
> > 46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> > 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> > 00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed just this patch to drm-misc-next to get it out of the way,
since there are no dependencies.

[8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
      commit: 5b50bb435629ab206cfa1cca3d71847d4523f88b
