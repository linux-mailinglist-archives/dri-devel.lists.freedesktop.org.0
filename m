Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22EB2F72B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415310E946;
	Thu, 21 Aug 2025 11:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x5cuzAvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4940410E946
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:53:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-333e7517adcso18494851fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755777236; x=1756382036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
 b=x5cuzAvSaJZIc12FzYzFp6KP1wzm9WA+jqETwnEfBbXAAcmR/fx6j+s6nToDDxc7/Y
 RJyuO1kF7n+wavCfI5z1NwqbVu6xaafyz/V1v3DatTSdff/sJrRJSTQdLKn2fMgE6HPb
 kTwFxjvr9i9WECNIfP0bLQnF2QyDbRqRMIp2bhHLETU53mSfb1h9bTjvNVlwolXbldXc
 W/niSZ2b+LfmObMzCIx52Iexn+dBuRzwgLu4TlSJRbzg0aLMFx4gWMjWreonBZcimK37
 Gme+q0fJoH0EzEFeSiBAr/h+AJsdUP5HftVmqZD/X0iJt3naKgr688eHJuMJwlSXUhH4
 rhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755777236; x=1756382036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
 b=H7I8H2q6LXtXpumghuBSPMH5rKVQ0VZKVmL/9T+PJEeqbJmeb100vSYZxmvM+HBr3r
 DB2oWgB7yUTC+k2vAHqt95KCJMZwAAbJZ5vOOCRFz7HIon/ta/KgybW1/3HPkHdlHJMd
 uYukcg2BjyupPh3wp7pjlGS7W56DhfbFGs3l9bhwWdPMVfzsUbk49NBIOx73R+1Q/sos
 SyEZ13figtJhhRHgePywlGABmz99t4zxdqdW/tK025y1e9QvrYYopyoV6OT6dwr2577p
 30QSQJPksqmLcM93KSgefeY1raAS/y5dimbC1LP3t/Gxmtx57m51UevS6WlbYR1Gk75z
 +xBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3ur/R7lYKxi1eJHQ+HVWxx52fCwj7AuXoIbwSU7ofxWMAvf3H1mzf3p6ZV4D7wFwRGiMO2ECaSOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJLOP1lJUQIC7KLSIoj/C9agXB79Fb6ppRtFzqjSvTtWPhU90q
 x+ZEfk+prfjdpGerpxNPuKwRBDcVIZk4onrToHgnUMcwCy2w/aRvNmhqsSHk5xP91taADqAlh4Z
 KYwVAlEyn67QUZhVKEPU7CnHE47eyP0/W4JFcx0wwRQ==
X-Gm-Gg: ASbGncsusz2D1pyLvPD70MMYKQMSGeQW8Tq65+zEXW7+EUMl3y/CM7MplDvtbGH9Ekb
 Ij5FAWHD+gq1AP/4nkK0SwWFSYOfo7p7MeJpXxSz3vYtjGLogOPKSfpSHqKLyFS+75ng+6Qhevd
 AVvyLnDAZuEtq7AObbtUNfrEiZHbXIqAvhoIttQV0KM9qOhLl6MWzB2mZq+l9R2hIKsuNomnoez
 L0X5tw=
X-Google-Smtp-Source: AGHT+IFoewdvNuLwpOMDi7tPmb9FEQKLI5JEdERuyolhueuXHZ2+5KnKdkT/j3cc2QMbmt8jG7ipw7ObSBOoHSZHVLc=
X-Received: by 2002:a2e:a013:0:b0:332:2d5c:e171 with SMTP id
 38308e7fff4ca-3354a275fd8mr4061531fa.11.1755777236482; Thu, 21 Aug 2025
 04:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-10-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:53:45 +0200
X-Gm-Features: Ac12FXy1SuiUzS280qDRSJHcA_2jVr4y-FjGItB1ru8eWVK-JVnc9Ql5XGWxM9c
Message-ID: <CACRpkdbVqNpz2HiAz+_vFUkDy1TE6ZDxp6X2g9rRWAt4s=jRgw@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
 krzk+dt@kernel.org, kuba@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
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

On Wed, Aug 20, 2025 at 7:16=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
