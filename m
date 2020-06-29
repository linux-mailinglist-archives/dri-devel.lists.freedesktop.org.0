Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C215020E36B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 00:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED389CB5;
	Mon, 29 Jun 2020 22:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEB089CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 22:03:00 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i25so18945845iog.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 15:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qeDnTuAisnNg9/O14eqv1V2d4bV/j01IJYJfWygBKh0=;
 b=q2BcIcQnGAITqbBY2TAbp1Hj6YtlRi/GoFVv/P6rfbht6mDMSdPKUv7kQ1erGrJa+B
 wAuC0nVkNL/BVO8QBQWttCvoqNoYFcOL6XudA4zdZXUDVsLPpuUbDBYD/HfLyBRLzzNs
 3temxEPVnFOnGt+D9GVCdpMkpKeALMfvqD5Dfnt1MK7958qlLI0wjBROjid17ygSOl4m
 ANfwQssrxKbynKVpRXb5PL5+N+xmNyJqMgut1wha3MVTXGwM10hRHXo9v+FE9S5UpRh1
 MV0CLnRWxJaEUkvRneojxGSeRsr/n6Z9TSTG0Fc+vaSfzGL2s2g09uxoE+S+lJ955D9t
 3Ttw==
X-Gm-Message-State: AOAM530ESzXrIV30dXH7X5VIfC35oQlDWCYTefjKw0sDXBkQZpD1L4ID
 +iKxXfftagf5u6JXJ6KopA==
X-Google-Smtp-Source: ABdhPJzJ5YH3Vs6Vibf5Q6Ji55Ezz3QnGARqFca/oQxAeka0ngDHcH9kK7ABYD+UNidUKik6XfPh0w==
X-Received: by 2002:a02:9041:: with SMTP id y1mr20056027jaf.143.1593468179688; 
 Mon, 29 Jun 2020 15:02:59 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id q5sm602363ilm.73.2020.06.29.15.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 15:02:59 -0700 (PDT)
Received: (nullmailer pid 3016912 invoked by uid 1000);
 Mon, 29 Jun 2020 22:02:57 -0000
Date: Mon, 29 Jun 2020 16:02:57 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: panel: Convert rocktech,
 jh057n00900 to yaml
Message-ID: <20200629220257.GA3016084@bogus>
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626005601.241022-3-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 Purism Kernel Team <kernel@puri.sm>, Martijn Braam <martijn@brixit.nl>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, linux-kernel@vger.kernel.org,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jun 2020 02:55:50 +0200, Ondrej Jirman wrote:
> Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../display/panel/rocktech,jh057n00900.txt    | 23 -------
>  .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml:  while scanning a block scalar
  in "<unicode string>", line 51, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 58, column 1
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1317299

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
