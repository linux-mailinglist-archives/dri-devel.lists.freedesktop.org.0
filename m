Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D973D47471E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 17:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836910E599;
	Tue, 14 Dec 2021 16:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8410E599
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 16:06:58 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso21365897otr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWeglYX86Kh/jx6qsj0rbVo/zA4v+6dDtBcJ8ZfP9I8=;
 b=q43uGIA+LMe0/K9wwyyyyyGDh9fS9IJDEXkXadt4uvlx5oXcZaOg54GeEuvN0eT/to
 zGuMQo15zYlVazqDQHSNTpPpRBLifn0fqOAT7aewTllW021L0Ngn5e2i6Uci/3JcPTqj
 MOPbgJhcAHSGUWY1XzHaJ/xm4tC1R7suz4t5Wl71C015kha0K+5BTWoeV1niiMTO8T0w
 RY0wM4upjQRy1152udqWXuiv3PM/TucQJPL6hs4Xxiqg/vEV05Lr6Rxcn/24NrudhNjL
 j/Gy1UAvlOtq9BFzUPBHqFc5dkydYIeuZDaLLFnA0UCth2kNvRDd4c5SafjlzBDtKHCi
 ALJQ==
X-Gm-Message-State: AOAM530K32juOegWfrGhF9c5cAyN5/ZwWIYfanZnOeJhcJfiRCgvy8Tg
 s3o1QnZKEMTuvrL336gsXg==
X-Google-Smtp-Source: ABdhPJzkIOmtEo5hn0+hMuoG7HvhDOIIqOzzWYSglSMtBtWvqRjpOAt28cIAYU9DiODBsaihaQ23kw==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr5121669otg.364.1639498017370; 
 Tue, 14 Dec 2021 08:06:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j5sm48247oou.23.2021.12.14.08.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:06:56 -0800 (PST)
Received: (nullmailer pid 3472932 invoked by uid 1000);
 Tue, 14 Dec 2021 16:06:55 -0000
Date: Tue, 14 Dec 2021 10:06:55 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v13, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <YbjBHwMXFwi/Sds4@robh.at.kernel.org>
References: <20211213084141.13363-1-yunfei.dong@mediatek.com>
 <20211213084141.13363-16-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213084141.13363-16-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021 16:41:37 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> Fix comments from rob.
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++++
>  1 file changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
