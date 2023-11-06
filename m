Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B947E2656
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 15:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB2710E32D;
	Mon,  6 Nov 2023 14:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6810E32B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 14:11:41 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a7afd45199so54182267b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699279901; x=1699884701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ODn++dUHbXaMIGDwTBO8HRgNU7TuGpihiT0x1eE0ts=;
 b=Kfir13kp+60E+i1H0WzM+CfdpSIvqI3HYMnP2YrDUXLX/gnKwwitvxnrxiYyDTf8NV
 LszSJCzm7SA0nw2tV0T+mO33a39Ka7LKDPKoOXSmmBvaCqkA28Z69tnAio9TlbP07QIs
 XfT0Y5lY0JXNDrIafbqFTGaetB30yKmXeQZgTAwoTwZn65F+Pd/vKN8bYm0++4LOhbce
 TxxEUZkwbLKxmaOLC/W2e64D/oGedSUh4WWQFLYELzhRmGEmA8+BI/Whj8rMApVKrfvL
 /+5aNJEIpes0XsdPfmbTLtM2SkDomBXtAKY1dmQurrutUpgf3t3hLnNgi2XVhjrF8pg1
 pzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699279901; x=1699884701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ODn++dUHbXaMIGDwTBO8HRgNU7TuGpihiT0x1eE0ts=;
 b=vcKzdKY2v1fyE56ax+xorQWnMzJWUaltvsAl1c68ICtk/q/FpCz4sTvoTKXN9c4tPt
 sLWA4TfUhOOM/90hVEwqce1xqPXACZIEblzh/B2gvpuyN2YQGQGFRsGoKkybl7gtLgD2
 iTlF0NI2TH95mIMxjLaoNqhyRifCoITufAVBVt2gUogt7oIeGNEDZEocyTvMT8vVBSNy
 SVPBb+/U1NQXHeLdIIAbqEkwekVs9rGyGpGn4KBxiu/jUOy4XKqw1HXbtHpdRDZxMNPm
 iU1Jtkwbky9Ml/67ekNbd3rQvKATF1hLXP8oaeRvs2p4XYnUKhR1O26SKCDLrQ0Lhd6h
 TlhQ==
X-Gm-Message-State: AOJu0YxJdq3uvwfCG0m6ojqFqbFuwIdvMEpSuRLrxYTkOqdS9RCUAYd2
 kZuvRBETDTlLPzc4NyoC/TbupDdtR2pdTo0EQUCCfQ==
X-Google-Smtp-Source: AGHT+IGq8v3jwn+3ZwyAYS24yFVZoELQr+D4HYZ50lJCnz5T9VmWyscEmFpzDH/0ZSEDhcSnoNINtBDLng1TwUdhQ8s=
X-Received: by 2002:a81:6c94:0:b0:5a7:bff3:6fe4 with SMTP id
 h142-20020a816c94000000b005a7bff36fe4mr11378024ywc.9.1699279900942; Mon, 06
 Nov 2023 06:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20231023090613.1694133-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231023090613.1694133-1-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Nov 2023 15:11:28 +0100
Message-ID: <CACRpkdZwTQSNymOMFVTwWZg1-GT1=yj7rwbfo8uWH1V_R5VCrg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: nt35510: fix typo
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 11:06=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> Replace 'HFP' with 'HBP'.
>
> Fixes: 899f24ed8d3a ("drm/panel: Add driver for Novatek NT35510-based pan=
els")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Patch applied!

Yours,
Linus Walleij
