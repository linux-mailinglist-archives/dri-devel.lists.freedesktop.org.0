Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCD6A1972
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5910E76D;
	Fri, 24 Feb 2023 10:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7D10E76D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:04:20 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id d7so15022990vsj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cvk5wpFc0DKAQZ00qghhmUCCY/U6r1q0rqg+NhQNPzA=;
 b=cFMugqChQXL7ym79hnpjF2hy0qq6heDITVRFQzF1T1+HR4BxaalKvPgMUPnCRgc2zX
 K1aVXJYjdC2pMFkdGMfIO8PLYW8/FdHp58Gd909cvpu1zA9uWb65c/7iUrbp/K39tbWh
 kIyW+EGGp+t7Iq7ObQSH+ZZNR054KabiSeNLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cvk5wpFc0DKAQZ00qghhmUCCY/U6r1q0rqg+NhQNPzA=;
 b=JZ/ShjKF4hGv0VKlauYStXjMY4xLoMHa7/jzDr1Ain8eTrWR1TMHQUbvnKEgtC8Ilf
 yvU27mh0GgRowdUwdlx5kQtgKjAfe4UmukNr3SIHBGOXoCzEINONajuSgnJscDKT9bY+
 k5HYij+Bya+IiBIU/jQ/7bx5G9Th1nxNo370teaApZH8/D4gV3NnTYcsCcB5ZuJHo8Tw
 Y6BX/T0Bd/sRVi4XuLblLZc0L5DkKSLKjOlHwJUg5fTg3nZckXsV6yPbV4ci/OBihH5I
 rHNA7NjewsdDrH4sWJT6Mgdn2nrkvV3thSyeyxX+H03yiPBZuLypUImAmCWh0KUWplgb
 b2FQ==
X-Gm-Message-State: AO0yUKUCqJu0rz1Zm0su520Fco3YTe+glg4qkcvqKyFXDrdI2anWi4HA
 5OUeq7TWgMEnZp99If1k6/VL6EM4MSYjOGXYP8KR9A==
X-Google-Smtp-Source: AK7set8sv/uOez4Rc/C6TZ50n1VhpLKNUw7QlrbXGvX7eDuYw8eujWp0Kc33QvhtJcEfRx7ZMOIkuYwOnR4Jt0xVR7Q=
X-Received: by 2002:a1f:41c8:0:b0:404:d819:960b with SMTP id
 o191-20020a1f41c8000000b00404d819960bmr2200097vka.0.1677233059185; Fri, 24
 Feb 2023 02:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:04:08 +0800
Message-ID: <CAGXv+5FV-Y_gaVNZ9s_9y+F5HLE799vVJ8bJyx-JZiPXhAFVwg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/panfrost: Add mediatek,
 mt8192-mali compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit description]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
