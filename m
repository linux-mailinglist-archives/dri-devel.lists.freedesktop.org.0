Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EF4377D8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920D46ED8E;
	Fri, 22 Oct 2021 13:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C86ED8E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:24:38 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 r4-20020a4aa2c4000000b002b6f374cac9so1096968ool.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rRNhbdg2DSuhPmKmcEvYXvhzUYi1wo+w9CgilER+WOY=;
 b=oW//vuw+PiKk3v9ZoBKfKvAsLMRxPp4KMftAY4L7G1U3dj8AqWU6mq+4z6Ma0XYmrz
 nesGfzpel+OjOR2rzucHTLS3m8VKRV58cBJKR4RnqeGzpXHcpnIAd+Wq4QPHPHnHs2M8
 NZpAAYePVRAAnzXAmYYja3RmC/jkwE+RsSZi27V5PcQNlP3pp5qzv4NMbP81hPU2qQ0k
 qcaxlO8Vvzh+jcNr+EH9wOBBl8NKuazLN013Eeew/EVhWGLVlQks9tmFQ4TCgCrOQtVH
 yMMegUFUQ5VvjRtSrWNocIn1TiQABICG767UDzO4YprcVi3RcQsuKucA9JTn3s22h+kO
 04DQ==
X-Gm-Message-State: AOAM530c92b5KD18c0BJ7lqR7dcBelm8YYrrmv+bmlQ5GFqsbYYhYBo1
 HjnNrvR/BoU1CGlPibZc6A==
X-Google-Smtp-Source: ABdhPJz4OdatYL0OZZ1u/JwvBag0fE6+tAbXF8Bh1KkNtxb/vB+zb8WsUdn+LRpW8BPz72m+WtuPzA==
X-Received: by 2002:a4a:e292:: with SMTP id k18mr9212036oot.80.1634909077279; 
 Fri, 22 Oct 2021 06:24:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t8sm1667014otc.74.2021.10.22.06.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 06:24:36 -0700 (PDT)
Received: (nullmailer pid 2506514 invoked by uid 1000);
 Fri, 22 Oct 2021 13:24:35 -0000
Date: Fri, 22 Oct 2021 08:24:35 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <YXK7k01crkLuRfSq@robh.at.kernel.org>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914200539.732093-2-paul.kocialkowski@bootlin.com>
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

On Tue, 14 Sep 2021 22:05:36 +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/xylon,logicvc-display.yaml        | 302 ++++++++++++++++++
>  1 file changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> 

Since the mfd part is already applied and it's too late for 
drm-misc, I've applied it, thanks!

Rob
