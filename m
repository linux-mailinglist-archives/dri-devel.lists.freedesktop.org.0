Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38332FCDC
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 20:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E626E52A;
	Sat,  6 Mar 2021 19:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C976E52A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 19:46:44 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d11so4579134qtx.9
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 11:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dz08oUU8oV3VKa4xa4+vLLPEt2YVK+n5GIJg6+VztrU=;
 b=NN1Xo0UCXcPlD94ZF3uz2b04YTea0/w+RzQme8S42sfFjnv21VQRNW80zNW5hwelhX
 Eq4A+LUSA4ug1gpJik3tgLXXJUTOmSMUwmP16DTu/6q0/rzCiiiruKpGf44kDO0xqCb5
 0ZcKO9swvYEH5Lx3g8NAiQSs8FMMH6XP6TlKSilSGpPlomlujkfzmWiwla4LRv0yO7uA
 /Kldq9prwTLkhPfGtO6CcT5hO1VN1SjdTBm08hi2OhPSqOidr2xX3LzDuv6Wp2T7u6sf
 JaycESsPt4jnGPZUGadFcu9PzFIJmQWqhrienlFhxr595mGe4sdR2Ou9yzQ+cCyFGIvt
 OkcQ==
X-Gm-Message-State: AOAM531lrrpIn6+GjWcLYDpPBGle4sLJMIBa3HME5EnQStqRKi/ZDHk1
 i9ihr1zRfOv2kdPzA4ivMg==
X-Google-Smtp-Source: ABdhPJxw0Btrw6trPcNehtOx4+8KCZP9E/IrnkXLe9elDIlJdWYYymfGa+R3yv9JHoNqamNl8qaesw==
X-Received: by 2002:ac8:580c:: with SMTP id g12mr14483948qtg.14.1615060003891; 
 Sat, 06 Mar 2021 11:46:43 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id c186sm4470415qkb.107.2021.03.06.11.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:46:43 -0800 (PST)
Received: (nullmailer pid 1105712 invoked by uid 1000);
 Sat, 06 Mar 2021 19:46:37 -0000
Date: Sat, 6 Mar 2021 11:46:37 -0800
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: Add Jenson Display vendor prefix
Message-ID: <20210306194637.GA1105512@robh.at.kernel.org>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210305234427.572114-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305234427.572114-2-giulio.benetti@benettiengineering.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 06 Mar 2021 00:44:18 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "jenson" as a vendor prefix for "Jenson Display".
> Company website: http://www.jensondisplay.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
