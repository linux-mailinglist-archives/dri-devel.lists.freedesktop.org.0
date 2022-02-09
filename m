Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12964AFE95
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 21:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822AE10E46C;
	Wed,  9 Feb 2022 20:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B0610E46C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 20:37:42 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso3889334ooi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 12:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9vvNKi/Wm0VLtELILJszjggawGQx7UYnFBx5UN6T3jA=;
 b=RaCk+Qxlou3vwc1qfIROm9e6bkAzswLYuilrjWCFMvCdUVZ8c6kNaaHhNoowYMq9zu
 pFZKaQLsyg9JWYRSMtr2m6EFgcC2WCnPcCluExq0Gl4OF1ElDzK/sV3jM2YPxm5hHne2
 3Ks75dabjLN2aiF1qzF63GChcwH9C9+PIxxyZYiCwFFRijjfuxDF1tiv9XxOq2jUX0Do
 flqsi5Pnmgb3+3daMnayJ/qytodpZaP7jcE6IgrgNkruMbSnVlltBQz9vqWZCNbiYGUu
 owvKC+1FYxUDL/R+b+kqfCfYnn/92okT330yk578jfQp1VoOyKWq2ayhGi5nkAfIv4kV
 P8fg==
X-Gm-Message-State: AOAM5301x8g3CXUUCKZhSJgJtRZtKY8zqCHiznsLyM3qnJT+5f/9quYX
 bvBSmhPuqmos4/wUL0/b8g==
X-Google-Smtp-Source: ABdhPJzDNBwd/NZ7M3FaqezQTKEcdU8xCVOg4y//z9QAs0xMXOadIO7noGIod4pEwfE0Iw17L6nY9w==
X-Received: by 2002:a05:6870:c7ae:: with SMTP id
 dy46mr1533523oab.309.1644439062215; 
 Wed, 09 Feb 2022 12:37:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c32sm7310728otu.15.2022.02.09.12.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:37:41 -0800 (PST)
Received: (nullmailer pid 863156 invoked by uid 1000);
 Wed, 09 Feb 2022 20:37:40 -0000
Date: Wed, 9 Feb 2022 14:37:40 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 3/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8195
Message-ID: <YgQmFEhdM20Zr9NJ@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128035440.24533-4-yunfei.dong@mediatek.com>
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
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 George Sun <george.sun@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jan 2022 11:54:36 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8195.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
