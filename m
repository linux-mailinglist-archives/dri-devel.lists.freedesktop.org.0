Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74C78E700
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 09:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDEA10E579;
	Thu, 31 Aug 2023 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D510E579
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 07:13:33 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7923ae72111so20723139f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693466013; x=1694070813;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0uJEXICar/m6wRe8rgnaCoFUj0NDUfeIIguEQQrQtA=;
 b=KbcfBGqPirB+Fp4mJvg3IhQP4uwqkqnFpBAMkr7l5GlX9Vw2tseqb1SX+vIRfDNLP7
 McMruD33KYGdYhmrBvhjOlal8869SXkIlVOOSjqnZ/74j+G648isuPYKYTOq0W9Xy8TI
 xMEKSKe9l7AOe5NfunJOleiXhYVyk/E0CXp4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693466013; x=1694070813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0uJEXICar/m6wRe8rgnaCoFUj0NDUfeIIguEQQrQtA=;
 b=c4uNiwok7P1vy8/fCYuMOfPwsAfZYa7ATVXlxhnc16KwqVdcy9uOaE2OYlEH9qEZ6N
 5N8h5vip3+gLTVSdqCKjcvHPZWm27Rj/ipJR8/11cjJmIu9O4OOfwhZrXtg9YiQtgrcY
 ga+LCAUFjN7HD7JJXRUVDzh0KmIwYbRtjd/Eo7JGgAq1H6xTAhhXBgHRdTijjv0vEOIk
 l7Sekq+bPhxBjsrdIjt/f6u5VrA53WstufeMkJ/lJsc/JF78IZy7mxz8Jypfga27tflK
 BGYuybPRZ9rTBHsp5lyLmOhY1NNl4aAI0olDsY+7L84e1yKPiljFLSyCHLR7pi/s3cOv
 5YCA==
X-Gm-Message-State: AOJu0Yz4P9cfGkiS5/I6i+gMUhQehhJ13dy3uamdCugSv8HBWGy2YXlT
 nb+fi0+9/JIVAN3FGnZHZN6CWqxANx1xzsyJtEk=
X-Google-Smtp-Source: AGHT+IFmoXveG2weqdTioVZ7n0scX55SmMr9bhQAxhZn6ttlKFKSvBcZ//NOtLZ6yMdLcTCRi9uMZA==
X-Received: by 2002:a6b:f015:0:b0:795:16b8:8607 with SMTP id
 w21-20020a6bf015000000b0079516b88607mr5092626ioc.0.1693466012858; 
 Thu, 31 Aug 2023 00:13:32 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43]) by smtp.gmail.com with ESMTPSA id
 p9-20020a0566380e8900b00430bb70004dsm240180jas.103.2023.08.31.00.13.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 00:13:32 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-79277cfc73bso20304139f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:13:32 -0700 (PDT)
X-Received: by 2002:a05:6602:2768:b0:783:4f8d:4484 with SMTP id
 l8-20020a056602276800b007834f8d4484mr4957838ioe.2.1693466011946; Thu, 31 Aug
 2023 00:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Aug 2023 16:12:55 +0900
X-Gmail-Original-Message-ID: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
Message-ID: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 10:27=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
