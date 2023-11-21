Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DF7F3145
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 15:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34210E379;
	Tue, 21 Nov 2023 14:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A0910E379
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 14:40:54 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f938932bf0so1232383fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700577653; x=1701182453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:in-reply-to:references:user-agent:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImxWZyQw+OzqcqVpcmrRNXVgXf/9MkOc4lXvk9lNMHc=;
 b=V05fKoaAz2rdG8GnLFI5kpo5Fy+jjR7leWhYUz5tkWY/+tkNCYnvzCajNfIm8F21mA
 8KLvBKNk9SYf5sudieMVjdREhYfKE/mUvPrRpp9Aj9IgGiAAlsQAXYdHx/R7wdh35sIe
 KqW2YWUt2+SDL3VTQuMHjownI06wW12bhvTUlEOY1i1aJGEPq+9iImYOwbDjyhxKxK1y
 cS/OIZYr/PIH/yyP5YdJzVhV/rF9C44OTSK1CYrYmYHo9LLfP49SqW4CJjj5R0PS+Iv6
 vFvEchIIlTclD59VrJ3mawnO37002iwrEyjewQ6tbobddVniK0fKpZhphm20Xs7qnz+Q
 mwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700577653; x=1701182453;
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:in-reply-to:references:user-agent:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImxWZyQw+OzqcqVpcmrRNXVgXf/9MkOc4lXvk9lNMHc=;
 b=pTu8A1EowP4lE4CQxfW+a/KuF+/oh6sErxnq6CcUUaE34Lx6tw30P7p22DLmu/+cuk
 zKje9TDqy8ATAC8QE3e9r32pQ/dPspUXRu/ay+wdxehz67myQpEXQ9YqVt+HUxETizRk
 95zPOaO35OPlCOhKjHXRMI4XB3i7E2wBoiDnOxfPYE8Jl4PwSai0viCS3OQDrQv8HREU
 aUyVJTkEOJMGVhaONAhmiv2Ae/dLlfeakXjhvI6FCIj4NnYtQz28cXK3zNZtF1WY5JXn
 emdWWzQQSlbXSLc8VNPIpIevFRHyI+vHwE87zSDUC7qcNLaHaOuWNWsz4uddRgqkH4RD
 Sw/Q==
X-Gm-Message-State: AOJu0YzrcROr31qkdn6C/p3b02HwN6BZmf+3rRADRFLBn93wVMr5CLSb
 hKzAdPa5oXsSUKP6rxNgL0cCyqVBAVk/zjfI+uajAA==
X-Google-Smtp-Source: AGHT+IEMmr6OYDSX2nS5vNaDx2wFqAkHqsQ/xko6HAJB9cs9kRZI2B37yAeB6rBMLaCK23pkXxmz2pO5+KzJ323xLhs=
X-Received: by 2002:a05:6870:3b85:b0:1f9:36fe:fd0e with SMTP id
 gi5-20020a0568703b8500b001f936fefd0emr5880414oab.47.1700577652158; Tue, 21
 Nov 2023 06:40:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Nov 2023 06:40:51 -0800
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.3
References: <20231121142938.460846-1-nfraprado@collabora.com>
In-Reply-To: <20231121142938.460846-1-nfraprado@collabora.com>
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 06:40:51 -0800
Message-ID: <CABnWg9uqPc20F93GF_wF2_o4hq9zdAJtyoa8_iMyM8gc9owDXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as
 pre-dependency
To: =?UTF-8?B?TsOtIGNvbGFzIEYuIFIuIEEuIFByYWRv?= <nfraprado@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023 15:29, "N=C3=ADcolas F. R. A. Prado"
<nfraprado@collabora.com> wrote:
>The mtk_dp driver registers a phy device which is handled by the
>phy_mtk_dp driver and assumes that the phy probe will complete
>synchronously, proceeding to make use of functionality exposed by that
>driver right away. This assumption however is false when the phy driver
>is built as a module, causing the mtk_dp driver to fail probe in this
>case.
>
>Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
>ensure the phy module has been loaded before the dp, so that the phy
>probe happens synchrounously and the mtk_dp driver can probe
>successfully even with the phy driver built as a module.
>
>Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver=
")
>Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabo=
ra.com>
>
>---

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
>
>Changes in v2:
>- Added missing Suggested-by tag
>
> drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/=
mtk_dp.c
>index e4c16ba9902d..2136a596efa1 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylib=
re.com>");
> MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
> MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
> MODULE_LICENSE("GPL");
>+MODULE_SOFTDEP("pre: phy_mtk_dp");
>--
>2.42.1
>
