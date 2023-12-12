Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9980E3E2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 06:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D410E0DC;
	Tue, 12 Dec 2023 05:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5B310E0DC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 05:39:26 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4b2cbf07de6so1359709e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 21:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702359565; x=1702964365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/nfl6+GaD4Qn3MjtsV3jUS8ZLKPlwsaFZp1B5lXgg4=;
 b=HkGCsw+YB/2PRsGG82a7rgurRG6tLELcIEDqoJOADsB7e8kbi3/4of6gdL4ZZCiXpV
 F+Tnm6Uh3VL4idc5VUWQUnUFYrwUP4wEQJXoetyONpL+jxu2T8W2xmYCynX/wCpLSJYU
 XisInYHNWASoXO9yOp/Ok9XTwhduFmgEH/bR/dI3vP+y1gPxM0mTdD4RgGQJgnnvWybF
 i3VjU2Gy3ErjPQJZY1N71ekZFPok+V6pBM93N93TZuTywGkwEIujJXafsoDMvXCbWnLu
 wPiN0CaQZ/cIJC0noDMABfizWpF1pBRxTh+6DRH6negftXTNJTqqhgltABbkuEzgxkyL
 S4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702359565; x=1702964365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/nfl6+GaD4Qn3MjtsV3jUS8ZLKPlwsaFZp1B5lXgg4=;
 b=mo81TOunXOisn/wrF+zuWqgRcImfTxJhZSe//DlSnrgOYZiiWqgAozFwMpwaM4nGfz
 u9xPjCSWyYpnwwjIY1Ao9P17dWWfLmaY7edjxzr7JV1gVlfqcFNE8ahU0psqZss3Ih35
 9+qgyGlbQAUsiLAff6c8PNJoVONW+LcJXTY4ko+f7OqWfgrlI8qvGZlFKYXZDvdwgYqH
 tT8dpFCP3n0plwAW6UjYEkC9SoGgZgKn57moIz5xTEvaZfkWoKFmF/DSFnNF297YPNqY
 IFaCJ9mW7mBukP3+m7gq/xfHtAGk/PFh/VaVhG19n+hD57U/Yt40aXcqqVjyYywz5acq
 8fZw==
X-Gm-Message-State: AOJu0YzRkwLlircKkNZcmNQyHNISfOSeCTW8BPOjCrk3Z7TTo/HsThMf
 wyLkuGq+es5kgn1nDdcU/E4zZqCbjTdJkjSqkWo=
X-Google-Smtp-Source: AGHT+IFuA4Vm1xOo/b5ypPGswpsFKKTLBm7xwx8r3F1B1AErinJ1oK7Hecn7PcY7E+X+v3iVTp01WBsEaCLlCnxwXU4=
X-Received: by 2002:a1f:f809:0:b0:4b2:c6b2:5260 with SMTP id
 w9-20020a1ff809000000b004b2c6b25260mr4273038vkh.1.1702359565475; Mon, 11 Dec
 2023 21:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
 <CGME20231128165521epcas1p4993f7d2fab0723130a4612d810d254f8@epcas1p4.samsung.com>
 <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
 <048901da28b6$5be8e700$13bab500$@samsung.com>
 <20231207080338.kcjx7uixxjw2axtc@pengutronix.de>
In-Reply-To: <20231207080338.kcjx7uixxjw2axtc@pengutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 12 Dec 2023 14:38:47 +0900
Message-ID: <CAAQKjZPxatiZG+HJeXW9UYFiSOuGD0EgvWKiOrYCuhk27x2AwQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
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
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe Kleine-K=C3=B6nig,

2023=EB=85=84 12=EC=9B=94 7=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:03, U=
we Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hello Inki,
>
> On Thu, Dec 07, 2023 at 11:37:44AM +0900, =EB=8C=80=EC=9D=B8=EA=B8=B0/Tiz=
en Platform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 wrote:
> > Hello Uwe Kleine-K=C3=B6nig,
> >
> > > -----Original Message-----
> > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > Sent: Wednesday, November 29, 2023 1:55 AM
> > > To: Inki Dae <daeinki@gmail.com>
> > > Cc: linux-samsung-soc@vger.kernel.org; Daniel Vetter <daniel@ffwll.ch=
>;
> > > Jingoo Han <jingoohan1@gmail.com>; Seung-Woo Kim <sw0312.kim@samsung.=
com>;
> > > Kyungmin Park <kyungmin.park@samsung.com>; DRI mailing list <dri-
> > > devel@lists.freedesktop.org>; Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org>; kernel@pengutronix.de; Alim Akhtar
> > > <alim.akhtar@samsung.com>; David Airlie <airlied@gmail.com>; linux-ar=
m-
> > > kernel@lists.infradead.org
> > > Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove
> > > callback returning void
> > >
> > > Hello Inki,
> > >
> > > On Wed, Nov 08, 2023 at 08:54:54AM +0100, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > Hello Inki,
> > > >
> > > > On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
> > > > > Sorry for late. There was a merge conflict so I fixed it manually=
 and
> > > > > merged. And seems your patch description is duplicated so dropped
> > > > > duplicated one.
> > > >
> > > > Ah. I have a template that generates one patch per driver. I guess =
this
> > > > is the result of using squash instead of fixup while putting all ex=
ynos
> > > > changes into a single patch.
> > >
> > > This patch didn't make it into next yet even though it's included in
> > > your exynos-drm-next branch at
> > > https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t.
> > >
> > > Is this on purpose?
> >
> > drm-exynos tree is not included in the next tree. It was previously
> > included, but it has been removed. drm-exynos tree is merged into the
> > mainline through the drm-next tree, but when the drm-next is
> > synchronized to the next tree, a conflict occurred between the
> > exynos-drm tree and the drm-next tree. Therefore, I had requested that
> > drm-exynos tree be removed from the next. Perhaps I was inexperienced
> > in managing the git tree at that time. :)
>
> That sounds more like a reason to have your tree in next. One of the
> core motivations of next is to find inter-tree conflicts early. If such
> a conflict occurs and you only notice it when it's time to send your PR
> to drm-next (or even later) the pressure to fix the problem is higher.
>
> Also for patch contributors it's nice to have a "complete" next, their
> tests are more expressive then.
>
> So I want to encourage you to readd your tree to next.

Thanks for your feedback. Requested to Stephen Rothwell. :)

Thanks,
Inki Dae

>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
