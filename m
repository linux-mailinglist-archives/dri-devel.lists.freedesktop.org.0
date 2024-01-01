Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B9821541
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 21:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D46610E0F0;
	Mon,  1 Jan 2024 20:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9CA10E0F0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 20:47:42 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-781716c1291so358705485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 12:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704142061; x=1704746861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMNhsLNc6JH9BXxdcz3QKLU0dw4+NL8hfWK4BqvCMdk=;
 b=RjcmQCHXYNjgiD5CiJ+OX8uK4WyIBR3ncIeWQgPjLzPuUXo9ujE+PPEADNK3bMQqdL
 eKNAZDqk0KTcAIpUWRzX+zvtTXZflE55qjZxYVNAackjjlD9WOCRNuSona7Qm0Z0NoKK
 yGG611KybWkawh3qxY8hMMjjV9+m4oUYm5vUmKSJgnzc7zJVV6AWIxfgoM66U1FIQIb4
 72Qc6331vMxRAZgfRERj0XAQdzrH8avXFTuBUn5Aop/g/1OYLNoKK3TSXgaQ6ArXnUwN
 geGXBBreoGMMuHwbkPjbK362LL8Esdm4d00s+GSQIWOqU6Ux7Vl+55qM5MGcgch7CYTN
 qTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704142061; x=1704746861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMNhsLNc6JH9BXxdcz3QKLU0dw4+NL8hfWK4BqvCMdk=;
 b=ejlL9za2x883rfYlbNqui0DKtijNVyh00+LKsqRuecA4zNC30vm26AV0iC8/y7vfkU
 3HIX8C9WTqlcWb9XbWqCscwCJLdTtQXqIAwiixIKryzfR9cd+mqTbU/gdjTaXZnjyIAz
 UYXU1pRvt8+USl3dK8RmBPCF1oFFXqKmoXhFytP5ENZ2e4P8dDIADnMPm0XENvYgN0z5
 x4pj6RIFLUANqbWUGySXvT2q1sBQc8Ko1yux5H/OtsktlFRSA0sMI8qsnmecTD3i1m73
 qd6TBgTjB1+us6QutfMuj5MLDBEzj1WHvctyf78iBe6HYzuoX5FrMD5W0AWWVpV+kptv
 D3RA==
X-Gm-Message-State: AOJu0Yxf3VIraDtry1n8XVYc73KZJKAKTMY9f7ZKlazhLmgBPQ6MDwcm
 c+3UEeLV/hSSF3LlEo5dPyneuxj23zCdHhw3H6GVyZO50VXlmA==
X-Google-Smtp-Source: AGHT+IGMZWwx9wRdBBgtWnhlfZlEube5GQnbCSOBm+J8RbjRpT4yUEx7cGRRlsuthan29DxTW0sY1BWDFrfyh1/zX7Y=
X-Received: by 2002:a05:620a:55b4:b0:781:d96d:e132 with SMTP id
 vr20-20020a05620a55b400b00781d96de132mr426264qkn.157.1704142061002; Mon, 01
 Jan 2024 12:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
 <20240101161601.2232247-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240101161601.2232247-6-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Jan 2024 21:47:30 +0100
Message-ID: <CACRpkdZrbfVLNMxf9jXMJNEEtk242FW6msUHBBh+X99dNKS4Tg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 1, 2024 at 5:16=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
> Novatek NT35510-based panel family.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
