Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AD179568
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 17:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D16E061;
	Wed,  4 Mar 2020 16:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BE56E061
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:34:29 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g96so2596602otb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 08:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HYgnap7JcbfyJ9LwlrBSQ6khAGsJZr+4LoSP4vff9D8=;
 b=B3/aE7k3TtcZOndBlbN9wm3MzlcEY8ccOdXy638Wp5ge01ICgzVwCVxDSCju8hQ9O/
 iSgii5vwnfOu23yo8sVaEV4t1M/4h9J2I0NYuXcDEZC8v4HjoZpFlq/vGh7qCnJ4f8k/
 uglk5TNPhCyJc92vx/JtGbqTaskIBTAKyHselCB8FZdKutaqDjV7LBm+ZZ/ynFBXpkQT
 9DZkEEhtQx+AnxQgN4qiJPlVwaPhIxgjeyEDx9KesNCiYCqsDv4Mn5lZFYJz0jP8zJlM
 Hf4rEjpYdypUKPKV5UEVwRBIxO4YJymt8AwFVdnn5KNtM2gWGN0jvV8yCm751TyX+XWt
 PPNQ==
X-Gm-Message-State: ANhLgQ1pyc+IO8TMtospQRdt7/CvqBcrsoItUNEmQTNb3eaEJqLrGc2x
 prUeR7X0u84lrlRx5p57rA==
X-Google-Smtp-Source: ADFU+vt5Q6fikJmgeBqJkMGvP+8/KykDpQZFFE+L6Qzd+haE4wied4mpTIXVkprwHCGx1VthdflbWA==
X-Received: by 2002:a9d:3de4:: with SMTP id l91mr3113287otc.35.1583339668343; 
 Wed, 04 Mar 2020 08:34:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm3076845otl.60.2020.03.04.08.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:34:27 -0800 (PST)
Received: (nullmailer pid 20763 invoked by uid 1000);
 Wed, 04 Mar 2020 16:34:26 -0000
Date: Wed, 4 Mar 2020 10:34:26 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Elida
Message-ID: <20200304163426.GA20664@bogus>
References: <20200229151506.750242-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229151506.750242-1-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 francescolavra.fl@gmail.com, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Feb 2020 16:15:04 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Shenzen Elida Technology Co. Ltd. is a Chinese TFT manufacturer.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Hi Rob,
> 
> as can be seen on [0], Sam expects you to apply the vendor prefix
> to the main dt-tree.
> 
> Thanks
> Heiko
> 
> [0] http://lore.kernel.org/r/20200229125725.GC5447@ravnborg.org
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
