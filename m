Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AD2A0DA2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 19:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D504C6E9E5;
	Fri, 30 Oct 2020 18:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713776E9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 18:42:28 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id z14so1812165oom.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 11:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hVpzN2Y06wbPSBaS0y+ngz3c1r0CShTKe8sn3RB15os=;
 b=Jn4ciF9KvDH4ASSLMFKcMJ2blCdppq7ctZ9WFkHZFFhdOMfrR51ErnR1gSpgg9quYE
 iDJizkLC1n96xjgASnKloMkppGJlIxfRzlLo99oRM9b0nAll9HwxEjPDr17SqA0lE/Er
 ihbGa2HPr0kJlLGkbBPWsSAi9NpG1Cer4k776PEZ4np1ho/5uBEJrzlF0OFaaCYcfiEK
 d5CmXJvOKOGltn0orN6erBqlEtWGbLgEjGmqsTbNN6ApIKIPzjDHqQQ1mXrDG8PECnus
 MkWuL+jcXGvIzsjO7kig68enKNwK2NMyZc/+BpHq5zs1R6MtpcRiqqW9G/Nx7sHN+ELq
 WrVw==
X-Gm-Message-State: AOAM533s4t8GUeSxvRMdLuOXkgSyH+cDcAIN0RP/VW5kqnQv6qzH4fI6
 NazBn0go8/oXAvvFP4C8Uw==
X-Google-Smtp-Source: ABdhPJwuElRorIJ/ryeLFKrkeSnYyHD6uSpDInFB4YcyWH/0aW7YRFBBUvhD92ko8NoOXRBrDuarGQ==
X-Received: by 2002:a4a:8e02:: with SMTP id q2mr2989133ook.60.1604083347817;
 Fri, 30 Oct 2020 11:42:27 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j3sm1590729oij.9.2020.10.30.11.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 11:42:26 -0700 (PDT)
Received: (nullmailer pid 4125177 invoked by uid 1000);
 Fri, 30 Oct 2020 18:42:25 -0000
Date: Fri, 30 Oct 2020 13:42:25 -0500
From: Rob Herring <robh@kernel.org>
To: Bogdan Togorean <bogdan.togorean@analog.com>
Subject: Re: [PATCH v2 2/2] drm: dt-bindings: adi: axi-hdmi-tx: Add DT
 bindings for axi-hdmi-tx
Message-ID: <20201030184225.GA4125095@bogus>
References: <20201026064122.2831-1-bogdan.togorean@analog.com>
 <20201026064122.2831-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026064122.2831-2-bogdan.togorean@analog.com>
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
Cc: devicetree@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 08:41:06 +0200, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. AXI HDMI TX
> IP core DRM driver.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>  .../bindings/display/adi/adi,axi-hdmi-tx.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/adi/adi,axi-hdmi-tx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
