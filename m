Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE944C3587
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCE910E821;
	Thu, 24 Feb 2022 19:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536CF10E821
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:16:16 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id l25so4310016oic.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 11:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CIZ8l9ggHI+ksF9ySGra6oc3DHVzkCgMYu8j36TV9TY=;
 b=LlJaxQx8DYSHPGNVIgRsD/3hpwnOjIv/qEu746M35HpbfimSVIh3D0n1mIWqj2Ifk1
 zar6eFx3fwlWEL/KFjkGQFEmEKOVo6HAaIbob3P1Raj+mwrm4dFOYI0t6zguDnpS781U
 Y82IOeZUvecGlIjnWpFs7wtPQfgYFxAuDw2gFonKF+jGiK3f+6V2vYC/+22PanKLqopa
 M85cFQZPtQBrUN7+PDAPtEXMw0JANQlCTNu3SyQqosuSAfUCprR9naxzMqXVrAXnpv1s
 TTc5Xlrn+f2v9xluP05bBRn7rmjRgqWtgXe/YHNnrU4/qbuNwnD+4Ogx5/kiU2JP/Jsw
 2BJw==
X-Gm-Message-State: AOAM5303Rc91la0H8fBvYqOfa0uRxNhqmh75JYvchRhkmY3MkwC8M3Yf
 OAeZUkJjcJoB0BipAO6bqsUU2iMDWA==
X-Google-Smtp-Source: ABdhPJwxUu9mkz92flMo29/vSvMvRas73bEu7/GHucHHjC7qW5h3B9JoZfONOkccBnWTGnjHJiY6/g==
X-Received: by 2002:aca:6083:0:b0:2cb:5570:7564 with SMTP id
 u125-20020aca6083000000b002cb55707564mr8499482oib.57.1645730175518; 
 Thu, 24 Feb 2022 11:16:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 9-20020a9d0c09000000b005afabd759cfsm80036otr.65.2022.02.24.11.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:14 -0800 (PST)
Received: (nullmailer pid 3428805 invoked by uid 1000);
 Thu, 24 Feb 2022 19:16:13 -0000
Date: Thu, 24 Feb 2022 13:16:13 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v4,1/5] dt-bindings: arm: mediatek: mmsys: add support
 for MT8186
Message-ID: <YhfZff2KIPdOm53H@robh.at.kernel.org>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222052803.3570-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, yongqiang.niu@mediatek.com,
 chunkuang.hu@kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Feb 2022 13:27:59 +0800, Rex-BC Chen wrote:
> Add "mediatek,mt8186-mmsys" to binding document.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
