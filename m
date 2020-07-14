Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD621E435
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0786E846;
	Tue, 14 Jul 2020 00:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B846E846
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:02:13 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r12so12787130ilh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CM3/1+/CCodDq+1tX+3x8EScRX+Tc9vLMTGUeIZrkys=;
 b=DKVsxOgxHZ++KUSuvqt65Kd+GRHO45p3/cLkDxm1t9VYYuJLN5tS0V+8Po4C3ykpLY
 DTvsbnzqMLjHdEMMx45Jw8y3w17D42Dh8FRoi5+BhsVlOhqexQCkF9dSsdEeE3hOLJ1Q
 BF/A7W8/FKO0YkDseYfZY/fC6nX77DoSXvgWc1ThrlKaA7B9C+O6bwAELT6nN/um/nz0
 lZAOdI+n1k+Ppwbi97s5fhDfn32agL6Hzw0c8luxJUGvJploS/VUTIAqaxtIUjZ9G0Oc
 wdxrPV2yDVMnsAjxYERcIP0rLyX5HtQAihUFV9BC5WgBdDDwUk2dPugjmeRuDyMCEfk9
 fTzA==
X-Gm-Message-State: AOAM533ALlJRsCcvV2a6aLSdw3SRU8jX10HEPCgSz3iWHmTBwI0k7Aka
 D2/OoryrBU+6BlzBcg+f+A==
X-Google-Smtp-Source: ABdhPJx7VwEcRKUFqmIipqOIJPBzGL+8GOgvRO8yzAQgo/fzqmEGvzVaBzIQRa8Oym9l1fkhbdErIw==
X-Received: by 2002:a92:794f:: with SMTP id u76mr2098129ilc.215.1594684932797; 
 Mon, 13 Jul 2020 17:02:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k3sm8963111ils.8.2020.07.13.17.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:02:12 -0700 (PDT)
Received: (nullmailer pid 965853 invoked by uid 1000);
 Tue, 14 Jul 2020 00:02:11 -0000
Date: Mon, 13 Jul 2020 18:02:11 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: media: renesas, vsp1: Convert
 binding to YAML
Message-ID: <20200714000211.GA965823@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-8-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Jun 2020 03:47:33 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car VSP1 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,vsp1.txt           | 30 -------
>  .../bindings/media/renesas,vsp1.yaml          | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
