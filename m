Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8C197FF9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 17:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223D6E2A5;
	Mon, 30 Mar 2020 15:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123296E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:42:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n10so4174527iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XToUOXTBi4v+G+zH1meistMeAK6/7kaJVHzaJ0IgHkE=;
 b=az5VQGxHnSonDsZBFhKsgM4c6uCFmvfKPJ/iu4Drb1m0H34M/tuzq05Ks4WS7QTixI
 yKF5iA1ZD46/yEGyH4f5yGF3VIO7eIBKBTAeTYJfc+EiaNU7QjgLsqMlmjbl0Nu2EefT
 swPH6t/sJbyXnc7To/e77MYE4U3fpac62ALaQSo+Ob/QVcDZwOG7YqgNfv8Ax5dqFQki
 fYkw6uGJXAd5ASUyESPOWfcS6XpzqQ5Iw6ZGMxOyFpNWP9x8mFgwRXhJHw3r7qM4fKIU
 DnmCbjw/KuCtj/71aEGLcqEfY0ZCtp5bNEXiJy24eorDteW11X6GE3KzQN4fs+Ank+zB
 XAcQ==
X-Gm-Message-State: ANhLgQ0MlETyJTiC2wecm/ET6BVx4kpT4fhrTJ+WWXmFMacSE+JHWG5A
 HLGz+4C2k1b1sgEY2Dievg==
X-Google-Smtp-Source: ADFU+vuo2GMSlIScfz8VpFQrF31IFo0FS6MvSyPlgMZwQJUJOQOv+ANaUZdUOCWSeh/xQWl4VpTXlQ==
X-Received: by 2002:a02:641:: with SMTP id 62mr11747164jav.79.1585582926290;
 Mon, 30 Mar 2020 08:42:06 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c12sm5004502ila.31.2020.03.30.08.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 08:42:05 -0700 (PDT)
Received: (nullmailer pid 24611 invoked by uid 1000);
 Mon, 30 Mar 2020 15:42:02 -0000
Date: Mon, 30 Mar 2020 09:42:02 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic,lcd.txt to
 ingenic,lcd.yaml
Message-ID: <20200330154202.GA23233@bogus>
References: <cover.1585503354.git.hns@goldelico.com>
 <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>,
 Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 mips-creator-ci20-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 29 Mar 2020 19:35:47 +0200, "H. Nikolaus Schaller" wrote:
> and add compatible: jz4780-lcd, including an example how to
> configure both lcd controllers.
> 
> Also fix the clock names and examples.
> 
> Based on work by Paul Cercueil <paul@crapouillou.net> and
> Sam Ravnborg <sam@ravnborg.org>
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic,lcd.txt          |  45 ------
>  .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic,lcd.example.dt.yaml: lcd-controller@13050000: clocks: [[4294967295, 9]] is too short

See https://patchwork.ozlabs.org/patch/1263508

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
