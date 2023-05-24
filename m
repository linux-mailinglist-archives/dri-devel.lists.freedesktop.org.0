Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3270FFB8
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81110E691;
	Wed, 24 May 2023 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65B10E691
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 21:12:51 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-33164ec77ccso47115ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684962771; x=1687554771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zT/HDg/gBVolXCcggpB7iSC/DWvpNoZ2VGMNWSuR74=;
 b=RkcFmnM0HLWQuKc8UgAw0e9xvrWfxkZ18UU71V/+md6GlosqEs5GzDY/a4UJxCkNm2
 yFek/5dSOlr36tQAQYPyVVOkLm7ZbOBjzFKZuVQbE7WLKT82ane7Hpz3IMu0xgVecZwN
 SmofscwdIr2/0IZ+GlSvXW+QSbErcSYt2ufNNnYqWJ78AnD/90rAY35gMrSkatVwJz1R
 Lr4hfQl+f+9jQ/xnercKbKQ0tlv8BIuAId9wXR5DsBdh6R2bYqLw8izC58h2uNHZrE5W
 JGUKVXqmKPeS2SQ7bBgM95TiTju8NigM2h5+wC00qaOy/ICoPS+GZGVW6wAPMuevuqmY
 jgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684962771; x=1687554771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zT/HDg/gBVolXCcggpB7iSC/DWvpNoZ2VGMNWSuR74=;
 b=a79lI72AE2fB8RLNGCZY9xH8el1O8mU3WjsdrTlRKYzphL/wkF5vv5susz+6ZNy+5n
 kLmgY1GgxCeMvGSs2hVraEbftseiNELOhtHoa+9pqKgATD2KRSdbwElpXwUHJp3Dw+eC
 GbDLxQAv/9YRvBMGuIIRkWHWN0+hyBZvF0pqJ6/QiwhX9XVqx+B41mgkKIIaO5O1HgdK
 lKPxPLZn/qKKAZOtkokrkWyT4pTkwROyfpInmhKsMfZU65NU7Pl6Ufr5QsBQPnL0dLGp
 Yi2RqHUEmVkaKt66pV9MhQWwYkw4JjIs7fMjTtd/wu8c+SGx5lZsO4UvfYbG4IgSmjWZ
 fkwQ==
X-Gm-Message-State: AC+VfDzpVSoUiEGZlu6VCgeo39dbusrYsXYvYWZAUfEdYC9cwDm1Mqh2
 x27GZb0sE9spWnT5o8BH22ggY2qxvaSkg/ea72nIPA==
X-Google-Smtp-Source: ACHHUZ5PVlgmDkUaggheQ9kq1zpCNNG/WvpI/zFjM6+9rZiEuRcJv3dN4QRqcRItX2BQQ3VJJ7rOlQJYb3u3SyZXEqE=
X-Received: by 2002:a05:6e02:2196:b0:337:8a1b:b9ee with SMTP id
 j22-20020a056e02219600b003378a1bb9eemr66790ila.14.1684962770819; Wed, 24 May
 2023 14:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524072816.1131039-1-yangcong5@huaqin.corp-partner.google.com>
 <20230524072816.1131039-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230524072816.1131039-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 May 2023 14:12:36 -0700
Message-ID: <CAD=FV=UXD7EKkfghpGWp9ziB8DX-RbUzs+zOex9trRT4J-f+Yg@mail.gmail.com>
Subject: Re: [v2 1/4] drm/panel: Support for Starry-himax83102-j02 TDDI
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 12:28=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The Starry-himax83102-j02 is a 10.51" WUXGA TFT panel. which fits in nice=
ly
> with the existing panel-boe-tv101wum-nl6 driver. From the datasheet[1], M=
IPI
> needs to keep the LP11 state before the lcm_reset pin is pulled high, so
> increase lp11_before_reset flag.
>
> [1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_S=
equence
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu=
/drm/panel/panel-boe-tv101wum-nl6.c
> index f5a6046f1d19..5c8ec263e11f 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -76,6 +76,75 @@ struct panel_init_cmd {
>         .len =3D sizeof((char[]){__VA_ARGS__}), \
>         .data =3D (char[]){__VA_ARGS__} }
>
> +static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] =3D =
{

nit: Please have the order of the tables match the order they're
referenced. That means this should come _after_
"starry_qfh032011_53g_init_cmd", not at the start of the tables.


-Doug
