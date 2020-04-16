Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6851A1AD155
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D961B6EB68;
	Thu, 16 Apr 2020 20:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBBB6EB68
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:42:00 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k21so4264806otl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=anW0cTk2V2JJay0BG4lZbAZX39UmWgVy33oQofhYL+o=;
 b=lJdE0ifjUNsnABFrfS1QqIVnPqe80/ycEzcoKUvgzHYVtpg9WdImlIvpHkbWM0BlU3
 7gEFYvrLrPBasireIc8v5icz1h3O5UHyIsl6zd8MnogF2bMEmD3Pu62EirnJul4fVFHD
 fE6HSZtXz3O7I/qNaUlNKvFnw2GJdxsjYlgLAPkRpdGu1q4m5JWQTeSkI0TNk+N+acZi
 H8Kw6bfp6G1CgtEnLL9hOEzajZ4EjCMkEWscTt7rHTB24fM9WAVZUSejmgpX9AwVJbeL
 E8X0KB1RhGbeI3kPGuv+aZqjOWhyr/mBJ662+D59tCieqrJrlRWARIOqteDUADbR+Z61
 h9vw==
X-Gm-Message-State: AGi0PuaMYpTbbOFAfgh9E9g7DZJCzHmxosazXEx6KmPjkaUl/V31OmvP
 XELR6r+ieBxUed+wm49pWQ==
X-Google-Smtp-Source: APiQypLW3db/YOgTAVu/J1ZAay4EFYrxFtuax8O/ijjNSMUub8dIEYBEUvJBFYL72MQmqT4sac6WuA==
X-Received: by 2002:a9d:6644:: with SMTP id q4mr39174otm.229.1587069719796;
 Thu, 16 Apr 2020 13:41:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s13sm8064384oov.28.2020.04.16.13.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 13:41:59 -0700 (PDT)
Received: (nullmailer pid 13530 invoked by uid 1000);
 Thu, 16 Apr 2020 20:41:58 -0000
Date: Thu, 16 Apr 2020 15:41:58 -0500
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200416204158.GA1006@bogus>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-samsung-soc@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020 10:35:08 +0200, "H. Nikolaus Schaller" wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
> 
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers, interrupt etc.).
> 
> In most cases, Clock, Reset and power management is handled
> by a parent node or elsewhere (e.g. code in the driver).
> 
> Tested by make dt_binding_check dtbs_check
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml:  while parsing a block mapping
  in "<unicode string>", line 74, column 13
did not find expected key
  in "<unicode string>", line 117, column 21
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1264: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1270997

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
