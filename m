Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D950C4C4AC0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8D10E4F1;
	Fri, 25 Feb 2022 16:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241FF10E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:30:30 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so6770892oop.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 08:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1wkrFjytm/bfyZ688DRYD5WIyjqQECAVw3q7pHsvHsw=;
 b=zpMwq56ahOJzzTt0yyzjiDMg0X6CdtFtRv3CE/0cCk4DE0bGMu53o6c0/9SpVp1P3/
 FWs5puzizDkpFl2v+KM2yiV9X7fKUrQwrdkcW94sVIlOmONJwGJQBZszmab6pl5TTyeQ
 MC4pgqWuyCvQQjMUr+Vvt8J9ZGgpc21wGgM/SnUWVaDbOG1Qz1EDk2XYFEmUXIyspdJp
 2ktl7b8sPpriNV4tas6cSHl+S/EGSFbpNQaNFmgwbGy2qKv6m9c9E91GBrls/yITrhrm
 4aCVeuT0qyfCCetC9IFi2HkI5wjezc8Zr9waAm+XANnNs5cw8pzvaw+e9IhFUrCAfzn8
 OUqA==
X-Gm-Message-State: AOAM531AY/HMEeiweWqklb6iNC1KeB6b2/C0LyXYoOC5qPaZB88dzaxr
 5LkHN4PY4vkpIqF1SC5BeQ==
X-Google-Smtp-Source: ABdhPJxHnQhONryFwpvuU3O9cL+TRRiq/RY06mE2+ZgOVfuaaBUkDTiEOsd6KQFZQO00sR87pj5RBQ==
X-Received: by 2002:a05:6870:a552:b0:b5:6c53:b96b with SMTP id
 p18-20020a056870a55200b000b56c53b96bmr1705102oal.124.1645806629409; 
 Fri, 25 Feb 2022 08:30:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l20-20020a056820031400b0031cf5913126sm1241648ooe.36.2022.02.25.08.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:30:28 -0800 (PST)
Received: (nullmailer pid 1045540 invoked by uid 1000);
 Fri, 25 Feb 2022 16:30:26 -0000
Date: Fri, 25 Feb 2022 10:30:26 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v3, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
Message-ID: <YhkEIr/Jlky+5CZY@robh.at.kernel.org>
References: <20220217075758.11369-1-yunfei.dong@mediatek.com>
 <20220217075758.11369-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217075758.11369-2-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 15:57:52 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 51 +++++++++++++------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
