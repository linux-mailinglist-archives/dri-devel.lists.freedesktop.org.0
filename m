Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18A35A165
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 16:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284976EBB7;
	Fri,  9 Apr 2021 14:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659B46EBB7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 14:47:30 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso1179916otv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 07:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0V92N7vT+lUzz87n7KGp059iqscBjCvjd5Xj1nP3DBU=;
 b=hcZ8fHiNsnEPYTr1ofkR0X4JJkohyhOreN7wZT3WYs0fwSoHOhH/G+NfBjfp+Kxtju
 tF1P3o3jgcUiMbAgwa2rWeUHVYavVAVsCXm8vdzqC6asBdNqIBbqLyP9hCg5nFTvbtPe
 mWIAMzkwmChD5XJs7GAvMg3xWJ8oSyzaUXpYUofYDU0WMX6J0Kfeck9HPvyh0joJ8eBb
 7IKSYBRS+RiZSKuUGMz1DrNYorgT9dOKFdfeuytagvPcnOTABpdbOh2KgKq38lwWXDRz
 ysPOahfOX5xUUyByjzHpO/mwH7Xb33U4ZXMyJUFrD+hnb/DB8eNIHWtVRi5DWCwi3l3p
 Cf+Q==
X-Gm-Message-State: AOAM532N6RY6Pl6/p/0WMme4b22yqVSobKIYiZj8b+Egh6yPKuZL9uvo
 z5BbOY89gRakQooc1DoWPg==
X-Google-Smtp-Source: ABdhPJwjLJtZpPVjegVIRtRAIAj7Yv/lPl9U6lNLwRC20v8gG3z0aPUD0nr+q7SaxuV4ssyS7h6YVQ==
X-Received: by 2002:a9d:7699:: with SMTP id j25mr12569409otl.177.1617979649690; 
 Fri, 09 Apr 2021 07:47:29 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s131sm553775oib.14.2021.04.09.07.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 07:47:29 -0700 (PDT)
Received: (nullmailer pid 3627857 invoked by uid 1000);
 Fri, 09 Apr 2021 14:47:27 -0000
Date: Fri, 9 Apr 2021 09:47:27 -0500
From: Rob Herring <robh@kernel.org>
To: Nava kishore Manne <nava.manne@xilinx.com>
Subject: Re: [PATCH RFC 1/3] fpga: region: Add fpga-region property
 'fpga-config-from-dmabuf'
Message-ID: <20210409144727.GA3625530@robh.at.kernel.org>
References: <20210402090933.32276-1-nava.manne@xilinx.com>
 <20210402090933.32276-2-nava.manne@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402090933.32276-2-nava.manne@xilinx.com>
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
Cc: devicetree@vger.kernel.org, git@xilinx.com, trix@redhat.com,
 linux-fpga@vger.kernel.org, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 mdf@kernel.org, linux-arm-kernel@lists.infradead.org, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 02, 2021 at 02:39:31PM +0530, Nava kishore Manne wrote:
> Add "fpga-config-from-dmabuf" property to allow the bitstream
> configuration from pre-allocated dma-buffer.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
>  Documentation/devicetree/bindings/fpga/fpga-region.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> index 969ca53bb65e..c573cf258d60 100644
> --- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
> +++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> @@ -177,6 +177,8 @@ Optional properties:
>  	it indicates that the FPGA has already been programmed with this image.
>  	If this property is in an overlay targeting a FPGA region, it is a
>  	request to program the FPGA with that image.
> +- fpga-config-from-dmabuf : boolean, set if the FPGA configured done from the
> +	pre-allocated dma-buffer.

Sounds like an implementation detail of the OS. Doesn't belong in DT.

Rob

>  - fpga-bridges : should contain a list of phandles to FPGA Bridges that must be
>  	controlled during FPGA programming along with the parent FPGA bridge.
>  	This property is optional if the FPGA Manager handles the bridges.
> -- 
> 2.18.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
