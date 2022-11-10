Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E2624370
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40BA10E7B4;
	Thu, 10 Nov 2022 13:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB310E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:42:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB76CB821E7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1679DC433C1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668087758;
 bh=4U7C9niDGrmfi8IMDATi6BtcBIfDiuOKvkxBiJpdV3w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SX98KqeYKns7KGfDa8dTp6G5wayF8iiATI9dVap4Wgzf6d34aTkI97ttMf366XE+1
 R2U/r9UCn8XAghsEFSpznVYcqr8O4mENHj6OsaLq+Fq6HN0VtBRF5F87Flp3fz7U9W
 nvj7W8/tSmA7L4xJk7dnUI98uInsIF93sAvIZzyrmOw4EtrC/VyKLAoiFVV/YaO0TE
 juhdMKkkNBetHZgQdRAht04cUd+m9+wVS6uPEhlXh6VGR8enutToxoBG4kAhDSNlp5
 DlWpLWUfxIYQqAAL+Tvyjtd7LpIsGuKzn/xSnrb8o9O8thutGRnRZK09gfgNgN9+Eq
 peEprHo4LiCow==
Received: by mail-ot1-f54.google.com with SMTP id
 94-20020a9d0067000000b0066c8d13a33dso1101920ota.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:42:38 -0800 (PST)
X-Gm-Message-State: ANoB5pm6U9ei+9UFxP+8iUladH7BviZEFPWOW1Mqo8hB23HWM/8ZHxTP
 Y8GTWcVq0SuxmSZQNZpO5kqertcOi9K/+CgZiA==
X-Google-Smtp-Source: AA0mqf4gARCZUERKvwgaAfgdC1LEqRRi5pu66mk1Uqd2ev+ik8AG7xmvItT3O8MQpM0VXWbeKoELJNlYq11nhVFHllU=
X-Received: by 2002:a9d:58c3:0:b0:66d:2f7d:2a68 with SMTP id
 s3-20020a9d58c3000000b0066d2f7d2a68mr4817252oth.40.1668087757150; Thu, 10 Nov
 2022 05:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-7-jason-jh.lin@mediatek.com>
 <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
In-Reply-To: <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Nov 2022 21:42:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__vvjKASUJAGOvL=-WnAq-ji7sfyEEY7j49ty0P7Svvdw@mail.gmail.com>
Message-ID: <CAAOTY__vvjKASUJAGOvL=-WnAq-ji7sfyEEY7j49ty0P7Svvdw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2022=E5=B9=B411=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A7:25=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
>
>
> On 27/09/2022 17:27, Jason-JH.Lin wrote:
> > After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> > mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Chun-Kuan, I understand you will take this patch through your tree as it =
depends
> on DRM changes. We can also sync so that I take it once you merged the re=
st of
> the series. Having vdosys1 series around maybe that's better to avoid mer=
ge
> problems.

Hi, Matthias:

I do not hurry to merge patches. To prevent merge conflict, let's
merge step by step.
The drm patches depend on binding document patch, so I would wait for
binding document merged.
After drm patch merged, you could merge this patch.

vdosys1 patches depend on vdosys0 patches, so just let it around.

Regards,
Chun-Kuang.

>
> Regards,
> Matthias
>
> > ---
> >   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc=
/mediatek/mtk-mmsys.h
> > index d2b02bb43768..16ac0e5847f0 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
> >       DDP_COMPONENT_CCORR,
> >       DDP_COMPONENT_COLOR0,
> >       DDP_COMPONENT_COLOR1,
> > -     DDP_COMPONENT_DITHER,
> > -     DDP_COMPONENT_DITHER0 =3D DDP_COMPONENT_DITHER,
> > +     DDP_COMPONENT_DITHER0,
> >       DDP_COMPONENT_DITHER1,
> >       DDP_COMPONENT_DP_INTF0,
> >       DDP_COMPONENT_DP_INTF1,
