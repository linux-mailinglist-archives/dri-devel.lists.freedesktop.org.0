Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E69FA2C4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 23:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307710E1C3;
	Sat, 21 Dec 2024 22:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IvXDT75L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813B10E1C3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 22:26:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so3962340e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 14:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734820006; x=1735424806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pa7ME10iRozzhB7orrEjCY7gmNcxY24+wBlh8TM8tG0=;
 b=IvXDT75L+q0K2wrXJp48OqA4/aFXKUg7gOW/iYr8GwUfKuRU9z3Lnwer+Gn/hn6E1r
 hu/vQwmXxwKqwXHJTtjvUSpePzulEyTZTmpIN+UsC2y9ER1phX75R93yURfFdhpb5jaE
 6bpndKVLX8IfzUQMLwgKAWk+/Jyuo/LpzGoJcrYX9AKuBreZGQIBWqVH9ERlPml5rMD6
 GK0+pOFcYszARaBXTQ8BE+QXGybTyPpsopbq6Sr7NCcrQi30RJA7elBkBTWZ2DkXE7ip
 X5uSA3y/msejsMacO/M2BVGNI7D8IoCztrzrZ8ARrwy9V5xJgmQhLsCuK7B+b4bcHN4q
 xrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734820006; x=1735424806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pa7ME10iRozzhB7orrEjCY7gmNcxY24+wBlh8TM8tG0=;
 b=TaxLMH1Oymssa6xaLnvx1aZG4nmIBvBlKD65MOCadyKg4knq7ZaTE9Q2q4W1T4etcu
 P4vUr548JtTSfnIDS+/ouwTF+LkVj32USxGQtfpmYz7sFNuZ7KUSkr/YrFKhRYN6lyia
 J8jZpVNM3XZHjt8juReohZ2WqIwZruxsKZSdYKgFsbzCn5gXu1UrAZqD7Hw2DMox18Lh
 D4XmtilDZGRdH+l5OOagqxrWQHOwzyDjj3hr4ybBsP6wppyozz+n3qRZL7LJHguirnhV
 ZhIhgth7DOt73nZDrrAIJix1f0/FAYnZ7m+dKL8Y8RzYzU363pgib5NN2Du3xC4BmsES
 Ee3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUItuOuF1b43KjR/+31lUrpFebZz9expFqrIwcU3wpxOSq6b9KpJXAl3/F0BhDlPILKWeS5ZbniDXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6Ha2sWXFl7/GvjgvW5LmHn/u0Z/g9LA6liVeW2/ZmTGqHxCAD
 fj8km9Y83gEFLOo0YqSO6HoFzdADU3sZnxn7tzKZgXjP/p3E9Agq7+gjFN8ISALMAAhCQ36owMl
 oUstFJaq69PWj6nxWzeJBWdFrQt8hLUUh2uhlaA==
X-Gm-Gg: ASbGncuD0+tDiRC6/UNFrFzs/IR7lJ9b2XjqToKusEPuv1CJeibOrkh+lSDMxEXYimJ
 6RymKlBBXGd1G9sezfEy3rwW+5vCXfiqhjH/m
X-Google-Smtp-Source: AGHT+IHD4HuOZIfzgCSUtfx0f73DbSQ5FjSq68oDKKUrhxbitFHD/d6irP4myBRYfX6R86tBwk4NHlriCCT8DPAh1uE=
X-Received: by 2002:a05:6512:3d02:b0:53e:350a:7294 with SMTP id
 2adb3069b0e04-54229591104mr3012649e87.37.1734820006089; Sat, 21 Dec 2024
 14:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
 <bmaigvj24rqriugxykrbe47poonji4nw5up5orptx5ajd2mzad@imazjm7fmuj2>
In-Reply-To: <bmaigvj24rqriugxykrbe47poonji4nw5up5orptx5ajd2mzad@imazjm7fmuj2>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 21 Dec 2024 23:26:35 +0100
Message-ID: <CACRpkdaSYQkMD5b5hSnoPY4Wxf=Zmn3iHygtt9YeHFcL3LWaHQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Assume maintainership of PL111
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Dec 20, 2024 at 1:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Could you please convert it to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> Likewise pl111_display_enable() should use the bus flags and input
> formats of the next bridge rather than the ones of the connector.

I can surely look into it.
Is there some example committ of this type of conversion in the
tree?

Yours,
Linus Walleij
