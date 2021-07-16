Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2993CBB71
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 19:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D4D6E0D8;
	Fri, 16 Jul 2021 17:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0506E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 17:55:43 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k11so11588225ioa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 10:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tFOHzg/8OboexPm/0pSsjz82hnih9yZe/xW9+Qml0Fo=;
 b=VPf/LOW/Ld+kxiMhplNrldwNqx64IkVHFGdfx2bU8XuVUQ7PjCTo97o8MMoZSvRlmO
 9V9vmO3IXUefxaqEu4Bg1SKC2Jzb1XzZ26V9wG6gHPcFEUI+9cF5vc09XCIGfQD92oDl
 pu9l7lEyocufmi7/mFYf8rJX/DCKYbp5UJQKracmixgQBqc3XotxyuAQGtoKxvMblfjd
 MBtwPGILzMLvZOREaKLjLkv3PZXuiOPg07nYdF8TNR46f+iVbaKYLUqZJwY6hFUE8LeS
 X1u4Rud6TjnMP5cd04TAdjhHnjskOsPiowIfZL5mJapdssyVfI1/VKfD7wCjU+VStxO4
 Zxgg==
X-Gm-Message-State: AOAM532u8XR/MJVtAiqQP9NIrB0GLDoH2NSQ9iKtGVyFHkGHCEXNRYOD
 qKy+lD2E9EHWeQRCL5+11A==
X-Google-Smtp-Source: ABdhPJyB1gQr5+xRZl+gIVic1+l9kv06PAA28WzTGwCgfyv07tnL8aVGaFiMGmLDAVDhxYYSy9tskA==
X-Received: by 2002:a02:bb12:: with SMTP id y18mr9776068jan.66.1626458142771; 
 Fri, 16 Jul 2021 10:55:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m26sm5481404ioo.23.2021.07.16.10.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:55:41 -0700 (PDT)
Received: (nullmailer pid 3675453 invoked by uid 1000);
 Fri, 16 Jul 2021 17:55:38 -0000
Date: Fri, 16 Jul 2021 11:55:38 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: display: mediatek: add dsi reset
 optional property
Message-ID: <20210716175538.GA3675419@robh.at.kernel.org>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 12:11:37 +0200, Enric Balletbo i Serra wrote:
> Update device tree binding documentation for the dsi to add the optional
> property to reset the dsi controller.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Added a new patch to describe the dsi reset optional property.
> 
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
