Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A84004DD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464E6E8BF;
	Fri,  3 Sep 2021 18:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8586E8BF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:30:53 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so135536otc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m6Qtq7FbAyWD8i7ZUvpyRShbytOj8jjajHVMhB/PPaw=;
 b=RNcnrr0tKBpmL/kCp8pSchR4sslUtjCJOlJAHlAgArUatUUg344TE0j24C1uymTmuk
 pNpwqcCzVVwhMb8LT6CYi5Aa2GcqxxyQizzM5izJwkrvUN+Utg9VhtSsioNLiKYJTz8X
 8evj2PxyfYPdtPLAfhTM/TJdeyAZ19f2P8I0o7bak8VkqshquQBQjwlFOlEIKcMlKZJP
 vWGuNSWmNfmlBRv5iKJ/DcBzzqG5efqvspqW0iCXb+XHPakCH/C4nwKaMzNqDaep25/6
 rz2dwBoMAaCUAK/5zXClnuwWhxLkHphswwDRlS2JthF7o63WiTe6cXWkaALSl/a6KPO9
 lZIw==
X-Gm-Message-State: AOAM531HM109v4ZmoOM00R+WIsD96GUDDqpRM8h9H7B6aEk6zHcsmGyx
 FVeS6WLNirZyNbIC3eR2sw==
X-Google-Smtp-Source: ABdhPJwNEBYiV1vYlkQIITzde3RW+yv4MdXv2ikwsHVVbkS36p/1lzZHPkHmKL1pYekvong6N/iDPA==
X-Received: by 2002:a05:6830:4410:: with SMTP id
 q16mr361392otv.216.1630693853075; 
 Fri, 03 Sep 2021 11:30:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j4sm1166355oom.10.2021.09.03.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:30:52 -0700 (PDT)
Received: (nullmailer pid 3240761 invoked by uid 1000);
 Fri, 03 Sep 2021 18:30:51 -0000
Date: Fri, 3 Sep 2021 13:30:51 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 13/52] dt-bindings: display: aa104xd12: Remove unused
 vcc-supply
Message-ID: <YTJp260UC0xoWs73@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-14-maxime@cerno.tech>
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

On Wed, 01 Sep 2021 11:18:13 +0200, Maxime Ripard wrote:
> The Mitsubishi AA140XD12 Device Tree Binding was requiring a vcc-supply
> property. However, neither the existing device trees using that binding,
> nor the driver were actually using that property which is also redundant
> with power-supply. Let's just drop it.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/mitsubishi,aa104xd12.yaml         | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
