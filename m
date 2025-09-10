Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BFB51DE1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9209810E96A;
	Wed, 10 Sep 2025 16:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMf48KF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F08D10E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:36:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-336c79c89daso63880811fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757522206; x=1758127006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
 b=PMf48KF2RFVAyLpohFzBSBG3gYCN51MLC4eLM9WR4I4EdjWS0JLmvqeCkbpcNJ1Zas
 yLDNYRLWtP1WfzSGAljljdqt7jLxQGqa9VrBf/xCQey0nrp7Em0z4sEF0wYZxtBraobl
 chl4k5d90MDU17sTcC9HS+UR44xG70qrYA6OtcYOueOF3Z+Qw8zclaC3tmQrIIbOyVV2
 lfSG+uhA0Xw72xmKS0X/SQLmGSapHXMkjlbVORj8uPQI0mEGbIMCLT8HrepE0MvAQ2DH
 RTpwUghBrG4jNxGFziGI40KQDJ2mr2Ab10j+suz5dV1cUlkfDOSHeRvm9jyUVKGrdC5B
 YMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757522206; x=1758127006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
 b=qYXOmmIQPfUisQmVzsydP611yOmZM58nRRKcE9HsEsB9piHET3eWmKaPKXERkgYt2J
 lfL1WPCEvxjGmYDXI/f6rzR8JAeBf2mN/V7oIxPZNunMXbQUDxZYxznpYrLMjrAtjnwN
 vWF+pcXuL5BtvFbWiDeQxONJnmHeHQWvIWfQZv2u1r0FA2ZjUWSbH2NNcVg2M39+0KuR
 dUStLnqJVXg8Nec9BPCgq6xygMe057QHrFmmKDP13xZNKipKsvP1xBvvGz2/FyM94IyT
 SO3QLk+GWPN8jujKFbL16sqYSzqewGApRrWcCfeaPyau+/wnh8TJtdqwAtYoyASrpJmx
 dsAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx2ojYjNy2BWETS8RXTGpsuC47knHdmHXnbag1ZlYcuVmvjOVC7exHRQAMNzhtgsZ6bsoSnWl8cWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvjPsjn82drTH5DnkbXAf/hbVBCHCVBB0kCe2uvjBYNYmMndIq
 ZWO2VvM37QN/9uSCpSnS55X2g0F29wtPyMTIitVx6+8o3zfcd1vSa3nnJoxgy7js6nQh1v5wZtE
 faS8G8boi4ioO4ch7zEFJ7aAD1P8ydSE=
X-Gm-Gg: ASbGncuDMuzLYWpFcG7qAyU2joDNBSnymdLf4ki7iSsX0raYAY2PAYGSjh2KSSSP9zW
 uFirRzbiguoQa6nRfm1f8esagT3mXTwBMjOllGr+PciGo4xaSOtIu55wbx4CfbIKxTP1RN5tYq+
 tza3OF8Ge1VcNNE1KGK5RGzgyh5PEAYDGSxjFm4VqU9yQzkzELJotzD3kUrKESfLVA6JqTvgFdG
 FFCl1e17wtyHKcO4UaF5PMpp6p4JVvGkAL5iWo=
X-Google-Smtp-Source: AGHT+IFjFrlIdQsJBkbl5UrFknUtSHC2zpRAlUQjHTiQtPng500/xUyi1rm6QWi644I+fPHp7fWPkvMNF1fxWMqbWDI=
X-Received: by 2002:a05:651c:1549:b0:338:bb4:6d6f with SMTP id
 38308e7fff4ca-33b616395b3mr51779561fa.44.1757522205739; Wed, 10 Sep 2025
 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250910020525.342590-1-festevam@gmail.com>
 <20250910020525.342590-2-festevam@gmail.com>
 <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
In-Reply-To: <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Sep 2025 13:36:32 -0300
X-Gm-Features: Ac12FXwaCBXY8HP2XPn41wXZeHzdr74VgHu-UVfAGT6QVSQ5gGrKs0lhgzUSNzo
Message-ID: <CAOMZO5BGFAfJYFZGCStYhGoFM9-P9=LfFKSNqoTAmMQoox2nEw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
To: Frank Li <Frank.li@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
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

On Wed, Sep 10, 2025 at 12:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> > compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif=
";
>
> Anyway, you change dts. If you change dts as
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
>
> needn't update binding here.

This was discussed in previous iterations.

The change you propose may cause regressions for other device tree
consumers, such as bootloaders, where the match may occur only aganst
"fsl,imx28-lcdif".

That's why "fsl,imx28-lcdif" fallback needs to stay.
