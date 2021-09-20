Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E9412748
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1D6E852;
	Mon, 20 Sep 2021 20:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647A06E852
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 20:29:45 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id u22so18254663oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 13:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AH19fZDa3RGD1bXp8KensKJGxcb/KKL33WSHbuvr/mU=;
 b=MR/sfOl6Sz7vTuzJOWMbFMSc1q48G1E03SRzCz5e19M9CBbTCa19ln2IPhk7L2NWmd
 Dr2yo50ecgtFJBS+KFNyVczGs5Ckb3TSKkdHmhhbvWBz4OFgTOfJST32jHRbp7N5VG9b
 Y9eNrh+ajDJXZUUgiNJIYRA2AXG61hC1gVjm9E6L0odn1QjGdhUqHe2w/TgRmnCnbpRR
 gD3ic6PNiuVIvkdppP+2+ISyJ5CmLVDa4e0iTqasoevpLPJ+Yrq8E5wSb5T9eEp058ND
 3KiaP8e+WVDjXiMG7V4JAwBJXyh6fo4ebYiw+uxEpE3Hglj1Bq1cy782H9nLuDfixSyu
 /iww==
X-Gm-Message-State: AOAM5304CA8r8bhUx+5mvI52Xvk5XO+/VK73cAHhXXvINcMeqUwXQQ17
 gS4H3zMgauHgKn4MiFFvqg==
X-Google-Smtp-Source: ABdhPJxbK/iL/HBM5wgfss+lB7OVXLSTbwGo6rZFtSZ7S8wUZy7rjh4eYLbR2TGSaErAnOS1tB3eIw==
X-Received: by 2002:a05:6808:1a29:: with SMTP id
 bk41mr733432oib.167.1632169784453; 
 Mon, 20 Sep 2021 13:29:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p21sm3431243oip.28.2021.09.20.13.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 13:29:43 -0700 (PDT)
Received: (nullmailer pid 697302 invoked by uid 1000);
 Mon, 20 Sep 2021 20:29:42 -0000
Date: Mon, 20 Sep 2021 15:29:42 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, linux-tegra@vger.kernel.org, airlied@linux.ie,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, jonathanh@nvidia.com
Subject: Re: [PATCH v6 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YUjvNmsPEBZHVDw/@robh.at.kernel.org>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916145517.2047351-2-mperttunen@nvidia.com>
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

On Thu, 16 Sep 2021 17:55:15 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Elaborated description for nvidia,host1x-class.
> * Added default value for nvidia,host1x-class.
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

With the yamllint warning fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
