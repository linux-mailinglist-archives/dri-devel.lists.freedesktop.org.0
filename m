Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046C90A8A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E932510E226;
	Mon, 17 Jun 2024 08:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WAON9Pa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08F10E226
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:40:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cc14815c3so10676e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718613630; x=1719218430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5VHLKuA91ZpUWQy97LJXKuQHjNSzTP1qecAbqNklDs=;
 b=WAON9Pa66jbIU2DXMW5rwEZKT0np8YyMcNVyaQBCSm94kT/0FjJ2NX54fUMRifiRIT
 3PDWyH+3vnsVaWUdU254aZOr35vCoM908tI5RDjbUPC1zF+u71TzIHxECUbAQ0xN5VOo
 aFQKmbzEonitlzes/WWq0IZlQCCprj8Ymwv8E5hPYWClBg/EreVrJkmXGs/L5iaBEv7Q
 L/NOw8ijHxbNSJVx+a9eHsxcLfTT/IluHxvq3EigHP30cJPz4J4kv1D5co4lUqUI2uHU
 3xFJ8MyEHvi2IywcLHsaJFba9bJWdEgCQlpO5DKS/maj145h27EcsMhItgxL1UeKBMc2
 hi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718613630; x=1719218430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5VHLKuA91ZpUWQy97LJXKuQHjNSzTP1qecAbqNklDs=;
 b=r18owLla1pnBa/qDf47yUziaSNbjEmettk9w8ByJBSyOZ1vCSfXBWvit0cUUqGrldE
 O4u8g+WuYDTMSu6oSfUHiiXBpk1oXsJX6MNxIYBoo90289dpXjtlGfBivuT0Rd/Nsr2u
 TCJtCsz5vBtoNQi+AfThp/TfSmrvDPXrKvmgqpb7vaIqETVdLjQrQHwYrXyvs+8myEs9
 9fCfmugThKdiNiF0mDRahQVRF8BB9dkyloVuqZIvrv9op2IYoTfRHuFtqOcnsTZmL6eP
 sPMiacqnSihsw9fLSsNTBjuSH3tVeE7/uPUsmpZJhh8SMF3Pwc+GHJPvIuEj6CwIMNsi
 fBhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwTwPypEAIVvqlkQiOFIL2qTvYYdwzGUkeE+gggEEUcpsHLxb2BVSqkTu1C1LZ31z3mg+6Qu+jb6b1m/F8Dz0HYMT9Kbd8LfQ6nQlfGRpd
X-Gm-Message-State: AOJu0YykW/esFRqevv1jZK4AQbn7bNOnIK0P3CwH/jVxcpmIdIoknVag
 SYXsbBwG9fg0D8lGdzYwL92ONaxM2fsLgIG+qnREF2/GRULV0bgYkZf8hP8QKLE8XrlvrP1xy01
 A17e0mrEyoUhuQ+fuRxQQQdERHABLMQCMXsQwAw==
X-Google-Smtp-Source: AGHT+IHENtu6w62klaIyhfrUf1JcZGXfaS8EPrhivXycsqfsmezoTTmR2Ssl5Ad4Ty6uSMvA0yU1itjnM3xuW+u1I6Y=
X-Received: by 2002:ac2:4e04:0:b0:52c:ab2c:19d0 with SMTP id
 2adb3069b0e04-52cab2c243bmr5978403e87.1.1718613629599; Mon, 17 Jun 2024
 01:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240606072814.3572965-1-primoz.fiser@norik.com>
 <20240606072814.3572965-3-primoz.fiser@norik.com>
In-Reply-To: <20240606072814.3572965-3-primoz.fiser@norik.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:40:18 +0200
Message-ID: <CACRpkdaFiGhsytjLKpvGU3T7F+pshYOsB6T5ez7Mk_NtPnNRkg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add PrimeView PM070WL4 support
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
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

On Thu, Jun 6, 2024 at 9:28=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.com=
> wrote:

> Add support for PrimeView PM070WL4 7.0" (800x480) TFT-LCD panel.
> Datasheet can be found at [1].
>
> [1] https://www.beyondinfinite.com/lcd/Library/Pvi/PM070WL4-V1.0.pdf
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
