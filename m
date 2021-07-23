Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6AF3D392F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E676FADA;
	Fri, 23 Jul 2021 11:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073516FADA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:10:27 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so686768ott.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItsRsZ0+rGylQYA+RELfRwpVcM273u0/L6xue3YIFTA=;
 b=mgZxllDJunjoK3CtlARUlfLQNAlHIMceNdssna93H1gvGsVkjbKCjeXwfaKALFHizP
 +Y1XZcKvjH1iQnJ0/Ky5KHtTGpXSvz9a4yB31+JlI9uF3CHnUEVO1K2oEON+GxU4rCkI
 L0wstpPWTGcGN3ukpI4x1nmdMQaYvvW8wHQbsFxP47E/bxFXJ4AF5QvtFeKtSnuJBKfg
 MjUE2uePwDC+tZXum5IbjSHP8qOVpr5oXCFRJaxZXEyyxD8GK7q7EeAoC/fzug6goK73
 mGfo5Lz8KQNUMm3jwzRPh5K0HgVo8KfnWG58LKxGV0f2KFcDCBE0PMNzrJHv6r/LAKNh
 fCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItsRsZ0+rGylQYA+RELfRwpVcM273u0/L6xue3YIFTA=;
 b=Kn9Q1t6Y3QiZMBUrFzaDWYOXMitG94BaC+DDEcnihG1Au4apiSoLaqJA7w2h8TFphA
 ZVoxWERTgWz6y7HNNi+9t+yz95wvnMrQj4Ry0Q/SeI1MkpINvDsWp/KdUHwc5YV+LFPu
 JqJNqxvv4hWWuEB6eI+ChYMv9gLhFe8aI6ox77LsIXjwGUHDMZXxx1t8jCHrGYRbzRRY
 uwQyrdQ9cdOa3xSQtCGAYcepEN3FikZfbnOw3j4NcsA9Jp35Hff3kLS4Iua39Z4GXoWm
 e6qyR+WLqdrNTW1lc6OqfAVYCxPoX7zZKURS/B6C1IfcNwd303YBiUppdwVxO5K+G3gQ
 HJDw==
X-Gm-Message-State: AOAM530UJFp3+UOnx5uhmRwuJxf1DgO7oM6Edn83K2Ic8U0lMRhodun6
 k2xUAiS9isT4aKOSgpxPP3C2Bpt+TxQCJdjQY0g=
X-Google-Smtp-Source: ABdhPJyTbyPS7OPxgzkKeQ0xejJgwTXa3EwT7cNdLuCl25tp5G3mArCVKEQZIg8TwboZwxHRabaGbXKTcoVEzwUnzvo=
X-Received: by 2002:a9d:491:: with SMTP id 17mr2724546otm.184.1627038626371;
 Fri, 23 Jul 2021 04:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-5-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-5-nancy.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:10:14 +0200
Message-ID: <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: reset: mt8195: Move reset
 controller constants into common location
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nancy,

Thank you for your patch

Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de jul.
2021 a les 11:46:
>
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
>

I think that the patch that introduces mt8195-resets.h into the
reset-controller directory didn't land yet, please sync with the
author of that patch and just put it in the correct place the first
time.

Thanks,
  Enric

> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  include/dt-bindings/{reset-controller => reset}/mt8195-resets.h | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename include/dt-bindings/{reset-controller => reset}/mt8195-resets.h (100%)
>
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8195-resets.h
> rename to include/dt-bindings/reset/mt8195-resets.h
> --
> 2.18.0
>
