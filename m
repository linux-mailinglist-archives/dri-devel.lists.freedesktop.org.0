Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AF3EBDA9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2C76E8DA;
	Fri, 13 Aug 2021 20:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF56E8DA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:54:55 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so13647837oti.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e7obZQIXIJ90oiyGQcBq80Z6Ly8ShtrfGKC2ujXAAi8=;
 b=Oc+mQAuBztlBl10Zx0yTRUS3cXLVNYAQsAi29Wf+j6sRvgjZBb1qxtNtcv/OLAhZ5+
 FvXBbavpNRJKgEesNrDGLPOAKN2sxey1Y4Lsu65XCuInLv82s0Kzk1+OksqV9YTlmysm
 vaqeo+ZZzFbLZoXZ5QmHAoRCyrOALMbTY5ZgR7vwjoEK48wGOyUiVGGlLwHxKyTo/PF3
 ezEsu7t2sP23CL+ycaOFIybN//4E/u42a+kiG/yZk6dj7bTZM1F/SNgWttK1XSrULwjb
 N/l1gXYnarjCIkMcwIq0fmvka8TVEWHhfprrGL8gjlEyGp71mfEGE/J4YVZ5JeKywwD9
 Uhng==
X-Gm-Message-State: AOAM532IGiNIFLRqsOI8KWWEMMkQPFJb0KDoCUHLif1F+2n4ApOsu5B/
 xLxCOhkWxdT5mnPDlqpx5w==
X-Google-Smtp-Source: ABdhPJx74xgDqvGtsahOfUGt/xUyVop0aeUbpm+X9Wn69ZuvwCkE5MQ2rgYziIKt37zWV07IwPlToA==
X-Received: by 2002:a05:6830:44a8:: with SMTP id
 r40mr3611829otv.222.1628888094843; 
 Fri, 13 Aug 2021 13:54:54 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-a2a6-2d62-395f-9378.res6.spectrum.com.
 [2603:8080:2a06:ed00:a2a6:2d62:395f:9378])
 by smtp.gmail.com with ESMTPSA id o26sm534396otk.77.2021.08.13.13.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:54:53 -0700 (PDT)
Received: (nullmailer pid 4015418 invoked by uid 1000);
 Fri, 13 Aug 2021 20:54:52 -0000
Date: Fri, 13 Aug 2021 15:54:52 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, Jianqiang Chen <jianqian@xilinx.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 01/36] dt-bindings: display: xlnx: zynqmp-dpsub: Add OF
 graph ports
Message-ID: <YRbcHBZn5QX5Q5mQ@robh.at.kernel.org>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
 <20210809013457.11266-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809013457.11266-2-laurent.pinchart@ideasonboard.com>
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

On Mon, 09 Aug 2021 04:34:22 +0300, Laurent Pinchart wrote:
> The DPSUB doesn't live in isolation, but is connected to the
> programmable logic for live inputs and outputs, and also has a
> DisplayPort output. Model all those using OF graph.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
