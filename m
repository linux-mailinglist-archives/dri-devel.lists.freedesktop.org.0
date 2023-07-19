Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB157592C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4DB10E454;
	Wed, 19 Jul 2023 10:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1FE10E454
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:23:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7872d448c5aso361505639f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689762212; x=1692354212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahbeWucAcoOgJsJY2s8d1VaxXiv71GHKoX+Vccdy9XU=;
 b=V3OI5aI1CIhNEJc+LvuPAbnWlaSuHe4j3O7b/zeU5O7BX7EK34Hbda4eDlokVMarKd
 rezrzdYMwz871cIjBjzXffkBlL7upHcMN3+IK47349jzHAfLZJQxkQM93r+VAaRHxUNv
 dixuuU+Z0zX3V5wzXuOEqSp6PLT9m1hZ1I7pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762212; x=1692354212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahbeWucAcoOgJsJY2s8d1VaxXiv71GHKoX+Vccdy9XU=;
 b=hOunsp262C5HCu7SIpSbvhCOGz3DpQXZvltn4iXEvB5Ie6+cEydqp7z1gvI5EDaOI7
 FYReKWgt2DOg5rw6zSyAu2eWgxcJ65/5aokxrvlIYJCZGHWYFHrKBFr/ZvbuawdvuKHo
 pyMs0i2g8+IOX/BbUX1b4aoY0EeftzAqwoJYFJqkgkfXsQ7p79bpPSTfFabCphdAs7N1
 q9m5wQz2uO6mdEMT3o1Boz+hXGJDofEjZ+M6E4Iet8Relt3HFOqsl+9W3MjFWuoA9eom
 bBEQ6RtGfxWwzYWHQzOdXvxH19cXfniEo1Lab110oC3+yWo1qgjONcNSoQweUdU3pAHJ
 oMGQ==
X-Gm-Message-State: ABy/qLZXSGXyLq/H7QAAxvbOH1WLZM5eJ0hTczEYsaSzoVyXNC3RTHdY
 5oqbI6LC3mg7uGqmiafZ8XzrRyUR7WSP+/kILRg=
X-Google-Smtp-Source: APBJJlEy51B4qgXGPh1ee3VViUv5S9/dZG0oUH5uKwVzaGCMC25nHcKLnenswL9k6FeZG5iMSsTSNw==
X-Received: by 2002:a5e:8f08:0:b0:780:ce72:ac55 with SMTP id
 c8-20020a5e8f08000000b00780ce72ac55mr5030909iok.10.1689762212339; 
 Wed, 19 Jul 2023 03:23:32 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 eq26-20020a0566384e3a00b0039deb26853csm1189442jab.10.2023.07.19.03.23.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:23:32 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-78372b895d6so361163339f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:23:31 -0700 (PDT)
X-Received: by 2002:a05:6602:3314:b0:783:60f7:ade9 with SMTP id
 b20-20020a056602331400b0078360f7ade9mr1781762ioz.5.1689762211675; Wed, 19 Jul
 2023 03:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:22:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng+s5Fr_Evwct6E5yPZD8hN_NLYnx2sitrUWK3b4ti73g@mail.gmail.com>
Message-ID: <CAC=S1ng+s5Fr_Evwct6E5yPZD8hN_NLYnx2sitrUWK3b4ti73g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
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
> Change drm_bridge_add() to its devm variant to slightly simplify the
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
