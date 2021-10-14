Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB442E2BF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C86EC69;
	Thu, 14 Oct 2021 20:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8EB6EC69
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:27:52 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 62-20020a9d0a44000000b00552a6f8b804so9259512otg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xu5tTcVr8bvpGrBgDRlnsFOc77LQWXDWznkApBGMUEk=;
 b=PAf4gnnIY9M/2brm4C2xQkY3Nom3F/k4EwriFf36R+aaturnfxrewuEpGTAYk5LRW+
 EhJ5urojKOXdRAjGRG8prympDEYHmngH1FcvQyGlqhIrv6iFliF4n0HaDRFU748njUu4
 pWWK3bFs5P/XW6Qc5gS8QaJYCBRzPtQJO3mndOhhAdrOJKMPMyCpge0yacGSA0GtOR5w
 AhOQzLp79/VZ5g6WlCxEgEd+kWdsmMXOuP1zzFoEBSK8QPlKlYYAbepdsbLPrQt4lsN3
 sAh+0H+1LfHbNV3ijWphDrhqP9fFFn0N9J2lcFN6JFCk03wngvm+p9FHhCto+C8zNx4o
 hStQ==
X-Gm-Message-State: AOAM530RCWVZcd/b9jxW6zHPkkWnvULMmFNC+cj1ZA5xLb9SNlBv0wUb
 FUvojC130Ic/xTtLUw/ZHQ==
X-Google-Smtp-Source: ABdhPJzOmo9iZlOtlO33lznWBsz3f2YhTocxhTHZLirvfy1olKZGZJQCN9IedDWRxefqBF1u8xVWHQ==
X-Received: by 2002:a05:6830:19f9:: with SMTP id
 t25mr4174437ott.332.1634243271889; 
 Thu, 14 Oct 2021 13:27:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h23sm721803otl.54.2021.10.14.13.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 13:27:51 -0700 (PDT)
Received: (nullmailer pid 3867413 invoked by uid 1000);
 Thu, 14 Oct 2021 20:27:50 -0000
Date: Thu, 14 Oct 2021 15:27:50 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: m.purski@samsung.com, robh+dt@kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/bridge: sil,sii9234: Convert to
 YAML binding
Message-ID: <YWiSxk+JIU5JAlbG@robh.at.kernel.org>
References: <20211006152158.601856-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006152158.601856-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Oct 2021 17:21:58 +0200, AngeloGioacchino Del Regno wrote:
> Convert the Silicon Image SiI9234 HDMI/MHL bridge documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/bridge/sii9234.txt       |  49 --------
>  .../bindings/display/bridge/sil,sii9234.yaml  | 110 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
