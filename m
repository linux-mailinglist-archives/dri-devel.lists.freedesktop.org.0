Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C96E8B45
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE110EBC5;
	Thu, 20 Apr 2023 07:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8B410EBC5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:21:40 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-54fbee98814so28843877b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681975299; x=1684567299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLbT5hVhYcV02p3hHaLqxtmtmMCjvhRv1rYkWERXbeU=;
 b=QTGK+dypK6k2S08JVTdVcQRTWk6/eAHMseMqP91CuXmixFJWePFEeMJTR1JKJl3tJ6
 Xaas7YsA+R/QNyA4Au7Y8APlHjS6HsFTAHr6FHEWnnNzWQKFg08OU/v49w+DjubKMxq/
 aQRVPhrmsASYTDubT11E6/dIq2FMLNHZmdCrAJr3wvIFPemb5VSgBtkDhEWPk/Vlp6Eq
 6un9yjjDJB3ST83t8czmvJy5WrMFspT816Hg8d7nUv8sZV8FU32xaoGsE5LdLcgioPoe
 ICmLHfEXxdmuOzbDAElK0PewT0pLo39klytZTkbOJo1nU6XDeihrs+UJeuRG4B+y1Ia5
 vlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681975299; x=1684567299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oLbT5hVhYcV02p3hHaLqxtmtmMCjvhRv1rYkWERXbeU=;
 b=CtDuGc8w9q8uwOiVPxdvk2fNTa5lXt04hoIcna+SdvrabhwR7Lyns4w1IJH7dG6BZm
 S0casrGzQhMVmaZlP7e3Nl4mDsrk9764GXKT+GWjD5wMmPCPCTIS+u4rFF7FuYptU1Ye
 nUrZs+1FoDI+QLIbMtWssPckWDNNqkrF3E5I7ggoWamgbjUT+BeZrMU064dxrriq2vG6
 YKvk8Cz9E21ccbBGuis2rSDc7o9UDsA2fYaI4BqNusQpLbDedl9bi5KBZzRladjzGfEe
 6lzGlV2AU8UWudNKXBpWmAGSSVuD0jwKWZd/L786KeGr8LVUseUHqah/kG7578xD/9pY
 ZyMQ==
X-Gm-Message-State: AAQBX9eKcpcXMgpPKm4Xo+teJ5kioYeDwGlplWHrwCcNbFGaIWlTlTtK
 Ib6gn29jP4XplfdatcbHr1hmPj1DKyU/DNYZxiLgoQ==
X-Google-Smtp-Source: AKy350blgwHrEXE1ikzHbGGCBYjw9RVxglmRRKRDHlD7rvl6NARuY+TiiVgY2n0UW18b27VzRbT9IE9XH88uAfbAHfc=
X-Received: by 2002:a81:4f89:0:b0:54f:9b17:c7db with SMTP id
 d131-20020a814f89000000b0054f9b17c7dbmr160494ywb.10.1681975298893; Thu, 20
 Apr 2023 00:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
 <20230416131632.31673-2-aweber.kernel@gmail.com>
In-Reply-To: <20230416131632.31673-2-aweber.kernel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Apr 2023 09:21:27 +0200
Message-ID: <CACRpkdYhPSK40QOcsMry8yvKy_iP7cyX-=sHOw-N50N+q1qqrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
To: Artur Weber <aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artur,

thanks for your patch!

On Sun, Apr 16, 2023 at 3:16=E2=80=AFPM Artur Weber <aweber.kernel@gmail.co=
m> wrote:

> Add bindings for the S6D7AA0 LCD panel controller, including the
> S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
> of tablets.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
(...)

> +  reset-gpios: true
(...)
> +            reset-gpios =3D <&gpf0 4 GPIO_ACTIVE_LOW>;

Since reset-gpios is always active low, add a description: to reset-gpios
saying that it should nominally be tagged GPIO_ACTIVE_LOW.

Yours.
Linus Walleij
