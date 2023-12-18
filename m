Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A874F817AF9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4A410E084;
	Mon, 18 Dec 2023 19:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0345710E278
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:27:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31FDFCE1138
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B02C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702910322;
 bh=kSzzS+rE3ZFEys64qw4zoAxJseoPrLHcYBpQolk4UeI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OLKOMdydbi6vyVhuOEDgdeX5gGnEoJCNZi1PkTEUWYWpp/b6ddUKbFq2O+Yneo5+O
 /BuXAQ5+QWgW+oOfUZjE6aRujhz5uiXERoAdmu/dmvueV6u5LtQnQa+5tEZeR0/1Wu
 Dbbqmt3/GTQtKP9MqNJoH7XkyINUAhO1/RlR62UcjlmO3HbgnoS7M1wqT9azJULsk7
 ehKKzlAfbp0j7y7550kXk4IGR0/8UP+89YRYhP4x9mMQbYda3pjN6ulj8Rsibo69x+
 7GcA0/w4BQeGKZBf+ju3QBuLhRHlYtbONRjBNCnBKmKWQqJYNDvbKCow4zP2K2Rtxz
 rSFEePnWh4BUQ==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50e18689828so3488589e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 06:38:42 -0800 (PST)
X-Gm-Message-State: AOJu0Yze/42OCPFduH/AlywcKF/zIiTsSDU20BdtqLCPJ6WaV6NoRF3X
 H/jzp8k/7EIAwpu/tFqIVo8F6myIP5/6UslkvA==
X-Google-Smtp-Source: AGHT+IFVvXy/HULTWkwoWcQfaNrNUCb4i1BcigWcwb36HZhNpUO1zDKEOTu4PVk3/ddgjO9u+X5Q9oQvmLo6pfDG8Dc=
X-Received: by 2002:a05:6512:3044:b0:50e:1daa:6705 with SMTP id
 b4-20020a056512304400b0050e1daa6705mr3478799lfb.6.1702910320486; Mon, 18 Dec
 2023 06:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20231121142938.460846-1-nfraprado@collabora.com>
In-Reply-To: <20231121142938.460846-1-nfraprado@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 Dec 2023 22:38:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9g-9qTaja6dV5uD4Gbjw3fusRVnmucUeKUYtMpreVORg@mail.gmail.com>
Message-ID: <CAAOTY_9g-9qTaja6dV5uD4Gbjw3fusRVnmucUeKUYtMpreVORg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as
 pre-dependency
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nicolas:

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> =E6=96=BC 2023=E5=B9=
=B411=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:29=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> The mtk_dp driver registers a phy device which is handled by the
> phy_mtk_dp driver and assumes that the phy probe will complete
> synchronously, proceeding to make use of functionality exposed by that
> driver right away. This assumption however is false when the phy driver
> is built as a module, causing the mtk_dp driver to fail probe in this
> case.
>
> Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
> ensure the phy module has been loaded before the dp, so that the phy
> probe happens synchrounously and the mtk_dp driver can probe
> successfully even with the phy driver built as a module.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> ---
>
> Changes in v2:
> - Added missing Suggested-by tag
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index e4c16ba9902d..2136a596efa1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@bayli=
bre.com>");
>  MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
>  MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
>  MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: phy_mtk_dp");
> --
> 2.42.1
>
