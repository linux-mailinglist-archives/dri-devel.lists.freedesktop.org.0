Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA42FDC0C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ECB6E19A;
	Wed, 20 Jan 2021 21:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386C06E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 21:47:54 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 36so13340421otp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RYiLrGhcJLAAUHtrVI8d9P1h8COy/rO0jrSizRQNgyU=;
 b=d8fEDcSxp7xbxu49ljvJ3YDpuDtfgFv9WV0Z0Hr7sGqp4MWtWlZYcO9WaSR5+6Bjgz
 LxZYIeC7xFFH/vxCSKZVK4oDwbLux8n/xtluXd20X0VzzJ9ft4Dw5owtk+Wyi7X/EJXP
 EH2aFzP9HR6TIKyM3KfF0v5M9SU+GdBaCmpZVOS0OKffg7u3KvB421HlDrPggNJ1ENT/
 722HS6P+KxtZd7keJwnMXUXTS9nB5snaWj1ktl8HSQwmYMQbZrGy9bgS1lZJz180gBTu
 Nx4Y6tYav5U+Eli2exUSGOfVDwl4SyGrZW/RcFurfpJFd4Hah1kQoHb0g1WkHgI3qqdU
 ZDtQ==
X-Gm-Message-State: AOAM530qzo1gLHOmZcmfcC9USpBvLTpWrzs2f2vPQks3iE3y2hQP3U3n
 idicwnA6Xu2bkIEL0LEJpw==
X-Google-Smtp-Source: ABdhPJxYfPB/9UFcjdVsorlzePdRphHmAQkXGYqjRi6/Xol24sVNJD+KrM7TislYw9OYzVg7ZKHljA==
X-Received: by 2002:a9d:4587:: with SMTP id x7mr2312485ote.241.1611179273540; 
 Wed, 20 Jan 2021 13:47:53 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v67sm678427otb.43.2021.01.20.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 13:47:52 -0800 (PST)
Received: (nullmailer pid 898723 invoked by uid 1000);
 Wed, 20 Jan 2021 21:47:51 -0000
Date: Wed, 20 Jan 2021 15:47:51 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: dp-connector: Drop maxItems from -supply
Message-ID: <20210120214751.GA895542@robh.at.kernel.org>
References: <20210120175922.1579835-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120175922.1579835-1-bjorn.andersson@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 09:59:22AM -0800, Bjorn Andersson wrote:
> The meta-schema recently gained a definition for the common -supply$
> property, which denotes that maxItems is not a valid property. Drop this
> to clear up the binding validation error.
> 
> Fixes: a46c112512de ("dt-bindings: dp-connector: add binding for DisplayPort connector")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/connector/dp-connector.yaml      | 1 -
>  1 file changed, 1 deletion(-)

Applied to drm-misc-next.

Thanks,
Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
