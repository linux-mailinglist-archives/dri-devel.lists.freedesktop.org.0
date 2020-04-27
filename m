Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762251BB093
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 23:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C856E06B;
	Mon, 27 Apr 2020 21:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8A6E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 21:33:32 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g14so28920011otg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=obA990z8OJleBnpKtdw+eeF7m9Ujcg/6PH3LdKUCACk=;
 b=csDCY4cffE+k1qXJ5JRe0m97pBWDkumm4YxaMtlmShD48r1ABlTYpVD7e2/QX4zXD3
 20TSF9yHg8o7KgD9LB/tJD6UfhCMdCl9W8BRaPxwwYgICLpnP/oLomv8ZMDgCXqHXYSe
 JTJJBW9u1meetzdauAYXUWZVpxy3sC0B4EtJBSxHP3hLKkAf9KGJU5Wc6Q371ftiYdZ4
 1f6gj0SPoRvBBWtC1BCeFPdboAwh3zwIDFIXysOv6QymbynhGp285msUvgeOduDPvlPj
 ZZ0if24SkavTzkeA53yRpnKfHloQikys2ONXRQ/qqayDipCKzTyprcpwsahBuMzzvEFF
 kn7g==
X-Gm-Message-State: AGi0PuYtmEW2+3yrxu1bQn2aZnoCM+qtGgkx7ICm/iWf1isWgvTYmeXo
 0spGdnkxW3IBVk7Fyyerfr4bvgE=
X-Google-Smtp-Source: APiQypKzJKtr9ww00Gp25Z/3kTPkp/Xy6KxA4pc69SBeGjzz5+ZOtZDiTRA3EvrAU8JA4MmlxGOexw==
X-Received: by 2002:a05:6830:2317:: with SMTP id
 u23mr21214818ote.203.1588023211391; 
 Mon, 27 Apr 2020 14:33:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d18sm4364822otk.63.2020.04.27.14.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:33:30 -0700 (PDT)
Received: (nullmailer pid 1330 invoked by uid 1000);
 Mon, 27 Apr 2020 21:33:29 -0000
Date: Mon, 27 Apr 2020 16:33:29 -0500
From: Rob Herring <robh@kernel.org>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: Re: [PATCH 2/3] drm/db9000: Add bindings documentation for LCD
 controller
Message-ID: <20200427213329.GA651@bogus>
References: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
 <1587975709-2092-3-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587975709-2092-3-git-send-email-gareth.williams.jx@renesas.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Vivek Unune <npcomplete13@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Apr 2020 09:21:48 +0100, Gareth Williams wrote:
> Add the DT bindings information for the Digital Blocks DB9000 LCD
> controller. Also include documentation for the Renesas RZN1 specific
> compatible string.
> 
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> ---
>  .../devicetree/bindings/display/db9000,du.yaml     | 87 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/db9000,du.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/db9000,du.example.dts:28.35-30.15: Warning (unit_address_vs_reg): /example-0/drm@53004000/port/endpoint@0: node has a unit name, but no reg or ranges property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/db9000,du.example.dt.yaml: drm@53004000: clock-names:0: 'lcd_eclk' was expected

See https://patchwork.ozlabs.org/patch/1277401

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
