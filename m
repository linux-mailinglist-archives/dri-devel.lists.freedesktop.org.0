Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F6248BF2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 18:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCDF89E2A;
	Tue, 18 Aug 2020 16:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF489C21
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 16:48:17 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s189so21876592iod.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 09:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KImiBwzNWf5aXeRH8pMXlYk8GtbO84LBcSTU7lw7AYE=;
 b=nhhjInN3RQuKbG1S8+tSDK4HRas6xXxpG98brt2iC2TRz/HiiR32OJvqMwPr12fsjW
 nu14L8v1xsK0cs5mDyEhduiAjxsJ040U5qliw2GJ/S8XGL+cWUKpSFaKq4410wt/VAAl
 Sdju8LeXGoNMQra+2MuZtSCZ0K/pezY0wxH5lnVqfB6Hmqb84G41y7KQ9uMP17AxuP+r
 EQa5axpIgbiBttqTl4LcpTf0Eo+zKwqnKG+OfkZiHPaPw2RKe8KG/BL2UHf6Z2wYvkD2
 aHYW3ycwRmiYL+wOduUgBxDcT3aDGkTHWzklWEa9hSWcYQgmPlTppUf+7EH074hdIYB1
 ydqg==
X-Gm-Message-State: AOAM531OvIx9kizSlKmtMIZRUGF6uyY/cu6j/bJOSK8t9LepFTltNVsm
 AIjex++V5Gk4tYjhQhJOXQ==
X-Google-Smtp-Source: ABdhPJwJYfpD4QBhfIN9mFdiDnmYYj+3q6cflyF3DxQm7aifzQDaQgcPKMWkNslzO9FXrSXFaDSQlA==
X-Received: by 2002:a6b:e216:: with SMTP id z22mr15957990ioc.97.1597769296997; 
 Tue, 18 Aug 2020 09:48:16 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id 82sm11101331ioc.34.2020.08.18.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:48:16 -0700 (PDT)
Received: (nullmailer pid 3602657 invoked by uid 1000);
 Tue, 18 Aug 2020 16:48:12 -0000
Date: Tue, 18 Aug 2020 10:48:12 -0600
From: Rob Herring <robh@kernel.org>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Subject: Re: [PATCH 3/3] dma-heap: Devicetree binding for chunk heap
Message-ID: <20200818164812.GA3602349@bogus>
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9@epcas2p2.samsung.com>
 <20200818080415.7531-4-hyesoo.yu@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818080415.7531-4-hyesoo.yu@samsung.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, afd@ti.com,
 labbott@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, pullip.cho@samsung.com,
 surenb@google.com, akpm@linux-foundation.org, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, minchan@kernel.org,
 joaodias@google.com, iamjoonsoo.kim@lge.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Aug 2020 17:04:15 +0900, Hyesoo Yu wrote:
> Document devicetree binding for chunk heap on dma heap framework
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>  .../devicetree/bindings/dma-buf/chunk_heap.yaml    | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma-buf/chunk_heap.example.dt.yaml: chunk_default_heap: 'alignment', 'memory-region' do not match any of the regexes: 'pinctrl-[0-9]+'


See https://patchwork.ozlabs.org/patch/1346687

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
