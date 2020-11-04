Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D402A6CB1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 19:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6E06E22B;
	Wed,  4 Nov 2020 18:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08866E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 18:32:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n11so20244848ota.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 10:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oghSgZxFlVBv7JU4WB3s/OwRzfJOnjFiQ7TPHojsDUU=;
 b=sFMy+9DGZsfZ+a4RoCiFgvu92vYliZx8GS8xhYo97QEmkjyfb/2Ihmt2A+o9BbyVXm
 fPJ579uUopbJO/XZjpr5XaPHFQd5ShROpFirUHMXZokzsYrxqh0nfWoqZGX61cVTyNFS
 C1/pIkyUGMbxZKwNFqfAwBC0KsEOqzyTszpg8z4VQifXOCYlXOOuh0AXf7l/nvLXjUeS
 Dg0PgJT07k53Wxt1sHrhFCtOw1w/p1IgVRJnVhpf1SfdbrGlt05kig0l6i5Zkk8AKg7x
 PgHuKN7EiNt4KDXubuOObb0iEuwF4tqpy6SujlfzxIWcnikns+AORzfgzeGdMP4Nf8HZ
 0lOw==
X-Gm-Message-State: AOAM533pw+n4KrSg7YNePrwqyVj2gzhy+qQfsuOE+q91ATLwwqZFou40
 4mLnrberAiTTO6B2d6nlNw==
X-Google-Smtp-Source: ABdhPJytEnCxIKIlfBfza+NMnBCBgry1XIIkp5fTiGzOjNZ/aBg1i1I8QrMf2ufeUpbIQjxyFPOseA==
X-Received: by 2002:a9d:649:: with SMTP id 67mr20405397otn.233.1604514728036; 
 Wed, 04 Nov 2020 10:32:08 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 186sm742366ooe.20.2020.11.04.10.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:32:07 -0800 (PST)
Received: (nullmailer pid 3914664 invoked by uid 1000);
 Wed, 04 Nov 2020 18:32:06 -0000
Date: Wed, 4 Nov 2020 12:32:06 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20201104183206.GA3913864@bogus>
References: <20201102155308.142691-1-paul.kocialkowski@bootlin.com>
 <20201102155308.142691-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102155308.142691-2-paul.kocialkowski@bootlin.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Nov 2020 16:53:06 +0100, Paul Kocialkowski wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
>  1 file changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml:117:6: [warning] wrong indentation: expected 4 but found 5 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xylon,logicvc-display.example.dt.yaml: logicvc@43c00000: 'display-engine@0' does not match any of the regexes: '^gpio@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml


See https://patchwork.ozlabs.org/patch/1392340

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
