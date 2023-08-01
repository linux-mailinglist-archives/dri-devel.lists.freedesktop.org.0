Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B430076B789
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AF210E3FE;
	Tue,  1 Aug 2023 14:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDAE10E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 14:33:42 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so8764350a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690900419; x=1691505219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+KC9X0SP7TlgnnEh6U7lIN9BNbXdA3jvj5APPvcXzI=;
 b=Q5HJhJeNyaFSjBG7MHhwbqiYjIAtoacD48lUpWvfvjjiRCKD9Bt1F3Agcx1PgyJDr1
 xzWwqbRn1bO3LrgrYeNfUx5vp2SEZCyTteYunKs4G64C/GrYubcaF3AR1YhDK17PNekP
 WyaJ6Og5hXTril/c1JH176dzB/RiLBtAJXiO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690900419; x=1691505219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+KC9X0SP7TlgnnEh6U7lIN9BNbXdA3jvj5APPvcXzI=;
 b=PqKlH1nrJqMqsZwSa1R/7891f2kjOgABXojNt0UzKhuVU8Ce+eE4QEi3LZxSDMTnP+
 d4UMlIWXfTNx4V6Qo2ftAT5g74YZEoGfKY4/mW8h+jWuXHF3g20Zoxp3Kwo30GQZ2G3e
 POCBgVYPpGPz+ZVwua26f0PGD7jk8ftASNo7bB+WfOXgviCAx4+GyY9G89k69IeA1+K1
 R54LdM7ozYwtHiIXyGSKjz2xnocAshdR2uv7j1r+RUSaQqn/AIu/kmbBvZRxWqYhdEAn
 wUiFf2ge0ZMwhMCLgjRv3Z2fuchsuYZiSi3CkAGzC+ZBpmDip5bQLisEoRv2ai02smHT
 vv3Q==
X-Gm-Message-State: ABy/qLY0sSscnC8On2iO68mF9QrFSHZZv4ypdPvY+qMg1xh7CNmWh4KF
 BKIHtiONM9KyY6YvD7UJ0VYDytCeGxjblhNayGFTMA==
X-Google-Smtp-Source: APBJJlGk11SFRj87du7S/OExM5+ouSYWOTyQBh86DZ2kacG0VU/NQB1x+qWtm/RUf9Lh2RM4XwyvCA==
X-Received: by 2002:a17:906:30d9:b0:982:ab8d:1e08 with SMTP id
 b25-20020a17090630d900b00982ab8d1e08mr2557350ejb.59.1690900419317; 
 Tue, 01 Aug 2023 07:33:39 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 y10-20020a17090668ca00b0099bd1ce18fesm7832363ejr.10.2023.08.01.07.33.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 07:33:39 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so14240a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 07:33:38 -0700 (PDT)
X-Received: by 2002:a50:c31c:0:b0:522:3ead:377 with SMTP id
 a28-20020a50c31c000000b005223ead0377mr141564edb.7.1690900418334; Tue, 01 Aug
 2023 07:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230801-aspire1-cmn-panel-v1-1-c3d88e389805@trvn.ru>
In-Reply-To: <20230801-aspire1-cmn-panel-v1-1-c3d88e389805@trvn.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Aug 2023 07:33:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UwpjXVhP3k14ye93r_9jc3L9y--qYn7hf7HWB-4Hu12Q@mail.gmail.com>
Message-ID: <CAD=FV=UwpjXVhP3k14ye93r_9jc3L9y--qYn7hf7HWB-4Hu12Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add enable timings for N140HCA-EAC panel
To: Nikita Travkin <nikita@trvn.ru>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 1, 2023 at 12:24=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wro=
te:
>
> Add timings for InnoLux N140HCA-EAC. This panel is found on some laptops
> such as Acer Aspire 1.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Timings taken per datasheet:
> http://www.58display.com/ggs/20180713155310173_N140HCA-EAC_Rev.C1_Ver3.0_=
20170121_201710238414.pdf
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

As per usual with simple additions to that table, there's no reason to
wait before landing, so pushed to drm-misc-next:

8229399486c4 drm/panel-edp: Add enable timings for N140HCA-EAC panel
