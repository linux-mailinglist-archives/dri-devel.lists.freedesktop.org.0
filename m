Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78795A2F1EE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130810E593;
	Mon, 10 Feb 2025 15:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iHOMEWdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977A10E593
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:40:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450b91dbc8so1138795e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739202030; x=1739806830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/SdZj5cHoqqEQ76M9Tucg5S48D9qoX/egkWuOcaBkIc=;
 b=iHOMEWdEXln7Mw6Q3Rm7HN91ADTjuYqI3OABWnRuAR77LFzYdZ9pLcF+0TOuFVc9fk
 b12ydSKKuiyi3/nA9YSaviHKK4u2YBZGQg8Zz3MAfHgReY5MDEb7tbe60KeSFtuBujwU
 f8577847+GbHl36tsbHBNvcP2gnAVW+Hh1NL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739202030; x=1739806830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/SdZj5cHoqqEQ76M9Tucg5S48D9qoX/egkWuOcaBkIc=;
 b=Ome7t1rQI8HwcyZvmuEccFkbuhtZdiX5/HbNX7BFKcOc0uCBr8bVx7miMrYk0dK7Cd
 dxyyCJkibJJusccYAy/MStgxzfAET9Q/5wP2V1tDjSKo+D3k29L+2g+wAHBO6BI5S3kV
 L3sLFCwSnuIvd/d+Li2LQiF3UaK/USChGYpqzropMHhldLIdJybabMjNAEMso0O68fTi
 CL4mlf0oNCrs0mh1e6bCUFX4avNMOtArbszEXp69HvNtXgRjIj15EzwVgIRqnb+1WKY4
 VTNmMET+mQVAgHBkOuxkv/KlGTdf4yEEmUbcwSNsgRGRLv3eYqiEoQeWS96MXxR/n15n
 m9TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmeIpklv+A1rT4ivVhQZnnrmYuQNqzy/nEbg3Q8bIzFiMA/iNsX2H/tQ4DsGuBDpOfbu6Ewdt4cy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFkf4tlisGy84PeXj+ni2Vy/d32jo6gAFCC7flrAOaz4R28xUY
 dE5rN4zhMVfeikT7zJ+f8Q8XPirvD8w+Yj9RRs1JUMS+FLTwe3Wbo1pIqUjCi1yVunGG7nFNXwh
 mqw==
X-Gm-Gg: ASbGncuuvFAJvsyUOQrntaVJUFyPbK70WeOGzG71X9qRX4r7Gcd8OAcFYMY4Kl3HptL
 7dncHSeAPGi9W7u6RFkc4wokhXB5t7b4EuxLp0+huknIWH0DGqUi7x3dzqSQopQATY+PGa9Qqx3
 3f1blEBS+vTGGN8Tkadjvshg4DbOcTQzglNtjYxGE/7oGGDPxHx6ZWRw8vtA9xQF/WgBPRhY21H
 j8hp7HtfAj7ugQha5AN2JWXPp3tBVs/4wkwRi25e+obNeWzt9GGCrY1S9RCZ5QvhiDemjCGZnQr
 1GpEmllp/neOEQ+6sFn2/IEG58ZCtzcL+io6UxrNKsBx0T1mVgcDeTiAPaw=
X-Google-Smtp-Source: AGHT+IFIU0rWnoV8i7KgqVCB0ndndtUhnteAbNWzP3KqbTRMy/JSzqGnJBaEaE3GMCM1oWtA8qUbIg==
X-Received: by 2002:a05:6512:2824:b0:53e:3a79:1ad2 with SMTP id
 2adb3069b0e04-54414ae0e10mr3658884e87.40.1739202030193; 
 Mon, 10 Feb 2025 07:40:30 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545071f051csm629183e87.240.2025.02.10.07.40.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 07:40:25 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-308e9ff235bso12751431fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUY5sP3CTSlLu/55Xmr5wYG11Lj4H4J3+lA5Gh7JINmiL3/VpkxnjzB28sx42mucKonRwNuj1QbnXY=@lists.freedesktop.org
X-Received: by 2002:a05:651c:893:b0:307:2aea:5594 with SMTP id
 38308e7fff4ca-307e57f2535mr53531281fa.18.1739202024114; Mon, 10 Feb 2025
 07:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
In-Reply-To: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UyLEEnVRJNB-vAV_KpiZvBgmxiAkusXVooMUgzt570Yw@mail.gmail.com>
X-Gm-Features: AWEUYZn9yU9AYjv0ZV9n8hb_YE2USzRC2N16Y3pIGHR5EU-Jjsdk8V-yKWEWNyw
Message-ID: <CAD=FV=UyLEEnVRJNB-vAV_KpiZvBgmxiAkusXVooMUgzt570Yw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/panel: panel-himax-hx83102: support for
 kingdisplay-kd110n11-51ie MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Sat, Feb 8, 2025 at 12:25=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > The kingdisplay-kd110n11-51ie is a 10.95" TFT panel. The MIPI controlle=
r
> > on this panel is the same as the other panels here, so add this panel
> > to this driver.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 115 ++++++++++++++++++++
> >  1 file changed, 115 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/3] drm/panel: panel-himax-hx83102: support for
kingdisplay-kd110n11-51ie MIPI-DSI panel
      commit: 15d174fa85d936f3d0250b111e7d3b7f26a38b40
