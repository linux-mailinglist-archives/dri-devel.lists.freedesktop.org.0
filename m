Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7A4AE750
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD7510E150;
	Wed,  9 Feb 2022 03:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8C710E150
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:02:12 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so1002480oov.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r9n/VE8ShNQNiwipYWkPFL8cBHsQZxENNYkTj1Nzpt8=;
 b=Tjz20WMstZzD8LV9y5NXFTIZ477ww1UsoCBzV82N2RZIphzEkjSAKFTSLeoBU4vWn7
 JvULPhmaGVpWLPPY5e7u/ZmvJzzHJoO+PXjoHtFldgzxOaUcuanrJO+RjTwTbeDKDial
 BJkvuUdHvXQYHI31Qra/ibnsj2gfSDmL3OboFGrh+bfpgESZONjLljLf4SMlIZop8JSo
 sCwVMy/+r26a5o5X2Fu4SIaIZyjtJ47uSf4UR0fYqzr9XQIN5K+viGKJDQ/sPCqervks
 7jNa+6Wb5C3VJspS1c/yNh6OjBDVEdw3xiz6UZc7PKeT+xysTk6gX2bBu2556RRzwcVU
 3RvQ==
X-Gm-Message-State: AOAM531P8AKlCReQeh38lr/2EZUmVcXRhdglIt87XF2uKQVKXFSSnu0G
 zgQmUteSZoH/xesV67Gx0w==
X-Google-Smtp-Source: ABdhPJzet+Dv7YYDkSGgJ2JnIoD3tapZgHhdllycdoCmXgkx2+9s9J1YxBIMJuyIWUjbzLMqyE9qyQ==
X-Received: by 2002:a05:6870:91c6:: with SMTP id
 c6mr103120oaf.147.1644375732021; 
 Tue, 08 Feb 2022 19:02:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r186sm6264409oie.23.2022.02.08.19.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:02:11 -0800 (PST)
Received: (nullmailer pid 3539514 invoked by uid 1000);
 Wed, 09 Feb 2022 03:02:09 -0000
Date: Tue, 8 Feb 2022 21:02:09 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v1, 2/3] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8186
Message-ID: <YgMusfSSXXLlyxyX@robh.at.kernel.org>
References: <20220122075606.19373-1-yunfei.dong@mediatek.com>
 <20220122075606.19373-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220122075606.19373-3-yunfei.dong@mediatek.com>
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
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 22 Jan 2022 15:56:05 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8186.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
