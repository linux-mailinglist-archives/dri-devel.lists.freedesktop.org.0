Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977077592D6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AAC10E457;
	Wed, 19 Jul 2023 10:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA710E458
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:24:50 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3476c902f2aso33453815ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689762289; x=1692354289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9ZDAcRcEb4EcOQItHJdczS495JLkwEqfSdpm/d3I5s=;
 b=eeUXFsNC6JkS1yWsEnlbibzVOaUw4iyaw9+9IEMNq2UipZPdVXpIO5CNDZTEWkOfsi
 hQN97Bi5G+ajQRqNVN3jCFvB/BpFl29KTazHH2u6FPf2Q9iLcRaKbjhYwlRwAwDNlFdr
 YHypId86jhjCihxQ4RkjS+LvUBZRA+y3CkQBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762289; x=1692354289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9ZDAcRcEb4EcOQItHJdczS495JLkwEqfSdpm/d3I5s=;
 b=KXQDG3qslYRmyPAFjSWB4ymQ/QtmYEr2XsLdgAZZ4toYgn6pS3DFJOiEhGp0xIQw8+
 MgpJ4Ws+Tmv1FjHnCkuZ6kXbdKx0m8BNp/FbJbh6H6WbggZ/szh4gc8YTM58AWjQl4jn
 12BIN6/ye+DUEtNBRfdoaD4bxO/nVaUMlEezNwO5IjKy2AAdsaE76CPbzPYVSAbLTFpw
 qZv28Bfj1Yq9AwlVA1/3Dm8hJb3mZlBFlyf9brlZZxEvVA7fz3N0T0etDOSln8s5uyS3
 udCVjSIQR0fE4GcZXnvj3k4ve6ukimsSv385YavN2s8m0Z7QzLweAp+juFtdI1R2gTW6
 hXXg==
X-Gm-Message-State: ABy/qLYk/5R+lRB4pbzgGvjw+8qZEPw1biPb6yyJ0VH2p48DQrPDbP6v
 YgM0leeLpxsJktMoslEDVoDWAUN70W/zmKymmPI=
X-Google-Smtp-Source: APBJJlEt4UPBWLzXf9GVbtqGUrpXftndhonehlqagBd7emxlGMru2hRASr4dxahvpo96ei9y48tdoA==
X-Received: by 2002:a05:6e02:1d0d:b0:32a:b644:af65 with SMTP id
 i13-20020a056e021d0d00b0032ab644af65mr5522215ila.7.1689762288904; 
 Wed, 19 Jul 2023 03:24:48 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51]) by smtp.gmail.com with ESMTPSA id
 d2-20020a92d5c2000000b003488fd8d2ccsm1313668ilq.33.2023.07.19.03.24.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:24:48 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-78666994bc2so318444439f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:24:48 -0700 (PDT)
X-Received: by 2002:a5e:950a:0:b0:787:1568:5df7 with SMTP id
 r10-20020a5e950a000000b0078715685df7mr5145284ioj.9.1689762287751; Wed, 19 Jul
 2023 03:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:24:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguPCc8HUkWqNQgBWzNNaq83q7UdTdbv1i5_jH2ZZy4eA@mail.gmail.com>
Message-ID: <CAC=S1nguPCc8HUkWqNQgBWzNNaq83q7UdTdbv1i5_jH2ZZy4eA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new()
 void callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The .remove() callback cannot fail: switch to .remove_new() and
> change mtk_dpi_remove() to void.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
