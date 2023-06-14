Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33FD730B9C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 01:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC0E10E072;
	Wed, 14 Jun 2023 23:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7994D10E072
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 23:34:55 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-777a9d7efabso260799139f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 16:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686785694; x=1689377694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUtSSGVFN/yztXgk7QCaXH/KHJwVxtAYPWqGRDI7ZjQ=;
 b=lByvNlCq5WowEQ+DMMd+aAwf3peRv+gko1ccQRlkJEwr19gaINQj6E0I67NNFXw1G+
 ubCqZEUZk8wcjaob5s6jK8f1Kil7nd8KHHzsQA5pO5Mzk1OgwUQyy8STQum1BSKsOGen
 u3cJXvWVJr5BA9+lFHmZ+YSPSHElq3nxBiTjs9s0RYIwWb2pyCzgp+g/E0/lGFB5qjpR
 CcLOAPggq/z2qMkCFPf/YOJGcX7Rndfmp/J8GdXGyQAenFRtnGu81vlZhaw9TgIZz85d
 Wtzez9/kGJFRKkJkTrRl7dexTx0lmXkZqQH48e6UlKZAbvepVUb/fbJ2J8G79B9SoUN/
 /zEg==
X-Gm-Message-State: AC+VfDw1vuEnvULnhDk0Yr53wG4NiS7haQcn4JLtgvXbkCxRkFy0XdtY
 up+xySYjbWQrlbaA9cZDCg==
X-Google-Smtp-Source: ACHHUZ6oXhegu7bEeIdTFjl2xc570z5mqCu0pw4FCI2MAW8eGDOpi2PDgUNBv3rpLuUD1XQFGvZAAg==
X-Received: by 2002:a5e:df43:0:b0:777:8e86:7702 with SMTP id
 g3-20020a5edf43000000b007778e867702mr15365097ioq.16.1686785694195; 
 Wed, 14 Jun 2023 16:34:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a056638101700b0041cd626ea0csm5364731jab.147.2023.06.14.16.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 16:34:53 -0700 (PDT)
Received: (nullmailer pid 3202829 invoked by uid 1000);
 Wed, 14 Jun 2023 23:34:51 -0000
Date: Wed, 14 Jun 2023 17:34:51 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] of: module: Export of_device_uevent()
Message-ID: <20230614233451.GA3201131-robh@kernel.org>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
 <20230609155634.1495338-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609155634.1495338-2-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 05:56:33PM +0200, Miquel Raynal wrote:
> The content of of_device_uevent() is currently hardcoded in a driver
> that can be compiled as a module. Nothing prevents of_device_uevent() to
> be exported to modules, most of the other helpers in of/device.c
> actually are. The reason why this helper was not exported is because it
> has been so far only useful in drivers/base, which is built-in anyway.
> 
> With the idea of getting rid of the hardcoded implementation of
> of_device_uevent() in other places in the kernel, let's export it to GPL
> modules (very much like its cousins in the same file).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/of/device.c | 1 +
>  1 file changed, 1 insertion(+)

Assuming Thierry will pick this series up.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 0f00f1b80708..90131de6d75b 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -312,6 +312,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  	}
>  	mutex_unlock(&of_mutex);
>  }
> +EXPORT_SYMBOL_GPL(of_device_uevent);
>  
>  int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -- 
> 2.34.1
> 
