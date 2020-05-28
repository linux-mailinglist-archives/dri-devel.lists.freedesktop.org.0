Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147B1E5320
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 03:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702CE6E12D;
	Thu, 28 May 2020 01:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FFE6E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 01:34:48 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id l20so26011811ilj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 18:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nc1xYCw1KD9ef91XiAdzK+QPSDWo/LFHJ3pQwzb/o8c=;
 b=rL8ftu38uIuOgqU4esOxK04W93e6noUdNHZc5W9r6+ljwJ2J2lTyqP4aE18LbyvJUM
 ZgnlHr62sZKYOzRBm2gNuBnH+BizhL0e6tkhs72BptQFlJPIPpksu0p4Uh2VJJbT5bzH
 Re/fyJVUFVsdNknlfu57jvI6316fNM4KmMsi1108sjmhEsnbiJskl40dGzgxHap7Vj9h
 MCUzf+TjIJ+crLjC4EbYk+rfOkOLyWJgbVJSP4PtapgGCOiNrPDFqLfWruNzDlaef3JY
 SS3wwuQPuIQedlh9zu3V+jWS538OxD/jlNSie1sFnhSqpbLXh0l/3p1GzY7kTrBJHk4r
 Vpzg==
X-Gm-Message-State: AOAM533VHkoXmxlVcv8LkQ15VAYYCK1kUsA7ODI5aQ33mnu+F8pr6Ee+
 y7An/q/yfdYHxaKD07c4eQ==
X-Google-Smtp-Source: ABdhPJwymYNAx4sILLom9EnIknxnjsBziqxYdE/dhdeJiSyDuDoWGYDh8BcOShip3SBpBmyPzfQqxA==
X-Received: by 2002:a92:5dd4:: with SMTP id e81mr959365ilg.288.1590629688029; 
 Wed, 27 May 2020 18:34:48 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d16sm2507512ilg.71.2020.05.27.18.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 18:34:47 -0700 (PDT)
Received: (nullmailer pid 3167518 invoked by uid 1000);
 Thu, 28 May 2020 01:34:44 -0000
Date: Wed, 27 May 2020 19:34:44 -0600
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Lontium vendor
 prefix
Message-ID: <20200528013444.GA3166896@bogus>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513100533.42996-2-vkoul@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 15:35:31 +0530, Vinod Koul wrote:
> Add prefix for Lontium Semiconductor Corporation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
