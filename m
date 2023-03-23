Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8F6C7402
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 00:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4E510E233;
	Thu, 23 Mar 2023 23:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834610E233
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 23:25:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0F47B8228C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 23:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05D1C433A4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679613929;
 bh=4Ynyp+S9BGcwrttvmGqGTVkG9UhEwnTOcUptS58xcI4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sP5/ZKwa6Umt3kpD6VyvTT5hdhT4RW6gecV7Vz2a8Hqr43gxXegzTHsSG5bZ9cdS1
 8Avk7eaLemhg9arURoRRBA8xH9YAqtLRirB6sKeIbzqU569YuKIxSQNopXfhWXA93M
 xwHTc6ZmxBioqxLf+5QehjpHEsX/GHIz5BVJzJ9DiqDmbA536QVV0L+vgDIFnigRRw
 /xyEykUNJEsxMwS1fm6oouxJ8JjxYeh0DWK6Jsbe7jU6dNh/jnebq0EBKIgCJ3XsPB
 K5diqlp12n+NkBvuzopEMNswpJcG15XKO0TxntF8XtSmAOFKL96GMhndDAyr37wOKs
 JP6U6VbrV9z9w==
Received: by mail-lf1-f41.google.com with SMTP id s8so8572lfr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 16:25:28 -0700 (PDT)
X-Gm-Message-State: AAQBX9ekXBQ7iue9hGIX5iN5KbHv0A5Zuw6XPLNuZq3xQo57vjJR0UGN
 tTjoy6GdX36HdYi6q9m/c8/K0xcN4Iamc2a66Q==
X-Google-Smtp-Source: AKy350bWHhQk1T3i2SqgUwf/TTiR6ou0itybGLCJUXytufGSnho4rPHLFcQzemcdLX6NIoPVcTsCovZ4emivLFiFZb4=
X-Received: by 2002:ac2:5639:0:b0:4dd:9931:c555 with SMTP id
 b25-20020ac25639000000b004dd9931c555mr273032lff.0.1679613926916; Thu, 23 Mar
 2023 16:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
In-Reply-To: <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Mar 2023 07:25:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
Message-ID: <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 singo.chang@mediatek.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, clang-built-linux@googlegroups.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:5=
8=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > The hardware path of vdosys1 with DPTx output need to go through by sev=
eral modules, such as, OVL_ADAPTOR and MERGE.
> >
> > Add DRM and these modules support by the patches below:
> >
>
> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> Green light from me.

I'm curious about how you build code and test on Chromebooks. Do you
build in cros environment or pure linux
(https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13).
I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
upstream kernel on it. cros is too heavy for me and I doubt I could
use it. I've tried the pure linux and could boot up with console, but
display does not work. If you use the pure linux environment, could
you share how it works?

Regards,
Chun-Kuang.

>
> Chun-Kuang, can you please pick it?
>
> Thanks!
> Angelo
>
