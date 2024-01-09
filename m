Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59B8287FE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 15:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18F310E412;
	Tue,  9 Jan 2024 14:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2190B10E412
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 14:25:13 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso2469248276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704810312; x=1705415112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0jRmYFxyXqqyod1EILUSU0d1jpB9EyuAxZzGSyEy4U=;
 b=mlM0OQ1Eg6qlNNNV6Ew0RI4KVYTDSh0fld3hOUZkdRWk46YIQBnaqytWjVHTop62/j
 52Kq1gNmsfR1GqhoIEuOZ0zR4t9z26Qf1ZaLL2RMr3GpQWOPNQPE0nlyugHCZ4zgJSqR
 xsO1pnAhuAcDSpqOcPEOR/PIon8m0rod8TTaJvjmjl4jPPtjFXcjKDljQmehMnJ2FBgd
 ZbIgDg1evQQEfF87CQBWlfpOykQp0lzyfAIfjlXHY5QVu7ou21OFr/taB+yTusUMf7H3
 YTRWjlhPQ7ICx+E35mQElIk+vAwURPljYCLbEeFCxU0kmIaWTiDbqhcZQGw9qUZvBsbb
 Hw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704810312; x=1705415112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0jRmYFxyXqqyod1EILUSU0d1jpB9EyuAxZzGSyEy4U=;
 b=ovsqfJYrdU0hPVU24aQf7lqtcldwEcVfhH3jmgobUvhMwQEZzalxbqOxY0ApB/a7bT
 +LCtnwY1UATDXJckelireQk3KTLBgYqenIVbDJI3l29itEvCNTRc8P6qIO1mX4xNogWZ
 RMHFSKPITp72yEGLlB/7vVHcBVwwG5ET4x8Zb3eruopQj1/LEjyE4aFLFC3B8tpPXVYh
 3xyy9R5E89HO9kv/nkXnNo5E/vr19aSk/ThBdEtTK3o1OAbQ3kbgi1ZpeJ5fljtp151U
 rAVQ9Vxt6zp9a5YvPrdkXKPCPWTinpG22aolux+0zbxRPAp7Hdzm5cvReJnQkTIzElGZ
 JbQQ==
X-Gm-Message-State: AOJu0YxPU/9r1v1Rx2mBPbTKWUJ0DMzVobRqmtZeQ7xIoF44UgpR8tF3
 2Id+FTRwCJoPTnbpHnclDI3r5XbpKyL3BoP7DorQ0mktu3E1Lw==
X-Google-Smtp-Source: AGHT+IFurq3cBuNOgcehIXjqiUCCcK6/Nxe5gbiowFcxxVVg2NwMw2ej6jKJBwkmx6aYWD46obc91hznYms/cHNMqqM=
X-Received: by 2002:a05:6902:220c:b0:dbd:2ae7:f363 with SMTP id
 dm12-20020a056902220c00b00dbd2ae7f363mr474571ybb.4.1704810312262; Tue, 09 Jan
 2024 06:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
 <20240108201618.2798649-6-dario.binacchi@amarulasolutions.com>
 <CACRpkdb73Qrs6MuiC427f=RnyD=rydH_4xVhBx-2bS8bX0mJCw@mail.gmail.com>
 <CABGWkvq0kbjDZTZj-PN+Sj3jo7SAx0G5PcTeA9KDfceh4D8_yw@mail.gmail.com>
In-Reply-To: <CABGWkvq0kbjDZTZj-PN+Sj3jo7SAx0G5PcTeA9KDfceh4D8_yw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2024 15:25:00 +0100
Message-ID: <CACRpkdY99si4+KZAVdHBTYr-3=jDBsphTgUNi9NMhZekEpXsEA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: nt35510: add compatible for FRIDA
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 9, 2024 at 1:54=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> > do you want me to apply patches 5,7,8 to the dri-misc
(...)
> Yes, I would appreciate that very much.

Pushed to drm-misc-next!

Please submit the DTS files through the ST SoC tree.

Yours,
Linus Walleij
