Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DB68AAA01
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429A310E828;
	Fri, 19 Apr 2024 08:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a6Ee57M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9F10E828
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:22:31 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-de45f3f092bso2183358276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713514950; x=1714119750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+lW8U2rIcGFEawJxZSXhfE6ZoNKFCIGHTbAbeVXNxg=;
 b=a6Ee57M2H7OTY3a6xrM4nmSM/OiwarnM24KTEJwb6TgzZ2dkFhdrELHWwtvMV6xzgK
 6ocZ1Zm+fc5pFDPTZWGGY0o6dsvSBVZoVNmX42PW8LhuhvogNhvUCTg91dojr/QEnj7W
 KLJ4fW868kIC4fIwzz+r71VQPLB5QN38fLeyhvzB74sDwbMDtUL+nFuQJ23HvjTNGZSs
 OTdvW0WUM1947DAKNfvz5tkCz40d1aG8dczgNqdw9HqemvL3/JstYrKeRKLLXFTLXeoa
 Tok8+n+Iv2vUugRSpuRF/5/awqjW9VNjjgbjMkdfAuHaH3bgA7KwOLUBKS7HUEKnvN/X
 xxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713514950; x=1714119750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+lW8U2rIcGFEawJxZSXhfE6ZoNKFCIGHTbAbeVXNxg=;
 b=Z/ToPP2hehx6YVsY2BSnDoWlTCuKrWEtWtpbd4bgFpcBahInYxkgFuUclvvGTW2XNU
 XBdoioljFtXdZwwGAecBwbmRIM3Z9coy1hlqov7makVjmuJqr7yM1KC1fUc+ptI7UVku
 0hgrpfpFtprjiDWi9YrdyxGHIt6hNSxEAYhd5E0Pv1wK0SIN1kVhWJ0Dzb47JoGP4kqH
 uWVL1z65nZMWGUE05LEisAcE4TNLuVEPjaGinWbY/eTpgDkAzwz+Jzjaa42FCYmFnefk
 ro7ZQDSaqYf6Y4+wryIOC9dT7Jvg0wn5sSGcD25c+VqBQrN5TGVK4m3iPV8qnPLoL+7m
 Yn+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtIbNWC7afPVUOEtO3OypTpRVr/C+yDCZ9Nwt3EqBKi0MSUcNTUlUE5gRPfQvb6c+an09MABcKvZcQ7Xm9Pt5sLzkuYyoi9pOiSskVgnh5
X-Gm-Message-State: AOJu0YzUHl7/l0y+b2ajzu2awadBORx8UqAV9y6HfssS019Q8EOcVRW0
 TPq7T6G65qSyvedQB0XlBH1SrVt9AtocBZ+MYh0q+8JuxwbS50XhZBGDsuux4hr+0vh4PaEH6JF
 l2/d9mBFb9/ZKQU80tAnfEd9q5c5sSRFhKsXpLA==
X-Google-Smtp-Source: AGHT+IFPyhBOcKsumPvUAGu+ybltqO/6sX6k0ocwJKMsoJgn5Y5t185Co/wULm06e1qdXJ1gmr8tw6bnd8/ohyJChO0=
X-Received: by 2002:a5b:bcf:0:b0:de0:d32b:52bf with SMTP id
 c15-20020a5b0bcf000000b00de0d32b52bfmr1058038ybr.39.1713514950675; Fri, 19
 Apr 2024 01:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
 <CACRpkdbijfwYFhg2XigzVKoPDjU00K+arqaL_kP3FNxsS82gHg@mail.gmail.com>
 <4xywfprr7qkxpncmnhqjc3lrrcjbv46tsmlzz5yxvcr4xr2dnq@w57ni7u2hpvu>
In-Reply-To: <4xywfprr7qkxpncmnhqjc3lrrcjbv46tsmlzz5yxvcr4xr2dnq@w57ni7u2hpvu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 10:22:19 +0200
Message-ID: <CACRpkdYT9my4KETHybHPQ3ksXhiEgYQLSdP8TsBmwzNd+r-qxA@mail.gmail.com>
Subject: Re: [PATCH] component: Support masters with no subcomponents
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Herman van Hazendonk <github.com@herrie.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org, 
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

On Thu, Apr 18, 2024 at 1:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> I have LVDS working on apq8064, but it requires fixes in the MMCC
> driver, in the MDP4 driver and in DTS. I need to clean up them first
> before even attempting to send them out. Also a PWM/LPG driver would
> help as otherwise the power supply is quick to be overloaded by the
> backlight.

Thanks then I bet the prototype 8060 MMCC driver needs similar fixes
before it will work as well, so we should work to merge this, then look at
8060 support after that.

Yours,
Linus Walleij
