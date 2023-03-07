Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1366ADB08
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E58610E114;
	Tue,  7 Mar 2023 09:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464B810E114
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:53:36 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id f20so8450984uam.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5DlCuYa7/0gszYKTKl13EbxZ9aUeXgRvcmWQ1j6cpk=;
 b=iYVNJhITTewI0WpMkOykHA9MEJqLR9u5GxtRG70p5Zu/GSgLThwV/iZ8limQX6EPfM
 QsUNbKXXHV4j72gPV9NqqX/s7VJ+8MlE3JEPlKPZsPCh9I1iLiORTPTvoXJG0S3jK7Ed
 2g14iWOM2PvMqyYjxVBaV1NDiYlCAidKKmc4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5DlCuYa7/0gszYKTKl13EbxZ9aUeXgRvcmWQ1j6cpk=;
 b=vkcYbusYhifhavkrw0U2FLabObnuDpTKhrmtE/Xf3iUP/4x+aFePCNteAv6gMZmB1+
 QEAGbNofKGhZR1J4lC1oas+tssXe5wiwSlJQaBsh8S48BxnKS9vy1jqjS9STjua7rK1C
 0Vo/mCg8+gG/drBIBWkgsBDXfm7eX3h00umWTr6Y77XKpeXvTluTM91y93P0MNooddKj
 3smCkEDXzDAR5+DUkE/y4QlIqqulR6Ddj0mfNq6bOSBP4HmitbefWC0ilSpiEkBWQw1m
 6mEUUaPyVHfFk9Jhb2FDVCrtarVrRfN9JEMJ9tXh47FASKNTf+k4Hb2oeGg0scwuuoMa
 QT4Q==
X-Gm-Message-State: AO0yUKUyesNjXaFY3o+lzW5SZpcIjjrmBW/RVbMc0kw2Z8gu1w7kydqb
 WHkmZzM8GFlBmitDM4PQrarTjYDRagKw1t0bx9iIkA==
X-Google-Smtp-Source: AK7set+q9jiPd9ivFHGiyrKW+e476+Rr3GZq5Ktk/6QxdnYWJr3wJ1xgCC/Coq26W/IugJcUukY4aCFPLpWw0ND7HAI=
X-Received: by 2002:a1f:9dc2:0:b0:406:1fd2:bb76 with SMTP id
 g185-20020a1f9dc2000000b004061fd2bb76mr8622549vke.0.1678182815197; Tue, 07
 Mar 2023 01:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:24 +0800
Message-ID: <CAGXv+5G-2knqWMd9EtbAqXDwmRH+-ou0w__uXAXcfzyMoWdbRQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] drm/panfrost: Add mediatek,
 mt8192-mali compatible
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit descripti=
on]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
