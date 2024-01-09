Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D882864F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AC710E411;
	Tue,  9 Jan 2024 12:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170F10E411
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:54:44 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dbdb12203b4so1911194276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704804883; x=1705409683;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uINQIAiQq6opaJwfh+dSsKqfttMGu6VRZEEKvqx2fC4=;
 b=fpc9pZ8jk/osBdWDHn1h8Jsvu9xXJahl1Wt14pL0aQsAL6UIJ7EVjqknEkiaPOKaas
 gmefSXLw57v5kiVsVJyK0glo20rUEJbqSDLLvMzniqShELfSZ+u3tOuoN+zxCP+uVjnQ
 35FjdzZq2Nnc4m4CTW+UqECLfVvXoywvdYEC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704804883; x=1705409683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uINQIAiQq6opaJwfh+dSsKqfttMGu6VRZEEKvqx2fC4=;
 b=GcujppWd5bppBrhz/W9OMQn1lM7UybS2lFpfIM0NN33TFo+4IDG3tf3i1H+v3VfBNQ
 EvWXBkiMR+be1ckEV53dITuiU784fV3nIi4ZnFbdbIsrwbF5/SakRq3ReSJxHuvE3qyB
 Cj2/pUO/D5nFC/4de7FT+W7knxwMndL5Z1h5I+n4PYInyakZyRSEFjnomeJD16sjS/RL
 YVFOBqHbwPNZD2u8W7UIIdGcXNcj2xLKa5+NLhSHS+HbeN+N1WTqLsuMObom1EPWHi3C
 il/Dg2w6WKIN0bUq8hw4JRSa5eZtZCYtoEhXM7IPUr0+m6pm2BD4cOi0fUcI40/+5En8
 4ccw==
X-Gm-Message-State: AOJu0YyhnDPU7TypTxopNfvn1UxAPKTfTTtcUwwrwK6841Rokj78wDoX
 BnrWX7RWEuJrsszWZznDfdmA2yJW7XOOFYvK5SQX6JQlM2e82A==
X-Google-Smtp-Source: AGHT+IFx65iGUYcVspn/xUO0KxzMABmp//fRhiLdAyGbwggiEorVZIYs2zzC9P5dcI/pwcKtYSoedhuuhdimn6SekEM=
X-Received: by 2002:a25:9b41:0:b0:dbe:d45d:1253 with SMTP id
 u1-20020a259b41000000b00dbed45d1253mr2578201ybo.92.1704804882276; Tue, 09 Jan
 2024 04:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
 <20240108201618.2798649-6-dario.binacchi@amarulasolutions.com>
 <CACRpkdb73Qrs6MuiC427f=RnyD=rydH_4xVhBx-2bS8bX0mJCw@mail.gmail.com>
In-Reply-To: <CACRpkdb73Qrs6MuiC427f=RnyD=rydH_4xVhBx-2bS8bX0mJCw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 9 Jan 2024 13:54:31 +0100
Message-ID: <CABGWkvq0kbjDZTZj-PN+Sj3jo7SAx0G5PcTeA9KDfceh4D8_yw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Tue, Jan 9, 2024 at 1:51=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> Hi Dario,
>
> do you want me to apply patches 5,7,8 to the dri-misc
> tree?
>
> Yours,
> Linus Walleij

Yes, I would appreciate that very much.

Thanks and Regards,
Dario Binacchi

--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
