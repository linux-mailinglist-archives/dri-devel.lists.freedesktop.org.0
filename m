Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204AF2D51F7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8BD6E595;
	Thu, 10 Dec 2020 03:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64066E595
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:50:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o11so3660158ote.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wTUKsQsI85r86/4hHQ2dtyPKmWXP2ZvmGt7MBaOH028=;
 b=ZmecseNPvz+J+F3dMiPOskDuzpb3ZFeP/6Jsd83cL45+fhW8wGeHU4UPs6MchaBsww
 sAng1oxwjSAyn3blmu+KKMblpFu7t9tF0drtvcLLCPz09tTFGft/sFSroWvy0MuVeWSu
 DvXW2mc1VzvRElJgVo3Y+U4XFsxHfiKVW5fp/RRVtBOxbLcZzUHrCfQh9apL4RY3vqbh
 4GGaWPmYqH1v5GMrimxdQVyTwTUJyHrZHcczTYwF5/lwusBo34QSCCkjv/d+67mF+RJP
 xNSOkaBeKm69rWZWYc2kepHUNYk1AGsL+iMKz/XjNXFclJZdUGy2df3aP6VcUG1QZfO3
 a74Q==
X-Gm-Message-State: AOAM531R3s/9k4pOSCCZKxyWfsZHpmh4QVn33wpVcHBIjY/XRhzwSfiV
 ioOqri7q80+y6Vr1HDpKag==
X-Google-Smtp-Source: ABdhPJzyro0TDfjAJJemuxnapS3KeOXJW7vVxsQSlvBdmdYX7hFBfYtY6Rel8ijjf+FAVBOowtVtWg==
X-Received: by 2002:a05:6830:2144:: with SMTP id
 r4mr3914253otd.180.1607572236096; 
 Wed, 09 Dec 2020 19:50:36 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z10sm784921oom.3.2020.12.09.19.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:50:35 -0800 (PST)
Received: (nullmailer pid 1625643 invoked by uid 1000);
 Thu, 10 Dec 2020 03:50:34 -0000
Date: Wed, 9 Dec 2020 21:50:34 -0600
From: Rob Herring <robh@kernel.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: display: add Unisoc's mipi dsi
 controller bindings
Message-ID: <20201210035034.GA1625611@robh.at.kernel.org>
References: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
 <1607352626-26088-6-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607352626-26088-6-git-send-email-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 22:50:25 +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> Adds MIPI DSI Controller
> support for Unisoc's display subsystem.
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
