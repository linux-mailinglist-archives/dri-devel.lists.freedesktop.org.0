Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4EA250B8E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 00:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE676E339;
	Mon, 24 Aug 2020 22:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81F76E339
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 22:21:01 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id g14so10453208iom.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 15:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yNRaJJrYT3TI0Gn7ip8sjaITsBSuW5Cvw4IVR3Hv6/g=;
 b=RagK9L+9IEt45x5dr4CwQ6xjnklAptKuHAvTTXMOeItdtrTASY8r1V4KeJjjEtxRD/
 R4vHcOA+hXjKfznqPv88RgDJ/M4cyJnuErPZOI54TEzc1ltR0RUMYP9W4vwXPUBDDfdf
 WETrVL2NmQGTDvpbwSv4QOfVzxBSqdy6fe3s0MHwuQJpvpyHB7hot9OyvP1I3kOQJCgk
 G4zK+necCkmvEGzMjrwYi0JRqBlaQVji5I1v8fSA1TLtDDculTilXvQDHFJ+FUqhFiRk
 sVctv9ymdrt3lJ66DZ88+tFiXYakAhXQX3LVjC0axn2PkF5XIAZD+n+5kw4rb68SA3pS
 wsaw==
X-Gm-Message-State: AOAM531luuZ0aInqrzZh7Bph8Zcde9GiBjLTgn4jcoLxOsc3r8ebVVSA
 8p4eRD9wVCPQER5s8qnG6evJp9rJdA==
X-Google-Smtp-Source: ABdhPJzP+zFgUKjKzI1NzjFpqZdYm2HRbVENE0AOJP8z+QU/enk/3cg6PZWntQ60QQA9C0gJaqckig==
X-Received: by 2002:a5d:8a0d:: with SMTP id w13mr1101710iod.13.1598307661073; 
 Mon, 24 Aug 2020 15:21:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id w7sm7933293ilo.17.2020.08.24.15.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:21:00 -0700 (PDT)
Received: (nullmailer pid 3421572 invoked by uid 1000);
 Mon, 24 Aug 2020 22:20:58 -0000
Date: Mon, 24 Aug 2020 16:20:58 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas, lvds: Document
 r8a7742 bindings
Message-ID: <20200824222058.GA3421514@bogus>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Aug 2020 18:49:50 +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) LVDS bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
