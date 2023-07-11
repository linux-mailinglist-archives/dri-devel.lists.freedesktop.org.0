Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6974E74A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311810E31A;
	Tue, 11 Jul 2023 06:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E17610E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:26:47 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-44358c019ddso1931863137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689056806; x=1691648806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
 b=nyo7b8JUKucVpxKbuCSJWPvAy9IJS992EYaGTOp4pauROAkEi4BbSwZ8X4mKR5dykP
 z/rqCAb549jGVwSoP8UDDnanb2sVGoXGjR0LJ1zs95zPkOUmZJY6C3M7VskQlBZMOiqB
 IX2QiEPYdgmHU0PWqRDw/0fxZumkEcl+rcTFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689056806; x=1691648806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
 b=ejqIaj+ei7GjYRu4PePy0Rs4k4DcyzM+p1JN4SH7mVWr3u/nSALt4eH7oDfGktoH7D
 OBejhnlL5pmjT1HnLpN4fLGfMpr7uy4BxwkhiI9h4Jtsl7dBnzYdbcARJz1L/FnYlC5i
 Nh8M1D8DNsfgmPpXGgHLb+dzgI4py+1oiRcCuromlAFgbYX+4PVIuOAUOqtLabZwim/T
 SLbuzarLhhD9bVYjU4xZHnfJzm7Ds8nrHaEVK+JJbZKVlRwV+dE7DuYGzwtOkRoxSvpJ
 7AzJiH9KsGrZXHqelLq57D/nQ0WZFf/9bzN9h5L63Rj1b4/NEubggr5LlTZwC167mejG
 U1xQ==
X-Gm-Message-State: ABy/qLaxlqU3eOxDlJSqxyhxV9OBmA2deFJ/hO+weo16eBF1XtB7uQ67
 CD2pcSeZiQIusVmTOq8KBqBsWqSgRur1m4Zg8GYF3Q==
X-Google-Smtp-Source: APBJJlHMaEnbxmt4E425Igz5HGD3wCNh0BoMyvBAaMvai+Tv83dzAu4AeO63cdOGIykZU4jOxYPixceOqCzy6e8qkLQ=
X-Received: by 2002:a67:f851:0:b0:443:66c5:a4e3 with SMTP id
 b17-20020a67f851000000b0044366c5a4e3mr7465305vsp.15.1689056806767; Mon, 10
 Jul 2023 23:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Jul 2023 14:26:35 +0800
Message-ID: <CAGXv+5FcBapQSOQUU6c00Jirx+Zn9KADP2cEj9WZSs_ABiCm9g@mail.gmail.com>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 2:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Negative -EINVAL was intended instead of positive EINVAL.
>
> Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
