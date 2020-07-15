Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B02216C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 23:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FFC6E175;
	Wed, 15 Jul 2020 21:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDBA892B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 21:08:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so3760776ioi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ce/Bq1o7yEqQQK6FgxS9uN15O5xH+F17AS3S7KI8Vg=;
 b=Eu7R8Y8mETc5f+/d29Q57kSKeQHOC8NuxQ7lIvdf+/7+/bM5Sy0jGcE0Vqbj6fGNxd
 MBCVaoqZI0mjSlojkUIEcAv8q/40WgYfsb20+Kblq71skIGvcuIS9QEtU163x3OaW5Lm
 fPcOFHbHgsomqgGjXvQj0jKIc8Vph3fEi8CvWHJyHfFdTZ+kyofZJrp7xYExr1kZ3/oJ
 Im1Wdb3RGOJkxCWx2KnPZ/vysx9tl5mLstABX+oFkHnIQ/vRCzxEc0Vz/yq8pDeuAN9h
 nvIzmkqHhLA80epjh0VmZSdlu3GEi57UkWNjHe3yfF5p58C4ZTqHp2ZfNkk54rzA4Pk0
 L1TA==
X-Gm-Message-State: AOAM532J3REi+z/7cjcVJxl7aA20Tm1kb7+uM2ynAKQSqiFwojQ8AgTL
 0a0fhjm/hWtsBpzF39fCJw==
X-Google-Smtp-Source: ABdhPJwM+3L0XK9qzuogwnohPengqtYGvTuWHpQABVodDZphoyDXMBLQgcx/tGvu3sZZW/bNk2odhg==
X-Received: by 2002:a02:c785:: with SMTP id n5mr1431788jao.75.1594847291926;
 Wed, 15 Jul 2020 14:08:11 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i11sm1817513iow.19.2020.07.15.14.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 14:08:11 -0700 (PDT)
Received: (nullmailer pid 818449 invoked by uid 1000);
 Wed, 15 Jul 2020 21:08:10 -0000
Date: Wed, 15 Jul 2020 15:08:10 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] dt-binding: display: Allow a single port node on
 rocktech, jh057n00900
Message-ID: <20200715210810.GA818399@bogus>
References: <20200703114717.2140832-1-megous@megous.com>
 <20200703114717.2140832-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703114717.2140832-3-megous@megous.com>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Jul 2020 13:47:17 +0200, Ondrej Jirman wrote:
> The display has one port. Allow it in the binding.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
