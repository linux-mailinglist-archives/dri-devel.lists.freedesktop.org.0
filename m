Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE83825AF3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 20:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857B10E699;
	Fri,  5 Jan 2024 19:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC5110E699
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 19:09:57 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5f68af028afso3445087b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704481796; x=1705086596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrAeK3fI5+fkw/MfPT0L/lkhR0LlF0AAtGrWaqYVcY8=;
 b=JxLzoMNO1nMk9pZ+GvBLxziWNKvKkMlfH+1biHgnh6wURV9wnVHjLmDg8BnpG4FYxU
 dZ9VDtAfmr9O0GejN0lCTKstJ+9eAYxCXf4qzC7oILrCOCqI97MtmvUfms1Uvizf+kKn
 ILhX+lztv8ZuGfyMt54Ah0FvdR7wVJ3tErKzbyWTm7VK4eKM+xrhMIP/D5uvfsdI8CTo
 8viyn1ciZzVxvwe8q8L2oxXSFXmYeE/CpxH7v+sJbf2ex3+Eolp75tFyykFn/AT+gp1G
 UW38cRFNjptFUUdfu+rSukjHPf6tAj65tdOCZwc4w/oaIGvFLcRbHJutYGjUTDJN/FOJ
 B0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704481796; x=1705086596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrAeK3fI5+fkw/MfPT0L/lkhR0LlF0AAtGrWaqYVcY8=;
 b=aEj+k3K4GkSiULonRGrcONfljyjxOCrUr+Zb0q4TD1Oq+p1jLCZecpqcm63m04AOLO
 QwHtCZS2/BCof7h7SJ+XPlwaJNBmHo5V7PmMiBhZJkzT9xpAkqQJ/rPR18Z6CjiV+O7B
 n8Ng8eZdr+IWvvW9I0TK1aER1t9FzfvhixgyxqksTFD07+ZXUHoaoFm8h9Wgl+RiV1dH
 khNaFfatklX3YKsHCzT4HDP+ap2idtLmGMVhYqsqsfnN7N4RIvmoDCmu+45EnxMlx2Q8
 h6cGZlN7uKgobSpRZlcEXWbNdSa5hWLfgdFzy6UCf9mbrfq4HNuYlSu7bXQSzLgVFQWY
 XlVA==
X-Gm-Message-State: AOJu0YwRSTfisJzii3srx5FOM2oar9t/YElKqMEtTMy29ULksrYvOTa9
 SRQoWR/0UfXEqXs2fKbHf8JJ87wGKeDnNQYQLEoJprJO/OLphw==
X-Google-Smtp-Source: AGHT+IEOxPfPUR7AAT8oWCL2I4+vSTsXN91XU9CFGSMnOrEEBSllv/Qs7i4m/mjmgo1ty9KHe7vUeDd7Bmv2OIYctTQ=
X-Received: by 2002:a0d:c404:0:b0:5d7:1940:8df8 with SMTP id
 g4-20020a0dc404000000b005d719408df8mr2539262ywd.95.1704481796596; Fri, 05 Jan
 2024 11:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-9-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240104084206.721824-9-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jan 2024 20:09:45 +0100
Message-ID: <CACRpkda+=Zq+v-505O3pHazKzukSifBnNx_CPKbKd2JH-KYpYg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/panel: nt35510: support FRIDA
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
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 4, 2024 at 9:42=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The initialization commands are taken from the STMicroelectronics driver
> found at [1].
> To ensure backward compatibility, flags have been added to enable gamma
> correction setting and display control. In other cases, registers have
> been set to their default values according to the specifications found
> in the datasheet.
>
> [1] https://github.com/STMicroelectronics/STM32CubeF7/blob/master/Drivers=
/BSP/Components/nt35510/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> (no changes since v2)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
(also tested to not regress my hardware)

Yours,
Linus Walleij
