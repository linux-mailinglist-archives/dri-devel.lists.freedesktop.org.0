Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8D75575E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jul 2023 23:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0DC10E09A;
	Sun, 16 Jul 2023 21:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6710E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 21:22:55 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-cacc3f97ee9so4124647276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689542575; x=1692134575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehHFd2i1D4cdxDgZXxDtxev4s/OtFUIBV9R8JH1GczI=;
 b=TUANb1xdwg4ApfDT153qsO6QCznb5nxHBKEhNirqqCNXAE2sRkK2qbvW49vqxIsAj2
 o2d0ZFedzmRDzUrDHmn0LcAsYOg6z8ZPD+RX6Vqg3LesLA6K8FweiqJ6RiNjb507yS7J
 mdzOgTJygiJIrBrFtehvMOuu6AhkSN0LytONWTRC2sSOQeK9jfjBPxGgmtKU3x5wVAuk
 pGIeeLly8iAwYCG5ts7WPiV6nwFJ9jkDCjgu5w3cFHMpcmzUjp6oCkVNsHui7JD8NlYY
 /naJzYS/oBC+CDcx7XIUGGVbOkDCjT84b8RociW+eusq3Wx7Uvgx9u/SPNpIoF3bfmLH
 gjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689542575; x=1692134575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehHFd2i1D4cdxDgZXxDtxev4s/OtFUIBV9R8JH1GczI=;
 b=Y8Su10HjdCHzXXZEV1aQEL36lbM380m3vmefTzxM4qYvvWe/FsKE9D2tYC41Pq3NrW
 dEy1N/iMZxwZaEhCMtvDCVA3xN1wfKnToYxeDm50N9v3Yh8VamjgosGK0gy9YToR9Xw7
 S6aUcX3KDYWuF2p36gvBYKd3E91Otj/1bevsY2czdjLphp48nSmU7oihbaTxDkZ0of+i
 ubIpdatVkgtTJahFKeUDK88DEbfGl5arF1q14giAyApiQbrWY3SRS4ZB/485oNXutr6y
 2HMwX0OB6OULd/w/2Z926PBPTHXPU+qmLuipjTelB6NknznrBtsV/vczX93Qn3Qh11RU
 n7+w==
X-Gm-Message-State: ABy/qLanldH7+WcsFd8JXeksk+DikZwG6tkXBRmw+72uiapgl0712NIv
 Kny2tLKIjwAPOpWK1t86DcVB2hhB/+r/8ESbr45Qgg==
X-Google-Smtp-Source: APBJJlErNg8Oc3PPMT7Mk+Lfx5QAC/OC92g4sKDGGNguhpK28xKdYtC3K+IjcJQWqeu8+LMrged+MnE1lM++5T7GyW0=
X-Received: by 2002:a0d:eec3:0:b0:577:3fb4:f245 with SMTP id
 x186-20020a0deec3000000b005773fb4f245mr12710224ywe.19.1689542574879; Sun, 16
 Jul 2023 14:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-3-arnd@kernel.org>
 <CACRpkdbiDUomH8HLkk_jyJZYc+mEmRaFL8-JasDmd=ooSB62Qw@mail.gmail.com>
 <1c0119cc-7787-4f95-870e-da1c5894625d@app.fastmail.com>
In-Reply-To: <1c0119cc-7787-4f95-870e-da1c5894625d@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jul 2023 23:22:43 +0200
Message-ID: <CACRpkdYVQa-p_tA5reK1Biniz6xf9gWm3K8JKCbjr4fO3=GHZQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dummycon: limit Arm console size hack to footbridge
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 4:28=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:

> Since you have already spent the time to build and test a kernel with
> this patch, can you do one more test here and check the text size
> reported in the atags on this machine and the actual text sizes you
> get from both vgacon and cyber2000fb?

Heh I tested this then walked out of the office for vacation.

But I can put a note in my calendar to test it when I return to
my equipment!

Yours,
Linus Walleij
