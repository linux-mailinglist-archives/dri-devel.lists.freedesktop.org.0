Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBE4E6B17
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 00:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D847510E513;
	Thu, 24 Mar 2022 23:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7310E513
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:15:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F61F616B6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A897C36AE2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648163712;
 bh=ckTJEKigpY+eu0JTgwgWvS6wzON59bVuE9V7034OPdc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b2XuZIe/a7pkKo2m+S29hZV+mEMNnVMglfj8CohTXB7NdepAd6uCaQwNsmjsem/Ne
 w5BaQiCLegtVH718uJlq9GuTGm+xmBzzmqmsfirxB7biHkKOKjNaZVf09f6R9/kmOm
 f6cMxJHiWquSWGkdUr3ICuiNo8he20Rxuqvmma7bjIRSUC+4wGYwiyf1rvSi2vxm59
 cSNq0B3dmOafbK3E5CRV0v53gyfH6EXbjc2Lj71mM3JQwT/MUNxBupulqjlGwQa6gQ
 DniBZ9TE2zMU1Kw+IqjAWNV8kHahrrBkR8xixHJiwCt+yXyxEMR0vqahg6jtjE44N2
 v9l9bURsbN5IA==
Received: by mail-ej1-f45.google.com with SMTP id yy13so12162812ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 16:15:12 -0700 (PDT)
X-Gm-Message-State: AOAM532MZwo3jW0DbVNMeRfQ2P7t55jiE6lQelZqDGVihW0FIxAkpsNt
 8c2+I4ztmh9xjXRHofXoqBco1IOXb9atcQioQA==
X-Google-Smtp-Source: ABdhPJxKQ+GUAfTSv+v5vd5biUuYyT7Mv4BjtPfnSH6OwMAmzTlhN+xxIVyrfZcLJWvLxwYIfCrkIEk+jiczQbjvm1Q=
X-Received: by 2002:a17:906:a20c:b0:6ce:a87e:5013 with SMTP id
 r12-20020a170906a20c00b006cea87e5013mr8101087ejy.379.1648163710672; Thu, 24
 Mar 2022 16:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220324152658.1132110-1-clabbe@baylibre.com>
In-Reply-To: <20220324152658.1132110-1-clabbe@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 25 Mar 2022 07:15:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9iXe5s7+1UmWjz7Q+DwCUTY1OEE3CUhFXj3GtHvA+T1A@mail.gmail.com>
Message-ID: <CAAOTY_9iXe5s7+1UmWjz7Q+DwCUTY1OEE3CUhFXj3GtHvA+T1A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: Add includes on examples
To: Corentin Labbe <clabbe@baylibre.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, krzk+dt@kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Corentin:

I've applied Jason's series [1] to my tree [2], does that series fix
your problem?

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D6218=
99
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

Corentin Labbe <clabbe@baylibre.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:27=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> make dt_binding_check fail on lot of mediatek bindings due to missing
> includes.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> 2 files remains to be fixed, but their examples use some variable undefin=
ed, so I cannot do anything:
> - display/mediatek/mediatek,ethdr.yaml
> - display/mediatek/mediatek,merge.yaml
>
>  .../display/mediatek/mediatek,aal.yaml        |   4 +
>  .../display/mediatek/mediatek,ccorr.yaml      |   4 +
>  .../display/mediatek/mediatek,color.yaml      |   4 +
>  .../display/mediatek/mediatek,dither.yaml     |   4 +
>  .../display/mediatek/mediatek,dsc.yaml        |   4 +
>  .../display/mediatek/mediatek,gamma.yaml      |   4 +
>  .../display/mediatek/mediatek,mutex.yaml      |   4 +
>  .../display/mediatek/mediatek,od.yaml         |   1 +
>  .../display/mediatek/mediatek,ovl-2l.yaml     |   5 +
>  .../display/mediatek/mediatek,ovl.yaml        |   5 +
>  .../display/mediatek/mediatek,postmask.yaml   |   4 +
>  .../display/mediatek/mediatek,rdma.yaml       |   5 +
>  .../display/mediatek/mediatek,split.yaml      |   3 +
>  .../display/mediatek/mediatek,ufoe.yaml       |   3 +
>  .../display/mediatek/mediatek,wdma.yaml       |   5 +
>  17 files changed, 59 insertions(+), 257 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 225f9dd726d2..63755d4d21d7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -66,6 +66,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      aal@14015000 {
>          compatible =3D "mediatek,mt8173-disp-aal";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 6894b6999412..b32355b32dfa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -65,6 +65,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8183-power.h>
>
>      ccorr0: ccorr@1400f000 {
>          compatible =3D "mediatek,mt8183-disp-ccorr";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index bc83155b3b4c..ffdef0b30de8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -75,6 +75,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      color0: color@14013000 {
>          compatible =3D "mediatek,mt8173-disp-color";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 9d89297f5f1d..7ac58022a2ed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -65,6 +65,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8183-power.h>
>
>      dither0: dither@14012000 {
>          compatible =3D "mediatek,mt8183-disp-dither";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> index 1ec083eff824..1ab30b0efffe 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -60,6 +60,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
>
>      dsc0: disp_dsc_wrap@1c009000 {
>          compatible =3D "mediatek,mt8195-disp-dsc";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index 247baad147b3..4f8ba492dc0a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -66,6 +66,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      gamma@14016000 {
>          compatible =3D "mediatek,mt8173-disp-gamma";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> index 6eca525eced0..ad3a69d1254c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -71,6 +71,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      mutex: mutex@14020000 {
>          compatible =3D "mediatek,mt8173-disp-mutex";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.ya=
ml
> index 7519db315217..1f92566ff5ed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -45,6 +45,7 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
>
>      od@14023000 {
>          compatible =3D "mediatek,mt8173-disp-od";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,o=
vl-2l.yaml
> index e3cef99d0f98..e810e152404a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.=
yaml
> @@ -66,6 +66,11 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +    #include <dt-bindings/power/mt8183-power.h>
>
>      ovl_2l0: ovl@14009000 {
>          compatible =3D "mediatek,mt8183-disp-ovl-2l";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 93d5c68a2dbd..14673f979edc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -81,6 +81,11 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      ovl0: ovl@1400c000 {
>          compatible =3D "mediatek,mt8173-disp-ovl";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index 6ac1da2e8871..d0d45d1e4f15 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -58,6 +58,10 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/gce/mt8192-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8192-power.h>
>
>      postmask0: postmask@1400d000 {
>          compatible =3D "mediatek,mt8192-disp-postmask";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index b56e22fbcd52..2265fef6a795 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -94,6 +94,11 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      rdma0: rdma@1400e000 {
>          compatible =3D "mediatek,mt8173-disp-rdma";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,sp=
lit.yaml
> index 4f08e89c1067..83e6cb40ba7c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> @@ -49,6 +49,9 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      split0: split@14018000 {
>          compatible =3D "mediatek,mt8173-disp-split";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufo=
e.yaml
> index 6e8748529e73..69cddc2ee531 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.ya=
ml
> @@ -51,6 +51,9 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      ufoe@1401a000 {
>          compatible =3D "mediatek,mt8173-disp-ufoe";
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> index f9f00a518edf..60e9f890ebf1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -64,6 +64,11 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      wdma0: wdma@14011000 {
>          compatible =3D "mediatek,mt8173-disp-wdma";
> --
> 2.34.1
>
