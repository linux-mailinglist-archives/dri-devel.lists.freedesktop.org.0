Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDED83EEC1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 17:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8010F293;
	Sat, 27 Jan 2024 16:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F6D10F293
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 16:41:59 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5ff7ec8772dso18320307b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 08:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706373658; x=1706978458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PT1Exo5HZPUej7pl3Sf7KYOhUnetXTHlbzzBJvg05vo=;
 b=m4arqCraLbp9HAAkNgJUr/Gx4nb0q2QMuTTFMznHm5oav4SqOx9DMEgxUjVUVguVMx
 FF04uAAU1VplKvYoRKXfFQvjKihMiUq6gTx4wGVfvXClnz8hxfHIbhAmKKa7NRkNPU/m
 s3zzkecDL3smc4duYBBCYnNPAs3EcnpHhvzcrDNCYgx3kdG3E8o/178+Yov3q17VMJpt
 F1trwqmTx5N9hPyBvw5bNC2Rs46/AiW5zqKyaXvnj2GR2fKCDOW+VsuB/fGdbv01nQUU
 oKAi1WFT7mzSTTybywuXuOhchmG05s2UTlVSoHjCzT5RVhn/pSyXB17xc6NfyjWVlPba
 mF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706373658; x=1706978458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PT1Exo5HZPUej7pl3Sf7KYOhUnetXTHlbzzBJvg05vo=;
 b=KavNl7Mh0sp10K/z+mFrLOcSGErS0P792se3zCklUTY90JSMOhmeeoqMwnrwJWM1gN
 +Ot3sHNfNZFuTeCjFyLeURKk7HLYWHJ2tFqayAPG5C5b5WXT4lJP5BNWkOOZ18gwNcsh
 9zL+LHTHcHB2M2hdB1W0wtidsrv26LD0cHRqJt7JNFB5xkZZaG/U4ZWX2y25kvM1LyQs
 aQ9yE7P9zTPyruEWC+3Hhj8vM82jEhTsMsQzS6De+6ZvtEaP5xMVtuvRL4d4pOSKLztF
 +bx657TOjq8fl1LbBdRnsl6Jjd2yrcE+Z3NP0+ppndeiJN6/gYnRN+MGj6zDixNJ96yk
 w+Cg==
X-Gm-Message-State: AOJu0YwXpzoEYKpDhP8M/jkTFCr0Aq60rlW8V6Rp7fDe2qdjMzsKhOLM
 L0F4SiUncXyDDfrUSd2qx+yGBBujzpUi+xH+gGMWrmk20F1QqMGoQYm21wkZgskbS5JD3q/1yvu
 y0LyO2OHkYB83ihc5wNV9FKce3Q6vpCPJpT03RA==
X-Google-Smtp-Source: AGHT+IGxWylb3x6PvuiGls+63CDlOR2to8X1Yhb884+I2Osgi3EG4M3tSnJurIDqx6qxvZppFEGLmso+Wb2uaWlxFsw=
X-Received: by 2002:a81:a00e:0:b0:602:d04c:4402 with SMTP id
 x14-20020a81a00e000000b00602d04c4402mr1878416ywg.81.1706373658282; Sat, 27
 Jan 2024 08:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20240127152821.65744-1-dario.binacchi@amarulasolutions.com>
 <170637290174.2797231.1548285445759438647.robh@kernel.org>
In-Reply-To: <170637290174.2797231.1548285445759438647.robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 17:40:47 +0100
Message-ID: <CACRpkdZRvGv4gKxuYpt+fczWCegsQWjP3yfrW=RgOLBFJxtjqw@mail.gmail.com>
Subject: Re: [drm-drm-misc:drm-misc-next] dt-bindings: nt35510: document
 'port' property
To: Rob Herring <robh@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 27, 2024 at 5:28=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/d=
isplay/panel/novatek,nt35510.example.dtb: panel@0: compatible:0: 'hydis,hva=
40wv1' was expected
>         from schema $id: http://devicetree.org/schemas/display/panel/nova=
tek,nt35510.yaml#

This is because the checker is applying the patch on something that is not
drm-misc-next.

I think the patch is fine.

Yours,
Linus Walleij
