Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FF6B9EE8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 19:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBCF10E882;
	Tue, 14 Mar 2023 18:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584310E882
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 18:45:30 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id e71so8317956ybc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678819529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8OE7w+4I+vParG7ILLLYFEi6tsPBU1Dfdg7jrl2/A0=;
 b=vaay+BVhvth7wEHfAouviS+jgCuQdGu+dNaLoZXJGJqT28dwC1VvV6+/HCSE+rSX3i
 u/Pjj/qHzlMS0HjQacAkG8N0zmlorNIIwcyUBen5LxigO1ezN2GJOkPeMW3LPXGnG6tl
 GfmbAXAoVxSAt5llnFxPz6alyU0Xct24ZsAwKU/RVEYyproTDiWlON+7Ew831dTUe6Ky
 XmYYIZ/DN3icrvxaxWwiympHPo7Dy+3BUO/Eu0cvTkf/s7xwB2nqEtFeUvKhHsdZp+me
 aQoPIufA9aITuIiZ855sWpqYqFz+XvsBmKI4okWJ+Rjw556fEjeanUawunJt7zwrHOlU
 TNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678819529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8OE7w+4I+vParG7ILLLYFEi6tsPBU1Dfdg7jrl2/A0=;
 b=UOCQG3QwCoWUY/8HB1me+Y288ijKiaK7zjiEoGgY4lJFLod0amk/1fx8PAD/g5pj7E
 gkjl5SDjTl3Eymg0gHMOr+QgJvKgW7m7jdnJHKdgz7KIensjw8ohFjQkLEVKKbxr4sQu
 VWbBYJ0er7ccJdqEHLlKVFCMfvQBdG32ZVjWMX7WfdVfHnWqMe5pZf6P9+nLHyF9RF8T
 lbaPeyVZaHqON33+bBSDP2OIWX7Jd8lZ3QGxrUcJQ4D8+qCLh0KFJhXZWD9X8Wz22/Bw
 5Zhldsg2pGJQrp/2/EjSz10R4UvpGELR/BuVAsr3bVRKTFIqbZafWHv/L6e60jc/Tu7s
 Rtkw==
X-Gm-Message-State: AO0yUKWrozd6yc1LqsfhyLY2DjaZ2ZuX+Rg58hBPwrKuUSkBLdtJXx11
 bcLvzDFbKwApslaVKiYidw+PLP2gOCrgZD/taGXOMw==
X-Google-Smtp-Source: AK7set+UhF+wVRcTtm+dgNrnZSOkyWuMoQIxlxPqjjlJxOyU4N+ppq/c4ZzWCkjIkwj/xBqFI90UC2De42EYSu+KXbU=
X-Received: by 2002:a5b:209:0:b0:aa9:bd2e:3746 with SMTP id
 z9-20020a5b0209000000b00aa9bd2e3746mr16977021ybl.4.1678819529283; Tue, 14 Mar
 2023 11:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
 <20230217-topic-lenovo-panel-v2-1-2e2c64729330@linaro.org>
 <CACRpkda7=Y4ZRBDOhxE974qV-yXuFyZZs7m_aBwtF9qivV5WQg@mail.gmail.com>
 <aa963fa9-e2d6-a7e1-8396-745de5f996d4@linaro.org>
In-Reply-To: <aa963fa9-e2d6-a7e1-8396-745de5f996d4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Mar 2023 19:45:17 +0100
Message-ID: <CACRpkdZdeJNDPNvQhUMzwid67jcVNKv7TuNzvm3hQxsnfFst9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: Add Lenovo NT36523W
 BOE panel
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jianhua Lu <lujianhua000@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 12:02=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> > It would not be helpful for driver writers to have two different bindin=
gs
> > for similar hardware hand having to write code to handle different
> > properties depending on which binding is used, so please unify into
> > one binding by cooperating with Jianhua.
> I'll look into Jianhua's patchset and try to work atop that!

Jianhua's driver is merged to drm-misc-next so you can make
your addendum now!
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dc61093b56a2ff15e449e=
8af56e96dc5a312baf25
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D0993234a00451e0a5c3e=
47d8b0f2e01dac6cedbf

Yours,
Linus Walleij
