Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E90FAAFA30
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F136A10E3A6;
	Thu,  8 May 2025 12:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I00wu3tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C495510E3A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:39:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso1234215e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746707960; x=1747312760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxy4oDHF1pn8d+iuTx13+tfCW8RZDyCkPpV0oh3yr24=;
 b=I00wu3tSz74n77cDsQZhmngcFUh9PT2ZDRO0R0znIb7aAgAlg9Xbc1kWHn5+S1i+Ib
 usTZsZROb3+JjaxzHGbHch8Tny6t0nqwdKlLo2uyoNNxhA1V2f9XgZDnrWKuN/LJq0N7
 Uk5ztW+Bif0Dge/+jBYAjP1ugYK44J0Jqbg/RA9GxopTYcpc7K5FQcenshaop3+cw6+d
 hmmxI+MFygpGwp7bh4ytVIOqhEtIcogxKLKhX7hLvZFhgNEzQsYGTwVPzBwaPsij3+lV
 Nzo/AtRkSefC16G65oSNYnxn9WpLfESSg+unbNON9E5BuSwirY7iLh7qiv3DSDiBbKwK
 v4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746707960; x=1747312760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fxy4oDHF1pn8d+iuTx13+tfCW8RZDyCkPpV0oh3yr24=;
 b=dnDwebiXe6pkUDrUkOerqMvwh2+l66mjd4jNEW9PUfsu90+2OR4IBMkWqoWrVJP5m6
 l3DTMF9lVaNanl5JI//2FcD8MVy7MD/fdNFLBoIpl1x135U8nGmSpBasfjjIdxWcF9Ti
 pwzVZ/Ft2PD+j2xpOvrZhy7mSm3pIz7aOhtTnAm1dyLxHgwAU9gGF0mv9S4MV6z9f+0T
 hZsPvpOoHhz2I5kLUB5YAUa+VAJ6jcwivaZivmhkPNJ9zI+wbwGoVLbMxWZ+VUdpFHLX
 3LhgJAoj+QuUZ/2ehrh3YqNbYmk20odZNzBps0C2s4pEr55KPzwWPTd2M79/4cnVPZrr
 SwnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxwtx5hxef/0y87rMCD970YPEl3W6hpk6q+7EMRSINE2/AtKCD8K1wRzyxfmiEC9WUGoRncWy9mcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw27lkHAWBMY2uUFpIPXEmO6i4KUirCNd7TKsuP/FQHuUbUohFl
 Jl7crXNOEZZ0V6YkwSZb2bwEn+lL0ZxM8B66UP/HIjtKjcvuaZ0THIDvt+oOkntUxszam4y2TVR
 nWCI3dfN7K/Qn98I/eKvNlVZhRcYoXOna/AX0ag==
X-Gm-Gg: ASbGncvccAa/7zBZCXJw9rKVniRvvd1pGYxCId8Eo6EgKhlVhqv6OPkJY2MGlzuJ/2g
 9Vk0ez7my6lLHuOAGCuO34bVcCFjTZU7nlRw8AbcjCyuVbNOvC/ZxWPSwlayzsHqPOmY/7cyiCz
 1kaG5p23ZQThsEQ+7Ks+9VVDoOXaUfl9bV
X-Google-Smtp-Source: AGHT+IGGrMdIbK+l8vxSoUfLVyEvO0Z3NdZDVB36nn2Anll0m3eQKniQ9zV0PNvk8wEmAkWUY6p2JaDvTo9TjiBiOgs=
X-Received: by 2002:a05:6512:3da9:b0:549:66c9:d0d9 with SMTP id
 2adb3069b0e04-54fb95b8cf9mr2506333e87.53.1746707959903; Thu, 08 May 2025
 05:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-3-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-3-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:07 +0200
X-Gm-Features: ATxdqUFbxZHQaqT_16mFZM1zpCqWLrcrUnDz75se3Y3SyvtShCLzKride0am1Uc
Message-ID: <CACRpkdaOiFUPf8fTGZk0RR9=oVni0DEaYqdUziZRLUr5mZjtnw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, May 6, 2025 at 11:27=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:

> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Supported compatibles are:
> - hit,tx13d100vm0eaa
> - koe,tx13d100vm0eaa
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
