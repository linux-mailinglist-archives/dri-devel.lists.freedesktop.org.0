Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB71E5419
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 04:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABBA6E15F;
	Thu, 28 May 2020 02:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056FC6E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:42:10 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id f3so28429846ioj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b/oNRFbWcA9UKdCn5+v8TysbsT9eF8fH1Ja8+nqZDmU=;
 b=arWpwGNNUoKAHm+7pUcREGCBiIgSnSO47iQjJKSHz9UkL3fPYkP9CHMOpwpIXcLdKK
 1SP3sxo+ON0XvYiWc/guToTuMOjHe+Vi1C4ua7nUJu7SBYywhoyp9Zi8s45YFv2BhRp4
 y1SApLXhXGYHTH3etWwdobimuqZZ5eCrHShrksqltm75D/O6HB2EUaDEdb46VqzOFojm
 m12retp0MBHjog8+TWOE/lzHkT1y1fwa7Z1cyGQWrTmypWjeFZULQLWjvDJ9+F+lLDY8
 btW+y7ASEPSolJO+YnR1DM+qqWAthjcXLLoRIqkltT61lt0vbOE/8h6BMXCZ1N8coPTT
 kQzQ==
X-Gm-Message-State: AOAM532DduhfzdQNaSG2V5qRKwovEt8yejdoJJ9kv3aU9mro7Zinhmf9
 Y7rBGn73rb7O+KbqklSoMg==
X-Google-Smtp-Source: ABdhPJzKlFiW8HM67DLDFC6JfQlSVeYAE3EzxuQizHFJK24jCTp1VdyCqhMig8TKRQg5EZ+n1bEodQ==
X-Received: by 2002:a05:6602:2f06:: with SMTP id
 q6mr693015iow.135.1590633729485; 
 Wed, 27 May 2020 19:42:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d12sm2665990ill.80.2020.05.27.19.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 19:42:08 -0700 (PDT)
Received: (nullmailer pid 3261346 invoked by uid 1000);
 Thu, 28 May 2020 02:42:08 -0000
Date: Wed, 27 May 2020 20:42:08 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 5/4] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-output mode
Message-ID: <20200528024208.GA3261299@bogus>
References: <20200406111543.GC4757@pendragon.ideasonboard.com>
 <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513232127.21798-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 02:21:27 +0300, Laurent Pinchart wrote:
> The DT binding support both dual-input and dual-output mode, but only
> dual-input is documented. Document dual-output mode.
> 
> Suggested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/thine,thc63lvd1024.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
