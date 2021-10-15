Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C5942FEF7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 01:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38396EE0A;
	Fri, 15 Oct 2021 23:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A856EE0A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:42:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D776120A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634341324;
 bh=s/EKmy4kdrec5wksozYJUijeVa7Z4VkDJ4Jz3S63i6g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HWOTazNEmWXmflTU4ywm4CJw1r7kVV8XwRuOJUSLHV3/5S7I8jMMvszvF2fC5WQXP
 z/YkyJWuLWvOsTubnysoIbdN57ujTVO1zHTqsZk8VdtA8X1kdyCiJI3gGc5JW6VXvt
 6f0OBhDeghrUvlIfp+UEJcBOwa77RtvmwNO6HHiyYOYAUrowh9OP54zS7yZRxULQDl
 OELv3W3zuIiXeWLUGJrl1UktkFRlQZLTkO+v0ouffDDX/X7X8CSnENIYaq0h/c64Yb
 ckT6TWzW3OOvL83u6wVvrX6CKWbKx7ncUbWsa3EoX0XriCow02rV4zqV/s8JtWicJT
 nuYFlVOyGJwCg==
Received: by mail-ed1-f53.google.com with SMTP id r18so44080424edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:42:04 -0700 (PDT)
X-Gm-Message-State: AOAM533CbZbGzFOf1ZePGAEGQVALQU8L98X+1BDi9fauPpRr8eR//xQ5
 SKrtiEEFsfT4tsG/QwYrZFhsi5/o79jRe/e66A==
X-Google-Smtp-Source: ABdhPJyifvWmqLk+jf2zlKQO8auioR0IRMCDcZBa/PLm7kRW/yXYG9c21iyijoGl/XAXZ85nuyr2xQmP2KuizDr574k=
X-Received: by 2002:a50:9993:: with SMTP id m19mr21431023edb.357.1634341323225; 
 Fri, 15 Oct 2021 16:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-5-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-5-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Oct 2021 07:41:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-9JdZfzF49E81Z046w=t0wDW7DScsVQQ2-L72mLXbjdg@mail.gmail.com>
Message-ID: <CAAOTY_-9JdZfzF49E81Z046w=t0wDW7DScsVQQ2-L72mLXbjdg@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add vdosys1 reset control bit for MT8195 platform.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindi=
ngs/reset/mt8195-resets.h
> index a26bccc8b957..aab8d74496a6 100644
> --- a/include/dt-bindings/reset/mt8195-resets.h
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -26,4 +26,16 @@
>
>  #define MT8195_TOPRGU_SW_RST_NUM               16
>
> +/* VDOSYS1 */
> +#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC          25
> +#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC          26
> +#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC          27
> +#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC          28
> +#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC          29
> +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC     51
> +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC     52
> +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC     53
> +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC     54
> +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC      55
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> --
> 2.18.0
>
