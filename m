Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6265F795B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 16:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE510E2E0;
	Fri,  7 Oct 2022 14:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051CE10E2E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 14:01:16 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id d196so3661437iof.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTfEzj6wTBPBNgpH4rAPvyQBfg2nW7VHaZnm3c1rV34=;
 b=h2m4VQCH3OOKsl7JEElKePsgRu2yX7AKeT9THO6QpJ2Ky03Gms+4wmKXI91+O7EPhk
 HEq4WaiadipB7W+2xrhqLI8KEm+SfC3lVLrhq12ecCVONW9/fGmij/pJnxkpcRMnoueF
 ukOfGSZwYQYESImnahReBP6hDVaN1EgtcRV3fq8eDMb6y8f50Mutem6AuUFahMpdXE8F
 ef6XLuCCg5YyUpM4z6r8dJIWqpW9i8l+cVSRKk21kxXoIn//H4y9SUX/oRJitifhIYnr
 r4w8uRevr0BT11wubz1gPXERGsTUWFp/E/izPtW0esygrj4vk0U3XgnYT0d1rl0rk/V7
 iuCA==
X-Gm-Message-State: ACrzQf0OgpidKltkWl3uxZke00nmfRwOe22hMRZKaKLBetgdqnfk1ZrX
 n6e4IIXe+OlCnIKKQ7zWWQ==
X-Google-Smtp-Source: AMsMyM4QqQQuOe7tr4Lb8VfgEwCm9mt4LP2psPTY3hHrmFcFBAk2Nic5yqcRIdeyGE3eroFrdB07iA==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id
 v187-20020a6bc5c4000000b006a24ab26490mr2258978iof.129.1665151275229; 
 Fri, 07 Oct 2022 07:01:15 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
 by smtp.gmail.com with ESMTPSA id
 w72-20020a022a4b000000b003632e326dbfsm888184jaw.79.2022.10.07.07.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:01:14 -0700 (PDT)
Received: (nullmailer pid 285402 invoked by uid 1000);
 Fri, 07 Oct 2022 14:01:13 -0000
Date: Fri, 7 Oct 2022 09:01:13 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: display: simple-framebuffer:
 Document 32-bit BGR format
Message-ID: <166515127213.285348.14742074141984076012.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-3-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Oct 2022 14:49:41 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is a variant of the 32-bit RGB format where the red and blue
> components are swapped.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
