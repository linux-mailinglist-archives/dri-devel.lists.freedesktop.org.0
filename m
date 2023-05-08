Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A96F9F79
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B0310E0CD;
	Mon,  8 May 2023 06:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16FF10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 06:13:58 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-559ded5e170so60397487b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 23:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683526437; x=1686118437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEkJ25osgUePQpZluJyDAjPxL2geRfawjeYXQr5+Sm4=;
 b=NSWj1qhzWKbmnX60n8Hr82RUVL1p8l/qgOdSG6Bvn7ok1YNZVtPEjotpa8buL6tN80
 J0MOjLDcGiabE/6QspuPMkNLcleiHyImuwrBRE7eNHASduYMO3Op9k7HElsTuO+lrhFq
 zufTSccun6kI5iOuk+oJotyOzw0wuCx+UNJjTP/OolABh/3YpqA10vr5wNjbiofJgaH1
 Yvt5rR2WThWu38IW1cZV0fgoFFmaEoum+d4YweLddpdFU1uv2nr2wJbkyfCztzzc+2el
 aOBm3VTu39jynMAl1+/RUSiasixwaN8PmL664YupGZd6MhAXUwjmnDrnNw6suk6yUesF
 6xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683526437; x=1686118437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEkJ25osgUePQpZluJyDAjPxL2geRfawjeYXQr5+Sm4=;
 b=CfAlgNFenlLYLafQWVwlDS6CkOcW+/SP/NuoJY1PrmdonMcTpsEJs1Ksh/yqoTzWlK
 jIdFYXX3STbkzkoY5UToDdbPqhwSPZjJp+EpK8iZ2uh0qYDrfM1r+ZF7QM4vOH6cc2Mp
 OTBxWwwie/HXpdfz/YfJGK5f3CiPpjbIZ+8DLfo9SBQoT8hBYWpSlLuIOoD7GslS4zVb
 Dh7VwUIWVXVbGpAIkIDESlyCh0NDTHqXC3XGgK3kR4ROLNtMNy41EZl+Hbu82KsWTGss
 /hwql+npH5nUjskW9Y+1EyugJEq6SvZ1gQl41c65pfFZEq1+WgVoFMTGpa0WKrYYwpFo
 Cj9Q==
X-Gm-Message-State: AC+VfDzg+nk3RE1rECn44S7Z4/aAYyBZY7eQSE9UiHnGMwLrJdRO445v
 pellDBTfAgTbCujrsff9ernyik4O1ma6UOdNNwbBqg==
X-Google-Smtp-Source: ACHHUZ7ZIHJeP/ajbwCMWQFS+SBj2ZGrM4VXX6Z0OaDwylBS5pdPG0UHLGdJ2H30y2bUGl4xNsOJnHj6NZkiPSiriHI=
X-Received: by 2002:a81:a053:0:b0:55a:8036:345f with SMTP id
 x80-20020a81a053000000b0055a8036345fmr10185418ywg.14.1683526437195; Sun, 07
 May 2023 23:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-28-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-28-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 08:13:46 +0200
Message-ID: <CACRpkdbgJ18O-1Gjzrx+8mF6YbGrcDok+FWeJoUCETj4U5G8SA@mail.gmail.com>
Subject: Re: [PATCH 27/53] drm/mcde: Convert to platform remove callback
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
> Trivially convert the mcde drm driver from always returning zero in the
> remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
