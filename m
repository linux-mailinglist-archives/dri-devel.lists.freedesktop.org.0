Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A934235E259
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 17:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF7C6E7D2;
	Tue, 13 Apr 2021 15:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087F36E7D2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 15:11:14 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 h19-20020a9d64130000b02902875a567768so5401722otl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 08:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QMuTH1Egsr5l5TxdCmQaLccrw2mDTTRbOsaUptv9280=;
 b=p9Z+FgkrWNfxiuexT0EfIladYIHufqLHtRpJdI1xEr06EdyCxHLhT3pUXsjITdKVNa
 K/DHnXw09IzQFdQU1c9Elsq/O5wr8PnKjlE3XFKliT52rxGZMy33AS1JFwd0h131j+u3
 ft6Pi2yEgV9z5o2UymiByQwCqUwWyLxxqkgDfUiQ45TieVsvlyuIllt0uorFCfpu2Qti
 kxalLLldiYnbXOKDeO7O5ev2sNZZshudxYdZZa+l5f4Q/C4DdnlqxMOKWmF25unheBB2
 Yutv0M0mclAY1w3bfB4/MBhX0t1gv5qGE6hHb23bqPtQcj9DcUvEvdv8O08b9piraSSy
 Hm4g==
X-Gm-Message-State: AOAM5334eKTvAZDTF2DgTUnb5Imby0S+7s3Ziwq/tiGvp/KB27su6nDH
 42EwDvMLZEDumkD0Muq2hQ==
X-Google-Smtp-Source: ABdhPJxYnT6hVjFafVkHnNnJItvm1ImlVGWV/7rtja42gcMg+SuzUUAeCBjK54tIjRLjexyCeCHD/g==
X-Received: by 2002:a9d:170a:: with SMTP id i10mr3652854ota.32.1618326674240; 
 Tue, 13 Apr 2021 08:11:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o64sm2903234oif.50.2021.04.13.08.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:11:13 -0700 (PDT)
Received: (nullmailer pid 1688072 invoked by uid 1000);
 Tue, 13 Apr 2021 15:11:11 -0000
Date: Tue, 13 Apr 2021 10:11:11 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: add it66121 bindings
Message-ID: <20210413151111.GA1688027@robh.at.kernel.org>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412154648.3719153-2-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul@crapouillou.net, a.hajda@samsung.com, robert.foss@linaro.org,
 Phong LE <ple@baylibre.com>, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021 17:46:46 +0200, Neil Armstrong wrote:
> From: Phong LE <ple@baylibre.com>
> 
> Add the ITE bridge HDMI it66121 bindings.
> 
> Signed-off-by: Phong LE <ple@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/bridge/ite,it66121.yaml  | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
