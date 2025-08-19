Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBEBB2C37E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBB610E0EB;
	Tue, 19 Aug 2025 12:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AuN/ol8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575D10E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:28:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-55ce522c7a3so4341734e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755606516; x=1756211316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
 b=AuN/ol8nRGeYtCfPJLOgky5BCZrA6Pnm89B6bStXOJqUwkbvQtwtd1vHfbfnN3Wj9C
 pzEDfyz+vlkNdPs6/nYgY5yI7MSK1DvjZWDr0L/fDRA3cMv1GlNLhZczrCjsUQna3yd7
 LEOPZBihA+IgoKzh36Emz2GFIosHuAhFM/BwkRECAVEw9V5pr/aJOz/gDiSgtcOt3mIy
 ondpKZBmB/g57vk1l9Mv4Np1ad0vzpJDHfgMEKLQiasLx7+Wl0A+PCsywmUrsq32Il2M
 4zDnU78h/Lr925a1gY0ik5IJCCdMfoHp1hjGyv+Bnuvt1v55SkXLLZfwRw0+QeluUnzr
 mGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755606516; x=1756211316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
 b=ZrkQU8Z3FEH+yySsqNBtUN2sBZQxsPYcUxX0G3FlwhjB5Cbgchb0LOxRKmibmSuqUV
 YAO+OacAik6RMBYAL902JJf3RNoQwUFPfxEcT5ey1HlWZtlqVi+GvoiT5NiqOB/OI0hT
 LQxJn1XiGAEL+H8NFBfTQJh/OmEodMEPRE2osDtGjbp0SUPbHnaK6Bz1nL9ixz2MC8Hm
 4IJLWtrpG5eeQVh4yygSohS0Yl+9rrvg4GsOaUM3dqwwM8A2t+EmEE0XDUFt38sR8Ii8
 ilQKKWsHmEdtdQJLWA2p9troPaO4+5HB+kIF1LDd71H2RI+WG1NbRX/WJUJVE2jm41gu
 NuQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFfbvry5KNiWJolDhRQMPgktQR61vUV49HG7v7w5YVUBX+IEZfv3JO49RpcxRkvdfj17efGmRgJMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2vpOW5/opNfwCFDl9BWkoCtBNRk6e5YtObiD/t++3Abd5zsFu
 GYLlRqc9LoE/HrZpoPNrCfj6i+tNvjtYP4K7oCWIcx1CoKzQNFqydfZKl0315Iw9TPDTTE9LgE2
 PnQoy0e7GC/bfWHfXFAxoeh20E1gaVcM=
X-Gm-Gg: ASbGncs0culU9Qx0FQJRV82adkfP/fncaCnD1E3CHUT0LEk4pjOJJ/PO50B/x8uvNPe
 iGPe6lI4ZrBHRvkygT3NIvHkL84F0r3K01ujowWO7mPJBtdHO2brv/ADUlTCCqFqoYneRp5Qjvc
 1xca5bQwAAxi/fqTvCAdxJhdTekQPtwmqQIHdRK+dWpc9ncap3I/gVgYLKdWOOccLPVVdRX1RIp
 N5mFEulPxu8WsQuaz68yW7a6MNHsjNLqhpo8Ro=
X-Google-Smtp-Source: AGHT+IF3FdZF8lxL8RpNSUh6zxATY4SIt92cNJtcaia124EXxHOqkJg6/HCXrud0DRgssmpwJMmfWsjfkko12V6DytQ=
X-Received: by 2002:a05:6512:1349:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55e008538e5mr661274e87.42.1755606516081; Tue, 19 Aug 2025
 05:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Aug 2025 09:28:24 -0300
X-Gm-Features: Ac12FXxqW79wXsLJzEF9Uadzf5uAoXqplbY5O5fWW6-5y6AnA9c00um3MEHlLP8
Message-ID: <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Tue, Aug 19, 2025 at 7:59=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.

Typo: integrated
