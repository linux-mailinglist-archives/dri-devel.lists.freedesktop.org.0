Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1637351DE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D08B10E1D9;
	Mon, 19 Jun 2023 10:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164B10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:20:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D8156097A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8A3C433CD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687170020;
 bh=5npHlICX1Ui08YJUtQBgkjqlYH9O/bXDO+sewSzOHso=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YqrmBdBh/vZu60o7Pbso8WgHJN/DJkJddoBQmw19FIfhxpZTzTDH5IswHVJdssQZp
 hXi1MDLwQUg06OzgvCasN0IryLxdkkH0UrVzWnGhoqH6tDkoxzLxDpqY3jwGHDB2hx
 LWsFtW6Jx2+DCjGio3bM9gfHreVYU+weZZKBzZmmM69m/jkIHXeZHy+UYV+j64bJia
 oupGSS0UqG8cF8fc8VEgpXqDGC0qRCphTJ+eduSWwWqcJyJjcYDHbVXDfwXvM3JLsN
 q7ZQTJDCdY2vGudNrCT3h3IN/TXYh1riRQ+YTha11fpybjEYNZTz9ma7RVkRQ90vQu
 0rwNI50sYeiZA==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b46f5d236dso17820721fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:20:19 -0700 (PDT)
X-Gm-Message-State: AC+VfDwzIO6PLiAuCvggNK2cMi89z8dGhPE2wHH3n0IWjfVbR6FfkZ3V
 tIQlRexFz6QPtphTZNbxwFPrhiGWDgtZtCWJBeQ=
X-Google-Smtp-Source: ACHHUZ5LVZk3OMm09AuAMk+KuIwlCvrpDvoFz2Z5S+ZqZMi+9mMRLffEi6MsXuJWpLfSQKBGOiVUGuOsvIz0A9XR+5I=
X-Received: by 2002:a2e:9916:0:b0:2b3:48de:e282 with SMTP id
 v22-20020a2e9916000000b002b348dee282mr5125044lji.51.1687170018106; Mon, 19
 Jun 2023 03:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230615143613.1236245-1-15330273260@189.cn>
 <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com>
 <3e41da42-7bfc-c934-d8a1-ec18047849dc@loongson.cn>
In-Reply-To: <3e41da42-7bfc-c934-d8a1-ec18047849dc@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 19 Jun 2023 18:20:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5XR+tbxuDoGHZo3vshes6xwhBOGC=OrZy11Mq5fizaCA@mail.gmail.com>
Message-ID: <CAAhV-H5XR+tbxuDoGHZo3vshes6xwhBOGC=OrZy11Mq5fizaCA@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display
 controller
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, inux-kernel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <15330273260@189.cn>, loongson-kernel@lists.loongnix.cn,
 Liu Peibao <liupeibao@loongson.cn>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 19, 2023 at 6:12=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
>
> Hi.
>
> On 2023/6/19 17:18, Huacai Chen wrote:
> >> +
> >> +enum loongson_chip_id {
> >> +       CHIP_LS7A1000 =3D 0,
> >> +       CHIP_LS7A2000 =3D 1,
> >> +       CHIP_LS_LAST,
> > CHIP_LAST or CHIP_LOONGSON_LAST?
> >
> This is intended,  CHIP_LAST is already defined by other drivers.
>
> It will not cause redefinition,  but it deny my VIM text editor jump to
>
> the right place on one shot.
Then use CHIP_LOONGSON_LAST please.

Huacai
>
> --
> Jingfeng
>
