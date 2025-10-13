Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A7BD3254
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 15:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505A710E103;
	Mon, 13 Oct 2025 13:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MQGCz8Bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17D10E103
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:12:33 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so36274421fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760361152; x=1760965952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
 b=MQGCz8Bqqokn5VAQ43artIGNGgp8blsg/9eVZG83qlqED0hu+cvtB5Pm5xJt46+Tcn
 qGUc5VrmJUWszfDeL2EtIl3Ndg5EkKAnxyLN8gaFnWvM3O/tmlCpEUS4sko5tLYErA3x
 nHvjDVRpyjpO1K5l2q+tBPa5B4yvaYz8D+tKiG+XgchjHVxKTVSZptjgaIiWt2nb09gn
 Im3ehsW2a4hn7D/uiGkzDXrny8awMjWGKA1gg16ID8Rhjz7snXyXhn1DrUq3wkxTk3N5
 EHjd7QyVaibGOvSg4ANaexoSQgGoAkpoyLnGWwOcZ0HbDkBVsUCQebRMT4vgb56iCPvA
 oLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760361152; x=1760965952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
 b=Y4/18LAlB2YvjGPyltLwAuGuqLLEi5uod00M0wESpYzQmXMQ966LB91XxLpev61p9g
 nzaHHUBhelS861Tm5S2jirrC3NiFNYCirlJzZXOJYkM/omN+nySHFxk0tkAdNn1Uz0WV
 z/2/UcxLOZATiSXjtyOJMAmaekVCjH7sV05vlG9LJMPYINk2Ggyzb7RBhYOWmG3BcOnB
 rjD6f4PD+G/dQPX8E9gFnLtuG70sVdViSMxn0GA/NdvbEf2iYz7JrIw6YTRHsJX/Fzj4
 BmKP3NY9vDcbCqcCfdqP+KwEQPge6CO+tJtE7NcKqDPH73/+TgG7RM7exeRjlcglhIl3
 v6+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR34j08ZfGR/zNktsi4Gf4wt0f8arMcl4Lb+ak6G3zyuFVdiLbRBsiwZVRifyChllb5Vfkkp7r+UA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXk79tpAa0YDNC/hG0yKKcg//2R5fMSbhL7uPCHQk4SJb9qvsB
 JHQrC3Aw+wHMCmytIb2lOAy/TBD5Nu42rpm6k738/3TFlfTcJYVieBLl17OLsQDQB7jguflN8a4
 jk5lUharBKUZ6XGSzdCRa4PEUV5NhY3ZIKcmOQV4kFQ==
X-Gm-Gg: ASbGncsntpZRzDBfoTAMT+zcW2xEh54V7HQKDNOXI5tpVjOKlLG6IvvJXpGGr/jOtWH
 67XvJjzNZG28WIC5z8u4BZILRDBzTp3frhuZlb8Eq2Lnb8nwteQKSAQfRoQb/x6tk8Dm1yrNm23
 KxGYhr05ZHpP4Rws5x0e/EU5aOftFxtq2Y72OT4/kFRhrYebf+W2aB+ktABxS7QnQKmPosqzE47
 qkhsH99nfzq4MgqqQ4e4U4Ydj0rDPciSlZ4O+B0
X-Google-Smtp-Source: AGHT+IFy7QQZzDisxgLU7RQiHqmGLbp9GU/ko5TeFOP01cdLTHtzWG4syZZ8PgjrdKymxne7+Wg23WBWjWeGpiwOdDo=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19705401fa.5.1760361151675; Mon, 13 Oct 2025
 06:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:12:20 +0200
X-Gm-Features: AS18NWB0Tr61DfHtPSZqpJT6vjMUO75ud5f5_b3M4zNOdVsqYQjTLusmQxbBsw4
Message-ID: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch looks like it can be applied independently from the rest,
can I get a review from Thierry or someone else at nVidia so I
can just apply it?

Yours,
Linus Walleij
