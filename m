Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722BAAFA42
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52B810E8FA;
	Thu,  8 May 2025 12:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XGvraLQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2E110E8FA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:42:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30bf5d7d107so7012271fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746708127; x=1747312927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyI7Fjbv9vasMfECrqQ2zJvUpIbkeXpQeunAnfVQFfU=;
 b=XGvraLQLsGeq6lgK1sWaSN0Ff0Ez5wJ9OBD/+epRhcBIObwn3laOfBnnpekDYr335w
 4AIfxDYSI/cx+mm88XWWbbptHvWabKwBJNd3ftqa5bVSaM8g9U+Adj7XWZ0jPlB37pmU
 yAogdFnCy7qRDqu0RIntnlWoVZTA6HXB9xrbF6f5AnSs/qNtXO1Ws7QymFXcD45Y+3ms
 BrGqx8mXE75XnvKhDx9/da6s5RDDKsolLGsa/ZgM2pzbnwf9pIKxGSOMDuuxWIrE7t/h
 pnMcRj1mbevyCGCSYEgsV+kmUud5uvTXrS1TB33KwWo6g2IMybFJgDbpKBprkw898RBk
 21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746708127; x=1747312927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EyI7Fjbv9vasMfECrqQ2zJvUpIbkeXpQeunAnfVQFfU=;
 b=o57q6fNLhH6suy4mAkBJKGjJMl2+iPsN5ew+Oi/RaF4+5ekpTvnG/RrGDV3vc6CbJb
 ZZWSwDq2z7++EYtxK5bnqT3WvtUkcYnefvnKS93crZxrdyuyFDUqPD4iG8HBLWn4+xLY
 JIh8czDoJ4+/O6zYlLToC5b7on76YXGdCZgRk+HLZ+SZBZx/uEweKESfMcGvrvHDaIeM
 eN3kGYztEtg3XRtafJbfsyM66xpzai50kMq03UU217Ewsk+1f2Kp7p0XhEa5diJJ04aD
 Q38JZCI4jePLxjztqURdQIhUGyn5Ld50kG1N64sp273fFl4VpIws1VhJYuBgORb3/W8c
 Kf1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMZ+zGgWE9w1uXD3nraAWxpGRD2Nh1Q4utMG1ARqcFpn3hwu5wRfwtNzOJnn2QbjM4aGxwGloGCTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/H+7QcSpPoZc0/FWT9MWpgM9vroDE3Tv3anH1BhMRm2dG3s/f
 2zjGWWSEr0Lpkl1lozHN9sTD3Ma6WI/6SUvjBK0+yMIbL61tS5+KT7TaVRwPa6/Nl5bHp5GuXgp
 LrRPigDVEOwanf7Efl+eLSpszOmZt+WM7DNTGZQ==
X-Gm-Gg: ASbGncsODCTGdxjRi6jBWi7aTBfgo/4PFcZstMfMedWTXqT/kCvRyvPAoiU+oHIWtqQ
 vyM5rCahghpqjLeY1mTtnYwOPLs3FB4Xo+maYT1sUK9yTPp8C7TfcKTIIFdDdT7inCXJNMekVAs
 o7w1hhXcii3ir5V+RHZ+iGtg==
X-Google-Smtp-Source: AGHT+IHqekdqaLIzGmIdqheNh4dgp9pFASMhDYidMguSp4rJY0A06hOjVIznt1/54pbPSKaSgiUo7aRxsMOaETIuJk0=
X-Received: by 2002:a2e:be28:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-326b88dc5acmr12392841fa.33.1746708126820; Thu, 08 May 2025
 05:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-1-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-1-e5b5398482cc@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:41:55 +0200
X-Gm-Features: ATxdqUE9wVz2T5hOOhWQL_hbykigK69E5fJNykseRpfwtW-6smHNUPu2Ku2iiPE
Message-ID: <CACRpkdbvsr3kSu3=+NcY5LHNNzwwCW0WdLRt8BydgiNhQ-b7+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37801
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
> Sources, like downstream DTS, schematics and hardware manuals, use two
> model names (NT37801 and NT37810), so choose one and hope it is correct.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
