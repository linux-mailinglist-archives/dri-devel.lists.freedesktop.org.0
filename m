Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658047D633
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 19:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C42210E1AE;
	Wed, 22 Dec 2021 18:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DA710E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 18:03:29 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id kj16so3047808qvb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 10:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4fVfy0VZMJjefrEnDYXEJyypYgBf7xTeJkE+5TiMOcQ=;
 b=wHO0Q3JITUu1mR9vfjNInBR/30CwbboimYJHl1tkjpkjPTyaMx9pWHIBY7gkvTz23L
 7WgcjvPgD6Y4VbPVDC/7shnxILL+x37UhIEOdEmJ53NARRdpH5mpGKBQGEnQjCsehMuJ
 rbSaK7jF+fDfPNw1G/aUEoQ1nfuLhYuMo3l1Rt6bszwiGpkXywEQFypRev/BTM82hfef
 Nz6mAH/MspAuiSGwuj+UIe39S7QrwQj6yx2l5LxBuXMuplzWuz+gAHtONQVO+m0wHn9b
 MnQzu929Id0ddVXuvo+ZC8IvYekfGxPZrjzfKZaKvLP5AcmJ/a1XlNeK6rGCKWSeBm+Y
 TSCg==
X-Gm-Message-State: AOAM532xBHoZgSHNfu+TxWbdQKKglzTK5soUOysmpI9iaHvQiMZPCmwV
 YPp058wPGxj/jMOiiwpnsw==
X-Google-Smtp-Source: ABdhPJzR+ZxBvybDxpigxbPuFoMxaj4PERdOGS5pX08g6AGVBeYpcqh8o+IHw2Q3akU/vfsa4oOp9g==
X-Received: by 2002:a05:6214:2306:: with SMTP id
 gc6mr3492573qvb.34.1640196208799; 
 Wed, 22 Dec 2021 10:03:28 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id r185sm2149005qke.134.2021.12.22.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 10:03:28 -0800 (PST)
Received: (nullmailer pid 2421141 invoked by uid 1000);
 Wed, 22 Dec 2021 18:03:26 -0000
Date: Wed, 22 Dec 2021 14:03:26 -0400
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix duplicate
 key
Message-ID: <YcNobgVJADzY8waQ@robh.at.kernel.org>
References: <20211220125147.519880-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220125147.519880-1-thierry.reding@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Dec 2021 13:51:47 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to validate multiple "if" conditionals, they must be part of an
> "allOf:" list, otherwise they will cause a failure in parsing the schema
> because of the duplicated "if" property.
> 
> Fixes: d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 43 ++++++++++---------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 

I went ahead and applied to drm-misc, so linux-next is fixed. 

Rob
