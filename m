Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EEF367569
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 00:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9BC6E0C2;
	Wed, 21 Apr 2021 22:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48406E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 22:57:54 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 c84-20020a4a4f570000b02901e9af00ac1bso3343588oob.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nHc0vu0f8/Y88zC2/CmuoX75thIIdILFhNQVN4NX95s=;
 b=eZj+6XLZNqxfor3kqf0RrGujjjc4VOTLp8S2dZGI/ZlW7hJKPUL6cpq02FV2a/VABU
 fGj7bOKUDcodVe9aSFRfQCFGZjFLd07ilLIqIGX+Q6T1HB1wmgUcM2k+ZcWPobcFjPvY
 EERnKP+Y4TPC7cspQDSSIEbk9GX/nexX5JueGo3reIQZ9qnU6fuNvSySocpa3F0N2d8j
 5sow9e2jBw71daQblav3ypL02PDBb+PN4G6qFsun2S95qjzhYIbc2tDsCCttqKfcIHBx
 Fr11w3e++trODojlSafLLienvW2d4WtdMebmOFuVBxl+tqRrc1mr74y1YElz+IpRWcHV
 q3oQ==
X-Gm-Message-State: AOAM530414Y0AQZ7RnkpZjkY+vvWzDGhhKCmS/SD1yxHaVYTVSnFG7bl
 oxq/rxZax88g37KrKPCb5w==
X-Google-Smtp-Source: ABdhPJwjYos/WcIL+RFdiTSvzgpoXxQwdK0ohpOuRaRk2GRIIl/pMcr7rplvisvozdFf0meqaKMQ8A==
X-Received: by 2002:a4a:a6ca:: with SMTP id i10mr180307oom.62.1619045874190;
 Wed, 21 Apr 2021 15:57:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 79sm224478oty.76.2021.04.21.15.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:57:53 -0700 (PDT)
Received: (nullmailer pid 1768772 invoked by uid 1000);
 Wed, 21 Apr 2021 22:57:52 -0000
Date: Wed, 21 Apr 2021 17:57:52 -0500
From: Rob Herring <robh@kernel.org>
To: Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 1/2] dt-bindings: Add E Ink to vendor bindings
Message-ID: <20210421225752.GA1768719@robh.at.kernel.org>
References: <20210418210956.3024-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210418210956.3024-1-alistair@alistair23.me>
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
Cc: devicetree@vger.kernel.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, sam@ravnborg.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux@rempel-privat.de, robh+dt@kernel.org, thierry.reding@gmail.com,
 krzk@kernel.org, Max.Merchel@tq-group.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Apr 2021 07:09:55 +1000, Alistair Francis wrote:
> Add the E Ink Corporation to the vendor bindings.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
