Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA43E3158
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 23:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE99D6E19A;
	Fri,  6 Aug 2021 21:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7F6E19A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 21:46:56 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id l20so12034737iom.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 14:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t8k1FSkghnl3otNc+cNSXzcyGnQ5mEMP3gk5vD8jYT0=;
 b=k07w9+OXSg5x9W6oNNBDFFT/Y1vDuBkoJqgPR6YxHoZ6MgVQMa60bIWPjTbq2A/0+u
 lLoiZFfaph025Op+WMYI3uitBuymjhwUPoO0+gPkLCjJKfEsTS6Yroh/U0DCNduTxIXr
 LhiOPSscaxYhP1OytavNUmVjer48wZOeY1aNJmoUXYTH5LMe4I26aIt8VTBXkJDmlPYE
 AFoh7UYdHJNBVHtBRQRfhBh7wjfJBwG7upHxWriSM8SsbDCun0fKxysDj5yjc0E11BzS
 DFYzavHXiqZZaL7+ZUpceV+osfKtGPQ4CtVeROXTrV0h72Voc39T1Ca6z6ZndOYX+Dx5
 7yQQ==
X-Gm-Message-State: AOAM532Mynp0KJHsUNGi14qCnASMhvacUJq/YApBupg8N05qd0D7oLxm
 t8AtAWDVY4fj6ULozUeeJg==
X-Google-Smtp-Source: ABdhPJzjqP+aoHh5yEK/ZvPLCNSdC+tf7BH4sBq/dQJUJPAOMfIcAExlJl2QPZW9IsHaTi80jXt05A==
X-Received: by 2002:a92:9412:: with SMTP id c18mr1703496ili.38.1628286416290; 
 Fri, 06 Aug 2021 14:46:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x6sm3909883ilp.71.2021.08.06.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:46:55 -0700 (PDT)
Received: (nullmailer pid 1861306 invoked by uid 1000);
 Fri, 06 Aug 2021 21:46:53 -0000
Date: Fri, 6 Aug 2021 15:46:53 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: add binding for simple-dbi
 panels
Message-ID: <YQ2tzZp9ow6WDaBR@robh.at.kernel.org>
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-3-icenowy@sipeed.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802063538.75583-3-icenowy@sipeed.com>
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

On Mon, Aug 02, 2021 at 02:35:36PM +0800, Icenowy Zheng wrote:
> As we're going to introduce a driver for MIPI DBI panels that need only
> standard MIPI-DCS commands to initialize (usually because the controller
> has some configuration pre-programmed), add a DT binding file for it,
> which now includes only one DBI Type C Option 3 panel, ZSX154-B1206.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  .../bindings/display/simple-dbi.yaml          | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/simple-dbi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/simple-dbi.yaml b/Documentation/devicetree/bindings/display/simple-dbi.yaml
> new file mode 100644
> index 000000000000..f49b0fda0935
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/simple-dbi.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only

checkpatch.pl will tell you this should be dual licensed.
