Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312237E75CF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6A10E23B;
	Fri, 10 Nov 2023 00:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3173110E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:18:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54553e4888bso2158048a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699575476; x=1700180276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86AHDKme0oU/mK4LbTg0+f9o2KRKUMP2vouZ/vFV6kM=;
 b=OKYGLrZR3v6shfKFWBfVpVqEZFUDYlidNTvKSPqw0KU8tGmHkqq82/lBs4W/3FBxDS
 HfB9c2LVWETRugMirxAtVnBwL1jjWF7cxWBa6HeS/1r9jGV/Y7o/dlBTfQ9isXzHgF4g
 IxSjoHQkGl5UQfVa0vtq6iIqnmp5NdDHdoP0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699575476; x=1700180276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86AHDKme0oU/mK4LbTg0+f9o2KRKUMP2vouZ/vFV6kM=;
 b=WEKJZbqDhm4k9s7Cmm+L2+QEydJa1chqGtaDZeOGFcb6vOJHjyEJnh7KNyWBviL8wn
 hw0uAguYr1gdH3FH4nOyrSih1ox2huB70heHSVZW5usOO4vhcmvkRg3NFcRVWP6qW/Yh
 iUQ1bPNFskmMzXI3u72qSxI8OVHP7JoFqC6knKXlZ07U+t98bt8LvP20jeF2NEKP5Pmw
 RuUo3UZqCPFUMCeHJ7dLN7qD4muEEDLy3k7Fhx6h9K/a9nlWofjXMTkHYdD7f9xwA3sq
 +gFEN2oI9OM4HpBTA4XTxVNgwtt0BRja/AgUDWQyFJjjC6YGQFhdChgtVwVLPmvyPRpT
 WsNQ==
X-Gm-Message-State: AOJu0YyBmSNJjpCAuKN6oLF3nTcEe61E1iEkKrwLuCqVJbVbEhBnr7SY
 ArVKVwVZvYQlotA6jBv+CPuGGVJ3IfQaLQBavcpeNw==
X-Google-Smtp-Source: AGHT+IFMc62S+E25z6fA6ANqwr0Ddl9KMK2EKC62c0DiRUyn2ET35S3IFhZMDPpPciQbpj4rjazUuA==
X-Received: by 2002:a17:907:7207:b0:9ae:6da8:1819 with SMTP id
 dr7-20020a170907720700b009ae6da81819mr6162977ejc.48.1699575476002; 
 Thu, 09 Nov 2023 16:17:56 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 q11-20020a17090622cb00b0098e78ff1a87sm3185471eja.120.2023.11.09.16.17.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:17:55 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so115335e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:17:54 -0800 (PST)
X-Received: by 2002:a05:600c:2195:b0:404:74f8:f47c with SMTP id
 e21-20020a05600c219500b0040474f8f47cmr277112wme.5.1699575474598; Thu, 09 Nov
 2023 16:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-2-hsinyi@chromium.org>
In-Reply-To: <20231107204611.3082200-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Nov 2023 16:17:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UDWNhuBPBUWJNa9E7njYwxJ=zsGqMb=u5CkDGs5UkHzw@mail.gmail.com>
Message-ID: <CAD=FV=UDWNhuBPBUWJNa9E7njYwxJ=zsGqMb=u5CkDGs5UkHzw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01
 name and timing
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 7, 2023 at 12:46=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
> auo_b116xak01: T3=3D200, T12=3D500, T7_max =3D 50 according to decoding e=
did
> and datasheet.
>
> Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v5->v6: split to 2 patches.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Even though this is a fix, it's not super urgent since it'll cause
conflicts with other changes, so pushed to drm-misc-next rather than
drm-misc-fixes.

fc6e76792965 drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timin=
g
