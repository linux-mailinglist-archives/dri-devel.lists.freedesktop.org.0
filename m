Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C041A0E1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 22:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C71F89DED;
	Mon, 27 Sep 2021 20:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5873A89DED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 20:57:36 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id s24so24719711oij.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 13:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l5Mqh3vIaAE/8zYRBqY+q9GOKFmDCTSjBlpUeQfhV/8=;
 b=gJdkApmXYz9zwdgZQUysxacnFhqNx/dimuqwJ4b1KuDjZt85ONDCn1u8KUB8U6I3Oq
 mU2HOqHkziWAJZYDIvV3H8S6sgcHtDjk4NX4+nGcdh2LXnx+c41yfEhf0rQSdMsxsAch
 cx5MpO6sC7nKwCg32jwT8pobPAmQyGT1oIV9a+kYQ0R8scZEcxPLSCnd6NaDowkSiYFW
 oXK5YPViuzt5c57tQN1Wd+uaO6qj3s/Fj4hpHYpEzi/CMDjSpgzIgYA+rbwX2t+ZDl86
 hNVxeAOekE7s58qNTok5SGdwsWZc7L/dGGGHaOEa644NRC+vyN/DFYb6Ezm0KYn7zuSU
 uQjg==
X-Gm-Message-State: AOAM530G/zNeE6G++ohbn7fktIS12ko4HzxHb3zt0Gsdhqn8/1dEgE7E
 0O2WgsBTBYAmvdC13r2hYA==
X-Google-Smtp-Source: ABdhPJzkBg9e4PP70PY+l6j+F0sfK9E2DP+ra4/sSyP2t4qiM3CxZpWCqQMgfRVKKO0v+4tLIEFDlA==
X-Received: by 2002:aca:32c5:: with SMTP id y188mr814898oiy.163.1632776255590; 
 Mon, 27 Sep 2021 13:57:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u6sm2488378ooh.15.2021.09.27.13.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:57:35 -0700 (PDT)
Received: (nullmailer pid 3861061 invoked by uid 1000);
 Mon, 27 Sep 2021 20:57:34 -0000
Date: Mon, 27 Sep 2021 15:57:34 -0500
From: Rob Herring <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3.1] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
References: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
 <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
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

On Thu, 23 Sep 2021 14:01:38 +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock
> 
> v3:
>  - Use clocknames: 'du.0' instead of 'du' to remain consistent
> 
> v3.1:
>  - Require clock-names
>  - Collect Geert's tag
> 
>  .../bindings/display/renesas,du.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
