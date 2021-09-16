Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFC40EB2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 21:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856396E884;
	Thu, 16 Sep 2021 19:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CD16E884
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 19:54:09 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 n2-20020a9d6f02000000b0054455dae485so4546348otq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nIxwaUEvO52JiUFv2rx1jd30G1rckEmUPljusYpNyWI=;
 b=Joc6lr4PDoc4m5zar8LCH+493RZcu7J49ntCbV9z2LFPi94TIZSxUbEVoF3Nb0efku
 0ZvmOceG8YB1Sgi7NeAI2fIdM6g9QAg43ppbbRjTNGk4hrWUrGPkg6DNgYoVk9Y08doT
 eFZU6PuKfUOgTn4k59Ypz6HBZjupf9jWmpoJKLsyKPqAWhvdaHmTnNyNSnTDtnyqxX6H
 udbvLUnk9844gYNFhyXIZlbkpH3cCs85fRrro3pLAxhikdjhW+HLmxwNsqZlqV3PC95a
 T1Zg2fB9gTVfICfXZ6jJJTJSjp/sS8/pJ7jwCR3qu8/s3q6lejG/ceP3xGVv56JIw1XY
 x+hw==
X-Gm-Message-State: AOAM531uCV2RozRtvLVhVTizUIcmzRS2HHEEAjKGVxGUmMMAm77GiNdK
 rUcOxDwM3VyHbPJMWarxsw==
X-Google-Smtp-Source: ABdhPJzDJKvWeXlCtxttQ7YBEykimFOuraagds1Vx92Sb1hTsgi4GQpIrMvHtEeNb+qonyTmRKYEag==
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr6073026otr.34.1631822048869; 
 Thu, 16 Sep 2021 12:54:08 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id a23sm955442otp.44.2021.09.16.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 12:54:07 -0700 (PDT)
Received: (nullmailer pid 1385604 invoked by uid 1000);
 Thu, 16 Sep 2021 19:54:05 -0000
Date: Thu, 16 Sep 2021 14:54:05 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <YUOg3T8nytBzxIHl@robh.at.kernel.org>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-2-paul.kocialkowski@bootlin.com>
 <1631710594.961761.935947.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631710594.961761.935947.nullmailer@robh.at.kernel.org>
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

On Wed, Sep 15, 2021 at 07:56:34AM -0500, Rob Herring wrote:
> On Tue, 14 Sep 2021 22:05:36 +0200, Paul Kocialkowski wrote:
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 302 ++++++++++++++++++
> >  1 file changed, 302 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xylon,logicvc-display.example.dt.yaml: logicvc@43c00000: 'display@0' does not match any of the regexes: '^gpio@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

You can ignore this.

Rob
