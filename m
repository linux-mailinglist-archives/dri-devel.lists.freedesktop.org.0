Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAE40EB2D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6797D6E8AD;
	Thu, 16 Sep 2021 19:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77E96E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 19:54:27 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 y3-20020a4ab403000000b00290e2a52c71so2445982oon.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P8yKybFkj8lrDPXW7Os3C5NUGXbJPcqo5yhZY5pR8wY=;
 b=fvz1b9rG+gIRCkwNdxTW/uaE9GPHqfSYt7c3kvieDNV6QczUVbUIZ1O2M4fXPIvK+o
 VtbfcD5t73nBdWTej9ddqojgtIHi37Oe4SejfAy4i3VGV7nsmie7zrStJ3WeSWRcfAAj
 41a7DawR7exJCI8m//O2kAENfo7aFGPmjrBqusQ7vbpz5yNZqfMax4FOm9dD5G6geVkn
 TdlvA97Jjv8n/Bue0fvFk/s9Zg7zCjhVB++Om6KD+0jgPqhJup+URpPdDJngY2BiGgRv
 7cmGAr7uG8f+FN0SIPCi0SFydigqcYYh4QMiftBmSpuf20CC356D+uyfTChIowH6Supl
 c0bQ==
X-Gm-Message-State: AOAM530yfM1mBrs+Jk3MVq6NpUlydRSmSl+6nDvvZ3dmbTm/EF4u/4sF
 SlJrslPcPDl7PnDla4fXXVWVJtg4Pw==
X-Google-Smtp-Source: ABdhPJzqQYc9fk1ideD8xo+zjME0IBa/yn9xoKgUQy0xFxtBQsjU9UzwvguQUm5pLqb12ErUNwpuNQ==
X-Received: by 2002:a4a:b502:: with SMTP id r2mr5800419ooo.70.1631822066935;
 Thu, 16 Sep 2021 12:54:26 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id z7sm1010458ooh.38.2021.09.16.12.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 12:54:26 -0700 (PDT)
Received: (nullmailer pid 1386188 invoked by uid 1000);
 Thu, 16 Sep 2021 19:54:23 -0000
Date: Thu, 16 Sep 2021 14:54:23 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v9 2/4] dt-bindings: mfd: logicvc: Add patternProperties
 for the display
Message-ID: <YUOg7wxwRuQC0pK7@robh.at.kernel.org>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
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

On Tue, 14 Sep 2021 22:05:37 +0200, Paul Kocialkowski wrote:
> The LogiCVC multi-function device has a display part which is now
> described in its binding. Add a patternProperties match for it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
