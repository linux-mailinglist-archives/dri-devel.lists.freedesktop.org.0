Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5D7730CE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 22:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303F410E380;
	Mon,  7 Aug 2023 20:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC5010E380
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 20:59:27 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d2b8437d825so5015147276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691441967; x=1692046767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TB24omLK1FlKgOCqNqP19I66aXL7vl5SkLes22X3sI=;
 b=ppm24rYK/BKZHa37pLXK0YkOokF7GCCrIRUwj4JSwIuIemYzGjn8XL6h3Yk3/mSu54
 QIULEmv9V8MMb0fNjl+R/JMA2SLBL6JcnQyv6QSh4bn4YtIG9Fwy0MtyosFOBwmfRIr4
 RKJgs1GLh5O4nWrhobx7Q4CQG+J4VKD8L740/f9VRE/7wipxBmbS97g5NdP/Sec9yPAB
 VzbgxxzQ1VcaOA0SgPAvkkIO0syIZJBt2HKDW7gVSEKqNeoBYj/b4wjRkFnR3eQ3irew
 DEwLMfkbRKcyLS2eUQD8VLQXZDF4eopzgvqW2e9+OPj8On0pzPPrv7jwvQNto66I26qy
 p4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691441967; x=1692046767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TB24omLK1FlKgOCqNqP19I66aXL7vl5SkLes22X3sI=;
 b=DnPENnA6TMM1RoPXDL62K2UMMvm0IqqfIJMrSoz+87Dx429lRVbT5Tr6TLQfM7ds/6
 c8zu6yRxJSBzNBWmt10gPSbOT5a+hdheY6XIPSRicLXCQz84SUm7HKoeDmUeU9Zg4Ft2
 gjqsZSHTrHpxMg0fOUWLkHpn3woorehQaKPLfFpJkR/m4Buv+O7sVgoawYXMQ/liw3iA
 zbgaX/st1oU0Kv2jBdEkhJp20OBiFZvEv1ZHpEWmhiqe4eoRGqVgraGQ5TZce6Pfy6a+
 G7vq3345rkCwW6H9AiqHrWlpQX8SYN0Ptqb28YncNL7sqKs2b+QYjED4/lObvDPutW5Y
 jI6Q==
X-Gm-Message-State: AOJu0Yxlkc6Uxl0Kuw3RX58N845s0SmgpcIpQ5tggLrADe4P8uJ8A6yQ
 5nzmVZFkzTkgIZL02RJd6/oRkEdVIPuw0BSeKWoWuQ==
X-Google-Smtp-Source: AGHT+IGMBg+B//EL+G4WJP9rq3qQofAf0mYrKqZqe66/aYe9NZ2nYEORKSvft3JjPUvy4dGfRg7eJoe1epzmtp8el54=
X-Received: by 2002:a25:240a:0:b0:d10:c4ea:a6b1 with SMTP id
 k10-20020a25240a000000b00d10c4eaa6b1mr10565680ybk.38.1691441966829; Mon, 07
 Aug 2023 13:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230731131810.103379-1-wangzhu9@huawei.com>
In-Reply-To: <20230731131810.103379-1-wangzhu9@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 22:59:15 +0200
Message-ID: <CACRpkdYA8kcggu_4jZUj0nP9040wNbCZw8gB6t=z-giaWRprsw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mcde: remove redundant of_match_ptr
To: Zhu Wang <wangzhu9@huawei.com>
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
Cc: arnd@arndb.de, dri-devel@lists.freedesktop.org,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 3:19=E2=80=AFPM Zhu Wang <wangzhu9@huawei.com> wrot=
e:

> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Patch applied!

Yours,
Linus Walleij
