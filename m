Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5847922F75C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A188589D6C;
	Mon, 27 Jul 2020 18:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D143789D6C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 18:10:18 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z3so3663479ilh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 11:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AolHbyPhlAWhBYcDRE3hJ7vbSTWfg9WAuD5eMY9YYM8=;
 b=cX8+MW0FWv3RF8FjIc54flT2bMAIXJiDTe4lwILv7Qu1gbdxM5EEanFKpo3HmrwUHP
 PZoeSOKnmgk8AZO0Sllo1j0itXYvLnGznB/XsP9adwckdTEMiSJMHNxRLqVvPnRg0HTm
 5bX773wqBV5u8wCKT4Y6/Y+7eormAp0nMDVXlEpo0QzKgMDvXL7ZQRfvr0KE8Fm4Pwv2
 8J74YnuXqSDP08jEOwjVrTrwsvmydLoJaygtuCL4ks6/xn5qHm0Q59ecr3N1ocGDmABO
 TNlO0S9UpwFEQvaQNWVCLbEZn1IzwFceOGF7+HXkM9YByU9TRhicL0pElOsYtzOpwQ8B
 Qj1A==
X-Gm-Message-State: AOAM533j96VgrzrKRISlHaPqdMw9kVagqXk8eOvGfSB4BFfICrXb8pLY
 bqGWtY/+SRTXM5JDs1MItQ==
X-Google-Smtp-Source: ABdhPJxAU0CyMzjJd4gnIUQFQqnSfLPuYlRJ1weSi/Lg2wdatRIDKIHv/hn0Mw39jWkv5FN9Sdwrng==
X-Received: by 2002:a92:c8d1:: with SMTP id c17mr9036441ilq.166.1595873416565; 
 Mon, 27 Jul 2020 11:10:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j79sm8889371ilg.42.2020.07.27.11.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:10:16 -0700 (PDT)
Received: (nullmailer pid 633675 invoked by uid 1000);
 Mon, 27 Jul 2020 18:10:15 -0000
Date: Mon, 27 Jul 2020 12:10:15 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] dt-bindings: Add DT bindings for Powertip PH800480T013
Message-ID: <20200727181015.GA633248@bogus>
References: <20200725211335.5717-1-marex@denx.de>
 <20200725211335.5717-2-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725211335.5717-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jul 2020 23:13:34 +0200, Marek Vasut wrote:
> Add DT bindings for Powertip PH800480T013 800x480 parallel LCD,
> this one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/powertip,ph800480t013-idf02.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: $id: 'http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02.yaml#
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1336335

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
