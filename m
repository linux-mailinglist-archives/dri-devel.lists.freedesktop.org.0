Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C286F9F7C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AC910E112;
	Mon,  8 May 2023 06:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D897A10E112
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 06:14:23 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-b9a7c1b86e8so5435406276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683526463; x=1686118463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGAqICUH/1K4NsgXWbLmHmQxYqNk9fYoObWVq8uFXmY=;
 b=GBaxONxSV36I6Y04VAp3eKcF4Z5peOBoJlNpr8SLrdqwhBHLovszOW37KDHp3cHY/O
 DAmlJiLRwr2p9GwjeQ+WGBcC5ntY1cIy2RseflBUZjex00+GxrEbHefrHugR+ooHc/aS
 MyEuJ3bnqoSVc0a+1sJE1o+cF4Av4BaaNVe9XcSyscMm7IA7IpFJVykI5ttd1I5FeI2W
 6QzKzV3Lhdu6uqhPCYP4CKpF/Z3E/jnV506V5UJUNFk2/qi2PGUlbAuBJ/2YbY9VhU78
 3VV56QuTQCktxiP5EAzn8xPfuzLOxdnbs5xWETk8g54++zr7LVP2q44is5JHwqYPwz2P
 5+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683526463; x=1686118463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGAqICUH/1K4NsgXWbLmHmQxYqNk9fYoObWVq8uFXmY=;
 b=XnKuCcjFK9UiqWos3NxaoObccx3RJKx5uWHZPTSAgzWGqx40Be+ukKk4tR960w7ehn
 fDaNM/N8JnqZPGM0r4llplzf8o4/OUWKTngcy6ldHk126v11m2cgTP0qIY9wLlCile2w
 6LLNzqXEFEKvO1vcgXXVRuCUKa8n0om7RzQpegNDGzydn2Yo/vAHl5v/es7Kd6miJAAH
 03FGxba9Ly1NY34XaDzZtst35JbpG5hfr0O4eDzgOoFWwS0BymMVpWMFSD0mIvVaOwo1
 WKC6qO9qkqK+d1GC9uz8rbWxtKBYGswMFCn9Iktoxy2nc1VhhlnyLSIAfxc8AuorLgX0
 z+dw==
X-Gm-Message-State: AC+VfDyC/2dZkNIWTM+eI7bDntcwpqZmwIProWY9c5yCOkq9hgbSx8G7
 39nqmdhs1bNlbtUOUw43Wzce43TIBYH9tyHVA0RgYA==
X-Google-Smtp-Source: ACHHUZ6ns+gsXWhTWDX6Zza/DiOvQyFjSN0kzlj/vuDm315RJw2pTeSrZ7RXYeQfzMMRp0CrZr4VU8z2ERRiiZCIT6M=
X-Received: by 2002:a25:abec:0:b0:b9e:7ec8:5d41 with SMTP id
 v99-20020a25abec000000b00b9e7ec85d41mr8779027ybi.55.1683526462845; Sun, 07
 May 2023 23:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-51-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-51-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 08:14:11 +0200
Message-ID: <CACRpkdaOusm1fuP66O=XHe0MbRq373NQsDVwS_3gpRDKEs0jUQ@mail.gmail.com>
Subject: Re: [PATCH 50/53] drm/tve200: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 7, 2023 at 6:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
