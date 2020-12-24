Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851222E2823
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 18:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0178F898EA;
	Thu, 24 Dec 2020 17:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B65F898EA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 17:01:50 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q205so2813848oig.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 09:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=legzg8I2MAkLelYcw+H6Zk5lbIAyOngzrLsiKEK6Lrw=;
 b=pkTel3NeCdU/g+VN4rD6h948dxzBw4861iZsD4XJH383rhCRpuEM+UINhu+oh2YNpy
 EEBSQncDmWhrOkGqw/lunW7hfQyWtoWPO0uufV/eApH7BOYGsAtFxQxGEYzegQTyeAnf
 XtaPPhJTRB5xW2Iz1ngoszDpD2NnER/3joI5WsVZKcz7jUod7QdeH8BsMuKHn8iZdYV0
 FIGXCdwf9TYGwqmOv8BxVDfKM2wCJU6K8+JfN5hTgdruQxCeT+KdXycmO04LoVw3aSu8
 ag+dvw625waNZfNXwyETswAm3vbWe+zYiy+DBeNEbKNp5lPTcqzdCgcKvJxW8wobG0aA
 zwcw==
X-Gm-Message-State: AOAM532owwGboPi+co+tE5DMuTXqVVNRyqAAme6cExACCPvw0fN9C5AH
 cdNF82Ce3bh0wAINhEnzzA==
X-Google-Smtp-Source: ABdhPJz7ArG+puFJXp7jzObW8XbluImuBQTdVYc5NpAO99mYo01wCZwRnNvPbt+g5MmWu0359C5/Sw==
X-Received: by 2002:aca:b657:: with SMTP id g84mr3496457oif.86.1608829309269; 
 Thu, 24 Dec 2020 09:01:49 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c12sm3939360ots.7.2020.12.24.09.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 09:01:48 -0800 (PST)
Received: (nullmailer pid 2966450 invoked by uid 1000);
 Thu, 24 Dec 2020 17:01:45 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
In-Reply-To: <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Date: Thu, 24 Dec 2020 10:01:45 -0700
Message-Id: <1608829305.375557.2966449.nullmailer@robh.at.kernel.org>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Dec 2020 22:29:44 +0100, Paul Kocialkowski wrote:
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

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xylon,logicvc-display.example.dt.yaml: logicvc@43c00000: 'display@0' does not match any of the regexes: '^gpio@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

See https://patchwork.ozlabs.org/patch/1420307

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
