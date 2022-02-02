Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7F4A696A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 01:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051BD89D40;
	Wed,  2 Feb 2022 00:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3A89D40
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 00:54:06 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id u13so20627602oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 16:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jr3OiPevkuWKw1kfTnZXrjitNLfSQpL7aNzeoMhYRLM=;
 b=gjBK/MXZqI4FpXk1+VnEAZJwYDjRL7n1RqjZxB7SR42MSQXvf1ro4oXhhLXKRmgGD6
 GKyXF+J/2npfqIUyfMkLRBXqQO3Au0iIjXB1PH/CmcHTdMpFFmpLE6+KMda/Jc2xlYeF
 Tw8Yt3yM72qD4CjMJO4fp3TYFKtfXT+/JzzNadgsUcgddzgShrl1sPEjMDhhQYWJ7UC+
 qhRg4LOeNsI42Vb/TJLmCueCUS4ysSTIvYXF52BWcayCpxNg/Eq5LYdW1NtoUWqWZuke
 7RgCfOrA/Ysa2eDAcA11XJrm8O/RN05dZmnCMvcA3w1h/InV6cgafMMygSyUM5BphWx1
 GGNg==
X-Gm-Message-State: AOAM532tVFRCnHoZDZudncRsmSre9VzcY0l3jdCmz4n++vULPp79jt7E
 fvZEfRRRYpTyxfsP4YVPbA==
X-Google-Smtp-Source: ABdhPJxs33mORGQ/nk9kC8PxG13SiBpfZLnh91us3e4V8rtbdnjB8OH17W6d3OSkLbIIpOz/7nFORg==
X-Received: by 2002:a05:6808:e83:: with SMTP id
 k3mr3129454oil.215.1643763245921; 
 Tue, 01 Feb 2022 16:54:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v78sm8788349oie.18.2022.02.01.16.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:54:04 -0800 (PST)
Received: (nullmailer pid 1093132 invoked by uid 1000);
 Wed, 02 Feb 2022 00:54:03 -0000
Date: Tue, 1 Feb 2022 18:54:03 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mfd: logicvc: Add a compatible with
 the major version only
Message-ID: <YfnWK+rmHCwcJLL/@robh.at.kernel.org>
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
 <20220120150024.646714-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120150024.646714-2-paul.kocialkowski@bootlin.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:00:19 +0100, Paul Kocialkowski wrote:
> There are lots of different versions of the logicvc block and it
> makes little sense to list them all in compatibles since all versions
> with the same major are found to be register-compatible.
> 
> Introduce a new compatible with the major version only.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
