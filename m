Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70F1E68DC
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 19:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D796E5C6;
	Thu, 28 May 2020 17:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923436E5C1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:50:29 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c8so10645193iob.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPQiU9UZD0QCGydYcyf9Oph36s0ecW9luN+RtFrgCuU=;
 b=tePeSuT5RoAt/wmKdPEBJro63XcCZSSOrLF++kt8ky365UCCTj2nB1jyxZMnksmjGm
 gyxKpp7yRLal5vKbnudN4kq3Lv5FvFDajyhDoZ37CYPTxFlITJW+mh5qJYLifHLYRbDI
 qQCW0+hHXdBl5FPmqBcpmzAz2qHoSKvhfm7GFpup8/vez98fZyjYJJZhDND7i4Sv8Yh5
 ORt5OFrzL24flo3ANDSHj3aBRWGNTfX6VlSifcd6dHjpsu2msXeS/g06oNpMGySkBNCb
 suhLK0FDDk0Q50VWISh9oI0RLsgJmpslqxJtez/XOoDMFBvcgS8VI/8YuyAGGMXGnFAy
 IlXQ==
X-Gm-Message-State: AOAM5338QZf5peA5F1WUVcx5+hLHVK4sk8T3IdXlLS84Bm3V8Kk5U27d
 a6L/xwKu/cbXjKpnYBtGxQ==
X-Google-Smtp-Source: ABdhPJyF8cxzDw1wr6IvvmAgMfrH4AVUuJeZSVLXqFRWZnNTmB8zN2zxOx5/fbk7MU6lAfxss4nsDg==
X-Received: by 2002:a02:58c3:: with SMTP id f186mr3709201jab.120.1590688228923; 
 Thu, 28 May 2020 10:50:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a13sm3561765ill.51.2020.05.28.10.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 10:50:28 -0700 (PDT)
Received: (nullmailer pid 390821 invoked by uid 1000);
 Thu, 28 May 2020 17:50:27 -0000
Date: Thu, 28 May 2020 11:50:27 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v1.2 4/4] dt-bindings: display: bridge: renesas, lvds:
 Convert binding to YAML
Message-ID: <20200528175027.GA390737@bogus>
References: <20200514213742.GO5955@pendragon.ideasonboard.com>
 <20200514214211.9036-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514214211.9036-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 May 2020 00:42:11 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes since v1:
> 
> - Mention RZ/G1 and R2/G2 explicitly
> - Drop the part numbers in comments, only keep the SoC names
> - Use one address and size cell in the examples
> ---
>  .../bindings/display/bridge/renesas,lvds.txt  |  85 ------
>  .../bindings/display/bridge/renesas,lvds.yaml | 248 ++++++++++++++++++
>  2 files changed, 248 insertions(+), 85 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
