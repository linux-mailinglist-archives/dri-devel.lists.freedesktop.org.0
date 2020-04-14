Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9C1A8EF0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 01:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B66E5CC;
	Tue, 14 Apr 2020 23:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D63189830
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 23:11:21 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i27so1520662ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uQbA1hm4F1ECx3Q8+dWpAWgcwSDF1dFS3d3ZIaptT0s=;
 b=Cv5o5pJg1vI1cACjQXaswEfRfoFHyohPm876qottClEYnA1Rf2pphvKYeHchcLdZn9
 0vpeBWbAqxBZde6yw2DVjS4WkUrXw3fuzUAsXhI2qUSoAYGp85dc8lPcNUq9+Rt4O0kz
 6jJKXEHt9C51FvA6vJoNx3K2E+KRaj3Aewlf6JbxWfl1dIPQ1AhEZpB+izCPSaOoRaDg
 YmBIQcWxgrOTdlqYZWnUBsnP4jOdZawt4daNgFntv4O6CV3LXcpZyDyiXFNKFXeCZLAx
 V9y54Sn71W4bAmFcfwW6xX7f61QJJXR3cRrdSVf7/memJV5sNxj4snjYl3XAyzBioExd
 OnUQ==
X-Gm-Message-State: AGi0PuZ+utv0QyvwGjY8j7Qc37bXMHHTUjztAUyxWBgbDRQfLkdWFhYS
 /XlkTH3NFRpVqUuO2bbc7g==
X-Google-Smtp-Source: APiQypK8ZzZ8C2d2xHIP7/hVcEIpx48D8sjnAVUS4VjaxOXBvRO5TMBQWpnOXEbSUqJLeeI5tihRSg==
X-Received: by 2002:a4a:e151:: with SMTP id p17mr16389352oot.28.1586905879376; 
 Tue, 14 Apr 2020 16:11:19 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p130sm5952795oig.51.2020.04.14.16.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 16:11:18 -0700 (PDT)
Received: (nullmailer pid 6378 invoked by uid 1000);
 Tue, 14 Apr 2020 23:11:18 -0000
Date: Tue, 14 Apr 2020 18:11:18 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 6/6] dt-bindings: display: bridge: Remove deprecated
 dw_hdmi.txt
Message-ID: <20200414231118.GA6328@bogus>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405233935.27599-7-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Apr 2020 02:39:35 +0300, Laurent Pinchart wrote:
> dw_hdmi.txt has been replaced with synopsys,dw-hdmi.yaml, and all
> references to the old file have been converted. Remove it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/dw_hdmi.txt       | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
