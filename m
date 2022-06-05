Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861F53DE4A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 23:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4A11A512;
	Sun,  5 Jun 2022 21:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C488111A512
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 21:09:49 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id o68so9712820qkf.13
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 14:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VmVbhNLtb1RBxcowUesmpHLJYJQrkkd5bbnl1V1jqZ0=;
 b=TuSgPI3mfzernWy6hsT36uw1KJ5FXXQqcHEI+TZA8irl6xJ0itw/xfl3d8twIoe8p+
 j7i+y2Qqt9Tz/Z98I/RZ10igCSTxpjWHB0V4VHtzjRFyn7v7kpy6ZGqYGgmIhb8H9WPL
 agqk0xSNeq0ADH1CkrmiWLqT4oxm8F11w10F8qAXG2YIqhGm0K0sXozxlo4S5G/GxjBi
 c14hI+RRf9RyXx/o/67N5z1I6a4InQLaQWYk6Xx/mgYo7rwxztrAUa7IPyOEg0ypPBPi
 2w0kr1Bn3ZikJdFSXz7oB9PCR3LgvkKmcZ8sYpL68GLNwSBLmcn54mx/zmANW/qo9GFR
 2WTQ==
X-Gm-Message-State: AOAM532m11zB/MD/JigACJBH1AxVuDGpD9u/cZUAnaeDlAZ/bluZe4iN
 ysP6nvEKanWtF6+CEmVetQ==
X-Google-Smtp-Source: ABdhPJyxMLggMt+PXs1Z/jU6VjA23KSMaMsHvOuucD8iyu4V9ROgt+a7KcL/3ZYWBZH5lcdrsbC4VQ==
X-Received: by 2002:a05:620a:12da:b0:6a6:b06b:2ee3 with SMTP id
 e26-20020a05620a12da00b006a6b06b2ee3mr4398234qkl.725.1654463388801; 
 Sun, 05 Jun 2022 14:09:48 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a05620a249400b006a6bc598052sm1256098qkn.95.2022.06.05.14.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 14:09:48 -0700 (PDT)
Received: (nullmailer pid 3522372 invoked by uid 1000);
 Sun, 05 Jun 2022 21:09:45 -0000
Date: Sun, 5 Jun 2022 16:09:45 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 2/6] dt-bindings: drm/bridge: ti-sn65dsi83: add
 documentation for reverse lvds lanes
Message-ID: <20220605210945.GA3521050-robh@kernel.org>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
 <20220530150548.1236307-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150548.1236307-3-m.felsch@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 05:05:45PM +0200, Marco Felsch wrote:
> The TI converter chip can swap the LVDS data lanes in a pre-defined
> manner. This can be useful to improve the layout characteristic.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 58 ++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
