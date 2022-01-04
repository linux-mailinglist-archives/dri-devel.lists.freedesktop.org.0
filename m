Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A148492E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 21:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB3210E2A5;
	Tue,  4 Jan 2022 20:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27D210E2A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 20:19:54 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id be32so61057846oib.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 12:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JU3YxFB52PXiaktroyfFxCwFiWKwaJLFZ+J4SpulZrY=;
 b=3KTd7FjXrjkOf8YnAUX44YHO3FtO7DlIMvJiyji29r0iXbflUzVmYv9O2xI3FIiUai
 BTCdYA0qDSy+SEKA2K8RlqcY3YBzScFk8ZDxPnfiUIvGyx/k7ERK4Ww0P8msHQjXMnZZ
 i1XSl2AOFxEYCVWiDFzLfQ0MPvhZ8FCuV1lqNkPrO0lETngHLixtD4tnaxj+yJVQwHQP
 ekMoRxu67c9Jj+/hFr/RKIcvaWO7MHJUz4LbzELvCB1kTZLpA8ULZugR8WdepybEtCpM
 iZsZjinIvr6IfQAeeC12Kt1gecl4sm0tW+DmyljjaCu74ZrtwM9C4wuEHQjiGxsmpCGR
 nUkA==
X-Gm-Message-State: AOAM531UEkdWMB2aoCTnOqcRMYTvsHgj6d9r8NG9YkI67ADdI9COOSjY
 R41H6G3RBhzVDIv9cCKpAQ==
X-Google-Smtp-Source: ABdhPJzg/5ZbwfBsBd3FVkUulGU27IW4zZa7wXzlxLvhJNuLo5tj2ccHZmRvMMKYadsGKx+lV3oOkQ==
X-Received: by 2002:aca:44c1:: with SMTP id r184mr35857oia.15.1641327594065;
 Tue, 04 Jan 2022 12:19:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k10sm9924883oil.36.2022.01.04.12.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:19:53 -0800 (PST)
Received: (nullmailer pid 1351192 invoked by uid 1000);
 Tue, 04 Jan 2022 20:19:52 -0000
Date: Tue, 4 Jan 2022 14:19:52 -0600
From: Rob Herring <robh@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: bridge: renesas, lvds: Document
 r8a77961 bindings
Message-ID: <YdSr6PuKvL3JOc6O@robh.at.kernel.org>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
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
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Dec 2021 08:23:09 +0300, Nikita Yushchenko wrote:
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car LVDS encoder
> bindings.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
