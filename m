Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67F1CE806
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AB36E5B9;
	Mon, 11 May 2020 22:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31F6E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:25:18 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b18so16555774oic.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N73zBrwIBmYpG8/mtE42ByaDIOPbOcw7oUrz+Oif3Eo=;
 b=umYyy5EaFTzzcj+mmKJ/qXiP1ZEdB9U0E3/3acB8yTkYTb36vghc15Z+nVpJcjnAE0
 eW0JB70/oNcWc8sbhLeb1MRCDDEgYNMSMCN61vTILIq9/NQwfUfPw/5PO9IYmUWkmLIk
 LQKiAheygg2rk0ANad6p5VbdtPCUs9L/nUZXgsjD1ryQ0QHcbilCRZSnmQH17Xttt03R
 083rNY52pFKHa5ugBM4Zj7goixj70WjexHdEDNF+lhGTVzSYxJeCnBoFvFxo0MZeufhq
 s/kP1WsIbMvMqAo8WdlzRMO6DN2kNe9mEZ2M63471Q5prBRFMIQjvIBWtYUE5HrWEkUp
 qNwQ==
X-Gm-Message-State: AGi0PubnRV69CPe5G1wFqCtddYJQXr531uMZkwZXoLKJtolnuzgJxave
 5Ze003vzpfnYLciKIcYSFw==
X-Google-Smtp-Source: APiQypIdxF+D8MOPQ2d/giDq1zA7n3B31P983KHIrpVlUv9jtqc3f9KpvrzKWtblGovXNsvgE8KCzA==
X-Received: by 2002:a05:6808:24f:: with SMTP id
 m15mr22304882oie.152.1589235918092; 
 Mon, 11 May 2020 15:25:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g94sm2982774otg.74.2020.05.11.15.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:25:17 -0700 (PDT)
Received: (nullmailer pid 25383 invoked by uid 1000);
 Mon, 11 May 2020 22:25:16 -0000
Date: Mon, 11 May 2020 17:25:16 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: add power-domains #cooling-cells to
 arm, mali-bifrost.yaml
Message-ID: <20200511222516.GA25294@bogus>
References: <20200425154037.21083-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200425154037.21083-1-jbx6244@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Apr 2020 17:40:37 +0200, Johan Jonker wrote:
> A test with the command below gives this error:
> 
> arch/arm64/boot/dts/rockchip/px30-evb.dt.yaml: gpu@ff400000:
> '#cooling-cells', 'power-domains'
> do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> With the conversion to yaml it also filters things
> in a node that are used by other drivers like
> '#cooling-cells' and 'power-domains'
> for Rockchip px30 gpu nodes,
> so add them to 'arm,mali-bifrost.yaml'.
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpu/
> arm,mali-bifrost.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
