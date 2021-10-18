Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268794325A3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 19:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5D96E0EA;
	Mon, 18 Oct 2021 17:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6146E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 17:54:26 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso834253otp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 10:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jKb3CBAeA1seb+unx/+TUGtwwMBXx4JIK7gbIjFPOtw=;
 b=GsFJ1qEtqOL7QMq5DYe9l8+QqNzfRCBVHMNjw8cwBgWbJHegQHuCKT+PWZLC8S7v6B
 Omvj9jKmM3O4b5/NK7gh0FhV2KXLLCPZSX2/Oy4tu9wVKCe2l29wHx/WnEBFK+jRfl5u
 H+MEdvNrnyUV91MhqCwWuft2e1Twrs2IblQuGKIIcGFfLuD3jRqY7YtuKpWDzPvRZtTx
 NJkZlMSvTlnLiYZP5hdQJ27ixWseQx8XfUm99z/Ycs8IpGQNRNygDfsJboYBxa+9UVV8
 r/febWTQ2fJsrD7Zw/PHGotQtpeq5DHn9pcj/Vgce4ln6rcXkM4Ey+BaxtP1tCBaQYZY
 PbOA==
X-Gm-Message-State: AOAM531nnPMQPr3XNWV4HOSy/g/Nuo29KGCr8KAvTNwRjosNS/FoVB60
 Y8cZ1vNWS/y8Ks4IQIXYHw==
X-Google-Smtp-Source: ABdhPJzjaAbzHrWDppkjBo/28bRg5OcHiXZUrmYxjZ2W7OPdRI0Xcij6rErtl8Vbp8qCWG/S2MKpxA==
X-Received: by 2002:a9d:754a:: with SMTP id b10mr1117941otl.182.1634579665642; 
 Mon, 18 Oct 2021 10:54:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a15sm3370912oiw.53.2021.10.18.10.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 10:54:24 -0700 (PDT)
Received: (nullmailer pid 2652550 invoked by uid 1000);
 Mon, 18 Oct 2021 17:54:24 -0000
Date: Mon, 18 Oct 2021 12:54:24 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <YW200Baw1kKFxztC@robh.at.kernel.org>
References: <20211017001204.299940-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017001204.299940-1-marex@denx.de>
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

On Sun, 17 Oct 2021 02:12:03 +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> V5: Rebase on recent linux-next
> ---
>  .../bindings/display/bridge/lvds-codec.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
