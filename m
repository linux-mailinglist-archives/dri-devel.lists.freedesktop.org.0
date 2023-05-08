Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79F6FB6CF
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 21:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70EE10E2EC;
	Mon,  8 May 2023 19:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C742010E2EC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 19:39:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so934524666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1683574779; x=1686166779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZo5wi0IhdS732BMMRQ/ooi48+6IHXRkVw8vGwD34pA=;
 b=dOYh7jgfGYyk9pQCmU6hRNEAgZEydObWFJsZYWau/MLAPg+yYOsc4SnyWAZDTp9yXJ
 E2EnxvAFbFUUyIX8McR0YjZd+4WasyeB0330Zt+XjQ9a0ex4hwJq/93lFd5r+EYsD4Sk
 i/iJ/F4NGXx9IPJeMPgCLO7CVTzp0zg+58gVVUtl8FmrakIYOJhAh8xcgFBgOGl2KMCG
 cevVuao3FMIhROxStBUqzOlbMNiHNV5DDdnRG625Rnqc5ORm9yNZS/F+k9Rtj9LAYD6j
 B5gXpIMFAsGlsl7eDGV8gacSlcf8Rztcz2N0ctcOCRxe3AH2XkiSWKpbxCf6E/Nz2rnj
 79gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683574779; x=1686166779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZo5wi0IhdS732BMMRQ/ooi48+6IHXRkVw8vGwD34pA=;
 b=N31apg5ZHRfLQE9yLnMIIzJQi0XvKPaHbtBGDRzO7i6vWzrrCu6PmMoFhMjh8ILV3P
 N4lZk8/HC25hiZYDiRQFDvuybYf7FPrUNo9ynnewxVDK1XED3cYVOr6Yp/Ydq+bjT+Yd
 /wzdxLeOgeobpAZimCsRiotRJceqp387V4JLhET3xKXlBNzQY8llgE4fmjpJFZFeEWiW
 P390Mpb7i8K7HuZYUnfTxTkVwD7z2ewF0ZidjZjgBy8VvNQ7hH+o2YZjC132t68xJ5T1
 C48vMj306YzdhkWBG25ijAq5LuvXwwc7M0IefB6sQeyT1YiTwWLdbWOes+/L89xIW98h
 wzhg==
X-Gm-Message-State: AC+VfDxPbBmmlAreucUOxOydlEC0YwpCg3YSBq9gZOclL6yvF864wDRo
 p2ohhexYQNuToZW855VtFW+K9VSqF4C60IgiZ6c=
X-Google-Smtp-Source: ACHHUZ4w2oFvtz1UalbLPpJhTPOevQ0PaRpgVvwZl0CCFJ0YwHL94e6Jp95FUcVBFMuQpEBibFIavKk9Jp6iVJVLLLk=
X-Received: by 2002:a17:907:a4d:b0:95e:de94:5bea with SMTP id
 be13-20020a1709070a4d00b0095ede945beamr9526177ejc.56.1683574778804; Mon, 08
 May 2023 12:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-31-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:39:27 +0200
Message-ID: <CAFBinCC3kP7vTZZ6cdCwn15qtQCqVfVhVS0hDpbX7r0P8RA1qA@mail.gmail.com>
Subject: Re: [PATCH 30/53] drm/meson: Convert to platform remove callback
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernel@pengutronix.de,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 7, 2023 at 6:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert meson drm drivers from always returning zero in the
> remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
