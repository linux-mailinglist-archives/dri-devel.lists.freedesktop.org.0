Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AF4AF47A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8C10E258;
	Wed,  9 Feb 2022 14:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59410E258
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:54:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21F9CB821F7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C26C340F2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644418495;
 bh=x3KYHTnQdcpuPpSms1usX2LA7bATNpiYgyATB3QLAbc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DP8bgKOIhroqVt4vja7HreRX2JRYYft7GhrG1w+t9B6isH/MkkvyTg5+SG1Yush54
 vlluQal/lOUpBfY3ljkUOMQi1GyeS0zQtB4uB4Gwa/AWP4T5SwNJ69D4yAEDD6mYT2
 JXAvDi4PQs7+a+/vxVu/f2QtZivrpKjhdRlYj9zNgXQrI02PhH6fjwWwfxAJFGuh20
 dkeExW4jcOlFPZK7/L9c5bWjS7822u3pMYOmx3/nAQJNX8iPS4rCES+arZNCXdSe2z
 XLv/JVtJHu/woigCybi0kThymkgMkqy7oBHZa7wlsHFOlw2Q8vjEbBGt7HKj32eByY
 xxT1uZ/gweetQ==
Received: by mail-ej1-f50.google.com with SMTP id u20so3787676ejx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:54:55 -0800 (PST)
X-Gm-Message-State: AOAM532DnE16yA0yhgeOSHatWD24uaV2pOYHm3C1CpqzLngTDM3G+FdJ
 DQDyOrubpzI0lbbHEx2DAulyxUjyZ51Y/FCcbA==
X-Google-Smtp-Source: ABdhPJw1d9C+p2auPNdEqgcaTp3i90UkTDIFvXwjsigycoG7QKqrkkRdCImb6AEMWNRJXL/DDV7TXXvY/uMqwA6Xo28=
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr2266508ejc.638.1644418493696; 
 Wed, 09 Feb 2022 06:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-3-nancy.lin@mediatek.com>
In-Reply-To: <20220110084645.31191-3-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Feb 2022 22:54:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3ekRhHcs0QstWMe9hE7X041zwjQeGcRhDq5gavBhPRw@mail.gmail.com>
Message-ID: <CAAOTY_-3ekRhHcs0QstWMe9hE7X041zwjQeGcRhDq5gavBhPRw@mail.gmail.com>
Subject: Re: [PATCH v11 02/22] dt-bindings: mediatek: add vdosys1 MERGE
 property for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2022=E5=B9=B41=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> MT8195 vdosys1 merge1 to merge4 have HW mute function.
> Add MERGE additional mute property description.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,merge.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index 28be8ffeb429..f5b1e632bcd5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -61,6 +61,10 @@ properties:
>        command to SMI to speed up the data rate.
>      type: boolean
>
> +  mediatek,merge-mute:
> +    description: Support mute function. Mute the content of merge output=
.
> +    type: boolean
> +
>    mediatek,gce-client-reg:
>      description:
>        The register of client driver can be configured by gce with 4 argu=
ments
> --
> 2.18.0
>
