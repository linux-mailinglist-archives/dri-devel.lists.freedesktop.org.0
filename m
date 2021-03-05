Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218332F61A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799DD6E3AE;
	Fri,  5 Mar 2021 22:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22386E3AE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:52:37 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id j8so3417091otc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fUZFQaxs9RK/nivefXJKnBUxIyLdj8Lj9lxBmJxd9y8=;
 b=ter4N6BTv0V/MkgJ/3VTVAjxGlht28vvmwlsXkq/PFQcFIDe/jpsqnNiCrvxRzAExa
 G+aS00yP7pO+zthnPCBmEW/rmTQtrcKAn4KN2nOAKilMV2v06Kz1K6EJxLOyesdZxUZS
 PwlMsacjotPZl4F8b42xXRA1ZQt1i5cVWVJ/7qa13gtzgKf11J/jjES+IomOIsJXTnIy
 /Wf3Vv/21J313lpgczQ/hLUZLlrvVUtUgcFVxq8zxnb6z/Mq5eQyVn0iaLCn9BEuZ1R8
 aRwQEwOVmwFgnt8Rbso4vp35YeyH//P6DMxBkGaJCDBwn/+BQINXa08tmsBlBDPEbYHk
 5YcQ==
X-Gm-Message-State: AOAM533HHFTZz7vIHR0rxLcs506AodHp7ZcdBiBSD/UQMMDnuNpJpBTH
 wcW+EggqMs+PC7Ubq4aQOA==
X-Google-Smtp-Source: ABdhPJwlh+CUnCHrztqC0i3YQRWh8hWwtwlWL3hesELWhTlIBXv8/e94LdBUBtiOVgIXc/QuyRjaNw==
X-Received: by 2002:a9d:67c2:: with SMTP id c2mr10005348otn.343.1614984757122; 
 Fri, 05 Mar 2021 14:52:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g11sm835060oif.9.2021.03.05.14.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:52:35 -0800 (PST)
Received: (nullmailer pid 790202 invoked by uid 1000);
 Fri, 05 Mar 2021 22:52:34 -0000
Date: Fri, 5 Mar 2021 16:52:34 -0600
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 1/9] dt-bindings: Add Jenson Display vendor prefix
Message-ID: <20210305225234.GA790152@robh.at.kernel.org>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
 <20210218225458.823773-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218225458.823773-2-giulio.benetti@benettiengineering.com>
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Max Merchel <Max.Merchel@tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Feb 2021 23:54:49 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "jenson" as a vendor prefix for "Jenson Display".
> Company website: http://www.jensondisplay.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
