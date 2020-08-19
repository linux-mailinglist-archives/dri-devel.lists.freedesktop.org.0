Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CA24A971
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 00:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B76A6E863;
	Wed, 19 Aug 2020 22:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4656E863
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:36:29 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s1so366273iot.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bC6aASYEgsmqX0lrYUMvyzWqmXHNI5bk9/vbQX0AirY=;
 b=l6lQGM+zAy0/S73gsaHQRAKf6x4d+DwkAZnD46FQKSiI+IR0b7JQ0gqUE/GT4liDw+
 tpilURWH3GLMY4PKOKJfXJ2HiWFOV9tQBlS06qxwnRLh5NHb6P9sgSC4+lnF7wAAR01q
 oCE6+OcqR3ZvB5Ae65KzkgM835QXtoTGOk7Mm3AEzgMrr2ScI0q8u7vB32ne2MxZGxoR
 VfFgASqLWYdCN6rQdJNRE5NOBuJ6qKc46KUNQ7fGH49BWUJaqhwyCxPnO5jyllODXBmn
 F6RgYyznMEs8q3SHFa3eByGOg3bKx6FETwryfUFS2JAtcjoW6lJegzUQmCB6uyO2FKUM
 2Vpg==
X-Gm-Message-State: AOAM530YOks+po2AC8YgYzE3TOUHAAX9IP542uBGFueaN7W35NzR6Dw+
 2BToXasQfB3RW9oVwjFFDw==
X-Google-Smtp-Source: ABdhPJyExfthK/G2i9U35sdrsHpH6q4ydgO7dbM/7WUr+hI2m5whIMc2HLDa2NliEenlvW3c4ys8/A==
X-Received: by 2002:a6b:591a:: with SMTP id n26mr147084iob.122.1597876589103; 
 Wed, 19 Aug 2020 15:36:29 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p21sm49152ioj.10.2020.08.19.15.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 15:36:28 -0700 (PDT)
Received: (nullmailer pid 2087313 invoked by uid 1000);
 Wed, 19 Aug 2020 22:36:25 -0000
Date: Wed, 19 Aug 2020 16:36:25 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 49/49] dt: display: Add binds for the DPE and DSI
 controller for Kirin 960/970
Message-ID: <20200819223625.GA2086431@bogus>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <6471642f74779fecfc9d5e990d90f9475d8b32d4.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6471642f74779fecfc9d5e990d90f9475d8b32d4.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Manivannan Sadhasivam <mani@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linuxarm@huawei.com, Wei Xu <xuwei5@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, netdev@vger.kernel.org,
 mauro.chehab@huawei.com, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 13:46:17 +0200, Mauro Carvalho Chehab wrote:
> Add a description of the bindings used by Kirin 960/970 Display
> Serial Interface (DSI) controller and by its Display Engine (DPE).
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../display/hisilicon,hi3660-dpe.yaml         |  99 +++++++++++++++++
>  .../display/hisilicon,hi3660-dsi.yaml         | 102 ++++++++++++++++++
>  .../boot/dts/hisilicon/hikey970-drm.dtsi      |   4 +-
>  3 files changed, 203 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/hisilicon,hi3660-dpe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/hisilicon,hi3660-dsi.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/display/hisilicon,hi3660-dsi.example.dts:25.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/hisilicon,hi3660-dsi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1367: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1347736

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
