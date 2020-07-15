Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8F2216C8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 23:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EAB6E054;
	Wed, 15 Jul 2020 21:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3E6E054
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 21:08:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c16so3760183ioi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KjCMCoW7QDdmcFgzIcem7O98IMC/DL0hnlshYNlIU/Q=;
 b=Ub4yzoNbU3GOdJAUrvmFXTHDfByIFAKR8Q512qN+R8owoTIqlB1KyTf0l9f1vsvO4J
 rz0cPP2qVaPAe0ozxa9Dx6MUs26pf72tCJZaS8kBbHXgrGLeA0QWrcLvmXKXyGzpyqgK
 l2jFD2J+aCqnE8qWffwvaMpcBJhcSIna/uugInEf2iBrqo38cl+bF+HRiaELVeXwM2UO
 YHgJ64Sx2xtlmAEF85UE9qTM+lPcJ20q3RN/ZnFb6mWVNJavfK1ooSCpi7ujc8RyqLJM
 KXER5TTBuzjx9vglHh79YTwdzk02s59oww497N0dY9ZkNm2eoZjEJvlC+53m+AxQPFvq
 Xl4Q==
X-Gm-Message-State: AOAM532mv2B0SIv3kfUkZkbRzlbZVKqIGU164p8sGcyy/FNtpfK740n/
 CB9J06z7E1kIySC7dnbYGQ==
X-Google-Smtp-Source: ABdhPJzEQjcFBWmWE376+W3/jvXjGaojoc/mmDz/tY6q3QXK03YBPeISo9pECab3cFblZ38C0GtHEw==
X-Received: by 2002:a02:9f8e:: with SMTP id a14mr1443823jam.95.1594847279881; 
 Wed, 15 Jul 2020 14:07:59 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u5sm1663421ili.33.2020.07.15.14.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 14:07:59 -0700 (PDT)
Received: (nullmailer pid 818071 invoked by uid 1000);
 Wed, 15 Jul 2020 21:07:58 -0000
Date: Wed, 15 Jul 2020 15:07:58 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Fix example in nwl-dsi.yaml
Message-ID: <20200715210758.GA818016@bogus>
References: <20200703114717.2140832-1-megous@megous.com>
 <20200703114717.2140832-2-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703114717.2140832-2-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Jul 2020 13:47:16 +0200, Ondrej Jirman wrote:
> The example is now validated against rocktech,jh057n00900 schema
> that was ported to yaml, and didn't validate with:
> 
> - '#address-cells', '#size-cells', 'port@0' do not match any of
>   the regexes: 'pinctrl-[0-9]+'
> - 'vcc-supply' is a required property
> - 'iovcc-supply' is a required property
> - 'reset-gpios' is a required property
> 
> Fix it.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/bridge/nwl-dsi.yaml      | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
