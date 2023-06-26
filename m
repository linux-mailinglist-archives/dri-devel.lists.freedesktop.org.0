Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A309673E746
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 20:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9C310E178;
	Mon, 26 Jun 2023 18:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154810E178
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 18:13:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-987accb4349so554946066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687803209; x=1690395209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTiTRQi1M2AFId64VgyQ6ZUHQ6ZBF0h7dNfO8Kih6Zk=;
 b=cNQQOPSM3ls0DItIOxwNrtQljXKrd75oIdtILuBSM7gnnhIDVuIVlwHKuwVKVdhqbH
 p1Tc2O9kYTzYw92s6eYyANHt8+xqDMH/FYJCemF8+sHozTZKpxTxGR4pedmjRixrDADR
 4lQt2m9KaD18Bm+QUMhkKD2KreWmnXvvKbIko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803209; x=1690395209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTiTRQi1M2AFId64VgyQ6ZUHQ6ZBF0h7dNfO8Kih6Zk=;
 b=MghjwGtdtBIJz9Jff3/gNN3doS9he0JSIKmokm6/5pS5DpIob8sheuHEGZak0HQRFn
 WhbdyHLRqtkiUHhVj4+WbZzYFLx779Dgujru7ks65gDTxDMFwPHluYh2vExEmUGSzgVj
 eStKZwGKnyag+89lj4hIRLdCRyRFClu3K800eF6F720ZIqdz+lkLxV9X9hC66gPbyUNG
 yT83x826CYgx6T/8BvFiRR/6C2eHTpmLGQeuO8llm6yX/SA1Mfcu3OCQ9/XlWRSnCOeK
 ReHrdgl5BH8fkkrbCp5S8V6fp6Jiov5+PdGoxDE0H9ZKfYpAdJ8YVIEptMrLUPXJ99ld
 YYVg==
X-Gm-Message-State: AC+VfDzuKZgGb7B6gjmBPMBbpHbMrb8l0WBSixhiQ/y6w/7H/LCKYTgX
 AcaU31RiO7lXaQzkaPeU2CzdPMKQXTJDMFShafsz/g==
X-Google-Smtp-Source: ACHHUZ7+QNqOxnrLIIbsRD9VDFDVnRXPz3/o69+uL/OpUPUq1NIDOiRND51doMLAVgBnUBRmF3sNeA==
X-Received: by 2002:a17:906:51d9:b0:98d:7818:e51b with SMTP id
 v25-20020a17090651d900b0098d7818e51bmr10154383ejk.27.1687803208917; 
 Mon, 26 Jun 2023 11:13:28 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 j8-20020a170906830800b00977eec7b7e8sm3519918ejx.68.2023.06.26.11.13.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:13:26 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3fa5295fcc8so12895e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:13:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba7:b0:3f7:7bd4:3b9d with SMTP id
 n39-20020a05600c3ba700b003f77bd43b9dmr145911wms.6.1687803205627; Mon, 26 Jun
 2023 11:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230613065812.v2.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
 <CAE-0n51fbLvobz-R_3LWPZBRg7SNOxgFQ_DYqMo820W_4UOhDA@mail.gmail.com>
In-Reply-To: <CAE-0n51fbLvobz-R_3LWPZBRg7SNOxgFQ_DYqMo820W_4UOhDA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Jun 2023 11:13:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDmHnCEJ7-557XhFfyKKHNnT4sUOrwjSQz3J-bXRmnNw@mail.gmail.com>
Message-ID: <CAD=FV=XDmHnCEJ7-557XhFfyKKHNnT4sUOrwjSQz3J-bXRmnNw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 13, 2023 at 11:41=E2=80=AFAM Stephen Boyd <swboyd@chromium.org>=
 wrote:
>
> Quoting Douglas Anderson (2023-06-13 06:58:13)
> > Memory for the "struct device" for any given device isn't supposed to
> > be released until the device's release() is called. This is important
> > because someone might be holding a kobject reference to the "struct
> > device" and might try to access one of its members even after any
> > other cleanup/uninitialization has happened.
> >
> > Code analysis of ti-sn65dsi86 shows that this isn't quite right. When
> > the code was written, it was believed that we could rely on the fact
> > that the child devices would all be freed before the parent devices
> > and thus we didn't need to worry about a release() function. While I
> > still believe that the parent's "struct device" is guaranteed to
> > outlive the child's "struct device" (because the child holds a kobject
> > reference to the parent), the parent's "devm" allocated memory is a
> > different story. That appears to be freed much earlier.
> >
> > Let's make this better for ti-sn65dsi86 by allocating each auxiliary
> > with kzalloc and then free that memory in the release().
> >
> > Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-=
eDP bridge into sub-drivers")
> > Suggested-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Pushed to drm-misc-fixes:

7aa83fbd712a drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
