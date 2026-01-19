Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A1D3B9B5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 22:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AE10E541;
	Mon, 19 Jan 2026 21:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="YOQ5dA0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DF010E541
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 21:24:27 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a3e76d0f64so28631895ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
 d=google.com; s=arc-20240605;
 b=cbFYzLmEbAKMfsKZOH+3eMEalA5f2sZ88cAPmT1YkTgMb8mSEYAtbGNPkMqTLgqK/I
 g6PrCL2r/wnIn8eIqCK7zQfKnwL4wfuEr5V8711nomgt6lE+Ub2tQHjLY1qol4ORZ+OB
 POIhDqUSucJmlt0dTQYh+U/VGeJ3ZBPaQGw912jQh6L60HHg5/1JCaORywmenp8PswCR
 0kxooSg14hTQiBGGoF/Gg8MwcXvUFGxW3Ooqed9oCIdHHdxsSlNB465nxVpCADRE7g5E
 cwHTRjlOO/jVatU0cG3Nlm7g4QdK8XXWX5qs+Hmy+7AWP2dvjuI63yWEg2EumVSaRGLu
 8BxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
 fh=4V6dYwcSxuhNyZAANokd4VCL5cOo9gFRqDcmraYcYFI=;
 b=OKRKjGhwssV5e6QntsSjvI8Hpf9mQOAonl2O7jkWyO5LWcqmFt/XCxcBLAX28P9fQy
 nRjRowoAbPtDxFb7NVG6WleWgDDAWHXtJ03IqqLSHXPwuqibWW1Qe3TOl+mIrJEPOT3C
 EQJiDgFJXl9suSbp3/uAp82Q9FmINW9HqsR2gLUv259csH9aI3jH/tz4SA5ke3DlscoE
 lY85l6ixXIV7B4jKYP6GVXvMzuzorZYlSE4PM/9K9peA3Eq1natGrnxveXoyqZFBeKQg
 LII0Z8997IWQZFPbVao0az0reYm0zlMbXSyIeWK1JdeGPfmjzkGqjAgRuTcv0y7NGxsI
 pEYA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1768857867; x=1769462667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
 b=YOQ5dA0JKow2BdKwaGO3Yp2OjztmU/5rRMuSZAdUcEpfVNRLDwluvejc4AN6EUjDX1
 HtV/QhzsPj8iRI2OszGm8iUXSZcBPBTjRbEsxiDoyN3IS5WascjkGtR1f+OktjmahwrV
 ieL/fnNM9RUiQLvdj+rCEy+wJZwFa5WIykrni+Apbw3jhkKgCiD/8rm9mJiX190/blqe
 wFqWWsZ2T+hNH6RCZ9FjpE6VAbDgQsgtcy2QHcyxZWp0Xy9FqINoNp4WpFpiwiygdtmV
 BSBW+/ioxnHFzR2uifiFljtvxZkH6OAxjCuguFSO8g30RsJemSnAXdaos4d2I9N2c/Ug
 6/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768857867; x=1769462667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
 b=xFBtWFq/mppXQ4frkiY2A7OUpVjIMFbOJbzKiGi4a8Tiy1MwiWQee1cfeIxLcFQtwE
 csnkjjMGJagnmnkrQNUoQoKmve42oYlsq0iEny+cNNngBJAyrvcTqslaHWNksmTHIojo
 TFk4gFHfy1yt7zjVBMvX7IgucbgTvCvSFdudwOzXZzW3PgeC6Xy/xrQzp3VxYBS0EiXq
 bFRcMFbkzDh3cTNyB7eu6U8V4rJIJITDprQURwrdeU0Z+FlzBY+QF4WxyPQv4JxVSZYn
 L3/mL9Zo1LPtj7dEsZ/cQy5IZW5kOC4VyejPswn0h1rjlhT+f5yBj4F9O6c+osUJQLxP
 IQoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDflewyIVrcP3Ky6TLqCzutKddYwtMdzYytSToOlQoK+eGM770h/iGjjysVXq44csZLEi/h7YpwYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBDMr92feNRcCdoqD15Ni+RNCJHaBpFHQdcFEQTIvRx2o4ig7L
 w1U8sC3dV7ppaZtqVYFYG1g07TjpCUun4Ejfa4FMSsWDr4cZt/TnZi8DsMNdFZTjRLJ9q32a/7K
 08AxXHUz12I7cJpAS4cPISEK/aQQBdXI=
X-Gm-Gg: AZuq6aJ9pNhsDAbyzdAlBYSRjPo9SsTUbAPz94C26pxkU8YG959ggNVcsxf1/LfxbVo
 QqRhWjr1V0BtUm4dldnxhOeJ2q/lh8yCA8+PqD71L8YtYxqfJ7OXGv2NvkGzn3yDF0lvM6N/ixu
 P1Eta6JWHWAwCeEZgqaZLyd4LoDimbk+DEroVkzv+xU6w4f1vbNHmAjQkRw4w/W6/Xz/L3Ryxcd
 cBfH0Msz1LpCpJjwy7AoI3Lj91k84llP2o8t9STWYqyeb9M0VSHVmTnP7tutKwGAqryVXgttvR8
 2elChUnKmUOGHvgmx29KmiltiNRgjzD6Rg98XLk=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
 <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Luca,

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin
