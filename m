Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C25F7957
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 16:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1810E234;
	Fri,  7 Oct 2022 14:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85C10E2E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 14:00:45 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id h19so3704536iof.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 07:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csoNLenKkQ4IM8xjMQG0bIhC/2mIv8dzWfpsvwSXftk=;
 b=7MfOUniyZszSYgD+OW51oQv9TT7GAIUp+OAtf7Fm/nUROxNkZoW5mXX5upf0pK1e2y
 CnOS1yEqpr5CtxNZRmQlMf9SBEVE2d+X1G7D6Odt1NuIptEIBkv309yAKF0hgeF9wycK
 x/7E4tiZq9exSS+QzzJ8sLt1Y5ElTsaT0TvTnrOQYJa+w3hR6tqWb5SKyBG+6HHQyyfz
 rdFRmZH3mZyfuSE1XY1Mys/EScTt/zGFQYsiAtgbd9GcUh9n12OLtS/2N9iJL4kHMi57
 YR0VZVfdCVto4UUMHtFuxt+IYNCfUoyMWnTCh+0vtYqgnNR6G9oM0sOz5H8W5go+yMTP
 +Dnw==
X-Gm-Message-State: ACrzQf3uC3YNTqjEHXpYAYDv73jzM2jLj2p7ygLTjgC5gNyLMtE8IMVu
 TTKOWqOC2VHoiR17fnb4Lw==
X-Google-Smtp-Source: AMsMyM6c5uqErPkvb0cF9pXEqiaY+4vraXeH4+b12PZU06NVe8Fy0HFW9g8qFAtISuQIbWPWfaSSKg==
X-Received: by 2002:a6b:3f02:0:b0:6a4:b54f:c280 with SMTP id
 m2-20020a6b3f02000000b006a4b54fc280mr2353062ioa.46.1665151244332; 
 Fri, 07 Oct 2022 07:00:44 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05660208cd00b006bb640769ecsm1009671ioz.13.2022.10.07.07.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:00:43 -0700 (PDT)
Received: (nullmailer pid 284746 invoked by uid 1000);
 Fri, 07 Oct 2022 14:00:42 -0000
Date: Fri, 7 Oct 2022 09:00:42 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Message-ID: <166515123936.284567.14313128016482516100.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-2-thierry.reding@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Oct 2022 14:49:40 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to support framebuffers residing in system memory, allow the
> memory-region property to override the framebuffer memory specification
> in the "reg" property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
